Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB57782162
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 04:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA6D10E18C;
	Mon, 21 Aug 2023 02:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2250010E17D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 02:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692584947; x=1724120947;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8kiTfk6ndobRgS/aZLdjXL/gR9gr7FA/vEW/iOUA9tc=;
 b=ZTfUiE1g6/b2baKc2DnXgw8OFacFHbX46hkftUqyw2Lv0IAl8uyjPOoG
 J0f35aZY+TIHUpfutKMJ1XpBIN4H+iu5Nt9uJd0DTjK8XNFtuJCXU06xW
 0JRYwk3oozTm1l7Jf7dgHtyK9SaAawYAatedRpEZ5GgISUmd0spfObXFy
 VQI9rW9OxrPNmab6roVZMojay/w8S+lvTDUN+MFMhq7RfHjz7PK/Mh4Jr
 e5pOrFQQP2EYnOASjb0XcoNcuYOJU6AtbsEFVdXrbEaQ6hPfV0y2mCST0
 JuOK+1k6R1pvd7NIQQ/p7uzLHTeS+klbB/wqJ6caV4sjUfmFYYQ4ehadr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="353795062"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="353795062"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2023 19:29:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="735702950"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="735702950"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 20 Aug 2023 19:29:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 20 Aug 2023 19:29:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 20 Aug 2023 19:29:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 20 Aug 2023 19:29:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 20 Aug 2023 19:29:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FamCOZexFw+172Z+5H/W+w9i4wjomnkblXot6SgUjHeI9RH1WpV2zIZ37LxSje/Wmps9Ekd4oeSfrntJlsKV0eBt+HGXYjvMwB4jgv/pGxgMGST9fuY5NvsEpOiUbzR+9fIpjMpvdUQSDpw9AJsKs4ctZ8GznbdmXw9Q7S6NnqN1Y8FZhUiU5IuHjgjl8emFa3uNEUg4p5NmfQ5ev+nB7EHDervbXYzjL8dg1pb/IURFeyysFs1CTR9cI+z7SIAdv/lEqaDPQFY+vXS0IDb8P/+jtX3ffCMnG3UM7j+1d4yAdQT75+5LatlvQJIvcjTsKW5NBK01niRrUNDzo9FbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/TXSxFvXBTnPZ1HIDaplIqF46x65IR4Sl6y+kkuvYU=;
 b=Zdrf0E2iLhvwmTOi03aA219CmfAclaR/wbgnYJTHhsSxO7RrP2v1yBv81wJAjdC3ZD35L1H+CAgiW0VgMYJobsmFbsrQil9f6KN3ZMzbNZJ6TSmQRGUQQdRz83U7bk3ET0oOSrMqr1t3/rvMrAKuC0wzmjQN9ODCk0/Y1bRktPMg1xKwGskD4Xl3KBKUmpOaHVBxonY5IH2uHCjW/oxgdjNIl6QlKOfM+haZjBF0HBYhId4vP1ZasTrAOyOgDgHE0Fc0Xv/Pva/PB4GQKXHmRonLAlb3cs9Pyw3fA3hS/DCOqB7z/K3ZCrpzSapvhWGXcysvUYWvZ+fLTbMRYpVVMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 02:29:02 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5%3]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 02:29:02 +0000
Message-ID: <d938ff7a-a7b8-4677-0d8c-a51add493862@intel.com>
Date: Sun, 20 Aug 2023 19:28:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 2/3] drm/virtio: new fence for every plane update
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-3-dongwon.kim@intel.com>
 <e21c96f5-1f82-5afb-c117-e5ae48164073@collabora.com>
