Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5B3ADFC9E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 06:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72D310E98C;
	Thu, 19 Jun 2025 04:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbEyoWD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC67610E98B;
 Thu, 19 Jun 2025 04:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750309095; x=1781845095;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NVslR+CtTc3IWJB5HpJBWafwpBaCei0D66VXOmenLr8=;
 b=hbEyoWD9DxcAAJnuztu/844qAwYdA6ZFP2YfCiWN+UnhGM25QQ/TTlxY
 36XT1MUe4oYYgjNDIJwO+xd1NV0hvFM/W9a3U/WY6/TETM5p9xi0r6LhM
 kPvB3+tzbND+6uHet/OecGl7tEtSRO/HGyNsDTdSDhrYD452uFf3DirmH
 dTHB8NqsknkrYVD4uE01Np+OrHZmfmEcmEyOzzcpU3LcXJ4SmTl4vnEYZ
 hM3sbtG/qIZBetsyAFE5pWOvqO3s2mp20I7omYosn5jvAGGkSJ9i8NApI
 shefb+gXVgOolvY5gDDePnfIYyHMen2gthKGLpay5xlpmgNB787Fa3k/+ Q==;
X-CSE-ConnectionGUID: cnAbxHBKTyaghQvIJhwgXQ==
X-CSE-MsgGUID: ySFCe5A9Q8Gz+TTg/E4F5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52694751"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="52694751"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 21:58:14 -0700
X-CSE-ConnectionGUID: 8usVwW1xS+2Vm4OEF76u2g==
X-CSE-MsgGUID: yO7rgY2kSOGI9TouSA4bjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="151012633"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 21:58:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 21:58:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 21:58:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.72) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 21:58:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ST4S73YwhvbUjsrS9CeLJIqTEMFzIQ9zZ5BxiGquZJwJUGjSrcleuz9iAMzEwiCR5AHhMWk6H51tZEMBmyFjJi27lUoykdDrqJbJnyfeGNnr+QPyZipn1waYSLQOzOrfN5QMpye7TFqxa3Q+dooMVF4yQrRdjxVqXDVc+e+LBYaR1E9X5A3tw7pwhbfFvw/yBR0k49K03K+u5LbpbmzaXHabuY/14kLDIhsE+rkgmn/NoZOBCcP9JidMQt73RAgM0LFK4qNCMi2OIVaEV08aBa+4kLNm+MjYk1QiszjKj7v6WTsXK07UCXNxBE1GUJXib/ah6TU5LXJNnjFO0uemPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmaR2b/XVFgk4Ma6DXBwJAU66GAZGXpLgZXsW+juab8=;
 b=hknRx/c78APjIPkIe/OvWikfObnuHYcPOzebtkqvve798OKW7bpqG4AJcH4JuYitKWbYGcPr6Y3wAV9Q/vqpwSs0ljZ0yyBnnk8L3HVlh2LRxgZGSwHn1DL8mHxwm4MIUKYzr9Pt+ltBrCJZUA0sLcmDae9ltsurF/r73TpzQkfkaGFYZMoLkfStFj4zonhwbXod+1TTgQXm1PrYqvbgRWsfQiO6IP6OIztc8ma+mTtUrn/9p90X5g3f8y+8KNAhOMzk/Iwn5nbtDmkhISs0aeGxhyTbqEkiLj1aaOcHQcBpW0AlRneQYeTJcrKVM6FkNaf6VpVGPolqaoZTwgB3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 04:57:57 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 04:57:57 +0000
