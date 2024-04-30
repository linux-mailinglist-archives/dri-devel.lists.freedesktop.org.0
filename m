Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C048B7693
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 15:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BB510F308;
	Tue, 30 Apr 2024 13:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThSvMO0W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7193410F15D;
 Tue, 30 Apr 2024 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714482381; x=1746018381;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=m2YfVfp519N01himqUJxGj/GYylG2HcRS5/YRelQz2Q=;
 b=ThSvMO0WhhO8awh1Y7jKyODqzK9/ncSaTCGpFz1zU0Rr9UccdmDpY7PN
 tuiUFD5FI0ZDfCtreYbSvEhA5P7VH2cX0xs8vL591OBzA8ybHd6hcSS7v
 0vxt32PupvD/Whi4xv5oQb5iTrGohhh1os+QmZPekoKcLjD0ExxYIh9s9
 gvRijZdXvLADv38yqxKHSugqJF3WFyfnMwMRNUTagkWoxJgq6yWKSjYTQ
 HbIgAYqsl5vitHQn9xqwQRrOvr/TTQr/V6XJb0H/RQCcsCNmoFNkWhxBL
 WUlO+3JqRDxMATYvIidb3dWMinTJShfpWuzBfDU84p3nENjcrCYSfjfex A==;
X-CSE-ConnectionGUID: v9mTjIRCR/Wfoqe5n0fzyA==
X-CSE-MsgGUID: Cs505EzVQHW1FuV3EbWNMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13113281"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="13113281"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 06:06:21 -0700
X-CSE-ConnectionGUID: ZYs36LrWSY2qMh6n2OTTyw==
X-CSE-MsgGUID: aySffVdhQl6wcDQcrR4nkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="63946155"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 06:06:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 06:06:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 06:06:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 06:06:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9EzQQBDBQ5N6mnk/wmvknAwO9deKh80iDXjsvGEavEKXT9s2eD88iyJZFAoLKkrMcDihFLq+Yogh2eiq/ueLSxoRX969tLT5RYuLciNrVxFkjjk7EjCkSeMj0eXKc5X3IrgCex70eTKfIlvdKKNzy4imhlZStBwnMLJdo8aXThN6UMMuKVXG97TyL1XWvxUZldPndz4HYQOD6O2uXI+rvLHBU7UoTkEXgOwiykB4vCvvt5ySoLDXTIyolrE9ZgKW4foVsRV7Wk1djduO/mC+tt7iuxn7w6ISST8+LyjF+O9Xyw8cNxJyP6IMycyfPfhSLAMllSEWsE0TxDxqu29Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Of4VIRgnj+yz42t5Z48CDYEVy76e4TEvyRXpp3Tcww=;
 b=NC10vfrRAZ8EFgjgyTjnzkLUwwZoNML1yDI4viteAwlnNUlGQf4tYK30UwGGO2Sf5STav/UFEABfPw8WYtSJaZ3DnjMR3CaImMtlUGJH0xlEQi/hMAMq6uR0+o1SO7scJmNkY6v7gHteLLREtXYKTPV4Nlp4ZjBEwi8we6ueSYklQB72PSw115pKbR8ycsRf5Z5MCyCqWT29x1J8NZR/IntiSBJkbDt304A/O6C6RoAMZBSGPfuqJ2HBADlvxmzcNDdbNFlNI4I4n6aRpfsFAJFDL+j9Wtb54uGjiOvJW1X8XOAiqDHRXRD2JLl1qlgT8TmR4+CZGKW5FnsM7BXlEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8331.namprd11.prod.outlook.com (2603:10b6:930:bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Tue, 30 Apr
 2024 13:06:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 13:06:12 +0000
Date: Tue, 30 Apr 2024 08:06:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
CC: Timur Tabi <ttabi@nvidia.com>, "airlied@redhat.com" <airlied@redhat.com>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>,
 <chaitanya.kumar.borah@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] [v7] nouveau: add command-line GSP-RM registry support
Message-ID: <wuoxhpvhh7pzmniv5clkr3756fjrqyukahw63ugbljte72o5gq@fdc3wpcasimh>
References: <20240417215317.3490856-1-ttabi@nvidia.com>
 <162ef3c0-1d7b-4220-a21f-b0008657f8a5@redhat.com>
 <913052ca6c0988db1bab293cfae38529251b4594.camel@nvidia.com>
 <5df03f8d-7835-4a90-b8fa-d20bd05e62fc@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5df03f8d-7835-4a90-b8fa-d20bd05e62fc@redhat.com>
