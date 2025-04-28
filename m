Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8732AA9F570
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DFB10E619;
	Mon, 28 Apr 2025 16:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="X7yie/gk";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wCXYLup5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618AD10E5F8;
 Mon, 28 Apr 2025 16:17:11 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SFqITj029942;
 Mon, 28 Apr 2025 16:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=706/im1O6+Zdfg+V/8
 KJWRmdB5/EF/EjLu5usP6LVck=; b=X7yie/gkLUm5OpbiIjWtigCl6hfDlzA+he
 PaPm7S3I4wjV5KZFKW8COHk/SPdFxsstcMQ2DNQsPX7cqUa7q0xJyzbFMLv7hRPU
 MsnzkcV312oW11Df1fPRzJWm9HbkiOdCCiL1Q7+ELf2r/hqMKYAPWePfnO8tPkuH
 znNOJyESHJv3ZdUvrhMUQ4k2HQWEKs2ReCuXspYFTSeyVdfqhy8EHAODxxQrPbz7
 +SofNDCnaUFVppxXUEnDUn+6/ROwuOqoC5T16+Z1kczUwIrQarNspBfZ1dgw1nou
 +XtrN4xMlcX8g75wqTNHgLCOk0+G1tWmxUisNYhssfa8phuGsEtg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46acphg2hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 16:16:38 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SFge7K003870; Mon, 28 Apr 2025 16:16:37 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazlp17012039.outbound.protection.outlook.com [40.93.6.39])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 468nx8nc9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 16:16:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlLwaiOQ7ACYjrX2bm61YUlsmjCCn1jg53WTALw0nj7VGVqt/27ecaaBTzMyfmYB0Y31Djnp2FqgLBRbxUcXp/sQx2yUzpKRhA/9u91UepTBpo+FWCWUNUs2I10sA4UUE/dmO+c/UpbG3DQe1V1Vwy/28fDfkZg7WT+XrNxKXkm4dWcyceFsHILPbKYdZU7qPQTMls/lbpYBqLyRfOg6VrGl+Tlu37XIuxXvp6nPWmLig70VcwKBr2MyRPyCH5ymP3okL7ilkLTuoJAOyiaoFkMKZUq8yNW4ARdQPHtVep9vJTKvRttXNsC8z9ErO1kRJuQf9UzTnu6qK4Z9jw7GZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=706/im1O6+Zdfg+V/8KJWRmdB5/EF/EjLu5usP6LVck=;
 b=X/YSpg90hoh9i73m9+/qjgoykE0jLhGHedZimFzZwTwO1/in24D2xWwuH6HoxjUNs8vNwDUeSrQvw3svIvV9bQgtjua27OXRg8NVXDQgVFmF7O68bX1JYLwjpkZURXj4CScat07hSluSL8ShXjK4IuezeJ/k6JXQWSHhtDmBHrhaQBf7SRVix8taPUqEN0l8ttg7cZhhav8Ul+kZRcbbCrK4g/A//ruMOFtH/mu23O1qlemvNmRG8MWcf6usIUZeG28sSW1Y+uvsHIJOtnJO+jmDWMnR8VDGLuSqRq5/+1D58gw3k1ekbi2vrF0lm2W0LqfYpLd9xIO3mjECl79YiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=706/im1O6+Zdfg+V/8KJWRmdB5/EF/EjLu5usP6LVck=;
 b=wCXYLup5mVYlyasxDfQV6D4Fwd2pj92ui6rC8MBbTqaNnra9vzYr82Cb12kZNbqSux5tY7HdHZPcvvosqQo9b1S5JhKKWxk0cUg5Hgn7TuL2VMBmFCx1zjSQUUEcfmOzwa7ovUyDXmebgbNpIJF6TtdYCWJcmGlttu3HVGAdg7I=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB5902.namprd10.prod.outlook.com (2603:10b6:8:86::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33; Mon, 28 Apr 2025 16:16:27 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 16:16:27 +0000
Date: Mon, 28 Apr 2025 17:16:24 +0100
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
Subject: Re: [PATCH v1 01/11] x86/mm/pat: factor out setting cachemode into
 pgprot_set_cachemode()
Message-ID: <da28d743-8622-46fc-aa60-5db9c776bd87@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-2-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425081715.1341199-2-david@redhat.com>
X-ClientProxiedBy: LO2P265CA0218.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c3fefd-b664-4251-2935-08dd86700711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cagVVQqf38bHCHsziJa3Xaz61ZqBvy74ltgPUT8CB71PPkHK0u97VLVZLCVN?=
 =?us-ascii?Q?dF9ySpdUrc3/KTXOo5+/6pXhfdCwBk71FrSxWgxPOJ0RHv2ixN+WW70ZcBZz?=
 =?us-ascii?Q?qbxBlqP71cNdXd2aBTDU8Jhe7aDXQsNngTTcGen0XojBi7YXgPG0HsN6iQFO?=
 =?us-ascii?Q?djyHVqbio8EsZQJEspMUm1XOtcTAFdwu1kONhBDsiOjVG1UZUE8kb5yHlAa3?=
 =?us-ascii?Q?3ECFF816jBZra0WGvvq1oEUwG5D472Shod8DA3FedFfO4cRtSLGi0bJPhuh5?=
 =?us-ascii?Q?5vDMvkLqhxDsYeBWV5VP6jVuwhVdngXWy/72LhZoKV1oPIL6qaLUSAUdMvkv?=
 =?us-ascii?Q?7k8fPs9t8clIRsNxPDqJvF+SoH4ALENtJ1eBlMjweIIN7bnRgHL5FWCeCtqK?=
 =?us-ascii?Q?PI0dfndzPZM0A09mxMTOgR/F1G5n0TMpPirXFL4utJcN6pkx7WjFfzoKu46C?=
 =?us-ascii?Q?bS/3v3LsWxsaL5UwKib8hCUdtmWhb//iUQIauFNGjlSLt0MkiRpCx7JnDwz9?=
 =?us-ascii?Q?B0+cg7bTYG6/cxA3vCHX4KCqyCVvfUua6k1Xo5flE+0clRckU8oNuCJJdi1s?=
 =?us-ascii?Q?8zKfl5awRj1pKN6NPYfaGtWimxiVdXS/GcRoL+S2bnCLJ+p13GSg9ZavvBTJ?=
 =?us-ascii?Q?Yk/eueT18G3wIbo1nFHWL20nr+UOifEKJknC+u2zEw4z/vuZk4iXcQdJrCyv?=
 =?us-ascii?Q?3GOxz067IoQ8/38j9XLi8C5z7nfhoRIfElGlj87qlbZ7oXNBkJki/UTIu+o8?=
 =?us-ascii?Q?YaVzFW/Jx+BM2PAoHddbbR+MtM3twl4csAdLPUrPGDLL5yTG4gsrMT0o/HtN?=
 =?us-ascii?Q?RLgIyg+qSVoit0SSSs1duahNMTqTJRTC5umtTymsGKEWAWEsEuQ2+yuZ0N5V?=
 =?us-ascii?Q?ca8g2fpgJ3F5E4AcTW5D3n7sMR9uMk6oI5fBEnsPm8nzlTCACJRNAKe99eI1?=
 =?us-ascii?Q?HMjIOTtrv2Jp584T5nQ6MlWOgZCLlDG8NO9YJxT58iwxKkFUHjSkQFPVtwDp?=
 =?us-ascii?Q?Ldws/XVhqI2wmO8YRFufF9xduZVJFMcBTykNruwfHorjTRQ0w2ceaSxosF7y?=
 =?us-ascii?Q?cQ9jLkwMU0eRXWAveB8L3l1ROPOhS/tMGEPJccO3k8LpmcyDLG7RPtdh5jt6?=
 =?us-ascii?Q?dDFU8RQh+I8Gis6ZO2zJGDYgAmw8WYta83wv0QwbrPEnfVrTGjvX8/TdoKgQ?=
 =?us-ascii?Q?AfTKB6wYOjDDaHOdksasMxtwaOBjAfPrpIPGOiVz6cYtsQUm2eirJVDepV+F?=
 =?us-ascii?Q?yqqqxtq2XLztw+ThBBl1W/IP8wBtaQe8c1hSuGjhoAb5dw+uiHTuPHBmAn29?=
 =?us-ascii?Q?hhKRnWw95xyMePIgnD253SJKZoinNCCl48/jUEhH85bOcqDm/3Ufb/Rj+0/X?=
 =?us-ascii?Q?ilmc6rYHWiNx5fE6bDVLtxgUmX7/AVCDegW7hY42xkkZRq+awk+XlqLkA9Li?=
 =?us-ascii?Q?V4ig0Mrmh94=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g++xg9/6Idg0R7mORXjwKGN91YhyZJ77vGgOYZrpfaWb1Ct0kcITftlJq61p?=
 =?us-ascii?Q?hU9NfwnktjNtTyJx14A45oLY+LQReIAHnYlHx/xoiHi3swhGyGwOWq8quttD?=
 =?us-ascii?Q?B96uRM6/ee9l8nVpKyD013Aqt4nomtcdFBPHBPRUPF5s/rXNuIy5F9RDvsWu?=
 =?us-ascii?Q?stM8S14zSeGNcz7SQ94XPN+FZcESszM1oQV5w/9tpHCYM/yJcLo8lXzazxYo?=
 =?us-ascii?Q?2yL8bJp4KMvOhtURfReMXSQnfUCWpWAwJrAPp4LjiEdbmVy03l8P7TaY704y?=
 =?us-ascii?Q?Ar0MkiVFQhyE9bOE+E6Q58kcXT38rS8ZoP0D4F8okMae/ywC2+8lNAYz0nO+?=
 =?us-ascii?Q?7hFJLIR56AtnV/ZttrfMgZhkCqLOYk9JBkzSP5ROTm5Yv2eSK8royZWPC5me?=
 =?us-ascii?Q?5vfAki7HGGq5/7k0OPN/NKhcmtwFHx/pKDF2B6Cs805BHfzjF0cy8B1Cg2PB?=
 =?us-ascii?Q?SaNjUIT1Po4Qf2FOvPfC3Tvj9GdR3io1zcG/O9Uw0j11wWlFVS0aIlXoHVAQ?=
 =?us-ascii?Q?dnOSCFDIRb+VVonjhnZBMU+yCGevNn/Z4W4D38lCgvzqD/lzM0YM+Fw3dwRZ?=
 =?us-ascii?Q?v/FBQkcnKNV7odQ5w15XkSyAh63z6FSKTBtsdJv+XGYVcP+0Dbm8jqGQ78kN?=
 =?us-ascii?Q?V6Ftis+4o8/CdW7GbdX/AoK8HNAqdxiMAn+JLpk/vh4KDrOnACSuFm81NGWX?=
 =?us-ascii?Q?i9jYhUbm+9smXVXuk8t2mE+zVYNWa+6yS3mgV3lLwZOSqWqplc0k0P7hGjv/?=
 =?us-ascii?Q?2uxxChHMZuDU0NWUK37kQB4bupwHKO8t2Ncy3xtwrnllD2kfElNawECmAyGn?=
 =?us-ascii?Q?wH5zzK+YLH1yS4CpmZIRnRV8r07JjcoycVqvj6gyIZmjrPz/gmHAqSAeJYZy?=
 =?us-ascii?Q?Ps+Nhe29qIMFyTViWHpzAnmAtJOZR6OBuFC2Sqb1Kib5lPKUsRsHVS8uNGNf?=
 =?us-ascii?Q?NSSRyViV9vEac0SwqKx/tZsUqmJWGa/LYVlEgKpcwHLyzHRCImFCzkLxOdNI?=
 =?us-ascii?Q?G3IFx2Y+Y4XvMkeyLR3NaPKcWsHDT8WThSaH7PPNQXTngDT0Y2DKINeVE8LU?=
 =?us-ascii?Q?WzeA0PZ8tNRfmatBcs2o/+5WOTw8h6bGiEkcmwh9gcgmhK1ahKhoBZNIyUWS?=
 =?us-ascii?Q?VWWE2+aqOSNXffR5l4ucYT8tywH8x2EJ2Egp2iXB16BaCPYKo5MjS7S3lOqH?=
 =?us-ascii?Q?Wz7S4678VmBE69ul/WuP9E2TlmhxFk+Gt928y/CbIJUyqGV7ltkdJN87va9D?=
 =?us-ascii?Q?vB8D4/KoXTfG6aV7Be4VyQ4PICaRKMhNzQbX5DRcAglZBowxdxbcV/G7QBhK?=
 =?us-ascii?Q?SVE7zAEUzEpDuW1ry7/K9XNEj285/poIGXFQzCsw/p/cX7tGkGd7rCTP3e6Z?=
 =?us-ascii?Q?B4JwbUiHL8L/qR4IQtG4/VRn7YFRhea6fhPuXprj6/udD+EOWaTpFcUQmKRA?=
 =?us-ascii?Q?Lv5LddZyCBKX0FA2oN2+mC3ocq2IrLyndeQz5+oCRkY/0LglRz1x8Kdtn4Dt?=
 =?us-ascii?Q?dJe34mIDKq2jyzh7QMDAadz/kwQ9SXby6N/6Infxt99ggFfPpPeurmnLg3RV?=
 =?us-ascii?Q?Md1zfuzylZ3IGmoI7tEtmBkXDnC5X+VhyDIy71Ni8sGvDj9Vq+szHqIYANhK?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: M+lLt43fdXipfRIlH3LdC4gU3ySvW90BJibETAbZC/dG5hDt9jd7MLy9j6HzEW791gSHfl11KiAtp8nURNhYD41WGT2CFvjOpmjxizON7xaOxDpx/O7AEhGorYqBbar4bD0U9aY3n33B3JxVrYNNlZU+bugG4VpnDGeO0bXdyNaBp+ukOj4hyIbguyGhG1XZ7eWuDKj4C6KCgmNyc/pMGwz20Hw62x3T3q4KnEJ3eg+fgoP8EBehL9FzNNaWsT4VmDBXLftlclCehy8BPHVv1QYcD+fl9oxYOJDi6gp/X4qqJ5U29VKCnoKPaLAMDPQ0WuVaDWhwzGPTuqBahE1LFXqlrRgNs73qCyjE9YF9adLaroH7ChyhgfSgGSI7RYfE1Gpnpmr/t4qgYYfqkw6S0l2k5q/w5pG/cuGyu6RcYVQk+mI85cZqIi2lh8AeXUG5y6HhkRkHqpYwevs+qjGVVBD5wM+LSiZ6GrL18BZG7jKn/EmQYefwizIxPYBmvFcB2lWbT6HqI5H1FWthD678KvruwDkv1A9yVDikMWWStIg0Ijv1L15FEaty7P8+olzEFCU8KYxi8TzXCpdmjl0ISs+MU/KBQjbLVapOc3ObdGw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c3fefd-b664-4251-2935-08dd86700711
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 16:16:27.0318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IvanaFJYGItI0CQz/C5CbWbBexJOo74qeFskAnYHLHz87nnFFtP2SZEJsumle8Y/EU7+paTGE3sG7i3nKVQoccuEa77Qmu1DsOMfH/rxyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5902
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504280133
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzMyBTYWx0ZWRfX6WPumLvs84F9
 SZ/r59iNZjjIbrTIEcgc9sRKCslLQ6nun1wQLKVDMVPYykhAkiUKFCRoHn5cMfkGrwMiQIV6ZAZ
 by7UGK5gUz/+zJDfoX4cwxs6/h/shMXGIvpoa7USRjbJ/xPEwCX2ez+5cI8Pj2eZQN4N92KM9Ct
 1a/60JnBpCbG14ce8Hut8FQvmsXHdWd90e/Fc/+V24LXq6FDjJ/TG+gHSc6gQDB5Ue7rC/9fDMb
 Wf2AG1XKaU1Fd+TQgG/aTVO9evBO/F2AeWL9H6+5y+vb0ia5trkueIZqDg4atQqrmsvLMH5pqYR
 QcwWkPeI3vmjl8EDVc1v1Hzs2VhGebrfDjQVcfgh5BrRZST7ZOs+iAjUs1MQREXEmby9NOCJaAN
 ZyeiiKwG
X-Proofpoint-GUID: HJKMDhkJm-7Hs9qwZ3HQRBMXOD3HwwgG
X-Proofpoint-ORIG-GUID: HJKMDhkJm-7Hs9qwZ3HQRBMXOD3HwwgG
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

On Fri, Apr 25, 2025 at 10:17:05AM +0200, David Hildenbrand wrote:
> Let's factor it out to make the code easier to grasp.
>
> Use it also in pgprot_writecombine()/pgprot_writethrough() where
> clearing the old cachemode might not be required, but given that we are
> already doing a function call, no need to care about this
> micro-optimization.

Ah my kind of patch :)

