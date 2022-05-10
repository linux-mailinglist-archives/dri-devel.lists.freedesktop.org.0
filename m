Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5FE5210A4
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 11:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2A810E2BE;
	Tue, 10 May 2022 09:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECB610E2BE;
 Tue, 10 May 2022 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652174340; x=1683710340;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C53puuPRoMmpJo45JVUAOKS7xsMCmc04wnuEuFWGM2g=;
 b=DFZwtlkgPMTeyuwb+XgVV7+9CrF8frV5wkPFlvtbZ2SA7+fRZ9vBT7e4
 ZrKtSa01yPjHmDD+iMM06QhTr3gp4N/XN52zc7VIoBSJ3jhczo4pFAOtH
 BM1iCN3KW3cvpbu4bQoazn1ETCNc0sG8f49BJjYQH+D0RksQAf0L6br4Q
 Zy2lXwIefs9W5ejKFEPATzjFYwmzXvOdKtkWeAmBwawvxUL+PW5o8noLH
 3V+Gf+lZJNX0IK4w/s6bKj65WahaW5jJwIQhmGmArSrV6nAj0FeWY3tLM
 P1wSEyf7sFweJJzZlTq1cNs8uasvF+/NX+tIMh0sQo0b4KhY37vt2pzoS w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="332351820"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="332351820"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 02:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="696993028"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 10 May 2022 02:18:59 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 02:18:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 02:18:59 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 02:18:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gsd+IDyySSquxCsjDowCbjhy5CCCd1bY/+Wyq2bplqdS9VcN+Fjy2Zdk+9D+WyoaunT6fv/UwsyJmh5/lGb3nna8AE57s3+ydNwz8Sv0A/I+4kRc8n4G+d9SUzkzWaC2SXidObm7xRJBMpQk8GIFRKQkUDzEO2s94JgRMX+s3nE1vz4YzYHPH6AnN+F2YpChGfTvajxy+52K+eNIygWbULw0zphL7jH992bzvHergzIPiKtfwApR1kmrfGmRCUzHiMlrn2dIbiXYUwxVq5TkofPPs931+y1IUs0bNVtI0sW7VETwGgeavdF7ByrN2refBHOn5eY/kGcHV8lnWx3Grg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UjaNDfiPSdPvVuQkfayu4YdvkUaC/xQX+5bPD2ylsk=;
 b=V2L7XJXx1dxk0v4OihrRnbhsKnr3kIpu8UCjFn2RDMmfnRYYqfX82Sv8NuyrsyADdfgoqjAE46KYWSqWqsTQvbZBcbX/m38eR+QZ5iipO4O1Shx4vSF6z3+vu73lc9NwHx5fhl7+qaOMfQJmwVntDuqBA6Y+vumNvYhUJ7+43HphFIweT++VrfePwaP5DMZxblxNlCKtGaG7W4Bb2sprKEsS9JV4DSrNc1bsZC5cdSJGBrpBc9KGblKIH04K35/Up6EKS//kKITcoOBNYl0prPFMcDKq7qubCQWGZAN6Gcwo6nlAmdL3guAcrPyqXoBdY4dsuBCpsKB55TNNFKAb5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH2PR11MB4262.namprd11.prod.outlook.com (2603:10b6:610:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 09:18:56 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 09:18:56 +0000
Message-ID: <1aa8e962-d963-5687-2939-a61c73e67a40@intel.com>
Date: Tue, 10 May 2022 14:48:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v2 13/25] drm/edid: convert drm_mode_std() and
 children to drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <9fb970d108a8bb666b87a590c74f480e0fd81cc8.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <9fb970d108a8bb666b87a590c74f480e0fd81cc8.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19cb765d-8c42-4ac4-d793-08da32661be7
