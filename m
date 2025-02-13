Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF781A34DB6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 19:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0094B10EB71;
	Thu, 13 Feb 2025 18:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gA4VZUNc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976ED10EB71;
 Thu, 13 Feb 2025 18:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739471348; x=1771007348;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ObF+p7oaLJ60c8pVmqf3Ph/j1+Z2GHI3Tv7+IYHlVkA=;
 b=gA4VZUNcKAl7hbjyWqUUkfwaxaqTFofKpZoBf+ybV7huAMtKxsDBHzHC
 79nAtW0vef1W0+p5grrWl7vEYjbqZEKh3Lzbvse/HtkdxzzZnX7AY5Ek8
 cW6F3WxrWc7DU8tV7MZs/1MUVQ4mfcoXZlaU+kbL6mMz+Nyknjv6aDnu/
 Iy6u+gfLa4xC9D04OT/pa5usBTytf0++h0UeMVCNw8aQNaq45uQEPDRUp
 clwMfodU2C0R+egSt7/9TxMR/4g3b/wenMTdu372p1DVULo95EfdDnIF9
 7Le7B9Jf8B0nHfDJp2sTrLS6LdPFMEmusQcSIPv5INmPSgghFptGLeRgK A==;
X-CSE-ConnectionGUID: jiKV7cBhQ+Gr7sEgF5p7XA==
X-CSE-MsgGUID: TXOZPsLMSp+TahJ1S0FuBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="62663636"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="62663636"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:28:53 -0800
X-CSE-ConnectionGUID: ofbKEApxST6gyioFZ9VMkw==
X-CSE-MsgGUID: zm+CAHN7SKC+dRMpaClzBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113406802"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:28:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Feb 2025 10:28:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 10:28:52 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 10:28:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PM+NA6an5jZg/BxZ5WW+VolOEdsn4E5rphpPr4yvM3jBNKPIYGUjfUsi2gOFXWCsiKmy47VU02O0YD7dbyX6+AW+8iY42/KYN1yA9Sl/BXoaSSvSl21/hAgXz1dL5+KuAwJpPUFtKl6PQi1WkyawKHwv70yD+XDZjtE8MjduwCSHlcplLPMPTfQphcPOazOlVyYCq9MRrE9fulQgWci6vkwoXzWxKc+ph5QmDl/gAUzEE2vQ1ZIcyfIwkE3td4klcNbU8MoRtMhSlfUZ+1X/HDXIP6MD+j34v7mYSn4VyuxC/2xM4CbwZtXdOjojirjfSnaasDirrhHoVcUfT2dCbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtbPqiiwxGaQdyJe98gD9TgO1ektDkWqaR/S6gRch5s=;
 b=mJG5ExPIbLsfp/tgmfQzwvdjMtVyMFLPSbZ97p6R2J4BWfMr+xH4B4z7Pvf3fvBqo3TgB7Q4cXgNeUB21bcC0MSl+kodRO/Oob/wD3p/3j9wkjVS1E2SDAaEWhSRhbQRF8Tvn/wFcH3o7BXiWkq0lo0HKSwrm/dPwivpy4ZBMxe6ozPZN3N3gCgKBbDcWj1mNMqRUhiG7LmC9tbfccwSk8Q5Bk7LJoW2lq1pedr6+U/OJDGHyu3moBjtpqyXP89EyI83rcctqcpWjQ3NnEoZKsc1lCbdIJI7ORHORtrX1iCODPbIsI2w9y4tQ7FZOYhP6uNzjYSNE9RribPu2iva8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA2PR11MB4778.namprd11.prod.outlook.com (2603:10b6:806:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Thu, 13 Feb
 2025 18:28:34 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 18:28:33 +0000
Message-ID: <ee155ea0-e7ef-4a5e-b409-d08b62762e5c@intel.com>
Date: Thu, 13 Feb 2025 23:58:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 27/32] drm/xe: Add SVM VRAM migration
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-28-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250213021112.1228481-28-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA2PR11MB4778:EE_
X-MS-Office365-Filtering-Correlation-Id: 55df33a5-96f9-4ffc-fd50-08dd4c5c3922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1ltM0RHYk83MXFJMFA5a1dkOUxaNW05eVVSY1MyR09ES1N5b0JuOUFJampC?=
 =?utf-8?B?RXF1TVRLOEkrMW8wdFZZT3BSa0ozWkpDcDhDZWxoSWNUMmtkSHppSklyZ05w?=
 =?utf-8?B?bHA3enVwUTlxdk1iN2xJUzFnUnlRR2NkZFpjYVRHWWk1Z29NM3JSbEo1Q2lz?=
 =?utf-8?B?a0xvUzRPTmFOV25YWW5odzVKVGVMMFpkcTd6cWZNRnZwOUduNS9lN2Q0bzZs?=
 =?utf-8?B?WkJsR1BHT3J2cGF4eDd0eXVQeFVCd08zVFJRWlBQeHZwY2pTaC82UDd2eXhB?=
 =?utf-8?B?U0QvRjdlV2l2My9VZmNWVVdCKy82dFNnd21VUWJkcnQzRGJ0bndqVFV0dHk5?=
 =?utf-8?B?YlEyUGlaVFpNRnRhYi9nYWw4Z0Q3Zy9mVUZ0ZG9xN2hJZnN3azk0MXJZYWdi?=
 =?utf-8?B?bk92OWl1LzRETWxabG1zQVY0WVBLQ3lSeWs4OUVpb3pLUHJHc1RIQyt6TXpj?=
 =?utf-8?B?OWlWYlhCbnJwbk9qTjRBOHpFTDJObUptVzBrZk1SNGtkY0d3U2lxV0o2MVpi?=
 =?utf-8?B?WXNvRTJXZ3ZXZ1ZGMDlVbCtJcmNIUFF6OVhMSGxoMTBEQjYvVDNvZWE2SExx?=
 =?utf-8?B?L0lSWmZmUHpHWndpUG9rWE1HekNxd0NqNmg1NzdBVm04L0hGemRjQnp1ZGxO?=
 =?utf-8?B?WFJnY3RxNHZjR0dwUEFnNUpldHFDM0F3RnByaGVXcmVPSE82MVczaEtwOGVB?=
 =?utf-8?B?Zmc3QVBRN21YMy95SFMvY1JhL056NDhOVWhDTGpoTHZmd2FzZE1tNmlQQTZU?=
 =?utf-8?B?Mlo5Z3d3ZWdka0dVMlFDcnBWU2pUelhXeEZZTW05eFBQaHFsU04zbko4ZGVE?=
 =?utf-8?B?cXBGZzM2dVJGV2lZZVYxaU5TRklTUG85YWNuUFp5ektTRUs3ZUdZOTVKNnBS?=
 =?utf-8?B?aGwvVjRLcWRDdEs5cTZnWjBlbGw5eXB4WEx0dVM3Tjk3cTlQY2ljU2Yvd2p3?=
 =?utf-8?B?RFl1aThLa2lPNE1EZVc1dFRGaXdpQXMrQ290aWRVdHEycnk3cXJWTmRxakJD?=
 =?utf-8?B?YnE3UXFUcXVtZkxSUno5VmZMeUZ5UnFhS0NuUUw1Z3dVNklLQjZ2N2NzbFdW?=
 =?utf-8?B?WlJHRzdjS3RSYUxJeE9aYjR2Wi9rRHpMSFRSRFZkTU9JcXJsa2paMTAvYXJX?=
 =?utf-8?B?NnQvWXlMSWdoUmgzZkNsR0VMSjNWWEszRW1wK0xENVZRczNLZVFjWFRLUGg2?=
 =?utf-8?B?ZDl5dThXSmlFWE1wSGxibzNEOTFOYmRibXVxWkl6TjJhQXpkcy9QRVN1djRM?=
 =?utf-8?B?dW9pN1h6MEFSL21BTGI0cHpTQnRPQTF3UDRXcXJ3TiszdUF3MTY3OVVqWWNY?=
 =?utf-8?B?ei9OdmdiQVk1Sml5cldZdFVjb29UOXpXbEtVTmhBZER0NGYyVUgzTGtJcEs4?=
 =?utf-8?B?MDhzaVB1SHFoQUxac1ZqYnN0QmNQSnRtQTJjamlPTkg4Z3ZyWi9mRWc2MCsz?=
 =?utf-8?B?YldYcUtwcm4yRndqTmlYYnk2RlByMUNYOVVEYlU1U1F0UDZTeE1JWmZ2Tkpy?=
 =?utf-8?B?VlQwa3ZtU2txdWZpVXlaS1dRQ1VkUHlHNlVmMlBLZTliQkMrZUtCcUZ2TXF6?=
 =?utf-8?B?bGFuSXZDOC9yZzN3cGNjcUdKRHFoaHBHTDh5bUNWdFpEZnVQVE9WSml6MG93?=
 =?utf-8?B?L2IyQlkrYzdUZlp5NDZhZDBLUDUzUlovMys2SkJSdDFVMVJvVzRPcGppYU9o?=
 =?utf-8?B?UFd5RTYvcW5wV3BpY0FwTG1CcDdNZUtjSGgwN1N0NDJYdDNHLzhuTVhUNS8z?=
 =?utf-8?B?NW1ybnVSUVhLaTRsWmk1UCtvM2NUL1E4WHptSHFEbGxvUTR0aDNjZVhNMVJa?=
 =?utf-8?B?aHNhRno1RWEzMndUQzlNZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXhLRWdGUHc0eFZiT3MxZXVkWnJZYUJvbmpwL2VYSGRTM29ybDBEbUU1UW9U?=
 =?utf-8?B?RTZmSjFQT3I2aEV1Z0JqY1pUTzdNUEVJTnk0K3dhVEhRVWhWSnVxTFZ4UXYx?=
 =?utf-8?B?TlZhK0xlL1RoYWh4RXNwUHYxRlA2VThtZVFjSHRJT01KYklSa2lheE1xbHJM?=
 =?utf-8?B?OUN2RlVUampsNHJmTVJFaTA4Yit2R09rMzZDYU1IUkVGNUFUaWxpeEE4ekpn?=
 =?utf-8?B?TUpkTGRIMjI5WlBuWGhwRWR1MmpDd21BVVcya1dRd21VRlY0eEcyN1hCRXJ4?=
 =?utf-8?B?b29idUR5V2lON3JaNWNlZUdtbmJuWHVLWEpzRWlMc2V0MXptRzNYTExhQ3l3?=
 =?utf-8?B?SXVjdE1BbFdhYXh5MFlOdlNaZjZzak0zNFh0dVRhbzdMNkxqWVNUckNLMGxI?=
 =?utf-8?B?TGV6Z2dabnFyZjNEM3ZBTjY4T0FnUmNkZU5jZG1Pc3A0aExFdHE5MW5rWmZ5?=
 =?utf-8?B?bXluWldEQ24xbDlwUy9SaUFSbWFCM082M1ZXZ29tN3I2L0NKMXpRVUtKZU9Q?=
 =?utf-8?B?RDZTeDl1Qlk0MnQ1Rnd5ZndmUWJJU3ByUUlnUXp0eDlzRXVacWFNSjRKQ0Nm?=
 =?utf-8?B?WkRoN2lhZVFPWmtMZEo1N1hudU5YRTNWWFM0UGcyY29vM0poS3FDb0xKcEg5?=
 =?utf-8?B?RndJdTlETW5pcE5CZzU4SWxESGJkNVVGVWZaeVY5NVJRVXI5OXordkF0QVFj?=
 =?utf-8?B?Y2tyWmhUNnY1aTRMMmNmamRCMHYxNjM4Z2czN1VsZThrSjNoNUlSMUQ5clQ0?=
 =?utf-8?B?MFJuOTUyYVQ4QStxRlVkcE1HY1ZRVzNFYytjY1lnVGp5R2FSaE1wa29KRm8v?=
 =?utf-8?B?T1MyNks4dTBJMlVkV0xEcGE3aXRMdFVnUDZhdVp5VGdVNEJ5Wjl2ZUVybExU?=
 =?utf-8?B?Rm9DK2VaeHZjc0haa1VEeGl0dm1LQ1BiaitCRGhCWEp4a3dlWDRCdmRRcUpj?=
 =?utf-8?B?bnJOaW9OTWhqcnUxL0JxSTM4ZC9wTW01UWJObFNMRWFiREEwaEJhamRieW10?=
 =?utf-8?B?YkZoczZkYXNzV0p6ekJ6NkVNRmZmV25YOVNNMkttSEk1NS9WY3Jud0F1ZXo0?=
 =?utf-8?B?NjB6SlY2WHRLVXdJdy9BK25Xcmw3Rm9BSmlYMzA3RUtaOVQ2N2dlVXFFY2VL?=
 =?utf-8?B?K3pwRjh3cUYrVkdiVnpPWlBYQjBWVkc5RDk2WlJhY29HdEFoNzNmeFlhdnBH?=
 =?utf-8?B?ckFCT0NxREM2Q0tsODgzcXRBTnRWc1JEWVRjSUhtRms1TmcvQklUNWMyL0tU?=
 =?utf-8?B?djd1Q2NWY1NwK3NwSFJJaTQybk5QL3h0TEFYbVB0N1JodjR0VU9NZmtKNXR4?=
 =?utf-8?B?U1g2VHdqOFM2Ui9BU0xMbTUyWXJvdWJpUkF6ZmQrZG9kUGdxTGVCVHhid08x?=
 =?utf-8?B?c0ZhcU9SQytiOE5BeENmUUxzQUFYUTh5TFY2bExSaElXUzRUYmUweGh1cDU4?=
 =?utf-8?B?ODg1QVlza2xwTG1hbnFWd24xWURjb1ZMWElLVWtJUW1mOEVvdVdieWhCWTB6?=
 =?utf-8?B?N1c4TGtEWk52cHVWMzRMblVJREFrOTZZZ0J0VHdBaVBVU3RiSjFjS1JSN1l6?=
 =?utf-8?B?Y1RZYkpaQ29NV2xNcHZNdzVWalUwVzZYZUJFSVV4VE9XY3dtUHRmMWhIeXVX?=
 =?utf-8?B?b0VZdE9SV1FYS2hMSlVHU2U1QUVGOWQ1eVVRdkJRTk1NSzQwUU1SbWhPSnVQ?=
 =?utf-8?B?aU9kWWhaZ2xtVEJ0WTBlN1RnRHdGdk1tL1o2a3lNZUNCRUNGT0tMN01hc012?=
 =?utf-8?B?aVhMYWo2U0ZvazNiTjV4QVdLb2piamVHQm4zU3RUaXgxcUtkdmN4andSc2k0?=
 =?utf-8?B?ek9sbmJ6SURsMlBTMTg1NUpJSVBJMWxZS3lObGRSdStQQ0xWTmE3N04xZXcx?=
 =?utf-8?B?bkphWlVKQm1VSzFvOWtERTNBajJsdTR4YTNzbThOSGpxVzBXSTBNN2JRM1FG?=
 =?utf-8?B?SHhJdTIzM2VQc3k4bjhveENmQWxNNk5pYnk4QUptb0V6TDA1eHVNL0hNTEQ1?=
 =?utf-8?B?eWxiRk82MVdBUWw1NlB4b2c1c0V6VmlrbFVEQ0dLOG92MkFGVXQ2OTl2WmJY?=
 =?utf-8?B?NWFCTm5SNXhyR1VqMWJKM0FDQW1mTGdyV0IzT0NqSm1lL0EwK3BWTjRXS0Yx?=
 =?utf-8?B?UjBOWnRUb3kxNmhQaTVEVWZmcUl1Y2RkbHFvNHhOcTh1K21ZSDY1OHdvRGlY?=
 =?utf-8?Q?13d/OXGNuZf/9UwCaYIeP+E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55df33a5-96f9-4ffc-fd50-08dd4c5c3922
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 18:28:33.8815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYQS2hBVmNxQUWRQypnB4gQzHIZC/j5nCbdhO7ZFa29LXt+ppqt+FhqnXXQHJW8ZnFZv4Ejcc6txdWn8xXzMC4D/TKbNiOFoHQYMqZfAX+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4778
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



