Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1632755B84E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 09:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85A98902A;
	Mon, 27 Jun 2022 07:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EFA10F9F3;
 Mon, 27 Jun 2022 07:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656315830; x=1687851830;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VbqTIRp2K9IwZgeAgxKCJzQtMJYkA0njCRCiu+yP7Vc=;
 b=gH3q7piPPwyYcn/TXpNw7FZ6rHsJfRkqVvyCBGZgPfSB5ST6e+oZecw+
 8klOxoDbwsVNcVTKQxoSe5fgObE5fGF8lDztrmtpJ9wttIzkWls7Th66g
 vF4llvE251pUsROlMaI9aqvHRZ8XtL79FVMde9k5wE+9NtNLaZbFXenNw
 TV10bCI45MVrQzs79aa5fPx2Xofn1NZFpCZKKXOLplNaxQdJbWmIuBX78
 E6f77txNf9WlmnHWgFuRyHEIQ+lVEY9acWSeDYhOEf6ar+uBGNR8Bl81l
 OP2kvOuaaHLBVkXMT1mu6IxJJUvYP1F/2D7nxB+6GByaN+1o/7jqC9tkt A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="306860416"
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; d="scan'208";a="306860416"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 00:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; d="scan'208";a="616704532"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 27 Jun 2022 00:43:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 00:43:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 00:43:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 00:43:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ke4aJ79/BObZe1oqZS+ONCbFn1gm3maqxownZKZ0+5B4aTiFrdlAlAezpq3/snyYB2PC/7XO3bIhlm2sGqSuae154SuyzLtI255eLoesH0v2zfDiwqTp/w+7iDTm0SSQzYj9WilVxJsvziJjJS4tJuh5PuS4eqUVGs6CjrEBYPyvQVdtdDT9wzyFX1JRRR3Dz+0REnoO7OAsDlYxqJ9Q4EqjR5iQNrasln5STH14ZMq/5VOeOreaTpCs07smc1akF8FS833x1nntpG901uaxeoOBW58hXVOABmAzYglA2W3GCJMzY90cdToW4YawBddPdYQJPVlHGTdX4fiQhfBD6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/olOGkz2FU4htsHEuglLsppWtNzwQ8FL1cnN7F2yDs=;
 b=mUg46BeK0Y6DtEUgsO2A1kI03gTxrDKIG5pTlztwOywh5o69pJ9ZF0Q2EL806V7tIAJuH/0dPuI9DKJtaeLas9ZT2fWwEwuKIA5WPDtTb81D4bEulkxyw8Dedoccnf77bzaQPTgT2wQsrjWRF5I+Kw3nVJYCWUc2QPCqMizS/i7n28BqS4wJtEXc9QgUQHHu/JdKJcbiTxiL2J6/jivF/o1FPNHrca3i6CITap2AQ5Rnki7bniJzed3Llo9NJat0joSDP59Vg8rr+yAxAMPqs9EKsiC9Pnq0uesiy2KRn5mTja+R4+N6fD5T+/cFHEERsPLY0aZSKgJ5FvQ7TpZPRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by BN7PR11MB2532.namprd11.prod.outlook.com (2603:10b6:406:b0::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 07:43:47 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::49da:18ae:2975:c398]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::49da:18ae:2975:c398%8]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 07:43:47 +0000