X-ClientProxiedBy: MW4PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:303:87::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad6100d-5188-4069-d0fa-08dc69164fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0UrQnd1Uk9wcXMxSVBIMHJVQU8rZ0RadU9xUVNlbllES1FYUUlmUWY3OUQz?=
 =?utf-8?B?UUI3TGl6clp0NFgraGpJUWJZcklQZ0tEZS9SUitWTldmWVUxL0tXaVhLTmUv?=
 =?utf-8?B?VGV2aUp3dTRLNWZ0Vy9LbUlzVHpzSUdrNkx6SnZnbTh3Z2FTUXlDY1JFaEc1?=
 =?utf-8?B?R05HcENsQkE2Q3NKcjNUSTNPVFladlg2NytrcW55QjVuSTBIQ0d6b0M1MFQy?=
 =?utf-8?B?NGg0ejMwTWVWTEYyc0dUNlNRc0ltcHFiSTdwVjg2bDlWVUN4TC9UYm9lQzI3?=
 =?utf-8?B?S2dyalA4djBjMXYvRm5UTnpRYTd4RmV2Zzk1TnJMTkdVRUoyeHFpSXVWd1FJ?=
 =?utf-8?B?aW80bkhkYTBSd0luaW0reHN2WEc4VzhxNzhEa3RxSDBUWjJSaXhvTjQ4Y3RC?=
 =?utf-8?B?ZGJ6cHZiWVRZRnVNa2pGM2VRbTVkeFdpV3dscjczY2N2R3RCN3VMa3ZTTk9k?=
 =?utf-8?B?VlY0Q25sYU5iOEFZZXZTRndmMmZlR0FGcUhPWHh5L2dFSFNvbmF6dlF0cTNP?=
 =?utf-8?B?OXl4NXAyYjRGazRQLzljTTlLVTdRamVhSGhVZmtYSVpVWXZ4ZjMyN0h0N2Ja?=
 =?utf-8?B?M2lpMmsrSXc1T3RabnE1NDF1NFNlbzNGS2U3dVliN0M1eDhLWmdtazY3dEdo?=
 =?utf-8?B?WFhnZlFMTDBEUENkUE9kaTFWRHlSQXI2MWsvL0ZVa1RGeDBBM3N4bVl0MXZC?=
 =?utf-8?B?YW80RllOUGpwYVdaMXZ4NTM2WXM0QjV1dlppYlRPRklrb2x1SDFhY2liMnE0?=
 =?utf-8?B?OTJ5cWFLY0dJZ25meEVFeUxwL3VySnB3ck9MR3NIZVJ6QU9NUWVLaDFwM0Yy?=
 =?utf-8?B?SytWa2N2aVg5bHJtRDZEbVZtKzIwczJvZlJlcmEzR2xsVFkvckdMRGZWcW1Z?=
 =?utf-8?B?dFJBVjEvczJnd1lvdG80YWdNNjh4aUQ4ajBsTmZYaXk4ZVN5aVZndUxkUjBI?=
 =?utf-8?B?dm9BRHM2N1I1Z3B5a2dldU5SOW5OQ2EyYUcxZkpXTmo3bVdjaXBGOWNKQTBv?=
 =?utf-8?B?SUZOVVowY3JGZkJIZ2ZPMDVScml6d3VQeUovR1ZhVUtXZERjQ25vZkJXQXZl?=
 =?utf-8?B?aGxRSnp1ckcvZXZxZHJNNmNvV1pXcnZLUFVYbGNLcjk5ZXpkTGVzVTVJNUxq?=
 =?utf-8?B?Mk1HREtHdjhrTUM5amNHd1pVQnp3WEJZS0JnSG9Mb1VCQ1NDbHFjcWFqTWsw?=
 =?utf-8?B?MmwvQ0pXZ3o2bXlLa2RVcytoekZyRlJUZjJxTDNZU0VGMGlBcHhaaCsrWjZm?=
 =?utf-8?B?QzU5VVNIcDJ5WWNxYThydWFYbmdORnVYYTQ1V1NaUm5naWh4eXA5WHRVMDk5?=
 =?utf-8?B?U1NSTW0zUGNlSlczQjc3dzJtRVlSTFFHMFNQVXFRb3g1ZlFFNXRBVW1PWnd0?=
 =?utf-8?B?WktsOXlBdmdPQUhZSUdhdzlJNXhRendBQSt0cmM5RnlxQmpuUWVOMUhKWks4?=
 =?utf-8?B?R21idVB2Z25HYlN2S2pycFkvdGZJTUVPdGVnRXExVklodnF6d0hiTUo5TzNm?=
 =?utf-8?B?MjRjQmwwU3ltL1ZuS0RDTUVUc295YlZkQ29WTy9IQklaT0VnaEFNQWEvZUUw?=
 =?utf-8?B?LzNwTVBVRzRXem5BTjRMNHg0SVhxZGp0MkpRZ1NPWS92blBKVXBCcVlPcnc4?=
 =?utf-8?B?WXNoWnVxNG5VSXI2US83MzNXMml5eXFCaEdqZ0dYTzRqbWlSQmIvQThiMDNr?=
 =?utf-8?B?aDAwLzZFRFFidjkra212OWlRS3ZhZUdlNndSZElxY3EvSy9vUjR3UVNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTRGME1hdzVOd0IweDZ5ckNHTFNTTXVJRTZ1TnREZW1RSC94aG12ZU9mVzRN?=
 =?utf-8?B?Q2ZNS1pSemVrZDRMRERBdEpkR1pEbE1VL2UyWkRTQlVGK0IzTDBMZzIvREU1?=
 =?utf-8?B?elpJM1IybzVvYWxGL3psUE5PYUlBY3IvczhyTXBaZlBCNFk5aEtrZmpWZE42?=
 =?utf-8?B?QTRSVDBzWElEOGtVS3A4NWRMem45SzZNVUo2dHJDdHRLcmVrTlZCSW42T3li?=
 =?utf-8?B?MVFINnZEaFluSEVIT2h4QjUyb3NPTGtId3FWVWZ4MEY5NDdDMnRqYk9DOWpU?=
 =?utf-8?B?MXJGT29LRm9aaHBWUTlnY3doRFRnbzNlT0NVU2J4K3JnckhOZHZJREFVNXpn?=
 =?utf-8?B?K2VDS2ZJMDhLWXpHWXNXN0I5OGlobUdJMHhhVHFiKzZiT1JyMnBhV1QvNnBL?=
 =?utf-8?B?R29Yc2lUam5wcGZ1c0tMT2g1TWRBcnA2N0ZKTm84cVdSWWlGQmcwV2ptMnV1?=
 =?utf-8?B?Y2tRSS9YaWlneW9kbjlQUm5mYVg1VC9HYkVJOVk0SlkwTDloUGgyMVhmOE0y?=
 =?utf-8?B?NFIwMG9QUVlXMEcxZ3ZuVnRUcUZpMTlXL0tzVUxXTVA2OEZNT3BhTDA2Mld3?=
 =?utf-8?B?dTNScGZCaTF1QzNrSVF4cFdINXZHVHdGNVI1WEdIMVFZQjNENmM3VVRvK2tM?=
 =?utf-8?B?NTRiL0s2bVNVZ25VczdwcmUvN094T0hRVzZ1OFl4Q1FaaFNkTnZPaldRdU5x?=
 =?utf-8?B?Sm1CZDRaelJpRWMrazdXeVpIZDB6dlNJNFkwczhBYk9aaEdJemY2V1JSOE50?=
 =?utf-8?B?UmVqUG9zWFJhYTUwWUJVNWY3elZtMVJEWVJPUGR2UFNEclZ2dEkyZ3hQN05M?=
 =?utf-8?B?eUNnL0N4NnVWc0FUdWlLQW5BMks2OW9UYUhobG9vVlRneHVXR2g4MHJZTXRh?=
 =?utf-8?B?UVJzOUJYSEwzaU1obGZpMjdSdllxTEhJNUNCUUh6SHoyVEhuSFAzR0JxWDNk?=
 =?utf-8?B?TzVXZDdvRFdMOUZPKzREVGtTRTZrMTBYYThRZGcramtjMjd2Tjh0THh3OG9H?=
 =?utf-8?B?cEhycG1VdElzK1ExRUg2ZkQxQ2RreWc0OS8yazFOTXUyc2Vob29nbkM4VXFC?=
 =?utf-8?B?ZXgrMXJCcXdPcTJ4MTVQVzNaeFFYaDJGbGpmemdwNE9mUVdRTFFzSGpzQXAw?=
 =?utf-8?B?ZTRMeXBuWGZqWlh5a2x5ak1MSnd1RTAxR2xDaUwzZ0IzNVN5MHJFdm50bjBM?=
 =?utf-8?B?dVQwQjFROHlZVkNrNnpwR2dNUVZSMEhVRzBQcFZQb0s3TURhdkgyOUp0cyty?=
 =?utf-8?B?S3BQWmVYM1MxUm8xT2ZqMkluRmdxckcwTTh3NXFGeStQMzZSU1FyblRPaFdj?=
 =?utf-8?B?d09WM2RLSEE3UlFSWXJ0b1l0MnNSK2NOdlNpcjlmcExMNm1vVHdrSlltM3Jw?=
 =?utf-8?B?Mm5KOGdCWjU3bGlXT3NrZ2FONk14QjJ1RStIR0tDd0drc21wUURNeFJQYmsz?=
 =?utf-8?B?TE9BNXZEalJpaXJMa1ZlSkU1RmZUOXF6cHpKdW5JNW8rdVF1V3VEeUNjQXdp?=
 =?utf-8?B?RGRKcWVsMVJidkJHZlZNZEloeWtadGN0SUhQa3J0RmVvTDhEaTVkdWZDSXFw?=
 =?utf-8?B?UGxUVUtPUDNhOExMcGpWTXFLZFpucWF0LzJPVUplZjIzNmJ4djVXaWNyRGxr?=
 =?utf-8?B?V2pwSXJuM0IxWURhR1lWTFRodDFuUlluejBXSVF2WlUzMG5NSm0wZWsyTjh3?=
 =?utf-8?B?YXJabFJORTFJVDhIMUJ6SThtdUtobVJkSmp1UXJuSWp0aVRSQmhTMllzMWJL?=
 =?utf-8?B?YUg4YmRTT1R0N0VpUWlEd3BncmhMR1NpS3NPbmU4WU9oWS9IckRER2lKZ096?=
 =?utf-8?B?cmlCMGtmWUxJQmwzZkhrMGJkcWxObGpmTlBMRlRFZWE0TTFjdnJldkZTVXBI?=
 =?utf-8?B?Zlg0YXRkcFpmeXViTy9pK2lkdTNGWkE2N2NjS2NqWUJVa21ndDg0b2NDemF4?=
 =?utf-8?B?OElEM21PTCtuOERtZnB6WUtrL1Z5cTZNZldpYkxnT28zR0RHQS9ValBOKzNP?=
 =?utf-8?B?T0ZZQTJtWDVNbmErYy8yWGlUTlBNa2lIV00yMDc3cHRFUTgxUUp2cCtBNlNq?=
 =?utf-8?B?d281eGpwcytOWUIyRDREV3AxVFdISXBSMEFyeGM0NWRYd1k2K3hac2RyVGZI?=
 =?utf-8?B?cUloeUxBQWJOWng1cHYwaVpKTUNkNnlZcG1mSS9qYzRDUmY2bkVFTWZoVmV2?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad6100d-5188-4069-d0fa-08dc69164fa3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 13:06:12.8943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +o+1Z49fSKyX9YAM9xSS5E36ZL1uIo9zpy8jo5lJk1p0u1WdJ13nBn3xHm14unJSAOdPHG8v2GRZtK9b5qYDbTSmK9w54dGIbAQNTOmUnEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8331
