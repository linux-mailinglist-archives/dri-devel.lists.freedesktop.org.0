Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51418AB5B82
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 19:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B7710E291;
	Tue, 13 May 2025 17:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="e4PEC69D";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OBLJ+epH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B64310E291;
 Tue, 13 May 2025 17:43:34 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHXDv005007;
 Tue, 13 May 2025 17:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=Fpq2M5G2mh2R+VfXTZ
 m3tOQYC5/5pRVVmWbwk3KWdKQ=; b=e4PEC69DfVeiBz5GrxvcJ6wsnTgS0DGzbX
 kYelRfHYRSFo3LkvfyEFsc0ZQaKSoJuXnJxOrc4xN07PggWZ7+9OYaelDAw2PujV
 r20IKfpXvlisauitScZ+3VclwGSK16sARku6iOjltMBl6Hf/Q/+MI9w7n69mizJS
 8IgBv6JWI7ExC9TqQMbiUTUFTNFq/jlJ3TTU6UEURp/x3/5UQNXtJo9M8y9Txm0i
 Aj2BY16vULb1I1C0kwfPbHhT3Gbnv99gR3haazpDRWRw41dXMYpK2TaivTN3h1xV
 qo39BANKTVv1BWX9xvKWytG2OHRGEjpHJqziK3LFCJ3b/udc81eQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j059wgkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:43:04 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54DHUbfK004476; Tue, 13 May 2025 17:43:03 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazlp17011026.outbound.protection.outlook.com
 [40.93.14.26])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 46m8an7sw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:43:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKdJ3uNGeSWHnLr2snaS+0dkcF/58VbaA22W5oVX/ep5RdFIwR23e6pr2ret2NrncItdjlJMVAaWF3o5yqikN6jCBrRprQW51so36dy1kyIW5rnl2CCcG9KSL3lTGp0Ou5t3keKunDX0QU+IDuOuP5UZPXIBgwx0KxXwlAnh5nVx8IJ7sodnLVBN4+ccKBokW+6K4tdg5+EOXFwVrChjuK0BCPUQEoHeypp/qGOagloePjDGnF8e2rFiR/01alIgvmwmB3DL58t1+ZNtZPGC/R+jlyCgPqn9uUnMRN7nvqRn1ULZRiZ7gbyz0zlGGkRR1jPG4vLtobUT9KLbKzc8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fpq2M5G2mh2R+VfXTZm3tOQYC5/5pRVVmWbwk3KWdKQ=;
 b=Oo8r1iVHtQpGUfM4R20zbNPUL+ThXuqf4anTHUQfaJ9Sj7g8clyCR1BoiIkv2pDhEsuaMv+xz3leMOWieqkadmz1y6KIhGjTJ2VORJNHRf4fOIsqCQdVfp+A4n4n7ajtO/W7DFzDW4aehv76M2CUKuZkAlPFwzn+Y3Dfede2uWPtFG0FpK459sxbse1SlTAE6QZXngPTQCDxnWJ2CsQ3gYjK1UnwaqS87y4Lf3ygvidWWY3aQKiAI8KhqJdxBw8mntxyNtRX9c8h3vi1IZxc3B1oWWrcZkimt9PjSJN+v4NmXrKFtgjUMFyrsUUXoCXzZVtzEqUZxyGZkZv9P2F6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fpq2M5G2mh2R+VfXTZm3tOQYC5/5pRVVmWbwk3KWdKQ=;
 b=OBLJ+epHSuY/XFw8gmuHW2eBztMmVvyGSpEG+JxZQwip/A3lFxzbf6PP2EfLem6kkugHmRXQM1vvxQ3H0dcOQrh579v+6rwiD0/a+3Y8JwNMmOe7gg7SknktysApOJc2Wc+ST84BWo7pfBO3rxQG0nT7EfB+gtChq+f+Timw50g=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM3PPF9E376D9DC.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 17:43:00 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:43:00 +0000
