Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F51B9F17D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 14:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0859510E8F3;
	Thu, 25 Sep 2025 12:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSk57aa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE2110E8F3;
 Thu, 25 Sep 2025 12:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758802183; x=1790338183;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mlZMAFbC5/ttRZtk3Yi0NIoyy+fdfVqMeb3NuKPeE1E=;
 b=WSk57aa9twq1Piu2DYYZ8/IHLnMNvh95J7xtCeht+uyQiXgfDexw4CA3
 QWiw3jFeofnijPylrRZY82UGNWoESvcjSw5e/1VgCQ15tto8cjY2wzjBV
 l7a0h92hzQTddjt5p94Qz4e0UtowW9Wi2P6P6BNTbQswlLwjjyCOU7o7o
 n2z953M2Z0iBGtd2MooTGM2Tvn9TzuD0xDA38xuNPLUQ3wHEliFBlQyck
 gbzE/Ppf3n6zBUZU2EP1ap0VIj7NC+x2MPPJLKaWVhshZAY4Gvh/fmF5W
 lQG4pIKRcBz5t2vKMXsGETCFiU01LDyXYeq6XFCzGf0ylHqvq9YkyuVWH w==;
X-CSE-ConnectionGUID: Z1PB41DZSgKDTLZA1Iwd9Q==
X-CSE-MsgGUID: IGhQfziOQTyu7IJU+B0k8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="72544755"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="72544755"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:09:43 -0700
X-CSE-ConnectionGUID: xVHRmayhQPSDx/JYWApM7g==
X-CSE-MsgGUID: M6LMJsQuTjicpE+Iuogj7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="177750145"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:09:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 05:09:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 05:09:42 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 05:09:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WD1GpFNE2S4iDcpRCBv7dc+fu8szcWS88+f6O+Anddp8hf9t3sWKkelEGTn3UPeM+4MDDd9RWcqrGeMjhis99Y7pIoIl7T33WJ/+tOUFdSKZguOaVbos+e9vXpx1eRLeomkfPltk2MGxXsQSd8kSru3h2nGyl2IUnURdTGFol9yWj31Wxq521xphisvXehIjfltU0mmJCPsBLT94SWjEJwJL+QMco/w1iSL5jtJMLyGc3q5ntCTbCB6fzeYbQpehb1MIg5rwVvTYORYkowXMpWOj9hdfUA5a4HwyOgvSGj2NeYNAzSXuiT3LbuRXIeUGYjOtFVKc4aqmpCJy8J5GIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHjkSFcIr81z1/P5wlNEk3sSFCAds97kLdZwdoaDd3Y=;
 b=whDmR9MO2jWgCGH3zzso9mHYs6PDqpL0Dh038vudYYhDSvV9oHwsDIWgVck+KqUMwHUHrxCWv+Ed3Qks+qMUK1wVJh/cVh4cqOqpfrGcA7acB2nk4XQ1EpdkhAFfOJHKjq5vMQAXtGqVGBI84652g2OV+MHHTWSLM7k4kewWwwSHw5Ab4cuoEKzRYQ53k6TXoJazbqHsXi2EfM0+nQx0kBrlrz20UxK65gXsnXO7rNnmLpnH7Hwkbis/JOxivRkVN4mC6qEAnvtdP1Jw+JwO1+zIk9uUYEt4DPmwvHh24cn5bjLebSTeSRqK26aKC7+9sG1s6KmfCQI2Cf9FnyOK9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 12:09:38 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9160.010; Thu, 25 Sep 2025
 12:09:38 +0000
Message-ID: <d695d564-6c4d-431f-9b21-5ebf574e0c2d@intel.com>
Date: Thu, 25 Sep 2025 17:39:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 9/9] drm/xe/xe_late_bind_fw: Extract and print version
 info
To: Kees Bakker <kees@ijzerbout.nl>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>, <mika.westerberg@linux.intel.com>,
 <lucas.demarchi@intel.com>, <karthik.poosa@intel.com>
