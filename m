Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009F3AB5B48
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 19:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A54310E25B;
	Tue, 13 May 2025 17:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Y6OAvPNw";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="d5HF6TyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC9710E25B;
 Tue, 13 May 2025 17:29:47 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHKYm018764;
 Tue, 13 May 2025 17:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=SMSXtFa8xzeL3chVGd
 2EtO9KLJUzeN+znjs2XgW8Lqo=; b=Y6OAvPNw0AxtfWIKJ8wUhscePnZyYtY0oC
 jgivtpg6n2dwosyPom/IvxNWayabk9mWKfgg50M3Ma/4yTQcalECs/EcU6pjpWFa
 GSpTc14/DfCaWGIAbbL+Qg+jSquNKKl+SG0pgT+sf54Ry/9NjUnuISmya1gJt9Te
 z9WjNGq426nwyC+ASNTTvnmRFu/F9Gu4Sgy1tbo1AS6lQbDE/kaSYzctHU8TLUCK
 /BReSXLr68qNcOutp8+hYc7469VOm8vZcabSoGAzkJVyYjqNnrDCaVA5fixlGsvv
 GbumMuS00b/NWHxtmn+VKa2rOV1V9qhFRGqocYChL2LLgtf/RM1A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j0gwne3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:29:11 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54DH47jt002600; Tue, 13 May 2025 17:29:10 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazlp17013059.outbound.protection.outlook.com
 [40.93.20.59])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46jwx4nunb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:29:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaZTY/6X4sT/pJ81Z5TMB40SHCER8H4o2w8lfAMSOWVs/zAWpIDXjQkcc/n82lVRn+NFcGuioi6y4T3C+GNt/kakS5X2PL881308eaMzh7EEPYFUq1tmFOLGUZmGvOpIN1QHM33ttIgtYs518o7cXQpDrWOF1gJYwXlOkZWxNKCAk7lS8ad9QHJL2PXqgnl6hv0B+SpoYyEgeStfs3e4cJ5d0kPRy1rF2+1Lp4CZg+0gjetgP5qc0/llKGSxoh9nEoTp9DZBAdt8y/Buzsx7V6lRx2pR3RJKrcgwqmx87nfIX9VRrHvdlgDYaEmUuypzHwegwS/+jzL7RsCzfnAbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMSXtFa8xzeL3chVGd2EtO9KLJUzeN+znjs2XgW8Lqo=;
 b=ncp2Yc/20KFWEmQWzliOyhj3KC2YPhKwSvMzFdxxp81Kb8Z9wD9EkrMoy5X2dNpoQBksMSvb+tx3jDGP0Pu2J63U28Mzuo2YgTJD5dicmcwaVyDJc1ilE/gorid/EuKWEgWMjhxEfzsBKMDx0bLg9uzM9/VEdZ3LSbMzO9suG3JuqQHV0GV/dekU2YsySfdN36zGcSO51lQOI6Q3XfBQTUJwdOWdGGg+VxjQZ74PZ9OlDeXta8QdbM+dr/J0VKJkBYiSJdIAZiNev4rCNOODFKxYcrKyBAeACXa+D+DYfgmkVKWQAdLamRhwUwkU2Yz6Tt12nXZZmeHYZchOqLlpfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMSXtFa8xzeL3chVGd2EtO9KLJUzeN+znjs2XgW8Lqo=;
 b=d5HF6TyUDVthkFjE2iYybJxL7eNUAnzz1pccLbxhOMD3I+0wRXty8VTXYfao3PR+rxu+CmiJ421c5CPN3kY6/MYqGleX8SHjcbFOmetTKB8ugEhlRE9AYDlmmgm+z2/dneoMn8K5AyVMyCaexNVAmo1qwAOYEO5SQRWvaphUK4g=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DS7PR10MB4991.namprd10.prod.outlook.com (2603:10b6:5:38e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 13 May
 2025 17:29:07 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:29:07 +0000
Date: Tue, 13 May 2025 13:29:02 -0400
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
Subject: Re: [PATCH v2 01/11] x86/mm/pat: factor out setting cachemode into
 pgprot_set_cachemode()
Message-ID: <nyhrgd2qmbntgysd2mrpktkehxkuufo6rwvmau3clemn6vjx3f@grqfuazsriec>
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
 <20250512123424.637989-2-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-2-david@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::9) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DS7PR10MB4991:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a2fb43-3b0b-4e63-cbe4-08dd9243aa16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?umJIHyNCJbdxMKWvxyMeGsA62ZUF97H516wYD7Qm69/uDdTtzw2b1+QDMaW7?=
 =?us-ascii?Q?frrMTXzBYk7tEl2fhglYrY3XMVIMaD1X7qPY5hnzg6TqdT/rkzjIA2v0Mwdq?=
 =?us-ascii?Q?UX1nesj9emlvCcUVkGVmv+FG/vm/NwThIyAnn+TDv2Wl/jqCwEtv8UiCayUA?=
 =?us-ascii?Q?7oPpXWlAm1mHaCB5jncfGEkbA0hOE2ZY6R8c0urCXwNu6XYwtwpNvaTX26ms?=
 =?us-ascii?Q?DwbOxPPJYR4ip0KVQwbPqdB1cmqcklWpjXRn2KPS0mxmitw90QiR+/Egh7i2?=
 =?us-ascii?Q?S0mxsRJ0UeqiG8OG+eFj+CZJWFozDaKaIuQXzVI5m7QP9SaLc+t72GvqD6u8?=
 =?us-ascii?Q?hI2N2YmoHDs9cw6knvnBRmQLUS2JsPUg+VIgmPPXaGKQ9xeL8l/fq+UmtSLx?=
 =?us-ascii?Q?AgmB+QMZWl1rH0vW8FO+9/MJvpworN6+BR4InYZxo3VwUCnZ2DHpJBOXsKh4?=
 =?us-ascii?Q?TpqzeyPnkqh/lSqIZcx8KBTkqYIHyFNzArkmf933X5i83VpSABvbxSjoFEIU?=
 =?us-ascii?Q?79fF9388qd/4xL0G+kvqxWI7FHa1d7Ikw6KfRQ0ZpUUOcLrNLI2XQ1f3FjaO?=
 =?us-ascii?Q?w9NqB7/n46macwGJKNjuQithjenaoubVdEWF3MZ6oJoaRal8He6LK0ahT1Er?=
 =?us-ascii?Q?0MRn2ZLRBW+/OOeP8SjKhDlh1ZG9VIcjP5zYKGmOMOLIIbtcrGr1ytJkVSXr?=
 =?us-ascii?Q?rf5s8Q34nXp3ceqnhLkProH3QufrVdB+EMtxX3N+2WyolFF5RhqZMwnQBRj+?=
 =?us-ascii?Q?czaNQr+H8pDcLq0Thib9/zsnwptkX9h8czYFaheqaGSXIhFN+HEQlMDuR7g8?=
 =?us-ascii?Q?6uVzvfsRiO2JtRrEOJznkp6y51bTDbI5M3HkTUVGVokbRvclUldNscah0ySn?=
 =?us-ascii?Q?bamJGG6Ua78JgrwqqJs6mC6lt6g9+yJN5qk3Sw5Av7Pndyh6RNcqbm5N5daM?=
 =?us-ascii?Q?Yxe5yDjgpYYUj6RlXUwKhIl0qj+zeQTg2U51F6Md01ERk99k42pd9VtmURZt?=
 =?us-ascii?Q?BsPwQfBMDiKTlLZaBUQiCuDZI8g0Yrw5YhZ+chERTQA5sDf1kPWlnuiTn5No?=
 =?us-ascii?Q?mkFqaFMPg7yS8TxQ0accKuLs30Pa01BcCu554zOBFLscrtynD8KEVMSfJ1Xh?=
 =?us-ascii?Q?/fcadamSczAHLh31v9gNlqIb4VKKroV9t8nGIRhg9GSmCwLCbYS3xcAfgWaH?=
 =?us-ascii?Q?zNAOvjW/Hzm2+94aUlRNe6IXA7QJznCOmBYPMrUQHqJRbyLOXgLOaeTys9Bg?=
 =?us-ascii?Q?OokJx2LC5/fEuQRC2dhg29BxOfquJYBxpFmB+GSM1Wf/tbxHd8F7xmHETA4B?=
 =?us-ascii?Q?UXpmMiaWeQUoOQ1axx8cvtkYiuSdBrG5gYnKWx/hwYAAcJ5DHZvVJK5YQ+og?=
 =?us-ascii?Q?FdOmDdxClhREt5KatLGehJv+in4/uuBo63B5xiESge2cSEleqeQWtPccVC6o?=
 =?us-ascii?Q?fe7OXapGuupgiya7bvKAHHFtm8eZ2i9GJ7XCbNtzcIfpMxFT901oEA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5777.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/+izjc/MfQrcx5LzyZolcDW+lYfeUSgJPHF99mVVVF89pdIhVrq/6HERqrpi?=
 =?us-ascii?Q?rRQgJ80T6qTGpdT8mzgRxX442+VoSAoNAYN+8DZkaxzo4hgaIMRpB/gvrD2g?=
 =?us-ascii?Q?Wfj1PsTottx+hG02oUq6/ndWu0Obfob6KxOsCJLY9DcqNzxtMjJPakpdGkWW?=
 =?us-ascii?Q?wGvQ4gfju4aGsiz0RgWX4YxJ/IlRsN8DgdTTFH3G7G49GFMuYKkcDgQuEVEe?=
 =?us-ascii?Q?kOUQzM1oo656hlzXQ7Ni3ww6DKUakRH0ntgGN3byf7uYlV5Tzrj6bO/AHEnD?=
 =?us-ascii?Q?8RsfXrNLNlVP5dQ2qqrKdrMnp0Jc9YL9DKRt6dkmuyUr/5k0QGXTrPvawF+k?=
 =?us-ascii?Q?a9Z9iHfl3jTzPAAmTlHeR8jHj2N2exlnUDtqVv5MrINdaqOvHV68jK5jSMzC?=
 =?us-ascii?Q?M+JFHQUJtL0IOf3mqFOmd9rJ+4nufYt6h4GzDjX01A74aaY82LjmznHRTDsQ?=
 =?us-ascii?Q?0c8F4TrzSOncRyFwE2zot5Ld10X83TRSQPYU6BDas+QvVG5gk+p2xJ4nEy8I?=
 =?us-ascii?Q?5onAaSz0Y3lO+QcEwvkDHCv7ivg9SxiFEFWL/c0iADF6HFxQk+BKvXgbqrlV?=
 =?us-ascii?Q?GdBZJnWJ+Koq9sbYx9DscoLj0qa70hP4z8/c/V7BcCeKvAePnBklXAY8yexm?=
 =?us-ascii?Q?mLhXi+eBO87SLVvfZFXjAqeaiHNvkltZoAQ4TNnfwbcnIrF3QqyEJ3xfr8vV?=
 =?us-ascii?Q?hRzvceD0LMVSWynOcoHdNpZVPrv5oOGsibGMUKaaSli4EjdTnSDx/CaK1S9t?=
 =?us-ascii?Q?L7H2FRHW1mKngjuAD+z/8/0NJWEoc8lgT9cSZvgitqvEBDUkqHwqTYzyUs18?=
 =?us-ascii?Q?ksgTq7eDoLiNrZtXuQ+7hobw9J6bmqokTLV300LyODU7O8NP6f9UVqMCR4Z/?=
 =?us-ascii?Q?sLVh1mywLNnz6TlEmwEH2ZLRs0aAK1loSLklFSEEDtvZTnC17VR36YHrn35/?=
 =?us-ascii?Q?6C8J9St7ekwBKah4guXrpo3yJMBpR/bt7RVJgKdjbF4Sv6yJEdFSY/9NGlfS?=
 =?us-ascii?Q?vD0sMxInbJ4P6XHfbydKAgHjaeUQbOtNHuVl8dNNGvZ3s60h52QhSGgYUGEC?=
 =?us-ascii?Q?uTMS5wiaDQgaK1F2/3mmCwqsECUbWn2jIbccXvwZ72G2u4VB1LNGafipP0M5?=
 =?us-ascii?Q?gG2RmWTwnvj+25tK5BbPbK4Mhbag3gtM1zwXc0UhhBfxR3ljpZ3ca2zAanBs?=
 =?us-ascii?Q?OMdnIi7JzXsPnV0U/irwHY99ZmdczxoFvEUkVgeJfIAKsrdvcjEV0KuyvF75?=
 =?us-ascii?Q?AVDb36griwW4mQcBthmv6hfXXQBIsxeDL8j/dOKD/c3kNqaonFW0hcECBR/p?=
 =?us-ascii?Q?RqxnI8FR70UwfrkvuO+l8x8c27rC3Vj6LP3dwre5rKHX+WT5LGccmRObJeai?=
 =?us-ascii?Q?yOJXg+IMAA6+fo63IcZ7TKQYVnm0ik6sM/NMaNiEWESmCw8RcmQyVlBCXg8/?=
 =?us-ascii?Q?n9rS1Z9TMw6y19IcW0tDwX+eN6zwNrkUuNrty60EihZDAAGWqJvtBTgOCuB/?=
 =?us-ascii?Q?3+dDrsQK6xfIogM5o4BYOLx0tg69nMNtglLFKNSQJPe/pHqEOnxdY30tamcP?=
 =?us-ascii?Q?1GqDXawylVImdpo9tmjh4SQKhwtEQ2H98huKynWh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2vNOHAvtbBcHSWUy0EpbNdE0is5HBy959UqRc6U5Ty8O6LO89HuEu3hkB8CGnJu2gL8UVliz+ufaZ8AfoaL7hKJ07Tv4EmQOtDQWTP101+UsosoJ0kGfVp2aQ1LXWcXayPqQsLDdT44GCTGngWuxqOX5LSb+eGHUL1FthGjXUEntgEKLKyCGU7vbvf6GQE8E0mUOJ91hwPr0jEwjeoSRnN7n/Stufm6diTftg1NLhRVWUNVolsjXDhVr3nYfFQlaUr3aFyIp8aa7kNSBYc5Qz6j/ZTxogL94DIr2tnfWtOFnKii+r5PybhLXE6N4wP0+TL6X9hHg9rg0+skbDfYTYMyLLE/Be2JMLPLh9w9vrrIiaA51czdvJRu7mSjmHP7g7Eqq/d4Q9AugGNkqTN81SXdTJqmVOEbR/Rfu+ueGgB8Itd22nCJTt8r6pmWv4YPSy4PJwPY42burVLrlOvvY3yGtT7Z0lDSnSkk7e0QD5YTQSRTxrrudTq4bCjpxMglywGXZAQYURlLDxCLzexwSNdR6usNTfjKEFEKbVfYjYDjjkQ2KHNxlmtmi5MRCHwPTXEip2RJwpSBjuN4GwPLPYC5NQL+IPdM9y/JE1liRkrc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a2fb43-3b0b-4e63-cbe4-08dd9243aa16
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:29:07.2060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHQHZXawaPYnmaANV1f0WN1Us8XuMdQsl1CAvpJp+ZDv1FJfbWjwk6Jbe+DajfEdvGP37GwrtxZjofTHw6rzQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4991
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505130166
X-Authority-Analysis: v=2.4 cv=M8hNKzws c=1 sm=1 tr=0 ts=68238167 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10
 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=slIViJdPmJbB_GIYi7YA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: VRtWp_hnJGGlxhhyBs9rvgSQdUH2-qbn
