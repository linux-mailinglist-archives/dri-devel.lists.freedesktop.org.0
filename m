Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65601A9F64A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBF310E613;
	Mon, 28 Apr 2025 16:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="naBwmVhD";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c6asRttn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D8710E205;
 Mon, 28 Apr 2025 16:55:25 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SGfvPQ020178;
 Mon, 28 Apr 2025 16:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=dBBvzYsUzMJqNukQCN
 sicaBd/ALZja0fSyFJllfCmfc=; b=naBwmVhDxrML6FYNq0xpPGFYSL471TEuoX
 bJZlnAMJPo00V2terhMcJpd5TbRNg14NX4Epi9aQpZjfsBCbk1xGiXQKGqu4xEIZ
 uilg/LiaJv+jKQjCYL78UMGmj8Dg/np1PG8PRQKsvJjci0axncOtTs1IQXE6LBTb
 UYE8j76yNbdf7XdoqYPqYbGEDkofb294rpxMob51qMT8CnWsa/ElOtuFzTLNxb7q
 M5P23IGf8nIDeXn8ozfpk5m75hZoWicapRTZYiECJpOeF5SAaxUr/646OYps6Q6T
 QEEPW7utlB1cjjoOETs2fw9HRaGHTt7oRhTNLxIG9zaC2EZl4PYw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46adbkg2eq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 16:54:56 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SGqGm0011290; Mon, 28 Apr 2025 16:54:55 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 468nx96vkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 16:54:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFB/Cmib3l1FTVm9bG4nsSOByoSf1aWSucGSerYhX/zs94rCMDcyUHWMV4/BjDRC1iqQkWaeP6JSgMe34WbIEWn6+rKXiZztbwQFscXQ5bPTwTiR69jFyVl0sVPkAmONZkuRderjQjcXeK7M0F64v61UrDXgcTXzdSdh9wDSQawT9VyyfD24Uzv+8oVYkba3VqrefjWw6nuHdoPViRlfHJuYTPjsDpeUFEe3PusuLE9SdUzJVVWilV+31lQuPBA3IRHF3jFqjVnuencBJGFuA+FQoy8CkIAmtoE+OgCtDGGkjQ3dBnmR/9C4vs9GwBWmVZ5m9qrVgpDtkQTCjj+FZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBBvzYsUzMJqNukQCNsicaBd/ALZja0fSyFJllfCmfc=;
 b=JQ+EzUQif0H+02nIM85SgXtN1bIt0WGCN0ZzvpNyNz97WfOIYUYJjZeop8yrnKdeHAhlY+D/0pPTL270znFzKQ95RXLfPaS3b/1JiOHKNjTuls4vsE3CT3yc5ZUpNyemBujH6ZLe//b9AORdUJpqKfQmEH0qszEUzkvVv96AikNt/Vo8StUGiocCkViHORzocVN5D96anhaM9jxpWaGbYA0mrXISOWAWqNF0Ad6OdIBKF65QrmE+gUGNEKu1xkrYC8oEsnOXwSUV1T3szeP/dZ1HEPTwe5cwErXZ9WscHs2roAkQVs/xFzrxRFdvXih1oleFv4p3f4hz8Vb1p/gMrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBBvzYsUzMJqNukQCNsicaBd/ALZja0fSyFJllfCmfc=;
 b=c6asRttnGbeoZ/n2AAqId2wO4j9LbAgvHZOyUlXjBunbpxayhlcZ+YAK18/HnaoLaE5Gd7tlOQYJ+fxY3itmw7qlMSvXRovMibGp1QqABIZNHR8F0DVz0f82y3X+2HMZMUfWSA91dIhj9wDy23fEQb/T+ld74MsHv0G4q+0dSc0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB7156.namprd10.prod.outlook.com (2603:10b6:8:e0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.30; Mon, 28 Apr 2025 16:54:52 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 16:54:52 +0000
Date: Mon, 28 Apr 2025 17:54:49 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
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
 Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH v1 04/11] mm/memremap: convert to pfnmap_track() +
 pfnmap_untrack()
Message-ID: <173b5150-fb34-4216-92d4-01fedbc76d21@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-5-david@redhat.com>
 <aAvp6umyw1AF2DbN@x1.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAvp6umyw1AF2DbN@x1.local>
