Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E79AB5BC2
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 19:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3752110E4DF;
	Tue, 13 May 2025 17:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="GK23fEgT";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mJuBWAil";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8121410E4DF;
 Tue, 13 May 2025 17:51:34 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHKbe018764;
 Tue, 13 May 2025 17:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=JGv9+WGP5S0UmvwUcS
 RUvRylzFJM3q//W4o8hiEDN7A=; b=GK23fEgTZ7i190MhmhoF9ZM3MxQf8/GWet
 bZf5Ff9XDZgQcslptua1NdXf5Ru1Q9Pxo1GEI09cUWkrJmAEE+7PoEt5lstWlTdj
 p3KpVnT/RhjG35uNHqIDG2rYClgtA6pG5nBgGxv1SRwfdEi4UTn92xNpw5B5dV2n
 eTTLEaGbqKbCTNeF0IPCSq4rZflE+bJuG7feA6KxYTT/tw7YPxpVBE42yX0MDF8d
 OR3HB/Bl2tdC99c9+402uysV+psZaY+lfYa2bp/ePuPzbLZWJEZPCDRdNIoQb14Z
 d3ztW8pLbyAKQzxRgirMCJGNHadYTMvw5PtRiUIuhFVMoAt27uAw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j0gwnfha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:51:06 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54DHE6jH016187; Tue, 13 May 2025 17:51:05 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46hw891npn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:51:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZkulUoWlb78CLdAbTrBzNrNV2n2rX3UJIkMg9JAPSk/eMMP/HIR9oxmS0By2Cx9HJv7O9VfLsIT5J9BfnslNYEfLJ6TsLgvK9aDHWIrHGvQjwmMBbqmrq1YsVqek1OwxeIthOQahr2h2EskiV/TrtFLBW2XVYMeVFsaYySbEIH9WBC54RS2hSxIVrx23B/+Uv+Nhhx2AC0YhUieDvjpk8T/3DThyLN1LaTJ5d2B3s+7tm1d9VUaR4lPpYzfKMUXDVQUikElwC7TurvmXUK2KJsWH3HWcPnLJqtbjmhjNXreSpcirMH4iou4WslnFGTKt5lX8SpaXGCNt0BS0Ik5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGv9+WGP5S0UmvwUcSRUvRylzFJM3q//W4o8hiEDN7A=;
 b=VFmEjC/jCebh+/eddWwj1bSQm8Gx50P513AR8SYEz8XJe7bNeH1OHVFciT/chZd+223lhHpMPt4ibZ+isZZ2BCXCnrnyGwfY6PAiSGR0Rm4fyYMWaL5E526DbXXBPgof4pNJTuVTSTgYmBXc5jlfXidq/80maH7ddYVaNux0JYadyOX/zHUVWBp+s2vX1jtHJM0chZKvI0MVkBToNqRdmFfFdYIL0iu40JadxTP6RwiykKZrN8W69/FINDF92PtqsDyhdUaQ2xHAzoO/BqAkavYCrMEwWO1l/q1UtakJxVE9b7QNCfHLJeQc5YtV//Ku5kuKu055WqbKXIbCuFLCtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGv9+WGP5S0UmvwUcSRUvRylzFJM3q//W4o8hiEDN7A=;
 b=mJuBWAilKtSDbi7ErTTKi0Si7iqR+DNX/cdzNzbOaUoMrZ1c7QjGBn/oLS7YFyfFByJtj9v5WTBcbFG66rFgh5AiQPM+CMBkWUX2ye8HcFF5doPCo9o1eof/jOuh4LXSHdfH+n3uKiJndaoZ1z7NNT6AwYtXgi7lUKfZgZhmLig=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by BLAPR10MB5011.namprd10.prod.outlook.com (2603:10b6:208:333::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 17:51:02 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:51:02 +0000
Date: Tue, 13 May 2025 13:50:56 -0400
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
Subject: Re: [PATCH v2 11/11] mm/io-mapping: track_pfn() -> "pfnmap tracking"
Message-ID: <4ocgfjdoaoplnyrhkmjbgznxbhrwh2rbv5slhc4eajb5cspgzd@iz46mfzobysz>
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
 <20250512123424.637989-12-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-12-david@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::21) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|BLAPR10MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fba3e31-5fd2-4f7f-4658-08dd9246b9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ne0UUAzIiIteJN18TTt9KTKYfGavgPFyksLkjWIR8Gyds8Nl4ExH8v1S4KuS?=
 =?us-ascii?Q?oHvQKELjGHZjCDbgOPzDghUDDnOkc6mBxyyOM0vmmNeAKlDzdo7bqAuVposG?=
 =?us-ascii?Q?OzzHKOHg9PR88HaWUnHXOFx+EF2imvhypsXDD1zHpHtdHkxHUvo46pC3q0iI?=
 =?us-ascii?Q?LZz4X2jP6oieU7Xd4Rxt9PsA5ubDUyJV9xc3uZiT7yrV4Z8BJ86b1R4DAG0v?=
 =?us-ascii?Q?ItVeRXNidkR0VaUU0hluSU+eMZG/hC603wZdGgD/p9JZZIqxCbTHub30kB+4?=
 =?us-ascii?Q?4lcKyKULQXHXmZg9+h+qPcQb79NwW1NoZEZmpHQmvW0FC7YpDj6oBwq/84pN?=
 =?us-ascii?Q?/fiREznnz88DAio9BeUwG7v3HDSkR1+wRqAguxROAiNj74YwX6aTxwXAg9He?=
 =?us-ascii?Q?PkANlXzUBoG+rHKEaeJXzcEz6VbaBd7p94p3aXo7dDrZ8NHJ5waGZST0tBN6?=
 =?us-ascii?Q?GrkaYU94RCAxiGg/vDbZ3lYE1WZKpvLHKbqWt7OIHq87Jkq5YQ7In2AsmZPX?=
 =?us-ascii?Q?uDnjvNXf3l7gXbFQMdhhzUHoqvvIZtwTOPp3e+GMAnbCafnnipvQSopovnul?=
 =?us-ascii?Q?7nydRkpWG6C7KoDJ2nrs7VgBhKzBk+7RgxN+cgAfQ0iFeH5ITz/AbXvyrpY+?=
 =?us-ascii?Q?LU/Lxt+6hSXFFp7mwnWmk8tgJztQBz44M1vV6tD33Fz4uthy8FJP6CUCsTAt?=
 =?us-ascii?Q?hOb58dHbd0wwcW5wgpqqjrqTTcv7zNrXromBM+HU/tgHDtQGm/uF3CP6oZu+?=
 =?us-ascii?Q?dKZ7IVrJueEfeRMfo2ubf6nEaA3a8hP8whL2nT73P8DmzAvH5yzntnnNB26c?=
 =?us-ascii?Q?2c3Z6fcQym0Lccx1R0GXKG3fRRcCGNwJcT442FKq/gQhmWzDbl1u399qv43Z?=
 =?us-ascii?Q?yjbpQiQxAadGDM2SUDifHbDg4Y4jhPds6LmaAyEJzjCKSV8FWNVwg0CnG80D?=
 =?us-ascii?Q?kEZ5GeKr4Sa1GDaruUcx6Nnrw+89voJ1Ww3Dljgf5m7Fzahj+OzDXc2eiLWw?=
 =?us-ascii?Q?C2OL/DZ/T87/KbHSeSdsQmg/K2rTRAtdCYMo1qxis37C72Bg7MBb/z1jzwCs?=
 =?us-ascii?Q?j+9XA618SvP6KLxa7kEtMMv8l2R6BAvStrQtUtBV0ezx0NSUhnRNhhTljFiC?=
 =?us-ascii?Q?a9E4rcu9URSnTUEj64i312h327Gxg6eVyuP5PkXZdj5m8S8AebVCoBk/7hLb?=
 =?us-ascii?Q?OYfszwkZZ4oaEDwouf2nnMS9x6bo2xTLqbOJOEtx3bYU+J/RzWN1keaaNCDF?=
 =?us-ascii?Q?dOvS+UzQr0V1JmH5NEK1vxui6E+EianO9YlYaOvbaDWBHQi6jdRNvM7z+xPE?=
 =?us-ascii?Q?cigvW1Zcba8s5ZQ0q6E5VH4E0QJtMDZw8auRvSyR2qZcKNDS1qEEGEs39xyl?=
 =?us-ascii?Q?JVwZzgkVldOGXTwuwpZCDHh8UdKUov3xRo4g6nTbbiTtkLDu7lhy9BdPQj5r?=
 =?us-ascii?Q?s5QNnyyogyc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5777.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KB4XuqSFYQ4YKbefWTx1Anl2QrNoDj3TXORDgDEx11ehq9buraau0c/VKcMn?=
 =?us-ascii?Q?0NGO/6Fi7PZZfEU/pKwt4xHzqkP7mjbZajfGhnSaB9WP6bw5yNOv7Zz/tiUy?=
 =?us-ascii?Q?eMQBPpVap6vWQ6SNSIcHHLlyQFq+suuJqw8okr2mVFYjwlRCntPiXRJF52rI?=
 =?us-ascii?Q?DmA0DSjlw67zGolyQI+3OICpIS5lgbqn0xGuCLdL5Fz7qjFREv+o9eh/gSNd?=
 =?us-ascii?Q?RnNZ3uR71NpH2xDu6PyuNA9RzChTnG5iY0kx2QA6aksGdXcsTgCmoGbOR5o1?=
 =?us-ascii?Q?Ej5XxF/yTKvvxtP9EMkqqNllhkTvOeUyTK0BfPsfroX/+x3ReGZbKOWvJL5D?=
 =?us-ascii?Q?1ABe1z13bC57/KasZLlffTDYuwTf9xtf8Cg3/IfT0dWUxofNGW3aT+8Z1H4e?=
 =?us-ascii?Q?CdIG1tC4O16NLWpwx2oW9bOSFDXKax6P3/9QNU2vKbclgDzek16VMN3ftvQv?=
 =?us-ascii?Q?MjduLe8gslNwKIt4Afddt/CjcSxG8IZuHRvrRjSqMOs0Z8N0lPMzJd3swxc9?=
 =?us-ascii?Q?E0qquDNlmhya4ULSYKqKe9+OX/+3ssic5/aNt2XH87uzDbOJcnaaiWfKs+nQ?=
 =?us-ascii?Q?fKISR3IyFxa0PMhXgj6hwOgwFyJHraF49wVYONDpw7zMUHUVktjfcJO4HuEH?=
 =?us-ascii?Q?h67js9I/Z2YHYQhWYXz8h6MYVBAPKkJKuTReK9lRIvfArPMd3oDyLiQ9GaMO?=
 =?us-ascii?Q?OZwqA9aDEug7dfWaSmVja+zcRQyOZXSEsR8B5nZc8rH9OyleqV4q9H2ih17v?=
 =?us-ascii?Q?28OgsSAuFiAA6ClYzvcftzK0KK4yfCJfUHFJ5fvRNrVYCGRUDrJyI4DHJVIC?=
 =?us-ascii?Q?rNvYUsXuA7IuSkcJq3r2VuxJZLg5PziLUoM82HMYKOWammfcP/DbgmeELMOB?=
 =?us-ascii?Q?96mqNEAq2PczwAQJC/8vfMeawnK1Z76iF/m8ZT4V8yF8pYaCrZ6E1+m0Ls5j?=
 =?us-ascii?Q?py+5ZkWIhoYYb7av9JsiDs5jPmXlPZCWQpJZOSDBjWYLEcobkgk7GDou65vd?=
 =?us-ascii?Q?xPdVgr9VVBGudS33kiUFO2CYua3/6xZVAHyuIOhTimMiiFXWVyaICiUmeBQ8?=
 =?us-ascii?Q?se84sp7U8Bk8fwfh4D53ZMx4P3Oj2Ea3GH3o2ElUB52s5mxKUKFSi1TOnrvT?=
 =?us-ascii?Q?tzReDksMGqwCS3qds+GahUv8DsPh2/qBsZI41mvwY+P07tFEUfXWF16q4VeM?=
 =?us-ascii?Q?6gjzvPGKC5lS3U6MMlHt+d9UnA9w0brdAYa09Asmee5kWNL+ctSRdthJJ7uu?=
 =?us-ascii?Q?mAHdByQQA88wM4KZAxkFMoCtDMTsjP/B1GMqIY9YzM9muqY5QcsHNK95pv2p?=
 =?us-ascii?Q?4TE3ItAf6k5vst+6PYx01mHybPvUhIEMRM0HdrQXHLrb+PjLj8TTSVLLzHcf?=
 =?us-ascii?Q?PjjKqs95qv2gcXOUG4zRyoRry32+wVQwskofWAfx2ga2d2aTmRRhwLdY1K6Y?=
 =?us-ascii?Q?E5hboVLdU0jOtyqLzisAOYHCDuNefndccsLxhFfqlpr/bD5uds2hFAAO60kZ?=
 =?us-ascii?Q?kZQOsEWWOauW8ZfSJEnqQZwT7vtzgb+N0fiSAifuRsgYcONl0TCurLRM6lGc?=
 =?us-ascii?Q?SS5ZvENav9tISoMWhCBn3OGOocSXxj20fDo3aWq4xcSg1NyUaDR39gRuhRUi?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Near95s3L9dz0IPEiAkHvKqBB5JmpLuqJEb9OyOMG0V4QNDtxHDUVbEyRZDx3RXlBybP7KeoJLMKaGX3nbb1zr3NSZi7FSxXWle33ussrMFNUqjOp+7ho+qfOfoatX1Q3HLkrGbdQUzTr22x2s4vUvTSD74RE382MV+T7LV9Bh6taMm2AZIiZXHHcPU1e7TibYWeKnQ7NBS5U38a1GIMcP5kx2n7Hi0Rf4T8x9UWVujiUcYNIvSYwzj7KCq+G9foB+iURpkTfIB9big3HNJVg2VqCPf+xBb2rYOKzsrxo9L7WcKFhISBIDDwwnG1wewEpS3fL+sgtt2YmB9vznF5PsD0j9ZdcX/WJjVLTpXsc2XBPtfzxnj0VRYKGp7WKdjct1y9UAI0/z1nBP5LCGdcMw610/lXVTuBiER8BUl0NKeSWgSKJBHRYC6MelVXzbaHU52V/N3vJC4jbPHh2cf9TeFMapvpkEFH79BsI/CUQdai8RRQvmG7yWjeTloHAlGiRg56rC7+KbpQRE4bJEvsrTsHBS4X4zDgmVBri1pikpYb9S1VfvQoxjZoTnWXqT0hhkkN4D1kzRXtpKHTBYLa5BMcOrdamhwSH8ZCRAq7WOc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fba3e31-5fd2-4f7f-4658-08dd9246b9d0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:51:02.1030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EHznvf7NwqiO3KVkSocs1cVm3PvFo416/HAHBFqddIfbIysJ4phfFqD7e88dgiSQdTRAr35EaU+hXOUbFauig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5011
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505130169
X-Authority-Analysis: v=2.4 cv=M8hNKzws c=1 sm=1 tr=0 ts=6823868a cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8
 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=wFesxYe3cjYPeCmLaY0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: yjaNEAcCasRR9ziUGiYB_x-r00mkCUMx