>
> Signed-off-by: David Hildenbrand <david@redhat.com>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  arch/x86/mm/pat/memtype.c | 33 +++++++++++++++------------------
>  1 file changed, 15 insertions(+), 18 deletions(-)
>
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index 72d8cbc611583..edec5859651d6 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -800,6 +800,12 @@ static inline int range_is_allowed(unsigned long pfn, unsigned long size)
>  }
>  #endif /* CONFIG_STRICT_DEVMEM */
>
> +static inline void pgprot_set_cachemode(pgprot_t *prot, enum page_cache_mode pcm)
> +{
> +	*prot = __pgprot((pgprot_val(*prot) & ~_PAGE_CACHE_MASK) |
> +			 cachemode2protval(pcm));
> +}
> +
>  int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
>  				unsigned long size, pgprot_t *vma_prot)
>  {
> @@ -811,8 +817,7 @@ int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
>  	if (file->f_flags & O_DSYNC)
>  		pcm = _PAGE_CACHE_MODE_UC_MINUS;
>
> -	*vma_prot = __pgprot((pgprot_val(*vma_prot) & ~_PAGE_CACHE_MASK) |
> -			     cachemode2protval(pcm));
> +	pgprot_set_cachemode(vma_prot, pcm);
>  	return 1;
>  }
>
> @@ -880,9 +885,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
>  				(unsigned long long)paddr,
>  				(unsigned long long)(paddr + size - 1),
>  				cattr_name(pcm));
> -			*vma_prot = __pgprot((pgprot_val(*vma_prot) &
> -					     (~_PAGE_CACHE_MASK)) |
> -					     cachemode2protval(pcm));
> +			pgprot_set_cachemode(vma_prot, pcm);
>  		}
>  		return 0;
>  	}
> @@ -907,9 +910,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
>  		 * We allow returning different type than the one requested in
>  		 * non strict case.
>  		 */
> -		*vma_prot = __pgprot((pgprot_val(*vma_prot) &
> -				      (~_PAGE_CACHE_MASK)) |
> -				     cachemode2protval(pcm));
> +		pgprot_set_cachemode(vma_prot, pcm);
>  	}
>
>  	if (memtype_kernel_map_sync(paddr, size, pcm) < 0) {
> @@ -1060,9 +1061,7 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>  			return -EINVAL;
>  	}
>
> -	*prot = __pgprot((pgprot_val(*prot) & (~_PAGE_CACHE_MASK)) |
> -			 cachemode2protval(pcm));
> -
> +	pgprot_set_cachemode(prot, pcm);
>  	return 0;
>  }
>
> @@ -1073,10 +1072,8 @@ void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
>  	if (!pat_enabled())
>  		return;
>
> -	/* Set prot based on lookup */