References: <20250905154953.3974335-1-badal.nilawar@intel.com>
 <20250905154953.3974335-10-badal.nilawar@intel.com>
 <e6da8bc1-12d2-433e-ad20-095c291e03d4@ijzerbout.nl>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <e6da8bc1-12d2-433e-ad20-095c291e03d4@ijzerbout.nl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: bdad546f-83b9-442b-74f4-08ddfc2c6677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2pOSDNYTGxDeUNwRXp4bkNVbzBGc242ZlNDUzFYL09DcUJCTmNLSXM3NDIy?=
 =?utf-8?B?UEVQUmcwcW1qM2hCcjhYYVFZaWt3bHZVV2RxTGovaDlIY05kazVQZm5mMHVw?=
 =?utf-8?B?OHhac2Qrc1NBTHdldVN5eElNSVpxM1dSMEw3clFCMmNWaVVhOC9SaFVTaEJ1?=
 =?utf-8?B?enR6SXFaU3BkUlNuekQ5ZXNod2Q5N2NqWXZpWGt5clVLYzg4WkRuSDc5U3R0?=
 =?utf-8?B?UTZCZUZzVnhpVS9mcWN5T1dtUElTbXlCN1hhamlDUGtmMWlCanFRVTBQSW5n?=
 =?utf-8?B?R0tkajZaWThFNngzbXR4QTFCTlU1V1hiTnhzWG5ZL1JrMmkrbFJlcG50eHFB?=
 =?utf-8?B?dW9BdFpqLzV0eUo0YjYranRiWk9MU1l4TVc4MXI3NFMrb3drc3h3cTBlaWM2?=
 =?utf-8?B?YUhZa0RXcFF1MjF3MTQ5Qmp2S0NvNTc1a0VNWWEyQ205bWdVbk1wc2pwZFhU?=
 =?utf-8?B?Z2Z5S25GMGtXQkVEajl4VXVOVVlKK3VBcU80VmdEeHZtY091clR0TEN6VGpP?=
 =?utf-8?B?SERpTHVaaFVlZEswNnpXM3h2RjFSN1JORlpkMGhkWUgvVVlvUlQ1c3dXVEZk?=
 =?utf-8?B?dDE3aXc1UTVyY2tKbmtmemVxRkMyQmI5U1F2Q1Nid0xSVis1UThxSlBFNUpy?=
 =?utf-8?B?cmxlK2FwT3p5UXFXR2E5QWgrMjVMcUxXdXlkWnFRaytncHV3dE9zdzlsem83?=
 =?utf-8?B?V0R1emhiK05KcE53WWhHNS9uVS8zdkRaMTFvYjVmaGY5VXYwelRxTU95NFAw?=
 =?utf-8?B?NlJUelJmM3hoY1VDQ2tLUzFWMi85cUk4NEtrY1o0UDFKV0FmdzJWdThVZEJ0?=
 =?utf-8?B?U2ppQ1A1ZjY2SE90RGpPMitsL3B1K3Q2L3NXRHB0THhyR05iNlk2VmJCVGlu?=
 =?utf-8?B?S25mL2czYWdUSWQxdWs3SFRGSHVDMHVsKzJwREJSbTVoaU9nRGxFRDl5alYw?=
 =?utf-8?B?L2JIVzJLeEJIN2loUUxIUG5yNkpyYzltYU9KYS94UlFIUjhsNFJHS3ptbm1M?=
 =?utf-8?B?SlJ0UmtDWjlDMHd4SmI3akNvVlUvY2E0SnVqZXVtZGNNc015dFZ2UXRrSmJx?=
 =?utf-8?B?OFJ0Y1lMbWpic0VrSnJKNzd0Q1JFc04zcGI3Q0RsU2lFVnVOdENNUURmWk1x?=
 =?utf-8?B?eUtKcTZ6SmhUcHVMYjdibDBhSnVTOU16WTh0OUlDeHBLNkdHd3pWano4NEtz?=
 =?utf-8?B?Slp6K1hYSGxjK2lBOUMzUHE2anZJTlM2U3lucjlnZlFiWDlnaDBudFVPd3JD?=
 =?utf-8?B?ZjYram9FcnFYeWpiNE91bkVaTnhKUGxUTmNoS3hTMDh2bnlMR05KNUhDenF2?=
 =?utf-8?B?Y0FnSzE4bHNWVjhsbVI1SXVaQ0pZMy84VlhWWEd2cEdoekxPMDhnRmZBQ1Vp?=
 =?utf-8?B?VGNNSTFFNWNFU3B6ZmE2SkowdVhuMGVldlpJVXF0TjhoWjhPRnlycVIwaHJE?=
 =?utf-8?B?TUZ0TVhCcVhWZlFEa0JkWGUrWHRhVHp6b2V1S3FNUVpjUG10Z3VpdkpqTkdM?=
 =?utf-8?B?d0hZV0toT1dvSHg3K0huU0FpT1ZPNUpNUVo0RFpsZDVXOEJPT3hUYlBDTXZq?=
 =?utf-8?B?RkdITTVxYi9DRUtIb3l2WFowcTRxLy9GRFNteU9LMEloTXhEbFg1MUhyUXRr?=
 =?utf-8?B?Q1UxaFJ2dkpLMGZrU3BNZ1JZczNKZUVUQXMwUmJSRUtheEs4N29VOFpCMDJQ?=
 =?utf-8?B?WnMyU1h6SlRsTWEydEVxYit0WUtRcVRuRjBQV05Kc3RjaEduQVAzbHBuajN3?=
 =?utf-8?B?VVpWUHJnVHU0M0M2d0pOdStZdkJmYzJ1WnR1TWJVaUhWQkZ4MzYvYjhGYkpC?=
 =?utf-8?B?UjNmbkU5R1dJRkVNbXpMZUwzMVVZMHk0NTFtcUdIMDdQK1lqb1dCZWVrUlg3?=
 =?utf-8?B?dVZJdEVmN1Q5akZYNDNUYUxzMGoyOGxrYkJXVVJSTEpHQ0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BzVFhNb05JTGFSeTQ4YUh0TThBcWtmb2FsT0V3L2tyZXY4elFMSHBaRTVO?=
 =?utf-8?B?MXFhSEJ0d2ZVei9ySmx5cnBqVVhhM0VrY1pyY0p4cmVONDJ2UXZzRlhFa25z?=
 =?utf-8?B?RTRUSmFkN3F0cGZabCs3dDVYZ3BGdStxeENlckpmd0taYllucVVOSVhteW1k?=
 =?utf-8?B?eng0SklFY05wZzFwYmRpaG5MdlFWdFB1N25sRWlGSXdzSUFGMUxBTVBTKzQv?=
 =?utf-8?B?eGNLa2pDWnk5R2dzOWthN3MzTmRMWU9jVXlEQ1dRRnU1alpCQ2JPakxLWmJh?=
 =?utf-8?B?c2M2YWtBL0FCV2lJbE9IelV0aUZ5bjFscisxYUoxa1VjYVVZTGNlTlRRNDEy?=
 =?utf-8?B?NUl6S3grUGdMY0wwRTRkdDQvV0pRaVRlcEQ1YVVtcmlWR013aHJOOG05NFNC?=
 =?utf-8?B?S003a0NUMUVqYUdxQ3N0M1NrVWFLcDlYcHZDNFFPdkFCb3ZFVEZuTmxLWEhz?=
 =?utf-8?B?cEc2RFlIUEtxYmhVdHMySXBEOW5vV2R2MU10a1dHZklZcU9kWXF4UmNCTUda?=
 =?utf-8?B?MFZMc001djR1YnVrcThTMmdYcndrVlpkL052SndjK0NXVzdzOHRKOVV6Vmwy?=
 =?utf-8?B?TVR6dlRkRVpIdjFDMEg4Z3NkdEZiYVJBc3VoRncwdFBDNDdMcWkvMkl5RGVx?=
 =?utf-8?B?b1MzVVU2Q0hkSFFNOWRJc0w2bXA0Q2daZHpNTVk2WGNvUzFBekU2eEhTSFVq?=
 =?utf-8?B?anRPaFI4ckdtTlppKzAxSmxRQ1phQklQd2NJVGpYNVQwSWtEdGdzamhvdHdw?=
 =?utf-8?B?MGozUlNzTVk1MFU2ZVQwZU9FWUVsdjF4SlNldU4zRzY1ZlhCRlMrVVIxRDFB?=
 =?utf-8?B?VlA3N01rQWppeGpTbE1vZkU5cFh6aEFRckd1T3BYQnhwK3BJdEdvdkF1dmNm?=
 =?utf-8?B?SnlReXE3S1l6Yy9uT3F2WHlTQzhNcmM2bnVRZnQyTnlsdy8xRnNFNEdSSWZa?=
 =?utf-8?B?R2NicE8zVldUYUorSEszVDVLa3JiaDN0WmJLNlhkQ3BxdEN0ODJjdVFXM3Ay?=
 =?utf-8?B?bFJlQmc4RkxGR1J6WVVXU0s0V2d4RnZDZTVDWkNST1VUYmZDTnJLWVRtNE5n?=
 =?utf-8?B?VlhxeW9OaCt3Q2NqSzB5aEJkMndGL3lBaUpvV1dpbXJpWG1OTzlObWhycTVB?=
 =?utf-8?B?VVk4Z2xQSHN1a0huVWtVbUNIM01rNXpTYTlFbjZtK3dVbmNkeWg3T05rY2hT?=
 =?utf-8?B?b21Ca0FzaUVWZDZqZzJvVmcrN3FRS1RBRDZXbDZ2Nk1XeVUraEs1dE90eEhz?=
 =?utf-8?B?R1NkaDJ1NE90elF2MGxOVUxqNDBqdE1ScmxmOHhvU3Z5anJ5L1NrcmhsVXNB?=
 =?utf-8?B?aEJpM05oVW9lYnAwUWp5aytaSlhIVlE3ZzEyaG8yTFJKNFRkZEVUcWJNcHBK?=
 =?utf-8?B?Y1FhdkZxa29TUk1KcGxwSGdVZ3lBQW9EZWI0VVlTM3Z4VEVqdkdiUjdUMDZx?=
 =?utf-8?B?UjEvZnZiSndMSUFPc0NET21SMFk2L01TNHBOUXBsOXQ1Q3VGVmJJSndoRExs?=
 =?utf-8?B?ajRENDJiVEx0QjR4UnR0S2RiWFNHOEdlTHNDQTlRQjl2QjNBaGxwUUNiWklj?=
 =?utf-8?B?YVdCVFQ3WGNBcXdiUUt1czhDNDBpNUsySE1YdEdoT0J5Unhlenk4THIxbjR1?=
 =?utf-8?B?blM0cjMzWERMQnJoTE41ZGJRc3g2VmVQWlV1TWRpQkZWWFY3T011Z1FMdTJW?=
 =?utf-8?B?QlIxRCtWMXpJeHN0d3VZWkVQYW9JSGNLekJlazdFSUZ1cUhiSGJia1plbXNL?=
 =?utf-8?B?cHRwS09EbnRyV2tsekNOd0VRc09OTGN6b1VOeTN4bWR2aTBoYzBSRy9LVXRG?=
 =?utf-8?B?dng3QWNZZmNuNGJIcDZLMk01aDJkcU9EV1dZKzJkUXA1VUlkQ1hFRHNkUXlW?=
 =?utf-8?B?M0toUE5TengxcThtNllKTXp2K2ZzY3paS212TkJHS2tJN2xFRGl6WXkwY2lt?=
 =?utf-8?B?ekF2cG52MXNJUzJ6TERyOS9sWjVORGdIbHlaL0ZSbERqdFFSeG10K0l2dGFI?=
 =?utf-8?B?SDhmY0JnZ2cyWG1GaGZ3YndwT3B1Y2J3V1IwR3kvM1UvcEN2MmVtSUc5MnNv?=
 =?utf-8?B?SENlTzNrck5UdTcrbUk5M0dqd1B2SDJzaWFkNTRXQVZDZ2dzU1c5T1Arc21F?=
 =?utf-8?Q?WksXbDe1lld3DK0CY7OiVJs0i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdad546f-83b9-442b-74f4-08ddfc2c6677
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 12:09:38.8163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rRA7n3vFItUTxg5yyGsJv+BK+5bl06TAP/PuI1PRw0OH2PYKPOv/cyP5PpGqmMm4R7aaHwqefGzessJJDxN+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
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


