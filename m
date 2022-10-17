Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B32C1601DCD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 01:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727EA10E1D2;
	Mon, 17 Oct 2022 23:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5703710E811;
 Mon, 17 Oct 2022 23:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666050256; x=1697586256;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/SJguKIbKdnl6YhRQJNeHH/S92E6I+prw2+PSTb/Ax0=;
 b=Vvo36eg4/sarj+2gkpkbVBmWtsPdP0UEU6uupY3V4oIIlh7sdMev08a3
 ILWbhiRTB1niJRMqe8324Ny7qdtoTt7axHB0evvpOA+jxzfTvpcVNec8S
 p7RzsOdK8uuEqu3VLUmpuiMitHnXhSam39CGzW2VFY6l6WYSbkBUfGzZc
 MfamGGcB/bdO06PrFaOClsi2PCIRoHfDZAPgOyFHvKcdpRkfGZAkjy4E2
 Q2/FciyLh61e3yhfskkFQV+J7ITkBKqXmweyZhIVvxoy17TPgh2TJeFai
 UVDYyjcgBZZRxxp7vUsHgmODJiL2nrGQT7sD0IKpwHhD3EYi3dT1I5gD/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="303561710"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="303561710"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 16:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="873656261"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="873656261"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 17 Oct 2022 16:44:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 16:44:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 16:44:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 16:44:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 16:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzPUvaejGIjP1aJORBr9t7UkhaQW2jP13JDPSaKMrV9ay0mTlqyr1pe+50fDbJto89wdQAF70OQ/vgKVl3rL+aWBqLciHNlCQ0EIvxe89eeQD/bQCpV+ftdgjNtiPmq3UO4KTfw4fbRZv5hphDIHLCms5nkxI6fqzOIi6HxtBGEQWlbdE1SwofP41kTb9rmgXO0H8L0/9YSyb+Kwti1qEqw7gEYf3Q6Wez32ZIIQetl8Q03QUgeNo4CoNb+VhckGdiPE9ctHn2J26D0jozoIaKTaobzECJCkMJ1rzRcnh+0HezigJTfPRBKL1dpkpJaxwcfFFRT3F8fOpMf4jOtwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qkvlm6v7IdtGpH+J0UFJgdkjBwy+yJBlR3C4b5EO7o=;
 b=c1+4AFd4hqUxJLKxAfMJcq9HrL33eQFuU7nDKJs2+smNGsEExrqGC+T+Z4HQkjNmtTcfVJ+YvqT3wpYrCAptwF32HJs9QbwbAV4Z89/gjhoQ1cCULc9CPo1uJRba0wzXgy3LbN0LhZ4+bJPgCxfC/EnexPxNAys5B6Lt4dDHlFg39tkA52VohtFCXpjgNcyAvfUTbDdX/PtlSLJc+NELXAK/m9+p2m9D538SNvEN55zHmmaYirPig3/xXRamhMbaOhUiHSnKcKpbXW/7ew1TB+lZEy6E0HlSO2Xr2lbd/Q2b5A2G3DA6iaLCVQycU6DNHenXhajknG7ZOEXrwmtjkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 23:44:12 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 23:44:12 +0000