X-OriginatorOrg: intel.com
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

On Fri, Apr 26, 2024 at 06:08:19PM GMT, Danilo Krummrich wrote:
>On 4/25/24 18:38, Timur Tabi wrote:
>>On Thu, 2024-04-25 at 15:22 +0200, Danilo Krummrich wrote:
>>>>+		size_t length;
>>>>+
>>>>+		/* Remove any whitespace from the parameter string */
>>>>+		length = strip(p, " \t\n");
>>>
>>>With that, I see the following warning compiling this patch.
>>>
>>>warning: variable ‘length’ set but not used [-Wunused-but-set-variable]
>>>
>>>Did you intend to use the length for anything?
>>
>>No, and I could have sworn I fixed that before sending out v7.  I think I
>>originally intended 'length' to determine when I finished parsing the
>>string.
>>
>>>Also, looking at the warning made me aware of 'p' potentially being NULL.
>>>
>>>If you agree, I can fix the warning and add the corresponding NULL check
>>>when
>>>applying the patch.
>>
>>Yes, that would be great.  You can just delete 'length'.  The NULL check for
>>'p' should call clean_registry() before returning -ENOMEM.
>
>Applied to drm-misc-next, thanks!


since this commit our CI is failing to build with the following error:

	  CC [M]  drivers/gpu/drm/i915/display/intel_display_device.o
	../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function ‘build_registry’:
	../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:3: error: label at end of compound statement
	1266 |   default:
	      |   ^~~~~~~
	  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.o
	  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
	  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0.o
	make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o] Error 1
	make[7]: *** Waiting for unfinished jobs....

you are missing a `break;` after that default.


>
>>
>>Thanks for catching this.
>
