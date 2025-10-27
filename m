Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490E2C0E9E7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C1B10E037;
	Mon, 27 Oct 2025 14:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I247+t7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD25898F5;
 Mon, 27 Oct 2025 14:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761576746; x=1793112746;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/1/tf3MktNNX8QBlJco8AtTqQKB0paXl1PfvjfpvsWs=;
 b=I247+t7vDrxZDqG3j3eRCyG+eugdmez1IN7B96aeTNQSp/WG0hEAoqaP
 a++ZQgnVljgMBHOnQSWxPmRjfsWRb3SOZolXDUi2Hd9BnHzxfJeUDpnjH
 HqbndW92xsK2urvJ2m5zJrnBJa95aWpUW42CYc7NrvgS4oNdlqqRNkYvt
 qhXKG3bRgGfjQGKO4nYd+xeag68TYbUBLDQUqDbRuSPR+dcIfHkb9Tzhp
 Z2/HyJriGmJGyCHgWEuP7HGq1hN5rHla/S9czEkvMbRWN8pxlWpCkT6Va
 CSuyw9LBM8Z2hnaztyAs6IwiGKCOBm1P1XjDb3MCTzLj5jV8Kt6O2BBYt g==;
X-CSE-ConnectionGUID: 3sev0gUAQoipXBFvcN0vdw==
X-CSE-MsgGUID: ajGWcp87TW2aREMYA7P8+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62688810"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="62688810"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 07:52:25 -0700
X-CSE-ConnectionGUID: xoP7CMRuRVaCm1Fd2xgoGg==
X-CSE-MsgGUID: 1q6QCvhhRUuY3xwFPGIJng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="190274421"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 07:52:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 07:52:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 07:52:24 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 07:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txF/9QaxzEquuPa0cQ9MvIzH89i73bz0lRhdF+tvXqXH8qod0Lu+gZjFiUhYXTkt0FknDATT16THmE15V79y6kDQjH8N920cXLJS+i45vJ1em4LipXKQMDmYbOG5qARs+9QkjZZJuiz20r5dxlJtip8Qsxma5r4j6k8g/yZcxUPyM4sO5HfN8uq5YgDoTq1RFhsWTcX8sSPgbUsQQMaGPZz2Xry3LalEVekX95Chel/Op5CSicGWJT83/uoEhcUP2LrXxUCzy292CQiuey5hyF3MZVct9B1Q/E2pemm3deJ2WHd4cSHcb3jMOzXVteyfZtE7Pdh6ouH3oAc6DxR5Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzPXZvtZDDu66oEcqeOUOGTpvKG01OTxTzrcnNrOk04=;
 b=d6B0SMeoedvLr+rf4haokkEHnFPfTcgEpcqLcI03KLwT9cTUVdOFJ0k+9Q3VnJZrOme07NTHIphelI4PS5sEcDe5O+b5dHIYyRlncvy2qEK1YE4Cw9RoiBEbeaUh5ZIOZX8ruVu2xDxTPbWsK1ufJpaPqUbw99YFMvC6vYhi+9Di5ZKHL0H645WhLfK0FTQoK1x7PatDDm49kz9qxYobfg5KqJGovFWNHO+coBe407HggDhxUfaO2TCVFmQrUGdf6SBW1Ho1kiqNEZ+ZJS5Q/IPRV2mv+93Akg+oo/nX6B9/lMrbKBuF4ziFJSHonvT4v3W18I56JpHHZ5RwMIxcnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Mon, 27 Oct 2025 14:52:22 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 14:52:22 +0000
Date: Mon, 27 Oct 2025 15:52:18 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 07/26] drm/xe/pf: Add minimalistic migration descriptor
Message-ID: <ay63tnff367lufyw6z5clf744juyjmh5x7drvbjugi76o24m52@2vq3nzocwple>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-8-michal.winiarski@intel.com>
 <5ad84261-fead-42ae-ac6c-8ecf17db7462@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ad84261-fead-42ae-ac6c-8ecf17db7462@intel.com>