X-MS-TrafficTypeDiagnostic: CH2PR11MB4262:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CH2PR11MB426287DC486D3F83B60FC9A7CEC99@CH2PR11MB4262.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KEZNQ72AzHPA+sK5FM6OLwEOy22Dz6xpoXg04m8ZAz3gRCzkL/ZislRaq2dV/nODvKu47qcGBlVsJv4gJE+qyAG5IbiofFoKNKAqaAIQUc38O1XiwM3I5C5fuYdh4tQ34inSBa/9RSKwgyv8BKVISwezKsTk7jIZmDZD068WdAIjKjdQpMVt/gXfTGx3SRm+jtvIerwZ8WqCYls84Jua5t9ZI0Xe6ERKyukw6g5nDxIDgP6FWBq7AoZHwufTmnqBwCppfrGe5ZDj/6FAEC8LKAHZXLH8T5OkW8YrxIGCMkcSwKsqVHDjhnzIYZVtXawuYxiwegK8vrfjFQ3CES2n4LLiOLjhftzRe+52upn0FRZ8MuuXOyXagO3t4wzSz83pYrTdmCFsRPz02dJ78m9Q93pLsNxt56kYjk/BxI8GkLsr+fr500KNtqaI6dvlCHHe006kReN6sQQpN9y3lWzGQH4cijihtI/Ea7SCharaI2JBocnlbEhkpLBgKS45mgDaGCxtDbvs0j0tAbQOwscjIk5HkRlh5OHZsC9RknEJdHIzg7W6bx7sFUK4jb7blVp3AOVxLW9dULMkG9tRmOLAFxJ6weMO/Ofh9QfhNh762vPNo2lpw05OwFfqLkTrax6VtraYA7fFgGyM+EVY+QoqrUQqQNTd0hV33iPtERiezKSFIv/gGm4HxDBklsYzuzIP+AqJdQsboWnmAm7GYbSuQ8BLQzw8Uy5Kh0cto1dlu4U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(450100002)(53546011)(36756003)(55236004)(82960400001)(8936002)(8676002)(66476007)(66946007)(66556008)(4326008)(31686004)(38100700002)(316002)(6512007)(508600001)(26005)(6486002)(2906002)(5660300002)(6506007)(186003)(6666004)(86362001)(31696002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkYzMnlXdVFnNDlwcVB4VnpuNlRPa29uanBqcXhJNklZc2F6WXF4T2JHbWJq?=
 =?utf-8?B?MlZqWUMvcS9lN3hTUWdwNWpWbVkwN0F4Q1JIUU85ZjhhV2lnUnNOaHJ5Yytt?=
 =?utf-8?B?QUtFSjRNMGdMTU96ODc2bEl0dFU3bnJqM3VwWDhHazFUeXh5aDJ5UjJMNThQ?=
 =?utf-8?B?ZXg0TDFTOVVoU2tNYmxLNXc5b1VIWjB6MDBENjJiR3h3bC9xTno4eHJCRzVm?=
 =?utf-8?B?Y1ZJekNHSVgvVU50Y1dwVnVUSmROTHZObEYwTUxvaXZwejBMRkpBK2FjcUlP?=
 =?utf-8?B?NU1SMlpkREhOa2pqR0pDRGJZQWZMTGpUaG1TV05XaG54M3ZvSVlrakd4V2V5?=
 =?utf-8?B?Sm52UUx4bmlzQmNmaXNXanUzalJqVWlqRmFoU1FQWWVST0NZRUFmSWdrYlZt?=
 =?utf-8?B?QmZDVGxtTi9zalBsTEZPV3pocXdZekVOZm5aek1lNGxhcnFlWEhEWStzb1Ev?=
 =?utf-8?B?SmdXVnhwYVJOeisxRWdZN2RBVjhYQWJjT3R4YW9FSzdOKzV5L040VlAxZ1Rx?=
 =?utf-8?B?ZU5QUDB3NWRvWUZDRG9UdGdON2tTQ2g5OEM2dXgxb1MwVVY5R1RUY2tDdTgv?=
 =?utf-8?B?WDFjQ1BNRjZ4cVhnV1JoQjJUak9WcnJYb0JwdkFqZ09aQVltdlphNmRoQStv?=
 =?utf-8?B?UmhOZ1B3RmR0bDBCTlFFd3F5NUtiRXhocFNMNzBNOVhLSzBTTysxV2t0ZlNE?=
 =?utf-8?B?Unh0ODRoekd3cVFwMmFhY01MOVpJT3dzUXQ1d3BIZzdRYXRpM21xOWh2SjhB?=
 =?utf-8?B?citLK25zNzdKTFhIamJDREw2TjIzS0o4M1lVVURxRDBvank5QmFBTTUwYkhM?=
 =?utf-8?B?K0dCZVNOR09nOEExK2ZVWVZUbTZxeUhIZ1VGdzVJUlYrYWZQRk1TMDZJM00x?=
 =?utf-8?B?ZHRwdlhDQnN1WmJFNk5xK2Vta3E2ZW5rUWgwWXFHR0NSZDI4VUZxSVRsSXZC?=
 =?utf-8?B?QlVhVHBwdEZucVZEbGUxSHErdVFrbllhZVlGR01NZENIQ0NvWVNDajlsbVRM?=
 =?utf-8?B?WFpzMmN2aG5pTkFFZGNvR1VCeU14ZEZ6L1FOdCszSTRqb2V0UUFPZitiamgx?=
 =?utf-8?B?azJIUlcraWJaYTQyaTRRcFBXQ0lSY0FFYjlYajEzdnJUcHEwZ3dJMUVuSlJV?=
 =?utf-8?B?bXNIaEtVbktiazdJRVBsVmVVQXV2Qy9hdHFJVHArUlIrVW5malVLd2hMYTEz?=
 =?utf-8?B?TmY3NkR5eThLQWhMa0Fqa2dkdjk3cmJDdGlLYzI2MFdFWlZJeXIyVyt5RFdz?=
 =?utf-8?B?bkZEUWhFcGdpR1pQNVk0TmVyVGJRN0RPRWUzTThHNndxaW1JRy9qZUFBRVhO?=
 =?utf-8?B?NTAzMFdTcU0wbjhoZC9DUXlkMWFCeVo1RjRKMkx3TzBTaC9hbDVMVWJLeDV2?=
 =?utf-8?B?NTU1ME9VQXY3amIwMytKck02OUVwWHZkQTNkOUUzcmdPY0dmTXJRNFU2Qk01?=
 =?utf-8?B?OW1OaWozZjJ1aEtkdEtoYnBSckpBbjcvaThuc09kb29Wd3lXeURYaXJadVl0?=
 =?utf-8?B?RXpzaGhjd0J2ZCtTL0RYbndEZjdnSjZ6S1Fqa0NnS3kvSFhQR1AxVWhlSitx?=
 =?utf-8?B?NSthTHBpaGp3c0JZamJPc3JQS1ZlY3hHbTlSd0t1VUZoMjNTR1o2d2UvYUJM?=
 =?utf-8?B?MDFjREdBWVVlS0FKRW9vSm42UVpaKy9TcXBGVFJzeXBiVU9jU3FzWXRVMEE3?=
 =?utf-8?B?bDIraTE1OWdneVBSYlhqZk9QYWRlc1dXQzZSQ3BGYWZBTGc4dmU4K0xDdTBl?=
 =?utf-8?B?dkovQ3VlYWF3enc5cC9qSk9mVEp2SDNHV2ZqYVhGeVlTa1RJaTBqMTFUUW9T?=
 =?utf-8?B?WHpNaW94TUVGNHUzTjNXRW5YSkRIWUhtSnR4YTluOXlQSkx4OWtXd2YwZkV5?=
 =?utf-8?B?SThwaXlUM0hNbWhWTHVmTVdFT2E4TktKRGEzNTlRYWlDaXZIa1IrNTBYYzF2?=
 =?utf-8?B?TzhoVFlrT3R0RG53WnhGd1NiaVVVWEVNUEJXTDJPeFM1ZWFLdm8wWjJWUjNV?=
 =?utf-8?B?N2hSUzRPN0dmQUYwQ3pHNXVtZEhwYVVGV0MxYWxKYitya3kyekRVTTlVLzk3?=
 =?utf-8?B?dEFsMjRHT1lyNkpSbEJ0Uk5EVUFaUmRFQ05kRVkzMFVBb0sreG9BaGR2eFoz?=
 =?utf-8?B?eFJtazhYWU02Nld5ZTVqYTJ0bjFFWmdNNXRmN0NabEUzMlBiUWIzK3RuUVcy?=
 =?utf-8?B?SkY2MjFOZGxKaTArYjEvNE1UcFFadW5BdEtaVlMxcEpEeElYSHcwTlViKzdC?=
 =?utf-8?B?dkllN2s5WTl5UFo5dU8ySU50ejBOOVlyWVBBaE84elpkWjFsVDR4YWJZdnpO?=
 =?utf-8?B?OEtyWUtHcUJvdVhPSTRpWWpDQnErcTNoMERKRGUzY3UvNUVhNGNLZnpxQWxG?=
 =?utf-8?Q?9uI3LRaDWyWHhWVY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cb765d-8c42-4ac4-d793-08da32661be7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 09:18:56.6171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISUVwc4NH8LWfyX4nXewJQu0/Y1ZGL409P5VwVuqKvr2Us57MSnoXN4iqkO6TIJFrQON7U+beR8iErm2szk4uK4RiGptKgxrzU7byEswxl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4262
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

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 52 ++++++++++++++++++++------------------
>   1 file changed, 27 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 51d918c66a26..bea8f33c58ad 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2673,11 +2673,11 @@ find_gtf2(const struct detailed_timing *descriptor, void *data)
>   
>   /* Secondary GTF curve kicks in above some break frequency */
>   static int
> -drm_gtf2_hbreak(const struct edid *edid)
> +drm_gtf2_hbreak(const struct drm_edid *drm_edid)
>   {
>   	const struct detailed_timing *descriptor = NULL;
>   
> -	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
> +	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
>   
>   	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.hfreq_start_khz) != 12);
>   
> @@ -2685,11 +2685,11 @@ drm_gtf2_hbreak(const struct edid *edid)
>   }
>   
>   static int
> -drm_gtf2_2c(const struct edid *edid)
> +drm_gtf2_2c(const struct drm_edid *drm_edid)
>   {
>   	const struct detailed_timing *descriptor = NULL;
>   
> -	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
> +	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
>   
>   	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.c) != 13);
>   
> @@ -2697,11 +2697,11 @@ drm_gtf2_2c(const struct edid *edid)
>   }
>   
>   static int
> -drm_gtf2_m(const struct edid *edid)
> +drm_gtf2_m(const struct drm_edid *drm_edid)
>   {
>   	const struct detailed_timing *descriptor = NULL;
>   
> -	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
> +	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
>   
>   	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.m) != 14);
>   
> @@ -2709,11 +2709,11 @@ drm_gtf2_m(const struct edid *edid)
>   }
>   
>   static int
> -drm_gtf2_k(const struct edid *edid)
> +drm_gtf2_k(const struct drm_edid *drm_edid)
>   {
>   	const struct detailed_timing *descriptor = NULL;
>   
> -	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
> +	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
>   
>   	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.k) != 16);
>   
> @@ -2721,11 +2721,11 @@ drm_gtf2_k(const struct edid *edid)
>   }
>   
>   static int
> -drm_gtf2_2j(const struct edid *edid)
> +drm_gtf2_2j(const struct drm_edid *drm_edid)
>   {
>   	const struct detailed_timing *descriptor = NULL;
>   
> -	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
> +	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
>   
>   	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.j) != 17);
>   
> @@ -2733,12 +2733,14 @@ drm_gtf2_2j(const struct edid *edid)
>   }
>   
>   /* Get standard timing level (CVT/GTF/DMT). */
> -static int standard_timing_level(const struct edid *edid)
> +static int standard_timing_level(const struct drm_edid *drm_edid)
>   {
> +	const struct edid *edid = drm_edid->edid;
> +
>   	if (edid->revision >= 2) {
>   		if (edid->revision >= 4 && (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF))
>   			return LEVEL_CVT;
> -		if (drm_gtf2_hbreak(edid))
> +		if (drm_gtf2_hbreak(drm_edid))
>   			return LEVEL_GTF2;
>   		if (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF)
>   			return LEVEL_GTF;
> @@ -2770,9 +2772,9 @@ static int drm_mode_hsync(const struct drm_display_mode *mode)
>    * Take the standard timing params (in this case width, aspect, and refresh)
>    * and convert them into a real mode using CVT/GTF/DMT.
>    */
> -static struct drm_display_mode *
> -drm_mode_std(struct drm_connector *connector, const struct edid *edid,
> -	     const struct std_timing *t)
> +static struct drm_display_mode *drm_mode_std(struct drm_connector *connector,
> +					     const struct drm_edid *drm_edid,
> +					     const struct std_timing *t)
>   {
>   	struct drm_device *dev = connector->dev;
>   	struct drm_display_mode *m, *mode = NULL;
> @@ -2782,7 +2784,7 @@ drm_mode_std(struct drm_connector *connector, const struct edid *edid,
>   		>> EDID_TIMING_ASPECT_SHIFT;
>   	unsigned vfreq = (t->vfreq_aspect & EDID_TIMING_VFREQ_MASK)
>   		>> EDID_TIMING_VFREQ_SHIFT;
> -	int timing_level = standard_timing_level(edid);
> +	int timing_level = standard_timing_level(drm_edid);
>   
>   	if (bad_std_timing(t->hsize, t->vfreq_aspect))
>   		return NULL;
> @@ -2793,7 +2795,7 @@ drm_mode_std(struct drm_connector *connector, const struct edid *edid,
>   	vrefresh_rate = vfreq + 60;
>   	/* the vdisplay is calculated based on the aspect ratio */
>   	if (aspect_ratio == 0) {
> -		if (edid->revision < 3)
> +		if (drm_edid->edid->revision < 3)
>   			vsize = hsize;
>   		else
>   			vsize = (hsize * 10) / 16;
> @@ -2836,7 +2838,7 @@ drm_mode_std(struct drm_connector *connector, const struct edid *edid,
>   	}
>   
>   	/* check whether it can be found in default mode table */
> -	if (drm_monitor_supports_rb(edid)) {
> +	if (drm_monitor_supports_rb(drm_edid->edid)) {
>   		mode = drm_mode_find_dmt(dev, hsize, vsize, vrefresh_rate,
>   					 true);
>   		if (mode)
> @@ -2862,14 +2864,14 @@ drm_mode_std(struct drm_connector *connector, const struct edid *edid,
>   		mode = drm_gtf_mode(dev, hsize, vsize, vrefresh_rate, 0, 0);
>   		if (!mode)
>   			return NULL;
> -		if (drm_mode_hsync(mode) > drm_gtf2_hbreak(edid)) {
> +		if (drm_mode_hsync(mode) > drm_gtf2_hbreak(drm_edid)) {
>   			drm_mode_destroy(dev, mode);
>   			mode = drm_gtf_mode_complex(dev, hsize, vsize,
>   						    vrefresh_rate, 0, 0,
> -						    drm_gtf2_m(edid),
> -						    drm_gtf2_2c(edid),
> -						    drm_gtf2_k(edid),
> -						    drm_gtf2_2j(edid));
> +						    drm_gtf2_m(drm_edid),
> +						    drm_gtf2_2c(drm_edid),
> +						    drm_gtf2_k(drm_edid),
> +						    drm_gtf2_2j(drm_edid));
>   		}
>   		break;
>   	case LEVEL_CVT:
> @@ -3360,7 +3362,7 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
>   		const struct std_timing *std = &data->data.timings[i];
>   		struct drm_display_mode *newmode;
>   
> -		newmode = drm_mode_std(connector, closure->drm_edid->edid, std);
> +		newmode = drm_mode_std(connector, closure->drm_edid, std);
>   		if (newmode) {
>   			drm_mode_probed_add(connector, newmode);
>   			closure->modes++;
> @@ -3385,7 +3387,7 @@ static int add_standard_modes(struct drm_connector *connector,
>   	for (i = 0; i < EDID_STD_TIMINGS; i++) {
>   		struct drm_display_mode *newmode;
>   
> -		newmode = drm_mode_std(connector, drm_edid->edid,
> +		newmode = drm_mode_std(connector, drm_edid,
>   				       &drm_edid->edid->standard_timings[i]);
>   		if (newmode) {
>   			drm_mode_probed_add(connector, newmode);