X-Proofpoint-ORIG-GUID: yjaNEAcCasRR9ziUGiYB_x-r00mkCUMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE2OSBTYWx0ZWRfX+mEEEUorGtYZ
 9BnrPdCy9/L07j1u4G4jSwiXQT+17E/K3RYNv5kIjyQHNikcaeTKwpiBkeNEBomRlroQihB6FHf
 3sy7VNXPqA1BId/S9YEEh4ohF6WFD4lASJ9zd7moZ0P8QGuztSKMMfQiMrc6M2/FXLNMoq4MIkb
 yKNdMgidZtYTBmI+MskC7ecPu0m1sSFsdJCV+5aB0mCldkFnefnHlPh/ZcCok9On2u5FIqLzhBj
 1Mpsg9shATtp4ZnieUtD6cY3xcLSbkJnKkmj4wfnJv0RTJHcicCKnwPCzyiDmcLkrdBC8SPckMq
 /A7U15fH3B8fBye2FBStj9fy1k4x+z2lRu0l+NtzBlxDAPdUK3JVKYnwJhd0fq5W4iBGjQp944j
 eAw+rU1HmymBXij08hfpiiS41Q2FIUpEy8Twj0ZrR/cnFOeDoMKBzwVCIyoyvyidDWrwGnSm
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

* David Hildenbrand <david@redhat.com> [250512 08:35]:
> track_pfn() does not exist, let's simply refer to it as "pfnmap
> tracking".
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  mm/io-mapping.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/io-mapping.c b/mm/io-mapping.c
> index f44a6a1347123..d3586e95c12c5 100644
> --- a/mm/io-mapping.c
> +++ b/mm/io-mapping.c
> @@ -24,7 +24,7 @@ int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
>  	pgprot_t remap_prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
>  				       (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK));
>  
> -	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
> +	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
>  	return remap_pfn_range_notrack(vma, addr, pfn, size, remap_prot);
>  }
>  EXPORT_SYMBOL_GPL(io_mapping_map_user);
> -- 
> 2.49.0
> 
