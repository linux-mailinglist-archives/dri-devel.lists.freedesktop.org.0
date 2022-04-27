Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 399C1512521
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 00:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C0D10E6A1;
	Wed, 27 Apr 2022 22:14:22 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968F210E6A1;
 Wed, 27 Apr 2022 22:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651097661; x=1682633661;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8tKghAIEniY+aS7CIOQHCqZuleS+wOai0VU6opRwegk=;
 b=igwgKLrsTRalHID3MkZj0cEh74MIEv6lrswYf2j8UxyVVXA5yF3VTwEW
 cO2A83/y9Jylawbzt3SUrPk+jhuM/UDtSe7rkKyvUdW0+7wazgWNMdK9E
 FbmTuy8mx4iUL92hEKVhKYoX3g12VOVNwtZo7Q8Dn1rKjFbh3LUkWi715
 4hbuLHuYakAU5NgfrLYc/N2syhA7CeynADEWGiRlG35inAh/oC30EU2m9
 kTZ1jKb5IFLlWP576lQdpCxjsSJ+VH07o8PYED8rFyKPTfqrlwnSZApnG
 cgaCsHaGURMLPSf6AhlH6jD0uxRowK2+R2YOuu5ufku/QTxbCEXabObET A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="246646026"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="246646026"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 15:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="629232220"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2022 15:14:21 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 15:14:20 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 15:14:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 27 Apr 2022 15:14:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 27 Apr 2022 15:14:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kozY45w95SgGD0SeY80w5bMEjL4B9cUECA9GTCOBt1hGCSbXEJXUjBC1GAnmSNFe+3gTgBeQyPd44mCAn4f3bXkez2TftoCEA6Qw2Us6A7xt3ZCEWjqufbg2wfqGI+HRGG43Re6ARxzMvqNqS0w25C5bOujSG3Tjtbs5J0IJrvMQvpyeZm73RT8uUQVNr55OA8cQot6xfAq4RfuwFNR2Rd4XtTBV7OCRZPuYfIR5AfINOV2j2kXLYt77YmKJEySfeVYZXYpGqflI4NJRFCqaf/gjqVm8Isa5PWgVOfrMWb+WEwEPMKMoB9pMLBxJssy9wSeC5sB+C0oANuDH0csTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0D1ssQ5jZ9Gbq5rROzzar54cPOrd4xWWd3wOARMKGyw=;
 b=JYCx/WM+2u9FabOWnbeBk3fXS3C2eQdL5Czf9x6/nl1akC8/GPEldmKoBEXoX6zs98o830JA0Db9Iun7zEpRPGY2cOI/8kXrio60MSLxLCps3gdeQWnx04vvXEF0xu43Vn0QcBLUYpdXrB7eEasF04kvVrAUajR/GFLFbznbKgvXRMEEDHQIWjP7MpAexInnlpsiGdKmCdfrHzdeAtGBY97oOhsbcBRi543dH6w2S4HmTeLyPS96Xt8IYmIAI4Gy/KC5qDP+H4Ea8fhhx1NDYNocGqVL5txvB8Q0KE6G99OMb7Em+l6LglPk6GwOOgtriexPPxYAlKWwLulqhbbbew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 22:14:18 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::c87c:65c3:696c:7001]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::c87c:65c3:696c:7001%7]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 22:14:18 +0000
Message-ID: <727fbd97-bf4e-1802-6e30-8b943ca523f6@intel.com>
Date: Wed, 27 Apr 2022 15:14:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH 0/2] Initial GuC firmware release for DG2
Content-Language: en-GB
To: Timo Aaltonen <tjaalton@ubuntu.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220427165550.3636686-1-John.C.Harrison@Intel.com>
 <6410f76c-af4c-2c75-1ba7-aee3480a6539@ubuntu.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <6410f76c-af4c-2c75-1ba7-aee3480a6539@ubuntu.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeb66d5a-025a-4d20-4489-08da289b45da