From: "Kim, Dongwon" <dongwon.kim@intel.com>
In-Reply-To: <e21c96f5-1f82-5afb-c117-e5ae48164073@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0043.namprd07.prod.outlook.com
 (2603:10b6:a03:60::20) To PH8PR11MB6879.namprd11.prod.outlook.com
 (2603:10b6:510:229::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6879:EE_|IA1PR11MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4c7ee3-cd34-4a46-9795-08dba1ee620e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SfG9YvcVmEFGsSIVe1Ca15X1rZVl19UTvR/sdMJXS1dihOENGprP1FL19OfHRgoEFX3/Pzt1lSvoccx2aSdfMjgWNqHAPRZ+QQgzpVsHjQGv9dSOSeX2VB5lxlVxIvtzMif7uA4MDBF0m7JHyDy3sgJNYBP4x3zIWW4MFTu+nKcJy5GTWGZi+NPVcFvDZt3wqH7MlQaa93RYqc6GINzGqGI05lelXjMD2QRC5dOx21ZCDIjDw+Mxv6A/2+U1mr0jzMZ2MObfDeRKYSQG+NOOx3u34QuQd9vQLFVW/fojrSAsj8Ku/4A0QJtC3VWR7e935XnCOzYCizG9MRa3Z83ojQRa+4O4hfqSg+aebpXKUDIqbEMTYozdRJvL0Z5p3MVDje9E+4cDAfgfkzw88veXZmjVvnMShdz1Vh/B/PHpZ28YWJALMCMjJ5rQCQvMPjGDkMx2TFSX0+D3yFyC9g7z1MMUduNmzOiMB0lSGqUyFwsWseW0Y9TGMrQbQfucQJsHpsLG2a3mQ2uRNQCkFWGIXxTUmibU4Z0OxWdUCihRjuM5sSsSQayKIiMig9GzG+52o2z14DO+e3zbAvzpt9++/+67Ony+v4JjNaHS5AB2ASJ1Sddwhib1ASkX4NZciaUuo6AJ/hLBMF8dKGVzH0c7TA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(66476007)(66556008)(66946007)(316002)(6512007)(82960400001)(8676002)(8936002)(2616005)(4326008)(41300700001)(36756003)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(15650500001)(2906002)(83380400001)(86362001)(31696002)(31686004)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVA3WmMrTVVyek1ma0pUbkRtM0Q0QlBybXJtcEdteXY1YUtQSy9EVWFtaENQ?=
 =?utf-8?B?UXVGTFEwRFhNeXl4MWRpR3gvcG9PRHdJU0hzNGdnc2FiVFo0WEMxUHQ5emx0?=
 =?utf-8?B?dG5NaU9pN2FseU4zUFhNSzRkRUk3SlFPWXpaZDBOUFc3TVk1S0xpT2JDWCtp?=
 =?utf-8?B?NE9RanY4TWgyTjNldVZMRlcyZnJzclVkWGpXOEx5ZFFkY3hBejQ4Rlh1RzI3?=
 =?utf-8?B?M0hsSXljM3Z5TmlrVlE4cFlVUlpPdjl5Tm5rNi8vazZSSFJOdW5qYkkwWWFu?=
 =?utf-8?B?emFjY1BBdnJVVExWWlM0VkVWek5VMnFpb2FHdS9zQlNycUNZelp1b2U4MTQ3?=
 =?utf-8?B?cHVhM2lyWk84aUNkKyswajRRTWRZLytYQ0RUQ2R0ZG9UVVgwWWlSZktQdzNq?=
 =?utf-8?B?MnBHV0xkMm9MWXY2aW1MMnl4N3RMK2ZDTG95QVcrMnR6dVpvV000WFBuSUow?=
 =?utf-8?B?Rm9vSmN3T2tZOFEzZ1FMY0RZWnBZYmgxM1BEc3hCeVZIVEt5MElkbnVzMEM1?=
 =?utf-8?B?OExOSWU0TEVjdWc1T2kxcjZSLzFpdmE2Qk8zUTdLdjlCQnJBbEFsOGg3WDdv?=
 =?utf-8?B?akJyOXNHM1dBOXBOYVpWWC9zUTVIQ21RUXdSdzNrL2V4YU9LMnRTZTc0bnJi?=
 =?utf-8?B?aXhtRkJESFRTbmtweVltcm1xeFRpbGVJbno2bys1ejhTN3VGUUFTZFV5NlNT?=
 =?utf-8?B?OEsrT3FXTm8yNTZiQXlMQ2lKMXJWVnBOb1dHV045eTdMNVNBY0xkcTg5eXhv?=
 =?utf-8?B?azBlaGlxbzV0UnhvRFI2OEhSRm1UQjFBSkRxQTcvUVdCUzNQOTNLYUJCdE10?=
 =?utf-8?B?UWlhdmRqTk9KMFBSdUVmVVRoblA3dTFPeXRvWm4xVTNDYmV5bGV5Nm5pZ0Zp?=
 =?utf-8?B?WFNCODE1Nlpsc0NPdjR5VDMwcXFNMTBYa0xNVElpZDV1a3FhQlNvSGlvd2Zx?=
 =?utf-8?B?OGlRSm1WNGNRdlNrdHByclIvaml0N3NwVm91anJqSGVQUHdHTjV0MG83MEQv?=
 =?utf-8?B?V0F6SC82ZjZKUERxdGdZWEdPUnAwYmNrTWFtOVA3RkpLMFZkWUtXMGFmTWFs?=
 =?utf-8?B?RmNDQ0VyVTBSZHJaQVFqQm1uSEp0VWRWcnVnQW5DRjRMRDRyVkdRWE9GZ014?=
 =?utf-8?B?RWFabUNQaGF0L0pLWnFpWUZZMUttQXJDeElsZlhITElyU2xBZDRMSFBhYXdB?=
 =?utf-8?B?czNWZVdBSDVMSkIwNWRBT3hNbEFzL05KMDl1RzhNRXJzZTIxNWFweStSZ2xD?=
 =?utf-8?B?VVlOVTNmZkFXZWRhYVNWWDZwU1pSOWQ4bXozdjZNZUVNeExvdFRzZWVXcnpy?=
 =?utf-8?B?eG90aFBWaTIzcnZCL3J4N21LOWF6d0RLNFQ5VjVpWTBZaWcyaWx0YndmVjNL?=
 =?utf-8?B?aVdDdGNNY1JCU1RhL3NENWMzazdzcHlSTjNpajhXWFpkd1EzcDhLZXpXeW00?=
 =?utf-8?B?L0VlU3NqSHU4aWpSakdaVVprUFRLVWx3NXA4RXJmR3pDK3ZoRk9KWXNKN3RS?=
 =?utf-8?B?M0NyOEV4cUdxSkFBdFBnaWlybjQrMENRZzFBdUJtWGg5YS9Gb1hKeHpBZStH?=
 =?utf-8?B?RjlIaTNvWGJZUzN6dXgrTmNvTEhjSTNNTG8yWFFOOUlBeGYyb0FmbG42VlNw?=
 =?utf-8?B?d2NlcnZmU2tKZStDNjFLdmd3TGlEd2lQdTBZUjZQT2VHMEV5ZlU0OE52QVBS?=
 =?utf-8?B?L0IyMUFwc2l3dWE1U0QwQ2lxUkJQWmNXYk01clNodGVUdytZeU5tMEREOXd6?=
 =?utf-8?B?ZmNKbldkRFJsY2dmYzEveURJSDl4WjVmQXJmTDZvemMyYVRiVFFZQXpRNnpv?=
 =?utf-8?B?VnEwdkFQUnFsWTZXVWtiNk5PMlRXcENlNTdETE5YYVY1NDFZay9vcThCMHgz?=
 =?utf-8?B?UCtJS0p5VjZ6ZHBvdTFuQWtaVk5BQ2o4cDBwaVJrMXJwODY0RDJidWZrdUhw?=
 =?utf-8?B?NHNMNXdHSkNNS280Y21yWFRYWGJUTnJXUnF3ODJiZkpFUWpBc1lGYlRIb0lz?=
 =?utf-8?B?Ym9tdWlObzN6WHZPQ0VhUkhLRUVyRGUyVUNhSGRWV2FYMVpmU3lLd0tZcFJm?=
 =?utf-8?B?RldqcjdvdXpNZnRuRjVtRlQyQkpxV2hUUHJMZElwWC9sdm5oTDVWNU9zOGxm?=
 =?utf-8?Q?1kMdDsQg7M/F4c9D6Gec403RV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4c7ee3-cd34-4a46-9795-08dba1ee620e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 02:29:02.3583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CA1uje9fBnMpo+o23fUitGiS9GNadwyffcOTzZqH5gO/DhhNCfhzN1CsFlTsFZSU6c1tUf+xQTnjj1ORul07aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6241
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/17/2023 7:21 PM, Dmitry Osipenko wrote:
> ...
>> +static struct
>> +drm_plane_state *virtio_gpu_plane_duplicate_state(struct drm_plane *plane)
>> +{
>> +	struct virtio_gpu_plane_state *new;
>> +
>> +	if (WARN_ON(!plane->state))
>> +		return NULL;
> When plane->state can be NULL?

Honestly this error check is from another drm driver. I am not sure if there is *any* case where this will hit. But wouldn't it safe to make sure this is not 
NULL here?

>> +	new = kzalloc(sizeof(*new), GFP_KERNEL);
>> +	if (!new)
>> +		return NULL;
>> +
>> +	__drm_atomic_helper_plane_duplicate_state(plane, &new->base);
>> +
>> +	return &new->base;
>> +}
>> +
>> +static void virtio_gpu_plane_destroy_state(struct drm_plane *plane,
>> +					   struct drm_plane_state *state)
>> +{
>> +	__drm_atomic_helper_plane_destroy_state(state);
>> +	kfree(to_virtio_gpu_plane_state(state));
>> +}
>> +
>>   static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
>>   	.update_plane		= drm_atomic_helper_update_plane,
>>   	.disable_plane		= drm_atomic_helper_disable_plane,
>>   	.reset			= drm_atomic_helper_plane_reset,
>> -	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>> -	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
>> +	.atomic_duplicate_state = virtio_gpu_plane_duplicate_state,
>> +	.atomic_destroy_state	= virtio_gpu_plane_destroy_state,
> Similar to the other email, please see how container_of() works. There
> is no need change .atomic_destroy_state

Thanks again for pointing this out. I will fix this.

>
> ...
>> @@ -237,41 +262,29 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
>>   	struct drm_device *dev = plane->dev;
>>   	struct virtio_gpu_device *vgdev = dev->dev_private;
>>   	struct virtio_gpu_framebuffer *vgfb;
>> +	struct virtio_gpu_plane_state *vgplane_st;
>>   	struct virtio_gpu_object *bo;
>>   
>>   	if (!new_state->fb)
>>   		return 0;
>>   
>>   	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
>> +	vgplane_st = to_virtio_gpu_plane_state(new_state);
>>   	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
>>   	if (!bo || (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob))
>>   		return 0;
>>   
>> -	if (bo->dumb && (plane->state->fb != new_state->fb)) {
>> -		vgfb->fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
>> +	if (bo->dumb) {
> Why "&& (plane->state->fb != new_state->fb)" disappeared?

Because same FB could be flushed again and fence is needed for synchronous operation in such case.

>
>> +		vgplane_st->fence = virtio_gpu_fence_alloc(vgdev,
>> +						     vgdev->fence_drv.context,
>>   						     0);
>> -		if (!vgfb->fence)
>> +		if (!vgplane_st->fence)
>>   			return -ENOMEM;
>>   	}
>>   
>>   	return 0;
>>   }
>>   
>> -static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
>> -					struct drm_plane_state *state)
>> -{
>> -	struct virtio_gpu_framebuffer *vgfb;
>> -
>> -	if (!state->fb)
>> -		return;
>> -
>> -	vgfb = to_virtio_gpu_framebuffer(state->fb);
>> -	if (vgfb->fence) {
>> -		dma_fence_put(&vgfb->fence->f);
>> -		vgfb->fence = NULL;
>> -	}
>> -}
> How come that virtio_gpu_plane_cleanup_fb() isn't needed anymore? You
> created fence in prepare_fb(), you must release it in cleanup_fb() if
> fence still presents.

This fence is put during virt-gpu dequeuing process (the response is received)
and eventually released after resource flush is done.

       virtio_gpu_notify(vgdev);
       dma_fence_wait_timeout(&vgplane_st->fence->f, true,
                              msecs_to_jiffies(50));
       dma_fence_put(&vgplane_st->fence->f);

But even so, I guess what you said makes sense ("if fence still presents").
I will check this again.

>
