Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0F7B2F397
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 11:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2798110E8D5;
	Thu, 21 Aug 2025 09:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="gy+zDfdH";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QeoYI1cG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B76B10E8C3;
 Thu, 21 Aug 2025 09:18:09 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9DwWN001554;
 Thu, 21 Aug 2025 09:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=NWJ3/IwVRMsa7/flkStAN6dqCf7RdmUYkZmqIg39G3g=; b=
 gy+zDfdHQ4nd69h6rpp/3M53A+9FGmcKITph4MTdAieOyCOg/jSNKAShoeMw27U/
 11vYZ2t3H9QU7hkYwoUhgVADPdaq1SHDGHSrfs1bGNH+GOQo3kTiWV0+iOHzZDQC
 rKNW+6h4a85UC/LhvBfLU5acRTh3VIEctZ8mIk8oNiqer0JnOwVk2+eO4WcCUKpr
 tb/fDJFnNX0ApAHc+EVJ1DpW2uZ0zkO/2YFqR+nA705eJ6r0ahC3WIcUtEt0roka
 Ujqpt6hPhF9BX1wCXJp/qmvGo0x7W3/h+K8Xci6jpmOnm2LXDjfXXi9mPi/ayw+H
 uhEx0y69pb91lV5uyWY/sQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48n0ttjy4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Aug 2025 09:17:00 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57L8VL4F039465; Thu, 21 Aug 2025 09:16:59 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2064.outbound.protection.outlook.com [40.107.102.64])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 48my3rur98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Aug 2025 09:16:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3ekFOOw7pDOk6k6CDzaZ8K2xs3FQuMi/Zv7i4VHsIhvVd3RVmVJPzf91XJAhHX8BxU+TamzYVzJZ2sOGXOQ/VREUO5qozWRqrjdWXqj7lbr3TAQQ3kR1Ydglpo/ZUEVuzMTSpz3dwLm3zRo2/aquJuSXwsj6gNSjOmS+GpBQRTfVhNv3an2yYO079CUKitQgvUoNfPa7+a2IfrkVWmpEpev23AAAU1LlhBXeS8PMoMTXGHt3l+tpSRsqdY1QRAKzVYXhpW0aqZSwX6SXDHGE1yNawnGEfB0ExTFhfdeFONeOIWhrIuUPY/vo7PQlv/oc6UZ4OX6Oq3o4fUCMbHGgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDxGh8/YKT34UHYIk1rdkRJMSCthKG3z/0nGGT66Qh4=;
 b=QXtVUmmPYSQBqd+2M9qHlcPPWsAFBt6sKt0UoIy+A2tH0Zl0Xia2jl7+BSs+yrwxout07f6TWP7PNitCSSvjArDs2iYnJhcGbLUDkEV0KacZNlXIieiXC+AX275vPo4c0d/EAkFHMfZktSExTzpDugsWpUTEMvm5rJbMjS3TimNPM8tV1mFWa9K4YadDPq3pwfNrSFLVR2mH+ZmYHJ2DSOxeBtsWEcmKjZ84/OKA6L7kZRv20CWSIrAspOnu2SBJtqcghuN9uqqPUoy5NLSvgqqww3mx4coyJkqKk1BDtxgezQZG6fYO7fSCwRRWY3K1NUR9JKDGpL/P7yL1CgS7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDxGh8/YKT34UHYIk1rdkRJMSCthKG3z/0nGGT66Qh4=;
 b=QeoYI1cGF96X+tFCG2KJxo6FjAUQB1gbLTAdutBzKGXy9tKOSZGRnRRP4BHSgiq1KsKYTBoygP8NxVMjMrtNgOGomMOpUo4RmvZZVrqlYTTWwkPD6RlzDdx8U9cGvLHRLAoqVAVxdYihNv5taUH0FXrGP59PyiQTOxYAaNPhX9g=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB7850.namprd10.prod.outlook.com (2603:10b6:510:30c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 09:16:56 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9031.024; Thu, 21 Aug 2025
 09:16:56 +0000
Date: Thu, 21 Aug 2025 10:16:53 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 x86@kernel.org, airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, Liam Howlett <liam.howlett@oracle.com>
Subject: Re: your mail
Message-ID: <7db27720-8cfd-457c-8133-5a7a1094004c@lucifer.local>
References: <20250820143739.3422-1-christian.koenig@amd.com>
 <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
X-ClientProxiedBy: MM0P280CA0064.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::26) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb8d9f2-4cf2-4dea-62a5-08dde09379cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?T5p1MnRvANWSHvoobYRZFfFgTslcAZJrlsHQzUXoFmcrc3afuZhbwRQ2cy?=
 =?iso-8859-1?Q?usQmz9un32NzmUvSwo8g1A26YB3FaLtE+isfbcNDr0kDEMYby74dKnMth+?=
 =?iso-8859-1?Q?nrWC+HJMQH2kimcDZDuIXVV9ScHPiyIZVo5oy0Bw2pkPr6a6cFrNsYxCS8?=
 =?iso-8859-1?Q?KsDcf5+Q/fZ8ZKWZPUt/GgYLcfdSMk1yRCTQF4MeokQOn+m7OrVChFwhPU?=
 =?iso-8859-1?Q?LT/jdFzCsQQl50nXQzU9rXITbJ6jlKLRkOt0/NTVoHqB1Q4hjL92E+f+L6?=
 =?iso-8859-1?Q?7Luk4uJqUTsY3GF95wFhHd8zdXdVRn6VRP8AtVm7Ir+z6QeSnUirq6DJqi?=
 =?iso-8859-1?Q?7d9QrXYGnJ9lhVjTfrEhXJam0sPm+sf2CC3ahusJkvdFLdk4tJRw1BDSfv?=
 =?iso-8859-1?Q?cyvW2RIcFzTyTnfGPY3DWiO7YmjmxX54qR7uuZ0g8yBnvdFN5Jhem0f954?=
 =?iso-8859-1?Q?olWpXuR8SHF/jhvp5xr8tYb++bg07Y1VEdKSivxoSf57rTQNlPp4eOBV6e?=
 =?iso-8859-1?Q?VyF/ZjjxWWL6mHvT7JCa3FkVNiqYPFtpldo7mVMao8WZyvi5kmQ5RNaxia?=
 =?iso-8859-1?Q?DhrYnB2iW5m93MWDp9I1jyus1qb+kR7cL9vUy5Sp0wCGxICa6Aj+SZsqE/?=
 =?iso-8859-1?Q?hTQfSGfOZZufXO9Xr1j4Qq9pNyWhkkPBvdWFhzS2yo4r+y3TdVeETfZ5Ym?=
 =?iso-8859-1?Q?6sQYvSlKTftmQEIuj2kH6H4uAEc72ZXXs7J7+XLUCVnYAvlGCvUlIyFvLf?=
 =?iso-8859-1?Q?BSSHpBjvzIPGKxuHhjlUjywykx8/qwDjpvbXQr5hLlNej3KK/AI5D/+w63?=
 =?iso-8859-1?Q?PgWbf+AcbznGNuDGHtiYotO79uU90IgRPP+NL3u/E0lATZ432PZW0BM6rm?=
 =?iso-8859-1?Q?dV1w9HhUtpq0+4MHeDzhvQNhEMsNPfH6+SiIR7J+QPNUBtJG5QP2CY1uKZ?=
 =?iso-8859-1?Q?tSLM2QpLxjTsETFONdr3O+19Gnev7hlQn4DXz0BOdMDsJs7m3FNy0kLL8Z?=
 =?iso-8859-1?Q?3jnSGN2/PFcKZsGNuPAWDgtahTiOws51ssGxRsjm7hk1nChO1Zlh+nyVHn?=
 =?iso-8859-1?Q?rc7uY2y/MF9zDMLTDEN91LS1H0ZzMDPbLbkKzTJaTTfJEGnsvsjt8sHrlR?=
 =?iso-8859-1?Q?9CSJhC4mmauyEcUDn3gEjmx1pifjq8Q6nz8UAtVlrZbHmbe1YQs7VEn3ne?=
 =?iso-8859-1?Q?r+lADYBHeK4kt9c5cl+8wPfPEOyz90Ye6nsvN6oEUMIoh0TvxXFM6th+bP?=
 =?iso-8859-1?Q?EJ7JHl6HBYZ/u4EXfABK+XfJ7zhrRspkvnFRhG2gv20Y+7zu2GvT5k0wMp?=
 =?iso-8859-1?Q?sZg61Kz027mfu45mIBUtz27LwAlw/IwmJk1dNFaOgG8DkxqT26IIf904xF?=
 =?iso-8859-1?Q?n7xm/WOjGerG8tu9aSuQMbieMQ+bDo63ATvbYV2weQGlT+koBC1O0g1SDd?=
 =?iso-8859-1?Q?dDReurmPSZAE8f+rUjC23FsRicPBVAgPOSKXMOEIAIHYKKhmiOx/owe3qp?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UpNQT+2dR3D2mzF6alBiTUG3UcWbV+E371Og449zfB8NMKBtFLOQ56XAqu?=
 =?iso-8859-1?Q?YNqOlxf11S1fXASFolwAhmmmHKjOP4VmgJNABZZiHUQgeke1uCk/piamJm?=
 =?iso-8859-1?Q?qXCJmbkTv+bGuEWPfkPDWk2oRBGcah20Lhlbg6PXcH+brOzhljXuwazaNH?=
 =?iso-8859-1?Q?6MzRcP0SXocpxqIQ6jrpXhq7cvB8QGT18uJf6YB095qeWJ3j31Y2YDIrKx?=
 =?iso-8859-1?Q?79mdInzKU6ej7xNV4PVlnhYlkktH4ciLMKRCuLthuCUnByKAu9AjJJqUvu?=
 =?iso-8859-1?Q?iMYK6UyJd4ocawQ43WJEKkZMtzBzu+jzdBNxLTHnZTqTSdVnNR28wTPBSw?=
 =?iso-8859-1?Q?eYivIClX976fKMBEOgSUgQwnoMsJjpQYJe73zo/S12V3jroIqw/HXbP5fw?=
 =?iso-8859-1?Q?SWSS+s4EmmaPRVlpph7p+cVBn5F957yIhzQVhOb9UH/hYNQPJ37nypazi0?=
 =?iso-8859-1?Q?zPrWA+W3GacOUkvfaB6lNE4fwvrlDZ9S26CG8QpABdgxW/6fUEzn7BO5D/?=
 =?iso-8859-1?Q?DcfZvlLhvICRXXBamvv+CoUYaCvx5YWdnDwhmbUnt+vdhrh7kckqbcj/UH?=
 =?iso-8859-1?Q?oAoluTI3HpUHire5jxEnMgnA1WKRU1SWypibb2Ln5UqmIuIHJmmZjnba0u?=
 =?iso-8859-1?Q?vT6uhwJ8G7p7b+Xr1YWIH7KbhV7QArKP6Lv9VLfIC5+JhrxPzwx80RfhY6?=
 =?iso-8859-1?Q?7gksigttVvGWYitr+oMcoY3muNJmMLerdZek3ykcOyDydiP6NBW+IRUSEs?=
 =?iso-8859-1?Q?yGQvPjY19ivb5jizklznGb4+fDpPcX4RFy52gvd0lavRG4WvGhka9EH/B8?=
 =?iso-8859-1?Q?o8LVrH9aQqQXZ53RCfJyB46ZYCUVV88iK86ZsbVw5iCDhivgGxiE9bMgzz?=
 =?iso-8859-1?Q?aX5flUKNuPLLHRx1PDNfaVtYyuShQ22779x6mRzXSWeCS8d7qsQN9nS1yt?=
 =?iso-8859-1?Q?YU4KysOkZyx8uVHb4CfeQJQ23bvUPW5kfFrasqAmxcu2Z9KImduyYS8HjR?=
 =?iso-8859-1?Q?3evtCsfMZA497svqCw4cORkOPFcGzW4zLJdec54I6JI6TU6ijx7Qb9qak5?=
 =?iso-8859-1?Q?P7icSbV5X6T7akDcno7RukTkqNmkVoItGv8q0afQjbb5pgOZSeNxcuift6?=
 =?iso-8859-1?Q?mAGCVXTaQW0cO3y1wSyiiRpayDgSJbhFvy9Yc2tR7LfdCLAAoiMgbLWVY2?=
 =?iso-8859-1?Q?xLbPs2hq8q3mYWIb3+MNyinN4UhF9FYUd4UdqhUpKxDZxrtY9e6zmX5Vhh?=
 =?iso-8859-1?Q?ihCp0tVu2SA6AXwBh8uikyqSqLwWS8YFEwSMziHyRc5Cv7Pipu7fXZ67+h?=
 =?iso-8859-1?Q?bc0DZHg0JlrbMFbqfggMLghJJFH0XTZLXvcdFkDwxgEv16k8L3Lsasd83l?=
 =?iso-8859-1?Q?Oh89rR+prZcGeqTaMF+AiPeTErunrRKZVgAXZHuVLNiEvaKzobiMpRdaHZ?=
 =?iso-8859-1?Q?6sneEvRcukg1xGWC/zCrO4zrB+yP7vwNCjiWY2IZ0YGfbenlFMu7RVG5vR?=
 =?iso-8859-1?Q?IOjCsbP7PXyp9C3qaR7V6mD/qT6NPgOnnxwaM8+PmDKT4fF/eWP5AylqpY?=
 =?iso-8859-1?Q?6w6AmBsu+u3BtEO6VfIjyZV0p+ipdzgngNoXkNN9+V2u38AIOrC1zL1VRN?=
 =?iso-8859-1?Q?3t3DOVAhWA6MR/7hmb8MCvgaPEkg8GUp8qxp7JUINkd5gP5kp8glK23A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: iuWVnz85SVe2O7JHKbtTZlrW3DwjHhvftcJtSp1WsQb0VQv9mkKBH8fTEbc58EMLAWgGex3itkV+BE97rcJ7zLGBvsZWjIk9tUYP4AVWbRaHwr5OAoGsleLIlAt5um/0u2UHgVuz+z+jC9BkXsHT+4/niEEE9w8t1cm6RBQZemAaZqwYN5TW0OUGE/8a5eN9YKtOBHSQhxNYM3I1PSuTMYtJOnQy4F5aYviUyeZiWs8QZWdwYl/BtTKqLMVnMyy3TO5px3rYGzLc1Op/f29Yr1lX1PGZrFm+Lok7DPalwf4izD1jGWcDefjHV166SYTrbQUAqylY1VFTzUDnNeqKfjTp9BSDabgxyIFRCij9dMHEIkw2I70vDxtJ3G0PFv6Ts615FVDhLWMew1riCooAxwV5yzWUOEwWdF7BI2WA6qQ3CF83T5iPBNkIZqatJ0BDdi2dzcIUQxFgd//RXVMav0GZ1Tq9Y2rxWAdNFaqtFvCZhs72FzN1ex7v6yzCTfRFIsOGRQaLudIybhH28J2vr85bymW7kxhAc49UgNGg1j3OajEKaQlu7aP3OlvHsgXT+Hxccd55tnhiceLx5k1Lf7/kBCH8FyQPAmj2GQlSF8E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb8d9f2-4cf2-4dea-62a5-08dde09379cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 09:16:56.5341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFphe0W6FeDRFU5sPnubOWa8cVaaTE6xlpA4ftiuPzJmbnacMyBT7nRuBncpk4ImUiJB1X5UNlUZN7blGNgKGLMptK5oDtb/bRxQgs6CA80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7850
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=950
 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508210072
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NyBTYWx0ZWRfX0o1A0w+HpPTU
 3GKEe812zJMjmGC6Spv+lQJHyXbO7fwqDiEYWG1WvIirT+sAvT+WA9CTX907HiFaE5ztOtAVxnT
 XhSXGvwGT8I8Sq6KgHC3C16pmlAjZeU++4x1o0qvLg2b6tHDtCiG43ZIXiMgZaowslC1/we/rqH
 cURoRXP6tHLgvgFFwLLo9j/1lAB3XK+ab2vvnG65TsQKVbURqICRfRSsJrueC9wEf4G3YDju4qH
 JLOGdf3YGNOfVPObstKNtXIyceLtYu0j4kOgtw0c6QOW2GjVvjm3xtp33qtr8jMF+pcuU8oiM/R
 TlVTmCqjswntQ/knPKRNuuChbn5EPOrv37CFVqNtex2+pyNfhb+Oe+cc50mYKeiXnjjr0k1MkCg
 4RgooXI1lnbeidLAcyTLx1lOXCgw7Q==