X-Proofpoint-ORIG-GUID: VRtWp_hnJGGlxhhyBs9rvgSQdUH2-qbn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE2NiBTYWx0ZWRfX67b8jKtehPDU
 PywBt7wYC5GRLihi5jrQIcs1HdRa9TpO7v75jB4qHoTD6PfVQbRPdfco9qJgdefoYbMcmdNZxaB
 +NKlFim0KH5+VWpDGWtCNgI/eAK1+FUjypz8NBAG9dWDDC+eswoqKS6wV2MdrBy0W1MArZdp9Og
 JYwkRj2pCyz8SgCmzypwnFrVRg4eUThrOJYaMl/BzMNytFoy68j98lQLUd3Ue75DbieDVwXcjKW
 GqxR4Dsd+IN8zY8obppM9yADCau3T/9PtmG8IoOWzvgN9ILG3Ru28+6/ypWvAciJVy4gLtaqCYM
 lL5IRTIkHaqoawxNGTZgclYG4vgngChFvPckZwspJ/DCsGvgLaFq9Ndz78okLy01JhOhonNSq0a
 DqshG8RjtgB3kOkZByld5cNVnaNj2fJ7l117MJo0BHTHSJjDXjgdpBqW+VKTFBw0bSoVkXqr
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
> Let's factor it out to make the code easier to grasp. Drop one comment
> where it is now rather obvious what is happening.
> 
> Use it also in pgprot_writecombine()/pgprot_writethrough() where
> clearing the old cachemode might not be required, but given that we are
> already doing a function call, no need to care about this
> micro-optimization.
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>


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
