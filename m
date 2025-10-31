Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D31EC2640E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 17:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C4310E1ED;
	Fri, 31 Oct 2025 16:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SeZ5NKOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73ADA10E1ED;
 Fri, 31 Oct 2025 16:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761929964; x=1793465964;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+S7BevVvlHugSpvJQCoUU2R5wqTYcBdijtui+VwQkI4=;
 b=SeZ5NKOw6YtJVWyIez6giw3HU41x+pnXNoAx8AnGyGz78g1TC+FTWq6G
 YxyCJXxOT8scpyoryPHJwMlccV4jV+vD6hXMdnL7XUbbHXqU9sO/ARWnt
 vUMU86bMrZzn8Ba5GllEuFcuwfreyaaeUcy2w9cpfllq3eSunZYTYz9h3
 Hneyew17iFNOtB6kV07GXaxUGr2bFnbIxMKZ3c1yhAlWWEf6bFz4ZHASc
 TBYqdFGwwVE2tzWGPPM9L+bbTr0izkOLDCRUjhE5EtWzTjmR64KTDUmQa
 ixfpbQR6Nu12v5vrAu6a+fOA3sJ60A+PaJZXEp6iSkVNMjopIoMA0UOPT A==;
X-CSE-ConnectionGUID: YqYmBiUITC26RtWY78e82Q==
X-CSE-MsgGUID: xxBgVrXuQrirFpUfKWM+lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="74771527"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="74771527"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:59:24 -0700
X-CSE-ConnectionGUID: yYi8dTy3QhKLt5WLUAOlOg==
X-CSE-MsgGUID: a1JaboM9QIOyRxuWeTKq1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186158187"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:59:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:59:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 09:59:23 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:59:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVxPbcPN3LVBOo3RGQPgrc3WAVvn/pJLd+I70y/LuvF9drGEA8Hev3gjalSVonEi43RGdxgxI4+Eu19AbQBk8B9q+Y0NEkLeYK98nYdvuROFKG5rxhrzEd8vXyYFQBpcnCE1ndX0tVefGGpJY+m76aKRmGdmwdZghnhnQLDcrkoy14/MFZSGWiJ/YislLcFpk+jmJQcRCaSpJmhezJnPf4clT3mr2i/k1pdEPmEWdCjqoQZRc94NdgmupZxe03D/haFJ1HVS7pGNZEjAGP20v+c87WNdKsm7gIshiATLOkxs49DeMJLLthDfaI66R2GOQuVMu9rnM7NWSp0RuvCFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uSDwh3Ue+4A4y+0RuyqjGGG0VmIu83P76Sod9/JxIs=;
 b=NXGy9SnfvjgPuOmqbzMQq0z4ycYcy2K4/UVvjRdvGI6LEs6UBNQUtc7ecI1b1TyYXC0ZaJPLBvMZxLYbHeLXgS0+2f/qNfavHplxmfildp+sjJRFMTB4UkQTxGIkNT+NpvD3rV8198R762offidNOMuFR9mMcsz+bXCdDGRemUFslel12LM/lfZHEROfyv4WZ9gI8N3F0plRJXteXAaSznVywi37R8i2rSzHVWhH2TzNZuwCLOYbdirmNKZ48tsqzWH1nWHoEtJlGwA/0FRhCdgxrp9XXF+jyuJtTuKk7IpZhwiiFceUB+bCX4b2ghOuF7kUC3ycRXP6mrEcXcrfMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS4PPFCECA32305.namprd11.prod.outlook.com (2603:10b6:f:fc02::51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 16:59:21 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 16:59:21 +0000
Message-ID: <eb4d6982-e98d-48f0-a69d-617218686514@intel.com>
Date: Fri, 31 Oct 2025 17:59:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/28] drm/xe/pf: Add helpers for VF GGTT migration
 data handling
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-18-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251030203135.337696-18-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0463.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS4PPFCECA32305:EE_
X-MS-Office365-Filtering-Correlation-Id: d677fdc3-cff0-430c-e336-08de189ed56b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkEzeXNzVTM4a3FsTEcyVXVOWktNNVdJb3c3NjBla1M0SEVpQnh0eUd1c0x5?=
 =?utf-8?B?YU1SZGNIUlVtb25SMWg1RkZad2lVZlFZcEJDSlVyenlGYmNuN09wa0pHVGV5?=
 =?utf-8?B?WkJNaXFWenh2dmVRMTdiemx0cDloaFB0OERCWXNXbFd3aWE2aWczRGs2YUhn?=
 =?utf-8?B?TWVxeHM1cTNFNVo1QlJsNnJJdDhCVGIxeVMyQy9RTnhpdTd6clZIOUorUzVL?=
 =?utf-8?B?N0doZzBxd3ZRN3BGemN0QXRic1poMVpDeUZETTV2Y2NJTktVWjdOTURLMEUz?=
 =?utf-8?B?MjF4NDVuY1AzbW1kSWJvVWpobzlmeWVlbWM3R0ltTUEvSDBvYnJjb3hMVmN0?=
 =?utf-8?B?TERjdGxoZHVDWmxrYlk0NFowZE43OFg4am9XT1I2dERqZU5QelBMS29jcVRs?=
 =?utf-8?B?WjRyWE5qcjZvWmt5NUhlbzBjMUFkS2FRUnNVcHpLZ0tFb0o1bHRyVXFkWFoz?=
 =?utf-8?B?emV2SVBva295YUoyazVKNXFjMTBydkxwSUp6Rzd1cDJvWGlVUkQ5MUpKNW9z?=
 =?utf-8?B?L2pVU0hMa084K2pjRDMrNmh5amFuUnZyL1Vmd0ZUNUF2TlA4dnh6dVJXTkIx?=
 =?utf-8?B?WENEVXp2TDJwbDBFcFphZW9NcW1pdG5KYWg2eWVBbWpxU1pTeDFKUGQwM2NU?=
 =?utf-8?B?c1ZiOGxURmV4am1rdnpYemMxOFY1U29BdjVFdElTVXlhNTljQWZScGxuNWQ2?=
 =?utf-8?B?a0JqZ0JUNXVoRnV0VnJubEk2RStKTW5hZ1ZUWm4yUTF4dUZYUTl6akVKN29B?=
 =?utf-8?B?cWNERlBtbDJ6bldoWVZhT0oyMjFkM0tPSUdQcUgxRGtybS95LzBLWnR6blpD?=
 =?utf-8?B?YVFvRGlhcktVbG1ydU5mNHNiZjVxQW9iRk9iUWdtUXJsMW9nSjJrVjIrNU1z?=
 =?utf-8?B?VExKUDdpTHQ5VTlVeXhod0RNUlgzdWJ2Y2NteXZxWUYreEdhaFgvTURKOElK?=
 =?utf-8?B?TW5CNlcwVmQ1VHVUVi96R2I3N1ZNUzZyM01qeVhRanNUNVZRRkxHZ0FWdE9E?=
 =?utf-8?B?MFpUOXV0SDZQR1NBR0ZkdHBHNGxoYURqMHVoV0FmQjFHOXd3UDVtWUNmSXFl?=
 =?utf-8?B?emNFNThkNEtpWFp4RlFBY1l1cnpLODYrOWU4QlRRcE1ISTNhcmxtZVY4Z2dZ?=
 =?utf-8?B?UE9rWDJTOGhyMnpDTHQwT3llTjRTN0hiZjh6Zlh4ZUU3aGh0QnZIL2xXcWdZ?=
 =?utf-8?B?VnFPN3IyaklWUTVNaksvMUVmY0RzdFhJdEVWRG56a0RZRE5jS2tPT2xhVGZa?=
 =?utf-8?B?OVFQeHNhTUhTUGZnckV0b0VobW4ybG5pRjJYRnB4dVlzQnpPVVRqaVFxVDJa?=
 =?utf-8?B?M1cyUGFDcDU5QXJWRjd4Y3NHYzg5YmVIbFFmeWs5ODlhQnhqT1BZYUo5Q1Rj?=
 =?utf-8?B?QlpmZi9JeWphNEhDeFJzZzQ4NVkvempLNUJXQThKN0laalVwZnRocnJaTnhF?=
 =?utf-8?B?OGJBbExtNUpycGxaQStWNFBIelBYYkpNR0pVdDM5RTdYM2xVNVJwaFRHZzd2?=
 =?utf-8?B?cFNvMG9ZRndJNEQ3Wkp4L2ZhRkdwMlF4cXBla0FIVzJXUVNMclovNS91K0Vz?=
 =?utf-8?B?cktvVDluRkJCRVJwN0hkaUF2MG13eUJ1SUlnT2RxWndNVWNWYXRMOERVMnZP?=
 =?utf-8?B?VXlmTGNIQVEwQXUxTnVzcE10UnR2SGVYeERIM1lSU0xRN3EwNlZEUVRLSnZt?=
 =?utf-8?B?UDQ1alF6aU16amNCTk92YUtSQ2Z6bVRESlhwTHVqcVdrRmVaeG14Q1FGaDdL?=
 =?utf-8?B?eWxjeHkrS1lPbmhUZE4rQndRbnp6QzU4UmlBRVBVdEZQUWFXY1llRHM4Smsz?=
 =?utf-8?B?K0trcERFSmN3ektsTkNYc2VqNjUwa0lrQSt0Qzh3NTN5eEhaQTlPbVByVVJT?=
 =?utf-8?B?SU1MMEF5ZXpOUVNXb0tMR2pSdVl4ZVI1WHhzT1o2R2FDcGtSdHh6dDNEblFT?=
 =?utf-8?B?M2RHcE95ZjFIRXhhbGcxVmNubmUvSHI4dDBPb3ZDTW05QmZaYTFPSkpTcVhO?=
 =?utf-8?Q?aJrzYmaUsWhknudsEyFd6kISGALNJ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWg2NXZsS01UWjJTWkY5alB0VWhTOXBkQlduUWdmdFc0b3lEYjE4bjNlSXUz?=
 =?utf-8?B?N3RpczhNWmxDdHQzRzJ6alhjeFFSSTZWMHpaR0pOU0NTQ09QRVYvYTU3YjBm?=
 =?utf-8?B?Rk9QNTYwWG1WUThGV05weHBLM3ZVZTd6QTZ5SkNPaVM2cThLK2JiVUNaVGRE?=
 =?utf-8?B?Ri8rbEtobnpPZDZ4VjBKMzVtTEkvdUhyNmJ3a0lKRWIvT2kwblNlaTVoaHU1?=
 =?utf-8?B?OGJ6ajZKZE04NWV2K01sL01veVUzKzJ3dlZZUml4Y2NQK25JaHQvbWNzdjJG?=
 =?utf-8?B?alRjNmIySFd4Q3RpUmQ0TjBKWU1DSGx6SUkwQi9SVjBjZTFNNWJXdUYxa2t3?=
 =?utf-8?B?YXQ2V015Sy9HNWVDUFdmU2wzaDFIMVd3YUc1TEhWMG82T245NFdxVEpZeENt?=
 =?utf-8?B?Z1AxakoxdGk4VHpXdy95UjM3V2R3ZGFhUytXazMwWC9hT1VWV1dXNU9SS0NP?=
 =?utf-8?B?NDA5dkRIQ2MvRkdvTVJqOFI0YVZwbnBoZHpiclF6cERVTFh0WUZOVHliWlhs?=
 =?utf-8?B?dGRpbkxGd3lnY0RXckhYSlFFdWJxZVppcy96VGpCMlp3cWtWcC8xQlJUUEdM?=
 =?utf-8?B?YkFHSGJQUHJoRnpXOTBocWhEUmtIK3NJcGlOUmpjdzJFUGE5bEpBWm5WcEtJ?=
 =?utf-8?B?dTJrVG5DRkZnb1VzOW9FMXdHRXZkNTVud3hLUFNZcTRRakN6bkNLK1c0aENP?=
 =?utf-8?B?bVd2V0lUclQvNlFvd0pWU0NncFd5N3c2dlhCQkJqNFY1azFDc1NDdUpGcGFv?=
 =?utf-8?B?RldGQ1M3bTVTTWg2eUgyRm1oVnowZVJ6MyttakY5d2p2WXlVL0NVc29LYU5L?=
 =?utf-8?B?a0RJbFFuaTBVaUQ3a3RaTW5mckJLUWZHS1FXQmI3cUlaZWpNR2xUR0dkVnFv?=
 =?utf-8?B?SlJOVlBST00waGZCenJidi9wemZ5N0pwY0JYU3J0VGxYa3NHTEZ5d3gwcTRi?=
 =?utf-8?B?WkQ0SnFpOWJRS3dsQ0g4M29wUXZuTEhDMUJMZDVHRmpWSENleUZjdlhCbnEv?=
 =?utf-8?B?SitlNVpVbzEwYWV5RUhIL0hYNytyQVh0SFZQSkVqeFVtK0ZCSnBrSlY0Si85?=
 =?utf-8?B?OFpNK3FPeEhRZkhwcXhPR2x6M05xY0VKZjlLZ0trZ3BZQ3hjb1RRSnJQZTNt?=
 =?utf-8?B?TStxbVRXM3pEV1p1QVVXUnljbFBRNUxvSmxVL0tVT2tLaGhPUlJiV1puSVhw?=
 =?utf-8?B?WDJBeS8rUmxQNFR3YUhNR1ZWaXdxSlplUFRCSXRFZUZqTGpZSkw1YmZFelB2?=
 =?utf-8?B?cFQvU0ZPOEpmUG85NXJFaEJ2SWovbnlld2x4b0liN0dOK2ROU3lCc29mY3Nz?=
 =?utf-8?B?eUx6UmRYV1hqc1NuZWd0SVliNGZVUzJWbStmL3h2dzNWNHFaUHdzUWhjcFM1?=
 =?utf-8?B?YXJZWkJHSFkyYnEycmhNV0xyOGFTa2VwT2pGZXlDVVB4VVhORHA5V3NyZ2wr?=
 =?utf-8?B?VGQxbnlCNThDdWdydXZSNmVoZGdva2UvelhEeEl4MWEzdi9GY3NqM2RXTVZp?=
 =?utf-8?B?ME1YZmIrWHlsdGxRODVaUVJubHYwV0Q4MWRaM0NUcEFpT3Fna1VodVNpWm9s?=
 =?utf-8?B?dnF4RnVTa2l6enhic2pIak92WmdiVnhoMXN0anpXSkJmZFhzblFjeFJ5VDg4?=
 =?utf-8?B?TWtZcG9RWHJLdGZ0bnNiZXpJdTNaeFNxYnp5RFc1M2VLSyt2NjFuNlY1djRL?=
 =?utf-8?B?cXdnakdhSkRoaERCQnBscFZRVUZoei9Ccm4zUDk5SEh5L0NSNjdVYXphU2dI?=
 =?utf-8?B?YVR3U0xPVmMwNGxMSzZ1R2JOMEQ0c0dMbHdabHhDYWIyYThUSVZ1a3hJZXhp?=
 =?utf-8?B?QXc2eXgyd3hta0hvaXBES05pcXVWYjBBUEVJd0RwbzJGSXllZ0dWaXkvbkhC?=
 =?utf-8?B?K1hTSi8xWGwyUDFrR1RYYnFXaTFwOXQ3b2laeXVxczVYTHg4Qno0OVNPZi9l?=
 =?utf-8?B?Z3pndzc0c040U2FEaUVLcHhxZnVMd0tObjFiNmovTGljbEw3dUpuMXBhdXlG?=
 =?utf-8?B?T0dxU0pZYXNGcDh5YlQ5aUhLWkR3U1RPU0FpMG5CVmFTZXlRQit5Q011RmVk?=
 =?utf-8?B?bUNYOGlLYUczNUI1VFd5TTVHbDMxOHpZemR5YiswZksyVUhSenZSbStzQm53?=
 =?utf-8?B?V1pLam54SS8zRnVBTHUyajhURVZUQklNTmtjbWlwVG9IWVZwVVBYV2xYYk5K?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d677fdc3-cff0-430c-e336-08de189ed56b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 16:59:20.9287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hvHVyQEHHRZjDV1D9IEKnoxMrkzYQNJVr99Pxe8jBObaJrKaYxtqokgBQO5R34zmd8cy60V9awECJHd43Pspc5FrtFKMe9y20CXwrVBE40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCECA32305
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



