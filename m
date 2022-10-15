Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6EE5FF784
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 02:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE7310E229;
	Sat, 15 Oct 2022 00:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7DB10E1F8;
 Sat, 15 Oct 2022 00:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665792660; x=1697328660;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wS74HzGGBfAPL3AnVZA0vQPfPr1RTWQP2BTvHGkn4zE=;
 b=Kh55OGoOuIkS0umGyTtx32T1k8jhjesjt1LCQusGjHw+4bdMcaMK9fdg
 m4enKpgfytdcpEgF/CarjNnKzjkG0eUjq78UYncfd7iZoh9yciY3igYJ2
 GybnHhHYGDwDqn84VXFunZVL32RTFBxRlLv0dexu4CPzNFM/MNxz92/aj
 0l+pnIfhiKFkkcsHArGyZi3B86IU9Kk5uW3kW62aFWIpghzG8gER0QmvU
 XgoU2Q8kPmnZAwCzManQHj7Condy54gAItgkxQsl/fu/sg8VRKT0UqRk/
 MXJgsJau/9kjA7yQYcqjh/RFPsNq6iUzg7lC4TSLUeZEtOCsNdkXnnx2j g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="304238387"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="304238387"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 17:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="770203135"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="770203135"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2022 17:10:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 14 Oct 2022 17:10:59 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 14 Oct 2022 17:10:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 14 Oct 2022 17:10:59 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 14 Oct 2022 17:10:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcGLE69Bf8MTenNF1R+EOyXayWL4fMMy6OjAUuORKQQ5t/Mo39UXf/SpvFhPw9H6KYZQzl1Igq3z6y6rcOdDQBZ59M28tQjg4BxAJQXuVBlhlfhRxo9XssdOSuKtGSARfXclk5V2hgJdVX79n/edPsZXF+FE9ShOcoN9TnEt3zIyPH0Y/oorgdxkD6E92JuC4afaSnJiRU33G38+5Vw0EQhv69Hzkxt4AswAkNbZ6cqFGU2RckJIX/cTofR/7dSPVVnHqA/2hzaZdYX5F71K2q7WE7Vi/71L5HOf5AdaQdLXmndZEP3SOghUIB6CqJhxhgGqxfR01ZdAAG8r2GLmCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAi2kk6nwEB8ckUZ42qzZUI9ojD/dkKsAtzpixbjzqk=;
 b=a8o3kuKrnjA2nq8zXsjfIusXmqneQStofI3bDis6dLgXfHerJ4k6s/gK6SpeZTkQcbjfoZpAxS3wb2HaCKfkTeAbaqg1uEgdetjEJgRtQa48lfGlkIfZOdnSTE+zn6IwONZyXQbdpDT1O71GvVi4CsLfRRftF1aEdf2WHP1FGoHJuPdXKKs8HssRv7ak6zTEzFSUdRD95Nr7NZel/Y5PuDZtoif18Z8Qi8o8qh7z4OmDMhBQ1g9tAy7hO2X7Fiwy/SAqpXa+svhkeakfp1Nm/AcruKOsFLi5n012gfWnsahJxHQLeTA73pkpeIe/Kp/pf06236GB3intrTditFfQnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB4895.namprd11.prod.outlook.com (2603:10b6:a03:2de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Sat, 15 Oct
 2022 00:10:56 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5723.026; Sat, 15 Oct 2022
 00:10:56 +0000
Message-ID: <7242e315-f450-49d3-bd22-bffc236c6b41@intel.com>
Date: Fri, 14 Oct 2022 17:10:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v3] drm/i915/huc: bump timeout for delayed load and reduce
 print verbosity
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221013203245.1801788-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221013203245.1801788-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::21) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: 5414571f-ed34-482f-40cf-08daae41bb42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CLolfb1kUmWPVUIbFJd50o3glWT2Erfc4SaFb9wEbZ+63X2973YQmE2it2rkaG1CAMIPIus3xQFrCdR1YqX4GNACpIHDGpBFMoLHOlosXBFLG1IJW/QCZs/BVge3z0d6x+kcDvBr0lXipwavIaWmRGBuR+zLDuq4tMCzbOG6d4+41RUryC4Gi2Z3Pofmj1ePQzKLy2QBcL3xPLPi68AZlKgUIvfl0SfmCMEXiOTvlM8KaZ1x8J2hoizl5F1COyQxzY7KqvZL4pBoQIz2rWHwqzorE9JhoI4rnLdCvY4aXXMjGc6pfl3EVLmTlJDmGhLGCnUH0lVznbESu9ldivWYGbdy3HBm3bAfKFQeBcAUdJKWHBHVYIZmYRhsyHYEDrL/hE75ldH85/ofBpGSSoHB0Fm1o1YruXhR2NAvpbLDvXXzeXg3PrbsIeKHxfXOZ/w1eIzL2jMu0szaJxciVColOSvFmaprBzzNCEDO49Sa3EtFGxoMUT2PJMnQL8/5P3+ngb2MM7BRp2KTqf94Llr0tySyGgwFjH4LwOSsAzMU2ovUuwNmerY7F2oY4XNGbCoUR/LMkDMhG/46EzjG3WRAoO2VcyFgAlBiX5plJxtlMTTqMrvVhARBIgXlRr27bGcrTPHp2WweOYYtOkyC7ZODsFQNlev7XvLS6bDtwh/VnxPjlWAElAciuk4BVG04YC+0s9l2L0/eV6WuQBG/GdbgaVfqDaMnQWmWgr/PQGSTNBmX8EhPor0NaDk2VB/fKGiF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199015)(6486002)(38100700002)(31686004)(478600001)(82960400001)(966005)(6512007)(26005)(4326008)(66476007)(8676002)(36756003)(5660300002)(83380400001)(31696002)(86362001)(8936002)(107886003)(41300700001)(186003)(2616005)(450100002)(66556008)(2906002)(6506007)(66946007)(53546011)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEMwczhoWW4yMktSZEE1RnJNTHA0cndJRmppNlhpUkd6eFNsaGNUUm1LUC96?=
 =?utf-8?B?cDJHZEZHdExKUy9YRkhPSHFMeUNzdjExMDVVcW8zT3hnMEhDcWlkQ1pFc2x0?=
 =?utf-8?B?cEtnV2xQem5UdEo5a2lWSHRrclNpZWhxWDRGUm5KMS9hT1plQTg5WmsveWtY?=
 =?utf-8?B?VkVWRDhtNWlCUGt0UnEzenpZd0dNRTFUZFhPK1JqU09lbExuZFp5WGFtZGR3?=
 =?utf-8?B?aThtNnZrbU9KTkJYWjlBNGlWUzNZMEIzUkE3R3lGUElkNFVwZmkwdm5pc0JW?=
 =?utf-8?B?ZDdBbENJM2lZK1hJb1hWSGl6K254VGVMY3o0L0hZU0Npb1VXcUpLemJNYlEv?=
 =?utf-8?B?V0NYV2RsdFZ1MVBRSzlUSkNTTWk4RHBFaEJPUzJUYUtTYkRUSU10MStQbXEr?=
 =?utf-8?B?NTJwdXZPc1JBZHFndHBLS3NvLzZ0OXVLeDRpcnBqQzViRTNBbGwxZEFDMnVk?=
 =?utf-8?B?THoyaTB6N2lMc0dweFE1MVBJWWI2QnVpcXNZbVdpN2pVNVpUbzgvSG5FbWlk?=
 =?utf-8?B?aW1SNW1oakNxbWk5aFE0L2NyOGpMNlF3a01yeUh5aU1QV1JFRmM4ZW02RFRp?=
 =?utf-8?B?WnA1SmZuMUI1L2ZaOUVDaVFqcnpqb1lkdzdxNjJyMG5Ydmh1VkIwN3N0c25x?=
 =?utf-8?B?YVNkSFZCOS9VditMSlZrbTRkSEM0d1RpSnVIa2Q4ZTlieHBaT05vaE56bW1v?=
 =?utf-8?B?dVpJZlkwbldEbjJEQ0N6TDFtZzNYOENsaFhGb2FqakZONWlBUitLWGNtc1hq?=
 =?utf-8?B?K1NyTkVrNjFqWE1ac0xOa1B0clJINENrTTdwYTRjVU5ZZWtERUFWM1lCNFU1?=
 =?utf-8?B?MnE1S3lzQXdtY1lIVU5lV1d5RHgrWUUrc0swWERqT3d0K3VDVkNnTFJhRUhX?=
 =?utf-8?B?YlVkenBtR2svM0pUL0NzMy80cjQ4RHp3VEltNDhiSTdwaFA4eFVDeXJIaWQ2?=
 =?utf-8?B?TDdVdzUrd0V3a0JrSFZDU3cxZDliVG5FZXVxNWc5bmMvUXRIMTF2MkkxN2Jq?=
 =?utf-8?B?eWtGajUxWjk1TVdWSUNQRXFBd1A4Vm9MS0FFVURrS2dQcGlyRkVTTTFXZ1lP?=
 =?utf-8?B?bFh4dlJ4S1FLcmZCNzdkQ1E2VmRXdS9Ia3JSQTdvNWR2cmN6Ry9SS0tGZWVN?=
 =?utf-8?B?MTZRYm5mMUxlNk81bWhDdHRTQTI3aVk5a0VuczlLT3Q5YUJVbTZQOGVNcHRh?=
 =?utf-8?B?SDZRbDl3RVBXODNMaGNsWFpjWFV5RGJRTDFtV3FDL1crUzk5ZGFsNXhXSEFF?=
 =?utf-8?B?M0dJalZUajhlSHJhUWVCdHhQbExGemhneDRDS2pVQzVwK0ZYVjNkR0wzWTBR?=
 =?utf-8?B?UGt2enJMNFpLRjdHcmtnTmZDR3pXZHJUczJDTnoxMzFtQW1rY2x4dVljTUZQ?=
 =?utf-8?B?RHB3azZ5RDQwclk0MGN1bENNZFgrUFZTTHRzc3JJSFRybzBtbG1kZWR0TFNC?=
 =?utf-8?B?UnV1UmxuUW9oRTI3dVhrSWl3UHhsMkFhYlpGZ2JGL2E3azNGVDYvdTVQLy9S?=
 =?utf-8?B?N1k0SWRRTk1lWWl1cGV4UlM0MUgrSlVVNmhIQ0p5QUw1UFdGem1NTGdxRkZL?=
 =?utf-8?B?eHZOYXY2T2FyVXZ4cWM4eWlzd0I3ODlWUHJVRDhLaFI2YTg3KzFKMEdVWm5p?=
 =?utf-8?B?bmYxZzNraS83TmE3eWNBT3JWQzcxVXJmL3FaTTUvUzIwYy8zYXdqQSs5a1pW?=
 =?utf-8?B?My9hQzl0cUdaWEJMMitDR0N2NUFNL0Z3OHVVQWFsTVVUbkpma0dBY1E3OG5S?=
 =?utf-8?B?YWpINE1VcFcrUkJTQkxTKzlvdkQwSURMRkhRK2xmSXFlWEtuMmZ4NE9UNWZW?=
 =?utf-8?B?MEVqbWRlVDFrUWYrNUR2bUdPWHVjSDd3ZFZyaDVoTGZhaEFvR3dlQk9kSk40?=
 =?utf-8?B?MFdHU2dKenB4SjZsSGUwVVl2b2MxMjZLVDhxNlNkcUxBQ1ZjN0N2TE9MNnJw?=
 =?utf-8?B?b1BRQURKc1NyTmcyeXNSYjdxWlBsZTNLT0M3cHpoMjgyRGRTcWJ5bkV6UWpS?=
 =?utf-8?B?T3VwQmE3VHQwWWdvcEN6WWs2R2gxcWNUVmFtVmRSelo5SzVLV2dlZlRCY280?=
 =?utf-8?B?eVh4QXpKRk9aajhmbWUvNHNNS1JOVXZ2YjA0K3NoUUJNZDJCNHREbXJuUlFY?=
 =?utf-8?B?cDZ2MEhTZFFlTk9MRzE5WXgxMjVHdW9PY1dMMFFUM2pqQzZBVkZxRG9POGwz?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5414571f-ed34-482f-40cf-08daae41bb42
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 00:10:56.5853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eK+26XL0UKR1Ldh8QVNHg0OLboxcWQ1d3+VHG9+Kc8QJryeA0Tk36+FhEI3veu1DbovCLz1i0KY7ZLPONzJ/KSRgYKlD72nUJMrtoY3jimU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4895
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
Cc: Tony Ye <tony.ye@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/13/2022 13:32, Daniele Ceraolo Spurio wrote:
> We're observing sporadic HuC delayed load timeouts in CI, due to mei_pxp
> binding completing later than we expected. HuC is still loaded when the
> bind occurs, but in the meantime i915 has started allowing submission to
> the VCS engines even if HuC is not there.
> In most of the cases I've observed, the timeout was due to the
> init/resume of another driver between i915 and mei hitting errors and
> thus adding an extra delay, but HuC was still loaded before userspace
> could submit, because the whole resume process time was increased by the
> delays.
>
> Given that there is no upper bound to the delay that can be introduced
> by other drivers, I've reached the following compromise with the media
> team:
>
> 1) i915 is going to bump the timeout to 5s, to reduce the probability
> of reaching it. We still expect HuC to be loaded before userspace
> starts submitting, so increasing the timeout should have no impact on
> normal operations, but in case something weird happens we don't want to
> stall video submissions for too long.
>
> 2) The media driver will cope with the failing submissions that manage
> to go through between i915 init/resume complete and HuC loading, if any
> ever happen. This could cause a small corruption of video playback
> immediately after a resume (we should be safe on boot because the media
> driver polls the HUC_STATUS ioctl before starting submissions).
>
> Since we're accepting the timeout as a valid outcome, I'm also reducing
> the print verbosity from error to notice.
>
> v2: use separate prints for MEI GSC and MEI PXP init timeouts (John)
> v3: add MISSING_CASE to the if-else chain (John)
>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/7033
> Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a fence")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> Cc: Tony Ye <tony.ye@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 4d1cc383b681..fbc8bae14f76 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -52,10 +52,12 @@
>    * guaranteed for this to happen during boot, so the big timeout is a safety net
>    * that we never expect to need.
>    * MEI-PXP + HuC load usually takes ~300ms, but if the GSC needs to be resumed
> - * and/or reset, this can take longer.
> + * and/or reset, this can take longer. Note that the kernel might schedule
> + * other work between the i915 init/resume and the MEI one, which can add to
> + * the delay.
>    */
>   #define GSC_INIT_TIMEOUT_MS 10000
> -#define PXP_INIT_TIMEOUT_MS 2000
> +#define PXP_INIT_TIMEOUT_MS 5000
>   
>   static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
>   				 enum i915_sw_fence_notify state)
> @@ -104,8 +106,14 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
>   	struct intel_huc *huc = container_of(hrtimer, struct intel_huc, delayed_load.timer);
>   
>   	if (!intel_huc_is_authenticated(huc)) {
> -		drm_err(&huc_to_gt(huc)->i915->drm,
> -			"timed out waiting for GSC init to load HuC\n");
> +		if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
> +			drm_notice(&huc_to_gt(huc)->i915->drm,
> +				   "timed out waiting for MEI GSC init to load HuC\n");
> +		else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
> +			drm_notice(&huc_to_gt(huc)->i915->drm,
> +				   "timed out waiting for MEI PXP init to load HuC\n");
> +		else
> +			MISSING_CASE(huc->delayed_load.status);
>   
>   		__gsc_init_error(huc);
>   	}