Message-ID: <2fab9f05-7c41-2564-b7e1-a26962bb8b42@intel.com>
Date: Mon, 17 Oct 2022 16:44:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.2
Subject: Re: [PATCH v2 3/7] drm/i915/uc: use different ggtt pin offsets for uc
 loads
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
 <20221013000332.1738078-4-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221013000332.1738078-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|IA1PR11MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f31aa54-1c1d-4e2a-2ade-08dab0997e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TIClBm95HUjV2KhONotBDnM7ONMm9cP5GXM1uBZ5/HYoXjPxx3FC03x1YnTWuwNxeAP1BYcZeDLkA6SYJe+w04fX1vpqfSzKdxCJee/lB3f69iq9naPAGs7S1UbkXcvdPVpmmoZvKVsc4RAeHVqzANsxp91FTYAxOfGLLiJh6pJumTwqjApMAFv4pCfF0gYxmtaw5Hn2AGrOr8CkyvI1MV7/6CHfrQFHVJ7ojVPhE4HbjV0iF7PK8rEA2aZeEZLwLH2qyL9UveqFXISWsZ7asXbwv50umIL0EqpU/Mr9eQ4T6bonUdevjkjsbxmfxz0dW60mKUhbDGjOHdcLyywRk9gSpguzPvGevi5EfgeekNdNmRMOnhwkKWST/baRWdWzhffZvqmzb5F8194zr6bQuxnhBMd8x5TrOyvVQhpvarTd+6QcrhcgaSqDm1IRp3lrsKdQ2uRSnHHOYTBP1wZDhLhJ9f/VyaLAQpxaIn7ToP6FpGyYph6Euyv2DfJ5TMZ5hzTcLBN9rnnl+tPEODNJO2iCXUUMZ6quG/qaY5GYm+c/ZB3TH0DNqeXzuwkge8bU2ONYr6HbHddpI3A90WnQ+L4SizNNRkjP7F7DCr9EWZ0cpM8ZyRgeK/cnJ7I/1M4WRwGawcKSZdUrCFZPcFAJXGZIPvQEag+J816s2BmGzHIJ1RlW0RrYaWqyWGK1dc2wiLU18cP/3/U8t99p3PyU1pLAnwou0RwoGtKiOMLUQA487ELN1+QPnl+zUr+VEAwvZbFH7pzUKLvoqgOykZ9phvMFQ8l8ZS6VqO8D8wAaRiQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199015)(31686004)(6486002)(66899015)(478600001)(82960400001)(83380400001)(2616005)(26005)(8936002)(38100700002)(316002)(31696002)(6506007)(2906002)(41300700001)(53546011)(86362001)(186003)(36756003)(5660300002)(8676002)(6512007)(450100002)(6666004)(66946007)(4326008)(107886003)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZURHdmhJYTZtMHlQdHBCVkpwQllKUzhlM29vdDdpOFFwWEZzYThSMnN4YTBq?=
 =?utf-8?B?L0hpdStrcVlaaG4xc0NkdmF5T3RLbzVlUis2aUJnc2tpUGl4UmYwRVptaU1I?=
 =?utf-8?B?UVVhL3hnWmFZYnhiQzVGYkExU2M4UjZ0R1p3VldUQ0RLbnpDWGdpZkUzM2Fx?=
 =?utf-8?B?Y0pJeGFmODJVN1dseXc1SnplN0pnbHRuQXBUYll0SnF3Q252T1FwNHZWcEVz?=
 =?utf-8?B?cUMxTy9oaWxCL3FXMk5YSytPcWJnK2lQaEFFcTVUZEVKdEZTdUVXNEJiZlBL?=
 =?utf-8?B?aGZJTkdKV3owamNBQjhXcFJ2SDIrRnpCZUd4aG5qOGdEVkNsNW9rOGN5THB5?=
 =?utf-8?B?d3ljdlg3bWFJQ3VseHgvRTBaNnhqVnNMdXFiREZiWjIzWVdHUGJ4Z2JEMGg3?=
 =?utf-8?B?UHl0bjNvRHNwMHVvWFM5TWl1anJ1U05qMWFoek1FbjRGYnFmaFBTQVNhSzlL?=
 =?utf-8?B?b085NDQ5QTZuOVJORHNPOTZyS1hwRFpSbHdmR2VibElmb0tpcXR3U3M1a0M5?=
 =?utf-8?B?WU02cjF1ZTE3RUZ4UzZXVjdOUjR6NkVySUQvOGpJUWh5S1RPNmpKa3RkZnUv?=
 =?utf-8?B?ZHo2QUxRSUdXUUpSbENTOTVES2VLbzNiWGZBWXQyVkd3NUFYTHc1aHl2YkRH?=
 =?utf-8?B?djlSN3kzK1pQU0xBZG1KSUVnZHNSN1FhcTJaU3ZZeWhYdGdzM2VaVU5zYXR2?=
 =?utf-8?B?T05naFJ6bjIzMzZoazNqU3ViazRGWi8yVzg5SGNMNGZYeVlTc1JuQit6RUxY?=
 =?utf-8?B?dE16RGIrZHNRRlJ3UUFMSStuZDlGcDRqMzkyWk5oWjZINkI0aldKdVJCZXFF?=
 =?utf-8?B?c3NuQ01VRmJnOS9yNitta2UvUEZFb0UzWUYwWkNEdDFNVnkwMEhwaGEzRnVz?=
 =?utf-8?B?cDZmQ0t5cU5HS2s5S2NYalNsdzlQL1QxSjYveWYwckF3WDZ6WUlCVi82VU9U?=
 =?utf-8?B?SHIvajBHYUZvV1NtOXZwem0zcjRWZEQyK0trZUFLNzlFWi9GTlBFVUd1dS9h?=
 =?utf-8?B?VDNhYkJtTXVHdkxrWXRXZTF1Ui8ySW9yVXZlVFh5aHBvR0Z1Z3d6QVpVSHYw?=
 =?utf-8?B?N1kzM2o5TmlhbmlBTUYwQXhTOFJQTzUxeHN1T1l6ZHNxWEtrcXFGVVVvNmN5?=
 =?utf-8?B?MjgrTHRXY2JtdExwWE4vYlpQUGNjSUplSWdWSDkzYU5rK0djbFFaWXIvWjNo?=
 =?utf-8?B?Y3dDdXNoQVNpd25TOUt4SURoZ2hnV3loUzY4MUYwU2dMRFBsT0k1TnZJWTNE?=
 =?utf-8?B?RGpOaU1yZStqc0ViOXlJUStnbGlabWJoSkltaWtCK2FUbFBxOG9FS24xODMx?=
 =?utf-8?B?NmV4TEs4RlVlT1RCNk5BaTVDQnk5WWp6MXJuWkc5TXNQdGFJK1RueXdqdFk5?=
 =?utf-8?B?K1RIRFpqaWtOYzJRWnI3TjRBUTFvTHhZTzg1MjRzb3kwd1lrTkdMcHN6RUJI?=
 =?utf-8?B?MlZDckR0NkNWM3E2c0hDOFpOZk1KemYzNUxLaEhLLzFGSE5SNEMyR29JQ3Fo?=
 =?utf-8?B?WmJsZ2czcUFVRzlBQzIrenc0NTlLakxhQjlxNU8xcXJOTVFzb3g3SUJNT0dY?=
 =?utf-8?B?ZURCTHpDWEJJWlg2UlNsdVY0TDlhM1ZibkZoNmZIdWxLUXZXOWJjQTNqV2tt?=
 =?utf-8?B?cFNpS2k1UlNCbEh6OFpPNjYyVDFaMXJwOWFjK3FoSmJiNE1udHdUTGNHQSsr?=
 =?utf-8?B?QjhqUjUzd1haSzN2S1hybnl6bWVaM0JycXJENHFaZytYWEtmM3hUcUJBQ3dw?=
 =?utf-8?B?c3l6ZHc1bDdlakl5c2V0NmY3SDFSY3ZMWVZPYUl2VDBQZkFncmN6ZXpqWXFq?=
 =?utf-8?B?NFk0OTZ5RFA4R0lmTEtvQWRPdlZKdUJFTW9BUk9YNG9WSU53eFhKNzZEb3JX?=
 =?utf-8?B?RXRsSWxoUGpQdUQ2UDJaSGRORU5ETHNFZUUrTDJzL01hV3lsRkMzdkNHMmk2?=
 =?utf-8?B?QzhIcFJZTnI4NzFnTmtWTFZEb3JBVFJDT1A1R25HbmtEQVF4WVJUOHVMOGx3?=
 =?utf-8?B?VXZ1TTMyeXJodkVRZUJQVWllcVRUMFNuN0xWYWM5ZG9ya2VkS3dFTXFRTW12?=
 =?utf-8?B?MjNpMDkwTy9FSlZyRU4vc2FPNjFqRncrQ0lBMkdWY0cwWWtOaVRUbXpWMWo5?=
 =?utf-8?B?ZU5GQ0d6cjVHcnh4bWVhZXQ0OTBsR3VqZmNvMUpIZFJYdXNsZFE4OGg0TVJR?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f31aa54-1c1d-4e2a-2ade-08dab0997e22
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 23:44:12.0405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxtuOBtvA9o40qqTbJKsvidX42QOJce3UqogQRUVcFpI2wS+//hYNqGDqQ/eNg7cwZip0DAMkm7oJwCIIHlx2o2xQy5aIzZdfrst3otCdZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/12/2022 17:03, Daniele Ceraolo Spurio wrote:
> Our current FW loading process is the same for all FWs:
>
> - Pin FW to GGTT at the start of the ggtt->uc_fw node
> - Load the FW
> - Unpin
>
> This worked because we didn't have a case where 2 FWs would be loaded on
> the same GGTT at the same time. On MTL, however, this can happend if both
> GTs are reset at the same time, so we can't pin everything in the same
> spot and we need to use separate offset. For simplicity, instead of
> calculating the exact required size, we reserve a 2MB slot for each fw.
>
> v2: fail fetch if FW is > 2MBs, improve comments (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 30 +++++++++++++++++++++---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h | 13 ++++++++++
>   2 files changed, 40 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index de2843dc1307..021290a26195 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -575,6 +575,17 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	err = firmware_request_nowarn(&fw, uc_fw->file_selected.path, dev);
>   	memcpy(&file_ideal, &uc_fw->file_wanted, sizeof(file_ideal));
>   
> +	if (!err && fw->size > INTEL_UC_RSVD_GGTT_PER_FW) {
> +		drm_err(&i915->drm,
> +			"%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
> +			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> +			fw->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
> +
> +		/* try to find another blob to load */
> +		release_firmware(fw);
> +		err = -ENOENT;
> +	}
> +
>   	/* Any error is terminal if overriding. Don't bother searching for older versions */
>   	if (err && intel_uc_fw_is_overridden(uc_fw))
>   		goto fail;
> @@ -677,14 +688,28 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   
>   static u32 uc_fw_ggtt_offset(struct intel_uc_fw *uc_fw)
>   {
> -	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
> +	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
> +	struct i915_ggtt *ggtt = gt->ggtt;
>   	struct drm_mm_node *node = &ggtt->uc_fw;
> +	u32 offset = uc_fw->type * INTEL_UC_RSVD_GGTT_PER_FW;
> +
> +	/*
> +	 * To keep the math simple, we use 8MB for the root tile and 8MB for
> +	 * the media one. This will need to be updated if we ever have more
> +	 * than 1 media GT
> +	 */
> +	BUILD_BUG_ON(INTEL_UC_FW_NUM_TYPES * INTEL_UC_RSVD_GGTT_PER_FW > SZ_8M);
> +	GEM_BUG_ON(gt->type == GT_MEDIA && gt->info.id > 1);
> +	if (gt->type == GT_MEDIA)
> +		offset += SZ_8M;
This is all because render/media GTs share the same page tables? Regular 
multi-tile is completely separate address spaces and can use a single 
common address? Otherwise, it seems like 'offset = gt->info.id * 2M' 
would be the generic solution and no reference to GT_MEDIA required. So 
maybe add a quick comment to that effect?


>   
>   	GEM_BUG_ON(!drm_mm_node_allocated(node));
>   	GEM_BUG_ON(upper_32_bits(node->start));
>   	GEM_BUG_ON(upper_32_bits(node->start + node->size - 1));
> +	GEM_BUG_ON(offset + uc_fw->obj->base.size > node->size);
> +	GEM_BUG_ON(uc_fw->obj->base.size > INTEL_UC_RSVD_GGTT_PER_FW);
>   
> -	return lower_32_bits(node->start);
> +	return lower_32_bits(node->start + offset);
>   }
>   
>   static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
> @@ -699,7 +724,6 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>   	dummy->bi.pages = obj->mm.pages;
>   
>   	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
> -	GEM_BUG_ON(dummy->node_size > ggtt->uc_fw.size);
>   
>   	/* uc_fw->obj cache domains were not controlled across suspend */
>   	if (i915_gem_object_has_struct_page(obj))
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index cb586f7df270..7b3db41efa6e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -6,6 +6,7 @@
>   #ifndef _INTEL_UC_FW_H_
>   #define _INTEL_UC_FW_H_
>   
> +#include <linux/sizes.h>
>   #include <linux/types.h>
>   #include "intel_uc_fw_abi.h"
>   #include "intel_device_info.h"
> @@ -114,6 +115,18 @@ struct intel_uc_fw {
>   						     (uc)->fw.file_selected.minor_ver, \
>   						     (uc)->fw.file_selected.patch_ver))
>   
> +/*
> + * When we load the uC binaries, we pin them in a reserved section at the top of
> + * the GGTT, which is ~18 MBs. On multi-GT systems where the GTs share the GGTT,
^^^ meaning only systems with a render GT + media GT as opposed to 
regular multi-GT systems? Would be good to make that explicit either 
here or above (or both).

John.

> + * we also need to make sure that each binary is pinned to a unique location
> + * during load, because the different GT can go through the FW load at the same
> + * time. Given that the available space is much greater than what is required by
> + * the binaries, to keep things simple instead of dynamically partitioning the
> + * reserved section to make space for all the blobs we can just reserve a static
> + * chunk for each binary.
> + */
> +#define INTEL_UC_RSVD_GGTT_PER_FW SZ_2M
> +
>   #ifdef CONFIG_DRM_I915_DEBUG_GUC
>   void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   			       enum intel_uc_fw_status status);