X-ClientProxiedBy: VI1PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:802:2::48) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 07de7e2b-6e8a-4355-3f32-08de15686f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWFQQWQvcFdJeExldlgzcDhVR1B3MWltYjJvQWtFcnVSbkUrSUV4blhpMWdG?=
 =?utf-8?B?eU8rajI1ekQ1SW54OEkzU3RKMEdobTB1USt2WmdlNmc1UzJ0R3V6VmVKcjJW?=
 =?utf-8?B?dEJiRnl4cTRMMWpLTm4zc0IzdUI4aVk0VWVRb0FZSno1bXRZRkgrOXJzOTJ6?=
 =?utf-8?B?RDJNR3VrTXFNOXc5MjZMUjFWNzgxQjFlT1RwSjZWQW5sNHVPcVkybmpBOG9S?=
 =?utf-8?B?bG9PWFVYaVV0T2xVM3Jmd1A1eTR4UWNRdzJ1OHpQRUdQamZRUzYrbTErQ2FC?=
 =?utf-8?B?NFJXdjVnTHE1Q1ljcHBkd2JBTm44Q0F6WDRGUFRWRjdUazJPR2Q1Z0swOTIy?=
 =?utf-8?B?VFBIM1llSVNWdm4xblBLTDR0ZVI0UjR0R2lhUkFMNFV5OEErbmxBNHRVNmkw?=
 =?utf-8?B?M3ZvZ0ZFWEo1aHp5bWdZZmI4MjRPalIzVGdPVU8vVVloK0w1cGIrWENadTB2?=
 =?utf-8?B?VnlyVjNhQkdsQlg3dE1zM1BCVTk3OFdHc2dQMVQyOVlOeHBnOGRNYnJ3eHVw?=
 =?utf-8?B?SUpiSjNkU1lvcVNqbGUxZll5OU10TnZVNnpYeFdmNDM4aWtQdjdvTkNGUFZR?=
 =?utf-8?B?MnpNcTJCcjZTcUhsenlNd0J5S3R3ZmQ3Z1ZxZkNoUjNEMW9GQm1KYU9vbjB0?=
 =?utf-8?B?RW9SbUlSbEJjdE82enNkcmxEMkQ4RUgwL1YyMzI5amV5cU5mQThZekxFL2cw?=
 =?utf-8?B?RmoyMFp4RFNOS2hadmhxQVBSWTBMUUhESzZ1RlJvRGtnMGQxd2htYmxwblZE?=
 =?utf-8?B?OHdUYnF1OHFCM3R5VkxYZHdFZU5LRC9FSmJLcFdoblcwQXhKUmlOM003WjF5?=
 =?utf-8?B?SG9iQnJzNUkvSHpCSVFMcnN3NHAxdDFxc2oyVTRFZTRabFBLTnRYRDZxeUFo?=
 =?utf-8?B?M3ZYVTEvMFA0Y1ZmWStwY2taVGpPTHFnUGRYbWlzUFgrQTNEM1dSYlp5ZWt1?=
 =?utf-8?B?UEpDZ2FuMGY1RXltYVhYS0lRa1dZVkp3dVVNbzU4WDZwcDBpeVpJTVl6dmZC?=
 =?utf-8?B?NzFIbmpmSjI1Q0xHKzlhNEV1dm14NnpocnR4WjVyRUZJNXdRVlBNUkVXbmRJ?=
 =?utf-8?B?ODNYcVpsbC8wTHhsZGpRMzM4Q2Z0UEUwb090QmYxbDRDSllvejBoSy9JL0Ux?=
 =?utf-8?B?SDZkQ0VLNEpNVC9SQW5KRmd2NnVLS1hBWVVYZ0tTWXlQNTVET0VrSjhNMXlh?=
 =?utf-8?B?ckpjdzFHbEh3RTEyZzMxcUt0bTl2SldiSkJzbFVTdjRVVUJuYmNFcHUrT01x?=
 =?utf-8?B?UFNOU1g1MFpXeDk5UGxTV1h3amp1N2VDMDZoY1Q4d3Brd1NxOG96U0d1TVlt?=
 =?utf-8?B?Z0NleFV1RDM2UFFqa1J4UUhJMyt5WUpjenNCTmkyM2FQSEdFTjhvdk81aWlh?=
 =?utf-8?B?WTBBeDRjck1xUkNRQ2h3cEJsSVMrNm13SlI0MDEwczR4cWxQR1hEVmRPVHdy?=
 =?utf-8?B?T3JsT2R5ZFJwbkEzcXpNY0R4WHpYL29LNG1LVUp0VEhCL1ErWnhsdUZTeWJS?=
 =?utf-8?B?cGp0MmRRYUxNWlJWdGV0L3FPY1VDeDF1YmlQNzlBZndNVkZKNnFhL2JoelVv?=
 =?utf-8?B?c1lnTGRrREdRbHdRR3J5Nk5kNTVOQ01tcWVFckJEMDV6UVBTRlhCWk5HVi9C?=
 =?utf-8?B?QXhjUGQ2Q0lhL2dUVmg5RmkweHpRdlA4Q29nakNrbmVVMExoYzBESVpqTU91?=
 =?utf-8?B?NFZicHArZmYzTGdBZUpQdjh4WWFnQ3hQcXVFWDlTeThYZ2NSbDhmMEg0OWZN?=
 =?utf-8?B?V0M2Ui94K05wdkJqUU5weTI0YzFGVDQzMVBEQ09LcDZrdTdKRldYYmJESEVU?=
 =?utf-8?B?RG1sd1NJVVRBNnVRSnNtZkVFd1BaUzhObnhXd21DcGhOaU4wOXE5YTF0a1JZ?=
 =?utf-8?B?WGFldVEyNXRVTktISkhSa21pdFNFRXRFdndOM1ZQdXdOU3JwWnhrbHdFU3Ar?=
 =?utf-8?Q?Fxp4x4ldfEZy43wDMu/9n7E6sW+6Ywbr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW5wSW5iSFpYOEl1ZEk0MHpnN0IzTHZSbmhEcGVBSW9xRnM5TnppaVBjR1I5?=
 =?utf-8?B?ZnVHa3lJdW4vaEd6QzlMZ0szQmovREVwc09KdVp2RU9UZy9ySXh2bnhiMHFJ?=
 =?utf-8?B?U05UN0RnUWZGakxNZldHeGZkRExwcXFzd2QrTVRRM3ZXMndsSVRoeElXK0JZ?=
 =?utf-8?B?S1FXSWViZ0hPVHZhS0YyWjNkRjR4ZHpNSXZxQXl4ODhheTlYQkRNNWIvaFht?=
 =?utf-8?B?SWhrSW9oNnBWL1RGaWZYTTRjZ05BVW9zbjR4dzd0dEI3M1R3OWR4OVA1MUFK?=
 =?utf-8?B?alV6MUtBaFd5NGZwQUFRSytiRjB2dWloNTVRQWlsM0pOVnphbmhmbS9TWFkx?=
 =?utf-8?B?R2NqQUgzbVp3OG9wZ0d2bWowNTBsUHV3UG5WTVBaZWRlNDNaN1BON3dMN0pJ?=
 =?utf-8?B?QXdwajZSUGdrWkJXN3N6dHdoK2FTclI5TjR1SWdvUVBtWTJ2TmZNVjJ5d3VI?=
 =?utf-8?B?UUJIWlVJMGw5bnhyc0YzTmRxcTYzRDZLeTVkd0pUZ1RGdUxnQ1dTUEkxTlJJ?=
 =?utf-8?B?cllYMDJsbXp5WFZMV3ppZ2VuTkorMVhYaXhtZWVrcHl6am9QY1ZHd3dVQVRw?=
 =?utf-8?B?cVJMdHY4Vno4S0wwRUNWUzcrYW1qQjVNclpKMEdlVE9xK3hLb2E3T2dmUHBM?=
 =?utf-8?B?T05ubUpkQ3hJejVkaHprejc0cjBGS09aREovcGt5WndNeXFOaG9pay82UVkx?=
 =?utf-8?B?dnM1S0VKTUJ4cU94QzdLUzFGOStib29zQVgyTFd0Y2kyaXErOWVVazhsMGxC?=
 =?utf-8?B?SlhKbXlzZDlNWHNqK3d1Z0xHUkp2RXF4SGxWSGZ1d2hEUGVxMDllL1FXaVl3?=
 =?utf-8?B?aW1hYW8zTGcrKzd5dTNIVkJ3ciswYkZXNmlVbXRGSFFQQldZcmVRYngzNjhW?=
 =?utf-8?B?VFdMR3Z1U082clNjclpVMndNREUyM2pLRm9RVnJCUHdKOGg2SU9wZS90cVBB?=
 =?utf-8?B?Y1ZyYXNWdExOU2RRNlJyOFg5eStxS2loMFNiUnRFSk5Cb3VHRWVkSjBIZXJj?=
 =?utf-8?B?KzZ3OHZmU2dkcGkvc2h2ekRZRXovUUROTGtEZHZlS3FtQVZBM05RMVRvTUlp?=
 =?utf-8?B?ekc2blJOczVHM0Y5NE9KaS9KcDMyaUlSTFp3eHo2ZmtpMitZNWY1WFdsQXph?=
 =?utf-8?B?MU5kcjdhY0F1MW9Da2hmd1MwaEJjSzAzY2RlNWh4WkdUVnVXMHFRN21wS3FL?=
 =?utf-8?B?T3grL0ZrYWE5SndNZXRmclNtUjNTN0orVVlnZy9oSnE4OXhJNHZ5ckJ2a2Iy?=
 =?utf-8?B?N283VU80eW1pdnFubzVWZzZIVWpEZ0N4NjRZcEV5UW9Uc1ViejAvejFNZm10?=
 =?utf-8?B?WnpOcHExTVJyaUEzLzRUMEhKTkZYY0ZWZEpGQzRPdFhZNEIzUndRQXJ4dHVQ?=
 =?utf-8?B?VjIzelJvV2JYejdIWWZSZk0ycmJrUVd5MFRmOEp2MVIzazhpTC9veWIrMStI?=
 =?utf-8?B?VlRBcm4rYWRnUHdPRU15Nnl0YjlSZ3NRMXc4K3Z0V3BrMGd5MzFPS2Q1ckt4?=
 =?utf-8?B?SGcwVDBDelhPVUViNWE2Z3FBaEUxNjNQTnU3cmR5ck40Rm5xVThYY3ZYWVdw?=
 =?utf-8?B?WWZGWTNlM3RZNHA3ZmZtazV4YU9JZW80cXZmdGFqLzQ0V1BSbmdUbm1EWUYw?=
 =?utf-8?B?QUtZUW9vcnZ6ZEhKbVArMW9mNnoyZVJPMUQ1QmZ0Y2cxRE9YWVhnS21sRmFp?=
 =?utf-8?B?aldmTjBNT3FENkIzU2RtV2EybVlZUHhCdUFBOHBMTk10QkdZS1FXNzE1UE1m?=
 =?utf-8?B?TGhXTDd0MGFvdmNxU2Z5ZEFqWTB3K21jVDZyRGFTUjZscWdSQzlDbHVyckpG?=
 =?utf-8?B?YlNqZ0VrNGE5dmhPcERTVGJpVFpma2p5MXh3ZVpXQnFjd2tEcnhZZ1pXbmpG?=
 =?utf-8?B?NHlIWGRhSVpLM0QyYy9nbUxteDdSZ0JYMmsyUXM3MkNNM0dYRzB4Vm10K2RQ?=
 =?utf-8?B?MFFMMHJBZlk2T0JlVUxNS2pnWUxMcVhOMUZ1ZmRFWWY3ZTdaUDY1bVh6cDFD?=
 =?utf-8?B?QjdsU0RsNFNwWkl4eFZmZ0N0NjlVWC91VjM5SElBak5KRVAxayt6M09qeVRT?=
 =?utf-8?B?My81a0JSTm9DLzJ6QlVneS83N1l1ditUbVFrandSWktBUmFpa0psenpXMmtP?=
 =?utf-8?B?enZDRERBSlc2OVlXUmhTZi95aTJJbkR2MERKTWpiTjQrY2ZJQUFVK2pwaE5Y?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07de7e2b-6e8a-4355-3f32-08de15686f24
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 14:52:22.0912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niuBqwVpZyG3vozbD+yNHbNssKg/6IxMZ8TW/9mxMTHUrKJ1N3OK+Iaz1xUaESAtcxmjFYNMlkxStDQwj+qdGUio2Z2ZGb5XABSRiP4pWKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
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

