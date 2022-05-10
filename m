Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9DC521184
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 11:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCA210F240;
	Tue, 10 May 2022 09:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C06610F23A;
 Tue, 10 May 2022 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652176545; x=1683712545;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EYUynNnL8mXfwYpAwh2cdCafhGvZcTP8sLBJ0xlUcKk=;
 b=BOjEx7OX3KgBS/g7bmkrObsKIP2Mbmz/Mt13in++4UkKcTAmXQLBw0so
 tlXgO1fbt5mydrnrdyh1sO98TykGa0VtipEny3VFmzuXxEJx6NIRgjMX/
 u79mHnF+ufXhInXXlm6Ir/dl9RPk1a1KKouUSHzVEnY63DPQ+OKIfGAcr
 pOCTwNlaiCqsQ4q5G2KTKWGxANIDleYiB58z8OI/+uUAdU2tFs5bSHqyq
 13gS2CyPXAcx60nK2xCBRMWqxBcueJqTFEf7BIRMbApN7Q1dPS+s2hE2t
 RyAjcV8EWTExYJ+7QkmJvA00cvk2X0Xykn5bVaA7P+CHuUZ2rhidomKEx w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269258284"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="269258284"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 02:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="697002824"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 10 May 2022 02:55:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 02:55:44 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 02:55:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 02:55:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 02:55:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kit1bfzVqimku9Iw/7FXXEFJUhVDb4I9Ap5wUeR61J++3yB1Zut3xZArdL8Lv3dkV6d70Z2CWxlm/wH4zcAb+npNYtZARFOvzSszG+3c+miQS/X01jV35NBSlfMmjn7+cARzFMdxebJu6cinMWBMfnEyZPVb7dbV9LPAVeyMRbe10zdU4jwolR2ETq2wqTuMdIsNQyTnET7Jq8TjXEixrEN+EsbUC40WFMVgvqzvpjDohIMp8oT0uEuo4FxkaW5WeUkAEmOu/3gn4zjm5X/YG7y3oy37oEOJJqWKUIiNYePpcQpjCyeQpAbPmsxnDdChmmaB0Vsbp7mCK4pQSWYTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPl4modzh+jm0Au4CukBlfCwak9PdOArdcVA9m+EFeI=;
 b=l1kdWfW129hKs6Izb/ZhvdD4+HRXG+IzNHw/19f0hsiXWnnHJqlBrE92ydrGm46pZ86zLH/8pg3mXJoebM6WxTCCo4pxurlWOI8n48+UCAiVJT6UzZYe2ujEzc9xvr2JSEiyL4PzEN9rxCVokhX4TNPPK25blfjghE88LQlAwSuSfNLcfmO1TQZamac9QFbGrbVdN59CenFKAi0/J6vWFTvjwMLPGgGzHQIc8tYRyoXYLhlFwxin1y9PLOpn0rAXeRGEVOzhicgFYIdY4f6+/gRpf42sCHsNGgEQM1GztGCgTssYWXwazflZDmRpXz5v5D6ZnK9MuAISgMW9sI2xZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA2PR11MB4908.namprd11.prod.outlook.com (2603:10b6:806:112::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Tue, 10 May
 2022 09:55:42 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 09:55:41 +0000
Message-ID: <c8ab63e1-eabd-f78a-824c-f460186a6e8b@intel.com>
Date: Tue, 10 May 2022 15:25:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 17/25] drm/edid: add drm_edid helper for
 drm_edid_to_sad()
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <14aa1e44caa2e9c1b54c2f2a471d2fd7d3f62d5d.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <14aa1e44caa2e9c1b54c2f2a471d2fd7d3f62d5d.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7fa6f17-0922-485c-32cb-08da326b3e2a
X-MS-TrafficTypeDiagnostic: SA2PR11MB4908:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SA2PR11MB4908A6B8503C24683371921DCEC99@SA2PR11MB4908.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /pb0KUL46bouwOmiE6ZSao3bJ4M7ACqhhnBcnyhpRTRQOxGbKLrD3Qipc/6xrn8aYC02+yGKrqYufvGwPDjlAocPmChnSTBXTWZocOia6JEpd6IcIxebP5FNmFZcLtROOtjOxfBd5Bz0CFxycTuDfUt+98Lq+xbUj1d9/IO94Q6vS0YRFZ4l4gn+LdG/BU8/SO55DV4YY4+9sR6kbxL+Q20BU+IblUS9or46oH2kwmw9EcQMQUgTlpw255D9PBoGl9MuwuQ0ILEMFPzQOqMSUmXjqMA0cGK5uMhmiXgmKMDYJYAUCm04PHj3kafwi0Cp4XE/goGqrQTfDvwlVEZbhAR0Ux852qswgZbDvvIQG3AqaT4HtmigZoyUlR4ZzcyPZ9dcFfZG6E9y3MSt7FLVSY+mlHEPN9bT+c1htDxWdck3a0P3xhz49ZaPEM2eu8WijZS07SpIpw/8KnnC0ucTISg+leUnAycFgtXMbLOlKjNnqL1cb+UjZks6pMejHwc9x0ROVWo+1IOFymYhFl428RSpNp6LLU5o7saovUsXugGl6K9ySzaD2Cm7FJZSkVr2cwfZAw9iDFr+LqpD2wo3RRyIwDqvyUKuvEMg64efAlMce82saCl7cJDM9Tk60ro9fDhsi+uIkFXN7aYNXHf0gJTL9+4II2GjdUftjJyWLnlYGhmjuWW7heZl4Grrs0/fKC6kx5rMyNG9/zMWvztb9YNDn8H0wmxw8WZWF3jbLQ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(31686004)(186003)(83380400001)(6512007)(2616005)(2906002)(26005)(36756003)(86362001)(6486002)(82960400001)(508600001)(8936002)(38100700002)(31696002)(5660300002)(66476007)(450100002)(66946007)(66556008)(8676002)(4326008)(6506007)(316002)(53546011)(55236004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGxoempYSnR5dC9KSnpyNHVRUmlJWXpHYWxhTFBXSS9XM3NzTDNYMUVFS1hk?=
 =?utf-8?B?QkJLYnRjdXl3NlY0T20ybXNLUVRLNEUzdy90MlEyNVNLR29UU1pQUHF4NWUz?=
 =?utf-8?B?TVhjN2pqRUJMZXhXb0YybnhKVDhFUnRRL05ON3BkOHBaeFBCZVgrOHZKTlZj?=
 =?utf-8?B?NDFabGp6Vlp2ZUhrR3hmSmxqdVo3SDdwSVgyR3lPRDRvWmZEUWIyUFREbHBp?=
 =?utf-8?B?Z2o3a0kxamI1TnNoQU9CMWZ6U0hXc0l3V2F2VjNLQzFyY2tNZWhKV2twYURP?=
 =?utf-8?B?b0daaDVWMkxnUUI5N2tiK0dLZjZnSWxaU1FQVXpIWXVnRHk1OC9hN1ZkanlL?=
 =?utf-8?B?U3FwSXM3aml5dHNmbldtTGNYQW9VbEhRSjM3eDRUL2F0M3RYYlY4Y0pKNlQ4?=
 =?utf-8?B?aWt4VjRveWFGYlpzdXF1bVhsVHhxcEtGb3pSYnB0b3RNQjVITlptQnBwekJN?=
 =?utf-8?B?c2g3N0ZLVnFaZVZHNHF1ZzJPTHhpcjVERndDbE1zZ0JkYXQ1YUd3aGR0Tk8w?=
 =?utf-8?B?bjNTbEJxWFNaZDZUUy8wdFNOTGRKOUVFSnVBTFZnTThTc3FkcXAzSElodVhX?=
 =?utf-8?B?OG9nN2hYR3hFTVZPRVd0bzBCRGhvaXkyOUNxQnZMN25lWGplWnI2bHhFV3lv?=
 =?utf-8?B?VWVyc044TEpGT1hCSEYvak5acHVRN0hIelZYcmwzazZMM2s2eFVSemJJNXdt?=
 =?utf-8?B?NytmSmo3R3pqMk01SWJ4SU81NkFnUkVDUkFOWDZwZlZZcmJrUDVkZ3EyRC9z?=
 =?utf-8?B?cFB4aGZ1YUsrUlZDdCs1SzJMeHBJclBycTJTR1FQSXRrZ25XSGx0cDhsdDhr?=
 =?utf-8?B?Y1IwdnMwbnZiMTJWZjNSTElydGlhMXN4eERGNCtZbUQwWXJ0bzFndUpmelhu?=
 =?utf-8?B?UkpqWFZacVNsQmhJT2RDOGVHTTk2NmhLK2VueTVHWWFRRzkrMU03WnpZWWtw?=
 =?utf-8?B?QTF3SE90NXFCVU9wbUg1ODRkUSt1NmNXY2F3SFpaRWU2WVd3dDNqTDN4V3M1?=
 =?utf-8?B?SXhGblJ1RGQzdENsN2VhNSsyNmZWdmVuQzh3bkFRRXJ2OTJ3NmJqN2FJZjJx?=
 =?utf-8?B?K2xwQUZpeWFjME5MZFRGVHpLUCt3OWdmdEhUbi9PUXlKZ08xSkRtVE5lMUd5?=
 =?utf-8?B?RmVHb3FqT2lZMStmRWsyb1g4UUxDZUJZSHRxQ0NzeDE5U1ZnZXlpS2lMZ1Q0?=
 =?utf-8?B?dlczT2NzbFlBTE90QUdiYzdZdXh6VTVFNkV5THFLYW5iVi9vNHZ2ZSsrSkY5?=
 =?utf-8?B?V0hUNHg2Wm11aENiL0RGczAwS2JlOXluNmtIdzAwTkNwcDd2WDJqYkpWVEdr?=
 =?utf-8?B?TUVmaGRmekNpRDVPTzUyUld3QndEQ1BGTXZKbnpSZ3VJaDNkSDl6NnNZL1Fh?=
 =?utf-8?B?YlVoYjhSZWR0RFV1VElmcWE3V0FxeUZqWlA3T25yWHd2NmJaUnMzOWFRMysz?=
 =?utf-8?B?TTk0bXNkTmUxcDhzVE40bERLUTNVOGo2ZUJoVjd0S0UyRjBWYXBVL09IVk1N?=
 =?utf-8?B?V2ZTUyttU2crR2o3eUVPOVNmV0ZmckM3YnQrQWlleWticWJ2aktFNDJkelJO?=
 =?utf-8?B?Tm1jVDMxc3BIZmZBT013WlZYK05OYkNZY3pDZXV6d3ExL1QxNWd2aEpvMGRB?=
 =?utf-8?B?NE5xQzFsYm9zZVVSRjNuMWRJcTJzc0xjVkpKeDNwL1p2K2wyYjNSYjJFZGNE?=
 =?utf-8?B?VVdCcXRVYVduV0VkSHFqcWp1M1lQaGFaT3ZYVmxiaFhLZFZ1TTFUWFZteE1U?=
 =?utf-8?B?ZG1LMlhzOXVIazFIUDhYbkEwK0ZyUW92eGU3ckJyMDVROElwMjkxeGZsR21o?=
 =?utf-8?B?S2NMVEZ3UVdiS0dNamg5QkNXcFFVdHRrN2xCZGJvRWtoOENkWFc5dGdpNXNU?=
 =?utf-8?B?cHN4WndlWC83SlNjSTBIL0ZnblhMakg5TWZjRDBVaEhJVVRWOStMOUJtZzdx?=
 =?utf-8?B?a0dYbjFYSWVMMDFEQ0JQbHIyVG9PeTBhUUJFQkMzMDFoQWxFOVJoQ1pNbVZh?=
 =?utf-8?B?WXJINTBzRGVhYy90dGtacEpiTGtRekY3bnZkMUpHOGRianVQOWdMQXh0TUJ5?=
 =?utf-8?B?UjduZUZmYngvMkY5SmREbGlvN05qdElEMzVrNmpMRkN2MWUvSE9UNjJDNDhR?=
 =?utf-8?B?OWtkOHVHcGFKSWEwMFJLNWZxcWhWZjFQSE0xMmpvZ0krMG9CcmdvYnpnd1Jx?=
 =?utf-8?B?RUZwSzh5OE85YWFLNWZlNGpIcURPL1IzdkJEZkZyNVdjdUdqWHEwaUlEVjFS?=
 =?utf-8?B?djdPU3M3eW5wQWpZa3FOa0pSNzYvR1JsaDFhTXFKeWFXd2dxVi9WdW1Nd1p0?=
 =?utf-8?B?UnVSajg0bDZsUHZzOWtJVHZRYzNWMHF6TnovcldhMGd1QkFQcWxzWVNjVm9N?=
 =?utf-8?Q?NifcgNnfKB/KB0OI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fa6f17-0922-485c-32cb-08da326b3e2a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 09:55:41.5625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/5M2kJq3xymRQ7Bi4jUvX78N4Ur4UG7sgsIh3Bjfnb02fK79rJnLSrp+7VFwQ1YApnxpJKTK62L0yo4eu7aLfQk6/hHNEH0qBaxptSHLlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4908
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
> v2: Handle NULL EDID pointer (Ville, CI)
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>


LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

> ---
>   drivers/gpu/drm/drm_edid.c | 34 +++++++++++++++++++++-------------
>   1 file changed, 21 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 61551ce0db88..dee09359bbc3 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4972,24 +4972,14 @@ static void drm_edid_to_eld(struct drm_connector *connector,
>   		      drm_eld_size(eld), total_sad_count);
>   }
>   
> -/**
> - * drm_edid_to_sad - extracts SADs from EDID
> - * @edid: EDID to parse
> - * @sads: pointer that will be set to the extracted SADs
> - *
> - * Looks for CEA EDID block and extracts SADs (Short Audio Descriptors) from it.
> - *
> - * Note: The returned pointer needs to be freed using kfree().
> - *
> - * Return: The number of found SADs or negative number on error.
> - */
> -int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
> +static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
> +			    struct cea_sad **sads)
>   {
>   	const struct cea_db *db;
>   	struct cea_db_iter iter;
>   	int count = 0;
>   
> -	cea_db_iter_edid_begin(edid, &iter);
> +	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		if (cea_db_tag(db) == CTA_DB_AUDIO) {
>   			int j;
> @@ -5015,6 +5005,24 @@ int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
>   
>   	return count;
>   }
> +
> +/**
> + * drm_edid_to_sad - extracts SADs from EDID
> + * @edid: EDID to parse
> + * @sads: pointer that will be set to the extracted SADs
> + *
> + * Looks for CEA EDID block and extracts SADs (Short Audio Descriptors) from it.
> + *
> + * Note: The returned pointer needs to be freed using kfree().
> + *
> + * Return: The number of found SADs or negative number on error.
> + */
> +int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
> +{
> +	struct drm_edid drm_edid;
> +
> +	return _drm_edid_to_sad(drm_edid_legacy_init(&drm_edid, edid), sads);
> +}
>   EXPORT_SYMBOL(drm_edid_to_sad);
>   
>   /**
