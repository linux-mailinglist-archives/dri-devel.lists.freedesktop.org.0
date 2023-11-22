Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADE67F3AAA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 01:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3042410E5B3;
	Wed, 22 Nov 2023 00:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A9C10E5B4;
 Wed, 22 Nov 2023 00:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700612789; x=1732148789;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8cHonnQXsxaRTitaO/M1ftdbGM9Evd9X7OQ7ml7HnCM=;
 b=mYmWVI/0ALXCDTldJe+9fgbDFNkxyZv5Yn/kWRyZUFZ2P/2ZDMsphBdX
 6bfZFU6e7eJZVGT6u68YAMCjvmenrU5AQ+K8cy844sXenOtXHGUuklilN
 vbJuEXAzSUkWIWiBsJkLReCGvd+bQJ0+nICmhQZTDOkWX/Cfc3mZzGJs8
 ksjGzpCiv2xcipNfBAPXe8yJ12E+a9xNSOgJp1VpghDyY1VKxGdc9NV+H
 9FgfbsXbAXYWndNrbDHElABwTe7viOplpAKkcta2fe1RtP4iAHOXHKL29
 iyj7UyAfI598bz3VgeRutpzWol3q6tAgWhRaIuMI5HoGxPREbcB3ycFp1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="478159950"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; d="scan'208";a="478159950"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 16:26:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="884369288"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; d="scan'208";a="884369288"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2023 16:26:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 16:26:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 16:26:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 16:26:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 16:26:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STt6cxZxoTuc+q58oVFwTVZ5eqSdeAqwIXdBwDpRCHZ35+1CWDvd3ni4jqblxwVV6b/jq/rpm7eFgg1TwQyj/ynk+DbYAu4+X9Kbu6+jycMmhBlf5Fs6+tEC/bNF6EL1k81AxY7lQfuwdhvO+EFwMoWAaSSwgR+rzkdumpGfq+PVrcfO07txaacwPXAjbWKgcm4kHyvQbssGOtfAHO1yo0I0WPehZK7S/EhXnxptLSXoqKz54fajfVvl4he20m8soFQtpM+tufpi0M5mFCQX6nx71X6TCGdgqW/kGMxayTeAQ+0fBCMMeWZly2X75coSYNveb9aI0Wqq02gkSv+btw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjiAt8RGk6AE8u3yeMUsAPEK5tCUaCaPIo8BVItPUhE=;
 b=ElBG9UfeqoG2UKBk532BFq0HXkyrTBUVlHBcFfhH/8DfP3HJ095tnJvKA641RQ7UiBSjxwlvd+xjHeG+6BWmy2mZO/T7dNV3Taberu/Ik4TeZPHbuEbkS7Ub/ywXa4NJ/g5gWfBjvzBn//E6SBxBYlkkr+DtgWXxiD7x+H4A6S9mbtWIdizbrJPV0LhvNcnGpR7V6Y1VD5mENC7ia3w1nVeFQmW/vKwSS9ZgzuNQ0AYIhD2j9AQ1h0RxciYdkTHUiE8mFg4CSF5nudx9f7gtVAPN4dwCh83c2XhhuUPN52daOaoVfoLfVSXA699bv2fHL48dyzMARGC6K7UfniYKug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW6PR11MB8365.namprd11.prod.outlook.com (2603:10b6:303:240::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Wed, 22 Nov
 2023 00:26:25 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.7002.028; Wed, 22 Nov 2023
 00:26:25 +0000