X-Proofpoint-GUID: _7r3uL9rsuBMbHJhiopNLYDK0M6Xm6VZ
X-Proofpoint-ORIG-GUID: _7r3uL9rsuBMbHJhiopNLYDK0M6Xm6VZ
X-Authority-Analysis: v=2.4 cv=V94kEeni c=1 sm=1 tr=0 ts=68a6e40c b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=g1ruWK-PMPiBxAydvZ8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
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

+cc Liam as he's also had some fun with PAT in the past.

On Wed, Aug 20, 2025 at 05:23:07PM +0200, David Hildenbrand wrote:
> CCing Lorenzo
>
> On 20.08.25 16:33, Christian König wrote:
> > Hi everyone,
> >
> > sorry for CCing so many people, but that rabbit hole turned out to be
> > deeper than originally thought.
> >
> > TTM always had problems with UC/WC mappings on 32bit systems and drivers
> > often had to revert to hacks like using GFP_DMA32 to get things working
> > while having no rational explanation why that helped (see the TTM AGP,
> > radeon and nouveau driver code for that).
> >
> > It turned out that the PAT implementation we use on x86 not only enforces
> > the same caching attributes for pages in the linear kernel mapping, but
> > also for highmem pages through a separate R/B tree.

Obviously this aspect is on the PAT guys.