X-ClientProxiedBy: LO4P265CA0172.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef4e22b-fde4-4c9f-7cb6-08dd8675653b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yJ9nrb68sSopDhtielkDAj4y671rpeKrb+/hIrdU//Um/Vg69cmhipQABQFi?=
 =?us-ascii?Q?Xn7uXgxJrmEYAz7dr8bzgz7tYiL/6F4Pi5oZd9ZGnL0wxmr2x6R3sSAGKHY4?=
 =?us-ascii?Q?YvKpwIUEHNVdqpVAavM4NDmyVoBQf7LQuRdk5IgnLU0eIWdULUsIn5TH8Koc?=
 =?us-ascii?Q?kawoQKN9aURTesCsbrcTmmz+or+pdH/axSjo0lzTjNnaMjYlQ0I1tuaBnnfp?=
 =?us-ascii?Q?dfQ+mD4FQgKJjEmaeRZvxsDhDL8NNrGMNXdnM/n+w+QX+Ztmfswx0zUZUxCP?=
 =?us-ascii?Q?KDwRMuAKsVWXjPnqGRBUID5N10+AAkiKhzUGkGnbpXSKEoLA9EAezHCyeljj?=
 =?us-ascii?Q?Ak1ouPPgf8kcNny4MYWnwEpZ41fWBt6aIuc9fHVZPjftGsGzrhN+3XzuFJ7E?=
 =?us-ascii?Q?wbuhuTD4h4o+uSmdxj+ojFNF/KPDMicy4MZqQKm92tQlTwh5dRYMp+d3ZL4p?=
 =?us-ascii?Q?8Jc8VThsZKOek485zPNtRSKackQvCMOd4K6IiVaW0RSy8WBQj3QQ0GTjweRm?=
 =?us-ascii?Q?avgCFCobs7jVIy8WX9RfHU405S8PdW+PDlfZuIzYzgkqrlaCEk5+Bkpn9eVH?=
 =?us-ascii?Q?IwFy59aHy2wuka/5822gNKiNvyDAAqrHcKqJ0B+3M5k/J3xuUGiGT8NMOquz?=
 =?us-ascii?Q?/eN3NtPCVfGJ6ckGzvUuKh4cV46OmdJtM+a9M5h41QfZuQPMwSC+wnTfE9Oc?=
 =?us-ascii?Q?9ZCi7/i7hgmDh4LeKyuug7Ih4DnyAODv69KFR44AvCMofTOpel0m7o0TcTUu?=
 =?us-ascii?Q?n7kOAXBPmOSru2FMte8nOltSGOorOix0caGcBAEoZ2rb9/SflDzHme69qeb5?=
 =?us-ascii?Q?K2BArik1QwqaJogp/ia8f+8XhVZnv+qKWAerrXL57Wm5EzFZvjqpmpvf32vf?=
 =?us-ascii?Q?259Y77fIZVxCEyqsLCQ+xtY+2n2mkYKor0VxVKvSNr8pW8K6frM/3STmoaAm?=
 =?us-ascii?Q?EkBuuGXLSNIW3BBtE1HrzRK7lIpbfwoIN4ft73Ypfuz4JG3WFQLFpNiobPF7?=
 =?us-ascii?Q?zr3g+g2EbU9BFqiv7+fZ8GIdFZdyLsxHnECCKOvdP2ObrUNe0URDte+c5f39?=
 =?us-ascii?Q?zBRGXbB0R8Q6otQJ25U+XquTEwkbGI+/L+7QyIFArMHp5XJ7CcR5JANLAxLq?=
 =?us-ascii?Q?MHpnQUBvrVygD9psRVZn3SXYf80jOl+uhBouid3ztQMy1OlDxVyU7YABc/oX?=
 =?us-ascii?Q?3cjZP2BGQG135zhKNUSDK+LlXyceFu6OqNRuIA+KSz0YR92TxcJJVSQvz9nb?=
 =?us-ascii?Q?TJK64HGhtg15O4qNgGZIS9g3JLFvKpRV2vQLPBHxV22bijmhsTWyFhswxNjx?=
 =?us-ascii?Q?eBpC3LNlLQZojluGiyRI7VrYBhbe+KlmDJKm8bUXCsQU8PVh1IHLXtDf0ERl?=
 =?us-ascii?Q?5uzY+qP2rDV2E9USQH/VWnE52QDup2YTZKJPU0Geh+z5abk91giFnrNLy9zC?=
 =?us-ascii?Q?6Hh3rGp46Rs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q5C7ZzkgbkdXbyXcL7KmfV9ibjP2gMqA1BwHFUf0a9yeXcx/U2OcvmRwrl+r?=
 =?us-ascii?Q?zDvaHQa9FhoooAZIs0ZhZ9wvN83s5SqmUEwB6u1w+2MA9Jzgg78AgR8udZd+?=
 =?us-ascii?Q?b8J+FM4xrKwGFnLHKYkqH6GOMHTeh0WUK6Iw/ji+ew6f7y/oSTZnNc7PwD22?=
 =?us-ascii?Q?RCFftXVqcm1yxYOSVb8fJ/jyVPMTJBsWG8bE3mXYADqJgfpD/mmRSmXpdnW1?=
 =?us-ascii?Q?PWr3IR/CJshx2Ol6NwBnswwgFbPYaiHTilfHJYpkzNNzcrlxu9tcAW0zQgAL?=
 =?us-ascii?Q?UOZYvQkU9ymsEWb5HxH+l1ImA28xyc3aUswtjPnfiCBWmn9gooKbWzyOuVfn?=
 =?us-ascii?Q?F3MQ+7LHYHRU7COaRIE24Ee3sE15TbtgybzZIzP0ZfPF6nG3Jz5sHMrM7VRS?=
 =?us-ascii?Q?i2XTsA1glLEHL12Pgju+y9T1NurNQsEQkOn6wL0hzAnSE7L8OoTTuZto1JGH?=
 =?us-ascii?Q?x1UtjbOc0HMsq12xvxcy/kIYoHGw33dPyfqLhvNj35DaYZP1PON6l4bg5wnY?=
 =?us-ascii?Q?IbZuma7Bf+P1W+c59ao1J9AJwGpBRCIJHopXvnATm1MbHRrIyUxTHYPTnT3/?=
 =?us-ascii?Q?Ip8hOoxOUYCClUHgMaE5HZKO1qv8nNcz5QRvIG7TTpHFKY6cVS+eIYikTSNS?=
 =?us-ascii?Q?hS7uy89CBxdWt39zwME7WEO+VIsfOQYLy5qsUIqG33dFCKPo4JT9qFuXkUPs?=
 =?us-ascii?Q?EnfM4OBfL6t1fbm2P8eiACqTP7g0w+o1XQGns06fNh9FwkC3MAspTqW7UQde?=
 =?us-ascii?Q?y45OzCiES9wB7EHnXzP/tFvq7hfAQdtaLdSLK8mZnBnnR39vI2zv42Gt1c1m?=
 =?us-ascii?Q?sgxMv89J4zDnGzrPIbw3VTWo6uJ09Binv0Q0wJhmHHC+bXsg94hS7PzwNQIj?=
 =?us-ascii?Q?VGoEWp08ZqDKaboQ8PdYcRTXGxP1kR1LncFuFy1W2eBZezrGru8jdpT6yQ4x?=
 =?us-ascii?Q?hsXVOlqwN5+Uxw3DajD+iYpwxHqm7v5xYTxTDJJwHhyOlGgxkdhm2lxmKECP?=
 =?us-ascii?Q?sOVeF5ufoT5GKsY2Of29NU89Y/bVOB08wIHBn7wQhRHy+My3S0ErncPi45Fn?=
 =?us-ascii?Q?KRPBzD7slPyz6q6rTEdyMjJbLhgnWR2YXbLDzRCg1hvQiZUK66UX/cTPfqYa?=
 =?us-ascii?Q?I2981fGWIJeG4X+U1F16+bKtKkqw31LSHm4ssOLjfwIAvKUlMED4TmwdOPlq?=
 =?us-ascii?Q?1JVEoCglsJqBhaQaHTx0zxvB2LbAeEhosgCnXJvE6b+iiMJ71sGVkuNe/FsW?=
 =?us-ascii?Q?V7uAYbkrknDoSrxQ6kpWm2pkCR+rzjMc8YOb5D+j4hh+94bVLAQhnz/W2OSx?=
 =?us-ascii?Q?2S4NsJvwZjNjOzYSDdDux/QhoMJ42ZCvvvhPnRC+11c3CZHbEv2HNAkaOcB5?=
 =?us-ascii?Q?6H5eqO3VOPH7Y9CUhct0EiwGpFjMy1aawquAqlEgb2c2OckK/vm5W3JiCNar?=
 =?us-ascii?Q?8FXvy68edYAi0AFPRrDHOqASeYiXxa6AQQ2i9F88Haga+sfaqVBI5tDc5Gqc?=
 =?us-ascii?Q?XQ9FCkWZEr5hkw12i7P6JF/w23kMq9UyVr/UzjH0sM7YFvahD+itRSDvgyxN?=
 =?us-ascii?Q?Eq9waOuLNZhr0+1zaNnRehf9SIcg5XchaRbbU28i52UlKpG1r8K/I7xEq0US?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dKEdKp1qdkdYbnqKejVruBAS1IW9VGSNgEWWFbNPwhXWjo2jhRywKRC6np+CuxEHSrlo36JO9uKseJk8Pm1fYWX4cIiwaaBCDJTJYsgJEaycB0J5zs4TcEN851n/2F8HvQL8Oq/RPiLnobdoNLp7LifXHscAW90b3nVLXJNhsfVFOvJ6GiCzVHx+M14keI3buplAFthXq5Hj3ZZdX8AmhzN6UNw5PIw8L8Mp1XRNBZ15kMPwmoDIujRSf8KqsE/gedWaJ6mcdmU2yVlC9rnyHJErRD4swU0oCzD8ANqSXhnp00x3nBJQEkGt4hM3Zp/1HxWMmOENXJ1b2v+4wwYyO/iVvce3EtOW63HJdAFrvwannRuiN/qn7wvVGzfNYV8+X5wMwjauE53kkQEH5r0lquDAmvl8hgG7F39GCmsZKUE1VEl8ERYrjkVRb0xr7oT0Z1APIP/aWiOqrcImCmjJ3BvYRino4R4HhYzi49Gy0ZIjfUFeqZ5aKlcFC6iBx18XkmwT9qCw3ymh8VrWRHltoceKQ/TEQHfUea6McxGclj55Mgg9jbX3ByfNZdX+lMKWz1cWOZnENEBvc4VRmqEIArYX611fGj5BgdT3heBQRo0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef4e22b-fde4-4c9f-7cb6-08dd8675653b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 16:54:52.4907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WViBZ3Nr2uDNcrDGYzB10jddqMLXsS2qzsZQAl/o63KTZwCVl1iESmNGhDOkFqOaL7JdhRxBkSyT3QuaWFq/07O5Mbq5xvonm8SE301aO/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7156
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=899
 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504280137
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzNyBTYWx0ZWRfX6t6n/NisXvdK
 S6xmONghgv2hv4SgM2px0jiU5RKHuBlPB046ZJ2oOYXZNsfqWOZNzM+MVGk0+RDhU9yvIl1KrGi
 pGbcJe1gcDPX66cFdZJUoAsyPxbGJwCEqfFzWsls8uzqh1O8dQLuqJZa+uIpSMG/Pf7xHg44bZ5
 IFD+Cs4I1j/A0CJqFZKDFiEbsM+IWVpYFvnWNZUo7alIDNhaPNr9MFwyjPz3QFpaxURq8kJHvIx
 XmOYR25DLhH40hJtWVirBQGUQjTONpbbjWukmyJbZDDvzJGBxet3uuGOEizwKiAt/KfIMfkRl8G
 dHOq1Bqtvl8lM7hFfxzETLVaC/xdFlwXliwskV1xqK1/T1OUeR3s0SZNBTeTBRnnFteYWsVVNyb
 DE82Ckn5
