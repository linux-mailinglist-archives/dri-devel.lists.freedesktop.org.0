Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678A7A9F526
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B10B10E3E1;
	Mon, 28 Apr 2025 16:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="MAYDRn3i";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RiyBbf4s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE1F10E3E1;
 Mon, 28 Apr 2025 16:07:38 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SG2adP007826;
 Mon, 28 Apr 2025 16:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=uaLyvKMTZHYsVDygiZ
 hwb/o4ShaZ2+BscxsC44CBqGQ=; b=MAYDRn3ifiWC/gti57CApcRLs/5sCMfyNm
 cQU54uPvoYwjsUxXsCF0nts6UH4b0cHxoqW2rzvbnk0vGK37p38CN9lDPNeWXoal
 UG3dyrH+6EAyIyx0ptXnJWpsc/FXbuOshZp/9NWG6whdJuUHCpU6eYoebvA2wCgW
 ZHn3SBCs9CrfvpgzfR+2ogOPr48f5srWRzJpSOkcm67S0a8OyIA1OF/cYJ6vvLKO
 bcH28gQULNevytK3ilhxUybQ3nI/pjhMKWFpI2B8Tjb2BEZO0VC6QD/TS/HbnGBb
 5sgB9z5yjqbD749QeO+JvGHCpRz7au1Kd9vVqashwfKvGPwtbxcg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46acu980bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 16:06:59 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SG2BGX028457; Mon, 28 Apr 2025 16:06:52 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazlp17013075.outbound.protection.outlook.com [40.93.6.75])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 468nx8mc26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 16:06:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSAuEjfeUNBCOnVpkUhUTkfCUuHRv2Wi6XEr0Oi7PmgzdtziWri+OJ7HofmVPIJSEXY6sgRuiTpl8rqEiiRb6hR1gcTiMpdLNKYG0c/f12Kn7t7XN0AJMsQrmPvFvuiAyrUF5Lwsnyy2sFLRjVEEEO7Om/FNPmXpOCsh7ERYm6bAGAkDJ5rnM2n9LJcawzfMHZWeqlc/UzpTehgXj84SpltUXrImUCJJRkbGC1bX89JlRIEUhhrUCbI/Qo3cMBNte2zB2e34Xd8wR3lzruP2QvffqqDKnm+fEn9yeKjTtbA1oboq4bWpomwu0xUcAFdU50Guvqj55BJhRRhBtK0nAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaLyvKMTZHYsVDygiZhwb/o4ShaZ2+BscxsC44CBqGQ=;
 b=O0BUQODGqclktxq4745FwnM2KywxUQ79Hwn8bsUr/PvrewRvBuL4+3ldo2eFvnAPXPh9Nhttn7rO1ueXNPGyz9knhe4tuCv8m1xifutdLaPRqf2GyUxl5Xz8EhE6lkNfVdZW5TV6mr4yH4hkj64XHX49fCzdMEly4/avSH9IOg8Zqxf/Y4R7nWwXUJrnjwg2uGP6vROs+okfJ8LA4dZLB9UwWEW1RuXvH5vSzxPHapp8g01dBNrLFYTmgBuLGMyAlJqFLvuUM8hcsGsOFPfaFzwrE+l3oQvX5sd/XFeVvOnVb6q2ES1NVdIyVfgoerfeXCBVWuLBNCLr5/FP8s935A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaLyvKMTZHYsVDygiZhwb/o4ShaZ2+BscxsC44CBqGQ=;
 b=RiyBbf4sP1LkDh2UnqXCy9kcI8huffGL4V7IFhMVdSKHYkrxEFSDF4OC+S9OwvBJEoWk7e47+f4i1uzeAgQdzcR8k7D2VlApTwK56ImnAVQTtssDX5OemXs6Ri4KLk5eltMdha9yotJq8JtSEqhtYCAzK8Q1cnydf6UmJozBdIw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB7425.namprd10.prod.outlook.com (2603:10b6:8:180::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 28 Apr
 2025 16:06:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 16:06:44 +0000
Date: Mon, 28 Apr 2025 17:06:40 +0100
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
Subject: Re: [PATCH v1 11/11] mm/io-mapping: track_pfn() -> "pfnmap tracking"
Message-ID: <07a780ee-b2fa-4eb3-a340-175d7c18a0fe@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-12-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425081715.1341199-12-david@redhat.com>
X-ClientProxiedBy: LO4P265CA0142.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: db4af0ac-ffec-4c0c-d798-08dd866eab91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BhGqyicJNR0HS7KCyRj8lV4bxjVUxXJhnI0s9ErPrhIw+q1gCyrOA3GI10Hf?=
 =?us-ascii?Q?Hh2TPoYxEptnOv1ZHfrgkrE1XQQKXfxnr9iecQrBhKhkmgR6+pwlQCahOjF/?=
 =?us-ascii?Q?eaeWIvWXKi9b1fue0960ciafYfjHX29xly7CzcohaW8bfAb8vMqT3/kCgoFM?=
 =?us-ascii?Q?PGyZXt78UYr6L3ySBfncS+M1WrcujQkfATUzBbdVDRb0+jECpEgyJ6gERFjw?=
 =?us-ascii?Q?Q4Hf2zZcML5EeOzqUphTzuAm1gZDOQLubbyrPNY2A4f+qn/u999VGE+4QsBQ?=
 =?us-ascii?Q?fPSMfzPe9PpmwFSRb9AwpVVdlhnnHx9HRTj5IxnLkRa3V0I49gE4T5Lp5MeP?=
 =?us-ascii?Q?szNf9NxvdlWxyK9Ylplg3exDbB6OlH3AkBi0ChspmXJ7XzSl/D+uN7b7JbFs?=
 =?us-ascii?Q?Nh26si3+53sWr65+54VAC7ExAuR1ss46AgNus20ogOsAF45xF2ZIOr5TzrAU?=
 =?us-ascii?Q?YfMJTdcEpCFgCrAUmnIydYoWPORcB/uz4+57fi2UCO+y0qm0qxDlUnlujtIo?=
 =?us-ascii?Q?cBoX0E0ULH2W6R7A5ynFzSZgn7ySbuwO96RhX3XxxOrGC2ZW0ob7Et8qwvNJ?=
 =?us-ascii?Q?jnzD8ObwjagUvhJP+AUDsUY1x1yq/HpsfMZ2fheuSUdLA2Q+l6mxYWUPQdcX?=
 =?us-ascii?Q?DeYBgkHqvbki6FP47HoMIxipB/M2F3tSL/9n7IojIb4kVDJEq197WVc/Wl3E?=
 =?us-ascii?Q?QsoaiHHIB55YnU5TbZjh5kDHhUol1U6Z49TBgSgkF4Jl1BCbaR89614tknp8?=
 =?us-ascii?Q?INw4owxMuhPU3Wu1fagF9zVo6DmkT3+OBDmJJwGdiTVhoMscB9xL1peKixi5?=
 =?us-ascii?Q?zEVgeIBdzUwZN7udyW5GLm1LnIc7gR4YDUkhAgdoSXG7QtVFV+abQjDP7Ke+?=
 =?us-ascii?Q?Gd21MXA3hTwlUgJQsb1u/HhmegUP//Y7t4+ALaVfRnvCIC+76Cgz9Hri3X9R?=
 =?us-ascii?Q?OBbl2vu3RJCueL1TPGC+KNp9zuHmh1wSZMdQ5VFkjsXi1eGbB7XSazG+eyNb?=
 =?us-ascii?Q?6a/yDqXAO9NtTFJaqZee7jezqmvihXQC0d8yFl9iV7xiA67hGgEBU0QuCnBF?=
 =?us-ascii?Q?vCTOPxUacQXGmrAwYuniGvVVAonoqyU2nlq43LRlSWpqlUfrslvwlBL/lHxb?=
 =?us-ascii?Q?LEfaPjE0pHmwtW/s09mL/F7dX4TqYK65zDE4vu+++qN+z9zV9JQlChiuONbm?=
 =?us-ascii?Q?cf63qXoSgwnHeyrJ2Tu8dUrCHpAyxMQUN4wZZZmmd1Ifs6W0bbXhx6xXyhZA?=
 =?us-ascii?Q?P3Ne67OB7YQBrwwZQ1IJ0l8gTj8RDGZ4vp1t2faPrppd3eWYTfOZz2PeZHIg?=
 =?us-ascii?Q?A0VFSAJngJLoHWqx/Dn5q95552E+uX61lXs0Y2TQMOhloNiArgAOae5P2oFO?=
 =?us-ascii?Q?lMXV8B2UsTnWnoH+E+4W1SJVFjhLnXwhyn/qYAmTFjSLYLIp4ZlFZyMQSyA4?=
 =?us-ascii?Q?Fl/ZSO7C7ZM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rTn4dhhwRQmGTKFN9l7Jl2B8CzI+bdD03NS4qSESqrGFO0Ifso9BaqwH0q7f?=
 =?us-ascii?Q?i83WFlHOqDb6SBj4KCiEZJZ/xeEVECVkI3MYw3jlecTLLloFFeFq1RwQ8x8v?=
 =?us-ascii?Q?LEkY+vEX5+i1nRPws4cKYDln4ywa/rjM8Oii3ckv6gPTwsO/NV4HqgoZQ5t2?=
 =?us-ascii?Q?oU2mvZppJMlEuF9Z2cy5BDvx0hJkuubOz3qIan3yJPOm/uSUplDsqPMsibYJ?=
 =?us-ascii?Q?G6u5QppU7UWpQJ/GmGBfT6bJ+ufGSWnRPhaSS86Bs8oW1n7UnnPBmKBSOh7m?=
 =?us-ascii?Q?be5LQWf0gWYsrwbjgdheb+AZE/s83p91SEmL6X1uxCBIvwZhMi/GwNtjdXjU?=
 =?us-ascii?Q?ToWNtbfR0wysCVd9xlOROtgx34j7UM8iAQx9R7+sHzxRHWOD8B3aDmWxvA75?=
 =?us-ascii?Q?2gGXEC/vv5ve8PtI1yMTHpGOJc6mgZNaTOOiorRpinqKFSZ7SQgdh7+ADod3?=
 =?us-ascii?Q?+fzijbHl+/xgCmwaSX2oKV61a9XVAzV3hq9kYepRZUkqnOyuibEDzaopd2yE?=
 =?us-ascii?Q?vFC/Ntu9MG9okEYqXaRCKlUXMtn6wwEf+nSBJ2zCW9jlqIjZdUeLSYWOhdLh?=
 =?us-ascii?Q?zqwryBOdcszIebP+u28RQVyeMVtWVZx4+obtIMDRa7ZQfAw0BijVRENDwLcU?=
 =?us-ascii?Q?Z071W+HaZcI3eO54yE7l8QNz51j3MWSuyU9fBY2fTBhojHjE6fzQ8kRrf2pQ?=
 =?us-ascii?Q?1yuVJqX6bjpNb8/Gj6kNLbMR2xXioB4jayZLZJGGK0rIeDGh558nsbYcWWAz?=
 =?us-ascii?Q?aBxFVkc9bqsnoopq5bpckBpMEvhxq/LBee9CZ76NuWg8dG0Ymnzk0jxHNCtr?=
 =?us-ascii?Q?KZQ4xg1MdjvenUcxqYpomDa/Smt4+4UdzLWa1DU21j2XkcXV03jhUTDHrDon?=
 =?us-ascii?Q?27tQPiijZNG8k7kVgs3MeL1CCHFS3piG1pqQaNKbTu690N04M35zm70e1CUz?=
 =?us-ascii?Q?JQBiv4tnS0/OtWgky5X0MEA3kpZKMdLNCtYzdcl2DFrVVgQ2TAwkxgQrGlcB?=
 =?us-ascii?Q?tYaaOblSbeWTt5K/tPhksw6i4qV/HyWD6Kyn3+kU8uICrS++vR2Ss7tIzLyG?=
 =?us-ascii?Q?WVxq4VmnKRMmeaUHpV+7p+ehKiCIuOF/RIvhpsuNReZtAsiu+nBpqPWfMirL?=
 =?us-ascii?Q?3s8Uy+Cqvj/yrPZdnNLFNbMHq+SpboQTW6C/Y4G2uPeMLNVkzVP6CZsvF47b?=
 =?us-ascii?Q?Wv8nG3qZnS/kdid6Tfc+RhHJn+OkoY0wAKQwTmjsm04+0jx5aGgHf5qkYp6h?=
 =?us-ascii?Q?8GvlN6HRyAfFvC/hqqTKl3++D/+3mGv90AuQpP3GHNaUceNY5c4TBT3yz1TX?=
 =?us-ascii?Q?lwnFwxX3q3uJM0pkrHarmPVzFKpT/rfZN+i5HJqvyRdNbJNOKpMYVhFCBGZR?=
 =?us-ascii?Q?FuVapS+n0Ge8q98g/xNRH7XJM3VbUPrYiikfUACK6rT3hH+bEUC1thPi/Lf6?=
 =?us-ascii?Q?bCvXkv0qQ38C2u0z49bMIQA5T3TsODV4I+KGm+PqTde+ByU9DXpwhzqksolJ?=
 =?us-ascii?Q?ezBF67wb25YdLYWvpSLTP9l9fiTgwTJ4zizrh0T/ACukuPDWWtXAYwNPnCTo?=
 =?us-ascii?Q?ugdB20obuX8Trd9uc3RIEFVsMHdysqGJtrZmPSa3iR6IAWTDA98RmZlz/+K1?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: eMq4Ar/0VFsmjUcfLZCmQyaxoaphh4MCR5ARBaDNY0vLuzVdLUBraf7PGOEv3DJQalIJz/9fzBtaMn3Gt7G0PefaenwTuA/y/zMP537i9KF8BLXNxzB94op5HxovnKK5dF38WHTeYzmBnWI1FidrN0yLgwjkDuEK1mijVn7ij9wUI6FFPEUKmt93oeRL/jNgeomQ76Z5zdNzknI6JqbbLNpfxnJUOW+/4QSx+7QhyDu8UqV45DfpDVsWkEF9xcQtzO5S9zABFhjpTNkN3T+fp27G9YJsyjb6Ilgvie4cvh3A3B2mAzald7c7u9DghoznC8FfhK6RgMR8VY/0uGvwg2+z/De6z336hEdhBVjVD4UjC7PlHOO9zIAOjehkHL+OCFu9jZRKrJ7jo6RLtFLA3YNyTOOqxgvG1N0CchZlbEzu2N8hHu5GAmpPM4dJpXs9wVKiyIg5/tObDIm8XGfJvz5ugotic8H7Na5HuSKF+UTR6cS1vHEHwxiCCEIWEyHpQ16swsEcFpUGQBOVZuuPvE2qamLBbumvAs80SMKJtlBzzfssNrZ41pebkGXigNb92phe586y0tECy3WpPr1VwlOQKjH88ksbH60jt7nN4Sc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db4af0ac-ffec-4c0c-d798-08dd866eab91
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 16:06:44.0742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgkvgZJOcdtKsJU/rdGGeykTr9iQFGdAqKC0vL86bqrocAQwTRH9QfXLTmPSZo9+yDmWGxpVaMOb+086v+zUsw4xKkhFGR8y7GiltXx6vqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7425
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504280131
X-Proofpoint-GUID: ePIjj2D9_D3i-dHOAftPEbnPBb8p-1NG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzMiBTYWx0ZWRfX+pW5Pnkn5ero
 QeyKvHy+A3+obbYZ0fwA87IKF40z+biB/XU81Bxr2xxj8PkzZ3AxWPkqEIjLuxVUXPgR0FGqleU
 bidkmpwDVEbGFZvrsGJO7Bxfes+Cbip5RdsCnAvBYSSeYOC/lmr6aWpAMPD5K+c4FQBlNFaa2jM
 T0thAf1nRstg6m+lc2RhtLV/iO1EmICXWclwFlVKCGF4Zj73GgPdYmXKffn2gq1XEwjscWFf2zv
 rR2f29DMtKQnTUBci9F5ZsmACBwgQpRd5xQ6RrSKDquVF0oI9/QWMyHPqmAWba5BXPOEMVMbDtM
 fvmI3f01UhMU/FW0BiMD/Hl3F4vCInj1KVds7JgoRaxB6wbZ/IU/7+Nb6MLG6HIjpfdoLXn6rBv
 IW0jR7Cm
X-Proofpoint-ORIG-GUID: ePIjj2D9_D3i-dHOAftPEbnPBb8p-1NG
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

On Fri, Apr 25, 2025 at 10:17:15AM +0200, David Hildenbrand wrote:
> track_pfn() does not exist, let's simply refer to it as "pfnmap
> tracking".
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/io-mapping.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/io-mapping.c b/mm/io-mapping.c
> index 01b3627999304..7266441ad0834 100644
> --- a/mm/io-mapping.c
> +++ b/mm/io-mapping.c
> @@ -21,7 +21,7 @@ int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
>  	if (WARN_ON_ONCE((vma->vm_flags & expected_flags) != expected_flags))
>  		return -EINVAL;
>
> -	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
> +	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
>  	return remap_pfn_range_notrack(vma, addr, pfn, size,
>  		__pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
>  			 (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK)));
> --
> 2.49.0
>

However this doesn't apply after commit b8d8f1830bab ("mm/io-mapping:
precompute remap protection flags for clarity"), so will need a rebase :)
seems this was cleaned up to separate the __pgprot() bit from the
remap_pfn_range_notrack().

Note of course this commit hash is from mm-new so quite changeable... :)
