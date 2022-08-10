Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB5E58EEB3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 16:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBF614BB8F;
	Wed, 10 Aug 2022 14:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05250A707F;
 Wed, 10 Aug 2022 14:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660142775; x=1691678775;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bd7uc0vEi+8YvLuFUdVlsVnSmG8YPWc1wVs8lFl7534=;
 b=Pld1QOQ/lHQiUmahIhfhI4PtU10YBHLdjtPoA+cowg957cMfHSH6kctr
 nzfiwsA08Y/JAQ8XDUDFpzPbmaTjssViMh4hcRyPOUJMgfwagbCnOO4Cr
 ZN4aAJpNOC4fhgstsaSh+ENFD/PdlxQu+x49vMfDmBvu14kDRReMLWXbI
 +KAEvaPePdx6gn4zFAT6RQtGRwYBQu+A6T6GCMNgdeOHS+s5YzHkJre74
 Ce5EqbnR+/vapOswZ1fR13xQS7m8etO58GMJhosSayRr6xvua6anA/9Rb
 5Wl/xx5M/ovwf96Of7S7fQ0gcmvmC4ceqEtBGSx9UNErP1rLZAA17dCi6 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="352834390"
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; d="scan'208";a="352834390"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 07:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; d="scan'208";a="664924177"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 10 Aug 2022 07:46:13 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 07:46:13 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 07:46:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 10 Aug 2022 07:46:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 10 Aug 2022 07:46:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eh8Ys+toluBudXjUgXESCQYMguxq86fQ9T8UAnLC0KEzHHLyJdWVxpGCwagEcykqLUaF/xz39yZGVkYGehKjf7brrxQW5GleBcKqUxteLZKnuMgoTlraC0fPB7PB5x38bma+43sIZYiAqUCQmTVtZvOvIOXXCGSENgWrFMA0jms4DKwmDKhYsFjRDFPLdjx2UvUHdFI4sqeAlZFnFQUlb1TC48wOSpbIgpLW8ktOJuETLaVbRm+R03fSfCMA8pEPsMRS24IE7y5F9cjF9R7nglRVW/NlCXKZH+v1duHCqk/wkYL7rucg79cUhBni7BQcZgYYvdNZaJ3ZjyQ1Yq0F9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FesQM1b2b7U+kUQwTbDGbBf24EwyoIjo0eXFxsXQIu4=;
 b=NyNCTO6O8rGdXPp+XZCpaqa7I7IXdiC7YgbbtX1al6yvepu0vKX1gyhnsQXsn3S58fyej3+AXSMbxZXFQzzJoleJDK1KMgJ7n6JPK/Op3sC8CbnCqfkepjRtLoDW1fB7KG1lOzjAEgR6QB7QZgKJZyeZb6s0/hMHgUal4aWzkHmxoFepjGLtVuy+k7JqPUfkjNNQJ5JZca8iLP4WuyJwRozuOYxF3xvzZhMV4C6xfnhUwt3MfTfqWE2rOsPyE3yUKCW9YEs8VA4T4ERVbGa1s+PavVa0a946FUlB2N40FcavXhUBg7dQeYGK3jZa9Y+AQHR7GpoLqXQGauA5l0E8Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BL0PR11MB3123.namprd11.prod.outlook.com (2603:10b6:208:7b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 14:46:10 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::e8e1:12c7:5a6f:4f86]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::e8e1:12c7:5a6f:4f86%4]) with mapi id 15.20.5525.011; Wed, 10 Aug 2022
 14:46:10 +0000
Message-ID: <b238f7c3-a8a2-f39c-8ff2-8c88ce2e7089@intel.com>
Date: Wed, 10 Aug 2022 20:15:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/drm_edid: Refactor HFVSDB parsing for DSC1.2
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
References: <20220722054647.3511645-1-ankit.k.nautiyal@intel.com>
 <87tu6uem44.fsf@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <87tu6uem44.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8440bedb-f216-4990-1448-08da7adf10e6