On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> In an upcoming change, the VF GGTT migration data will be handled as
> part of VF control state machine. Add the necessary helpers to allow the
> migration data transfer to/from the HW GGTT resource.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c               | 104 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h               |   4 +
>  drivers/gpu/drm/xe/xe_ggtt_types.h         |   2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  52 +++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   5 +
>  5 files changed, 167 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 20d226d90c50f..00ddb4f013466 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -151,6 +151,14 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  	ggtt_update_access_counter(ggtt);
>  }
>  
> +static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
> +{
> +	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> +	xe_tile_assert(ggtt->tile, addr < ggtt->size);
> +
> +	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
> +}
> +
>  static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  {
>  	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
> @@ -233,16 +241,19 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
>  static const struct xe_ggtt_pt_ops xelp_pt_ops = {
>  	.pte_encode_flags = xelp_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte,
> +	.ggtt_get_pte = xe_ggtt_get_pte,
>  };
>  
>  static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
>  	.pte_encode_flags = xelpg_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte,
> +	.ggtt_get_pte = xe_ggtt_get_pte,
>  };
>  
>  static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>  	.pte_encode_flags = xelpg_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
> +	.ggtt_get_pte = xe_ggtt_get_pte,
>  };
>  
>  static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
> @@ -889,6 +900,20 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
>  	return max_hole;
>  }
>  
> +/**
> + * xe_ggtt_node_pt_size() - Convert GGTT node size to its page table entries size.
> + * @node: the &xe_ggtt_node
> + *
> + * Return: GGTT node page table entries size in bytes.
> + */
> +size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node)
> +{
> +	if (!node)
> +		return 0;
> +
> +	return node->base.size / XE_PAGE_SIZE * sizeof(u64);
> +}
> +
>  #ifdef CONFIG_PCI_IOV
>  static u64 xe_encode_vfid_pte(u16 vfid)
>  {
> @@ -930,6 +955,85 @@ void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
>  	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
>  	mutex_unlock(&node->ggtt->lock);
>  }
> +
> +/**
> + * xe_ggtt_node_save() - Save a &xe_ggtt_node to a buffer.
> + * @node: the &xe_ggtt_node to be saved
> + * @dst: destination buffer
> + * @size: destination buffer size in bytes
> + * @vfid: VF identifier
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid)
> +{
> +	struct xe_ggtt *ggtt;
> +	u64 start, end;
> +	u64 *buf = dst;
> +	u64 pte;
> +
> +	if (!node)
> +		return -ENOENT;
> +
> +	guard(mutex)(&node->ggtt->lock);
> +
> +	ggtt = node->ggtt;
> +	start = node->base.start;
> +	end = start + size - 1;

as you've already noticed, this 'size' (PT size) is the right size to calc the end

> +
> +	if (xe_ggtt_node_pt_size(node) != size)
> +		return -EINVAL;
> +
> +	while (start < end) {
> +		pte = ggtt->pt_ops->ggtt_get_pte(ggtt, start);
> +		if (vfid != u64_get_bits(pte, GGTT_PTE_VFID))
> +			return -EPERM;
> +
> +		*buf++ = u64_replace_bits(pte, 0, GGTT_PTE_VFID);
> +		start += XE_PAGE_SIZE;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ggtt_node_load() - Load a &xe_ggtt_node from a buffer.
> + * @node: the &xe_ggtt_node to be loaded
> + * @src: source buffer
> + * @size: source buffer size in bytes
> + * @vfid: VF identifier
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid)
> +{
> +	u64 vfid_pte = xe_encode_vfid_pte(vfid);
> +	const u64 *buf = src;
> +	struct xe_ggtt *ggtt;
> +	u64 start, end;
> +
> +	if (!node)
> +		return -ENOENT;
> +
> +	guard(mutex)(&node->ggtt->lock);
> +
> +	ggtt = node->ggtt;
> +	start = node->base.start;
> +	end = start + size - 1;

ditto

> +
> +	if (xe_ggtt_node_pt_size(node) != size)
> +		return -EINVAL;
> +
> +	while (start < end) {
> +		vfid_pte = u64_replace_bits(*buf++, vfid, GGTT_PTE_VFID);
> +		ggtt->pt_ops->ggtt_set_pte(ggtt, start, vfid_pte);
> +		start += XE_PAGE_SIZE;
> +	}
> +	xe_ggtt_invalidate(ggtt);
> +
> +	return 0;
> +}
> +
>  #endif
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 75fc7a1efea76..1edf27608d39a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -41,8 +41,12 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>  u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
>  
> +size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node);
> +
>  #ifdef CONFIG_PCI_IOV
>  void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
> +int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid);
> +int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
>  #endif
>  
>  #ifndef CONFIG_LOCKDEP
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index c5e999d58ff2a..dacd796f81844 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -78,6 +78,8 @@ struct xe_ggtt_pt_ops {
>  	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
>  	/** @ggtt_set_pte: Directly write into GGTT's PTE */
>  	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
> +	/** @ggtt_get_pte: Directly read from GGTT's PTE */
> +	u64 (*ggtt_get_pte)(struct xe_ggtt *ggtt, u64 addr);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index c0c0215c07036..55444883f2ac3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -726,6 +726,58 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
>  	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_ggtt_save() - Save a VF provisioned GGTT data into a buffer.
> + * @gt: the &xe_gt
> + * @vfid: VF identifier (can't be 0)
> + * @buf: the GGTT data destination buffer (or NULL to query the buf size)
> + * @size: the size of the buffer (or 0 to query the buf size)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: size of the buffer needed to save GGTT data if querying,
> + *         0 on successful save or a negative error code on failure.
> + */
> +ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
> +					void *buf, size_t size)
> +{
> +	struct xe_ggtt_node *node;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, !(!buf ^ !size));
> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +	node = pf_pick_vf_config(gt, vfid)->ggtt_region;
> +
> +	if (!buf)
> +		return xe_ggtt_node_pt_size(node);
> +
> +	return xe_ggtt_node_save(node, buf, size, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_ggtt_restore() - Restore a VF provisioned GGTT data from a buffer.
> + * @gt: the &xe_gt
> + * @vfid: VF identifier (can't be 0)
> + * @buf: the GGTT data source buffer
> + * @size: the size of the buffer
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> +				       const void *buf, size_t size)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid);
> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return xe_ggtt_node_load(pf_pick_vf_config(gt, vfid)->ggtt_region, buf, size, vfid);
> +}
> +
>  static u32 pf_get_min_spare_ctxs(struct xe_gt *gt)
>  {
>  	/* XXX: preliminary */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 513e6512a575b..0293ba98eb6df 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -61,6 +61,11 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
>  int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>  				  const void *buf, size_t size);
>  
> +ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
> +					void *buf, size_t size);
> +int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> +				       const void *buf, size_t size);
> +
>  bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
>  
>  int xe_gt_sriov_pf_config_init(struct xe_gt *gt);

