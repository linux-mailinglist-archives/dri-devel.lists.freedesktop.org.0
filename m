Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIeoK21+gmnAVQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 00:02:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A0FDF837
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 00:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC3810E343;
	Tue,  3 Feb 2026 23:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOwizYJH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E3A10E343
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 23:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770159720; x=1801695720;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nkdrRBymoY2W9qZ2RuU57pmLWuHsZdJsbKBgkqSBOY4=;
 b=ZOwizYJHdTLVkvc4IrZ9woKS7ssWIDbdw+mOpGXanr7kJCPQVGJumcaV
 IO1djgiTuv2BKz5THJrnHFvTRl5Ijq5QGFFup9tg/6ss+eYRqJp8sAUPf
 TnnNI5YUP+P9vMyC7A8HAnejrU1c1WLT3tdta78EEbrDL7tqYyohJAgLK
 Nl4gTAuX5//HNLA2Q8lL9Rcbmf9n/dWGVWaT/EBzp5W6KhB95AIflg8Op
 EUjWvSSD4T/H2tLF+KmJZRWxG9qeHkrrfcY1HpLVifzbZILejh5uksy85
 QHAk9gaP632CQiwBx8GbvqnX2pIYLprZoXUlYpnOGwTSayq3Uv38LSPzj w==;