X-MS-TrafficTypeDiagnostic: BL0PR11MB3123:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0iUEKUemkWdRLOYWG6dr1hdMzhSCSZo6oQpN5yW5DBYOLIZwp4pt4Bs0NkRcLg/rPGe3xbZnexEklC3tttHUjotAwOJiaQ7hXH6jCmKdpcosmj7+k5PvY6s/pyGoPZ5bXS1EA/AmQ5Ve/O/r3yP1SMkw4FnlIif9CjJ0I6HWqSrPP4Eh/pKkCp2qU5QB/SpsQ3Dymb0JLnJEahjpyJXhcCGJ7cAGpDa8kd8cUKHKy8m5LXQ54VYrS/VmGDTy5RRymiznD4y+MMr6kR4gWgX9ICFdBZj+xK2dPZQkabuZ6K5jR2NSJlxXivpP3BFAiymR/V1QY9CjOhCJsxTyU+JTvV9gKZeLoKa4aHhiv6ibVCXIByF7gk06h061Tn6v2x6yrY8jKBkvk+v8ZM/fhFD8scPXO9NBZ7tdErBcbmjI/ZOvFEIZjH5vbApLiHyESeup/FTltiaKrclBPoZnf93rzryH+oyfbfrP2RvXgWvydiRm4d+pvnYrSm99kHsD9+U9Wlp6mMPpvcSHC8sFfeVFNatgb4d7fhQAaRKLKchLl0m0W+e4CfBSdho65888/5WOxtV82THiL+PhSTnKbwnaClPL/Ed2XSsOwZbkm20UdLPig7TmN2eU993c+QdKCCp9nvhL+waa3+d5JoD9CgCnq770nlo8dtOnCzngG3r/hBsqB9eZviL/YZBCFx4fafbb6bjBZpZDIOFmZMrld8G4gOMOtYsO8yQUtVcVoei2jjmipyZRUdO7zjbBFQjL8kpMorx8rq4xuTJfFTyvfZx+LaN4op6DjnWltifXNEPfmIxbpg47ppgErxLlqeLoTpNeZE482Ugpadrk11jzctobpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(346002)(366004)(39860400002)(396003)(41300700001)(8936002)(5660300002)(82960400001)(316002)(66556008)(66946007)(478600001)(66476007)(31696002)(86362001)(6486002)(38100700002)(4326008)(8676002)(2616005)(31686004)(2906002)(36756003)(83380400001)(186003)(6506007)(26005)(6666004)(53546011)(6512007)(55236004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2FaVzc3d0lJRmtUSG4vYk95WkszVHNOdklIMVBzQmwyUGhTZXNXSzlHUEU5?=
 =?utf-8?B?VEprL0VDQ3BmZmU5ZDFvbS9lc3U3SmlOSU5TUktZdW5rSTk1WUliYU94SUpJ?=
 =?utf-8?B?TUVGNURaNW1URUhYd0FrSVYyTnYzT3kzbUxkWGJmK0J6MStkaHlHS0RXNWRQ?=
 =?utf-8?B?U2Z5QW1FdHFFb2xvN3B4UU9wOG1sM1pIU2tBendWQzRaN2RvWktFb2VDWVF4?=
 =?utf-8?B?S053UXZhbjczUk9hTDM1am15ekVodDNkUDlWTEIzR2t6UnFpNUtSK2xoYkUw?=
 =?utf-8?B?aU0wTitieVI2ZmZiYTNRZnNXMjlzNmgwQ3RheDIvUWhSem1NaTd4RzFUenVw?=
 =?utf-8?B?VHdTeUJZRWdlZE9oR0NVZTJDTTRiSFZxaWlTUWFkT0pMTmRudDV6S01YcUQ0?=
 =?utf-8?B?TzczcVhQMVZEektjTWZJU2djZUtTRGNGMWtpTitwVjFzZWhxUXUwNm5HSVNu?=
 =?utf-8?B?YStNdGVHTWVucGhnMTM4THZpNjVNcXppV2dUKzlQMnREV0g0YVhWekZEZU1D?=
 =?utf-8?B?bEc1RTZuY0c3a0lMMmZZOEtkMnYzVWZhajRnZGtOa2RBVFYrZ2g5eGVocjdw?=
 =?utf-8?B?Y2JPNjc5OVNkOUlVNER6a3llc1VhMThYYk1NUTlpb0w5WFJ0b3h1akREelN6?=
 =?utf-8?B?SmZuL0JBMzcyUXF2c1dxUkhMdzdHcy9lSUsvT1luZ05QSVZxRkpqNE0rT3ho?=
 =?utf-8?B?ZlhqMk1wK1UyR3hGZldseGRPSGxQeWFHZTN5KzZtL0xZd0hMRTB3Y3hsZTNU?=
 =?utf-8?B?aGlhNjhwQ21WMmZWSG55WWxiYzVpQTZURElrS0pBVVljbjQyZk1EQnNDSzFJ?=
 =?utf-8?B?YUgxNkFqZ2Iyc2tZZnFpTDBTOFNYdTJRclZic3Jid29uQ3BnNDZwa0wveklE?=
 =?utf-8?B?NWtZWXUrczI5bEpBbXVLUUtqeWNxM1gwOUZia0JZcTdXRkxNeklkMmxXOXEy?=
 =?utf-8?B?MnJVd0dSLzJHd1dkaVlqYXdJd3cxVW9XNVZFMVVqWWhDVC9SdExwUU5vSGlM?=
 =?utf-8?B?OFh3MlR5Z2twMFZlbGJLM1FTcWlnZWNSYS9ySzQ0aE0xTWlYQWJFSWU2OFpJ?=
 =?utf-8?B?YjhTSnBhNjk3SjZteXRkRkd4Y0lXNFZZZXEzYW5WZTVCS253N2JndmNRUW9l?=
 =?utf-8?B?YzhwYXVOQmIxdGhmMC9vNitjS3Y1RmM3OXA3STNrR1JJd25jQ3NSanlxNE04?=
 =?utf-8?B?MHFNTHE2Q1hsR2Y2RUFlcERRZGtpdjJad3p3L3M4OHNuMy9oWWJ2QzllcCtP?=
 =?utf-8?B?SVV4dlpQVUxHUWYzMkRIWTBJako1QWYyOGZzMEdoN1RsMklrQW5hbFNHdXpr?=
 =?utf-8?B?ZWlZcnFjaXljN1BUNnk4V3pNVXYvYWhlYjBldi9SYTQ2OVV4Q2N0VnpOQmpH?=
 =?utf-8?B?WmZKeUVpQWlSZjhQNGhZRG9oZmtjUFBIemRwRWV0VmFJaDJ3SmFETW1MRjlh?=
 =?utf-8?B?clhpeit4a1NISHJrTm1GUUFzbkZaV0tQUG5wUjF5U2tuL3pKeDdFNlJoaE1E?=
 =?utf-8?B?QWFQOE83M3Z4d3JKa3NVS2tGbElROUhMREoycC9PRy9iT2tZMVRDcXhVNTlY?=
 =?utf-8?B?bC92aG94UkNKM0czZmtLdG9NNHc4ekp2SGNkWXZ1UDNXMmRuNnVZdkE4dEpF?=
 =?utf-8?B?QjBRVENnMkVUZU5mOUdmdzVBODVMaHJZMHdSMHJXaHRPeEJnZzMxRTNkR09a?=
 =?utf-8?B?WG1YTVBkS2N0QlhXa2E1Z2g4MDRuS1hhZEtLaXpvNnJLMVFERlpCaDdTOUcx?=
 =?utf-8?B?R0MvMHI3T2JqTE01eGUrZS8ra0o1K05YKzFNcjhsYjFSNVJCTEVrV3pQSHJJ?=
 =?utf-8?B?amRwSXdldzhONTF1Q2Q3L1Ntbk5VS29vVWJJSVdMZG1tVDVBOG5QU1JkeUNP?=
 =?utf-8?B?L2Njb3RvaDBnTndOckRnT0ZiUjg5ampNRkNJMmxIZjZlcTBVR0NGOFVpd0c1?=
 =?utf-8?B?b0FNKzhoUDRPTGJIZkhNU1RRZGd1U2dmdFBva0sxV01UV1A2OHR1dXpIYS9V?=
 =?utf-8?B?NjZMUC9LVmFuZW5pWnBqNlRsWDE2V2RJVW83eXJOM09JUUZuWHFmbEptRHYw?=
 =?utf-8?B?d0Qxa0pxMHk0eFBieFdkM0N4VFR3RjZKMENNU3Z3UW9HYmVvUFZPZzIyd0Ew?=
 =?utf-8?B?MHFmSVNUNlN3R09JUWpHWnBTV3h1UG9PSG1WaktiV1pFcjRLRTdnRnlhUG9U?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8440bedb-f216-4990-1448-08da7adf10e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 14:46:10.7249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCVYuPqMyHp2om+yLbO4kZebQDSuvNcq7B29r3IH7oCvpHgaccOhACXqq3RwA111LEhH3zK1pWPJlw2LeYgU/wVK8tTQ8p3PxC3mX1MUAuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3123
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
Cc: uma.shankar@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/2/2022 8:19 PM, Jani Nikula wrote:
> On Fri, 22 Jul 2022, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> DSC capabilities are given in bytes 11-13 of VSDB (i.e. bytes 8-10 of
>> SCDS). Since minimum length of Data block is 7, all bytes greater than 7
>> must be read only after checking the length of the data block.
>>
>> This patch adds check for data block length before reading relavant DSC
>> bytes. It also corrects min DSC BPC to 8, and minor refactoring for
>> better readability, and proper log messages.
> I think this patch tries to do too much at once. Please split it up. One
> thing per patch.
>
> I think the logging is excessive, and what logging remains should use
> drm_dbg_kms() instead of DRM_DEBUG_KMS().
>
> Further comments inline.

Hi Jani,

Thanks for the comments. I do agree, it makes more sense to have a 
separate patches with incremental changes.

Will send another series with the comments addressed.

Please find the response inline:

>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 124 +++++++++++++++++++++++--------------
>>   1 file changed, 77 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index bbc25e3b7220..f683a8d5fd31 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -5703,12 +5703,58 @@ static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
>>   	hdmi->y420_dc_modes = dc_mask;
>>   }
>>   
>> +static void drm_parse_dsc_slice_info(u8 dsc_max_slices,
>> +				     struct drm_hdmi_dsc_cap *hdmi_dsc)
> Arguments should always be in the order: context, destination, source.

