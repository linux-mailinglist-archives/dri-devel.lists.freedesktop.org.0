Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B27155311A3
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 17:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A689E112352;
	Mon, 23 May 2022 15:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85077112352
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 15:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653320122; x=1684856122;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J+IBRQoiPwuwqAdnCiRls07f+jN/JNvfSBXDsRCr2W0=;
 b=R+/arnxfpFuRz9YA1/Dinjj8FgUuUXsbtwZOemS2zESDrrdplh6Q5vVb
 7Vsk6x2mScy2DyE9IDm59XBDrcn0dIYTKpb+cUgTfXa+uXT431fTbODMG
 +u2YHCCmAwvcF2GRNUFrJHUej9wjBO7IqGa3yaTDG+vWYrIdpM3Jb9AE1
 sCFL86tmxJ3wDP5/I4a3FN1iBL2MdskN2CTHrpbKKOqZ8pbBRCc/l4HQF
 ogBiO4Mf0yW6ZI86/ck1Li4Rn+3tjNSKL3Q4cBVOrjlnJ0yyq3gEdqLR8
 QbtV85kC2hfjCiWmIR/qAU2zmCxbJ4w5FdXGa6Pdo9a1AEl8PD5g/TSo4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="272074707"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="272074707"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 08:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="629435142"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga008.fm.intel.com with ESMTP; 23 May 2022 08:35:21 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 23 May 2022 08:35:21 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 23 May 2022 08:35:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 23 May 2022 08:35:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 23 May 2022 08:35:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCzp1ebj6CBSFeJi3FKR/8SqoWVkv9ZTQuNYsnOWZmSVm96ts9BXOpmEDzFc44hYcniEhHsArUZrW73kdRLzSUSQ6MyxUxyviV29/AZmrffaXuTLE3vSibF7cUQXu6sqeH/vp8Auzy0/gjJ/YT9s1vLngMCLQvapH63sGzDR0TBxSe/AJzJy6jbgFCZiBMweWIthBR+t1p6OlcXg2lHM9iXy3DRxKgYgqzQFvQxnFTYt7FYYSo/fv7LnKM299A0/n3L/eVP1HQZ4UC73yP9vbyiJFY/PTz6VUVADbY05qNi6KSjTytVbzbnUbMZrULV2OB8kEWgwAkiDOKxm/k5IVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygPM+oVgnyiv9+P6wfg+7QIC2f0rQjBbqGvfwYF88Kw=;
 b=K9Aj7Q7sRVRqeiNuXcUQ8Zexv/P2h90TONVPsYBiiVcWPaqSQ2uuF5n6z80GROuiO6KamZM3KDYwBLUi1TuIjAK//cTZQcuNt1gTZ5A3o5lUu1GB6URiBffokmHMa3kzKnirOY6UhBmMS4ZLI6mUtWlUY9mlgPMEGSljN8kdAEmhsCHPb4RGfPK7c/C05z99uOAOC7IYrBz4AR0OmaOm8sKEOMEHwydxNUJTBxXSbZA01Pv+wzc/0nFkxoyaWRJtpN8XdDi6jkQqU+ZHhktEuXSTdGJR3PH/cNdNrPoY/Uw5uhlJqAcRmbATqb330ML2TELUQkmv/SEhdr83DZ+b2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM6PR11MB3596.namprd11.prod.outlook.com (2603:10b6:5:13a::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.15; Mon, 23 May 2022 15:35:17 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1079:a2cc:665e:f397]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1079:a2cc:665e:f397%7]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 15:35:17 +0000
Message-ID: <5635893f-2e90-656b-866a-ee8e9984c9c4@intel.com>
Date: Mon, 23 May 2022 17:35:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH 03/11] drm/bridge: icn6211: Convert to
 drm_of_get_data_lanes_ep
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20220519112657.62283-1-marex@denx.de>
 <20220519112657.62283-3-marex@denx.de>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220519112657.62283-3-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0071.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::48) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f971a0c-1fcc-4172-0655-08da3cd1d675
