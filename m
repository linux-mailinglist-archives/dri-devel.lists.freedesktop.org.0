Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 099D763FAF8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 23:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E7510E199;
	Thu,  1 Dec 2022 22:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AFC10E199;
 Thu,  1 Dec 2022 22:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669935173; x=1701471173;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7nl1W1KlKS5YHGZgsPjRIFv1wkmyvqTlo+b+rlgBY8M=;
 b=F+2iyICU+QM06gTsMdXVIC214CAenT1LfOw26b6VzJYWd8AFTZ5MFl35
 H2ghR6xGTAAfzQd/6bLZiAOHUgZHS5HlRmjjvDcAFVkaeNdy2tufVprT+
 5ZjSzkc2GWN7mER+GUzuS3gauxDlyLT7co99rmAqZmUPgCCsIlXDxcMSd
 yYcLOrzvKa6ZfuHpAFtW2IXxoBY0jb3g8e289MYjnEaFtJradHnJsb7jN
 HThqhH8BI/RfLMtt8RlZg3GfN27e50QRVqpmQiG9LMXhdS0Zc8UYPfNtg
 +1YL4kJ2HJx+ZReu2Rc/TMjEzLgNq2gnEO63PLeqqRbBkqnK8TOEaUrCF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="299185060"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="299185060"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 14:52:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="733590501"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="733590501"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Dec 2022 14:52:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 14:52:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 1 Dec 2022 14:52:51 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 1 Dec 2022 14:52:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meOGnhM7Xyf8nyW9PcJ/f3IS5aM1gtcGthrd+zD0o+F9ml9t72ihtWSP7vqRVKGrZwGFYT/+xzE3N/N0cKlZ5nbHO4uEUPEF3xlV8VZ3tir1w7/VdECxvp/gJhuWy8rrvxMVQYYft/EE3fQr/axO93/meYpkfQVleLbYAErPCkr7RyWe3KGDE/jEtOz00/B7kPdQGIDTzAcJxJLgzkjBCPuTg8b7BFg6LfySXY78RWbTlzEAzzSKL1belPxRKt6nhit/LTishAqscONhHcZ4+bzWmcCkkMcHjM95exeGqYa3mHcmQeUmz0e+g0TxtPgD3nQQz7vLi9J4HlxOTxamHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhK5HxP4nBDE+gErgmaTz4TJ2jgOLxZbrvC29Jw9hnI=;
 b=SR6NmmMjeiYKHT1hGnM7v/MUSAVa8QSNDBLqxE7Pz+CrcEEXPygHSluSDIoBIJZXIIqzZNlPwymmo4RdkTDFLcXStllhvo732zqnU2rEfxljg43MtFkDKva2t0PMIIXLVVXEOoVkLgaWhwhjyFbN/70DKM7Gyc0dUpvKJ5W6j9Hdia2CefIZ4HJbqNrDqt/+c+mTp02YdrL89D+bXdM6tZyA4889czrAEUJq97EK3wwo7oq+5z0fJvflUnzY1pSewSCH9RuQOYiaIL7Xu8npnMKF72l/TG+1sZvPNLOHZ+bTxRiellq4Ra1+Aq99TVmSd+h48AoIQxrcdgCF436hmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CH0PR11MB5460.namprd11.prod.outlook.com (2603:10b6:610:d3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Thu, 1 Dec 2022 22:52:49 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%6]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 22:52:49 +0000
Message-ID: <7fca4b0b-f54c-a46c-4923-0f66d141a8ea@intel.com>
Date: Thu, 1 Dec 2022 14:52:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 4/6] drm/i915/gsc: Do a driver-FLR on unload if GSC was
 loaded
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-5-daniele.ceraolospurio@intel.com>
 <87488908f20f6deb85b2385d65a2cdd98560ae32.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <87488908f20f6deb85b2385d65a2cdd98560ae32.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::41) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CH0PR11MB5460:EE_