Date: Tue, 13 May 2025 13:42:54 -0400
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
Subject: Re: [PATCH v2 06/11] mm: remove VM_PAT
Message-ID: <v4gyporarljbmmyxl73alybwvwdpo5lvwib3c3hakeee24vhzr@ecz3hjeafq7q>
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
 <20250512123424.637989-7-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-7-david@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::29) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM3PPF9E376D9DC:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ed8522-1753-420e-be36-08dd92459a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u2dceDh2CEAm1syml5bqgnVK4TDNHCaL5A9BiDxbKcgBn5dFonAbKbNl+dc6?=
 =?us-ascii?Q?Lh3ttGGSUSdy6t5Wajx78Ockl2RzKx9XaUi/ofcwFoCs+S6TVc7TwohLg4Bf?=
 =?us-ascii?Q?pCoV/Zof6Bp1ORDlGqL6KYUbYa0e++K2vEPXMrrvaqBsdv/riXCMpTUlWJmp?=
 =?us-ascii?Q?eIb380Qk8BzZ0QLSDrBeg69ljbvKYcAmHY0CxbHDO7/hyS68/L3zHxJWdjTb?=
 =?us-ascii?Q?FHC32NAkLg9OeCUGqFgbXNrNiZD7Kugm3WWH98Dzy3K/rPI5mXNAqsVSdl2X?=
 =?us-ascii?Q?46znhtXye0t82T8opNfi8ZDPxiYvDsxV3hJ0jlfbd5c5SB7h+hSC7Ur16/F1?=
 =?us-ascii?Q?ZMNwzn2i5ZKHwnskRaEcFuEfI6nnxsZHt3CT/SgYKqj1NEZQ/I6w9tUUJGd0?=
 =?us-ascii?Q?dZJuruVC2xasZkrt2ndXGTGdNrZm3tMyCsjXDW3RJWZSPK8jnoD0EBFZ+eJH?=
 =?us-ascii?Q?D3oviYngNcvFvTaEJJ9QVAtimMKxsGLymil7PJO4jQgu5M2IY7tcGANkYs40?=
 =?us-ascii?Q?s4K9xnp65R+8gltq7a+du2xZAor+uzKGobyqA7T6lGhp+U0O738TfU9Murn6?=
 =?us-ascii?Q?42xN8rhnvOJfuGfE6SpxGQMdeARDMDqjrjmKuapGiFMSjH5WijK7nj3dNXwQ?=
 =?us-ascii?Q?FM+oVbfHx8HKMDx9b4KbcizIWNxa+r2+QtotXsVOQJOP1nbfI+jR1sBqclEI?=
 =?us-ascii?Q?BevP82DKr8jeAcRouldSWesEdYSPhTb5odoeOmYYc2dGwrGwjglv++h2VX7N?=
 =?us-ascii?Q?Txy3Jxq8mqp/9SkYrgX9pCgMgRO32ttRH2blmrKCGe/wpSRg3UTe35cA2x5A?=
 =?us-ascii?Q?nXi57Z6XVibQoA39nHD9IYh9YDYDPCMFp/gvvFy9H8fi1Xv+LCQkpyv8Vvm9?=
 =?us-ascii?Q?eBGAUBvd6RBEowv6Mca0SR2GO7T6jweqqWJksXnASeMxhL6w46w2BVnBDSpc?=
 =?us-ascii?Q?c//q/76aVmOSMt5QqGudyk/KBAViuBYuHJyq5E5Maw2fk2hQRIymQ59PZqBw?=
 =?us-ascii?Q?fQWkFq5B2+ggasLGDIgb2y46VfFTJL3lD8wBPcL5rLcU0eesFhCliZ0hympZ?=
 =?us-ascii?Q?AhoZPSXlurHRgepN3GgzHtEdKF5tBw9ENlhMde8YFlW2I+ht3SnKOHjzOz5l?=
 =?us-ascii?Q?NsvKTzezhJItVAPYboN9w+gMsN57HmrntDSQzfnEa4WuN1eajiJhbGP/c8UC?=
 =?us-ascii?Q?CMwygGshAQiCOCKb/7UeQgG+Y4N0C1fPBXcKaDGfNPBBbP5JVrlNqeIvMYjd?=
 =?us-ascii?Q?pFf2xI+ldK0U0gNHWMhSeV0YycdOoHP7BMpc9Jsj6aspFJ7shOV7NlS/W/WJ?=
 =?us-ascii?Q?7lHpGz31SKigGPq87rl3BrQoI31n/OSieDxl3qcR5FXwxDt0+35fHebqAggr?=
 =?us-ascii?Q?l/K4/l2bEd4GH1h/JmTIEpIT7lCLPRL9L6v4jIftJJ5LXRMAZDC4CSqVR1VB?=
 =?us-ascii?Q?1gqAAzLVKEA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5777.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ty0stBr/Iq1F8duejZKYh0W+ghzQ9CMJgjkoz0Bqwad+Dc6DnOjFk96r7XDL?=
 =?us-ascii?Q?hGM1H8P/4Xj9SFlIGf2pSRF/Hh1bWvI1k1ElZCN2O1vsMe8Z6kPTIWuvwX76?=
 =?us-ascii?Q?Sae7tHqKuj0lOiN3hT4TvDwGDLlw64HDE7lCier7AgHOGz7Qnd+6VsXTgYFK?=
 =?us-ascii?Q?AyWpZk5jPvGnfsEkiVFotcS6AGCxHXB1YnoiVLDq4+Jf6lsklabsby4iULYC?=
 =?us-ascii?Q?6GzXtxPZkAum9zs6Guo7uybt1KiHdpXMnIItT5seyqPZl0ewYtgEh5KevbDb?=
 =?us-ascii?Q?u6j+cAAwoUiSGh86KNdlF4Bxboe97VugrzlnxgRbt6F16xQydCA+5p+oZ/wB?=
 =?us-ascii?Q?vzOkXFcC1u3If7wOi/em127HMvOb6o4IU/duH1ssKftohCf0gPuGNjGzJzsY?=
 =?us-ascii?Q?UR7BjKG7xbI15c6Jhuvm9jA1Vlg9iJ9NpY9aUvdvf5t7uq7WowaqqUShosEg?=
 =?us-ascii?Q?QbigDVVUtD9QKzk8B9eOfwfp3GRisNJm4Gfvqq3J+4q4T4u0o5JT8URqeXpQ?=
 =?us-ascii?Q?ekxlDrW+qQf4qKflqgXmHRvYfe4ACA3IDrNdyrdp914P4w7OCfOeIOfWi69i?=
 =?us-ascii?Q?Z5XnHrwcQUrF54XsoVCvlZQxt9DEQxz/68ycKu9LgtjjK1LLEn0m/cJCXSO8?=
 =?us-ascii?Q?53szJEJtBZ+JRVcikRkrJZvm3iAxgXMFUDIG1fV6Z+dYh3cJO1t11X7S9bCo?=
 =?us-ascii?Q?n3JIwFKt60+Oi3ocmW7W5vxU5wD5J2EKIpRt159Q25/g5llsste3aC03VHv/?=
 =?us-ascii?Q?0JRNz/CTvt/7FVGV4yzAzYOYmw79N7nUAx9PW+gIatZ85T0M8fldn2/LzrIe?=
 =?us-ascii?Q?zBGXGJMF70z61KikdNx+k8OOcuBTBbvO0lpY6Wn6oP7ubTop7F7cILL+JU/e?=
 =?us-ascii?Q?u6nSugotATrl9fJhZe/00rN+AtuKQ2JHsH/tWz+714/mDeN3itbWmuFIiOGF?=
 =?us-ascii?Q?z06JpyGGH1APvasE+8mOwiWzo6TLlQg4yc3hiZp400BFhhSf+N9LoLxtQtmM?=
 =?us-ascii?Q?UeHMiKZDWxcadPuEzskxuBvHL33kemP1G8p0YtjRrHpoEVQbXaAFUOM7QApR?=
 =?us-ascii?Q?x1JVAQiu2bEJOMxXyOf5+GEr9+iODUZl0oannK0/2EJOs6IJqW/PWh4g5a48?=
 =?us-ascii?Q?Ii7XoYerwTFJVOsrUTI5sZ2UkWuII6sJk2w1ZRHWGGvh7ACD7gTejrifZQxe?=
 =?us-ascii?Q?wTjOEQY5E3Wt47M0hWYyLUNk3ybrR5Ra1j9Ln/P3lpuj4Z5WGK7u/l0of1gn?=
 =?us-ascii?Q?P9ZFThfEW8CxfUaaLMB1sgRWZ8va1wgFs7TYfmSYHxYT5lfI7TLRn7ZdG3mZ?=
 =?us-ascii?Q?ZrwvhiHRgGwZZZzwyJ0jSYoHoyfeZghYxM5woM065KyOVGfcpKP9rOBTXFXz?=
 =?us-ascii?Q?qP4nAxA9DfJd4ti2vYgdgan+2peMplOWHUY8C9HKAZ33WLFuikW9A4LA8qqT?=
 =?us-ascii?Q?lwK1Xn1GN2m4++fs7MG6WPc4pW7MstZEp3CS54zMvU/x2Meg1ksRuBkcEh4a?=
 =?us-ascii?Q?T1QjdJV1v0ResBMrYj1dcFRBTKRUgDM8W5+U5xj/BXLmJuTAYU1hhkWW82J4?=
 =?us-ascii?Q?0UIL0k+afE20m+bvo6m5bvzteLtaOfmw2zwKpsjEC4YKvUXYslxWkTSqh5UH?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: nwNR1un3d/xUEHwKRlXFSCsN6/nUT5T5u291VEGwWfkdFoPIRa53qgffYSxCgUH0GO0tiCdjYqiOyAq7m7Gx6tAfNnQLmeVQTaZoFCM7B+r9DSf32KGoUVWFoxHRmzmN6HPdsWJKfSkxaNx1+B3+25ZI/vHG+QjDLj9aKNhLj6NiXuja5oPAZkOD8RhROFeWy+inLlXxgwzaH0ANN2Xvm3WCnwSqqBGz3dhNg8Pq4GWxzEdv8AIJ10U/D3qjwhQle+d5YddlJNyLZVSlG36EpKNzw6fW3AAHKWhV9lt1+EW53tXax3wqbiRsdZgVHoGvoHhHiIZLlNcb7r2h1KBVWM2dgyQsKF0/AJZFlEXJz4T0UadNISWPVOaBjupt9/p7eDBuEnh5FhNivA0Wwgo10mAjEB0MkNSg+UKdC+vU7p6JadMj1pL3xzQJ36bDLhCaj7Oqmo7Ws9dI0QP6RNqqkajTXjwUwhtLJ80ak9nF69vlr1TiDZskjxiR2DgZ043kb6+HpsRR0JWNuRc/RvjfI8eLMKYa7iBzrIKj8JYjpNPjMaVKGZodsHfwtG6QM862fzcLWfQGj+jath3RJYmsc8e4S20YDPGw1W8NFcr6KqA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ed8522-1753-420e-be36-08dd92459a7e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:43:00.1268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdTzgLjSZxsqwRvWTCQj+OWhLZDp17sxk/bgL28xrU+RT+QwGN72mVbdBpzDlUyGHk4cDSG2JVzaVP2ooQuFMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9E376D9DC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505130168
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE2OCBTYWx0ZWRfXzkrCptj42njv
 qMojpBYpKFXSXii8wz+4oyWmG0JBw1KleJvE2VpxRdakdXepazuBQX1nYxDbI8pd4D3M6jzw4Pt
 IECVNzCRAduJS/PpyRLD1+4PufmWjzoSt0x6D4IYw7BejHPLPjnH8eZurEHOBOvpMpf6TEGZ85Y
 ZRKtatu2EHt3eYgz+I4VzPQ1uin9POrQhgMLsuIM1bTcmzyjaX6Wj9/seKsmMm6lEY7HHR3kBUt
 gBwBoyWnpLHOB2VeEuBeI69f3EgW2yQrlZoSTU0WW1gMsVh76T1PExfhudjPNhCW+49HRguw7Ed
 SPGTZhHFI6myFC5FprEI7VfDScxDcQjdBOnOpdeR6Ete0rGo5QUz012sC2V3quHPTRL31gcrLLC
 JJJFIrDoX/MDKdE940temOp/Rlbcw09x3VNpgPDgbUtgFXKqJvFjqkVUc13lFRyMpUJBBLD4
X-Authority-Analysis: v=2.4 cv=RPmzH5i+ c=1 sm=1 tr=0 ts=682384a8 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10
 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=y-3my22229aF_enkZZwA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14694
X-Proofpoint-ORIG-GUID: QxPqpQnf2TkYWPtfyWkTjG8rZcotpkpU
X-Proofpoint-GUID: QxPqpQnf2TkYWPtfyWkTjG8rZcotpkpU
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
> It's unused, so let's remove it.
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  include/linux/mm.h             | 4 +---
>  include/trace/events/mmflags.h | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 38e16c984b9a6..c4efa9b17655e 100644
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