X-MS-TrafficTypeDiagnostic: SA0PR11MB4622:EE_
X-Microsoft-Antispam-PRVS: <SA0PR11MB4622AC1841C6D05276FB5617BDFA9@SA0PR11MB4622.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n5M9/IogzVwTm8Sxwi06+22lq7F8fO51/1F/W2hHccNdc24AIeJ9Y21GPQ2vfa/kO3CYZFNoKcUY7ZE954MUzYWADok1WqYcALlKoqmkQW6QS5GkoKtPtR2f+0Snwi7oi4XT13YIJHXIXq5nLex0rLOJEaKRPhnoIvSe1eGeNkuajACwDY+Hzy+fgwMlnMHcXcknFmNY4r1+sj/XYV5fwpoNcEZT/isVtdNgd8b/Ej5e/o/kJyGKdyTrSyq0Jr0usfgGwOC65RUEerdP35eqjBTuG7693GnR/ivnMhS02lJq8AO0cjcy/Bsk522YBGarfsBEGdHDNGn0Yn61XryUwIH0fHGB788oCmwVLgAOwLauSSCSiXZAGF64L9r/dAXJzX6QRBXvZ+QyPsrF3Z0CYTLbrL3Z8eAC0xHNWArCjzzGCOP3SQ6wz4kpPQEJzzfKq7ucUfZZAXm+gnqNGaOfvKpSHa2RRV0K5jKcJDbrDv2meOZxG6yfZiPtsHb6TOPXfjpjuoTlKb4YKAZgJm+x4fyr+ga/kmsjraOWzSRpP/7TC34+zKxMXYFQYhwn+BgPOeTGKquz/W1FxM5unlRAzgmE3bMJqi5c5YXj/u8vZbs+7zs9U4TkXUK8iofDCU9/rSA05GXMagRzdKNdKR5m39hFSkimjc8OrKtItxLR+XZyaFgVJ6D3phJluSjjbIx55bET/FCisQjthh0SoqUfVtrvV2P9/jiXiSKExfVAUinnH8Y6lNiktIS3rP7ACtW+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(316002)(6486002)(36756003)(186003)(2616005)(8676002)(83380400001)(31686004)(66476007)(66556008)(66946007)(4326008)(5660300002)(82960400001)(31696002)(86362001)(8936002)(26005)(6506007)(6512007)(53546011)(2906002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2xuMFN3S1ZzdHBuclNMNzF5RnprK0lOelQwVXR2b1hEYjNmNENJSFBnSnA3?=
 =?utf-8?B?OTRqb3BuM2RnZXAyTnJrbm9jWk5Sdm9DUVVSYjg0dHdsNlAwTXMxWW5IUnlF?=
 =?utf-8?B?ZnFtMnd3dmh1VFBKRE5SNHI0aGRWOHpJU1MyOEowRExNMmZtUEFwczNBbkFV?=
 =?utf-8?B?RUh6akZkQU11YlZjOTNKWTY4aXRaQVlIS3JhMFBqQ1ZSMFVaT2NUYUY5enJs?=
 =?utf-8?B?ZkV3WVN5Mjh5a3pwb3ZTakpCV1E0azQyTzYvSlIrRTB6NnBBRytKT05MMFhC?=
 =?utf-8?B?Qkk0Z0R3ZzZGaWpHS3ZTZmREWHh3enhSbzdqZ2s4TGM2L1Y1QVdaT1dYb3Ev?=
 =?utf-8?B?RTZpVG5vOFlPbW10K0hNYXMwbk9sdjBBVUN0cWsrRE8xNklNVDEzakZxRHZQ?=
 =?utf-8?B?ZlVlREU0czlyZWhqYlVzUFlEVGtIRytCSGNmZ0RYLzFkdU5wcURyaFowQ3NP?=
 =?utf-8?B?M1JmUHhjVHRFZmVOTVorTWpMcGJDL2VoNnN3eUlsOVBuU0IzRFVGbXQ2dmlG?=
 =?utf-8?B?UlVOcGFBTHVScStRWlZMVmlJV0NvOSt3VVZ6eTVMSUpjeE0yb2pEM1FWNkR0?=
 =?utf-8?B?ckhKMHo2YlVpOEJlUFdva1BVSHYvS0FVRmRCRDhrTFBvdHBzaCtIK0FPeFll?=
 =?utf-8?B?ZTVSTEdEMmhqU0RJd2FOcldTVnNoekkrUmhLVi9PMlRuSVVJZnpFazBuWWsx?=
 =?utf-8?B?VXUrUDF0UHJ6NUhKdzVjYW5tcDdqN3RkQjcvV1dWUDVjL3dxcmtURWZOMUND?=
 =?utf-8?B?UUdkRjBnbGJSdnVlaUVDKzFDU1BBb01XYmdKWlN4U0M4OWR0czRaRGI2Vjlx?=
 =?utf-8?B?REcxaENOQzdOYU0rVTIyS0VmOGRVMkxPUUZ2NjU3UzY0RFN3UWFqU3R1R1JG?=
 =?utf-8?B?eitrQ1NDQ3ZqamN1NkZPSWRuQWUrT1Eydzg4dWxFNGh5VHdRZ21TWWR4OGtv?=
 =?utf-8?B?dlJsWFdCcTFEbG9CNmZ3MWRTVkVwcTRVbGYwU0hjQmZyRElRenNBVWV0NDNh?=
 =?utf-8?B?aks4N1hJWnZsSml4c3ZmSHBZSVRoOVFlSFNSRUJTNWNNUXFLY2luNnRjZnZU?=
 =?utf-8?B?NzVKNmJJV0VJY0xoTG4xamRxckJVT2lDcTdYOERPb2xiZE0xRE1hSFBBK0Fp?=
 =?utf-8?B?RVFiTXZKRE8wZG16NG4vUDlwZjZZM1pkc3pVRVNjNFVrZUx2VjBCSnNBR21p?=
 =?utf-8?B?bmhVcmVSek5OREVkaXhTaHJCWE41Q1ZWcnJ4VWRtZ2ovOFFhdXZWZENpNlps?=
 =?utf-8?B?Y2F6UVArSW5kalFZY2t4b2RVL1NkamQrUXljSTdsRzIzYjd3RFh0UXVCSllQ?=
 =?utf-8?B?Yk1rTVAvWElWdmI1eGRZd1pkVnJCV2syR1NyVUpFdU5IRlhtVkRNOWx5YkQx?=
 =?utf-8?B?UjdkVzdhRENBZllvSGhKZW5LVDF6eEQwVWNQR2h4Qjh1a0pYWm1Jem9XdTVj?=
 =?utf-8?B?U1RTV1F6bHlQbXNicmJlUXpyNWN1UlhCTlFlTmdxVkZzSERYaVI3R1NBVUZU?=
 =?utf-8?B?RncySkg3Y1hqVU5YbDB1MGRQWXpMdUdXNEIvSEZPd1drODhncyt0OWdEdjZE?=
 =?utf-8?B?ZzVnTjhPMmg4SWlKMkZoYUZaT0J2NytvMFlTZjhSU1RMV0RKYkJwbnU4WjdZ?=
 =?utf-8?B?b1FpZnk2MURLZ2gyQ2d6N3hWTS93Yk9tTy9iVlNzOEtIWjh0MzhIOVc4Zjl0?=
 =?utf-8?B?R0R3ajRYdE5CNmREc0REVXJIdy9adDZXVmtUbnNiOHhJWnFTdUZoaFhZTTBu?=
 =?utf-8?B?WEJqektDOVptTVBkbDgxWkZmQStubFpVZjNJdXZTMEwrWDVIL29WK04rb2JY?=
 =?utf-8?B?Kzc0VUF3aW1tWE5BMmNYL05NUUI0a0RUOUtqN21Hb1FTMDczQTlFMFpDSHBS?=
 =?utf-8?B?K1RxTTd3dWNOT214YWZLZEkvMVVZMk12bU5qc0hTdHNqL0U2cWJEVzJDeWJj?=
 =?utf-8?B?Mmt1RjhYZ0pORlZ0NG00VUFydVpXaTBqdVlhOGQ5aHc2dmp4TmVyTlNIY3Qv?=
 =?utf-8?B?NWFJRTNEd1pkQzNnS1BWS0VqRWt1WFlVbmFVYThpWVdJbHRmdVZFN0VPVXRx?=
 =?utf-8?B?bkNLQlJYVFZ4Znl2Q29FQm0yR0hzaVZISThDN3NyVVU2Ty9VKzRrVUVkTm5U?=
 =?utf-8?B?MWJ4TDZXZzRHZDUyYXk1a3A0T3ZIemtMR29iQXFUU3pKcThoSVFyb0ZlNHIv?=
 =?utf-8?B?N2Z1blliT2wrMThxcWdGWjdFa0gzR2tJMG56eTQ0dmNSU1lJaFpTK0huUVRY?=
 =?utf-8?B?c0gzRFJ4Zys0TWpLR1NwbDV3cVpPalBreDYrbStMWE45bHZPUktaWnorSHpu?=
 =?utf-8?B?NU1LQ1A4RXRXemRsd2UzajVkYW5ISmp4S1VjWjlyUVU5YXJCQkFlKzY1clhn?=
 =?utf-8?Q?UugWoMlIb/5o6mxU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb66d5a-025a-4d20-4489-08da289b45da
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 22:14:18.5351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXuGEokkuooqbg9/9wpSdR74XBAgwFuJhfQLK0vOu56Kw3Jl24AbI+Ip1JaB9smf/xm2F3byaSGPCpeYj7cG1rZDMgkrziDnjH4Jlav7pOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/27/2022 11:24, Timo Aaltonen wrote:
> John.C.Harrison@Intel.com kirjoitti 27.4.2022 klo 19.55:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Add GuC firmware for DG2.
>>
>> Note that an older version of this patch exists in the CI topic
>> branch. Hence this set includes a revert of that patch before applying
>> the new version. When merging, the revert would simply be dropped and
>> the corresponding patch in the topic branch would also be dropped.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>
>>
>> John Harrison (2):
>>    Revert "drm/i915/dg2: Define GuC firmware version for DG2"
>>    drm/i915/dg2: Define GuC firmware version for DG2
>>
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>
> The firmware is not public yet, though? Shouldn't it have been sent 
> upstream already? Same complaint applies to DMC.
>
>
Not sure about the DMC team, but for i915 we upload the firmware to an 
FDO repo so that the CI system can find it and run the pre-merge testing 
with it. However, we don't send the final pull request for the real 
linux firmware repo until we have merged the i915 patch to 
drm-gt-intel-next and it is definitely going upstream. Otherwise, we 
might end up pushing firmwares to the linux repo that never get used.

John.

