Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67C6520DA9
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D2010F22A;
	Tue, 10 May 2022 06:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE8F10F221;
 Tue, 10 May 2022 06:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652163334; x=1683699334;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kU/lzB0mA+tyiEgtWnRE7EaUFT7shLN+MSRtC2obam4=;
 b=I6tsdYORpJZ4pMQTLHRc35oY517R4T0ePSFXvqIm72MqHbuW/UDTGeVg
 kdxo8qbHRhM93NeH04c54QWopHIEivMvI+6hna+01TVA6WkQuE9IEjsNW
 h5ljezgalQrOgWmpd1rT7ySnbwfr87bbN1C9Rb7utCxcrb7GJyKsKqxe/
 Wb8KIT2yToIFq2nCEu1fDJ0lkxWZ/IMPxj5nzd2Z7G3f6YmCCuZeM75ef
 sa2/CYz0mHurlmIHMTkPIElwP96MpM/daMzuQn1+pMCDTF8zHFP0GMvsI
 YP3HnQzUpUb20QBuZunTZpvt6/fUjvw8XXUt0n0OY3d+DUAWhw6IoFaOh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="251320991"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="251320991"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 23:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="552633771"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 09 May 2022 23:15:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 23:15:33 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 23:15:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 9 May 2022 23:15:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 9 May 2022 23:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtKUzQNkjR4ZLR+O3VUFyckhqpPCZ+BPSxRJtbspYWfCFt1jByCrXizgXN/EHkwwdR5D9XC1BmuT1u0vAzSBtw9C6ni8MIQTtYU6n1EUHvWko9Ig+1TLAnw33jRfZvEAls47nQ2YIdFolQ/f4dKtBN9Gxv8z3iaO4NWlgNUixx9VkTHVUVB4//EW+TTkl8xtPhgOMwKQPkkbHdvdni4advcgYb5+ka89JKFwb5N9DI3BG2GFqCWjm1lpO4Iiz8t/Zd3UAjxOMyBeEoDpAnR9BddOc3HhtWeRFpUHwDyYkLBWPPnEcC6ClZqZUCar/GNzgoZ8B8e4BXgiV3GoRIc/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JT872nZaIaxFpd+tsk0pRrfvabig9aceKkQf+RE/ga0=;
 b=SSv1PmuZdRFGpvd+J9651fLI3TnumPSD8Vc2xW3ElL4Zp2MQ9+uDyfjnrbMK/6mEhWfsI8PyBWiBE50dp+j13N5aaE03YcpsughP+jQFFfbKNDNEcFCjmkJW99emwNqFrfqvvTyLqaIN7EE3MJ8wdylwTJe2vcZsNp4cm4SbyTrWp8w29lbXy1emmNl1dnWtDqs+Ok8kpkHnuk8t9g62vAneKnZla9EVmky3PFqSfIt0KyEZW1xyGsWQ60iutdEAzoiDuYrm4UW34UaH2SplzPTjxtJCkWGEDq+msN6Xc8IEC69jYKGvqCTUBJhlvp1k4EUHBOW2XoyK7EN6jVHACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM5PR11MB1369.namprd11.prod.outlook.com (2603:10b6:3:c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.21; Tue, 10 May 2022 06:15:31 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 06:15:31 +0000
Message-ID: <fadceebf-6c57-8850-72d3-c482e0a65583@intel.com>
Date: Tue, 10 May 2022 11:45:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 05/25] drm/edid: keep propagating drm_edid to display
 info
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <5a24629a6788de873c3f01d391b9b2e856d2eb57.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <5a24629a6788de873c3f01d391b9b2e856d2eb57.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::23) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be72db5b-769a-4248-44f3-08da324c7bfd
X-MS-TrafficTypeDiagnostic: DM5PR11MB1369:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB1369672C506C752B2DEC2FC8CEC99@DM5PR11MB1369.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I1ImkWBwqBDTElIX9/5gbUUL8AjW+dweSuicoCdeCG+j2CLtfpsn7CJ16RywrS7wGWcQ8WXMzUP5ZpVHhxAj/dmSsciEPx0rBDminoSyNxXddUfVJL7jXlOwNKccB+XbEkflGOpmEitmmaT8rYmGzU4zVuLA7pwO49/0aZfispZOJkFcx7hgXIgOU9nR68lDbrpF/98lx9Z3VIr2VTmSPJWUzXnr6aTjy6pwOD4tcDF9zU/YKXZwMKAKekPWA7T8FsNIpQ3MnUrq6E2Hpfj2EIY/q8HRZBlSuA/YYMHeLKYHJ+uS/nGrKOYUe6wN2cDVo61v0luJVjywOzjNCIJaRIGNuLPnyoShfJrKpEd4RGhT2xFucDct440hNbg30P7KR47BjLqJWNYg9Mojn0Was/8QXZizcCa8nLsGoUBHv1JMkw25x49+UXxq9XpndYOmLBBZa7/icR1Nty8fR0r4Jin+G5rhhNGJGv+HrXAZeBBf74hJQ+8slR4Wc5+7gYuoRimr1DvsvU0O7qBtfrd1MEYCvIjmw4QxBorKxLj5kehwBz6Xy7qxf4U+ptNOyPrlGmuNfW+AWC0NyRvwHDvsllMmlTOEXRZNxoFHCN+4CSUjY5rFD8sK7KlX5H9SmVNAIWIeIa9z426yjcLY1Ric9JzrlGer4y8lKkuspC13DgINVHhzEecT75lJFZQ5rXw7A46+jaGbYJijYk8itoIESXdxxocKUhsN0K/5F08EAGo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(6512007)(26005)(82960400001)(38100700002)(4326008)(450100002)(8676002)(31686004)(36756003)(186003)(66476007)(66556008)(316002)(66946007)(55236004)(53546011)(6666004)(2906002)(86362001)(6506007)(31696002)(5660300002)(508600001)(6486002)(8936002)(83380400001)(45080400002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVlzWXlTbktFZnlVVVN0OVpQWXVNd252NkNPaWx0YWgyc1FxRTNlTlFSMERw?=
 =?utf-8?B?S1U5RVVpNlptSmEzcVZhdTNnU2tvVU93QXR5SHh4RTNCa2x1SS9INUladlhr?=
 =?utf-8?B?ajl5OVZabmd2eWRUWENEN1lXSlFqWUFhR3p3aGZLS3hGTVpxdWpJYkZiMzdz?=
 =?utf-8?B?QWxPTllYNVJzTmppajYwTElMM3M4YnlkRlg3SU9uUzI2Y05ZbGRCeUZPd0VT?=
 =?utf-8?B?VHg4bnYxSm4yOVhjQnFpRkR2MU1KU2RVK3JEaXNEVW8vSlRsY3RTdlp1aHIr?=
 =?utf-8?B?enB2eGtvT0ZZaFVmM0dJWnYwaWdpRk9FdjJ3dWZwL3NFNDNWT1ZyNGRDaVJp?=
 =?utf-8?B?UU8vNlU5dWhuWWlOUGR2QVZvNTFld0ZyUFJsMnZSVkU2R2ZBU3ZqSVZUL0s1?=
 =?utf-8?B?bWxtdUM0b2x6OHhYVEZwT1FwVWlmTytYRVByYmJlT1FMZ2x5eWtwb2VrRlFO?=
 =?utf-8?B?aTE4M09jWEoxamlSTndsRllVdms1T01JbEc2UFV5eExVeDlqRmlNNTJ4NVl4?=
 =?utf-8?B?Q1JPekV1OXZLeVBsNDJJNkhib0xVQlVXTHJLdDl1WDI2NFJ1RXBtM05RUEN3?=
 =?utf-8?B?c2JiWjhFeXFFVWdvYjM1WTNnKzJNbGNpUE5iTm5lak93TU9KSzczR1Q1am5C?=
 =?utf-8?B?cmErNXZReGpFYmEzK1hCVUthbGlwbkFrb2srbU9CK2VpdjN2R3pSY3FVRWYy?=
 =?utf-8?B?c1VvYTdsWVY0cEJqaUlXODZCRmZSeGpXdTQ0dmxNcU1kU3AyMTdYU3hJcTVI?=
 =?utf-8?B?a1MzdmFBTjk0bFZCUHI0R1ErTlp1ekFsUmhOalNDSFRYdW9sZ2tNZU5tSEVz?=
 =?utf-8?B?T1VzaCtXNlhWYVZSRUhIekNLS2pvUGc0ODhUZ3BVSDRLL3I0SEV4dUUxd3hu?=
 =?utf-8?B?Q3BhVEhiS2NwWGh2cnJHbVc2clIzNUQ2OUllRmZjeVBKeHNaREpEZTVKMkpU?=
 =?utf-8?B?WWNGU0pBWFdKckIvSFFFa1hjYmh3YUtwOEcvODhEMXdhcENQT3ZhYSs5TzZX?=
 =?utf-8?B?RDQzcDNHTXBRaUMreG8zWGRaQkh1M1EvQTVqbUpMbm9JRERFWFNhUk9IN3kx?=
 =?utf-8?B?RnFxUFJsTmNHa2FOQnpjR01SY3BnOTFsclJvVjVIQlpWNjludzd6cGJyWC9a?=
 =?utf-8?B?NXNQQVBJZXpFc282bjlYN1paa21iaEsxVEdCUmloako0RS93aG1CK25IT21r?=
 =?utf-8?B?eHBhSW55eHJUcFViNHgzS1ArS2FyQkgyK1U5K0s0anBLU1BUYmx5MDBwd00v?=
 =?utf-8?B?c1hYcmRUTTZhRkErTXZDMk51THhYVUU0eGJ6blBRaHZaUkIwRWU2cFJqdzVQ?=
 =?utf-8?B?c2hxRmt4VW0xWVBabWlmQkM2Uno3SmUyMkNJeFVodWNIZ0o1SkM4YjNNTmtD?=
 =?utf-8?B?QWdod25Cb0k5MW0vWitpWFAxc1V1NVBoSy9TL21YOHkrZUFlek5rM2Z1ZnJa?=
 =?utf-8?B?dVVvN3JwNVJIa2tLQUNnNTRHMDdYc0lQZnpITkJpUmZmSjVIRGtIbDlCKzcv?=
 =?utf-8?B?TUVCSjRyS08rZ1JSWHhRSkV3M2kva3FrdGdHTVNDSnJvSlNVWVdobHlCNHFF?=
 =?utf-8?B?eGYxSnovTkFLYWZiK2tVS3dsRTdnemRqZ2pkUy9ocGN2RHhqZWxHV1RGSlF5?=
 =?utf-8?B?L0RsTEMvZUp1emZBcCt5M3EvK2tnVERQRExhVmR4VGVBbmJJbDdUMEZ2Yytx?=
 =?utf-8?B?MDhDVGsxSFVlbXRyd0dBMnlGRDUxSG43SkpMeTlhcmtzZnpFWDlrSXBhNzkw?=
 =?utf-8?B?am5qWHlUTE9PWWlzUlZZS2RYR3RLSFh5M1FRL0thNHpDL2JWTXVyOWU0TUJY?=
 =?utf-8?B?Q1RYODU5OUc2T1lScEc0OXZHQVVRckJqcDluOUkxd0tTUUlFOTNXT2RERlhu?=
 =?utf-8?B?a3hNbUhmZG05Mk9KMVZWaHFIRXBVTFV1bUhuZDE2cjUzKzg1M2F3Q3cyVFhj?=
 =?utf-8?B?RTlOUDIrcm9EbjZ4YkNnSk5JdzJPMEUzekh2d1piMERTTDlaOStHbE8vSGZJ?=
 =?utf-8?B?SzZvSFlLTXZ1US9qTFVKbjZWcmlKY2Vid21hNjVpbGM2TEo1TzgwL3I4ZG5U?=
 =?utf-8?B?K00xeFNMOFlMc01nRC9kUzFpWXNvdEUwZVMyMHg1c3BTY1RnNEQ4Vit3aUds?=
 =?utf-8?B?R3hsbVhiSFluaTA4ZkEwME9ONE8rUlJHN1YzV01FV1JGSm9lVEhmM3BCMEN4?=
 =?utf-8?B?dUQrdFBUa29ZcEtXb0pwRlpNT0laczhCSU9GdjUzalRpK0xEaDVKOHNuVkg4?=
 =?utf-8?B?aVhTeUVMQW9ZSXczcXZGRGZMSWcvUHp1ZjZvVG5ZOG4yWlRreC9jREV1U3Nw?=
 =?utf-8?B?WUJUZ2VwTEUwZi9JaFY0MkthNUliNVZYOFp1TFBsSlBjbGN2OTR6NXFPQ3dX?=
 =?utf-8?Q?t2sjiRQIGiebsCK0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be72db5b-769a-4248-44f3-08da324c7bfd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 06:15:30.8881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqLY2QFDO7YD2QKp5bSx7Zme76juKvo81nokpOXE74/TUQGJkx1oQHiXcxg6MaP+y6mzS/fYPcRTBS9x+7uR1JlonWgJzoyUknvNAmPsvCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1369
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere.
>
> v2: Use drm_edid_legacy_init()
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 48 +++++++++++++++++++++++---------------
>   1 file changed, 29 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index f48f1f1a1fa7..96e3f9327044 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2437,13 +2437,13 @@ EXPORT_SYMBOL(drm_edid_duplicate);
>   
>   /**
>    * edid_get_quirks - return quirk flags for a given EDID
> - * @edid: EDID to process
> + * @drm_edid: EDID to process
>    *
>    * This tells subsequent routines what fixes they need to apply.
>    */
> -static u32 edid_get_quirks(const struct edid *edid)
> +static u32 edid_get_quirks(const struct drm_edid *drm_edid)
>   {
> -	u32 panel_id = edid_extract_panel_id(edid);
> +	u32 panel_id = edid_extract_panel_id(drm_edid->edid);
>   	const struct edid_quirk *quirk;
>   	int i;
>   
> @@ -5466,7 +5466,7 @@ static void drm_parse_microsoft_vsdb(struct drm_connector *connector,
>   }
>   
>   static void drm_parse_cea_ext(struct drm_connector *connector,
> -			      const struct edid *edid)
> +			      const struct drm_edid *drm_edid)
>   {
>   	struct drm_display_info *info = &connector->display_info;
>   	struct drm_edid_iter edid_iter;
> @@ -5474,7 +5474,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>   	struct cea_db_iter iter;
>   	const u8 *edid_ext;
>   
> -	drm_edid_iter_begin(edid, &edid_iter);
> +	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
>   	drm_edid_iter_for_each(edid_ext, &edid_iter) {
>   		if (edid_ext[0] != CEA_EXT)
>   			continue;
> @@ -5495,7 +5495,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>   	}
>   	drm_edid_iter_end(&edid_iter);
>   
> -	cea_db_iter_edid_begin(edid, &iter);
> +	cea_db_iter_edid_begin(drm_edid->edid, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		/* FIXME: convert parsers to use struct cea_db */
>   		const u8 *data = (const u8 *)db;
> @@ -5541,16 +5541,15 @@ void get_monitor_range(const struct detailed_timing *timing,
>   	monitor_range->max_vfreq = range->max_vfreq;
>   }
>   
> -static
> -void drm_get_monitor_range(struct drm_connector *connector,
> -			   const struct edid *edid)
> +static void drm_get_monitor_range(struct drm_connector *connector,
> +				  const struct drm_edid *drm_edid)
>   {
>   	struct drm_display_info *info = &connector->display_info;
>   
> -	if (!version_greater(edid, 1, 1))
> +	if (!version_greater(drm_edid->edid, 1, 1))
>   		return;
>   
> -	drm_for_each_detailed_block(edid, get_monitor_range,
> +	drm_for_each_detailed_block(drm_edid->edid, get_monitor_range,
>   				    &info->monitor_range);
>   
>   	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
> @@ -5610,12 +5609,13 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>   		    info->mso_stream_count, info->mso_pixel_overlap);
>   }
>   
> -static void drm_update_mso(struct drm_connector *connector, const struct edid *edid)
> +static void drm_update_mso(struct drm_connector *connector,
> +			   const struct drm_edid *drm_edid)
>   {
>   	const struct displayid_block *block;
>   	struct displayid_iter iter;
>   
> -	displayid_iter_edid_begin(edid, &iter);
> +	displayid_iter_edid_begin(drm_edid->edid, &iter);
>   	displayid_iter_for_each(block, &iter) {
>   		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
>   			drm_parse_vesa_mso_data(connector, block);
> @@ -5654,18 +5654,20 @@ drm_reset_display_info(struct drm_connector *connector)
>   	info->mso_pixel_overlap = 0;
>   }
>   
> -u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
> +static u32 update_display_info(struct drm_connector *connector,
> +			       const struct drm_edid *drm_edid)
>   {
>   	struct drm_display_info *info = &connector->display_info;
> +	const struct edid *edid = drm_edid->edid;
>   
> -	u32 quirks = edid_get_quirks(edid);
> +	u32 quirks = edid_get_quirks(drm_edid);
>   
>   	drm_reset_display_info(connector);
>   
>   	info->width_mm = edid->width_cm * 10;
>   	info->height_mm = edid->height_cm * 10;
>   
> -	drm_get_monitor_range(connector, edid);
> +	drm_get_monitor_range(connector, drm_edid);
>   
>   	if (edid->revision < 3)
>   		goto out;
> @@ -5674,7 +5676,7 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>   		goto out;
>   
>   	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
> -	drm_parse_cea_ext(connector, edid);
> +	drm_parse_cea_ext(connector, drm_edid);
>   
>   	/*
>   	 * Digital sink with "DFP 1.x compliant TMDS" according to EDID 1.3?
> @@ -5727,7 +5729,7 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>   	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
>   		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
>   
> -	drm_update_mso(connector, edid);
> +	drm_update_mso(connector, drm_edid);
>   
>   out:
>   	if (quirks & EDID_QUIRK_NON_DESKTOP) {
> @@ -5739,6 +5741,14 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>   	return quirks;
>   }
>   
> +u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
> +{
> +	struct drm_edid drm_edid;
> +
> +	return update_display_info(connector,
> +				   drm_edid_legacy_init(&drm_edid, edid));
> +}
> +
>   static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
>   							    struct displayid_detailed_timings_1 *timings,
>   							    bool type_7)
> @@ -5851,7 +5861,7 @@ static int drm_edid_connector_update(struct drm_connector *connector,
>   	 * To avoid multiple parsing of same block, lets parse that map
>   	 * from sink info, before parsing CEA modes.
>   	 */
> -	quirks = drm_add_display_info(connector, edid);
> +	quirks = update_display_info(connector, drm_edid);
>   
>   	/* Depends on info->cea_rev set by drm_add_display_info() above */
>   	drm_edid_to_eld(connector, edid);

By mistake commented on older revision, pasting the same comment on V2:

Perhaps the comment above needs to be updated with update_display_info()

Patch looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