X-MS-TrafficTypeDiagnostic: DM6PR11MB3596:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB3596FAC48A072BFB0E108A30EBD49@DM6PR11MB3596.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AkVQHe4Z4bV/yYbkONiyx8ml75GRgbkG/3PCoA9lWDBzlcZrFK10eq2i7TfRuNX2Rz/JktI+WPiAx2WWGGSfXA1Ec3Be1bPuaIGMJWZhtwut4BHZF82M0gPklwE6QpC3UVclO/nZkZADDAhT6OfkkZU5GfO3lDH+mwUrrh7haFaT/E5uMkesp3A8YnxHek7lbCBIzNlsvn230dUr9blyOjC3dX4b5dh1LqOjJoXMklOIQOR29vkgUg40ChjPiMSXHQzFjFM+EktiWFg7mliRRYMq7IDKRdpaVmuyNaorfRzfcrUQ8aajY27wUM9K6wHYHEmHBSB4tZrwnCCT/VFTS6YCCQ69n6AT0RkIA7e4oAccpbqOM/YK3v9971BGLP5i5puCBFnFQmV1AxrwfeSnM1bUjl5sggZt5soSPTZ2ZjQgwai0shsnfk/RpXW4t5ROinFLijzCRXyZPVaA2Eqvi9B/m2UN/UITBK7Wcw9zRNKNB7+Q12QVH1a4s7FoeQsQEPO+jylHryjQC3I+bPKlZZ+2/5RF8n6MQf21Yzi4U+BtLx810Q8OjdSim/PCXgbVwMrBrbh1IZrttbmrG1iJ2iMTfVAKCgws1AcayRE+jKU0HMfyv6xt2mX+1+PRZ+MXPlxFsd0kBwMQwaYigem3kW9Mr1s8rKRcBOYMRIkzuINenxhbjSAzUMxKLWIyGR6I3/Hx98cbF0c2UgE7+/fR8zKKKHXDAeqgcJuwv4gu2+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(83380400001)(82960400001)(38100700002)(36916002)(6506007)(6666004)(53546011)(36756003)(66476007)(54906003)(66946007)(508600001)(6486002)(2906002)(316002)(66556008)(2616005)(8936002)(26005)(8676002)(6512007)(44832011)(5660300002)(86362001)(31696002)(4326008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmIvY2M4YjRlYithc2t5MEp2SEFhcDZ0K3NUOW9MTzZXM285UWlJOVZDNW9v?=
 =?utf-8?B?VWZHT2FFVUZwQUVnUVh4aXMzNEllNjJxZzhSSklsZHhzMllJdlcvSDRUeElw?=
 =?utf-8?B?aUlCb1I5d3FtcFZCckYxdEpFY1VraUQ2eUhOMlNhRlE5NVM3eEZ5d1VWcnpQ?=
 =?utf-8?B?M0IvckFwQTdZOUNobHdIdWNITjlXWGhra1VIMVlSaW1FK21lVnhZVzRGdXU3?=
 =?utf-8?B?NlVnN29Lb3hLTktLbkxPd3NxQld6TFM3U3V2OXd5WnpQbGxXY0xQbXVVUk1J?=
 =?utf-8?B?Y1E1N3FsN3ovQnJ6cnpuZ00rb3hPeTZBNWp1MGJCRmIwRmVMOVhKc3pXMTl0?=
 =?utf-8?B?UTBBb3NsS0crc0dmZW1Nc1FhNlRYUS9yTHhhRUZUTUY2dnJmRDFkMUZWVUcy?=
 =?utf-8?B?SFEya25sa0dCODdZMWVCUVR5VmZzbWN4dFdoY01QdkQvSjhJNWRYLzUyOXBU?=
 =?utf-8?B?VXdzT2tmWEpQaXRVeGNjZC9jbUdsd0RVbm5CSFV5WEQ3Rm5FQmVoYzJka1pz?=
 =?utf-8?B?SUwrbFQ5TlF0cG9mQVY2SWdHcGVYeHdzQVc0a0dCT1gvTC9EYkgxZmN3TlJy?=
 =?utf-8?B?TGt1a2FXN2Q5ZXArelR2SDBtTTBuMjR0dERRMDJvcW45VnBzU3BGVTNlamNm?=
 =?utf-8?B?ZWxWbG8raStJRXc1U1MxaE4ydFRvUk14bGE3N2VrQ1pPRVV5ajdndjBPMCsy?=
 =?utf-8?B?djh2ZlpaWDBRRDB1Tk5PSXQwbUNxR2FNckZaMTJGOXZVS2pvTUUwcWtPQnYw?=
 =?utf-8?B?VnJTbm5BWHBqWmpvVlBlb0lEOEJON0NzWm1WZTROam0weVNJcjNzeW94b0ln?=
 =?utf-8?B?QXJodjlzaW1RMUNIcU4zRVZ3VFoxZ2pqK3VNSjdNWm1jVnlNTEQ1dEU3Uk1X?=
 =?utf-8?B?R1FBVnkzMy9hQ3U2SkxFMjBzRlZmQTVSZGhnNXRyZmEyUU1hbFlVTTVEWXlK?=
 =?utf-8?B?aW1iVW1ZaE9FVGp5ek1tdmJIMkIrS1Bidmp2WUxzT2NaMzM0WjlTbDRrWFJN?=
 =?utf-8?B?dTF5UzFTM2Yxc2hBYWV4bnpOdy9YbkZBQ3RrT1RiV0w4NTk1alZvUWExV1NY?=
 =?utf-8?B?RGNqQktDR25kbHNPVWVxZGlPZ3BUKzBVNGYyZ0lwcGpEeHo3MCtEVG5lSEZk?=
 =?utf-8?B?UnNPMCt0U2RGc2RDYUI1ZGgvWEZ1T004WkZYb3NKaFFNUHp6ZGN4Y29LTU1i?=
 =?utf-8?B?SCt1UU9rNjJ3TzFEODRlaTUyOUJneFV0TDQ4akZITVFWNWxvOUNZem1Vak8z?=
 =?utf-8?B?SmFTMlYySjJHa3FHTkVzUjkwbTFyRUtYWUdyL2Nqc3IwcnpFc0ZrNWNNenlL?=
 =?utf-8?B?cnpwQW9xc2VMVncxMjl1WCtjTEpvV1hBOWdCeWZWaS9maTlrMGJKZFc5ZWxT?=
 =?utf-8?B?bzM5NnZCOUhDMHRabGhmTmxaMVJSd05IYXJiaDUvZk1HRFltSEYweDBYRHdT?=
 =?utf-8?B?anJrWjU1OUJPWGhqVWVIVW9zLzJ5eFNZRjlaajRjTnRIRFZoTkVtQiszQ2Fr?=
 =?utf-8?B?MnNHQkFFamlKajI0Y0FjaWF5dGluWklyNnEycjJmYW9MaUdsSTZUUzV2ZzY4?=
 =?utf-8?B?NXVZWGR1ODVHTHJsU0JEcDYwcGNvYkJDV0dEbm9rMkN6N2I1Q1dab2hkOU03?=
 =?utf-8?B?N05HQVNVVXR6dDFYdXlPSEFKelF1NGVGNTZobHB1NWM0dEVySmhHSTBHY3JN?=
 =?utf-8?B?SFlKb1JjSVJ3WFFRTzBkenJqd2xveFBDMlVFbGhIb3lHaU5nZSt2NEJBSUZN?=
 =?utf-8?B?Z1FOeHFSdysvRmZERytPSmxEaUNoaVFGTnB2Nnh1d0VnVmM4RG1TQjlhZElr?=
 =?utf-8?B?NDF1SzJld0ZFZ2o4OTBZRi94UlFxbWJ3VXN1eDJJRlc0OW5xWjdtMnlQbEJX?=
 =?utf-8?B?WkxsTXMzU0tveW90NEw3NmxBQ25Zb0xKKzgwVTBZOVpoajBOck1EUC9XcGpN?=
 =?utf-8?B?Y0VEVkxNekhaVkdUbXlCOEUvd3NTVnNCb2lzZHJKckc2aFRybkhXemppUUxZ?=
 =?utf-8?B?NW1NOWkybUNpY1lIMFZOMFRiR2JBTUszQXB0YXRQMlpoWTJjY1ZiYWx1eXV6?=
 =?utf-8?B?WHhIenBxdjhUVXo1T1lEWTlWNWdCc2JmVDVsUzlDZE1QK2E5Zk1YeGVCaVd6?=
 =?utf-8?B?Zkh3Z1gxVTBMamUyZkV0WVVKRWZEcElIQ2dhT2xZblBURS9pL29yZzJZRndK?=
 =?utf-8?B?RkVvR2FpVDdyUXE5ZmN2ZDVEaUJJNVFvaHkzY0pSUkVPK1V4UytSMVZJL3k0?=
 =?utf-8?B?ZFJNbHlpYmJ1bnF5b2pKTDFzUUVYZGtFNjFlUFZTNDhiMzUrcUl0SUFVR21U?=
 =?utf-8?B?dW51OEd2RnRZWktOcnNhRHpVaS90eFhSdUJEUEQrY1JXeklHWGNQd1d1ekZE?=
 =?utf-8?Q?Uc2mudU9z9q8dJfs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f971a0c-1fcc-4172-0655-08da3cd1d675
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 15:35:17.2983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54TBE/7XRNmInteb8h0F818FxwYwEnaLubZxZgCdJyy8JlKObfHNXU2+vRASgx5plvmgniWBzlrSDrskKiAdfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3596
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19.05.2022 13:26, Marek Vasut wrote:
> Convert driver to use this new helper to standardize
> OF "data-lanes" parsing.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/bridge/chipone-icn6211.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)

For this and the rest:

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> index 45bb89ac3fff7..e53a19f721c8c 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -496,21 +496,18 @@ static int chipone_dsi_attach(struct chipone *icn)
>   {
>   	struct mipi_dsi_device *dsi = icn->dsi;
>   	struct device *dev = icn->dev;
> -	struct device_node *endpoint;
>   	int dsi_lanes, ret;
>   
> -	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> -	dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> -	of_node_put(endpoint);
> +	dsi_lanes = drm_of_get_data_lanes_ep(dev->of_node, 0, 0, 1, 4);
>   
>   	/*
>   	 * If the 'data-lanes' property does not exist in DT or is invalid,
>   	 * default to previously hard-coded behavior, which was 4 data lanes.
>   	 */
> -	if (dsi_lanes >= 1 && dsi_lanes <= 4)
> -		icn->dsi->lanes = dsi_lanes;
> -	else
> +	if (dsi_lanes < 0)
>   		icn->dsi->lanes = 4;
> +	else
> +		icn->dsi->lanes = dsi_lanes;
>   
>   	dsi->format = MIPI_DSI_FMT_RGB888;
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |

