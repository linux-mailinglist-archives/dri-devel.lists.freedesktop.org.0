Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC8993AE02
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 10:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8650210E049;
	Wed, 24 Jul 2024 08:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrasoKxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EDF10E699;
 Wed, 24 Jul 2024 08:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721810674; x=1753346674;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YFTa93xefGm9h2ZhQM3WXdMoVMBjYRSgwACxDW5Y8P8=;
 b=YrasoKxTppR5BA1i9orWtZAzIMZE95nlgbsI0gji5vyXaKlyei08wNCx
 PvHr+VlvVA0wytBiH8EdlevvZGwu2dwCVqCiszPqLlsXLnU2CQ0DcOGLB
 y7Fzr9l46Y6LAiy4k42Xo+u3KQ3+HKW+KLXbInJfYbLY15zyKaKSgUER8
 XW4Czqf1JYXeyEENyz1atJnnjTkkqmbteFwee1YdPXbfLprTZQPksoF7b
 xyNRnpRw7BOzx9mCzp8/rv58gPTtADbSGRjEcjOInp6JlGm47w+/1SIsI
 m/m95YC1KlOhL9QEmtfJf/7p//4rtX/R5KSur4rCh3etI1u/p/mgzdKQt w==;
X-CSE-ConnectionGUID: NXajDIJCRsKxHxswZ/oZlg==
X-CSE-MsgGUID: WeGBqdIiTlOhSZ1uot0jzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19089595"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="19089595"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 01:42:32 -0700
X-CSE-ConnectionGUID: saHWplobTdGxQspMPy4WXQ==
X-CSE-MsgGUID: SAvIbFtkSjuENAAC0xV+rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="52394891"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 01:42:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 01:42:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 01:42:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 01:42:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlLx/sAxOnHDRZPqKH204IZCyaFNsHO/fcZXB8SS1VLCLXDOhi3IPJFDCsS13kYpGPkvNbfFbzVlxKcwxIGwc1uW1ytk1+bbYqwfPlA0c0lB5Ebtek88m5CLeSbpdZNSzFL9L44+/PbPxjrBWXPQYdSviKnPCik1O8bLxCvBIZPkGG33WoSre0MBE2tHzs27BMpX/O8+3ZGyht1r42XcryZxsvJtpCvysQlwjtZCu5myT1nJDdcppMPD3djazlTlgkjzHi4iEebHA0n4+t+sWBFcdqMvXAkEbxV7M9gDWimxsKbW0vnu4zhOfe2gbrm4SSKgX3cM66WhYD4GtHF+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+6MarcQkfJn3yFb4bhFJljAqJfNpYblJT0SfaV59So=;
 b=FKS/NXl13Ih6RyA0OBXZ3jMKoUCbVpRX6jg+t4n3bufP33J/Wjy0YyK3LHI+0p5+a9vRjiPhyBAqzX+8dj1lL6BP2ptqy4/kcNX/pC+Xt+lW+lISvwQ3qgqj5lNSe1tf60cdN0ArTKoISYMnGzv9MsJyYqF4TFZuSR1GK1s9LSDE9kzzOoKRz0HgAL51BE7pK8iGR6oUZBZmBOJLuTZRupklVuy8rDP2yTX90y4UUQ3PGosrVDaTuznxPDHeK8j3oGUotDRg5DOzT2Xf4Pah9aIsHSdukpepg7v9hA4HmveomNd5czTzsl4U87VXqhj8eYZHLNvXc4s5Dvp8LUTvkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH0PR11MB8086.namprd11.prod.outlook.com (2603:10b6:610:190::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Wed, 24 Jul
 2024 08:42:23 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 08:42:23 +0000
Message-ID: <84061e47-3e6b-45c4-bc4b-db70da6b67f8@intel.com>
Date: Wed, 24 Jul 2024 14:11:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/i915/hwmon: expose fan speed
To: Raag Jadav <raag.jadav@intel.com>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tursulin@ursulin.net>, <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <ashutosh.dixit@intel.com>,
 <karthik.poosa@intel.com>, <andriy.shevchenko@linux.intel.com>
References: <20240712122356.360613-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240712122356.360613-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::29) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH0PR11MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: 2033d24e-56e9-43fa-4de1-08dcabbc89cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlVkdWVkeWJNaHpvWGViMGxMWHNQRmtaU0lzTWlDcW9uMmMrUUVQaDhpYkQ4?=
 =?utf-8?B?dlRmN0RIK3ZIajFETzJCZWF3UnczTHJTWXB1dXZjTXlJTVdVMk14VW12OVc1?=
 =?utf-8?B?RklqTFhiMXdvZ2J5a3YxckNJT2QxbXF6NkRWdEo1OXlFSWJNN05XYyt4ZVR4?=
 =?utf-8?B?TE0reWFNTnNlVnp2NjlDMVBjMGtEeVBnY2YrQW9xRkUyTVR2QnRNdHZrajdy?=
 =?utf-8?B?VXc5WndzUFp0UHNTbVZTcTM2S0NSTWhDemNHSCs2YVZVMXc1bFMwSFEwR2NU?=
 =?utf-8?B?K1lNLzRtcUMzU1gzUEJGRjZIbTFuY1liSkJmUXI5VG42c054d3VINE5CWTZ3?=
 =?utf-8?B?clVzQjNQdFBSUVo1dVRuQzNnRGE5dEVxYkdlY2w1c2M1dHlTOEc2dk9RR2RV?=
 =?utf-8?B?ZkNmR3JTQ010c1VRWjNLcU9NM2xEVWt6NU1Kd0pXN0QxcUZpREYwQmptVVZB?=
 =?utf-8?B?WkRxNjFoZ1pxWkg3aHE4blVFc2l6WktIMm5Edm1mUTJnZDdEZXNZSjdhRmsz?=
 =?utf-8?B?UEk1L29sQml2V3RzVE4vbDZJeXVhN3JIeWkxSmZHRCtWZzY5TVBJRE84QzJj?=
 =?utf-8?B?NWFrejBWZ09Ub2srckdESjhpRVN1V09hTisrbXZTOVpOaS9yOEtxVXlJc2NY?=
 =?utf-8?B?VlJEdWxDWlVLVnhuNmFTNEdIdGNSSHpMYkREdjZ2UGFrTXY0dGtnczdtbDRs?=
 =?utf-8?B?aXFyQjV4QU01RHlxak0xTHJPczhjcWVYa0tVVUxUNlNSNXRyMS8zZVRqS0JJ?=
 =?utf-8?B?ZERNQWNuRDFxMmJ4SCtsNG40V3BEUDR2NDNQR0liYlpRWGRrV3JBaHU4YnFK?=
 =?utf-8?B?WllKSUo2OFgyTnlETFRZTkVTNTRQVWp0a0FWcjRqLzBUNVVFdWtmQTA0VGVw?=
 =?utf-8?B?M2FZSThNWXVTMm5zZzYzUUo4cFlUYXZPWHI0RlZjNFY4T2Yxd2dZM1N2MWw0?=
 =?utf-8?B?R2dYaFFybXBHZ2UxaUt0Q0JOWDNreWxCM1pwdVpXVHZXd3IvYms3clBUSWhY?=
 =?utf-8?B?OFlKaDhTclMyQTVRSUJVM3NTMVo5RlJKWld5b2J5NXNkWUhZMzVRYzBqZ2xO?=
 =?utf-8?B?SlgzcGtlTHQrY1hzcG9VMThYNktwTHFXU3V2SE1kVmd5OGIyZ1dJYnI2Uys1?=
 =?utf-8?B?a05zUkcrYVhwT0d5WHNkWHptWURpcUh2T1NMNklnb0xlR1kzWjJqRDhyVm9t?=
 =?utf-8?B?SURzT0cxNkJ4b0x2OU9NaXZ3ZG1uUXF4NzRRU0wwL1VSRm1BM0E5MVAzOGVU?=
 =?utf-8?B?aDF6QS91WXhTUmhwY05nMzBIb2xtYjdMZ1dWRktmZHVDZWVicVFULzk2WXhK?=
 =?utf-8?B?Rmd2UDhLaUUwdkNHaGM1VkVrTHRBdGRnbW8vaWRiSUJXMHQ5dEZkVWNLbUox?=
 =?utf-8?B?aVNGRk9JZzlMWXVKU0VPUTRlQzhwckk1SUp5RzdCbC9wMEd1QjY3S3VHeVJL?=
 =?utf-8?B?NjBIWitCZHRFWWRlL2dzbEtqc05qYW9jL3N3enJMOFM5RnlJcCtwT3psbTNz?=
 =?utf-8?B?ZEczWmdPUEdxcWtnSTgwbFp4UFBnSktYZWN0S0N5d1hoUGUrb0c1NzlDMzhW?=
 =?utf-8?B?bldMV3VkdWlXaUFLaVE1cXczUnBuMUFXbjRCZ0VTMlpJWkJ6WlVuRXl5c1Fw?=
 =?utf-8?B?NExuWnVBL1lpQUpJdTZhRS8vV2M4UjlEeVQva3ZIOUtZRklSUlRTdTY0VGQ3?=
 =?utf-8?B?bUpkcEREcGwwaWM1QjJGdjV3NWhQY3VGS0lxMlJyRjFQRkcwRDM0bkRsMmpF?=
 =?utf-8?B?ZEVjTFpSc2ZSS2VURXBwQ2psQXFLT1ovc2txcSszQ3ZkSVJacGxnSXRPdHhU?=
 =?utf-8?B?VjhMUEpGYTB6am5iRFE2QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFRGNG1LNUh2WmUyalBiaThvdXF1dGlSSVNlNXZoSDNkbHE4NnA4MXA1QmpK?=
 =?utf-8?B?bzIyRHZQSEZxaFVvMEpNK1NzaUk5eklyaDVlV2tYZDM1VnIzRWI3OXZ3MWFD?=
 =?utf-8?B?eWFhN1g5cnQzTXNWbVdEaXVvZnZoVWlnSlp4dEVEMVo4TDltREZJUnFZL1J5?=
 =?utf-8?B?ZERUaElwWEVlYzBCb29qQ3J6c2xIM0I2aG5MUHJkOElrTUxRR1ZJZWZkVlVP?=
 =?utf-8?B?enVTbnArMk1TSTdreDkzUEhEdFpOSjdKT2pRaDM4dk9CTFoyVk54VHZMVEUw?=
 =?utf-8?B?cWlnalNjL2huWFByQituUkZ0NDk3Nm52bndGZmQvRnh4YWFNY0NMMmtCcHRJ?=
 =?utf-8?B?T2tERWUyRmMzMTlFWG9FNUdPTHRzWmUyMkNib0NHaXVSWmo3a0ZjdXNrTDZU?=
 =?utf-8?B?Qk9VWjdQTUZYSG1zblhJaUY3cXNuVmNVbW5LN1ZZaVdKME1YeHIyWld3MXF0?=
 =?utf-8?B?QllsSzJpbjdTd01pV3VOZk1JVG5DczVQMUJvcUJkOUVvY3VaeVFjMWVUWUFy?=
 =?utf-8?B?L1B1ZUc0L2krQi9WOFo0T0I4NWszUWpmZjBYWFBnUzJDMitlVnJZc0NJaGl5?=
 =?utf-8?B?WWRFUnlDVmNCeDRHZVhMSGprNkV3bGpIK2NGWHpQMTFORXRKNHRmVVF6ZFAz?=
 =?utf-8?B?c2ZXd2E4QXZOMDZSeS92SkhOZnJnMWdqRFY4LzRraVJXMVYrSVh0MENjYmFC?=
 =?utf-8?B?dSs2TnBZUnI3Ri9UL2MzVzNVeC94Nm41WjdzczdjdTM5OTFscUtoem9wZDV6?=
 =?utf-8?B?OVo2YVNOYThiV2hVaDJpM1h0SG9wSjlSQTRoT1EyMlp3SnlaaElpY0RoLzNm?=
 =?utf-8?B?cEtMZ0dFN3MwMldkN1ZXTyszcFlnZUNucSt0SW1Ha2hjU1lraWcxNTFHNHo5?=
 =?utf-8?B?d3RNL1prT1VEaHp1MGxNcllPNitZMVEyUTlBUG9IY3ZtcU5SNXZ0TnNYMUVz?=
 =?utf-8?B?NUptaWhMWmZCQkRvQmptODJJNFJuenhYRm8zWGlhSDNtR3czeFNyMVk3MlJw?=
 =?utf-8?B?b1JnQ25YZTJZYjhOQVhPQlN5TW5vVGRkZDhkWWUxZWFWWHR6dU5JTDlYVlhI?=
 =?utf-8?B?S05DV3h3UkhEK2ZFeFJUWFRNZnNTM2xoaTJNVTlDU1ZYamNWb0JqUmZXY3Nl?=
 =?utf-8?B?QkZuUUpES1BUTEYvZWhySmNFWndLTlV1MVdYQi9VYnVuempBM3psakZqeGYv?=
 =?utf-8?B?eEh6RGQrT1FBTm5Sem5PcjUrYWQxSW1DN2Zvc1JPUm1MczdTZWltcC9YYUMv?=
 =?utf-8?B?enZhZUFuUnU2YVRBV1MvN0Z5OWdWWjRBM3lmU0ZFUmZqRHV1eUk2clhTTnhy?=
 =?utf-8?B?K285cTk1TXFBQ09WTUVEVDFxRTMzclVSYnJ2b044dkN6TGRsNUpQUWdUN05m?=
 =?utf-8?B?aTJkK2Uwd1RVd3dGdHZLVGNtN2l2L3pjbUsvU1UxSnRwaURHSEgwZGRCejB0?=
 =?utf-8?B?MXJwbi9BeSsyUUZtQzV3VFNqbU9McU1SOHFSelRmVWxnNG1tRVJqd0dob0ZG?=
 =?utf-8?B?dk9zZllLajJGTE9VWTl4YVlLMmZKUUJFc1d3d0hJTmZBbWdvOXFiMlpJaDVR?=
 =?utf-8?B?bkZaNGZxQWdQaTlRaHQ2Z1lmNDJrWVdsRTJzR0FHd3BVb1N4elpVdlVVY0NR?=
 =?utf-8?B?ejFYQVNHTGtwSFJ5a2JWTzhiNm94S2YwZStNbktKSVY1RFNXQWJ1VlcrK0U0?=
 =?utf-8?B?MW1KSGFaUXQ3R2tSWVk5bHFSbE5Gelp2S2djSjhGOW85cVhUQjAyK24rTmJQ?=
 =?utf-8?B?am0yTzU3VlUzeU5CM0FaQ2NycWhGYk5pdkt5MU9kWk9YMFRFN2dvdUFtbUpG?=
 =?utf-8?B?SVZ4L2VlVEJQSEVzbk0wZlYyMzIvRjlQOU53M0lPUzYwYlR2Y0UwUzIyU2lO?=
 =?utf-8?B?K0RqRnJpeGNWTWJzTHUrZFgvblA5QVBOL2RJUjIyQjk1djFRWnV6SkFWTjg1?=
 =?utf-8?B?TUx6eXVMM2hVSzhrM3A0VFlpNENIelQrTGsyb1RUV3RHZFlqNGt2c1lPb25C?=
 =?utf-8?B?YzRPSDYxOVN6NmhyTDdUQnoycGxjS1hiaEdxZWhmRFNyRHAxNEtKK2dtQjRE?=
 =?utf-8?B?TlptVVZxRHBKbVpVclpQL3QyZVZsYmlERXlmdmlITGNMa2UwOXFzWnFRNkpw?=
 =?utf-8?B?T05KKzZlUjZoQWxLNC82aEJYQXJRNnFrRjdIZGw4QTF6SUNTV0loSnh2Qys3?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2033d24e-56e9-43fa-4de1-08dcabbc89cd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 08:42:23.6855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YHhi707CffAiAJ8YWL8JNdQODXafCdhTsjQhiPFGCeRXKSSsXzK7O0ymW60zY4yStK0YVGweMxPpXA1mzV86A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8086
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



