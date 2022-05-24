Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB4532B4E
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 15:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3D910E5C1;
	Tue, 24 May 2022 13:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E04710E3E3;
 Tue, 24 May 2022 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653398976; x=1684934976;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MDDynsYZYKVdk0LpPiZco/AQ5HdOzg9iXbKXoht01IE=;
 b=Q/qOnFPXNOlaaf+LL2Qfxyif6bc8qYFxF5aET2+kutiGZqCiLpP/0Nkj
 kpCkXLfbAWJ3aXqabqMJ9omHmzsvOQq3QZE5B3C0imntQ+5FgNDhwd0Rt
 OExrRiRqmieFLfDPOlwhrQyeowsrRnAEX31mQnuR3hQ96jWRbnzOq2Ksz
 2znuB3cQV8hpuo5PoTE9TVEYY3IaBl2fpHW6Bi2M6yoz5TLKgwqsfxsBx
 ikw1e0Q50Z/8qpR9MzVu+8SL7aMmxQ59RuKhTeQJxE1rwpsO6LtcDgwU1
 brF9vOyq5plYoAvMrCMqCy5u9Kue6pLGh4RHw+NkXaQOlC68NWknmZGAW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="336582796"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="336582796"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 06:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="717170652"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga001.fm.intel.com with ESMTP; 24 May 2022 06:29:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 24 May 2022 06:29:21 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 24 May 2022 06:29:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 24 May 2022 06:29:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 24 May 2022 06:29:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEuUW6/yRNsIjmbN0b3C+AXtF5vCnHsiV/n2aR7RaQIiJWuXjygWu2gOeJcwzA85Pa/nKCKFQRmX294skncg2fZvyLtzFbhplkVF+cF9wAxdwNmVI8Z2Hrdrqelfm3UUP/Qjq/EdRzLXgh8CJMfZRDPpB7qq1YKvTlWDWihD4gTT/xJVe3ANIA0iaNBqztK4Zdx2AISc819hA+BabH/nwkMPSAu4ZXXJBfrdYmgxagO8BPzmP3q8HdHlNmYoAxd21p1CMY14JO2N77BgM00mONcEOmLq4j7rRKTmxzwOV8Ch5rasG894qFljqv0MS0gNznthSwdcjOga/a/6M27z2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0daA6uQSLzAUJqkdivNqpQ7mTsJnZcWP8iksib94mQ=;
 b=LzBPTUtpcviBCiEfG8s+HS4yj7jwuasgnLMcixo+IULvtGzXKQ0LyCEBE+n+XuQL/4WmetK5SU+i/YavoMKdvwPPuG5Vv59+WJr8jkj63cdOJ1xGUrdHPzSBEDkDb7HEwApQxKqTwWqAXjHhbgzWJP0VwFd0JMD5RNEC14h+DMLb8AkblsgBmcaZrbXK4h61RWMH8IorX4/1FdTKyt/fZgrIns63tcjqVHnlsMqcTSx1pDHgNdC3Z5X5Cjy3vpQfVDFhP/mBCfwOks738gajEaaRpcDS56vdJnNwV/bluj50VSIJDZU8OmsXuPCh1Pa9A7TFxdPXQe8qekjJfmTxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 CY4PR11MB1767.namprd11.prod.outlook.com (2603:10b6:903:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Tue, 24 May
 2022 13:29:19 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1079:a2cc:665e:f397]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1079:a2cc:665e:f397%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 13:29:19 +0000
Message-ID: <14a7a41a-35bb-000b-b3cf-fbc4071413c8@intel.com>
Date: Tue, 24 May 2022 15:29:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v1 01/13] drm/edid: add block count and data
 helper functions for drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
References: <cover.1653381821.git.jani.nikula@intel.com>
 <a08352924ad49a32213d8979d43d480f3f7b4a11.1653381821.git.jani.nikula@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <a08352924ad49a32213d8979d43d480f3f7b4a11.1653381821.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0062.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::39) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f444c170-c571-4f25-8e63-08da3d8967bc
