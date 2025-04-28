Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB35A9FA54
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB2910E03C;
	Mon, 28 Apr 2025 20:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="AKXA2Ok2";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aF19TYW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EE710E03C;
 Mon, 28 Apr 2025 20:16:55 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SJ23UB016725;
 Mon, 28 Apr 2025 20:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=VcwUpRR1nhUj/Ijs4k
 kR5yTejTXzrDqciUVjE1nezb8=; b=AKXA2Ok2+6IGepth0vuzioQ8FEJ6T2yJor
 Z9xQqc1H7nmurnTAfbGU8mqWdJdyNANBFKAT+Nhgd3e17TFS4OWm3w8KZeuHUipC
 MKXLHpgWnXsrI3UdSNgbkRfJDRmhZKGD9qmOxXr+eYMEwx4b3Fb6YaFvROGIsvnR
 ZmpfAKVwr6YWTcX4bP2h9SBlpuKQ4w8BpyNaqohbqByZ10RDOIzoz/i1fcJmdjUj
 2Ls6ACeeDP6yEUI8XBXSfyp/bp6SfopgKffm6XtvRf3I368DlsSPaZI7YXgyx2AV
 s3/trkTDCRpw/L3q8d66m4REH82OJu+WVWMTI+NLaPYZkY5cbh7w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46affpg53f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 20:16:21 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SINS6U001321; Mon, 28 Apr 2025 20:16:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 468nx8wka1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 20:16:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BspyhDT2sNyTLSh733y48f/CTWCYXMruqWp/uafgtbJ5hzeqRj6ilcf5+tIleh85PkXxYwm5nbMoRBt9FxQp2ksZC8ziMFf/q94IF5Gl7vbBJ7srkCc2Ba+HkJSMOsW9qge41zYbQoguV6QLoaWCikg0QNrWJ6MsxphyKI5slaiplHSu5/Y07P0Z/KpgJv9LL1ihHI7O9RejOHqRx5S/mp/1XSTR0rGDQdFZ8r/3PjflylmC4U8tp8pPwMnq+4+lGgEvA06cOwOfq+BTcKdHHp9gwJ2e0aM97XhUNZ9RJoNyVSFBrwh9MNf2T4jZv+o0S8t9JGxyaVkfb6CxUMwUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcwUpRR1nhUj/Ijs4kkR5yTejTXzrDqciUVjE1nezb8=;
 b=VMX/8tz/kbCwWIY1GROMSi28fCOdFysAkNz1O9WR8Kwi6ORBxMzRoSyqfLJWYV6XBQS7Yjr+n64zXGAx2YPYUshgBamsps8q/XPWRmk5M7gKABtFDl4Vqry5FaZ6a2HGfYpDs9+CScM1AYFX+yqrzUXs1jFKpWZpbvWVS1RXKZOssziDWazgEA4MehPH9AfWo/gHefuhtFG921BxvITj6Cvdq/R4h05AvEMeP9fzdq1KPLyqPrOuJOwENrAs/bGIdNZmxZzddOqQAGwKu8JoU090jpnNJqNHoKQhMLU0GCWPFnCs12VuP3FavvwTfTvY33ZMSKu+opcSLpK81b1B7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcwUpRR1nhUj/Ijs4kkR5yTejTXzrDqciUVjE1nezb8=;
 b=aF19TYW7BRfg5IUzt2ONXtjhuB/ALtYj1AoWkiAy+GwKqC2jw6x67TesW5VvJWGuDkBrNzbnEo83b9e6sMkLez+X9EB096gGV/+bjLU8EXwRA0Y28WkRAsCHHvOWA9p1wbDYTRAtqBM8hEgRxjQvSjbnzX0aSaIdgQLPLMSjn6w=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS4PPF109C7C399.namprd10.prod.outlook.com (2603:10b6:f:fc00::d0a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Mon, 28 Apr
 2025 20:16:15 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 20:16:15 +0000
Date: Mon, 28 Apr 2025 21:16:13 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 07/11] mm: remove VM_PAT
Message-ID: <3c24daa4-5013-417c-ba95-df9dddab0113@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-8-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425081715.1341199-8-david@redhat.com>
X-ClientProxiedBy: LO0P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS4PPF109C7C399:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e3db9a-8fc1-4174-64a4-08dd86918779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0VRCygbqg7+iN2f3Wc3+6eWOLtIfqUg3Xugi37RpFPBfdRUQD9iCLYGouxxc?=
 =?us-ascii?Q?t8WJDy+X48xVVCGqvnhUtZlnHUeP7Sit/mj+ihaGz3kTMMVWaFYqKxwluzcx?=
 =?us-ascii?Q?L/Cyn9S1mWEFVXlXZ2wMquQJYiMvurltfE6m0tYhwHayUT6rUXsvYSOcj1bB?=
 =?us-ascii?Q?YIPwTR6OYA8YLt4Urv2tDJtk72IqJ2MqLUBQYFFbkXVQN8TC0YwO3vjoAWbU?=
 =?us-ascii?Q?6FIkF3BiV+k8uzv+QUBF6iED/XjLNAcfOiiiSNQGt5X9rzuCK5HF+Lb6kyTI?=
 =?us-ascii?Q?03lNZvLhlpa7ECYVe4t8dTG8Oi6Jk54pyrrlebD8PdOGAycKvjPy6vRZU9Kc?=
 =?us-ascii?Q?UeLWAF4sQPrWR4JseRXelzWvZifNkcqMSwPH91oCXX3VoYJ/j+QSuezuak0U?=
 =?us-ascii?Q?pGxQ46XzLYbKTkYgYPBwRfak2K5PUYlSabKRBF5rPtpNFGYNMfGfFd1dUlSE?=
 =?us-ascii?Q?7WWmGpMgTA6yLuqLpJ7WELgtVd0X1oRI9vx+oBPYjWS6aJ07iYdb/lst9kq1?=
 =?us-ascii?Q?L4LRt55hKUv2bgk8jLl3m1CGuLSt74dHYiO06D5e5rXY7uIs9EjfeQGpwNiR?=
 =?us-ascii?Q?1qNGphq+ylZAAg83w3ob+cbif9Qk35vDEHH7rtWtBvkfScfvIz8ThpNvS5Vx?=
 =?us-ascii?Q?7fePZXg20YQBXdPREz5K9ZMjAL13XoHHPaaK+FyR69tJJkfGwcSuiwV9hEEz?=
 =?us-ascii?Q?bPwYuI4y2cnC/YAULlC9zrYTxfR25ujXTt4bHz98uYMuyFlyNVtwkzoKraTk?=
 =?us-ascii?Q?OYsfmrmgVkPOMbBrlvjQOIIN7fFYTMxjHfbhWP7Xd4lu337zRdfTTEueTqPF?=
 =?us-ascii?Q?XTZLodBObpOKTNzi9a0TurtZN16xA98UidUDRObEItpVLp0RtRSwOns2inp7?=
 =?us-ascii?Q?dc274Cgg66uLl6pMJmSOk58nC23QEob79poRGT19uh5hlQ0BQKc5xxYkgmsg?=
 =?us-ascii?Q?y6BSHqkLB3Avc9d0NMl0SbiyEX9g2e/Ieql1k71Ek9rjoXX9fhrUhSzc70BS?=
 =?us-ascii?Q?u82vkgq2R2BuDbeGAWUKid0sjZfpiLdE4GoVt/wW+Huv8LZ84HONa7EwaJcc?=
 =?us-ascii?Q?ZRzH5kPBjab9NnEleLJCEOxq1MnYPiEBF12BbF1TYWwA88+ZMJwTa0z+DQDC?=
 =?us-ascii?Q?+2hTLbvwembBE5yZSSkUWISHEA+w8a1FeIo+Q7zQp8LfF61u5RgYYNDbAe7C?=
 =?us-ascii?Q?swbVPoIadJmaaZpmIpExUUQ7ttWlKp0Hgq2Nc091Fhdi8ihsG2ECb4R38RX5?=
 =?us-ascii?Q?BSntmRJpTDt7ve5Cb0s63Hz8VxQxrDIe8I+rPX4PY0uRdDwdDoh5MnJJQV0O?=
 =?us-ascii?Q?+eZxw5Y6IrvBz6BVjrq8Dw0LBB3zpj6ci/uNA9iK3jesnvhzdwo0a844B6qu?=
 =?us-ascii?Q?zEaXwJZon1Pv8rhVKF1xuwk4nc0dja1C9+YJUaOkWjTOBI6UVvNzhX3dqBNo?=
 =?us-ascii?Q?+2yYxhizieQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kaAYun1rQlegzvV8E2vIN4iMAp7stKVDbhr0Twq2zNerNssMgS2+VbLPW04E?=
 =?us-ascii?Q?oLa9GXJi4lVmPE02k6Qu9BcNH7s8b/ERdl7evz9lRcfl7bb+HwEEkcK7llNx?=
 =?us-ascii?Q?1QjRiA10354VwSG0LteWL094zpnW4iojTX2JsQYrpMceuQ8LKzQ91QuJ77tZ?=
 =?us-ascii?Q?cVVZkGXga8gi5anwvZzFSIJ6k41G6Ttc67mN8w6wzOmgr3hLaVHHhBcckLKJ?=
 =?us-ascii?Q?uxfWiKKdNDW6E/6ngf9DeQWSZyGdgU6ew2u5JoSfNX6KeDzSLS6QcVIwPVdb?=
 =?us-ascii?Q?zzQK3ieLbN8sto94tD10ND/0p0eneIzg8J7mlCzH19I8KDD8/3Pg2x/7FtwF?=
 =?us-ascii?Q?OEUK2oDkKqGmicrj2Yy6r22scx441WH1zD7AmIv4yzCe+zojfzuW5YFUM894?=
 =?us-ascii?Q?BTprI1ONEw3mTQT2Z9GcPH76cy3MI5lq6rI56AHL6KEuJRgBrCuJT943GJqa?=
 =?us-ascii?Q?CmHu/MzhfkLUDOfFjTK58Qoacgx9p83NFBuoNNCEi+vJxdPL+YGKNd2Ir3fj?=
 =?us-ascii?Q?fyNOe2prBAIsnlHprMkGiYzc2KmPua7xnxhCpXpA2Acx85s6TndWy3FeJf3s?=
 =?us-ascii?Q?BgSMnfCv4oKRR9AYaj438cEYx0+vpI+OOH6f9ZlPz/aS/xKMhidldj7MTtJk?=
 =?us-ascii?Q?FItfXf9b/xn6n3ecCmH9X+xtj1+2kbGRW+jXP4Wz9QtBQ8ZOI8qCoD3Nhj2A?=
 =?us-ascii?Q?MNF0k4HHatXpAyB+6R4LpNyb3c8qANX9OWnYkuYtEAN6Jq4c/gJcXnS93sZ8?=
 =?us-ascii?Q?plRLHuqW3Lq8rJVYWlJueK1JRMu07RHTHKFx6gULTnqnnBVx4o+pKLjX0MpC?=
 =?us-ascii?Q?V6EIOuYq9RivJ5+1rP9BpNv8ILzxUk1trTTez6fMIrMNCvwi8GgHpMbsyzX6?=
 =?us-ascii?Q?vAIqvnf02GVz8+KzhcmQ+fp9I+7Z6pRxznKbSNYzOjDxvdWSdMCtnZCOFkYx?=
 =?us-ascii?Q?cxLpFyO6fNUy+mbDCuaLmcEVVCZXhPr2fgvrP59UPtuyWsS72IxqhmRb9G5x?=
 =?us-ascii?Q?Oaw5inYj0/84TP1D5tlGJgnLKqsbY35g+lVqXwGT0xttZOWshf7aQ1JrtNth?=
 =?us-ascii?Q?Gf64w+nCX9oW7gQcV8zsJ6HS12buT6KUxdl1utJWOOsBVkbyICCxSlifr/bg?=
 =?us-ascii?Q?+Q2kLYKt9Rt1RAPJR3/YG8rT/K+xTDfseq6bzLoVe7JeLKNF4hlgPAoOPaVl?=
 =?us-ascii?Q?peMQ/Xd5oDApVUv0m1pNfEG397mzHYP3Dpt19fA47Tb7IpC+VSbWx+HGlauV?=
 =?us-ascii?Q?FJfC+OVYnYre+towmEqXW29FrNMqgdmY/keGQ1BNkoYE6teI+wgda666G+mZ?=
 =?us-ascii?Q?62Yfk4ac9PfOsRIVgK94GyrBkL7HJpVVKr0Xw7rmYdJ21ObCmg58Y949rib3?=
 =?us-ascii?Q?uA+QqPARgklmq5u3uKMGvQTFdY6ay3sJxb/5LwUTdeU9GfyH/xfFyghjFIVG?=
 =?us-ascii?Q?tHF50pTj2FyI1+/QWNHXh9A3b31MXDYEklJfL6nyTIgeRCf0RPd5MVZLHUq6?=
 =?us-ascii?Q?2RgsygjwTyrMX/48EpOlh7kRL2kFYmnMvL/gQUEIrtrXZzu2qcEJ5vI+t2vg?=
 =?us-ascii?Q?LVlMyoBTtEnS+rdF9D+P6Xt77w43K5tI9mAYBmLCYTj77jC1EMVqfmVU4VVJ?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 08Pwj6pWyXDsqE/UfJlWpHdm/Im0HgisSlnUK5yzWSCztDeQAEa44X2qbcvEQPXOjQ2YGlJvVy4BuhFi3WliJeE03ET46SaPCGFuSrN/8aztqcGsySQoXU4LpMbmFJi6tjDOMW04dO+bDXZerdlZfcYBZ4acGEHv+G2YayPABjMzbbMtLiU1orbyz8iVdTl8XDvDsqksToWA17Jizl5ivjO4ocBdi3HBzQsOxF0RSslcuAtEyKbRRcPbmkpbYgy1UFzvznYdn1xVAoqNbfhcKRHyLKCFYpOlSshpxzhRT/yfnEw6k5GFdnbQwN1GvC+z9LI3BrcCE3DGQBN03zbO9sfHMt3OayaAwvDDySqJU+Z4qbCIuSx5z/SfF9tVZzHqQiVUejFpBFlbbjGINe2f8eVIq09ARvK8j4ak3GqYq8bC6g/DOLsHnYxvqb8EOBwK7QjAhk/fmbRtmgcxYoayd9SAnOBb3Hqcu59SpnVA0gVQvmSvTRCLFkJNevFsBhkVJWC5uFciNZBQb+NMFv9dehLWfwa45+Sk6dRJcFQmTBVI2ZPkX7QmbmjoemZJqUzWiM98WMN5qHH5Ri//EQYshEvkJzP/IM2/WmKesUvBdX4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e3db9a-8fc1-4174-64a4-08dd86918779
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 20:16:15.8653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayLwpmoyrG1MJhFZ3MaxxL6ZMsWknlDpVScjgJWiesXaDAi+HgQrjluY5I5nSkFsvvcfsz6Uy6h7bMlXCBPhbFXL7t/GnOxgTkhFyPO+FcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF109C7C399
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504280163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE2MyBTYWx0ZWRfXyiatdjvacsko
 lITcvy65n7vcVLP4lGM+OMp1FqRbQ0pwV04qhCDjlXhB4ZPjZGa9lNEE1XYxYjUTqVy2g8xKGYA
 K+hhBqs8YpA7BywIMWMRSt1zMydA/emUE0jtV4S+UBMw5l+3T1M34AKteQinbHLPh1AShItnOTs
 WhEj52vRUq+7+G85d4BdGVFDM/3fJlyLAf4DATOlCFAdZ5yEp1aV1A429Y33L/Jl0fewDX5PMWp
 xEPLu4dA/sXvVogoDGmjopypg2XZ2ygTyD3awVq+Y+ideppLLHMy+EL2Tj0df/qMKkRIz2ji0Kq
 X8DtViothWFENQRHDx4c0HhcJFWxtGM3Azn6fPA7o182+eEuV2BkkUW+zPGHqZrE+XgYAGs5hmf
 4k8vg1Ii