Message-ID: <144caa04-c492-7f59-aad4-7db79312afb9@intel.com>
Date: Mon, 27 Jun 2022 10:43:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/i915: tweak the ordering in cpu_write_needs_clflush
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220622155919.355081-1-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220622155919.355081-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::23) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c1b29cf-e3bb-4dbc-0e1b-08da5810c4d2
X-MS-TrafficTypeDiagnostic: BN7PR11MB2532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s8K5C4H5MUO5itm1vVT/PbFAQc6IJ4o8drvbJmTB6ToAhyKm40iedoMzzrs0XDNMVhY/bjiRbxaPGNdhmayBNyOwyJm1EjdQPWIvGmODB4YnT+lYkBDuiekGEnfNjBqX53+Q/OOAD8fEeQQmP7m6Ed4jJnZUFcZGCZIDDpDRaGfTgY2l67dravSeoWPcHlVRz8gK43adIpWZwMJARwn+bkHDQlQLUBNROvLTC7wWnlPiqluMo8nJBTrKAugBhrC2UVLUXaB3670sXfAYMOXiXwVUqgp7mkCngGccAGi9YZlq04NFh0mt31gw/gqK/01YlkBBymtHwlCT5y7MV+EVEM4AyhK/lCRlnsXCpp90C8a+L8y5zdMSOtn7KC8J0qjB2Jjt7tCrGNbM7fZdvkwvKmY1Fd8mp5PkIjuz8GHwWaZrqew2/Q+lUyeBHCUdK5M1dGxS7OPwUxkvDrrvtigeaIBGVILTpiUsjkQ+LcLgx46dUjFCiX1joEAjiwHH/FjW9Xgwh6OPISGoA5X9Vf1b9MNv3rUp4c8H4ugXT4SMj04P89qEKCr45rqgsjkjKySo8vAc1VfYs63pNArq5rtGJYSA9az/1aPqwkCgeY+kImLKxvmpSh7XZmnIfmLTG3rPGY+KLX1WbzuXoKAgGUVfUbi5OGLSihawSawdEuHnGj9xsci/Y57+e2cGXVWO5aoX0vbazk4ZQlBIpNlsN9xHBwOWuW3RMELjvBDiETpTIbBHUl+Br7kvnm23h6dNX0e2GDv4Q9/f8oiDmg1WOUNZSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(376002)(39860400002)(396003)(346002)(31696002)(82960400001)(53546011)(83380400001)(5660300002)(6512007)(186003)(38100700002)(26005)(2906002)(316002)(36756003)(66574015)(66556008)(6486002)(66946007)(41300700001)(478600001)(966005)(66476007)(4326008)(8676002)(2616005)(6506007)(31686004)(6666004)(8936002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnlPNmpLd2t2bjNnNkdoMVBnS0dkUm12MlVLVDhJcitBUmlQdnBzYW5NVVFz?=
 =?utf-8?B?RWtFVlNSc25oVWZxYlJPR0VwZDVMQVBnV295SFZ1Z2o0YXh4TnFJeVN1eGF3?=
 =?utf-8?B?TU81R1dVUnB5Wm80RUFaUXQraGgvUDI5OElYMFE2NlRqZVNkbVZjcFBLSmZ3?=
 =?utf-8?B?UUVEU1BmV1lQd3pLVTd0WGRMczFpWUNVTEs1ZFJ1T0VpcERjYWJ0clZvT1B6?=
 =?utf-8?B?YmQ3S2RoZVlLb3Y0bDVxanphV2huc3BsNzRKbVJDdTkzOU9OcmYzZHY2b21G?=
 =?utf-8?B?cHZxNDlsQVRxNzdtbmlxMjQ1NFFtVEhjYWlFdTV6bHZMbnB5aFlEcVJtMWJG?=
 =?utf-8?B?MThtTGF6QVExczQvNkNCemxjN0JiNkNGZEtqOGhadlh3RXdYbTZ6N00xZ2NI?=
 =?utf-8?B?WUw3VWVoU2lMNXZ0ZUtSSlhOT1o3RHFkbHJwNWNNS1dzTHpCMDBvRkdha09M?=
 =?utf-8?B?M1FHSmRXQXNySFA2ek5CMTNGTFZTaXpCTSs5UkIwMm9hdFN0czRHWmF4ZU50?=
 =?utf-8?B?TUkxaEhkbXFaazl5YjFDM2tmTkZCd3J1bmFWamN5SU5iK0t0Vm85a3U4djJJ?=
 =?utf-8?B?Z0NmNDlpRCtBQ0tHY3ZYb3FvSExVSjF4dTNpODN1ZTVwUG5WbFNjelVmaUh4?=
 =?utf-8?B?OWxuNXJLMnRqMzlJQkpkZWpLTElyTFdLKy9KMDIxbGw2Rys5YnNCc3hpcW1t?=
 =?utf-8?B?M2F1b1Q1emJzYktsQXhuUFNOaEtrQjFxV25TbEwzek9ySVRvS3NuTEU0WklP?=
 =?utf-8?B?bnJvWlFaVkdhZVVpakU5OWZhaW1FWk5kVERKeDJpOW1uSU1JTXpReE5yVW9I?=
 =?utf-8?B?Sjk4NXhRWEcrbzZaUnFOYWlZSGdrT0k3MVlVbjQvOWtKVU1TSEVPSjhQRE45?=
 =?utf-8?B?Z05XZFcvOS8za1NmZUNDUE5zckNhb1JjQlprZmNYMjY2aDJNMmt6YkNSd3RQ?=
 =?utf-8?B?YjJ1eHcvQkhQSUNYVnF0WC9RcnlTU1pneCtFUzVIT3VBbk9BL0QwK2V6NDhs?=
 =?utf-8?B?d0k5MHFZcWpuai8xQ01oa2RQUENoaWtUdy9mTzgxVnd0eDZKWTl3NkZxQTBN?=
 =?utf-8?B?OVJmTm1RQW9GWmxWb0gxcjQ5ckdnQjE3RlRGQndsV21Ic2ZQcXExU2JrdVZS?=
 =?utf-8?B?dmZmWElLZWF1TXczdUk1RnVpQVJoVGVZUWJTTWVaWTRldm85RW1SN0Njc1Zk?=
 =?utf-8?B?RGlqbUVTVitDNWdsanlNdXRSMWVTSlVOcklWQ0wyTm83bitDby9xeWFzUkMr?=
 =?utf-8?B?OHJZYktJbnFZSHJsSEhKY09IdDlIUjEzaEpidjl4L0NkRFV3NCs4eVFFSnNZ?=
 =?utf-8?B?b0VYMTBzLy9Zc3JMNnpZb0VwSFMrNmc4ODVTRHJwbUFsNTJzWUFMT3JvNGoy?=
 =?utf-8?B?dXJsSytwSk9QSllaL3FtakVUVmJCN2hjQ3p6RGhWcENSU0hrdUJPVWQ4VSto?=
 =?utf-8?B?OU1wSmkvcWVIK0pKQXVVdUM5d0IwY1RGNzVNZEhkN3NqS2FKTnVTWE5QcGNw?=
 =?utf-8?B?L01VVGkrS01aTHlHeGozQWxUbWVtcmNIMXRLalJPTnRhYy9xcGdUOEhwK1B2?=
 =?utf-8?B?UGdnSFRXa2pSQnU4bmFMbUt6TFlnMDl6MERvSytoNFFxVStsQ0dVZTlFTHI4?=
 =?utf-8?B?RWhUdUo3MFF2azFUL1FpVFcyblpkUVJWK1RIUlorK0xlZHJtR055ODEyeDRv?=
 =?utf-8?B?K3J2R0RIUzJuTkFBaWNEbGN2T2JCN3ZmZ3JMYTBPWmxYYVp4NnZ5eFpOZUVG?=
 =?utf-8?B?RWtnL3FCVGZFb1B1QWxrTEVWRnV0TmgxemUzd3RGU01Sc1BKVTRwNmZ0eEph?=
 =?utf-8?B?ekNCSDJIdEFDaXo5bW5UYWVObjVpaUJOeHM5Tmx4UnNFL3ZITDB5Yk9pbGRO?=
 =?utf-8?B?K1QzZWEvUjhxeUc0QURRQWZjeDBEYU5BWFREcUNEa2J4bzl1U0t3NGhhd2VO?=
 =?utf-8?B?R2k3VFVWSVhhOUl6b3BIVjlYRlYrU084cDVQM1JmeFF3eFhNS2xpZk8zY3Jk?=
 =?utf-8?B?WUM2MnBBQzhuZ1pCU1RlcGt2U3hIVFBqK3hlNjhTMmtBWGlJRlhpb1pFZ2Z4?=
 =?utf-8?B?TGtuYUlvRnN0Nk1lTzBwTGxZalJIOThPTC9DcDdEVnlBYStqeGdnQUlXVjYv?=
 =?utf-8?B?RzFoeUF6N2MxajdtN21mMkZOejJEbXpCTlkwSzJrbE03aDNSQnRLZytoODJX?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1b29cf-e3bb-4dbc-0e1b-08da5810c4d2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 07:43:47.4448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2Eo6ATnPcLiqBWp8VANgIW/s1rA7kt/IjFtqfYN4PRV4u6/tX2nImCkfO/CmarfKQdaMkRndmnOuDyQkxSlTzqXlDtsSz4MZPhjk71M7wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2532
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for fixing this issue.
Looks good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 6/22/22 6:59 PM, Matthew Auld wrote:
> For imported dma-buf objects we leave the object as cache_coherent = 0
> across all platforms, which is reasonable given that have no clue what
> the memory underneath is, and its not like the driver can ever manually
> clflush the pages anyway (like with i915_gem_clflush_object) for such
> objects. However on discrete we choose to treat cache_dirty = true as a
> programmer error, leading to a warning. The simplest fix looks to be to
> just change the ordering in cpu_write_needs_clflush to prevent ever
> setting cache_dirty for dma-buf objects on discrete.
> 
> Fixes: d028a7690d87 ("drm/i915/dmabuf: Fix prime_mmap to work when using LMEM")
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5266
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_domain.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index 3e5d6057b3ef..1674b0c5802b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -35,12 +35,12 @@ bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
>   	if (obj->cache_dirty)
>   		return false;
>   
> -	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE))
> -		return true;
> -
>   	if (IS_DGFX(i915))
>   		return false;
>   
> +	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE))
> +		return true;
> +
>   	/* Currently in use by HW (display engine)? Keep flushed. */
>   	return i915_gem_object_is_framebuffer(obj);
>   }
> 