Message-ID: <6a9075f7-bfde-4856-a1c8-ecc0103c75f8@intel.com>
Date: Thu, 19 Jun 2025 10:27:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] drm/xe/xe_late_bind_fw: Initialize late binding
 firmware
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-5-badal.nilawar@intel.com>
 <d243bdbc-b3b3-4d58-b378-04d301df3b5e@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <d243bdbc-b3b3-4d58-b378-04d301df3b5e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ1PR11MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 2752803a-0fab-445b-4cf1-08ddaeeddba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlBhSUszZGpjLzBKbjl1SzZhUFdXUG1IekFyazBtdDdEVjNkaXkvRXhLUE02?=
 =?utf-8?B?TlNSanFSNnArLzZMd3h5U3ZWbmhhUy9RMHczZGJYbEY5NU9qaWVIQVVYaWdF?=
 =?utf-8?B?NU05VktpNFBwUWxJUi9ua2RIbGNUWm5RcEpvdDVWNDBMUitxdml0Mkcyc2M0?=
 =?utf-8?B?aGZ6WlRyZTRhNDYwUERGNHc3OUtXNEZjZ0s1ak9yblFXeXRkRmEyY2Npc0hR?=
 =?utf-8?B?VEF5TGsxT1hZTTBGbUovVmd1bFZLbnRQaXF2RFNIVHpsNEVLYXpoUnpzNjlV?=
 =?utf-8?B?WFR1VU1oejk3ZjI0QW1OWlFZa0ZHWWp6T2Q4aXh6YW01ZjQrK01jTEFRQStq?=
 =?utf-8?B?d1YyNTdldFNSY1Z2RG80RzlOOFdSUzFVM202RGdmbmw2dEtOdHlvZUlqZ2Ur?=
 =?utf-8?B?TW91dWtSVkVtT0IvYmgwQmkrSmtIZDRFbldGWENoR2gzREcrR0tqdmdFS1dk?=
 =?utf-8?B?anpIMDFjYkZUTzRzblpURU5reEh4eG5pcFUrMTBOZ1M5dmlOUmVzSUV2Wktx?=
 =?utf-8?B?cXR6OGRNcHBOTkYwdDZFRkliK2JNbkgyQ3pxOGo1RXZTclAyS0xSRFJndktk?=
 =?utf-8?B?ZGpkUnlaNzlvMDd1YUQ1U3hUY2hlUzQyQVUvZ3VRSEpWQi90b1RjU3F1U0JK?=
 =?utf-8?B?NGI3SCtjUmN3N1lvY2RjL0V6ZXkzNkdIN3k4SG5yYk0zaUlNUGxXQTR6MnYw?=
 =?utf-8?B?YnNrUXkzVDlacUJ6OEdjMkxZc1VIVFEzSmVtYkxNUEpRQkk0Rk5oaUV6TTNY?=
 =?utf-8?B?Mm5LMCtsMkFmQ2g5Z1dWWmsrWGJPYXhiaCthaU5FUDNna3FLUmpKcEt3elgy?=
 =?utf-8?B?MG5CSWp0d2c5cnpieWs4YVkzOE1VbUxvekZIbzU0NGl2bHN5TitzWDVDQ2xI?=
 =?utf-8?B?c29mUzJtNHZhcWx1cFhQS0xyb1hRSWRkRDh4aU13SDE1OHBZOGtXN1FRQWEr?=
 =?utf-8?B?WjJBWFVUZEZpdlA3SHVCdEN6TzZJeTBteWp2ZEtubWRGQ0M0eWxCQjlBcW5Z?=
 =?utf-8?B?NFM2bmhNVWczK1lQOHpJVzFJYVJEdDVjeXA5TFpQdXYrUG9WRzdubmtreEF6?=
 =?utf-8?B?eE9xeWJ3dFJBTHBFK0V4VEZMR1dSaUloajhDNlo2OEVKVHZySzA4UFJDRzhq?=
 =?utf-8?B?bjUrZFNGYXA0MDN0aGY1M3A5UFhHWStTaXIrbTNxMlN5K09OWDcyRExib3h0?=
 =?utf-8?B?eldVVWZNRkxtd3lqY1FQcXdKem5UTkdDMUJGOHRweXlDcWpXNGdUcUJMWGNy?=
 =?utf-8?B?Z0hlS1R1OWNacWduV0JVcWdValNSYkZKcGU1UGpBSFl2bGN0disyYUpHUFRL?=
 =?utf-8?B?M0Zmd1NIa1RpM1VoV1RHaEsxK29IUVEva0dHd2VxK1JqQ3dvVWR6MmRXdGVD?=
 =?utf-8?B?MGNNQWJRTVdMVW9WWkl1b2pjKzdpWjgvRFlkcndnNEhPUVl5NHNXMjZ2dnZS?=
 =?utf-8?B?RUxNTERybkFObEFRZ1lGV1JlNUZrR3lna01QUndYcyt3T2FGcmZTcnpvUFhC?=
 =?utf-8?B?QVN3Q1dLR25mMmpNbjRxbFpCeDhWZ2sxZEMvWWpYNjFYVThubXE3bWx2RDY4?=
 =?utf-8?B?TWZLVDNjYXM0ckx2cm9KV3c1eTlFeFgzOTlyZWhlMFhIdWxsUWxPWHdFdks1?=
 =?utf-8?B?ZzB3ck1mT3pKRERvNXF0cFNsbjZtUFRyYzlES2FRVzFUVm5BeEg2Z2VjaDVV?=
 =?utf-8?B?WG1WbWhuV1RvSUF2d2FFdWVzQ29GenlaRzJjSTM1dzBmOVZJa08raEpyeG00?=
 =?utf-8?B?MG5YS1BnRzgzMUJjaWd2MDZCeWN0STQvSUNlZTVuTXF0dEFsZ3lzZUUwZEtW?=
 =?utf-8?B?dWZ6UkMxSXdNZThrcFRIOG5uNlBERGJJNHhiR2FqS1pvRC83ektGcG1qdytl?=
 =?utf-8?B?aE9URWJJcy9oVjJhUWxvNTU3OHR2Q1k0dVRUL2JWUGV4MXRnNDcxbEVwd25r?=
 =?utf-8?Q?GA+3w/1SoVA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2pLN0prbzh3dk9scXRUSWFvZXZoc2VLckVuc0hpYlk2M2FvVHI1WXFsMDhC?=
 =?utf-8?B?dEdhdUNuWHliVFpPTGdxSkhTSXM1b1RnZTRrcmtvdXM0ZWhsVXdzWUQvMEVm?=
 =?utf-8?B?NytmNHYyLzBVekRzTHM5c05pMWZwSXFZelQ0UDBtMTJRQzJTQ0dKNmwrNk5n?=
 =?utf-8?B?dFgycS9lN242ZGFlVytmcmRscUhCbWVJYWVpQXRYcWpjODErMEZnL0hkMnlC?=
 =?utf-8?B?bGRRSGRGR2puSC9UUXlVbFJnYmNkWjRmMUhuL2lMSm9Xck9XbzIyU0xWcDUr?=
 =?utf-8?B?MURzK0xEMWhrUXpTYVVUL1g5dWV1U3p5aUVQMm9nT2MzYTZxWENadnJmOXd0?=
 =?utf-8?B?elNwMGVuaCtRMVQ5b0FjOHJ1RGROQWZqbldVU2tmMTE3SjZYK2ZuSHk0aXdm?=
 =?utf-8?B?enJUMXJYK1hoeWhRSVE3OXpxN0xvTFNHV0R6R1RSUzhRdXRtQmdKMDNOT0ly?=
 =?utf-8?B?T1U4SDdBRG16WnM1dmplTEhVcU9GSENWbXZVaE1RdHF0ZFdYUEZDSTdlVWN0?=
 =?utf-8?B?dXlRQVZuYlJISEhJVXdpWnFrOTRUaFFmNnhaa2tpS0t5bnZJcjEzQytDd0tH?=
 =?utf-8?B?dlNEalBaSEhTYXAxdE15Y3EvNVdzYjVJVTNQU25nZ3hWWlV0RFBLMmRxZmw5?=
 =?utf-8?B?ek80RFdlOUxrRlpab09JRURzMVZQYitpcmF5Z3U5dHRvd1Q2MWpQc24xQm15?=
 =?utf-8?B?a0hDU1EzNm5YcS80NFZxUzNydjdZWlhmRDhJc2NwdG05aXVqVUFZOUdTR3My?=
 =?utf-8?B?Q1FsRmhDazFZU3AvQXJiRnRqT28rQWJSTlZYc01XcmUzN01uKzNHdkpCcUFt?=
 =?utf-8?B?V2IvdExUV2dXNFIzRnhFb3piQlNBajdJSlFsbERpRnY5cjdXTHRGSUh6M09n?=
 =?utf-8?B?WEV2a0g0ZWVlZ1VtWjBOV0w4WEk4bjM3ZmlHUjlheHRnOXlia2t2WjhqZWlN?=
 =?utf-8?B?WEtOVXZHTzM5Z01kWW9rY0tzS2c4Mk8zV1N3cFk4UTk1czdOdy8xS2UwOFY4?=
 =?utf-8?B?ZCtvbnJVT3BxVGxRYTQ5QnRSZUhuOXI0ZDgySE0xZmo0MnFBOTNCbUFTOTVx?=
 =?utf-8?B?VXBhWjBjTlF0QWk1aUtIOXVWbkdBUGNGVU5YUWJsaWQrY2pFZU1qN0FTbFpm?=
 =?utf-8?B?VTFRVUhDdlpBeS8xVVJjTjhyUnlKdXpsRFl5ZHlkR2tOYzJVR2xEZVlMQllh?=
 =?utf-8?B?emxTb0JSM1d6QUp1YnI3ZEZqaTg2QU9UTWg4SzltcWZKOTlhL0l5eTZ1NUtj?=
 =?utf-8?B?UkFCaU45NlBZYkcvSjQ3WXVtSVdiSE1SWmMvWGxFaUhyRGRRWXpld1ZNcFN0?=
 =?utf-8?B?bmsyWk5WblM1RzNQZTRjV1RodUhYWjZQblovWDc1NnFqeUorcmNBTThmRnJi?=
 =?utf-8?B?alhRZGVqVUhqVUlNZDVQV05xWk5abStUWTFGVWJyYWQ2dUNMMmNaOHl2ZTBo?=
 =?utf-8?B?ay94UGF1cnlqeGlmczc3R21maERFeENpaEpXMGVnQWxPOTY4akQ0WHlGODY2?=
 =?utf-8?B?cmtyM0xxL054NzRNMUpja3dkRlFoZW1SSTBJYnN1YWJFOEI4WE52TkN4SENi?=
 =?utf-8?B?Z01XUjdVdXVibHlGeWJWZGRRWVNJS2puVFlxYVNDVXE4cVgxYTBOR1VzRnBw?=
 =?utf-8?B?K3o4eUxtQ0pKTHlLQzM0K3lyREF5aXBJMmJxL3ZHNE81U3BlM3NyUWpsYkVr?=
 =?utf-8?B?QWJOZ21ud2ZmdnQ1ekEyOUduQ1lsTHZ2WTBvcUs5WmFEYW9TU09tTVZ3UlJS?=
 =?utf-8?B?VVJYTjlqcWlmd2JvMk8wSTFCVGQ3QU11OURzREFrcDF6eW5yeCsveDRnY0Fx?=
 =?utf-8?B?dmpWOVFOVUc4K0I3SS9uWUk3ejJhT0N2THgrSlJvTFRWekgvM3dhcmhsbkhQ?=
 =?utf-8?B?TjhyYllQeENubWk4ZDVlT1pMcXpaeWNkdHNDcU5PQVpiQmxsZHlOQnBnaGpV?=
 =?utf-8?B?QXBpTXBjSzM5eEFCRFZidjZhV0YrMW95YlVMSG5RVHRKaTdaN1VjU1FEZ1Aw?=
 =?utf-8?B?MDJHUVM5NjlrRjFLMXpjbnlaQitFdlJONm9sVndlMUZJMTh6K0hHN2N4QmR0?=
 =?utf-8?B?YnlCcUxyaG5SV09rcWc3TjBFT1pRZFZQMHVKR0lackgwQ3V2dDFCUEdnNVUx?=
 =?utf-8?B?aG1BUTIxSldLa0ttSDN2aW1XM2VuOStYUVJIOVh5MzVCTjJRVWN0eHJ1SHhx?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2752803a-0fab-445b-4cf1-08ddaeeddba6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 04:57:57.6358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CyX0ZuNMXdjogQbtP6mmNmvmUabGXN/C8fDgmo4Qt2zGPfKlxbCaXuaFtsjjjfPSafrpPlpKFosRFB3KKYVV+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
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