X-MS-Office365-Filtering-Correlation-Id: 60711f54-0721-4411-6b75-08dad3eec545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: utL6i23zUhCsB9d4YFeL0k15nWn4mN1fNSlnnLfkxa91FAxf95LLJGVCwGjgtuo/g3AUIGndNPOjMqJz0X+Qb6kBuwTmieehlxHlWfoGl9FYGe20AnTtJxPH0GehbO+Kd+2xdMQCBa5Q2d489i7CbltIRPhOks0k9k6APZGJp5ig4YBBkxN48bonC0oXRzsV9HpBU1EouAAOXN4pwlOPqaXLhlA2Y8tJ6MUc7Zch4p2K9kMmMnTqzGLWNpC2H6IoqUd0j9QUGbumk+ICPYZ4TpaQzWYPm7LvYPiONiO90zhjj6tCD3SDnpeJKNOvrE/OO/2nCgDNr0J9a5tCXOjOKXDQ/xQdt0RI+LnWy1akmnoe13X3dfjkoK5mmv3v2uzcmNDTnJDRQBCUksHL5D5T0fkfeuuRKi0zTgk1dEwNlzSch7CBYud3+EzGM8R9eD2MH0li5nQ4A8CwvZRFL2g8Ipf1pY0UU9uCj1q04TLpuXcsq5EgeH+fsYkt1Dcr93GKyIYw0Jx0cGzXxYo7Q1VYPzeNP1vZTjQJRYS1zSDrvv88nDYx1KLf+mdk0v14i9XPelmWUQJhjSPqoUr5P/9eo/esArRgvK3Wvpk/wQbN9wJN5lpxc1tGa/hVWKMtEvBxNGeMOETDrw2o+IUKjGRObKmHRaoBMYmqi/BfwWjm/8j9JKSN0ClMarYGbir8LmiWDfNBdRXrVkc5mEMbpglzFFdVRI8ww5BVq8Hcjop6OB4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199015)(31686004)(86362001)(478600001)(31696002)(6486002)(2616005)(36756003)(4001150100001)(2906002)(450100002)(186003)(38100700002)(6512007)(82960400001)(53546011)(83380400001)(5660300002)(26005)(316002)(6506007)(66556008)(8936002)(8676002)(110136005)(66946007)(66476007)(4326008)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUVxVWRYMFRSaDRGek1UUDFJS1VwbWlpRmhyYlBxV25LeG1aUkpocjJ2MVhX?=
 =?utf-8?B?dUZMMTk1cWYxbG0wOXpnQk5jbUV2b1EyVjdlVkJDMk9wOUt4VmNNbHNMTExv?=
 =?utf-8?B?T1Rmd1FvdTJlc0U1VnRwRFpXNkdSV2UrdzVFaVZ6ZTY3UXVsbW5YWXByTXpB?=
 =?utf-8?B?Q3dKd0JZSHdrenNZSDlnajBsWHlCZi9WUXZ3a2NRL1R2Q2o0S0pBZ29oWVVW?=
 =?utf-8?B?MmFmd0JNWlh0WGM5ckVmWGx5RThWU254QlFveFYvLzFCTW9teERFMGRUSVp2?=
 =?utf-8?B?S1g1Qk5vOEV2eGdrY3dFRXMrWVFNM0wrbzV0K3pmc1BpZE4vR2xabWNRYzNq?=
 =?utf-8?B?dFY5RFRid0h6RkN2MWF4bWlzbnZhSytDZHBqNjFMWG5kbks5cDUvaTY4dVFs?=
 =?utf-8?B?QWM0UXAvQ3l3UHk2M1JXT3IrenFWajZhWEtPdWlJWkNCbVZ6UHNLam4yZlBp?=
 =?utf-8?B?eXFaYnlDQlU2eGNwUTJEUzZKaTFOS1ZqZU16Q3E4NllPZTVxamVuREJOTTZm?=
 =?utf-8?B?SURhTDBCRHdST3NyY1J0YnpxVVRibTFXLzc4KzVLbUxjeVlFQmpSbTN1Z3Rq?=
 =?utf-8?B?bUNPTENEREZ2TFNYb1Avd0MxSEpCcDVDSHRjZzZlc3pzUlp3L3c0TlgxM2Er?=
 =?utf-8?B?SmNmTDNjUC83T3RZWjZmR2hSZzR6UHVMSjVuRzZxS2xNd3VRUXU5V1dzUGNj?=
 =?utf-8?B?UjNNZTcrNHJpOXVTcHE0WVdTamk3aTJoNHRnNXdadzVaaVpCUWMrZjRZMmho?=
 =?utf-8?B?RXVlaFNtR2ZhOFhkVlBqK2tFc0I3Szg2ZnUrZUtnMXNaUktyVk4xTE4rY2ZC?=
 =?utf-8?B?dnErUlFDUHZPYWJ0SHJUVWJ1TGNkbzNscmswS0l6S2wzVVJ5M0QxSnQ2bkpR?=
 =?utf-8?B?NGZlMW5zUUZjbml5RjFXbDBhcjVDRlBGTU9Da2tRN0dyZXpxS2lRZHNOUWVG?=
 =?utf-8?B?Vkk0S0x4L3FKMHVnMTVyRFM0R1ovMnpkeUtsbGpUZUM1UkNwaUJGSms2ekN5?=
 =?utf-8?B?a1pPZWR3VVlEQzRwWjVFYVRLWmxZY0QzVE0wNmFRMk1BU2oxMnAwL3pzTUFN?=
 =?utf-8?B?Y3crekh1cVAyaDZ2dFovQ2E0cDZSQlpScGwxSExWK3F3ZTdNY2VJWEtjRW0v?=
 =?utf-8?B?YTdpeDVrQVpJbHIyQjRiWVFmKzNQRmhjSFRIdW1RVE9VamVEZit6NVpYMXp6?=
 =?utf-8?B?dUFITnRPWlNsczE1a3RMMkhjWU5HUkp1NEZ3QlQ3VFZvWmtiakJxNDY5Yjly?=
 =?utf-8?B?N1MyR1YzU0lQa2xoa25tMDNHaERxWnZOY2IyM3dHb1NRREF1MmxLQTVYZmNm?=
 =?utf-8?B?YWRlc1lTZGJXM1ZQa2VuVEIwYWFtU1BubnNnVElSUGRUU3Vta3BpZ3JzcWts?=
 =?utf-8?B?aXVzekoraEpoRmgrTGZWWDZWczQ0SEt2aXJ4SERmcmlmdTlkb3dwSU02TE90?=
 =?utf-8?B?bHFHWDVNT2o2UmN2Qmdwc2Fvcy9ZWjA5L0RQd1d3dGNMWUdtVUVsV1lXWE1i?=
 =?utf-8?B?OEdPbkdUeHZaVHJaWDZTSzRuU0lVRlVCQ1JWREpMTytpZVA5ZStMUzZ3Ungx?=
 =?utf-8?B?ZkVyOGtkMys1VW1qVldWRXJESTlNOVpYQTVSZjN4WGx6QkZiR2RwdGl0dE5F?=
 =?utf-8?B?QURuMnkzd012WTJhS29raFVROFJFYjErOVl1R3NiVGdBMmtrVDJpV1Z2YmVP?=
 =?utf-8?B?Y09JMTU1WUtCTnc3T3BFVGVNS0V4VFFXQVBObjQrNDZVSXBiL0YzVldHUVh0?=
 =?utf-8?B?aTkvUmtpMVVqbXBrN3puZy9BVThzb25aS2wvSTNFdWNPdDVLVXNlT1lMVzht?=
 =?utf-8?B?dnBzWHNwUEtKbGV5UkpCSjNWRTM2UE5WU282ZFJXTHoyaTI2eS92WkxyUGY0?=
 =?utf-8?B?Uk9SVzlqTlFvQWpOWURYZGdQdGhsOE0yR1ZFclhRZFE1dHRCM1pzM1FNMHpm?=
 =?utf-8?B?a0w0d094ck5OTUVNSGpNQ3FPR1dXcXY1UnFaalBxU0ZBeGtBbFdSWjZKVHho?=
 =?utf-8?B?djM4VDN3OU50aVRESVhIWE1mVTliaE1RakdvVi9XS1lFSmhtTHBNM3Fwd0kr?=
 =?utf-8?B?YVVnaUhTVjB4c3IwMzFKOEdHUlkzYWpRTnFibGk4WUhOMW15eVovMXJBNk1r?=
 =?utf-8?B?NXFaSGJKT3gxZUtlYjFUaW0wYmxRYlZuNDBLbDEwTHA0Q0dkQVNnSWMrWS9I?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60711f54-0721-4411-6b75-08dad3eec545
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 22:52:49.5277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMPDoQR6UMngPBepom41eumerC0YzrARPs2YSATES2kOc8SrqyWU36LCl00MZDnDKL+Xe3kltccPn8KmJfw5WM6qBUyJ3zFCfBRS06N+hI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5460
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/1/2022 2:40 PM, Teres Alexis, Alan Previn wrote:
> Few nits - most of which are repeats from existing review comments.
> I did have 1 feedback. Functionally, code logic is correct.
>
> To speed things up, I'll provide a conditional R-b if you address the feedback below + fix the the BIT3->to-BIT4 uncore-
> flags fix. Others are nits in my book:
> (conditional) Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
>
> On Mon, 2022-11-21 at 15:16 -0800, Ceraolo Spurio, Daniele wrote:
>> If the GSC was loaded, the only way to stop it during the driver unload
>> flow is to do a driver-FLR.
>> The driver-FLR is not the same as PCI config space FLR in that
>> it doesn't reset the SGUnit and doesn't modify the PCI config
>> space. Thus, it doesn't require a re-enumeration of the PCI BARs.
>> However, the driver-FLR does cause a memory wipe of graphics memory
>> on all discrete GPU platforms or a wipe limited to stolen memory
>> on the integrated GPU platforms.
>
> Alan: [snip]
>
>
>>> +	/*
>> +	 * Once the GSC FW is loaded, the only way to kill it on driver unload
>> +	 * is to do a driver FLR. Given this is a very disruptive action, we
>> +	 * want to do it as the last action before releasing the access to the
>> +	 * MMIO bar, which means we need to do it as part of the primary uncore
>> +	 * cleanup.
>> +	 */
>> +	intel_uncore_set_flr_on_fini(&gt->i915->uncore);
> Alan: Nit: Perhaps define what disruptive (i.e. the whole memory wiping impact) - aligns with what Rodrigo commented i
> think?