X-Proofpoint-ORIG-GUID: SEbOsfZC9nrfWBGylkutQudyTtMen_lF
X-Proofpoint-GUID: SEbOsfZC9nrfWBGylkutQudyTtMen_lF
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 25, 2025 at 10:17:11AM +0200, David Hildenbrand wrote:
> It's unused, so let's remove it.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

I have only <3 for this patch :) byyyyeee VM_PAT!

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  include/linux/mm.h             | 4 +---
>  include/trace/events/mmflags.h | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 9b701cfbef223..a205020e2a58b 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -357,9 +357,7 @@ extern unsigned int kobjsize(const void *objp);
>  # define VM_SHADOW_STACK	VM_NONE
>  #endif
>
> -#if defined(CONFIG_X86)
> -# define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
> -#elif defined(CONFIG_PPC64)
> +#if defined(CONFIG_PPC64)
>  # define VM_SAO		VM_ARCH_1	/* Strong Access Ordering (powerpc) */
>  #elif defined(CONFIG_PARISC)
>  # define VM_GROWSUP	VM_ARCH_1
> diff --git a/include/trace/events/mmflags.h b/include/trace/events/mmflags.h
> index 15aae955a10bf..aa441f593e9a6 100644
> --- a/include/trace/events/mmflags.h
> +++ b/include/trace/events/mmflags.h
> @@ -172,9 +172,7 @@ IF_HAVE_PG_ARCH_3(arch_3)
>  	__def_pageflag_names						\
>  	) : "none"
>
> -#if defined(CONFIG_X86)
> -#define __VM_ARCH_SPECIFIC_1 {VM_PAT,     "pat"           }
> -#elif defined(CONFIG_PPC64)
> +#if defined(CONFIG_PPC64)
>  #define __VM_ARCH_SPECIFIC_1 {VM_SAO,     "sao"           }
>  #elif defined(CONFIG_PARISC)
>  #define __VM_ARCH_SPECIFIC_1 {VM_GROWSUP,	"growsup"	}
> --
> 2.49.0
>