On 12-07-2024 17:53, Raag Jadav wrote:
> Add hwmon support for fan1_input attribute, which will expose fan speed
> in RPM. With this in place we can monitor fan speed using lm-sensors tool.
> 
> $ sensors
> i915-pci-0300
> Adapter: PCI adapter
> in0:         653.00 mV
> fan1:        3833 RPM
> power1:           N/A  (max =  43.00 W)
> energy1:      32.02 kJ
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 +
>   drivers/gpu/drm/i915/i915_hwmon.c       | 71 +++++++++++++++++++++++++
>   2 files changed, 73 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index e42b3a5d4e63..407d8152755a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1553,6 +1553,8 @@
>   #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
>   #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
>   
> +#define GEN12_PWM_FAN_SPEED			_MMIO(0x138140)
> +
>   #define GEN12_RPSTAT1				_MMIO(0x1381b4)
>   #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
>   #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 49db3e09826c..f829c7837d83 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -36,6 +36,7 @@ struct hwm_reg {
>   	i915_reg_t pkg_rapl_limit;
>   	i915_reg_t energy_status_all;
>   	i915_reg_t energy_status_tile;
> +	i915_reg_t fan_speed;
>   };
>   
>   struct hwm_energy_info {
> @@ -43,11 +44,17 @@ struct hwm_energy_info {
>   	long accum_energy;			/* Accumulated energy for energy1_input */
>   };
>   
> +struct hwm_fan_info {
> +	u32 reg_val_prev;
> +	u32 time_prev;
> +};
> +
>   struct hwm_drvdata {
>   	struct i915_hwmon *hwmon;
>   	struct intel_uncore *uncore;
>   	struct device *hwmon_dev;
>   	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
> +	struct hwm_fan_info fi;			/*  Fan info for fan1_input */
>   	char name[12];
>   	int gt_n;
>   	bool reset_in_progress;
> @@ -276,6 +283,7 @@ static const struct hwmon_channel_info * const hwm_info[] = {
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
>   	NULL
>   };
>   
> @@ -613,6 +621,55 @@ hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
>   	}
>   }
>   
> +static umode_t
> +hwm_fan_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		return i915_mmio_reg_valid(hwmon->rg.fan_speed) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	u32 reg_val, rotation, time, time_now;
> +	intel_wakeref_t wakeref;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)Do we expect fan running when device is in D3? If not then we should use 
with_intel_runtime_pm_if_active here otherwise report fan speed 0.