PAT has caused some concerns for us in mm before, cf. David's series at [0].

[0]:https://lore.kernel.org/linux-mm/20250512123424.637989-1-david@redhat.com/

> >
> > That was unexpected and TTM never updated that R/B tree for highmem pages,
> > so the function pgprot_set_cachemode() just overwrote the caching
> > attributes drivers passed in to vmf_insert_pfn_prot() and that essentially
> > caused all kind of random trouble.
> >
> > An R/B tree is potentially not a good data structure to hold thousands if
> > not millions of different attributes for each page, so updating that is
> > probably not the way to solve this issue.
> >
> > Thomas pointed out that the i915 driver is using apply_page_range()
> > instead of vmf_insert_pfn_prot() to circumvent the PAT implementation and
> > just fill in the page tables with what the driver things is the right
> > caching attribute.
>
> I assume you mean apply_to_page_range() -- same issue in patch subjects.
>
> Oh this sounds horrible. Why oh why do we have these hacks in core-mm and
> have drivers abuse them :(

Yeah this is not intended behaviour and I actually think we should not permit
this at all. In fact I think we should un-export this.

I think the hold up with it is xen, as the only other users are arch code.

Probably we need to find a new interface just for xen and provide that just for
them...

>
> Honestly, apply_to_pte_range() is just the entry in doing all kinds of weird
> crap to page tables because "you know better".

Yes. This is just not permitted for general driver usage and is an abuse of the
mm API really. Esp. when the underlying issue is not to do with core mm...

>
> All the sanity checks from vmf_insert_pfn(), gone.
>
> Can we please fix the underlying issue properly?

Yes, PLEASE.

>
> --
> Cheers
>
> David / dhildenb
>

I will add this xen/apply_to_page_range() thing to my TODOs, which atm
would invovle changing these drivers to use vmf_insert_pfn_prot() instead.

So ideally we'll have addressed the underlying issue before I get to this,
because this really really shouldn't be something we allow drivers to use
generally.

Cheers, Lorenzo
