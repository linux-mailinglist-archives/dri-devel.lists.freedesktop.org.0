Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE43B2FCAF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 16:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8165F10E9AF;
	Thu, 21 Aug 2025 14:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDH2hU+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C8710E9AF;
 Thu, 21 Aug 2025 14:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755786715; x=1787322715;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JchTs9JBcEUG+OwpfNqc/s8R8GQyYoI0OGoNmN+Mexg=;
 b=WDH2hU+YHrOs6640u+Xnclm9vVmMI/HSlXiY4nIo+Q/5GU+WQoROdQFI
 s/Y3RECOIF3DJFu+bKHka0PXn2q62PM5rwUCw7uLWKdBk/ScXd95czyh5
 qc2ltT39xGbVxkZ5taitiemBaMDM2NJvATnmHTFsM54B9Z7MRRlZjatiZ
 o4CPWDsnV/C4gE6zmgOVco7gnDuMlALGvBKNo7Ee4365qlDki7kYuoKMF
 ExGs8wg9mS+23X8kdvupj7hu9dWJXB6d7IPjSael/Bw39/JnZ274aQz+r
 tNGAgL7dGainiUq0FPPFaW5x+8wFf2n62bsNEfrpKX7z7/NM3fkmismBD Q==;
X-CSE-ConnectionGUID: lVbIFiRwRAKbbm3TJsPhRg==
X-CSE-MsgGUID: aBfcMQr0SXGkmUoDqZihWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69515408"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="69515408"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:31:55 -0700
X-CSE-ConnectionGUID: HD9N9hJ8T0KXTc2ZBfadQQ==
X-CSE-MsgGUID: R4IzHCedTEKOMG7zJzAGCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="199406257"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:31:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 07:31:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 07:31:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.81)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 07:31:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQKgc6oB/+7l/56kotzJccaH+m2G+WdqM7WAt2hl0VADCMXvP9oBmRnRGeKgGFHjZOO1gD5/e1ZfXGsdwCCeKbFls/AD/8JpYLmoEcgt+wDGdhPB5HiM1yFvv92H3vWml1dAn63S/Npah640Mn8jxalF6xZMo6cjBVeC170PqrCpqsBORLQsc06kRZdugBCVoFTf3SGxCblQjB1ptb+hRH+8bfsUHs+gMAuRUqrsvU8S7gCJ6W7alHmyEzWys5qscToEC/Xuwb7JAS0fJ4UGoBqyRKBU6DS2nLgkqCW39xdIiv6ZFhVOOuUChni/TaNqbJfea6JQhBdBQUv5KTIZ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CyiTaN0IE0x0L152KnxBLzVaHqprwhgb9C5FGytO6o=;
 b=RxMLwDdLU7RfC6QWZpNoI25aL2f4ESVvRU6pWk31qxVHNlljA9eZT4LhRVEvX4Ydi/j5FM0bXdFJ1LbHUtlgixUlEPGAslR1YUsNPDT/PS3vkRzGsjUJiY2EkAzcIAz98rlk67X/2sSADA8IgysTH/XuNyHvLORNxg661aNRtDgPT7jrdyFZK27DVKw5eGRJqX79I/s+bu8X8ibbd0cnKbJCNYkS8/Hjyjl04k9fuOOQL1wbpHI5fTwBvQwl8v/Is5RuhU8yT0G+aZpH7TpVlr5ZkplZq+R2kH77bdilWP72TA5AYiNkbNssyHoTMZtgM29Y5UGq73d15fsphEOi9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.15; Thu, 21 Aug 2025 14:31:52 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 14:31:52 +0000