X-Proofpoint-GUID: hYHS45eP4ogmrR9yR895yxL0pJAqsbBm
X-Proofpoint-ORIG-GUID: hYHS45eP4ogmrR9yR895yxL0pJAqsbBm
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

On Fri, Apr 25, 2025 at 04:00:42PM -0400, Peter Xu wrote:
> On Fri, Apr 25, 2025 at 10:17:08AM +0200, David Hildenbrand wrote:
> > Let's use the new, cleaner interface.
> >
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >  mm/memremap.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/memremap.c b/mm/memremap.c
> > index 2aebc1b192da9..c417c843e9b1f 100644
> > --- a/mm/memremap.c
> > +++ b/mm/memremap.c
> > @@ -130,7 +130,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
> >  	}
> >  	mem_hotplug_done();
> >
> > -	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
> > +	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
> >  	pgmap_array_delete(range);
> >  }
> >
> > @@ -211,8 +211,8 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
> >  	if (nid < 0)
> >  		nid = numa_mem_id();
> >
> > -	error = track_pfn_remap(NULL, &params->pgprot, PHYS_PFN(range->start), 0,
> > -			range_len(range));
> > +	error = pfnmap_track(PHYS_PFN(range->start), range_len(range),
> > +			     &params->pgprot);
> >  	if (error)
> >  		goto err_pfn_remap;
> >
> > @@ -277,7 +277,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
> >  	if (!is_private)
> >  		kasan_remove_zero_shadow(__va(range->start), range_len(range));
> >  err_kasan:
> > -	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
> > +	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
>
> Not a huge deal, but maybe we could merge this and previous patch?  It
> might be easier to reference the impl when reading the call site changes.

Agreed, it would add a sort of built-in justification for the prior patch
as in 'here is where we use it, this is why I'm doing this' kind of thing
also.

And I think this is small enough combined with the previous to not be a big
deal to have both together.

Thanks!

>
> >  err_pfn_remap:
> >  	pgmap_array_delete(range);
> >  	return error;
> > --
> > 2.49.0
> >
>
> --
> Peter Xu
>
