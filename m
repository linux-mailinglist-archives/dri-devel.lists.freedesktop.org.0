Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B70CAB5B84
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 19:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF38F10E292;
	Tue, 13 May 2025 17:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="agzbHwBS";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="B6LVsx6D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5655A10E292;
 Tue, 13 May 2025 17:43:55 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHK0D030368;
 Tue, 13 May 2025 17:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=wCMn81Iy4Y1KXjVkGb
 wVQzmK3GnZsvPJoy5RhOIdy+Y=; b=agzbHwBSxAhjX1qZJGgOaXMDOGVzlDO0Cd
 xYolcL+Ia76JGmeApkY0qvW4ELxhtlHMqLuyOe5ecwTGQxM8XBLlERp4ntT3h5Xw
 80q9O8hXGZuxxefTm74HC0Z8XwHKW9cLnfWn3RpO6r5WL0ndyC/1ciUyLYLVU7PJ
 L+wP/sYoXGdKiwwmdPxcQbaey5eVvEW2LdDyk1tN4GrXHk/4D2wEKrTea4bLr3ZB
 YJ43G0+EOhXM1RJyob3sxPYXF05BlGTkM2nYYqY/Zb32QNlZTM7cMxouo4/7WKKF
 YEOJDN66LGO7zVynds5ilaew0JVVD+qweb9Akjz+Adk9fLwFIfIQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j1d2dbks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:43:28 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54DHdTJv004471; Tue, 13 May 2025 17:43:27 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazlp17012036.outbound.protection.outlook.com [40.93.1.36])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 46m7d92uyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:43:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ah3U5Mhf1wCJ55VftnQnF4f+D28Z3thi2GWZzr72DwImRkO8oxPHFRo123rY1HdwiRyYScj1Sk+GfEsBZeSRJt5cdBEHXQniQgvw4v44V/a18igO/eHF90C7O0Ns0OCT9/Hpsp7ZzCrhd5CdX49BMyNNOp0/88WtJg1qK9vYs9w0E0/O3tankzreVl6lSsJxo3sAMvktO/VswuCjSJ7rvl8DyaPTJEerAO5lr616TASfYpfizppAV6cbqQzM8DAS6JIwSPrWvwF+/QQn18ipKmxuQB3DOBOUfV+JMmiNJsSyAAhlsK9IsPZ8NPQgd2u0Ltrs9OXMDI1Di0uMdF4Ovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCMn81Iy4Y1KXjVkGbwVQzmK3GnZsvPJoy5RhOIdy+Y=;
 b=mSuIyslv7gLmUaQHVnWC5AVlo8yenSI9yq9b9jFqch3ofYO98O073ShxzidQTSKMolrWtt24f2NcCfyKEd7WEMCy12pzi+929q8edcSVEhUj+FDR4xRMiS/lCqtQWroc3rDF7gEyvAAxr/vRgKI5RUkf/MuPW5IZHZ4UmpagkG546GH2EqcheFcTT+UVtVJrt6nf6xMasjnIK5/5rkhBiUxcl/bCtVZt9YUtLTfVY3gR0g7RjHeK38EeNuSYv+OOmpsoE4Ubh7Jr0dH/2bjP7KO8tZlRU9AE5lsNDeMTtm15a9N6w0rG5lXJNDQ+GL04a/3MrYL6RwwwS05UkwvsOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCMn81Iy4Y1KXjVkGbwVQzmK3GnZsvPJoy5RhOIdy+Y=;
 b=B6LVsx6D3YhmNEMfn/F/UqxrR6lefQKAEWBsazfCoI08nRZLXHW/oPKkdPrupOiVwnrpsKQIQ4Pny30eNnlS/CB2/fANVAnaanVTkr4QVY//sW6AJCqdz+ueCMgAK1sV5pdDQqN9YBBb8SLvsx+fvFQXAg8mSQzPCQfH2G3sf9Y=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM3PPF9E376D9DC.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 17:43:24 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:43:24 +0000
Date: Tue, 13 May 2025 13:43:18 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
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
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 07/11] x86/mm/pat: remove strict_prot parameter from
 reserve_pfn_range()
Message-ID: <35ws6agju6e3u2g46dzcfdulaukfskugzupdeg25qonhvhgljt@qmw45vpa2xsp>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-trace-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>, 
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, 
 Peter Xu <peterx@redhat.com>, Ingo Molnar <mingo@kernel.org>
References: <20250512123424.637989-1-david@redhat.com>
 <20250512123424.637989-8-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-8-david@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0326.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::25) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM3PPF9E376D9DC:EE_
