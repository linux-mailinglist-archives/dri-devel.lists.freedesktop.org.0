Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7BA2B9A9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 04:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF27810EA15;
	Fri,  7 Feb 2025 03:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmm17ATq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E2D10EA10;
 Fri,  7 Feb 2025 03:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738898364; x=1770434364;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uzlCbBQFH3Y9VMsXw9xm+A/O1ZHfT+c+2h/SGDNwQZE=;
 b=fmm17ATqTikzfFGQYm1yKf0DcmQ2zhvV4WumsZGxtcVnAd1F+z9NuEH7
 plxkqSZyD6O7QNrs+tqNZLolQKXZop3lkALJB9JUn+quJPchcvpVo/rGP
 sFLqXXkngbvKXg4461HOePPe2GKKlz9jK80VlYGd2oOnB6iRZP20gJz65
 wjLMcwbdxctvYtX4Kt+iIsH0R0qPv09kDJDs2SoKe8MmcAuhQ8kHM/wY1
 oAibhQCdHJ6BiaCmTlUrrjQxiYu3PKgUrfPJNByj+9bWlLU/Njp/8qZfm
 pYsbUpCphBg27YJ47lZA2rX9eERa5vt5fErT1DZ/hL3H0taxpvctCKf+7 w==;
X-CSE-ConnectionGUID: R9MxY2WiSfi2s1JUT8LK/g==
X-CSE-MsgGUID: S+3aFgm0SAK/aUONfNY7Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50516027"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="50516027"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 19:19:21 -0800
X-CSE-ConnectionGUID: D7TtGA0BQjG9Sg0ZmeWFiA==
X-CSE-MsgGUID: Zk1dHb+VT8m1mhh92iYsTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="116437982"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 19:19:02 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 19:19:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 19:19:00 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 19:18:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMjO8FuYOJPtt4M9ut9MRqoyWykqkJJ66NrZ29cC/ADMPn7jUt8HiaU7+JRbbYveN6+f08VokX6v4vTHvJrjDnIHxiYmralyWjzopwfbci32Apq4Q2ShSPng0EOPb4k/TIA3nU1P+7J5SCJh2lISukeDwuLHKw/JrvQi6D+hH/+xsMZQSc5cHALvvRyuPLTfQbpK7qqhkwM6ejoBHid2IZLg4u3QNwNWdVER1wogAi9XztfnQYuVZyptElCUbH7kTGEpaiY6lboplNv3pXz3iSALIgx+cBd9pXh2uQ4cYY0Ul3Xey76UlNSBuV9xHeOLujdURxMrzkeIAmbGdmqS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbifw/IgduM3CLiWGcL3Cal54VhGu24dFm+D2tOGtNo=;
 b=rvzh4xKV4CPxXPAT5Lv4zVUQGRsnHPSK1mMbEBwBRFEkYcoPK2ZULHgYhez7L/hbr1oj3+oQyUzC3HTJo50fM3mICWhohNdN5TdzTuvSh3D2DVH5KJDi5Uq3px21BPK/ayUQpOeiLIG6rkcJivOcVYK/esbgZZX/F2gM4UCX9hiKb0JgNYfLnG5ux3HHbNZBiWP00nr+IF8xVSHhibl6ptkwvWTf6l+wcP3c6CVH+sJBwQlrwRHufETWxtZya/juk+VinXSXVs5rTyy4+RWuxceaQjQsdLNP9hnA9/681wlYh5m+ZRXFuEGhgI8Op611l+hJQfPwkcf0mtFPS6OQHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 7 Feb
 2025 03:18:58 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%5]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 03:18:58 +0000
