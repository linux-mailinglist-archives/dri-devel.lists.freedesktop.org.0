Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702A45214D2
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 14:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995C310EE29;
	Tue, 10 May 2022 12:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F8C10EDCF;
 Tue, 10 May 2022 12:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652184488; x=1683720488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0dDx0GtZ/4DBFMCHTI+rtotmoLLHf6F0rCJuKKl8WAU=;
 b=SVmIodAt5jO/aLq/frx1jIdeHlKz+btusjJI0JDcgAsZd/XkCiWgffXD
 +6DRmkyBn5b13IN9XjT1WDVpTnhgSBdYHkOnWQ/zqGRBkWnZFlOsFLyMG
 Pbl+WW8jLyVk5SooOSZ3leHuCKcD+Sp7xunQ0fAPgUZ0CXSjmtlT6nG+k
 livRp1+1DfvjO60hmeUO5WmGEO0uDIXVAl7ZHT6w20sv7Cwn8RSfcEavw
 H/dHI/lutih7ATKZLUM9YVeuWh1c0ka+zZNKma0PGPQX4vJw/FXM5uJuX
 2v+xx6olBb4B1FbRQCqe5VAUTxLPhlVJZBhAXr3bej1AeEWiwV8c55LPY A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269489560"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="269489560"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 05:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="593475283"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga008.jf.intel.com with ESMTP; 10 May 2022 05:08:05 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 05:08:05 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 05:08:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 05:08:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 05:08:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMyhJzLORBC1po0JY/G2I4s8hfrkyU/Bn9p7WXZHqsO5PnbocjZlwjFEe9MORl6VVvmd48iAnfDiXgSuP7Xi7PCqdgpfkp09kwKn0fWR/6gww6h6076Fm9YW/wyH8J7XoHMs7pcOtNrQwyKNYtLzhSAEPhItgapVF5njCdLJKrii6RZxgiiGvng/OCFQi3mjiqGSzWMgKFkjGZUpkk/jjF6xX3wxhbI6iaOPieGyjMa4eXFHaZvclZeJSiqJgoFZu9g4tDEa3NwPWb83LMaGVWkdhR0gaBgF8UtUBUCo1vXHYXEwETx4UgQ7p3VzP8WjyBkAxcjSaZnvEG2EeQtcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4GabjnoLSs+ZsrJ2aKU9WqnWSDJYmjxIBWEplRZm58=;
 b=HYTj83wtvsi+mLY4VosRqROFvT0LvirYxBPLo/6u7IVxZZBJhaBWZVhTyfPjzpmhWJEb9VGX9/caBmvjOMIEkWDXsAFyI4q1Rz2S8aRPOWzvKzOybOwH6bNdtOZbEBbcJJZvPjbHZAmta5slHJT5fR2owu04Jl2VNRcfYE27iHY05t9QrVS7/MjHmGZCQjVOKpgju/Swx/g1mJ52ZzXgpsdl2MZsvKC9At9O4Fde/KDob843JzmLPcX6sZVvxidQy9jwd6UNpx4B9xeBVRa2fVvvsgFCUXePeUI5Nzvn9yopASOuKcgdQzhh87HzYxjm/AtNTiW/1yJw0+jUnD2zFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BN6PR11MB1937.namprd11.prod.outlook.com (2603:10b6:404:106::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 12:08:03 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 12:08:03 +0000
Message-ID: <37c63f45-1167-4237-5b30-a34d4e2157f3@intel.com>
Date: Tue, 10 May 2022 17:37:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 25/25] drm/edid: convert version_greater() to drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <f1835a86294b392d075570001ed9009a48352670.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <f1835a86294b392d075570001ed9009a48352670.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a637977-fb60-471f-4020-08da327dbb7b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1937:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB19378EA8C30452BB910DA911CEC99@BN6PR11MB1937.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7UTZXS24iqiqcZ3/HCru5jQG3u38YB8Da3TrfEfehQfyamURa5Gjduey+upx4tMFpkUhji0ZocEVK8A4SX4p6NG1lc7wwYx98Ou5sQ0DXhtD9wRzEZtwnZ2ixUkvFw80kUTF2IoMzq6sXEr84orOg1H3Hv1msaIlRFvcYFS4FPG/cqQAAQjnbD4xNccFFwoojJhJRm9nnVDdI4Z2CzkrMiJhvHOZgHyPAp047FqsQOPLENz9zi8NobUk4j/XHw/o/Yk73nXyRyquTZrqpy0PRePgPheUcI6D826KnbCHtevUGT3YN1egD5UZ8cioHTxDWV+6VBZNwBG1E9M4F1cAgvcfMF5dQC2aCHhA657ySyO1r6xlbLpxWrFBlPLgcF5d4KDFbjg71iDNk8s5Y+2kaX/Ak/bSDPccbABYief1lVTckb9IH9Hx326CAP6hl6r3q8Y1PoAa3bx6AOTREFy+9NgMxIwDDOaD/8lDNXw45h9EdLVj4dtSwYtWtSvhc3Qbe3qRZSUJqBL63Xmh4AKpchc0juaO+u98t7e+EoHeLVsRRqb+puNeNM9IOT5f3LLMf/COiyzctyxvi4j/rjKH8TMTvFby+ILGtFx2dKMOlIUNvhahGRtRmmheG04nKqvOyguLFC/3x5DSle+ZwCVRyx2t6ymChRfvqPpvb4JcqAzanPC2gkrhL9W86fKg9BuLmIeSXHFF9za18YfHlWvHNaeNnuHxyUbx4Ueraohv6z0JNWXZDPpAIK+noJbFGUZezvuZbpJII5Wyn4sMiu2f6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(8936002)(2616005)(38100700002)(6486002)(186003)(86362001)(83380400001)(508600001)(82960400001)(6512007)(53546011)(55236004)(26005)(6506007)(6666004)(316002)(2906002)(36756003)(66476007)(66556008)(66946007)(8676002)(4326008)(450100002)(5660300002)(31686004)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUh3cEcrc1hjVmNFek9iVFhtemRXMVVCVmNscXBJSk1qaVBkcWt4dnFzYkNB?=
 =?utf-8?B?Q3ZpTnpkMEJacjE1L25LN0F5c05NcW9ZYm5lUU4zaWpvM3dOdVdFbmhLSWlz?=
 =?utf-8?B?cTBoNCtEWmNpaHpWbzlWejcvdWpBb0dVZ3FYN2d1aXMzNjZwelZNdDgzdllZ?=
 =?utf-8?B?bG5sSmtBaTJVamF6UXlsWm9Pa1k0U0N4R254UzFUUzNoM1F3TkdqODRWVW1t?=
 =?utf-8?B?aG9kZ1JKUDRSUnQ5YjRTem0xM0xuWlpybGpFaTQ5NE9JWDVzM3JVdENBdFZo?=
 =?utf-8?B?a3Q4UktnVTZoTDN1OExNNnpIbDM5R2NIZFYyT0RrNDE4MExCa1BXZnRMN0Jj?=
 =?utf-8?B?QXpHQ1lkZkJRSVdySS9QRnp1Y2dnb0puUG5HNHpSNzBieGFDNEhPcXNHeU8z?=
 =?utf-8?B?WXJrd0RQV1B3VVo3ckQwQWp0ZzJkbURjNFh2a2R1Mk5kZmw2WXVkQS9Vc2dR?=
 =?utf-8?B?bTJuSTZnV3BEbU5jYWxZTFJzWmVibzB5K1BhcmlpVHVSMTkrbGM2VVRSeUdO?=
 =?utf-8?B?WTNsNmlJdWZyYUROTy9wM0Z5QitWMTN1alM5YVQvL09QZlZCWldKbkgrUWZE?=
 =?utf-8?B?R1R4NUhwanQzaTRxU0lYSXY4bEwwZURsZTQ0Y3cyUE1zVzFrL2wwVTNLMHFW?=
 =?utf-8?B?bHJ4N0xXY2tFVExPemlXUTA3S1ZZMVFZRjB3RjlwRzNKcHJVcGlUSzFBUWFz?=
 =?utf-8?B?T3k4b0lOcXNRL2FUcXppcUtxVzJ5NU90UXhnU1lrS1pSZ3VkU1FYS1BEU1VC?=
 =?utf-8?B?ZXhaazRYUnc5cHR6WERlbVI0TnlEc2FVWVRDVTZET3A2ZjVsbTlCWk5Qa0lo?=
 =?utf-8?B?RTZHTzU3bmtOOUxCMDBGNTNxYUlGWU9GRE0wTDNKNXM5UHpVU0lQbndMQjQ5?=
 =?utf-8?B?NWN2RnRHNmxuYnROMUQ1blFkTHBCdW5iWWhGbFpUb2tVZzJydXRodkgzVVB0?=
 =?utf-8?B?cWVKcHQ3ZTUyVDI5V3ltL0pIN2N4QXhpZWFZcnhBbU55NHN4UGhRMVRSY1Jm?=
 =?utf-8?B?SjI2YW1YM0RaVzBIVTN0Zm9OcjZsMVNXb3J5TUU0K3R5cTR0R3FGYThHYWVJ?=
 =?utf-8?B?ODZkODVSV1hmbk1idmdWYWJMWkN4VmNPMmExdVlmQy95azhnbDA2S2hGWVpn?=
 =?utf-8?B?aU9HV0Ixd3hrMU4zMEhmdnRzeEN1MlhPQ09JNEdLdFRlLzBzclBRT1o0dlcw?=
 =?utf-8?B?TEVVb0RLOXBzU21xMlRIeGFQNVZleDdZZjUrb3kxRjhxVlRYeFpYaXZaZHVE?=
 =?utf-8?B?R1pycTROWmEyZ0J0SzhYaDBWT0w0bTBSTksxeEZDdEZweUdlOXpXTndKalF0?=
 =?utf-8?B?UkNMSzE2a2oza0xBdjdtZUV0Tk5RMitOall4Z00xN3FnUG1IRTVWSUMySmZL?=
 =?utf-8?B?cmhNS0tBQ3dvZi9NcURKdFNBMVFGNlpYK29ERnJyd25NRmtGRnJTdENXbmlp?=
 =?utf-8?B?MTF6aURUaEpPek11V2d6R1pGdm5aRkZFbzlTNVNDY0Qwa2dPNXVtbUJwdk51?=
 =?utf-8?B?TlErZ0oyUkx0RDZxZWlsQStwbmZwWk92VzRFZjJIek0rclVMZDR5bG1LZCtS?=
 =?utf-8?B?SmtKL2hWVWQwN1V5a2E0b3UxRkFCcGZDUDR4N3hGVElGMjE5cU1MYm9WMEFI?=
 =?utf-8?B?VkRiK3NGMmZKTkJkdW9HdkphUFRKZFhoaUlFZ2NwcFNESENNVFNXVWRjRHJZ?=
 =?utf-8?B?STBIWDNFTzA3MkJlQUFSMXhXNkVqUnFCM2lrem85TVV0UDRJMVdWZWZobll4?=
 =?utf-8?B?dXkwR29GVlRRaHNHZDloYmFGQ1o1REhiTllNSFdNT1ZESjNRVHRLMVUvOXYz?=
 =?utf-8?B?UmRpYzNBeEkya1hoaTZKTmlZb3RMSlk0ZDNmaEU5YUVKTkd5bkxLOU9peDFU?=
 =?utf-8?B?NTRTMTVVdDVUbDRSR0dOSVFQaGpRWjlKOGhlSjhJdTU1V3cyc3pNRlpLc0pV?=
 =?utf-8?B?Rlp1alUycHdoaW92Mk5HTU9hY0VzbnlVbjRZZEQyNnNXTEE0MzJGNk1yS1kx?=
 =?utf-8?B?Z3dQV05QbDhnTUVpUUVDcC9RZVVBRFpuL1JVbHFEaHRkRU13Yjd3cmUxQmJm?=
 =?utf-8?B?RFZoUzdTVGxQeFpQS1BmQ2t4eWVyWXNLRWROekNNcmlpNGxxUVJ4dWdMaE1k?=
 =?utf-8?B?Q3NwbE8wVUI2eWdOVFBvMDRGcGIvN1NyOFh3VWR6RVd4QUwrWGtyYVlDV3Fi?=
 =?utf-8?B?ZW5XeW5WdlIwRHJNUWlzWEMwNFo4U2haUnBHZ095WURnTkhCY1dNR0ZSTHBI?=
 =?utf-8?B?c2ErWjZINnE0alpiSE9LZkZIL0dWS3VXSTJKaVdyeEVjNFFqVUdmdnNjU3FH?=
 =?utf-8?B?Q0MrUzRnUjRHQkVoMktWVlpTbnoyNW5TWHl0R1ozUjA1S0JtZ1RDYmkxd05V?=
 =?utf-8?Q?3wUp9Ey8t7DMk4s4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a637977-fb60-471f-4020-08da327dbb7b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 12:08:03.0156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WK2CSEuriPiHU4XRmoRU15fKU8NQ3g5KLb3+/3HUIWXvXB0QSjK0PAO3Evhp9yHMKLaKUtxQYGdB6BPXOD+Z0+AA39itjwP3nkdDsUGmPZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1937
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