On 13-02-2025 07:41, Matthew Brost wrote:
> Migration is implemented with range granularity, with VRAM backing being
> a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
> TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> SVM range is migrated to SRAM, the TTM BO is destroyed).
> 
> The design choice for using TTM BO for VRAM backing store, as opposed to
> direct buddy allocation, is as follows:
> 
> - DRM buddy allocations are not at page granularity, offering no
>    advantage over a BO.
> - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
>    evict each other).
> - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
>    require a dma-resv.
> - Likely allocation size is 2M which makes of size of BO (872)
>    acceptable per allocation (872 / 2M == .0004158).
> 
> With this, using TTM BO for VRAM backing store seems to be an obvious
> choice as it allows leveraging of the TTM eviction code.
> 
> Current migration policy is migrate any SVM range greater than or equal
> to 64k once.
> 
> [1] https://patchwork.freedesktop.org/series/133643/
> 
> v2:
>   - Rebase on latest GPU SVM
>   - Retry page fault on get pages returning mixed allocation
>   - Use drm_gpusvm_devmem
> v3:
>   - Use new BO flags
>   - New range structure (Thomas)
>   - Hide migration behind Kconfig
>   - Kernel doc (Thomas)
>   - Use check_pages_threshold
> v4:
>   - Don't evict partial unmaps in garbage collector (Thomas)
>   - Use %pe to print errors (Thomas)
>   - Use %p to print pointers (Thomas)
> v5:
>   - Use range size helper (Thomas)
>   - Make BO external (Thomas)
>   - Set tile to NULL for BO creation (Thomas)
>   - Drop BO mirror flag (Thomas)
>   - Hold BO dma-resv lock across migration (Auld, Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.c | 111 ++++++++++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_svm.h |   5 ++
>   2 files changed, 112 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 0a78a838508c..2e1e0f31c1a8 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -32,6 +32,11 @@ static unsigned long xe_svm_range_end(struct xe_svm_range *range)
>   	return drm_gpusvm_range_end(&range->base);
>   }
>   
> +static unsigned long xe_svm_range_size(struct xe_svm_range *range)
> +{
> +	return drm_gpusvm_range_size(&range->base);
> +}
> +
>   static void *xe_svm_devm_owner(struct xe_device *xe)
>   {
>   	return xe;
> @@ -512,7 +517,6 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
>   	return 0;
>   }
>   
> -__maybe_unused
>   static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
>   	.devmem_release = xe_svm_devmem_release,
>   	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
> @@ -592,6 +596,71 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>   	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
>   }
>   
> +static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> +{
> +	return &tile->mem.vram;
> +}
> +
> +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +				       struct xe_svm_range *range,
> +				       const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct mm_struct *mm = vm->svm.gpusvm.mm;
> +	struct xe_vram_region *vr = tile_to_vr(tile);
> +	struct drm_buddy_block *block;
> +	struct list_head *blocks;
> +	struct xe_bo *bo;
> +	ktime_t end = 0;
> +	int err;
> +
> +	if (!mmget_not_zero(mm))
> +		return ERR_PTR(-EFAULT);
> +	mmap_read_lock(mm);
> +
> +retry:
> +	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
> +				 xe_svm_range_size(range),
> +				 ttm_bo_type_device,
> +				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		if (xe_vm_validate_should_retry(NULL, err, &end))
> +			goto retry;
> +		goto unlock;
> +	}
> +
> +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> +			       vm->xe->drm.dev, mm,
> +			       &gpusvm_devmem_ops,
> +			       &tile->mem.vram.dpagemap,
> +			       xe_svm_range_size(range));
> +
> +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> +	list_for_each_entry(block, blocks, link)
> +		block->private = vr;
> +
> +	/*
> +	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem succeeds the
> +	 * creation ref can be dropped upon CPU fault or unmap.
> +	 */
> +	xe_bo_get(bo);
> +
> +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
> +					   &bo->devmem_allocation, ctx);
> +	xe_bo_unlock(bo);
> +	if (err) {
> +		xe_bo_put(bo);	/* Local ref */
> +		xe_bo_put(bo);	/* Creation ref */
> +		bo = ERR_PTR(err);
> +	}
> +
> +unlock:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +
> +	return bo;
> +}
> +
>   /**
>    * xe_svm_handle_pagefault() - SVM handle page fault
>    * @vm: The VM.
> @@ -600,7 +669,8 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>    * @fault_addr: The GPU fault address.
>    * @atomic: The fault atomic access bit.
>    *
> - * Create GPU bindings for a SVM page fault.
> + * Create GPU bindings for a SVM page fault. Optionally migrate to device
> + * memory.
>    *
>    * Return: 0 on success, negative error code on error.
>    */
> @@ -608,11 +678,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   			    struct xe_tile *tile, u64 fault_addr,
>   			    bool atomic)
>   {
> -	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
> +	struct drm_gpusvm_ctx ctx = {
> +		.read_only = xe_vma_read_only(vma),
> +		.devmem_possible = IS_DGFX(vm->xe) &&
> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> +	};
>   	struct xe_svm_range *range;
>   	struct drm_gpusvm_range *r;
>   	struct drm_exec exec;
>   	struct dma_fence *fence;
> +	struct xe_bo *bo = NULL;
>   	ktime_t end = 0;
>   	int err;
>   
> @@ -620,6 +697,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>   
>   retry:
> +	xe_bo_put(bo);
> +	bo = NULL;
> +
>   	/* Always process UNMAPs first so view SVM ranges is current */
>   	err = xe_svm_garbage_collector(vm);
>   	if (err)
> @@ -635,9 +715,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	if (xe_svm_range_is_valid(range, tile))
>   		return 0;
>   
> +	/* XXX: Add migration policy, for now migrate range once */
> +	if (!range->migrated && range->base.flags.migrate_devmem &&
> +	    xe_svm_range_size(range) >= SZ_64K) {
> +		range->migrated = true;


shouldn't this be set to true, only once xe_svm_alloc_vram is successfull ?
In case of bo alloc failure retry wont enter here.

> +
> +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> +		if (IS_ERR(bo)) {
> +			drm_info(&vm->xe->drm,
> +				 "VRAM allocation failed, falling back to retrying, asid=%u, errno %pe\n",
> +				 vm->usm.asid, bo);
> +			bo = NULL;
> +			goto retry;
> +		}
> +	}
> +
>   	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> -	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have changed */
> +	/* Corner where CPU mappings have changed */
> +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> +		if (err == -EOPNOTSUPP)
> +			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> +		drm_info(&vm->xe->drm,
> +			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
> +			 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>   		goto retry;
> +	}
>   	if (err)
>   		goto err_out;
>   
> @@ -668,6 +770,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	dma_fence_put(fence);
>   
>   err_out:
> +	xe_bo_put(bo);
>   
>   	return err;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 0fa525d34987..984a61651d9e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -35,6 +35,11 @@ struct xe_svm_range {
>   	 * range. Protected by GPU SVM notifier lock.
>   	 */
>   	u8 tile_invalidated;
> +	/**
> +	 * @migrated: Range has been migrated to device memory, protected by
> +	 * GPU fault handler locking.
> +	 */
> +	u8 migrated	:1;
>   };
>   
>   int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);