I'll add it in the FLR function and refer to that one

>
> Alan: Nit: Might be important for developers debugging issues to state (in comments) that the security FW has been
> provided a dynamically allocated memory which is why it MUST be killed on unload (unlike prior Gen SOCs).
>
> Alan: Feedback: I think intel_uncore_set_flr_on_fini should called before gsc_fw_load() (or after but still called if
> loading failed with and error indicating the instruction was already sent such as the timeout error, before the bail).
> This would be better to ensure a clean slate is set upon unload even if gsc firmware was attempted to get loaded.

Ok, I'll move it to before.

>
> Alan: [snip]
>
>
>> +	/*
>> +	 * Make sure any pending FLR requests have cleared by waiting for the
>> +	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
>> +	 * to make sure it's not still set from a prior attempt (it's a write to
>> +	 * clear bit).
>> +	 * Note that we should never be in a situation where a previous attempt
>> +	 * is still pending (unless the HW is totally dead), but better to be
>> +	 * safe in case something unexpected happens
>> +	 */
>> +	ret = intel_wait_for_register_fw(uncore, GU_CNTL, DRIVERFLR, 0, flr_timeout_ms);
>> +	if (ret) {
>> +		drm_err(&i915->drm,
>> +			"Failed to wait for Driver-FLR bit to clear! %d\n",
>> +			ret);
>> +		return;
>> +	}
>> +	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
>> +
> Alan: Nit: with the current definition of MTL registers, nothing is wrong with above code but for the sake of code-
> intent-readability, perhaps better to use intel_uncore_rmw_fw on above too.

This can't be a rmw, this register has a bunch of bits that are write to 
clear/take action, so we must write only the FLR bit.

Daniele

>
> Alan: [snip]
>
>> @@ -153,6 +153,7 @@ struct intel_uncore {
>>   #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
>>   #define UNCORE_HAS_DBG_UNCLAIMED	BIT(2)
>>   #define UNCORE_HAS_FIFO			BIT(3)
>> +#define UNCORE_NEEDS_FLR_ON_FINI	BIT(3)
>>   
> Alan: Fix: yeah - this needs to be 4 - u already caught that.
>