LGTM

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere. Also make version_greater()
> a function for type safety.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 29 +++++++++++++++++------------
>   1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index a44818f44718..429078bcf372 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -45,10 +45,6 @@
>   
>   #include "drm_crtc_internal.h"
>   
> -#define version_greater(edid, maj, min) \
> -	(((edid)->version > (maj)) || \
> -	 ((edid)->version == (maj) && (edid)->revision > (min)))
> -
>   static int oui(u8 first, u8 second, u8 third)
>   {
>   	return (first << 16) | (second << 8) | third;
> @@ -1576,6 +1572,15 @@ struct drm_edid {
>   	const struct edid *edid;
>   };
>   
> +static bool version_greater(const struct drm_edid *drm_edid,
> +			    u8 version, u8 revision)
> +{
> +	const struct edid *edid = drm_edid->edid;
> +
> +	return edid->version > version ||
> +		(edid->version == version && edid->revision > revision);
> +}
> +
>   static int edid_extension_block_count(const struct edid *edid)
>   {
>   	return edid->extensions;
> @@ -3232,7 +3237,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
>   						  closure->drm_edid,
>   						  timing);
>   
> -	if (!version_greater(closure->drm_edid->edid, 1, 1))
> +	if (!version_greater(closure->drm_edid, 1, 1))
>   		return; /* GTF not defined yet */
>   
>   	switch (range->flags) {
> @@ -3243,7 +3248,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
>   							  timing);
>   		break;
>   	case 0x04: /* cvt, only in 1.4+ */
> -		if (!version_greater(closure->drm_edid->edid, 1, 3))
> +		if (!version_greater(closure->drm_edid, 1, 3))
>   			break;
>   
>   		closure->modes += drm_cvt_modes_for_range(closure->connector,
> @@ -3264,7 +3269,7 @@ static int add_inferred_modes(struct drm_connector *connector,
>   		.drm_edid = drm_edid,
>   	};
>   
> -	if (version_greater(drm_edid->edid, 1, 0))
> +	if (version_greater(drm_edid, 1, 0))
>   		drm_for_each_detailed_block(drm_edid, do_inferred_modes, &closure);
>   
>   	return closure.modes;
> @@ -3341,7 +3346,7 @@ static int add_established_modes(struct drm_connector *connector,
>   		}
>   	}
>   
> -	if (version_greater(edid, 1, 0))
> +	if (version_greater(drm_edid, 1, 0))
>   		drm_for_each_detailed_block(drm_edid, do_established_modes,
>   					    &closure);
>   
> @@ -3396,7 +3401,7 @@ static int add_standard_modes(struct drm_connector *connector,
>   		}
>   	}
>   
> -	if (version_greater(drm_edid->edid, 1, 0))
> +	if (version_greater(drm_edid, 1, 0))
>   		drm_for_each_detailed_block(drm_edid, do_standard_modes,
>   					    &closure);
>   
> @@ -3476,7 +3481,7 @@ add_cvt_modes(struct drm_connector *connector, const struct drm_edid *drm_edid)
>   		.drm_edid = drm_edid,
>   	};
>   
> -	if (version_greater(drm_edid->edid, 1, 2))
> +	if (version_greater(drm_edid, 1, 2))
>   		drm_for_each_detailed_block(drm_edid, do_cvt_mode, &closure);
>   
>   	/* XXX should also look for CVT codes in VTB blocks */
> @@ -3532,7 +3537,7 @@ static int add_detailed_modes(struct drm_connector *connector,
>   		.quirks = quirks,
>   	};
>   
> -	if (closure.preferred && !version_greater(drm_edid->edid, 1, 3))
> +	if (closure.preferred && !version_greater(drm_edid, 1, 3))
>   		closure.preferred =
>   		    (drm_edid->edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
>   
> @@ -5591,7 +5596,7 @@ static void drm_get_monitor_range(struct drm_connector *connector,
>   {
>   	struct drm_display_info *info = &connector->display_info;
>   
> -	if (!version_greater(drm_edid->edid, 1, 1))
> +	if (!version_greater(drm_edid, 1, 1))
>   		return;
>   
>   	drm_for_each_detailed_block(drm_edid, get_monitor_range,