X-MS-Office365-Filtering-Correlation-Id: 22358003-27a4-4006-b8b8-08dd9245a8f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ay/H5ePvqy8x1Ec0e2gEhvlKFJjGZK+JeI+UWvDk9kMaxXolXjWEK9sPnbZV?=
 =?us-ascii?Q?kR5jRxJKuxHq6lkPK/rAacjGEtEVzofA3v1JxdufvZyNNOKvGib2QUiMIDS5?=
 =?us-ascii?Q?skBBp0i8TIHj59R+UqkRpt7+ibv/oViIMyPIpPwQlCjd8x46AZr1+75f8ifk?=
 =?us-ascii?Q?exzWDngErewztsFMR5rgn2JdlylO6tDwAJohi3XMR/aYhzPR5Q/qAX8lZsiS?=
 =?us-ascii?Q?hxqt9YSEq7VPYsPuwqKlf+53tGEn+D8zIwvp7/x3lYr50MVzI31aaxgFa5Z8?=
 =?us-ascii?Q?XsWTFTdE4V3qymxjuF01wZaPgIxJAuokJEjJuhND1W9+P1ZQvZxycTgytSnQ?=
 =?us-ascii?Q?HhVYxSu1HOQNjPfnQU3HXqM7NcyAt5Rybt/taxPWzz9Gz31Na1I91wILDi3G?=
 =?us-ascii?Q?44NfPMX/8r/afEjL3tfbYpzG/KOG+qa5VKU9T/DA49vNXZhDoenfmiAYfn1X?=
 =?us-ascii?Q?9BAWa5IfAirA1YDpy1F3xfnJhZk9pV+xTm22Gs3DzJizaS6lLUICjkHKS24E?=
 =?us-ascii?Q?Xzw25dmWqoAyfdX+t3I6hjXy0zCS8clRKKJXCVdnuZD8iXn2e3H5Y8Xx+v2y?=
 =?us-ascii?Q?MYhZrr66H36POo1xu6G2Tp5SrqeDvMpxHKdaR/EtyJIFkD1z5h2kcVbpa/Eo?=
 =?us-ascii?Q?+gT7y1Nu9qOsINaDF3UBdtrfymdTwRszZY7hHz/0u0vmZ6dW8FHQ4OwgUIED?=
 =?us-ascii?Q?Y4qG7V/6IbnNAYTR6KHC/w1tSjbikxey88LZ2EdKqAiRejTSCerk6/OrUDc3?=
 =?us-ascii?Q?K8o4t66Kuh22NjeJkbbaw5ItWS9CQCoJmWW9/WhjHShg8v8+g16jc8ZOa+/X?=
 =?us-ascii?Q?LsLrXO5FiseMQUQCkiDGx0NkvIbxAqKDhvGMj/LvuW3mCMsPHiHJqbLHnCJI?=
 =?us-ascii?Q?ZT/Wk/i15UhZdHMLplXHDgj0X5cH4nlKIEBXbQMKaa83EIokNBaU/C80P9GH?=
 =?us-ascii?Q?L22lODZCSRzjDvx82Lf2AFgBNaH17Wqa7Jwyn6Z07JNFEyrD0RjucAZQNuMo?=
 =?us-ascii?Q?GSOWO0z/UD+TWOQpSyaoIMV8CE67h9pPQd5Cn1fxkmgtKguIyopR5Cy1VVY4?=
 =?us-ascii?Q?UVksuxkbJMFV3UOLFK8mfyjURMew/sXUSk1Hin0gwjn3p9VxhhdGcRp1N2Oa?=
 =?us-ascii?Q?knUWL3WhLsaBzBAEjl+FSqTlql5WWhULT8sdOkC91YX6srdgY2Rm3amDfLct?=
 =?us-ascii?Q?71btjgIWPJQ2dR7JE+neP8FoJYAPVxoIMyheZd8Ztc0j2WYOE6ooRy13b084?=
 =?us-ascii?Q?JOCSskwv3FMboG7O3Jfs3SsBSeP9+rmACXdGjZdKM+jyJxNHfGrRCFtw4i+H?=
 =?us-ascii?Q?3m8MkqVsWDcOflafWWeRpO0CV5DIlLkKp1fjQE/ml02EHemPD9pRk/Z/PrsU?=
 =?us-ascii?Q?EyHVjtZe3dQP1pZmpRHOdkJqFx9q2ABwDsVNyINqcNrscK7/VEpeh6WQilsk?=
 =?us-ascii?Q?lyvaW1x1LI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5777.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ap11QFY3ZPSrlraZ6GBnEMoYuh02zkRBAignERXbI+Au0yTSrx6zUflO4Rpl?=
 =?us-ascii?Q?sxQb0GYmwJ2uD1YcHvKrUIhmjo/HKe7CieGzuLfNvAzsskaJWiWZkVQSLj1R?=
 =?us-ascii?Q?IEcEGP0x3rUUTn26avcL7+G9LG5cueEyN9+KFQwHTLFP2CGMhKUm1RHjS8lI?=
 =?us-ascii?Q?IF+8WUeIklTwRHMJj1A7i1yWZvXE4F+1utTOPVUsmtAI1jqthArreSHIFM1U?=
 =?us-ascii?Q?Xt9hWQNPhvyv6godfg9skpXX4AK411Yl6cboS19nACzyYKQv6DsAtaEe7Bh4?=
 =?us-ascii?Q?SJc9W5VXwcl3a+1MgomFrB3RZiYaZ1VSt7K9JN5ovIKhC6WywULtg+rUWsSF?=
 =?us-ascii?Q?Tb/FFvBaEaEYHcrdcqJhXXAaDwEwgscZndVBduqdcNNJXrA0d6MeCK6toTtl?=
 =?us-ascii?Q?KJAeBU993WS2ZtChSEc1Tr8ZOl4mQ99uktOmPOya43Tjkmaw/FMgMel30+Rf?=
 =?us-ascii?Q?IBJ5ZF8y5DInYmmeunOT2CVekfkjF3yoPjD0jwhu2JHu3y0DsyNZvB/os50w?=
 =?us-ascii?Q?aepr66HX3G2hjwEz3ONDDA0oYw7qGE8pgHMPlSuoI1rXdVwf7xQC3GvxltQu?=
 =?us-ascii?Q?QvE4is9D73HTaqYgXor8YfBvW2U6dphmG/0tVZcN1xcm5TNX+nHqMOXNrktf?=
 =?us-ascii?Q?JhefaNzCNX//UxBF7UJlyqHD1mqENtixX7JkFHgKPSzVMcysj+wC9R+gNFoO?=
 =?us-ascii?Q?aXlGVbyY2DndQq+WG6bnTDgCctN8ckegW6q4vflKUwuu5atBI2oAxOAC+Rpf?=
 =?us-ascii?Q?wx67TOHM/ouWONWLp6QaCH3oBzGanST2Gz5Zo5lzuQocoyxf1MtFT2R4jlip?=
 =?us-ascii?Q?DYAdQ3kQPBs5uCRRPpXfweZQkoow/Q4cUfw8pM/lgo+BK034hoQz5Fl/Jmp1?=
 =?us-ascii?Q?vgeGb5MTP6YsMDmH5yGblAMjzOe+RhMei4KXBwY9jRFkmH+UOMjhtAGMuiXg?=
 =?us-ascii?Q?mI5VHIofTVIy3sSbKUxoz0YHvi027KSHtJ7tAqX60AcofrHYPRSu2KU6cetd?=
 =?us-ascii?Q?86cCkQjWxOuDl+ii2za2IXnfRAoh3xFLZZQJ/uay7vkPX9UK2/yKuM1L51Po?=
 =?us-ascii?Q?+qNJSch8rhe4E2RRaNaaPoaalirf8CKc+Ft/C0ttd3FstoMtV3+qPe5R/nSB?=
 =?us-ascii?Q?Rq9GYiiiayilAndouDX0JgbmtxyIA4Xd4Qm9OcJoZXeorSi7H0qY2zi7Thgv?=
 =?us-ascii?Q?rVX4P36er379DxhZiS+4zYTVGaWxQz9/9uH0TOM2y7aILo2SsEz+BPV5Gkz4?=
 =?us-ascii?Q?aK1e8/RCuZBBJHkuNIonUk0546y1a2+Z4fQM50V3mQ9dkTR8ZeT5fupn8xEh?=
 =?us-ascii?Q?fvNnzAFj+Ir88mmf3K0GxJ97hrbeyztN3WDg62b80mJJp/PDBWPrukXUqMLw?=
 =?us-ascii?Q?h0EYO9Fh8TYqpvbkERWzQYf1MZEh/DemfsR+BquTmhVOd7KR0Ua0GoTWLxUw?=
 =?us-ascii?Q?ZghvCccz0JfJETA9p6A4yQMBsnh2v+5T/HQWcJhlRoNWSGOdPasTwvUrdxCX?=
 =?us-ascii?Q?6rxkRkEANl5wfaXEplCwpQlIsyba/SZqHew27UQtlLFCjA8mRfsuGiAdes7U?=
 =?us-ascii?Q?XS049akEYahl+r2UIYDr5LdnDr5PhcxgnXwefj/nZaD/+KO5UqchN9IsKUdY?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MtAEQj6giOU58vgZ5vK/XZrQqjrofU7Yq5Fo09NIzULay+kIaXyBoB7f9CbyE/prANKgTfseZTtDFxNWWXCSjw/nlSqxwGCxVxxhxWszbuXsjMbngpMNV0m6wDKluDMmpKSN0p3rX5g/XIDoVKcVYjgHVZ/EDs8/LZANxcYKIai2ETv6c69YhczMlwTM/lUpFO0nAgfxYQjRqh5tdV6sgsAjvFPZuJJ5jr4wfSyH7l12dQsJrwMfGuf1gEWkFZCQDTnBEGu721ySOnd00/5LuKb98mettvxqqITcL1ocxrG7rjiBbQbezRdn5JW9F9oMK0yS1TRHz/TCLMXlb0ebOlOq7jHNPotxE8yLKEGz9EXTOpM/qDqAFoLdSYFUWbUHBaCVv5NCPP++uIIGLNZii1uFB5mt+CAxv9dVDemfUklv0ciVbORbAU5zIe5l6xpTR8cggKChYrDXOZzibdXq36Eq23j097tighs7dWCkeWexAWR5Sm9yGiTelWPR1/62HHR/oLumjxPLbzRXUZHeEx6q2SJ5Ih8UnJYeeU2J61sYawomPcD34qs9DFk2IzgkVCCYvU0IDIMSGPjaOxQwynLW2joLjftL4/8dhLShYRY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22358003-27a4-4006-b8b8-08dd9245a8f6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:43:24.2995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7me0EwuEYattBZk6VFjLOAfh95NxgmHTBs88qOhwlqBalNjfWgr9cdFunmg2pGBY7y8S9+TPPAMtjMzLofTj8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9E376D9DC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505130168
