Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7750FA5EB8B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 07:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3804B10E34A;
	Thu, 13 Mar 2025 06:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDZ1gOpv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57D910E348;
 Thu, 13 Mar 2025 06:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741846225; x=1773382225;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mCdrCBPSNZ5wT7l7Uu2jhQIaGry/NsLMwvnwynWuqrw=;
 b=ZDZ1gOpvvrgoH/TsBK0nCW/domvH173B8n8dpwDifOnQ40hlQWyqj/EQ
 vjNgTCdxR3sOWcO1teufXK8k2GoYprrtcg60zj9q5oWNL4uJZNHTw3U1F
 1eq05xQbwJlGqU1vsErQKUPRqCR4HgXDiyatuLY0QY8KN00/LUhRiJZWT
 DC9DSpIRdpo3tdHKU+Fon/c2IqOr12VEjxyvF9cCvOdr3kcPjDAgbqpu4
 eyClwZJRyQXYzk0Ad2UL5+sRq35HKUpHnbzq7XzW1S9oKAC/D1aKYBxkG
 CD+Wtg7rU+BRg3tml1zQw6mEMBVgFXB7zMMX0jNv/tyNFdQjxlHUhJhGf w==;
X-CSE-ConnectionGUID: xZH7jsjpQi6lejQ/yCpdeA==
X-CSE-MsgGUID: GZWT1VA0TC+JT2dV+BLcPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68302525"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="68302525"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:10:24 -0700
X-CSE-ConnectionGUID: iNkoQa19SuKaO1XeIIUu5A==
X-CSE-MsgGUID: +TFzruq3TxaodmUSE7zHhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="120823645"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:10:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 23:10:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 23:10:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 23:10:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAZnih45iefJhLfO6sjCEX5zHU6nx2fHFT88+cGqij2LSSQTBpaSA9mYqZudIh+5QoTUFSmqr7U1sBJjcZN6es16YfL9HJxUc37axnIVZhydD16/Dgpo7KvojjhlaKhJl8EemtaY2Hd78Rvwh9Up0YKx3frhgYhGmK+kl7ERTRaaPkpVMrhld/jxiF0AKj5nbNke/1dUGA+ei/QInvp386WIqzbacYyrZth2+fWVVjySdx2qXhx96ohA4K91ABxqP4jrG1eAzozuxtnRHiFmN/ucTP6Q2gysbnTUmTsOFr/+b/OBgEILK/ttK11+FjchoUXoSuJvVqFlcu1wfxWHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCdrCBPSNZ5wT7l7Uu2jhQIaGry/NsLMwvnwynWuqrw=;
 b=xJL6WYXWsfIOZ/bpx0HiFDQxCxEJHbWabqFre50iPFhocNLV8RVAMMeT25nfjYQU/kPsowSAtVrknuw0CgZLh5oKO5UvSAImg2UeqVdo7y2WNxVq50i6P38Dzm9CklGvGi3U90NWWnqs9q83vwnLfMvXF5L8ouKTkaJ6K/wP5AXwRZZ8/J/1KMFZwkuVTHrO4ckLsZYSRb97kQy9VnfLhChMT/iRZZSc/GfJWxvpkuQkahDRujiXI6nhdilQaB0XOG/KGLlPerG9oj481clOo855IPfZTNAg7lrE0s+MAZkGfZcfXBv4jhGTs94ufPTVH74vMTNQkZdZHOgqmXpmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA3PR11MB8002.namprd11.prod.outlook.com (2603:10b6:806:2f6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 06:10:21 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 06:10:21 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Topic: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Index: AQHbcZ6G7w9j1lfJu02jbAwOIME0fLNGcuqAgCpfsWA=
Date: Thu, 13 Mar 2025 06:10:20 +0000
Message-ID: <IA0PR11MB73073AE181E75A366C75C5CFBAD32@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>
 <SN7PR11MB6750AEE4BC0324DC53217762E3FE2@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB6750AEE4BC0324DC53217762E3FE2@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SA3PR11MB8002:EE_
x-ms-office365-filtering-correlation-id: 6988ba45-5ef5-4656-290e-08dd61f5bc47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eHhxWUhKdE5BWENnZnVNdVhXWWw3Wmc1MFRzQkorS1JnQm0wZk1QT2VYNFpy?=
 =?utf-8?B?WnNOY0Q0TUhhQmhtTjNTdS96WDE0V1RGTnE1VVlyVWt2UWh0aVB3V0Mvd0dX?=
 =?utf-8?B?YllMSktvTnU5Ly9WbTBVZVdRTWxvbU52UE5XQ0Q1bFVHdXd1ajcyUFZDM2t2?=
 =?utf-8?B?UmNTNEJDZFRqUVdCalBtVU05Q1cxVkpPajNHQktkUXFla3NtM2dhZndsaUl6?=
 =?utf-8?B?NURoZDdmM3lzbXZuYVJ4MVBMOW4rNEg1dnQ2aHE3Q3hmSGJocjdDc3ROS1lP?=
 =?utf-8?B?YThPTk5BclhXSld5dk9mbUJCNUJUWlRBSzQ4b2V1Rjhyckh6bjJHZ290dW1y?=
 =?utf-8?B?dUFKanZtUVV3MXJrd2hGczFJeGpEZkFWNzIwbjBNd3BxZmlrNWF6YkpPVGRV?=
 =?utf-8?B?djNicDRaSWlNMmx6Z1FrU0x5UWUrOWpjNDJ3QnQySEZMMFZ4TFA3WjlaWHFK?=
 =?utf-8?B?OHV6VHVvU3JMVG5UYXRFV3dYNXB1Y0wyd0RjcWttelpEd2hCanhjNnFqbjM0?=
 =?utf-8?B?cVpkaEFva3Uwd20wbkpkUVp3LzhaSndTR0VrMzd1TVRPNG5kMFBPRVJTMmg5?=
 =?utf-8?B?OWJkZGs4bWw3dTlMQTBodDk2K0F1OW5RZE1DRGYzaFRROTZKYXdyQXFDYytP?=
 =?utf-8?B?MGZrVEtjcndIcGZubjNYZVkxNDNJSHJBLzl3eUxBbWI0LzJlS2xFck93Y2Jk?=
 =?utf-8?B?KzBCV0hvaVI3TVV1YXJnb3M5MFFreUlqb0k1b0dlU05xT2grWlpKS0dSRTlO?=
 =?utf-8?B?TVFNOTF2U2ZEQkEreHFqSDZHMkwxUDdjeWxuZUR2U2hwdzh0V2YrL3ptUTlQ?=
 =?utf-8?B?TnBjWnoxQUFrM1NDU3I1OVNjRFFYRUxrVjFZeDFqTUFVbHNCYzZKVlJZTUgr?=
 =?utf-8?B?Q0hhc2k2NHhIS3lPU3lMaDJveWxzVVZhbXR5cUJiSzF2QmtmVldkWTE2WGdk?=
 =?utf-8?B?cmhtZ1hwY1hEZUxSQ2ZXQlk5TzFYVDYzU2FnSHR5NWJjeW50dGtOcHdWbzd0?=
 =?utf-8?B?V1A4M2xXYk5xODdlRDJCRnhJeFhJVGZMbytRYWx3ald3aWh2NUlGQy9aSlM3?=
 =?utf-8?B?VVJJOFZTcGw1WENBc2srWHFNeDRDZWhCMFFoeDJ6YzRremJ0bkZTL1lHdkhw?=
 =?utf-8?B?eUpuV3piMWVXRTVMdzVSc0NsTmIwS1ZyQUtmQlh3dmx1czU0S2QvQUx5eVZz?=
 =?utf-8?B?ZldIU29tUXZSM0s1UC9oQlBWOE1nV0JCT1Y1YVkvL1dKaVFZU3hJaWVWeDVX?=
 =?utf-8?B?cHRuNUVWN2NkcVh2cDNOQmZSdjA5VVpEMGlYaFZwVG9IbUdNSlNOQlRRQUp4?=
 =?utf-8?B?ekduemtwUkYwSXZIVGphaUt5QXFUR1g4bXRwcDB2Y1Jvd0RGQlFPc3ZMdDBY?=
 =?utf-8?B?aldkeHFEMFpaOWhKb1JLb2o0M1g3LzRocTZFY3NjWXRFWmw4eHVWVzdzQWlQ?=
 =?utf-8?B?UVp4amtmRWh4RU02TGJlY3hBTzFvbUVFMzBGVk56RkQ5TmpnYzVWcUhueUl3?=
 =?utf-8?B?RDFsakt4MlFWTElXcEhiUTY3WEx2cXVmbDh4ZElvRjd5M0YyK2hhczQrSzRZ?=
 =?utf-8?B?T29CUll0YmxKZEEyY0YwMXpZUGc4aGFrQ04yVHIxV1JQMkZnQWZHbkxMZWhq?=
 =?utf-8?B?dVNqVUhpZy9TTTdIVlhPd0J2dDg0Z1VMVDFoZ0lXZEkvdGVoMWxKcnBDNlJt?=
 =?utf-8?B?aU4zK2dwZEx3N2xsNVRBRVpybE5ieHhSZ0pXb3pnKzcvcCtXVmNGNjZlZktS?=
 =?utf-8?B?M3dUZXJNdUFFMCtacWdZamRQWWd2VEF3b2YyL0xEZHoydktFNjdLeVJCWC9I?=
 =?utf-8?B?OFZ1RGRTRUhaTS9vN3BzYnlRRUxqSm1kbzU5UWpYcVhhdHl2S1ExN0xzSytD?=
 =?utf-8?B?TVY5dXhMR01Qb2toRkNtOTR5Z3FOM2NPV0MyeUlQYUpjOS8vR012Z0c4VHVV?=
 =?utf-8?Q?vWo6x/UDnXcx5t8EZMuLlKbQ/8p/eT+k?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjJsM1ByckFTTCtLcjdySW9NcmJLdDVlWTNZM2lQSnJyb1F3M0xvRXVISjRC?=
 =?utf-8?B?OE8xbEJtVU50Y0x4TVJVdUVDMEs5T3JLd21VMy9sMHZKZmh5Z2cyZHFGNXlJ?=
 =?utf-8?B?c0h6bm5jNis3eld0RXlMVE9tSUxaRzRLWnVMNUMwMzlFRnNJdDB0V0ZpRWc4?=
 =?utf-8?B?a2FhNXZIdWJZemZZTGpXMjFucThTUlRTbmQzN0VXaFdxZjNNNEdVazMwenlZ?=
 =?utf-8?B?Q2hUYllMU0RxUzBHSXZqeHdMV3YvbXJjU2pTMXpzSzZic3hwbFl2UnFUdk1p?=
 =?utf-8?B?VFIvbFdLT3hrWnJwRXlVS3NSRkhlYkNrY1hnelRGc3JPOW5vN2VIK0xlRWFj?=
 =?utf-8?B?eXoybTJLV0pKZVJ3OUhYY09yQWdFQmkzdVVMVjNUMkVrU0FtRWhGVWk5bDRB?=
 =?utf-8?B?VUlVdW1HUzV2M251MG5tZWlKRTJ1K0NJb3pqTWcvM2RrajJnZGpJRmdDUjRa?=
 =?utf-8?B?YlRPLzZjRHM2ZGE0M1RhMFJzR3plRitqTHBsNGtWcFlIMFREYjVCT2pMMFRr?=
 =?utf-8?B?VVlBVEdQckZlSWhDL3hjaG53Z3UvSTJCRE5HUTRFZ2VheExWczVqYmMxSjNr?=
 =?utf-8?B?VHdYY0dMU2JQNmdFS2hRbGxqVk1hcGxXa1R1NGgvR3BJVW4ySHcxcXV3VkJP?=
 =?utf-8?B?RVgvbVIzcHhhMWZSOEFOVWp1d092SXVQcHBaMC9COEhDa2IvK2NxK3hWWUE5?=
 =?utf-8?B?SXQ2dXIrWG51THZqWWk0RVV6aXRHckV0bEpsaEh3Z2VyREFReEJZdlNKWVpC?=
 =?utf-8?B?MThtM1daWkZQdGxraGNCSWdBWkpXU0lHSGE2K0RXc0Z0QWw3Z3R5K1grWnIy?=
 =?utf-8?B?eXFJTWUxbzNxa1V1eGR0c2VoRGtybG5seTJRWFM5T3pDUWI1ZFNydlpnQkhQ?=
 =?utf-8?B?ZFJqTGNXSFFJWUFram0yOHdhN2tUUktKS1BHSmpSeDUySit5Um9BQXRxRC9t?=
 =?utf-8?B?UFhETlVkRmVXVlJRSjJWS3pWdzhBRGhNek1MTkZ4azJpc0lMV3c4T2Y0M1d3?=
 =?utf-8?B?emt3ZkViRkZoajlyK1lGK2JEVDk3SFdYRk5VSmwraEF0a0pXT3RQVHhBdGNL?=
 =?utf-8?B?WUVnV0Y0dkswQnJ2bGZyU0FBRmIzb3d3aWEwYlJLVWZXbWpGZkJXWFZ0eTd6?=
 =?utf-8?B?eWRnTjdaN0p0WmZzVGQzV1Y0cWE4VzdnYm91bzkwNVQrZUEvaC9JMTlhcEgx?=
 =?utf-8?B?MGo5L2s5a2hybFhTSGFWdGliZDVLbFliOGF6TUcvR2FaMmFOUWlFWFl4SDQ2?=
 =?utf-8?B?V2xOTHdwUyt6d2FOU1JsQ1ZBUGltWHRPS0d1WktRRUgrUzE0YXM3NzR3b0x6?=
 =?utf-8?B?eGwwN2lhM3VHd0VobEZwMVdCTnpZT29DUVNYdTNDTnc4SFB0bFY1YjJibDg4?=
 =?utf-8?B?ZzNwN2s4R2xET0dMTjY2ck95Ny9kVWlkVHQvbDNmQzNxRzc1OUNoWFpwbmEw?=
 =?utf-8?B?TFdYT2loVHBiMVR3S3BEMFBCdk9NRXVQWTdhZUZXMjhvL2dKZ3M0Zm1lTnNE?=
 =?utf-8?B?aE1UNlk0dTZseWdrTnBvV3hPejVaYlpVOFVHemlQYlJLWHcxQjl2ZnVaUFJ6?=
 =?utf-8?B?ZFB4SUNYRytHYUtLWUNJd3l4cW03cnA2TFhCZHFRZkRKTDFDN1JpanBWL29O?=
 =?utf-8?B?NlBwenlwMC93eWJpR0k3NVZlWnhGLy9YWXhuWkE0ZXI4L0VkTmorcEhHZ1hu?=
 =?utf-8?B?MmY0ektHdkoxUG92Qlgvak1lUXdiMWZGSW9SMFNUR3AvaUZ3Rld1QmVqTS9W?=
 =?utf-8?B?VTlJekNsb3RSM1czazdaK3U5bVh0cE5tSVRQSUg4U2h4TW9GMk5ReFNSWlFi?=
 =?utf-8?B?TXAydG81WHV6dlRoUVpBaXN4UGhYdjZsV0k1MEZTMldWMUE2VHBwSDVka1JK?=
 =?utf-8?B?WEg0aHpYallob1VoTXNLVlJ0ZStVQkJ5WXFSazlpUlpGOVZ5ei9yYWVuU1JP?=
 =?utf-8?B?SlVGYUZ0RFNWcmJNL094aW9mR0Y4RTRBbThSQllFSzZLdnlDRytscFhrcHZS?=
 =?utf-8?B?SUhqcWlNeDRsbkM4N09IbndQclR5RlM4cm5iOFFTL09VN3BMWTlUbVVpZWNq?=
 =?utf-8?B?MUNNb2pSbkY1OGQ0dVdoWHBxR1dIY2ZwczYrMXF0WkZFWjNhSDRsOW5PNjZB?=
 =?utf-8?B?UTlTbi9XeEd5NHdFaU9jMzcwdVM0QzZNanNLcm9FL1JmRFp3RUpxcUF4OW5x?=
 =?utf-8?Q?Fc+bl9lAKedwqtt15FfoX6XWLp3ybkJv1y0hu07q59rR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6988ba45-5ef5-4656-290e-08dd61f5bc47
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 06:10:21.0005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XYE33bQH1CjPw1xZoSXtOXld8fUEmGqqHGJxjVPbv/MDcyvot3K/qxPVfz01a7BZ4tGQFNlf+CqpfW8DNKMiKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8002
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

PiA+IERpc3BsYXkgSGlzdG9ncmFtIGlzIGFuIGFycmF5IG9mIGJpbnMgYW5kIGNhbiBiZSBnZW5l
cmF0ZWQgaW4gbWFueQ0KPiA+IHdheXMgcmVmZXJyZWQgdG8gYXMgbW9kZXMuDQo+ID4gRXg6IEhT
ViBtYXgoUkdCKSwgV2lnaHRlZCBSR0IgZXRjLg0KPiA+DQo+ID4gVW5kZXJzdGFuZGluZyB0aGUg
aGlzdG9ncmFtIGRhdGEgZm9ybWF0KEV4OiBIU1YgbWF4KFJHQikpIEhpc3RvZ3JhbSBpcw0KPiA+
IGp1c3QgdGhlIHBpeGVsIGNvdW50Lg0KPiA+IEZvciBhIG1heGltdW0gcmVzb2x1dGlvbiBvZiAx
MGsgKDEwMjQwIHggNDMyMCA9IDQ0MjM2ODAwKQ0KPiA+IDI1IGJpdHMgc2hvdWxkIGJlIHN1ZmZp
Y2llbnQgdG8gcmVwcmVzZW50IHRoaXMgYWxvbmcgd2l0aCBhIGJ1ZmZlciBvZg0KPiA+IDcgYml0
cyhmdXR1cmUNCj4gPiB1c2UpIHUzMiBpcyBiZWluZyBjb25zaWRlcmVkLg0KPiA+IG1heChSR0Ip
IGNhbiBiZSAyNTUgaS5lIDB4RkYgOCBiaXQsIGNvbnNpZGVyaW5nIHRoZSBtb3N0IHNpZ25pZmlj
YW50IDUNCj4gPiBiaXRzLCBoZW5jZSAzMiBiaW5zLg0KPiA+IEJlbG93IG1lbnRpb25lZCBhbGdv
cml0aG0gaWxsdXN0cmF0ZXMgdGhlIGhpc3RvZ3JhbSBnZW5lcmF0aW9uIGluIGhhcmR3YXJlLg0K
PiA+DQo+ID4gaGlzdFszMl0gPSB7MH07DQo+ID4gZm9yIChpID0gMDsgaSA8IHJlc29sdXRpb247
IGkrKykgew0KPiA+IAliaW4gPSBtYXgoUkdCW2ldKTsNCj4gPiAJYmluID0gYmluID4+IDM7CS8q
IGNvbnNpZGVyIHRoZSBtb3N0IHNpZ25pZmljYW50IGJpdHMgKi8NCj4gPiAJaGlzdFtiaW5dKys7
DQo+ID4gfQ0KPiA+IElmIHRoZSBlbnRpcmUgaW1hZ2UgaXMgUmVkIGNvbG9yIHRoZW4gbWF4KDI1
NSwwLDApIGlzIDI1NSBzbyB0aGUgcGl4ZWwNCj4gPiBjb3VudCBvZiBlYWNoIHBpeGVscyB3aWxs
IGJlIHBsYWNlZCBpbiB0aGUgbGFzdCBiaW4uIEhlbmNlIGV4Y2VwdA0KPiA+IGhpc3RbMzFdIGFs
bCBvdGhlciBiaW5zIHdpbGwgaGF2ZSBhIHZhbHVlIHplcm8uDQo+ID4gR2VuZXJhdGVkIGhpc3Rv
Z3JhbSBpbiB0aGlzIGNhc2Ugd291bGQgYmUgaGlzdFszMl0gPQ0KPiA+IHswLDAsLi4uLjQ0MjM2
ODAwfQ0KPiA+DQo+ID4gRGVzY3JpcHRpb24gb2YgdGhlIHN0cnVjdHVyZXMsIHByb3BlcnRpZXMg
ZGVmaW5lZCBhcmUgZG9jdW1lbnRlZCBpbg0KPiA+IHRoZSBoZWFkZXIgZmlsZSBpbmNsdWRlL3Vh
cGkvZHJtL2RybV9tb2RlLmgNCj4gPg0KPiA+IHY4OiBBZGRlZCBkb2MgZm9yIEhEUiBwbGFuZXMs
IHJlbW92ZWQgcmVzZXJ2ZWQgdmFyaWFibGVzIChEbWl0cnkpDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4g
PiAgaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIHwgNjUNCj4gPiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDY1IGlu
c2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9t
b2RlLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgNCj4gPiBpbmRleA0KPiA+DQo+IGMw
ODI4MTBjMDhhOGIyMzRlZjI2NzJlY2Y1NGZjOGMwNWRkYzJiZDMuLmI4YjdiMTg4NDNhZTcyMjQy
NjNhOWM2MQ0KPiBiDQo+ID4gMjBhYzZjYmY1ZGY2OWU5IDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX21vZGUuaA0KPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21v
ZGUuaA0KPiA+IEBAIC0xMzU1LDYgKzEzNTUsNzEgQEAgc3RydWN0IGRybV9tb2RlX2Nsb3NlZmIg
ew0KPiA+ICAJX191MzIgcGFkOw0KPiA+ICB9Ow0KPiA+DQo+ID4gKy8qKg0KPiA+ICsgKiBlbnVt
IGRybV9tb2RlX2hpc3RvZ3JhbQ0KPiA+ICsgKg0KPiA+ICsgKiBARFJNX01PREVfSElTVE9HUkFN
X0hTVl9NQVhfUkdCOg0KPiA+ICsgKiBNYXhpbXVtIHJlc29sdXRpb24gYXQgcHJlc2VudCAxMGss
IDEwMjQweDQzMjAgPSA0NDIzNjgwMA0KPiA+ICsgKiBjYW4gYmUgZGVub3RlZCBpbiAyNWJpdHMu
IFdpdGggYW4gYWRkaXRpb25hbCA3IGJpdHMgaW4gYnVmZmVyIGVhY2gNCj4gPiArYmluDQo+ID4g
KyAqIGNhbiBiZSBhIHUzMiB2YWx1ZS4NCj4gPiArICogRm9yIFNETCwgTWF4aW11bSB2YWx1ZSBv
ZiBtYXgoUkdCKSBpcyAyNTUsIHNvIG1heCAyNTUgYmlucy4NCj4gDQo+IFR5cGU6IFNEUg0KPiAN
Cj4gPiArICogSWYgdGhlIG1vc3Qgc2lnbmlmaWNhbnQgNSBiaXRzIGFyZSBjb25zaWRlcmVkLCB0
aGVuIGJpbnMgPSAyXjUNCj4gPiArICogd2lsbCBiZSAzMiBiaW5zLg0KPiA+ICsgKiBGb3IgSERS
LCBtYXhpbXVtIHZhbHVlIG9mIG1heChSR0IpIGlzIDY1NTM1LCBzbyBtYXggNjU1MzUgYmlucy4N
Cj4gPiArICogRm9yIGlsbHVzdHJhdGlvbiBjb25zaWRlciBhIGZ1bGwgUkVEIGltYWdlIG9mIDEw
ayByZXNvbHV0aW9uDQo+ID4gK2NvbnNpZGVyaW5nIGFsbA0KPiA+ICsgKiA4IGJpdHMgaGlzdG9n
cmFtIHdvdWxkIGxvb2sgbGlrZSBoaXN0WzI1NV0gPSB7MCwwLC4uLi40NDIzNjgwMH0NCj4gPiAr
d2l0aCBTRFINCj4gPiArICogcGxhbmUgc2ltaWxhcmx5IHdpdGggSERSIHRoZSBzYW1lIHdvdWxk
IGxvb2sgbGlrZSBoaXN0WzY1NTM1XSA9DQo+ID4gKyAqIHswLDAsMCwuLi4uNDQyMzY4MDB9DQo+
ID4gKyAqLw0KPiA+ICtlbnVtIGRybV9tb2RlX2hpc3RvZ3JhbSB7DQo+ID4gKwlEUk1fTU9ERV9I
SVNUT0dSQU1fSFNWX01BWF9SR0IgPSAweDAxLCB9Ow0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAq
IHN0cnVjdCBkcm1faGlzdG9ncmFtX2NhcHMNCj4gPiArICoNCj4gPiArICogQGhpc3RvZ3JhbV9t
b2RlOiBoaXN0b2dyYW0gZ2VuZXJhdGlvbiBtb2RlcywgZGVmaW5lZCBpbiB0aGUNCj4gPiArICoJ
CSAgICBlbnVtIGRybV9tb2RlX2hpc3RvZ3JhbQ0KPiA+ICsgKiBAYmluc19jb3VudDogbnVtYmVy
IG9mIGJpbnMgZm9yIGEgY2hvc2VuIGhpc3RvZ3JhbSBtb2RlLiBGb3INCj4gaWxsdXN0cmF0aW9u
DQo+ID4gKyAqCQlyZWZlciB0aGUgYWJvdmUgZGVmaW5lZCBoaXN0b2dyYW0gbW9kZS4NCj4gPiAr
ICovDQo+ID4gK3N0cnVjdCBkcm1faGlzdG9ncmFtX2NhcHMgew0KPiA+ICsJX191MzIgaGlzdG9n
cmFtX21vZGU7DQo+IA0KPiBEbyB3ZSByZWFsbHkgbmVlZCBfX3UzMiBmb3IgaGlzdG9ncmFtIG1v
ZGUgZG9uJ3QgeW91IHRoaW5rIGEgX191MTYgc2hvdWxkDQo+IHN1ZmZpY2U/DQo+IA0KRm9yIGZ1
dHVyZSBjb21wYXRpYmlsaXR5IHdlIGhhdmUgaXQgYXMgX191MzIgYnV0IHllcyBfX3UxNiBzaG91
bGQgYmUgZmluZS4NCkkgYW0gZmluZSBjaGFuZ2luZyB0byBfX3UxNiBpZiBubyBvdGhlciBjb21t
ZW50cyBvbiB0aGlzLg0KDQo+IA0KPiA+ICsJX191MzIgYmluc19jb3VudDsNCj4gDQo+IE5pdDog
YmluX2NvdW50IHNvdW5kcyBiZXR0ZXIuDQo+IA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArLyoqDQo+
ID4gKyAqIHN0cnVjdCBkcm1faGlzdG9ncmFtX2NvbmZpZw0KPiA+ICsgKg0KPiA+ICsgKiBAaGlz
dF9tb2RlX2RhdGE6IGFkZHJlc3MgdG8gdGhlIGhpc3RvZ3JhbSBtb2RlIHNwZWNpZmljIGRhdGEg
aWYNCj4gPiArYW55DQo+ID4gKyAqIEBucl9oaXN0X21vZGVfZGF0YTogbnVtYmVyIG9mIGVsZW1l
bnRzIHBvaW50ZWQgYnkgdGhlIGFkZHJlc3MgaW4NCj4gPiArICoJCSAgICAgICBoaXN0X21vZGVf
ZGF0YQ0KPiA+ICsgKiBAaGlzdF9tb2RlOiBoaXN0b2dyYW0gbW9kZShIU1YgbWF4KFJHQiksIFJH
QiwgTFVNQSBldGMpDQo+ID4gKyAqIEBlbmFibGU6IGZsYWcgdG8gZW5hYmxlL2Rpc2FibGUgaGlz
dG9ncmFtICAqLyBzdHJ1Y3QNCj4gPiArZHJtX2hpc3RvZ3JhbV9jb25maWcgew0KPiA+ICsJX191
NjQgaGlzdF9tb2RlX2RhdGE7DQo+ID4gKwlfX3UzMiBucl9oaXN0X21vZGVfZGF0YTsNCj4gPiAr
CWVudW0gZHJtX21vZGVfaGlzdG9ncmFtIGhpc3RfbW9kZTsNCj4gPiArCWJvb2wgZW5hYmxlOw0K
PiA+ICt9Ow0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHN0cnVjdCBkcm1faGlzdG9ncmFtDQo+
ID4gKyAqDQo+ID4gKyAqIEBjb25maWc6IGhpc3RvZ3JhbSBjb25maWd1cmF0aW9uIGRhdGEgcG9p
bnRlZCBieSBzdHJ1Y3QNCj4gPiArZHJtX2hpc3RvZ3JhbV9jb25maWcNCj4gPiArICogQGRhdGFf
cHRyOiBwb2ludGVyIHRvIHRoZSBhcnJheSBvZiBoaXN0b2dyYW0uDQo+ID4gKyAqCSAgICAgIEhp
c3RvZ3JhbSBpcyBhbiBhcnJheSBvZiBiaW5zLiBEYXRhIGZvcm1hdCBmb3IgZWFjaCBiaW4gZGVw
ZW5kcw0KPiA+ICsgKgkgICAgICBvbiB0aGUgaGlzdG9ncmFtIG1vZGUuIFJlZmVyIHRvIHRoZSBh
Ym92ZSBoaXN0b2dyYW0gbW9kZXMgZm9yDQo+IA0KPiBJIHRoaW5rIHlvdSBjYW4gd3JpdGUgdGhl
IGRybV9oaXN0b2dyYW1fbW9kZV9jYXBzIGluc3RlYWQgb2Ygd3JpdGluZw0KPiBoaXN0b2dyYW0g
bW9kZSBTbyBwZW9wbGUgY2FuIGRpcmVjdGx5IGp1bXAgdG8gaXQNCj4gDQpNb2RlX2NhcHMgd2ls
bCBnaXZlIGFsbCB0aGUgbW9kZXMgc3VwcG9ydGVkIGJ5IHRoZSBoYXJkd2FyZSBhbmQgdGhpcyBt
b2RlX2NvbmZpZyB3aWxsIGNob29zZSBvbmUgYW1vbmcgdGhlIHN1cHBvcnRlZCBtb2RlcyBoZW5j
ZSB0aGUgbmFtZS4NCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCg==