On Thu, Oct 23, 2025 at 12:49:52AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> > The descriptor reuses the KLV format used by GuC and contains metadata
> > that can be used to quickly fail migration when source is incompatible
> > with destination.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sriov_migration_data.c | 79 +++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_sriov_migration_data.h |  2 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c   |  6 ++
> >  3 files changed, 86 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> > index 4cd6c6fc9ba18..b58508c0c30f1 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> > +#include "xe_guc_klv_helpers.h"
> >  #include "xe_sriov_migration_data.h"
> >  #include "xe_sriov_pf_helpers.h"
> >  #include "xe_sriov_pf_migration.h"
> > @@ -383,11 +384,18 @@ ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
> >  	return produced;
> >  }
> >  
> > -#define MIGRATION_DESCRIPTOR_DWORDS 0
> > +#define MIGRATION_KLV_DEVICE_DEVID_KEY	0xf001u
> > +#define MIGRATION_KLV_DEVICE_DEVID_LEN	1u
> > +#define MIGRATION_KLV_DEVICE_REVID_KEY	0xf002u
> > +#define MIGRATION_KLV_DEVICE_REVID_LEN	1u
> > +
> > +#define MIGRATION_DESCRIPTOR_DWORDS	(GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_DEVID_LEN + \
> > +					 GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_REVID_LEN)
> >  static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
> >  {
> >  	struct xe_sriov_migration_data **desc = pf_pick_descriptor(xe, vfid);
> >  	struct xe_sriov_migration_data *data;
> > +	u32 *klvs;
> >  	int ret;
> >  
> >  	data = xe_sriov_migration_data_alloc(xe);
> > @@ -401,11 +409,80 @@ static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
> >  		return ret;
> >  	}
> >  
> > +	klvs = data->vaddr;
> > +	*klvs++ = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_DEVID_KEY,
> > +				     MIGRATION_KLV_DEVICE_DEVID_LEN);
> > +	*klvs++ = xe->info.devid;
> > +	*klvs++ = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_REVID_KEY,
> > +				     MIGRATION_KLV_DEVICE_REVID_LEN);
> > +	*klvs++ = xe->info.revid;
> > +
> 
> maybe add assert that written KLVs match descriptor size?