On 19-06-2025 02:16, Daniele Ceraolo Spurio wrote:
>
>
> On 6/18/2025 12:00 PM, Badal Nilawar wrote:
>> Search for late binding firmware binaries and populate the meta data of
>> firmware structures.
>>
>> v2 (Daniele):
>>   - drm_err if firmware size is more than max pay load size
>>   - s/request_firmware/firmware_request_nowarn/ as firmware will
>>     not be available for all possible cards
>> v3 (Daniele):
>>   - init firmware from within xe_late_bind_init, propagate error
>>   - switch late_bind_fw to array to handle multiple firmware types
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 97 +++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 32 +++++++
>>   drivers/misc/mei/late_bind/mei_late_bind.c |  1 -
>>   3 files changed, 128 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 52cb295b7df6..d416d6cc1fa2 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -5,6 +5,7 @@
>>     #include <linux/component.h>
>>   #include <linux/delay.h>
>> +#include <linux/firmware.h>
>>     #include <drm/drm_managed.h>
>>   #include <drm/intel/i915_component.h>
>> @@ -13,6 +14,16 @@
>>     #include "xe_device.h"
>>   #include "xe_late_bind_fw.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>> +
>> +static const u32 fw_id_to_type[] = {
>> +        [FAN_CONTROL_FW_ID] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
>> +    };
>> +
>> +static const char * const fw_id_to_name[] = {
>> +        [FAN_CONTROL_FW_ID] = "fan_control",
>> +    };
>>     static struct xe_device *
>>   late_bind_to_xe(struct xe_late_bind *late_bind)
>> @@ -20,6 +31,86 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>>       return container_of(late_bind, struct xe_device, late_bind);
>>   }
>>   +static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>> +    u32 uval;
>> +
>> +    if (!xe_pcode_read(root_tile,
>> +               PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), 
>> &uval, NULL))
>> +        return uval;
>> +    else
>> +        return 0;
>> +}
>> +
>> +static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, 
>> u32 fw_id)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +    struct xe_late_bind_fw *lb_fw;
>> +    const struct firmware *fw;
>> +    u32 num_fans;
>> +    int ret;
>> +
>> +    if (fw_id >= MAX_FW_ID)
>> +        return -EINVAL;
>> +
>> +    lb_fw = &late_bind->late_bind_fw[fw_id];
>> +
>> +    lb_fw->valid = false;
>> +    lb_fw->id = fw_id;
>> +    lb_fw->type = fw_id_to_type[lb_fw->id];
>> +    lb_fw->flags &= ~CSC_LATE_BINDING_FLAGS_IS_PERSISTENT;
>
> nit: lb_fw->flags should already be zero here, so no need to make sure 
> that flag is not set. Also, that flag is ignored on BMG, so there is 
> no need to make sure it is not set anyway.