X-MS-TrafficTypeDiagnostic: CY4PR11MB1767:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR11MB17670E72CC4B8675DF0BCCE7EBD79@CY4PR11MB1767.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AIDqbm2IKd/+CrJ1SnGl+QPCkP7VvPIxuEbjO9bKpW/eD5/lvhYPhIKkVyPph7by5ChjZBPoQT502wvdolm8PEzndkuBfA+SoVDCbZxouvDX+W2sghBRKBVIBaxVC0x0VXAtL5l5ZmvZpVhyCcYNJ6z9xqE1ZD8eTMLOb9r3YEh+KbEv3NUw/dWWgn0xQ3CjRX4xWWqeg2VPb+cnYS0VTdHA75mkk5EjHv9V/bE6uX8Oi2MRSGV2YimOAMrz7h5jObtCYQgJeU7FWoTuTtL6RkGcTTzP5/VFjPEotk1nV03PejM/YqKCY9i/BPro+9Zfdf87qOZry0vE16N6qN+U7b/mlJ30bR8jnkf2MeKI/jE0STR5xSd7jpAOvxKEIda18dN+Mc0YuC8TJYhyS6NBht0XezsgV+0CwmhWGt3th5qky0n5/f1GPvf15uPa9OptYNXUIPJtSY3DJhe//oKzry1RTwa7vjd6hftCNp3+T8C1y0Z4mEMcq6FQPFHJOXDfmqq3DJXKNDW2w8WxolcDM/nQdnVb3T0zEhtSMTOlR6WzbIUWzb9/eVea2Sxx7T9XOnsLnOQd6MH7Gj7KIBwXfl92HL1q1fsLuDAXYHSRTHaWh+lpi98ZOZxOcGLRRbere/vnM8IhfSh27+0uj9P/TOW5JVbx5mf3kfTebZ41WhTmtyNiUVb7wlrKpHMzhgVzhG9y5qneNOvYcN/X6tXT06nd+e2BlelnRxCQ3nAcMkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(450100002)(86362001)(6506007)(66476007)(66946007)(8676002)(31696002)(66556008)(316002)(6486002)(508600001)(2616005)(38100700002)(8936002)(6666004)(5660300002)(31686004)(186003)(2906002)(82960400001)(26005)(36916002)(36756003)(53546011)(6512007)(83380400001)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnZZaEFONUJXM1JHSVFBRjI5T1JBYVl0VDQ0eHBNU1dCNGJZQjJhNFFWa0Nl?=
 =?utf-8?B?Q2c2YjJRazZsbFBaVFBkUEJnYkZQTGFGT29VVkN0N3VKOFNGMUd3M0xHc3Z1?=
 =?utf-8?B?Sno4K0JBMEZod3pRdjBPaDFjbWVRMml4NFJZbDl5bEZRam1qV29KM3krTXFt?=
 =?utf-8?B?TzFNdnV1cXlUM1VDdjZIdkJmeC9acjBpQm92TGdZeG5NdDVPdzA3d1Jka3hs?=
 =?utf-8?B?MnhhSDlXM0dsYTREMzhvbG13SHEyWGVSYk53emNIZjVxb2o3V2M2YkNMVjE0?=
 =?utf-8?B?QWYyeUc4NFlDV1ZZb2xGZThHZ2VwQTNQRHFUZm90amxya1FaYVdhMUE4cmpE?=
 =?utf-8?B?K1E1TzdGcXAvUjVpQ0tQL0huZW9UQmhlKzJoalpWTzh5cmhYYlZYN0h1Tzlp?=
 =?utf-8?B?R2tlZVBCYURIejdTSFRpNWtKYjZ1bVRidWFhSGo2VkVpVXhNLzNiQ3lhQzNV?=
 =?utf-8?B?WkRGVy9NTWRab2tZZm1NbldabThheUVzMDFDK2Y3WTdMcE10ZDhFc3puQmNm?=
 =?utf-8?B?c0FYbHZnL0owck5IMnhoNWx0aGVFTHJTdzd4SVpnSVVLTmhhR1VQL1k0dVNh?=
 =?utf-8?B?WEVUZC9UT2ExMDRER1EySzNVYzg5VlNsOXY4SENGRWt6SG9tN0padkMvQWJO?=
 =?utf-8?B?Tzd3OGdGY1ZlTFE1QktOMlIwK2pFTjNHT2R4Qm5hczZjcmx0T3BFQnNyVGll?=
 =?utf-8?B?QjI2VDVkTWNlSVNsUmVwV2s5SjJNSzJSa1ZJaWxnV3ZzbVhnOExyb3VUNHM1?=
 =?utf-8?B?QjZLT1lpTUpLT2kzaVhoaWVFLzhHaDRXYmRTQ041aEZmUStpTXVHR0NpaVRE?=
 =?utf-8?B?Q0QzMXdXdk1oNEcyVGp3TE5NZ2RGT3NyYTdQR1U4N2NVY25RRllTaUtiTklE?=
 =?utf-8?B?YXRJUkF1Vlg2N1poRXdPeVU4cEZsOXBzM01kYlhVOEFFM3U1VEhZVnUwWjRY?=
 =?utf-8?B?ejhhZTNDNUx2V3REU0QxOGY4TjU2OG5qUnB2UzdaMG13TnY0S09YSFIyZ3NL?=
 =?utf-8?B?ZEZzQUFvV2V0ZXJLVUVSbjk0eHM2dS81VEJrQktEbW9sdHA4VVc0RHJ3c0ZU?=
 =?utf-8?B?bDIwZDZKSkd4Vm9wangvMWJVTFlMYi9YNGU4b0NlL0V3cHoxTGVxdzlDREl6?=
 =?utf-8?B?SjdFbG9PekxvK1dyQ0IxckpQeWEwcUswWEJPTWt6dHJjSHNjMDMxT0ZBTTlv?=
 =?utf-8?B?UlBaTlFlOCsxdmVoUXFsRG1WZllhZWNmWHgwWUdEUS9tMGUyUTYrdENQNUpq?=
 =?utf-8?B?VWVLVU01SXhjT3doNVV6TlBvRDV0d0EralcyL0M4Y1hxQjdJSG5iYmVpQ0lT?=
 =?utf-8?B?bTVnYW0xdkU3ZEh5OGQ5dzZaRnJCdkF1aGZTeXVrUFN0NEx5b2hTQ1VDd0o0?=
 =?utf-8?B?YXV6LzJjVzlteU56VEFyNG1DTThUK2VhUUpmSjJtNFN0UjBUMWZ3cGF2Mmlh?=
 =?utf-8?B?dzZibGtxck9lK0lWcFpoaGJ0MWJSTEZYSHBuODVta0dHK2hhR2RxZlpOQTdl?=
 =?utf-8?B?VjZSTzV2bGdLSDBBdWo5djlLM04rcFB0TnhHUEZ2QWlkZkJSS0V4eXRXZ2V1?=
 =?utf-8?B?WW5LS1lKME53dXQveHRuaFRyRFN2SUdPakttRzM2aWs3N1lOQTE0UFkvc3Rr?=
 =?utf-8?B?bzBKRDhMa1FndE9IdkxNQ3luaTg2M3g3eUo3dW10dkQxaWpzRWtCdGpZQXJN?=
 =?utf-8?B?TUk5a09kWTVkeWMzaG9iS3NSZC83dUU5SVk3OUExY2JCWldHalkwTitlQ3RF?=
 =?utf-8?B?OW14SDd5K0JCUlhBaW1hK2IxeGNwZWpGZWg1eVdSckdUV1RkZWJJK2ZFbnV3?=
 =?utf-8?B?UlFrdmlrZk1iSkNsS01oa0hEeTFWNVJhRUl2VTU3RXAvTWVOd25qK2R6c3Iw?=
 =?utf-8?B?ZUFUQVBRa3FrcFVIc1BoSi9Qbkx0U1hzNmpJNlBhUFlUOHRWSFVqcmVrdm9B?=
 =?utf-8?B?SWRRa3R4eWNyQUx0c2Y0Y29PRmJuMThzaVAxWnFVS01EckNhc0crZVVkaWc4?=
 =?utf-8?B?empwQWdsNmFyQUMyT042WDdNOGJESmZmL2hFQmR3NXhCWDQxL1graWRLaFRJ?=
 =?utf-8?B?SEF2U2hFQXVZNU0yekgzT3BHem5HVEp5aHNyUWxkZTJ5azNYWFNhbDNNcGVn?=
 =?utf-8?B?Q0RyMC9uMnJZSzFFa0pNamdRaFZpUE1RWXkwb2FCUzRlUGF3QWU0SGJrZ3Fm?=
 =?utf-8?B?UGRaWWp0dmkxTmhPeGwzejAvQmNmSk9XVHZ2b3B1aW5zOU1xNGhVRnRLeXFP?=
 =?utf-8?B?akFhckM3aTNVNUs2ZkFNaDZYTC9KQzg2N1dGTjZEdFhwTWtMVGovQXhGMHhK?=
 =?utf-8?B?UjdwcmFHVHFVWVplUkVUTjEyUGZuL1ZsSmtFOWZ3alF3dC9lbVpzT2dTeEpo?=
 =?utf-8?Q?bSgocBhqqu1Kl9dM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f444c170-c571-4f25-8e63-08da3d8967bc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 13:29:18.9383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcWE8SsXEMev3urVsp9F7B0bEsafbPiRbfFBg9teoymMUG5Esx+I1APHQ8UbMPa33Hp5EAlP+Yfoh7qkUqHEdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1767
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