Message-ID: <52a48469-ee6a-469f-838a-0ffec5bfccb1@intel.com>
Date: Fri, 7 Feb 2025 08:48:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/33] drm/xe: Select DRM_GPUSVM Kconfig
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-8-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250129195212.745731-8-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::32) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 2edac7c1-47f8-404b-2154-08dd472628ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1AvdXJHL0hmR1hNblY4WFMvZnIyY2V6T1pkSEJQMFZFSFl1dWNEbGtLSVJE?=
 =?utf-8?B?NmhGanllZVFjUFFLaFJ0dUtBV1BPY241M1UzalNHWm9IN1I4Yjc2OXNCakVy?=
 =?utf-8?B?RGR3akovWmYwakF5NXFDNEM4Ujl6V2hIcCt3UWk0cnJuckRUZUpWMWJlRGJO?=
 =?utf-8?B?bTBMUWVlbGJJU1NjZHlIbGlkOHhmNThEa2tzbGlnNmw4SUE0d21FQXY3TjRT?=
 =?utf-8?B?WmNnZU5xL3d2R1VGMG1DU0NuM05tL1J0cEprTVZHdStMRHNFVGIwS3p5OXE0?=
 =?utf-8?B?OVp3UG92eDFFTUpVWUdxV1l2RHhaV0QwTTZESHJjNEpPSVVpcVFxV1k2Zk0v?=
 =?utf-8?B?Y2prdUJET0tReGxOcTJZczJ6WDduT0FiVDB4SVVNbTNCYkc5T1c0Wm45cWdL?=
 =?utf-8?B?SFlVQTMrVG5Pemt5ZjNSYktDQVRFYytBZVRRYUk5RUVlTHYrRkNPUTJQcnYy?=
 =?utf-8?B?bDFWRlltMGdKLzk3cmlXOXFoK2lEcWt1MmZKcDYyR3RlZXhSRTZPWTRXMUxN?=
 =?utf-8?B?N21ZakNZNWtzbGxpYktoRG9zMTVSR0dHUk5JUUNYZFBDa05waEZaTVJDN3pm?=
 =?utf-8?B?Q0ZFN1lXZVdSQXFVOEEzbkVTai9MNVdSb1pOSWlpL1R1TXdVd1pXYzd5UDd0?=
 =?utf-8?B?dWxObVh2VkZOblpHSGFweEFHd05panlZUkFFektadWVTSGJYeEFrYmo5SzJM?=
 =?utf-8?B?M0RubmV6MTJXT0NJQzFlRFhzUENtRm8vMlEvdEpFY1NsMitQNE5vT0VWVzZX?=
 =?utf-8?B?Ym9SM1lFWTg4Rml5UmtyeU5aVjZuWENnUWw1c1FLMldwdmVvUnVxdVJmRzNi?=
 =?utf-8?B?bkFML3ZIN3VHcFl5R1BUVkJkUm1RNDlkbXpCYzVaYytuM0dQOWhwUllNL1BP?=
 =?utf-8?B?UEoySURHMXdDc3ZobWppU0tZdzY1eEJJMDlsSE1JeTZrNFI0dk9iU3FRMXFa?=
 =?utf-8?B?SXVtOXNsWG9GaUoxUzllY0taNEw2ZEU5T2g1OWgwZjJjMitXaWxMOUZvRkl4?=
 =?utf-8?B?bGNGSHFsR2hHTUZtMVQwc1JZUnlQVjV5bGRTcnZkbG1RTmtCTFdLU1RQTXlC?=
 =?utf-8?B?NHhrWjVMOTQ5cXhHeXdZdEd5Y1p1enFHM0JRTHpUU2VBL2MyMVhLTk1RN3Qz?=
 =?utf-8?B?TmN2ekRrOVZVbGhqc1VUVXRXbDFxQTRTell5a25pOEZKY0pvZEVwcnJKZHMz?=
 =?utf-8?B?MEY4QzJNR3RLYlJjbk9SU0NBS2kzSVFtVkQ1SlNDdTduNzhSZGxvbG4rZm5F?=
 =?utf-8?B?TDN4OGxuN0FzSEp6Y04wTE1MdHF4ZFJiSFVUYVlkckZQUko0MVRXQTlVay8v?=
 =?utf-8?B?anVUOXZ2WFMvc0pMb3ZLeW1mNEEvVUdBWWxRK1pDbC9tWWhZTXc0VTMxQ0I0?=
 =?utf-8?B?bTZLUDJRZVYyZ0YyejN3bUZsTzI0YVZOWEpvQldmMjVrVlRXWDkzU255Vkt2?=
 =?utf-8?B?NDFNRDR6U1ltbEJiaThNbVJsZHkxVk1yeVVMV3JmTFpEZEsrdUlJVE92aVA1?=
 =?utf-8?B?Q01OcWtpVVlIOFF3NE9QamlHSzlLRXkrZmF6NUVPeXJld1RlVWhQSS9kWHJ0?=
 =?utf-8?B?aFczWmU3S0xuM3dEbGlKOVE3YU1ka2hjTlVNczBkOUN6RUNpK1hxd1BlSjVN?=
 =?utf-8?B?clA4YlNMMUpZMlJPRnVSdUVQZ0NaYkVscW5ENmhXeTVkOGs0TklnK0xaN3Qx?=
 =?utf-8?B?eXZBa0NUMXF6aTdtVXFYOFJPeXgxSWdLU0d0cnUxQzU5OHU4WWhSV09NL0Vq?=
 =?utf-8?B?SzdxY2RmN3M2VzJoS09CZU1IUVhkYXFmbDhzUEVGODRIZW9NMkxZR010dkNj?=
 =?utf-8?B?eldaZUFXdlQ5M0FsY0RwSjBCU0U4azY0MkV2OEpIM3YzSjRUMTF6WGlQWkhs?=
 =?utf-8?Q?RnY7hrpVxOmtL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blIvbHIrVFpCME10VHY1dFBmOU1CdGJpZno5RjJmOCtVdHp1N1R5SlJmeVNY?=
 =?utf-8?B?QW1YNmhhaXpUandBZWVKTzU2Zk02OW1WY1QrY3RvUGJHSkhBc0Vnb2lMSHZq?=
 =?utf-8?B?cFhJWmlHeXI5clBLK0p6Y1Q5Z3NCWmIwRHBrak9tMVhVVWRaaVV2Z1hHa1Zu?=
 =?utf-8?B?azdFcEkvY2VtNkhBRGhEVWFydXdvMEtvNWhIOEkzZDNIWVMxRjhxN2V4K2xa?=
 =?utf-8?B?cEU1Zm91WUcySkQyQ2VPdThYQkxmSjlmbWZFQkhLREllT3lvVGdtZCszVGN3?=
 =?utf-8?B?R21aNEkyUlBobUthZGJNNG9yMkJleFNKWGdXdVVSdDkvNTRvRlRPOGhtTzY1?=
 =?utf-8?B?Wjk2V1ZrQ1ppVVBtcy9jSmYxN1AzWDhnUGNrRnBDSktUVTJ5a3lpSmo1Qk10?=
 =?utf-8?B?MnhWZDJ1Q2Uza3VhKzVsM0RLM1Q0ZnFzRG5wQ09TUkNaTlFZRldzd3FCNlV0?=
 =?utf-8?B?SUNIV0s4YlBVVlN6Mzlvd3lpUkpNUVhUT3pMcnZoQytMNzVQNTBkaElNRDE3?=
 =?utf-8?B?SzFLWDBjZFE4Z0tvc21IY05mYzdmUzNBd0JYQzdVK1dwRTJCZUkwV3M5ZUFL?=
 =?utf-8?B?QlpNMGsxRmtLbTdLZkRTRGM3Ryt2ZVAxcHkxemt2QUF4YUl2djZ0bitKc0pz?=
 =?utf-8?B?RjV1ZHhKVy9iRU9FQWFXUnVjNHFTUzRBSFdqQ2pXeXdOeXlhQXBWVGUrTDkx?=
 =?utf-8?B?TS81MGlpY0JxVTB5bjBZWDk4bjdPc3k5ZTJqQWpvSkp3dU9TQ0ZhN0Y4WXEx?=
 =?utf-8?B?QWRibFd1c25QZFB1bS9tamFXUFNiREk3cHpNU2thd1FlL1NrclRZT3FFYjlt?=
 =?utf-8?B?Sm5STlBuVXJiTFVnWEUxVDh6QWxFTmEzN3NJMk5nKzNQSjJ6YzlESFFEQjB5?=
 =?utf-8?B?WWJjZzZOdWVRSGs4NzhEMmZCZVlMSlU3NVVTZnEzWmdrREZDdDhsdTBpK0JW?=
 =?utf-8?B?azJ4UVgrQ0NPSVlLU3AvRXl5bmgxQ3hGdFlrM0FxdFdoU1M3eUF4UlBTK0p1?=
 =?utf-8?B?OEdVVVBWUmI5dGd6MURicko5V1kwWnJ2YnJRL0tpTjFETVV2UHJpcXFkOTJ0?=
 =?utf-8?B?MmpGQXVrcDVBRUJpRmMrSHZDZWdoOCtvWitBOFJSekFIK0liTWZtenNqV29J?=
 =?utf-8?B?VEVLZlExbWFzVmNKSVBiMkRpZit4dFk5Uy8wYUlFR04rcWlnVmpRbDFEcUly?=
 =?utf-8?B?WDlESll0UWJsV2s4RXBZKzltNTl1SVJ1bG5vZXdOMFZRS0UrMEtZYnJxUTF2?=
 =?utf-8?B?aHlDd1U1RUVNbTAxR3hOQUZrUTh3UmxjbGh4YW81Y3dKSURFU2JhV2UwUWFI?=
 =?utf-8?B?aldRUmNLZEpCdS8vZFRiL1NTTGJsQmsxc0RKTWdHSjRUNkJEZ1JCbnhzYzlr?=
 =?utf-8?B?K2hyQllXZm52NUpMa25UQ0svT2Y3RmlmV1RnV2FEV3J4SjRxSTNmZWsxMUFN?=
 =?utf-8?B?MUtEYUVQb3NwWStEdnlYTENZc2JWdkRWU2t2Wk4xZU1nVU9ZVVRaWk94K2lL?=
 =?utf-8?B?UkpwOGQwdDZ4QlRRRHdtMWJPMDFMQld0R2lNc0p6UlRVTlpvb1l5Q1FxWDZp?=
 =?utf-8?B?dWs1TFRCVWdQaFN0S21tMUhES3BpTDlSWFF1bllGblVwNWZ1UUNUc0VIV3J2?=
 =?utf-8?B?Z0Y5VGpUNFhYZ05oeDQ4bUdTM1NlNTBJa05kUFZCaE4yT25nSW8zR3k2YzNN?=
 =?utf-8?B?L0RkamRHYVh6NTJSRjVPRjFiL0draXJybmYvbVkyR204NWpvOWQ4cDBiM0sx?=
 =?utf-8?B?NWdZYksrMjNGQ0pIS1lsSUFMK0lBdENjRmFNMjNtdVZUTkttcFdoZDlPQVZP?=
 =?utf-8?B?dVoxUlZFckg3TUh1S2d0eE8rZEZCMk1JeG9nL2Y2cjZoU0UwdEVYN0ljazRv?=
 =?utf-8?B?M2NsaDFtQVFqNFpnQTEzYStwRjZCcXQ3dm1ZYi9pZHFvT0xqNnpEa25mRmlR?=
 =?utf-8?B?M2dHUWQrdUtPdlFwd0YwS1JwV1dCb01vY3FvMmoyZ01xNWZDV1owS1d1dnlK?=
 =?utf-8?B?YU9KNXQ4UUNBbHNydlQzWjdjQ1JCOWtzaFhNOGFBeHpaMnVoZFAxVFFIVm9S?=
 =?utf-8?B?clhxOUFBanhQYldsUXU4dHVtSFhkNG80N2gvaXlEVitpSHNIVm5mSnZnRjFh?=
 =?utf-8?B?cDNSbzRGQktkSXc2aEZDdTFKY09lWDZOSlEyS2tMZUFlN0xKUjdscmV6Rk5v?=
 =?utf-8?Q?Wp9iKaaWlRnCHca0XTFPJEg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edac7c1-47f8-404b-2154-08dd472628ad
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 03:18:58.1935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4Yj3r4ltEJqpdDjqgCIfmyluNgEoLWYfsTSRDVkd7hICrTurDhF/9pUUaHpxowss85sskDeN118Ay3t37HJi1q+IsXX+NgIZnd7diMvsZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
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



On 30-01-2025 01:21, Matthew Brost wrote:
> Xe depends on DRM_GPUSVM for SVM implementation, select it in Kconfig.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 99219c16e8aa..60b922f75001 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -39,6 +39,7 @@ config DRM_XE
>   	select DRM_TTM_HELPER
>   	select DRM_EXEC
>   	select DRM_GPUVM
> +	select DRM_GPUSVM

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	select DRM_SCHED
>   	select MMU_NOTIFIER
>   	select WANT_DEV_COREDUMP