If I discard this, I will need to remove the definition of 
CSC_LATE_BINDING_FLAGS_IS_PERSISTENT. I kept this for future use. I 
would prefer this way.
I will fix rest of the nits and comments in next rev.

Thanks,
Badal

>> +
>> +    if (lb_fw->type == CSC_LATE_BINDING_TYPE_FAN_CONTROL) {
>> +        num_fans = xe_late_bind_fw_num_fans(late_bind);
>> +        drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
>> +        if (!num_fans)
>> +            return 0;
>> +    }
>> +
>> +    snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), 
>> "xe/%s_8086_%04x_%04x_%04x.bin",
>> +         fw_id_to_name[lb_fw->id], pdev->device,
>> +         pdev->subsystem_vendor, pdev->subsystem_device);
>> +
>> +    drm_dbg(&xe->drm, "Request late binding firmware %s\n", 
>> lb_fw->blob_path);
>> +    ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
>> +    if (ret) {
>> +        drm_dbg(&xe->drm, "%s late binding fw not available for 
>> current device",
>> +            fw_id_to_name[lb_fw->id]);
>> +        return 0;
>> +    }
>> +
>> +    if (fw->size > MAX_PAYLOAD_SIZE) {
>> +        drm_err(&xe->drm, "Firmware %s size %zu is larger than max 
>> pay load size %u\n",
>> +            lb_fw->blob_path, fw->size, MAX_PAYLOAD_SIZE);
>> +        release_firmware(fw);
>> +        return -ENODATA;
>> +    }
>> +
>> +    lb_fw->payload_size = fw->size;
>> +
>> +    memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>> +    release_firmware(fw);
>> +    lb_fw->valid = true;
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>> +{
>> +    int ret;
>> +    int fw_id;
>> +
>> +    for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
>> +        ret = __xe_late_bind_fw_init(late_bind, fw_id);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +    return ret;
>
> nit: this could be a return 0, since if ret != 0 we return earlier
>
>> +}
>> +
>>   static int xe_late_bind_component_bind(struct device *xe_kdev,
>>                          struct device *mei_kdev, void *data)
>>   {
>> @@ -89,5 +180,9 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>>         late_bind->component_added = true;
>>   -    return devm_add_action_or_reset(xe->drm.dev, 
>> xe_late_bind_remove, late_bind);
>> +    err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, 
>> late_bind);
>> +    if (err)
>> +        return err;
>> +
>> +    return xe_late_bind_fw_init(late_bind);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> index ef0a9723bee4..c6fd33fd5484 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -10,6 +10,36 @@
>>   #include <linux/mutex.h>
>>   #include <linux/types.h>
>>   +#define MAX_PAYLOAD_SIZE (1024 * 4)
>
> nit: could use SZ_4K instead of 1024 * 4
>
>> +
>> +/**
>> + * xe_late_bind_fw_id - enum to determine late binding fw index
>> + */
>> +enum xe_late_bind_fw_id {
>> +    FAN_CONTROL_FW_ID = 0,
>> +    MAX_FW_ID
>
> nit: Maybe use a less generic name here, to avoid clashes? something 
> like:
>
> enum xe_late_bind_fw_id {
>         XE_LB_FW_FAN_CONTROL = 0,
>         XE_LB_FW_MAX_ID
> }
>
>> +};
>> +
>> +/**
>> + * struct xe_late_bind_fw
>> + */
>> +struct xe_late_bind_fw {
>> +    /** @late_bind_fw.valid: to check if fw is valid */
>> +    bool valid;
>> +    /** @late_bind_fw.id: firmware index */
>> +    u32 id;
>> +    /** @late_bind_fw.blob_path: firmware binary path */
>> +    char blob_path[PATH_MAX];
>> +    /** @late_bind_fw.type: firmware type */
>> +    u32  type;
>> +    /** @late_bind_fw.flags: firmware flags */
>> +    u32  flags;
>> +    /** @late_bind_fw.payload: to store the late binding blob */
>> +    u8  payload[MAX_PAYLOAD_SIZE];
>
> Sorry for the late comment on this, just realized that this is a 4K 
> allocation, should we alloc this dynamically only if we need it?
>
>> +    /** @late_bind_fw.payload_size: late binding blob payload_size */
>> +    size_t payload_size;
>> +};
>> +
>>   /**
>>    * struct xe_late_bind_component - Late Binding services component
>>    * @mei_dev: device that provide Late Binding service.
>> @@ -34,6 +64,8 @@ struct xe_late_bind {
>>       bool component_added;
>>       /** @late_bind.mutex: protects the component binding and usage */
>>       struct mutex mutex;
>> +    /** @late_bind.late_bind_fw: late binding firmware array */
>> +    struct xe_late_bind_fw late_bind_fw[MAX_FW_ID];
>>   };
>>     #endif
>> diff --git a/drivers/misc/mei/late_bind/mei_late_bind.c 
>> b/drivers/misc/mei/late_bind/mei_late_bind.c
>> index cb985f32309e..6ea64c44bb94 100644
>> --- a/drivers/misc/mei/late_bind/mei_late_bind.c
>> +++ b/drivers/misc/mei/late_bind/mei_late_bind.c
>> @@ -2,7 +2,6 @@
>>   /*
>>    * Copyright (C) 2025 Intel Corporation
>>    */
>> -#include <drm/drm_connector.h>
>
> This change shouldn't be in this patch. If this header is not needed 
> just modify the patch that adds it to not do so.
>
> All nits are non blocking.
> Daniele
>
>>   #include <drm/intel/i915_component.h>
>>   #include <drm/intel/late_bind_mei_interface.h>
>>   #include <linux/component.h>
>