Noted. Will take care in the next patch.


>
>> +{
>> +	switch (dsc_max_slices) {
>> +	case 1:
>> +		hdmi_dsc->max_slices = 1;
>> +		hdmi_dsc->clk_per_slice = 340;
>> +		break;
>> +	case 2:
>> +		hdmi_dsc->max_slices = 2;
>> +		hdmi_dsc->clk_per_slice = 340;
>> +		break;
>> +	case 3:
>> +		hdmi_dsc->max_slices = 4;
>> +		hdmi_dsc->clk_per_slice = 340;
>> +		break;
>> +	case 4:
>> +		hdmi_dsc->max_slices = 8;
>> +		hdmi_dsc->clk_per_slice = 340;
>> +		break;
>> +	case 5:
>> +		hdmi_dsc->max_slices = 8;
>> +		hdmi_dsc->clk_per_slice = 400;
>> +		break;
>> +	case 6:
>> +		hdmi_dsc->max_slices = 12;
>> +		hdmi_dsc->clk_per_slice = 400;
>> +		break;
>> +	case 7:
>> +		hdmi_dsc->max_slices = 16;
>> +		hdmi_dsc->clk_per_slice = 400;
>> +		break;
>> +	case 0:
>> +	default:
>> +		hdmi_dsc->max_slices = 0;
>> +		hdmi_dsc->clk_per_slice = 0;
>> +	}
>> +}
>> +
>>   /* Sink Capability Data Structure */
>>   static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>>   				      const u8 *hf_scds)
>>   {
>>   	struct drm_display_info *display = &connector->display_info;
>>   	struct drm_hdmi_info *hdmi = &display->hdmi;
>> +	u8 db_length = hf_scds[0] & 0x1F;
> There's cea_db_payload_len() for this, and you can use that directly
> instead of caching the value to a local variable.

Right, will use the function here.


>
>> +	u8 dsc_max_frl_rate;
>> +	u8 dsc_max_slices;
> These two are local to a tiny if block and should be declared there.
Agreed. Will fix in the next patchset.
>
>> +	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
>> +
>> +	if (db_length < 7 || db_length > 31)
>> +		return;
> Both cea_db_is_hdmi_forum_vsdb() and cea_db_is_hdmi_forum_scdb() check
> the payload is >= 7 bytes before this one even gets called.
>
> There's no reason to not parse the first 31 bytes if the length is > 31
> bytes. That condition just breaks future compatibility for no reason.

Makes sense, will drop these checks.


>
>>   
>>   	display->has_hdmi_infoframe = true;
>>   
>> @@ -5749,17 +5795,25 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>>   
>>   	if (hf_scds[7]) {
>>   		u8 max_frl_rate;
>> -		u8 dsc_max_frl_rate;
>> -		u8 dsc_max_slices;
>> -		struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
>>   
>> -		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
>>   		max_frl_rate = (hf_scds[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
>> +		if (max_frl_rate)
>> +			DRM_DEBUG_KMS("HDMI2.1 FRL support detected\n");
>> +
>>   		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
>>   				     &hdmi->max_frl_rate_per_lane);
>> +
>> +		drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
>> +	}
>> +
>> +	if (db_length < 11)
>> +		return;
>> +
>> +	if (hf_scds[11]) {
> Matter of taste, but I'd probably make these
>
> 	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11])
>
> and drop the early returns, and add a single (or very few) debug logging
> call at the end.


Hmm. We can get rid of early return.

Will have a separate patch to have logging call at the end with 
drm_dbg_kms as suggested.

>
>>   		hdmi_dsc->v_1p2 = hf_scds[11] & DRM_EDID_DSC_1P2;
>>   
>>   		if (hdmi_dsc->v_1p2) {
>> +			DRM_DEBUG_KMS("HDMI DSC1.2 support detected\n");
>>   			hdmi_dsc->native_420 = hf_scds[11] & DRM_EDID_DSC_NATIVE_420;
>>   			hdmi_dsc->all_bpp = hf_scds[11] & DRM_EDID_DSC_ALL_BPP;
>>   
>> @@ -5770,52 +5824,28 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>>   			else if (hf_scds[11] & DRM_EDID_DSC_10BPC)
>>   				hdmi_dsc->bpc_supported = 10;
>>   			else
>> -				hdmi_dsc->bpc_supported = 0;
>> -
>> -			dsc_max_frl_rate = (hf_scds[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
>> -			drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
>> -					     &hdmi_dsc->max_frl_rate_per_lane);
>> -			hdmi_dsc->total_chunk_kbytes = hf_scds[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
>> -
>> -			dsc_max_slices = hf_scds[12] & DRM_EDID_DSC_MAX_SLICES;
>> -			switch (dsc_max_slices) {
>> -			case 1:
>> -				hdmi_dsc->max_slices = 1;
>> -				hdmi_dsc->clk_per_slice = 340;
>> -				break;
>> -			case 2:
>> -				hdmi_dsc->max_slices = 2;
>> -				hdmi_dsc->clk_per_slice = 340;
>> -				break;
>> -			case 3:
>> -				hdmi_dsc->max_slices = 4;
>> -				hdmi_dsc->clk_per_slice = 340;
>> -				break;
>> -			case 4:
>> -				hdmi_dsc->max_slices = 8;
>> -				hdmi_dsc->clk_per_slice = 340;
>> -				break;
>> -			case 5:
>> -				hdmi_dsc->max_slices = 8;
>> -				hdmi_dsc->clk_per_slice = 400;
>> -				break;
>> -			case 6:
>> -				hdmi_dsc->max_slices = 12;
>> -				hdmi_dsc->clk_per_slice = 400;
>> -				break;
>> -			case 7:
>> -				hdmi_dsc->max_slices = 16;
>> -				hdmi_dsc->clk_per_slice = 400;
>> -				break;
>> -			case 0:
>> -			default:
>> -				hdmi_dsc->max_slices = 0;
>> -				hdmi_dsc->clk_per_slice = 0;
>> -			}
> Splitting this to a separate function should be a non-functional prep
> patch.

Right makes sense. Will have this change as a separate patch.


Regards,

Ankit

>
> BR,
> Jani.
>
>> +				/* Supports min 8 BPC if DSC1.2 is supported*/
>> +				hdmi_dsc->bpc_supported = 8;
>>   		}
>>   	}
>>   
>> -	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
>> +	if (db_length < 12)
>> +		return;
>> +
>> +	if (hdmi_dsc->v_1p2 && hf_scds[12]) {
>> +		dsc_max_slices = hf_scds[12] & DRM_EDID_DSC_MAX_SLICES;
>> +		drm_parse_dsc_slice_info(dsc_max_slices, hdmi_dsc);
>> +
>> +		dsc_max_frl_rate = (hf_scds[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
>> +		drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
>> +				     &hdmi_dsc->max_frl_rate_per_lane);
>> +	}
>> +
>> +	if (db_length < 13)
>> +		return;
>> +
>> +	if (hdmi_dsc->v_1p2 && hf_scds[13])
>> +		hdmi_dsc->total_chunk_kbytes = hf_scds[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
>>   }
>>   
>>   static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