Message-ID: <e263a2de-79a7-4021-b739-239e98eef5c2@intel.com>
Date: Tue, 21 Nov 2023 16:26:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/i915/pxp: Add missing tag for Wa_14019159160
Content-Language: en-GB
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20231121185556.45770-1-alan.previn.teres.alexis@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231121185556.45770-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:303:b4::7) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW6PR11MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6b96b3-db0c-42bb-5e92-08dbeaf1a93b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /GZL0uOK+Qch5rKXHr7jdW6/9Nxwu76djzUKhsev++2Oh9CBE2z6ZlxFeTtueOOO0q3eHerOam7uCQuYzwY56CrLpjr6nZFnOiNR71dEQUdPUHQ5+dhglcTHTqfnJLhiigJ+XgJHPJDZzMAF0A4LQi/GqWomGHlhA7kcSj4x9RVpH2pRIOmh7a2kDmQ7WPGLXHKTaozfjOY6ioYqYwyeOGW4riRbDJRWLZIpxH1v8QL2PgbpRETeB+0+DhA3qDk/cCRlBCLfF0t5iLtcyP14Jrp/OHINa/Odhtnr6RGEq8xXm01kU6DobNHvffMCy0hTCLzaJ59jtIAbKWzyDSGBFOkZRQTo6WB19gAQq8r3Ug4h8irHYEM8MOUOmdqwHcaTP0BcuspHl1KGKDMxVwyJSxEzkm6GOTHXXTuc7PFI6fPU+iYGJYQYNH6uhrCTA6d8sr0gV8YxAfsfwBeb/GnDnQ8iY3eKd6hhTbKkvCT8WSNW++vCyoDVn1OTyy3CsaXAPX+2ZYglMAdywaAEuzKv28YONIbuzrkZh+9hxRAhKpbKyJHfB2x7OWFtRjv8zDZp51jn19mRygXj77dg1DAq010ycWnHHWpsipC6Ff01WssPZs2so92N3EM48alidrjui1Ih1JPtVXYB8FYa2b1r8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2906002)(450100002)(6512007)(53546011)(83380400001)(26005)(4326008)(8676002)(38100700002)(41300700001)(8936002)(5660300002)(478600001)(6486002)(6506007)(316002)(66556008)(66946007)(66476007)(36756003)(86362001)(82960400001)(31686004)(2616005)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGJoc3dQVWo0YTIxcnpzRE1mWnNrTE95cmVyOXMvM25XN0tKU0dteVNZNVRo?=
 =?utf-8?B?eldEekhOZlFYcWxKM0dld0tyNU5ITHY4V3F0bm9kb0xSeVNiWE9OUXNCUmtU?=
 =?utf-8?B?NDhIL1dYNFN2UFA0eGFXbFVVaWdDKzhtdC9PNW5JdXRmbFprV2EwNHdsTENI?=
 =?utf-8?B?K3liY2pNVDJjcjJURHVRWU1udURDNCswUTZCVE9iYWgzLzExTDNZT25IdlA3?=
 =?utf-8?B?UThhMHhyTmxTUXhhdzV2R3ZUV2wwV2JzbnNRMVA3a1dxa0MzSWQxWkdwVjRI?=
 =?utf-8?B?OHo3NUZqZVpNOElhYUg2cG0xNE0xZU9mdHNkMjRSMU1JVHBaYTZHdGhBbDBq?=
 =?utf-8?B?Y1JvVERpT1VnUm1aQmRFYmdZems1b3l4NWFMSUpwaW85WDcwZHl1QVRNRXV1?=
 =?utf-8?B?eTUrNkZTWmFSSk5pTTFFME9CVGEwWHljNWNRRjM0amI2Zktwdll0VURTUVhv?=
 =?utf-8?B?RTdhbFVqd09Md2JkNk5MV2FtT2NacGJsWm1DOTFmd0I1bnA0VXcwTTk2SUp3?=
 =?utf-8?B?cHB1VWZnSTZDODJnb2FvMHJGZ28vOHZlRGQ0M3lPOUcwblJNelE4SUNabTB1?=
 =?utf-8?B?a3loVFZsSnRvYzIyKzA2S3ZoNHBtOUxCc0ZaSHhTa05ZWGtrVnhud3I3UGYz?=
 =?utf-8?B?SmlydUVJSTA3R2lZKzhLU2wzTWJCbXhqSUJnNFZnNmc2OGRUVXFkVUV5RHV5?=
 =?utf-8?B?NzdHTXI1OGhPdVpkNlZXSmJJTlk2TFJzNWEwOFpWbnJUcTh0R1cxVnhnNnJV?=
 =?utf-8?B?cy81bFJUUEZQQk1EVStmZmdxMU9ma3VxU0Nsa2dUeTNDVm9VaTRyUXEwRjRZ?=
 =?utf-8?B?cE0zaTdtd3lvUktpNXlSZEZSeFcrQmUxK1RYT3c4cEdKenVyRkJDZGdMQXlv?=
 =?utf-8?B?UWlmUkxNR2svSldjNGl3bmhVVmVQUVBCNEtkM0xmQy9LZ3dzU3JNeU9ZdFBY?=
 =?utf-8?B?UmJTczg5czlIMitQTEVSN2szTkh1UkNnUXJkY1BzQTRiMTlmVEsrTlNMaUNH?=
 =?utf-8?B?bVlqbVc5Q0VnUEhrY1ovaVBWaERiSk9HSFl2eHFKZXJ5bkZQYUZZd0l1Yk42?=
 =?utf-8?B?K3ZaeHJ0S3g4UWMrYzRPUDJiM0FsK0ZjT285aHFLNGdjM2t4VllTUzlBYld1?=
 =?utf-8?B?Z2tXNURhbVlXUHlSK1RkNkUxTWs1OEpKSVJoZ0pFUFJUVThYbmI0RWpzNEN0?=
 =?utf-8?B?MzNsL0R6Z3hoWDhFcnJrbHJZcU5XU3luZzhVZnJIQ1pHRjJkUGZOcUZQMitC?=
 =?utf-8?B?V2FobVRKbHByMGZ0cW8rK2R5OCtZTElBS05SckdOYnJtNmR3Y2JoODNaR3F1?=
 =?utf-8?B?MWh0bmtDdmQrVi9rTzlCNTQwSS9qTjRxSGNybHhITE5va3lYZmxkWDZWOVBy?=
 =?utf-8?B?S002TklJTll1UkxBRHhSUmd6SHBZWVdmV2pGZ0c2UjVvT2ZWanNmMWp4bElS?=
 =?utf-8?B?VnlnVHgrc1gxY0U3MzZkM0tJMkJtZzlBZGhwa0dDMFJUdGJILzB5a0xFWjA1?=
 =?utf-8?B?SS9ZS0dJSHpjWGZpMUgzL1V0K0ZxMG0xOTJaUmV4TThXUDVDbDJzSHFhZTdm?=
 =?utf-8?B?SzBqbU1zdkdJNmVHdFNSV3h2cTlOdUJjOCs4dWFBWkg2N3g3SVRHdEFObU5k?=
 =?utf-8?B?K0VzY2xpM3pXb2xRUVFYc010c0JuRnZmKzczdldlMmZHRmUvazN0QjEvNUtW?=
 =?utf-8?B?OUVzcE9GYmhFeDREYTdIa0xseVBBL2VDdjR0RWtia3NWQ0dWMXB0OFpyZkNx?=
 =?utf-8?B?WnpUN0oxVEFmaUxsb0wvWkFTU3NLNE9CdkQ3djdueVJvTGM0ckx0d1VLUjN5?=
 =?utf-8?B?LzFKSWgyazBYQ0wzS1QyUEZlVDhDc1cwbXY1Q1pFMVNqb21UUG9tNGVWMjNr?=
 =?utf-8?B?R20yTDJiTE8vcUs0ck44WkJWbkpha3VDVFJFbFlyTm8rdEtLNHIrTitsUExr?=
 =?utf-8?B?MlIvR0hIWm0vbGtwQlc4N2dpdDZZQlNVdVJIcmlsbnJOSTI2UWtGTnIwYlI0?=
 =?utf-8?B?UkVXeDNsd2Q2OXRTTXUxZzdWNTAxUWFiNElhVElQeWE5ZU5CNllrQ2RRZWVi?=
 =?utf-8?B?V0lIR2xoZlVrNThSU3pZUFZpbVlKcm5lY0tZYzE2c2lhSXE0WW1KQ25JL2N6?=
 =?utf-8?B?RmVSb0x2alBhc3JKTFVHN3hKaEQ0QzhLUGd3QS84KzlCQW91aG5acUo5eVhN?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6b96b3-db0c-42bb-5e92-08dbeaf1a93b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 00:26:25.2260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0MGUTNt2DRo7M6Ngf0MVJbyel8+SYGcZETpY0Q42lh8KFoMgbpb83RifVvCIkPx3qZTGUOAJE3EU0QI9RwXOSTbuAUH8ELtxYO1r8roRlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8365
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/21/2023 10:55, Alan Previn wrote:
> Add missing tag for "Wa_14019159160 - Case 2" (for existing
> PXP code that ensures run alone mode bit is set to allow
> PxP-decryption.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_lrc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 7c367ba8d9dc..c758fe4906a5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -863,8 +863,10 @@ static bool ctx_needs_runalone(const struct intel_context *ce)
>   	bool ctx_is_protected = false;
>   
>   	/*
> +	 * Wa_140191591606 - Case 2: mtl
Too many sixes.

>   	 * On MTL and newer platforms, protected contexts require setting
Probably better to say 'On some platforms'. The current wording implies 
this is an intentional hardware change that will be carried forward 
rather than a bug requiring a workaround which will (hopefully) be fixed 
on some future platform.

> -	 * the LRC run-alone bit or else the encryption will not happen.
> +	 * the LRC run-alone bit or else the encryption/decryption will not happen.
> +	 * NOTE: Case 2 only applies to PXP use-case of said workaround.
>   	 */
>   	if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 70) &&
Likewise, this should only test for the explicit platforms listed in the 
w/a definition rather than assume all future platforms.

John.

>   	    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS)) {
>
> base-commit: dbdb47c227dc21b7bf98ada039bf42aac4b58b8b