X-Proofpoint-ORIG-GUID: nwVKcGmGxvY1zMjlVLJtF_tt8NNp9cPn
X-Proofpoint-GUID: nwVKcGmGxvY1zMjlVLJtF_tt8NNp9cPn
X-Authority-Analysis: v=2.4 cv=XNcwSRhE c=1 sm=1 tr=0 ts=682384c0 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10
 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=PdTwfuwh0fCXkKoobeYA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13185
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE2NyBTYWx0ZWRfX/6Qa1Kmhc3Fp
 2cOK6APE7uLC5ESOc5So4lXubyLadsI2YZoMkpFY4wBjIzBSHoKkIW4DB7N9u2tM4F+MOoO9cVm
 InN2XJHIQ80x2YtAWVLarmZnz14fP7KL1CrjbT8dlphPpJ6d0KxvG9H9G9pTZWdNTwUWv8gXzPW
 SopRYjy34ArhtIQFPZAUmYpxQY/+jDcSSLrdE1KKApZiezKyDpMYy10Dev9cxRw8MsND6wF2w+G
 xADaRp2HssOkm0+N8EzxbOs0+AGLl+H0+jGylsKkL1bMlSjINRJS0SYNjdaFWDLp7cohBA1PB7A
 j6ZHRFj5h8SsvbSxe+aUtbw2DeY/22WpFSS6CbOvQTFisXshCG2WyUX9rCarSmYuOMdJ2XGkhmM
 2A8YvFVomcCOFfvl2FpVWvzR7W5HYiA9NyI0NykEq5n7qKUBITywtvkNPo9tYUeGwy/YazkA
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

* David Hildenbrand <david@redhat.com> [250512 08:34]:
> Always set to 0, so let's remove it.
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  arch/x86/mm/pat/memtype.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index c88d1cbdc1de1..ccc55c00b4c8b 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -858,8 +858,7 @@ int memtype_kernel_map_sync(u64 base, unsigned long size,
>   * Reserved non RAM regions only and after successful memtype_reserve,
>   * this func also keeps identity mapping (if any) in sync with this new prot.
>   */
> -static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
> -				int strict_prot)
> +static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot)
>  {
>  	int is_ram = 0;
>  	int ret;
> @@ -895,8 +894,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
>  		return ret;
>  
>  	if (pcm != want_pcm) {
> -		if (strict_prot ||
> -		    !is_new_memtype_allowed(paddr, size, want_pcm, pcm)) {
> +		if (!is_new_memtype_allowed(paddr, size, want_pcm, pcm)) {
>  			memtype_free(paddr, paddr + size);
>  			pr_err("x86/PAT: %s:%d map pfn expected mapping type %s for [mem %#010Lx-%#010Lx], got %s\n",
>  			       current->comm, current->pid,
> @@ -906,10 +904,6 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
>  			       cattr_name(pcm));
>  			return -EINVAL;
>  		}
> -		/*
> -		 * We allow returning different type than the one requested in
> -		 * non strict case.
> -		 */
>  		pgprot_set_cachemode(vma_prot, pcm);
>  	}
>  
> @@ -959,7 +953,7 @@ int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
>  {
>  	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
>  
> -	return reserve_pfn_range(paddr, size, prot, 0);
> +	return reserve_pfn_range(paddr, size, prot);
>  }
>  
>  void pfnmap_untrack(unsigned long pfn, unsigned long size)
> -- 
> 2.49.0
> 