Regards,
Badal
> +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.fan_speed);
> +
> +		time_now = jiffies_to_msecs(jiffies);
> +
> +		/*
> +		 * HW register value is accumulated count of pulses from
> +		 * PWM fan with the scale of 2 pulses per rotation.
> +		 */
> +		rotation = (reg_val - ddat->fi.reg_val_prev) >> 1;
> +		time = time_now - ddat->fi.time_prev;
> +
> +		if (!time)
> +			return -EAGAIN;
> +
> +		/* Convert to minutes for calculating RPM. */
> +		*val = DIV_ROUND_UP((long)rotation * (60 * 1000), time);
> +
> +		ddat->fi.reg_val_prev = reg_val;
> +		ddat->fi.time_prev = time_now;
> +
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -628,6 +685,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		return hwm_energy_is_visible(ddat, attr);
>   	case hwmon_curr:
>   		return hwm_curr_is_visible(ddat, attr);
> +	case hwmon_fan:
> +		return hwm_fan_is_visible(ddat, attr);
>   	default:
>   		return 0;
>   	}
> @@ -648,6 +707,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return hwm_energy_read(ddat, attr, val);
>   	case hwmon_curr:
>   		return hwm_curr_read(ddat, attr, val);
> +	case hwmon_fan:
> +		return hwm_fan_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -739,12 +800,14 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
>   		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
>   		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
> +		hwmon->rg.fan_speed = GEN12_PWM_FAN_SPEED;
>   	} else {
>   		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
>   		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
>   		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
> +		hwmon->rg.fan_speed = INVALID_MMIO_REG;
>   	}
>   
>   	with_intel_runtime_pm(uncore->rpm, wakeref) {
> @@ -771,6 +834,14 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   		for_each_gt(gt, i915, i)
>   			hwm_energy(&hwmon->ddat_gt[i], &energy);
>   	}
> +
> +	if (i915_mmio_reg_valid(hwmon->rg.fan_speed)) {
> +		/* Take initial readings and use it while calculating actual fan speed. */
> +		with_intel_runtime_pm(uncore->rpm, wakeref)
> +			ddat->fi.reg_val_prev = intel_uncore_read(ddat->uncore,
> +								  hwmon->rg.fan_speed);
> +		ddat->fi.time_prev = jiffies_to_msecs(jiffies);
> +	}
>   }
>   
>   void i915_hwmon_register(struct drm_i915_private *i915)