X-CSE-ConnectionGUID: tiV42t0KRr6xZFYOphKYoQ==
X-CSE-MsgGUID: f0/4341hQya0AXi17qHTUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70362869"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="70362869"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 15:01:59 -0800
X-CSE-ConnectionGUID: yX+QyP4zTfqA4UWdLzDOMA==
X-CSE-MsgGUID: kmZ2Vt93TyqRwPj/MJLErw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="214532687"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 15:01:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 15:01:58 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 15:01:58 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 15:01:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8NiD6u7u+DaOufdBXiE2gchK+3rxQKyIIlPD0L6ayvF9rflV2dvKSfZR0x/d8j4nHDy9el6hO+Yt6nLcGzFPbPng53BeZKK7Gm+6gXu25IAj5j+t8nFPnF59j/j7Lw9xMSoE0jHEwyUFhGJLX2LyMuFs2oF7CCB+KHkkM3nvz/YPG8iV5RMbekWPlbtFguGfl4Lwin2J8UzQo22crbBf0gCyC0lmQU3sVV/HaZdmjTI+n7SMtP4TeL6Td9I160uFfSkLwlxxVFf1BRdZ3reTNOZSpkKF0SiHA2NL/RUwwdsy27VDFeasNFBlYZI356OI7K3XIYVV3gBc9OFaCXidg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nDZ/bqUfyqIelVZ0DQXz7Iu3WzRkd3VadcfpQnnH6o=;
 b=sI5iocgvmBiJIII3uHYdLsDbVgl7VZi1sGHqk3WLMSFi93or3s14WVt14Y+2S5d3rWT1dB04em4pMH1y4Z6CcKd8WLcWMvaL+YAxTGuemmBzR8eY5YBiLbUP1iQgNM6KMEPgqRpGRpY/6YzPT1JDQ0Fbsg+K1+3YEEA+Sjc3WzxRDQ7pxG60qQUo/Om0Fa6c1DsHpGe9exx67Vo7hSykC3mkf0/NYT+gI3rKmD+1uSOddXJaFYAbVbEn/LKivc24Cl0he6T2o8j1VnkCH4vRi3OW1wBdJbBuxIexFSclghLRrTvrlg//8MEKA/OGIyDkn6u+wkUdAtE+rTFKiUzSuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) by
 SJ2PR11MB8470.namprd11.prod.outlook.com (2603:10b6:a03:56f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 23:01:55 +0000
Received: from DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e]) by DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e%5]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 23:01:54 +0000
Message-ID: <4d203020-25c6-4d88-a850-f455e0c59f36@intel.com>
Date: Tue, 3 Feb 2026 15:01:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mgag200: fix mgag200_bmc_stop_scanout()
To: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
CC: Pasi Vaananen <pvaanane@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20260202-jk-mgag200-fix-bad-udelay-v2-1-ce1e9665987d@intel.com>
 <c05faf6b-dced-4cef-8f8c-9f43241dfa2a@suse.de>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <c05faf6b-dced-4cef-8f8c-9f43241dfa2a@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P223CA0028.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::33) To DS0PR11MB7579.namprd11.prod.outlook.com
 (2603:10b6:8:14d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7579:EE_|SJ2PR11MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fce6afe-1d68-40f8-0411-08de6378398d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFhkMDdUSDlPdWxLVGhDckpMQzhwdmdJTVpUc2ZxQS80cGRzclZ3aW1mTU4z?=
 =?utf-8?B?Zm4vRTRnTzhyb0pOU0ZqVmFVd1FFQW82SHM0M1J4R0kxbFNNTXpSU05LT3M4?=
 =?utf-8?B?YWVxWCt2STNPQ3NjZTFFUEJsUEdZZk55b0lPTGlCUzR5WlZwUm5nNmlvYlFR?=
 =?utf-8?B?Q3VIcDJON052Z0Y1Z1lsVStTdEl5UWJ1NmJ3UkhRb0lWMW5FdzRKUTdjSzJ1?=
 =?utf-8?B?MGxJNkxISXZYYWZSVjlZKy9tT1UwR09vaHRJeEp2bmxPSGdtcjlEeDdGaUtm?=
 =?utf-8?B?Y2xrY3ozekxQbzVqTlhhWmZ0NDVZa2ZCTnNIU2I4dHFyZlFjVzd3a2pyRVRT?=
 =?utf-8?B?TWhjMFFCN1JpdGlDcDgzcU5VdHRBTy8xcmxSTWVTNHJob2UwTFhzTXk4RWlJ?=
 =?utf-8?B?NldoY2E0allRdCtqdnh3RGdJeEpQbUJiUVFrbklKVUU3ZU1vc3FWQXFRUi9z?=
 =?utf-8?B?MkNXcW9qNXRWRUMxeTF3SFZpZDh0aUhoTkNEdVpteXVES3NjZ1pTSkFNa2JX?=
 =?utf-8?B?bGJiT1hqRmExWDRJdEQxem04S2lxNzhpd1dLdnFVVE9lZEdtbE1QdnczSWlR?=
 =?utf-8?B?akxrRG40ajBTMWEwQitESDAzbzFCTmhQTE9RSC9zWWVkOVZtTmQ1TFphVW56?=
 =?utf-8?B?RHJad2JrQ2c2cDNOZm9QVDNNeDZEYXdGbmdzVFZkNTFjK05jaldTWDRERWow?=
 =?utf-8?B?NVh6Uno0ak5lUHBtNjN0OXloZ040T29xZmFiUzFqS3ZOZkRQWUxRSy80Vkp0?=
 =?utf-8?B?Y0UrMXMrKzlXbUJTdm5VbUl1bkQrM3pBOVJYQzk3Zm10c1lsQWo0TExIL3I4?=
 =?utf-8?B?eTZBWG9ITTh4Ymx6WUFBOTlDYlBGQ2NJd0tXYldQMmpyT1pCL2lIWUJ2Vldh?=
 =?utf-8?B?RytnRituOVdDOUQrTjdETThUVTl0VXU4TlJ5S2krSUt6c3dJcC9EaEdkd0Jk?=
 =?utf-8?B?ZFJGZlRSWmY4YlV1eXBCVkZCRk5QVGlLRld0WmpaUjFwMHRUejVnNERIOWc0?=
 =?utf-8?B?VEd2Tjg0dzMrbjRKMm05djhLeUl6b0FhUFFvcktta2VVVjM0WUt0S0ZpWkJQ?=
 =?utf-8?B?QlRJYzcvcVBheXBEbHh5VWQrT1lsY3d1b1RXeTZja0p0cVc5OGc4dEJJWlJo?=
 =?utf-8?B?aEVuZkFYOERCekg2b05tVG5BeEU3TkcxZDRkWS83LzV4V3dFK09DcHc1OGdv?=
 =?utf-8?B?OU9wb0luNWc1N09IU2tUMEhUakVBRm5kUlJmK24zR2dyNUlRa05rT015TS9v?=
 =?utf-8?B?NGF6dUw0Rm5lYjJBenRHbVVOOFJmcEplZ0EzYVFQd1FkcFdXamJOTGlpWndP?=
 =?utf-8?B?U2I1dlRNVnZ2Z2tYa1FuNjVwY0hIVDBFb0swdUNWU3lGaFlwQjd0ajBrS1hi?=
 =?utf-8?B?Qi9oSldLdUYwWkNFeFlVY1FsTE1UZi9Sb1A4Z0dJY3h5dHBhMnV5ZTFyNm9v?=
 =?utf-8?B?TWZZN3BHdjFUK1U5dElNTzRnZUVqak5Jd3EwZmcwRzcxZkJOcy8vZ1dhTEww?=
 =?utf-8?B?T1NGQ2FHTDlHVlhWa1JSUEN5R3I4WDFwZ2NQK3loSitLMWFkeXduSzdYZzkr?=
 =?utf-8?B?SUN4Z1pHQk1kMk9VUVA1ekNNL2ZGMTdEYlppOGtIMWMyOGVhK0Q4T08ycm1t?=
 =?utf-8?B?b3kzT0tZKzlPZFdQaDZ0UGlMRmVUOWw4U1gwSnVpZThOQlVxMWZmS29CNFNu?=
 =?utf-8?B?aWlMeEZVd1B5R3dwVGNhZU5hclE5QUV5TmlvM1VNYjFXY0tsaDIvSmVqZXBQ?=
 =?utf-8?B?K3prRVEzUThJcHcxeG94K240OEdXQit3NWozeXVqR3ZEckxqWU5oKzNzQTFu?=
 =?utf-8?B?cjIrTGNEWWtlZi93WEo1ZnJOY2RiY3VWVzZsWDVJS0pOeHlhWnJ4SElWUHgz?=
 =?utf-8?B?a00yMmphc2poNU5nSUdobnJ2T0dqWFJwVTlPVHdiS0dKbUJtQmtnWWNIVEZt?=
 =?utf-8?B?SUM0bVM5SFRZR2U0QVdlbTBIWmxNSjJObExDUGFBK0ZNL0FYZFFuNURtQ3FK?=
 =?utf-8?B?V0xMT2NLMnR5UWE5OGNORGhyTy9YTWs1bTk3Z2g2d3IrbWh3eFJUaWRMU2NF?=
 =?utf-8?Q?zSNPxm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NllVS0hYSG4yNlJwU0JmeGFMclBOOEwwVkZ1aXNBQWJ5endpcHFGdG1PWkND?=
 =?utf-8?B?R0xjRVFad095VHcxM2JQQXVodnpUdDJza0RHa2ZZL2ZvSHJYUnhDUFlTUnF4?=
 =?utf-8?B?amJsR3RyRU5vbkYzN1JoQ2ovaktab2E1eGxKeGJjV2JDem9KZ005dDZ4VzU5?=
 =?utf-8?B?RVZlTWFQZGcrWE1OTU1FMEc4dmtoSjJwS2FTZlNwbjdmcHBKcDVnRkd5bFNa?=
 =?utf-8?B?alIzQ1pBaWNVaXVBQ2FHZFFqMklZenhrT1FYZjVzRkFoYWFjYlVmMFBxMU12?=
 =?utf-8?B?Z0crR0NGY3BqWDFBVzFwcURJSHRwNWlmUDU2Q2xYNmpjODVEVSt3RzY3WTZq?=
 =?utf-8?B?QUtCMGNlTmUwQ0JKNkwrVHFpUmdDZUh3OHVRM2kyd3AxQ2ZIa3N6MU9oRmY1?=
 =?utf-8?B?WllSQVc4Z3pXYnFrU3pjRzZCYkg5UXZzMzVUc0Rlb2NObzhXSUswTGZGTTNS?=
 =?utf-8?B?Umo5OThNaUNucE0zcm5KTndZSTYyZmZWdE5pYUV2L3VUSWhQNDdXc1pqNHFl?=
 =?utf-8?B?N1pLR3FyK2VjTnAvdG1tR0szUUJuV3JNTnVURytBSUVndWY3bDVSSWt1NzYz?=
 =?utf-8?B?dzFuT3BQZ0ZWNzAvNE5McU1RTkpaUkNiV0VvUDNvRlRQME96MWw0KzI0bFp6?=
 =?utf-8?B?QXVZbDAvN2oyazhMRGNQV2lEWEJWMFRpZzRaQVMwTlI4dlZCRTYrNXBucGN2?=
 =?utf-8?B?ZjNabGxpRlpTczFOT2VseldJTDlCMzJIWWdCTGdWS3VoSXJkSGQyY3A3cVVJ?=
 =?utf-8?B?STNkd0hsTHhxVWZXN2YvQzJGdmZ0Umw1NzdKZVVMYW9XdVd0MGdJMVo5ZVB4?=
 =?utf-8?B?QVQ0MXFBaGlXTlNTdmF4TldmNkNPVWRTWmNpZnltS09ZejRDUTVHUW9QNi95?=
 =?utf-8?B?TjV3S2ZjRUFMc2pRVWZTeGFFQUZudUNSdUVraEVxTUpmdXZVcHpMb0NwUWJL?=
 =?utf-8?B?YmZFRnhKTk9ObzRmMjEyTGZDb3M3ZDJBN3FGTm80b0FtT0ZTK3NKcXZxUlpL?=
 =?utf-8?B?anIyaGk5UzdTNk9BT3FrYTUxZ2kwdi94ZkxiSlBHVS9NaExOb2luc0I0UWFm?=
 =?utf-8?B?bVpBVHBrbzRaQkkwblNuWkxCR3I4L2xVYUdFSDJOeDVoQkJxT203QkZVV1pl?=
 =?utf-8?B?SWtuZDJMWXB0ejZtaG5POWhRdkJUQ1AzUHgxTDl2ZnVVY0NpeXA3Mko4RjdI?=
 =?utf-8?B?MFhsUTQ5STEzb3lxNTJqcDNGQXE5WTdOYlF1TEo0MVBPd3YrV0NqTXlwYy81?=
 =?utf-8?B?cUIvUGlaZ1ZEMkhEY1pqb01XeVhEdzMrUlJPamNvYXRTM1E4c1krb0FpRXpy?=
 =?utf-8?B?bmJPUzVDb0k1OGJxYXlnUkEvWWhldnltUWs1ZXBDbDd5Q2twV0plMTV6ZXlz?=
 =?utf-8?B?eEhpcDdkbG5LazJ6ZnJVdk1kNlk4L0tRQ3lNUHJTY2wvNXFaTmVHWTVVc3B1?=
 =?utf-8?B?dXlPWk5pOVd3Si95eExMeE9qTkxlNURkVDZ4dVhOSURqRlhOb1hoQVZJTk1v?=
 =?utf-8?B?UG1IS0NReXpNRFliV0Z0TDBXN28waE5pNnBhc1A1QWxlSkNSSCtwSmdwOFFO?=
 =?utf-8?B?VjFtdmMzdUpwZ25zUitTbENKWnk4dWVDa25ONVRPNVVGSS9kaWU4K1dnU2Ju?=
 =?utf-8?B?eWU2MnVHaU9sUHNHODFPSXREbXl1R1AxeFl1Y2FZQ0N4VFlUSFJKU3hMOWxa?=
 =?utf-8?B?WGxsNXh3a0d1Q0h6M1hYNzFBSS9uc0FmOWlmZUJ2NnlsV0M3V2dOM2pZbEZR?=
 =?utf-8?B?UVJBekNMWmtzc0hLRmdBMzFHdkpQcXNVclZFYnh2eko3THdBN2VkcDJ0Y0RJ?=
 =?utf-8?B?ZjIycGxiaUZlQXFIL2xDUmFzcUZCcFlMcjlNSWEvZXF3eEZTRGkwMldkeWt5?=
 =?utf-8?B?cGw1dEluaUsrWFhZbnRZdFlrZmdnK0EvU0l5dG9jK2dUZmY4OTdYN0hVRWhL?=
 =?utf-8?B?SVhCZGR6YlVNcDkrRjFLK2hOQm9MWUpxVmt6K1BzZHVqNERoNmtzVThVQkJJ?=
 =?utf-8?B?NWRQb0RmNGF4emxVdE1YSG5ZanNwek9TOVg3L25HY0NSUmh3TXhtTVVNcEVX?=
 =?utf-8?B?aXd2bTBFeWJiUGlTQUVGY1dmaE5Tb1VWaGozQWsrQUFIU3pURlN4dFVOSUpZ?=
 =?utf-8?B?ZC82VXBPUEhXdUw2THQwTVVpSHhjTTdWTDdaMTJucndRUU16OXM3eEJldGJ5?=
 =?utf-8?B?RlFqalhDNkVEZDJHcTNaT2tLNjdLT2RWMmF1OXh4R2kxSGhXazArbkl4b2tw?=
 =?utf-8?B?UmY3SldZaUxUZDd1clZieFBjQ3poVzdGWHQxVTYxN0dYMXVHcDRrYzRKYWc1?=
 =?utf-8?B?N0M0UDIvUnY3RlRDbVZ3Y1RnWmtWSkVtK1l5a0xyWlNMVXVJMStPUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fce6afe-1d68-40f8-0411-08de6378398d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 23:01:54.8339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUgeUqXPGUOGYrZ96SLQSyrPgdwtubiFsYXIdM5zoGoPJ9JGfZen9PkJZatIy2E/n9TD+db53TvqWbn2PHvhNWWn0TUkMUCIQcg3n9or/Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8470
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:airlied@redhat.com,m:jfalempe@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:pvaanane@redhat.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jacob.e.keller@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jacob.e.keller@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 10A0FDF837
X-Rspamd-Action: no action



On 2/2/2026 11:37 PM, Thomas Zimmermann wrote:
> Hi,
> 
> thanks for fixing this issue. Just FTR, I looked through the original 
> implementation in the user-space driver and found the same bug. This 
> code was added in 2008 by commit 62c8f0a ("Bug #16545: Add G200WB 
> support.")
> 
>   https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/blob/ 
> master/src/mga_dacG.c?ref_type=heads#L740
> 
Interesting note: the original code in the user-space driver used 
usleep, and that then got translated to a udelay when coming over to the 
kernel.