Message-ID: <20ee25be-90cf-4a00-8ffa-0b22c7a1b493@intel.com>
Date: Thu, 21 Aug 2025 20:01:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/10] drm: Add a vendor-specific recovery method to
 drm device wedged uevent
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Maxime Ripard <mripard@kernel.org>, 
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, <simona.vetter@ffwll.ch>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>
References: <20250814121448.3380784-1-riana.tauro@intel.com>
 <20250814121448.3380784-3-riana.tauro@intel.com> <aKICgFd9IfSRGbYq@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aKICgFd9IfSRGbYq@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d928e06-097b-45af-b3eb-08dde0bf7833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWRSb2N0N2tqQjQwSnE4MnFhcXA0eVA5QlBraDlOT3FZMDdpb2NhbHlVQ1hN?=
 =?utf-8?B?eElIN1drbTRXOFJDdTRzWExndjJnMG41U3Q4NTgrOW84OFNnaVVqb2hBL1kz?=
 =?utf-8?B?YmtCZmdJSS9tYmRKeisvL2k1Ryt1K0Nmbyt3bDArSnk3M0pvcmVUT3hqR2F4?=
 =?utf-8?B?OWEvRURXUWJmK3pkV2E2Y09ERyt2SDl1MWpYNVhzRklaMFJyVGRIWkJJMWN5?=
 =?utf-8?B?eFBMVnp1cFk2bUJmOHJvNGNCeTVyd2FhRnNKM3ZCSk51RGRZR1d4WFFxdTEw?=
 =?utf-8?B?M2szaXJ5QisyQkRJbUg4VHdkTDVyeXRQVjZ4OEdzWjZuY093RmRUSTM2SlY5?=
 =?utf-8?B?ZkpiVkdUTGxYUkpORmU1VGJqYkJFMVcyekFac2NLQWhodXhpU2VZd1YvSW5t?=
 =?utf-8?B?bk5jZ2s1bWR1ZmlYbko3Vmd1THlsNkpIRVpKbjFZdHRqUmhwNVdkVVhrOW4w?=
 =?utf-8?B?Skdpa1doWUV5ZWpXNTFmRTlZcWtUWi8yZ21sODM3TmNsaEZWd285Qyt6VTZp?=
 =?utf-8?B?b0VSNkc5ZktjaW1xa0ZpK3VxK25nMVcxNFpMeTZEdnB1cVRTUUNiZHU2THZO?=
 =?utf-8?B?SjNnVWQyNjJ4cjF3TkRWaDRJVzMxbHR0bWJ4S2RTb2lTdFpqMldQR2dGNlNH?=
 =?utf-8?B?ZmFObkdGNUEvSS9vQ1l3UWZyTmxrSjlqdUErQVRJa09tRjNjYWlnZnRYUnNK?=
 =?utf-8?B?LzlFS0JYNjE2S3VFR2JjMEJuOUJsRFJPV3A3ZjdqOFh2bGVGU0NtZEFiVlBk?=
 =?utf-8?B?R0tWSENoT0J2dE03akwzMmR4ZTdJUTljOHdFdXczUW1zMkh5MEY2aVptdEpv?=
 =?utf-8?B?Um1ydXEzSEdpVEJzM2draTZ2RmxqMGZ1TFFaV1NEZEdhaXNkOGFxTk1hU1VV?=
 =?utf-8?B?cVkzK2pPZDludXI4NEVXL2VqMzg2YUk2cE41QWdETWVwVlVKZmtXNXd3WUZw?=
 =?utf-8?B?ZW5sYkpOcVZqRXFvTmxkZXRuejI0OFEvdFN2c3d1dkxKL3lROE8vVWJMRUR6?=
 =?utf-8?B?VUpIRnN1MEtvRDFmejhJelpYbllUcllwQjZGNWpWRkdKWkVyTGVab3dGYkZV?=
 =?utf-8?B?cmlKV1NCcEVHdzRYUHl4M0p0Y0NQNkg5ZTk2RUJ6N0tUa1RFaGdHNWg4NTFE?=
 =?utf-8?B?V2FtUU9XQXFNOXFaM2ZqaHdGZzA2WmsrdUsrUjNYT3ZLM2JVNVJ1U1hqZHgy?=
 =?utf-8?B?OURJcjA3QlNVVDdodWp0cE5VbnljejArVFhzcXR4MUZHWlk5cFprR2FBblBN?=
 =?utf-8?B?WTAveFhiN3dKV0JmK08rSkZzZUQ5SURVd3ZSTTRXbFdVNGxNVGhOL0FvMHJl?=
 =?utf-8?B?MkRtMS93MXdoL1Y3RHI4VDZzUGhwYnBPK1hzakhPUW9ncTZ4RHBHQkZEalpF?=
 =?utf-8?B?Z3cwY3NHejFVR0tJd1RDTVNLWDdYcmt4bW15R3VKT2J5YmFnYWlJM0JkZEJn?=
 =?utf-8?B?L1BuaVlGMG0xREkxU2RMVDd2MzZIZzhncmwzR0dnTVppSFdjanVaSXgrK0x1?=
 =?utf-8?B?VndQNWpLVjUyR2psdElDQk5WK2ZIVFFselR2MHJ2TFlrVlFoTjNRRXdFUGYy?=
 =?utf-8?B?WmJ4MXVoVTd1ckRLNFpYUG5VcGE3c0JqNzBTTERqdFpNUlpxcldJWmJhd1Aw?=
 =?utf-8?B?TWtjRWVwWlJ5Q3gxL3ZhYStJcitEYk8vQzFtT1IrYW1Fa0w4aEJkY2pYOGNL?=
 =?utf-8?B?UDVZa0tmbVZGVnlkYVFSNVFHZW1NdFh3UFF1NklNZFdIK1kxSW5DVG9CdVVu?=
 =?utf-8?B?U242U25EbU9UOE1BTzJBUm5HbzRUcGplWlU2TnVoQ1lpempUeVVpWjEzNHJr?=
 =?utf-8?B?WC9DZkdXR2F1MDRVMnFBbWg0R21zQWNxdEFuTFd2SGo4NUlrQUIyVFFEZUVr?=
 =?utf-8?B?aktHYlZvc0huMXpRZHFCenFSYUg5SWRwcVNXY0ppNGIxSXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0x1bnpxYnFTVnRJSnBCMmYxNzFvbjVmaG0rYTN6UjNNWGJVbFZtUTUySkxG?=
 =?utf-8?B?UDcrWUtnbllCUHk5NUNya1BkNzlaWU4rTlRKVXBScGIxQnYzWlBLbTFqSkhH?=
 =?utf-8?B?Tkhyd1Y4em1pSjFtU21vMWlFRGJUeVF0VU9NZytLbVFmL1VQTnpYdUtJUlhS?=
 =?utf-8?B?YTQzSG5pV1U4ajVIUWlOSkMyeDFhd0NGWSs4QjhPaVByVkhvSFVYZy84dUJZ?=
 =?utf-8?B?L09NMWdDa01ZV00vY1VjT1hvamFNVXVqaGZaTzZRVXJ3dFM3VWE5MS9QVkF1?=
 =?utf-8?B?cUsxb0wxRTZtTWtxcThncVhycXcrRGU5cTh5YmNrbFBRbUZwaVdQcDkzUlRO?=
 =?utf-8?B?ZnVKeTlqamxLTFVlRzlPb21ad3p1ZytKS1V3WUZmbW10WmdQRFFKU2ZSNnli?=
 =?utf-8?B?TlJhTUY3NG9RN1JObDBXMFFWTGZUWHZMR0VST0xub0xvMkFPUHgway9LLzdz?=
 =?utf-8?B?TDdMQy80YVVIcW81RDBTdEI0ODZZOGp3Mzh4aWdhZnkxS3ZTMEdlc3RVaWJn?=
 =?utf-8?B?Yk5BK0xYOFAzcWdZL1lWbFdyeVhic25yYUJNVUIzUm9lL1hHcm1YV21RTFlt?=
 =?utf-8?B?b21EUlZzZ2REbW1maDZEQnoxTUZNRkgzbnMxN3JickdTSUF3K3JDY01OcWF1?=
 =?utf-8?B?Q2VQYXowWnI2WlhtVDAxYm9HdDYwUkd6aXYvdHUyMENRL09wMkxDRmZINkxa?=
 =?utf-8?B?eVR6ZkZnUEFXNWJnWktNVlczYXdzZDAvRkVNUWxndHM4cGIrSHo3YjdWdGMr?=
 =?utf-8?B?R1VxSDdabnAvQWJRbHRndTFHSlQ3ZWh2d012SHNKVTNydFNOQllYemNWUFZD?=
 =?utf-8?B?ZzQrZHpvTEtmcjRJUUhOYnpGQWJhODBtMnFZM21YaUdBU3VaRHR5RGhJNmtX?=
 =?utf-8?B?d1IvaXN2SGNxaHBQOXRPbDcxd01pQ0k5WHQ3Zlh3aWZkc1Z0MXJaeGtDbTZ2?=
 =?utf-8?B?V2NWOXZtMTBuT2xPN1g5Q3NTYnZkYUxqUmpWenVaUTBzWE93QktKNFpDNTlZ?=
 =?utf-8?B?Q2dkUGplS2Y0djljUEoyS2s4WnBjRzFpMkdicS9neU8rN09nMGtBWUxUZjZK?=
 =?utf-8?B?UWcwMjR5aUd5RnZQdmlReDhESXozdHZMdm85RDZHOEtQUkI2WGh2dkFFUjN5?=
 =?utf-8?B?Ui8xMGNHNWlCZWMrbWNjSXdJZjF2Z3F5TUkvTUl2MnN3dTIxL3VSNytqUGdY?=
 =?utf-8?B?aGE0akRNME50YmhsTUFtVjVGQzYvMStDRlJOUnU2eVJnWS9jZTJSVjhyVU03?=
 =?utf-8?B?ckZqVHNqMHhoNGtlU0IyY3pvV2VNU3kxMHZGSFJOdXJGTTdPS3lHRVFubUFU?=
 =?utf-8?B?aExDc3UxSVZ4aG5xNDRIRjJUWXIyYmIzOGNMOW11d3o3OS9zWlArQU92bmxy?=
 =?utf-8?B?Z0c1TnZuMGkzLytNYUdiQklycDJMSExKVDNyV0hPdXBmMnZHNkt3aTFDd09p?=
 =?utf-8?B?TVdtZHVVenNwRmdTTnZvdjgyM0g1M2hoaHhlb2lXVktPNWF4MG1tNlBWSDA4?=
 =?utf-8?B?TndJOE9OS1lUUXNpZGk5cmxiUVNxTGhDMVUzK3VsSGQ5ZitTNGFTZDhmN3BN?=
 =?utf-8?B?Nmp3VWVEM3JYbmNGRWw3Vk55QkNCZ2ZtR1czTnJaZ2VDbEdTZFJpb29wUnJC?=
 =?utf-8?B?dm5sMkFIdDQ3Z0p4UUFpbFBHd1prUDVOT0xoTko4VWxERWNJZzZZRFZ3Rnlz?=
 =?utf-8?B?S2laWmgwN0UrRjBPdGxjT214cUlYTDlzaGZHbWxmdGQ5clQ4TE9kVmhJNTJo?=
 =?utf-8?B?NFdzZE4wUTRvYm5HWXVZaTVjV2Q3V1dVSlIvL2JDZHZrNFpEUXZkMjRJUmxE?=
 =?utf-8?B?RlpPMW43dXpKUk1tQVpRSGJvQ1hnUVFoTExMM3RscnNnTGNXQ2VwcnQ1MmRM?=
 =?utf-8?B?VTZ1YnR3aVhQUkRaeU9yL0NabWtib3RTUGxJa0thWXJYeWdNZ2pxaXpzRHF1?=
 =?utf-8?B?TUp4VUhZWWI4YnFndUYyY2R5OVFsMkZqVEcvQXM1cThSWDdBa0w3cmsvQnJF?=
 =?utf-8?B?OXk0UGNUL0lpSGdpU2dManhBUnRGTXRQMlE2WHIwdlRUM0tmNm1ic1ZlZzBS?=
 =?utf-8?B?YTRIRGZSamY1L3J1ZWRZZEhiNG1jS2hTVnlmWkx1UXpaNWMzOU8zOEJIWXhF?=
 =?utf-8?Q?74W5TwlfdVKbzY7f0g/UOZr+S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d928e06-097b-45af-b3eb-08dde0bf7833
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 14:31:52.1404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYhW/TOBrBG/ZnM00ZLMdjcl/5mTWnc1pmfYsH9rELWJg/ZEHa7FqhW10sHSkXF45/n/U8qS87K1ikNiI/z0rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7180
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