On 24.05.2022 12:39, Jani Nikula wrote:
> Add drm_edid based block count and data access helper functions that
> take the EDID allocated size into account.
> 
> At the moment, the allocated size should always match the EDID size
> indicated by the extension count, but this will change in the future.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 42 +++++++++++++++++++++++++++++++-------
>   1 file changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 929fc0e46751..682d954a9e42 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1613,6 +1613,35 @@ static const void *edid_extension_block_data(const struct edid *edid, int index)
>   	return edid_block_data(edid, index + 1);
>   }
>   
> +static int drm_edid_block_count(const struct drm_edid *drm_edid)
> +{
> +	int num_blocks;
> +
> +	/* Starting point */
> +	num_blocks = edid_block_count(drm_edid->edid);
> +
> +	/* Limit by allocated size */
> +	num_blocks = min(num_blocks, (int)drm_edid->size / EDID_LENGTH);
> +
> +	return num_blocks;
> +}
> +
> +static int drm_edid_extension_block_count(const struct drm_edid *drm_edid)
> +{
> +	return drm_edid_block_count(drm_edid) - 1;
> +}
> +
> +static const void *drm_edid_block_data(const struct drm_edid *drm_edid, int index)
> +{
> +	return edid_block_data(drm_edid->edid, index);
> +}
> +
> +static const void *drm_edid_extension_block_data(const struct drm_edid *drm_edid,
> +						 int index)
> +{
> +	return edid_extension_block_data(drm_edid->edid, index);
> +}
> +
>   /*
>    * Initializer helper for legacy interfaces, where we have no choice but to
>    * trust edid size. Not for general purpose use.
> @@ -1665,8 +1694,8 @@ static const void *__drm_edid_iter_next(struct drm_edid_iter *iter)
>   	if (!iter->drm_edid)
>   		return NULL;
>   
> -	if (iter->index < edid_block_count(iter->drm_edid->edid))
> -		block = edid_block_data(iter->drm_edid->edid, iter->index++);
> +	if (iter->index < drm_edid_block_count(iter->drm_edid))
> +		block = drm_edid_block_data(iter->drm_edid, iter->index++);
>   
>   	return block;
>   }
> @@ -3574,22 +3603,21 @@ static int add_detailed_modes(struct drm_connector *connector,
>   const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>   				  int ext_id, int *ext_index)
>   {
> -	const struct edid *edid = drm_edid ? drm_edid->edid : NULL;

Do we still need this var?


>   	const u8 *edid_ext = NULL;
>   	int i;
>   
>   	/* No EDID or EDID extensions */
> -	if (!edid || !edid_extension_block_count(edid))
> +	if (!drm_edid || !drm_edid_extension_block_count(drm_edid))
>   		return NULL;
>   
>   	/* Find CEA extension */
> -	for (i = *ext_index; i < edid_extension_block_count(edid); i++) {
> -		edid_ext = edid_extension_block_data(edid, i);
> +	for (i = *ext_index; i < drm_edid_extension_block_count(drm_edid); i++) {
> +		edid_ext = drm_edid_extension_block_data(drm_edid, i);
>   		if (edid_block_tag(edid_ext) == ext_id)
>   			break;
>   	}
>   
> -	if (i >= edid_extension_block_count(edid))
> +	if (i >= drm_edid_extension_block_count(drm_edid))
>   		return NULL;
>   
>   	*ext_index = i + 1;

It looks OK. Some suggestions to consider:
1. While at it, refactor little bit the code to return ext from 'for' 
loop and NULL later (to kill after-loop checks, and better code IMO).
2. Implement kind of iterator, for example 
drm_edid_extension_block_next(drm_edid, edid_ext), then use loop:
for (edid_ext = NULL; edid_ext = drm_edid_extension_block_next(drm_edid, 
edid_ext;)
	...

Up to you.
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