We're losing a comment here but who cares, it's obvious what's happening.

>  	pcm = lookup_memtype(pfn_t_to_phys(pfn));
> -	*prot = __pgprot((pgprot_val(*prot) & (~_PAGE_CACHE_MASK)) |
> -			 cachemode2protval(pcm));
> +	pgprot_set_cachemode(prot, pcm);
>  }
>
>  /*
> @@ -1115,15 +1112,15 @@ void untrack_pfn_clear(struct vm_area_struct *vma)
>
>  pgprot_t pgprot_writecombine(pgprot_t prot)
>  {
> -	return __pgprot(pgprot_val(prot) |
> -				cachemode2protval(_PAGE_CACHE_MODE_WC));
> +	pgprot_set_cachemode(&prot, _PAGE_CACHE_MODE_WC);
> +	return prot;
>  }
>  EXPORT_SYMBOL_GPL(pgprot_writecombine);
>
>  pgprot_t pgprot_writethrough(pgprot_t prot)
>  {
> -	return __pgprot(pgprot_val(prot) |
> -				cachemode2protval(_PAGE_CACHE_MODE_WT));
> +	pgprot_set_cachemode(&prot, _PAGE_CACHE_MODE_WT);
> +	return prot;
>  }
>  EXPORT_SYMBOL_GPL(pgprot_writethrough);
>
> --
> 2.49.0
>