On 25-09-2025 02:14, Kees Bakker wrote:
> Op 05-09-2025 om 17:49 schreef Badal Nilawar:
>> Extract and print version info of the late binding binary.
>>
>> v2: Some refinements (Daniele)
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 124 +++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   3 +
>>   drivers/gpu/drm/xe/xe_uc_fw_abi.h          |  66 +++++++++++
>>   3 files changed, 193 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 0f062008ca83..38f3feb2aecd 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -45,6 +45,121 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>>       return container_of(late_bind, struct xe_device, late_bind);
>>   }
>>   +static struct xe_device *
>> +late_bind_fw_to_xe(struct xe_late_bind_fw *lb_fw)
>> +{
>> +    return container_of(lb_fw, struct xe_device, 
>> late_bind.late_bind_fw[lb_fw->id]);
>> +}
>> +
>> +/* Refer to the "Late Bind based Firmware Layout" documentation 
>> entry for details */
>> +static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
>> +                const void *data, size_t size, const char 
>> *manifest_entry)
>> +{
>> +    struct xe_device *xe = late_bind_fw_to_xe(lb_fw);
>> +    const struct gsc_cpd_header_v2 *header = data;
>> +    const struct gsc_manifest_header *manifest;
>> +    const struct gsc_cpd_entry *entry;
>> +    size_t min_size = sizeof(*header);
>> +    u32 offset;
>> +    int i;
>> +
>> +    /* manifest_entry is mandatory */
>> +    xe_assert(xe, manifest_entry);
>> +
>> +    if (size < min_size || header->header_marker != 
>> GSC_CPD_HEADER_MARKER)
>> +        return -ENOENT;
>> +
>> +    if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
>> +        drm_err(&xe->drm, "%s late binding fw: Invalid CPD header 
>> length %u!\n",
>> +            fw_id_to_name[lb_fw->id], header->header_length);
>> +        return -EINVAL;
>> +    }
>> +
>> +    min_size = header->header_length + sizeof(struct gsc_cpd_entry) 
>> * header->num_of_entries;
>> +    if (size < min_size) {
>> +        drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
>> +            fw_id_to_name[lb_fw->id], size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    /* Look for the manifest first */
>> +    entry = (void *)header + header->header_length;
>> +    for (i = 0; i < header->num_of_entries; i++, entry++)
>> +        if (strcmp(entry->name, manifest_entry) == 0)
>> +            offset = entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
>> +
>> +    if (!offset) {
> This for loop looks suspicious. Do you continue the loop on purpose
> after finding the first match? Or should there be a break?
> Also, if there is no match then offset is uninitialized. Isn't it better
> to initialize offset at the start?

Thanks for highlighting. This has been addressed in this patch 
https://lore.kernel.org/intel-xe/20250924102208.9216-1-colin.i.king@gmail.com/.

Regards,
Badal