I'll track len written and verify with an assert.

> 
> >  	*desc = data;
> >  
> >  	return 0;
> >  }
> >  
> > +/**
> > + * xe_sriov_migration_data_process_descriptor() - Process migration data descriptor.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + * @data: the &struct xe_sriov_pf_migration_data containing the descriptor
> > + *
> > + * The descriptor uses the same KLV format as GuC, and contains metadata used for
> > + * checking migration data compatibility.
> > + *
> > + * Return: 0 on success, -errno on failure.
> > + */
> > +int xe_sriov_migration_data_process_descriptor(struct xe_device *xe, unsigned int vfid,
> > +					       struct xe_sriov_migration_data *data)
> > +{
> > +	u32 num_dwords = data->size / sizeof(u32);
> > +	u32 *klvs = data->vaddr;
> > +
> > +	xe_assert(xe, data->type == XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR);
> > +	if (data->size % sizeof(u32) != 0)
> 
> no need to compare against 0

Ok.

> 
> 	if (data->size % sizeof(u32))
> 
> > +		return -EINVAL;
> 
> for other errors we warn(), ok to be silent here?

Let's add:
xe_sriov_warn(xe, "Aborting migration, descriptor not in KLV format (size=%llu)\n",
              data->size);

> 
> > +
> > +	while (num_dwords >= GUC_KLV_LEN_MIN) {
> > +		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
> > +		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
> > +
> > +		klvs += GUC_KLV_LEN_MIN;
> > +		num_dwords -= GUC_KLV_LEN_MIN;
> > +
> 
> you should check len vs num_dwords here

Ok.

> 
> > +		switch (key) {
> > +		case MIGRATION_KLV_DEVICE_DEVID_KEY:
> > +			if (*klvs != xe->info.devid) {
> > +				xe_sriov_warn(xe,
> > +					      "Aborting migration, devid mismatch %#04x!=%#04x\n",
> 
> likely %#06x, as you need to count also "0x"

Ok.

> 
> > +					      *klvs, xe->info.devid);
> > +				return -ENODEV;
> > +			}
> > +			break;
> > +		case MIGRATION_KLV_DEVICE_REVID_KEY:
> > +			if (*klvs != xe->info.revid) {
> > +				xe_sriov_warn(xe,
> > +					      "Aborting migration, revid mismatch %#04x!=%#04x\n",
> > +					      *klvs, xe->info.revid);
> > +				return -ENODEV;
> > +			}
> > +			break;
> > +		default:
> > +			xe_sriov_dbg(xe,
> > +				     "Unknown migration descriptor key %#06x - skipping\n", key);
> 
> also print len? and some initial hexdump to help with debug?

I'll replace it with:

	xe_sriov_dbg(xe,
	             "Skipping unknown migration descriptor key %#06x (len=%#06x)\n",
	             key, len);
	print_hex_dump_bytes("desc: ", DUMP_PREFIX_OFFSET, klvs,
	                     min(SZ_64, len * sizeof(u32)));

> 
> > +			break;
> > +		}
> > +
> > +		if (len > num_dwords)
> > +			return -EINVAL;
> 
> this check should be earlier

Ok.

Thanks,
-Michał

> 
> > +
> > +		klvs += len;
> > +		num_dwords -= len;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
> >  {
> >  	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> > index 5cde6e9439677..e7f3b332124bc 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> > @@ -31,6 +31,8 @@ ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
> >  				     char __user *buf, size_t len);
> >  ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
> >  				      const char __user *buf, size_t len);
> > +int xe_sriov_migration_data_process_descriptor(struct xe_device *xe, unsigned int vfid,
> > +					       struct xe_sriov_migration_data *data);
> >  int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index 029e14f1ffa74..0b4b237780102 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -176,9 +176,15 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
> >  static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
> >  				struct xe_sriov_migration_data *data)
> >  {
> > +	int ret;
> > +
> >  	if (data->tile != 0 || data->gt != 0)
> >  		return -EINVAL;
> >  
> > +	ret = xe_sriov_migration_data_process_descriptor(xe, vfid, data);
> > +	if (ret)
> > +		return ret;
> > +
> >  	xe_sriov_migration_data_free(data);
> >  
> >  	return 0;
> 
> 
> 
> 