Hi Maxime

This patch has the changes suggested wrt to documentation in v7. Have 
added whatever Rodrigo suggested in the doc. Please let us know if the 
changes are okay and if the patch can be merged.

This needs a drm-misc maintainer ack to go ahead.

Thanks
Riana

On 8/17/2025 9:55 PM, Rodrigo Vivi wrote:
> On Thu, Aug 14, 2025 at 05:44:32PM +0530, Riana Tauro wrote:
>> Address the need for a recovery method (firmware flash on Firmware errors)
>> introduced in the later patches of Xe KMD.
>> Whenever XE KMD detects a firmware error, a firmware flash is required to
>> recover the device to normal operation.
>>
>> The initial proposal to use 'firmware-flash' as a recovery method was
>> not applicable to other drivers and could cause multiple recovery
>> methods specific to vendors to be added.
>> To address this a more generic 'vendor-specific' method is introduced,
>> guiding users to refer to vendor specific documentation and system logs
>> for detailed vendor specific recovery procedure.
>>
>> Add a recovery method 'WEDGED=vendor-specific' for such errors.
>> Vendors must provide additional recovery documentation if this method
>> is used.
>>
>> It is the responsibility of the consumer to refer to the correct vendor
>> specific documentation and usecase before attempting a recovery.
>>
>> For example: If driver is XE KMD, the consumer must refer
>> to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.
>>
>> v2: fix documentation (Raag)
>> v3: add more details to commit message (Sima, Rodrigo, Raag)
>>      add an example script to the documentation (Raag)
>> v4: use consistent naming (Raag)
>> v5: fix commit message
>> v6: add more documentation
>>
>> Cc: André Almeida <andrealmeid@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> 
> Folks, is it clear now? can we move ahead and get this through drm-xe-next?
> 
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   Documentation/gpu/drm-uapi.rst | 47 +++++++++++++++++++++++++++++-----
>>   drivers/gpu/drm/drm_drv.c      |  2 ++
>>   include/drm/drm_device.h       |  4 +++
>>   3 files changed, 46 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 843facf01b2d..669a6b9da0b2 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -418,13 +418,12 @@ needed.
>>   Recovery
>>   --------
>>   
>> -Current implementation defines three recovery methods, out of which, drivers
>> +Current implementation defines four recovery methods, out of which, drivers
>>   can use any one, multiple or none. Method(s) of choice will be sent in the
>>   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>> -more side-effects. If driver is unsure about recovery or method is unknown
>> -(like soft/hard system reboot, firmware flashing, physical device replacement
>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
>> -will be sent instead.
>> +more side-effects. See the section `Vendor Specific Recovery`_
>> +for ``WEDGED=vendor-specific``. If driver is unsure about recovery or
>> +method is unknown, ``WEDGED=unknown`` will be sent instead.
>>   
>>   Userspace consumers can parse this event and attempt recovery as per the
>>   following expectations.
>> @@ -435,6 +434,7 @@ following expectations.
>>       none            optional telemetry collection
>>       rebind          unbind + bind driver
>>       bus-reset       unbind + bus reset/re-enumeration + bind
>> +    vendor-specific vendor specific recovery method
>>       unknown         consumer policy
>>       =============== ========================================
>>   
>> @@ -446,6 +446,35 @@ telemetry information (devcoredump, syslog). This is useful because the first
>>   hang is usually the most critical one which can result in consequential hangs or
>>   complete wedging.
>>   
>> +
>> +Vendor Specific Recovery
>> +------------------------
>> +
>> +When ``WEDGED=vendor-specific`` is sent, it indicates that the device requires
>> +a recovery procedure specific to the hardware vendor and is not one of the
>> +standardized approaches.
>> +
>> +``WEDGED=vendor-specific`` may be used to indicate different cases within a
>> +single vendor driver, each requiring a distinct recovery procedure.
>> +In such scenarios, the vendor driver must provide comprehensive documentation
>> +that describes each case, includes additional hints to identify specific case and
>> +outlines the corresponding recovery procedures. The documentation includes:
>> +
>> +Case - A list of all cases that sends the ``WEDGED=vendor-specific`` recovery method.
>> +
>> +Hints - Additional Information to assist the userspace consumer in identifying and
>> +differentiating between different cases. This can be exposed through sysfs, debugfs,
>> +traces, dmesg etc.
>> +
>> +Recovery Procedure - Clear instructions and guidance for recovering each case.
>> +This may include userspace scripts, tools needed for the recovery procedure.
>> +
>> +It is the responsibility of the admin/userspace consumer to identify the case and
>> +verify additional identification hints before attempting a recovery procedure.
>> +
>> +Example: If the device uses the Xe driver, then userspace consumer should refer to
>> +:ref:`Xe Device Wedging <xe-device-wedging>` for the detailed documentation.
>> +
>>   Task information
>>   ----------------
>>   
>> @@ -472,8 +501,12 @@ erroring out, all device memory should be unmapped and file descriptors should
>>   be closed to prevent leaks or undefined behaviour. The idea here is to clear the
>>   device of all user context beforehand and set the stage for a clean recovery.
>>   
>> -Example
>> --------
>> +For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
>> +consumer to check the driver documentation and the usecase before attempting
>> +a recovery.
>> +
>> +Example - rebind
>> +----------------
>>   
>>   Udev rule::
>>   
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index cdd591b11488..0ac723a46a91 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>>   		return "rebind";
>>   	case DRM_WEDGE_RECOVERY_BUS_RESET:
>>   		return "bus-reset";
>> +	case DRM_WEDGE_RECOVERY_VENDOR:
>> +		return "vendor-specific";
>>   	default:
>>   		return NULL;
>>   	}
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index a33aedd5e9ec..59fd3f4d5995 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -26,10 +26,14 @@ struct pci_controller;
>>    * Recovery methods for wedged device in order of less to more side-effects.
>>    * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>>    * use any one, multiple (or'd) or none depending on their needs.
>> + *
>> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
>> + * details.
>>    */
>>   #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>>   #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>>   #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>>   
>>   /**
>>    * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>> -- 
>> 2.47.1
>>

