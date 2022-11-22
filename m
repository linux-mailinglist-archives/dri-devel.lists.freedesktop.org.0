Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71A1634AF3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB1E10E498;
	Tue, 22 Nov 2022 23:15:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DF110E495;
 Tue, 22 Nov 2022 23:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669158929; x=1700694929;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lfq27iGIDyuQQLjqb1np5RksYEdkUUiSTtMMNkQHnX0=;
 b=YGTGsyUBSXbLAba126NPgoNfSyyLvyqlobvVGrulo8HHKh7mYKCNmm5w
 /rXXrkViJCLHRheCudvKFCKmrTidVAOGPsdU2gsLMFsssE7ltS3YNT7HW
 sOSUctIg0YVrnRWCwTTSXvRsZyOgymtGK5xjIVtfsbRTi/mDESji7iBqX
 jdRk72dmxGpjmiz5beGT54amrOeMnacUyYAfMsFRYYxWltGr2ix58KVeT
 Yr7B7zc7Ip/XIYlnDSOisu/GBCWVaBcmm4u/dS1e+JbKbWU+UQcKrPA4B
 KzlIwIVI5Smxn87qLTstH/yZjxwzQjYZGLftiwsH2tD+AxU3fVk9+PHcz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="311562346"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="311562346"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 15:15:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="641582761"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="641582761"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 22 Nov 2022 15:15:27 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.13; Tue, 22 Nov 2022 15:15:27 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 15:15:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 15:15:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 15:15:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYI4/YDNa3MyO1XHh6v6iVOSYMGPXMrWhbvVqz5auzAh20MsjOdFAlcE/VgBybCfaVOz3Vkz6yqM7xbJtiqjEXvtMknWblJ1xBi2QIa35yPTjJzVE2v4Tri1qnEXQEoGpuqgymb7Yqmhus9f78iy3lbYqtTRApjQlNtkhbjhljhKO2q70Fz6OZOFF/OP4Cuz5V+J/H5Gz347Ud83ss3/dn5nliCIxwl9y9IaCo1GbQCG4D1NzVUQ0+ENOCDeiws1s62TBcqCl5b5xrOVOtb72k71P8yp4VVXo1sggWU1ad56iuOnOtaFgWHonsfoqDjSJ/37ikXP64fqPkZ17ltH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34+CL/eo23pbjgtwhzfUiJvLL54XNQ4OGLJJWiwaOBQ=;
 b=JrK7k30QakFgCUO6nyz3IF0AHIv/EDtu8prKte/goi4jCBsJOzxOFs2gzQNiy9q2vSC0NritNK4BR96KHxL8udDwYImWDNaH9CKFbjjPu+aB2JYZR+9f2dBPfvAA3Njijw9JiKaJkfQ3nARcZkkPReKvZWH65lkWmGNWt93O3xpxwVvMVCQv4LcmZsLLxATBm9rh50O6Jl6/19V7dTKbS2+DZ7KjeHMrA4IIFhZDb2LflwUmH5hQqdQ50IedioGEX8qn9VBRjFxfQnt2IVFV5+V5oW3RYShFN6miTifQrW1895/wwS68XFrnzhgKM7taPN+COokaEA4/mYtl7UKIcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM4PR11MB5311.namprd11.prod.outlook.com (2603:10b6:5:392::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Tue, 22 Nov 2022 23:15:09 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%5]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 23:15:09 +0000
Message-ID: <d0bf1a17-0da4-cd76-3c88-39639672f965@intel.com>
Date: Tue, 22 Nov 2022 15:15:06 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/3] drm/i915/uc: Rationalise delimiters in filename macros
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221122200915.680629-1-John.C.Harrison@Intel.com>
 <20221122200915.680629-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221122200915.680629-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::16) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DM4PR11MB5311:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d09edf-cd49-4eef-9ea5-08daccdf662e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UH7F0cblBRPHvldCD0GgdHgmmK1Uwav0gcfpI7HLRTRB0aL9LYmNoMHdZR6ysatiAd830t8HZEvxTRraqrc+Tg2SMwT+Jbs8EoaLM0gDAO6+GF9c/QGb/DyUZVZbotYgIGzbgJpsTX4FcUIUAgsq0IwFTrhCYApNbdxBHnUZw2ni9t68KSjcH3/MSAUwUZnHVEnJyWJrHUjZWWTe/L9rEfuOOCfD60gH6AKue6DlsXZ5KqmcuZAnqxO+7STUwA10/2O4inu+EgQjPcijCgwyeHvJWFzEIMa98ILw1kBjgvGAjMpcDLoq2QMA9ieSvtxIVz6FPMY8pjDHVXryOF387RVH2Hz07rhlZ8iEL2BnIFWNY3yco7s2J4miIH7IIwKqT0JvuiDbXPR9XMC9/W47VJQCFyXQxtiGFjMh3jpZXUT1CUZ1cN4/l0CPKaVEhTTcvLRKhe3z5yDPL5FUpkYKqJ1us1mZGAIMgLOfkQRKATRQllkEdPWsIW68VGVHfdVCvzohk7ZV9IkqstYN/ILHUbWpaVP41Wjfe8QqbMK3mxdJvlCZoa4/OJvEji42FV1UV6vDxAHHqw2oQgJmeZbn+NRHXMNFu8UaUPKLrGcvxuLvy2EicXpuGul4HPyZGcsexjF1RynyNdq6frYmvoV0KfWPDZzWZAooIo8+d6l48bI23pnXJd0oL/EsXDagdmvsV/56TT3iUu6Hg99z6Vd5OzH94k7xLOR0M6esEjrHHsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199015)(36756003)(31686004)(31696002)(86362001)(26005)(5660300002)(38100700002)(2906002)(2616005)(186003)(83380400001)(6512007)(82960400001)(53546011)(450100002)(66556008)(6486002)(6506007)(41300700001)(4326008)(66476007)(8936002)(478600001)(8676002)(6666004)(66946007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0MwSFphRjNhVmdhcmFBdnpvZWVWekxBUDdxWDVTMU5tWUt1bnBjWWJmbGtH?=
 =?utf-8?B?YS9RYmNmdDh4NzJTdXhJc2Qvaitxb08zUzJSc1hBUkIxQ0pDbHVoVW5jb1FO?=
 =?utf-8?B?Y0RGSXovZHQ2ak1SS2dqS1QvK1hUY2dXOTdaMmZsNVQyUXRJTFM2SU1hVnAr?=
 =?utf-8?B?ZUUwSDJ0dmtWYmkvc0JpNk1nZVRDVDZyd3dSK2lEcjcxZjZOa2NVeG9ySllo?=
 =?utf-8?B?eGUvM015SDR6ekJVNkxSb2FxUGduY1FVVTJRcXRrTzcxOUtCNFd2NmlPUzI5?=
 =?utf-8?B?MTliRVR3S3FIT1FtSzFDUGVEbGZlL0xSZTF0RUlBUjdYY2lqbm5wUDN4OHRK?=
 =?utf-8?B?cENIeTloazh1TGZ1cG03dzdRM3pWWHpTZm1Ha0loK0Q2OVJibDhyekxTeWtK?=
 =?utf-8?B?V0F4VFh3RVBhemVxZEN2SFRVMHhsTU9Mcjd1cG9SUzhmM3dPb0U2R1pESERV?=
 =?utf-8?B?SmUzMTg4ZHFKRWpzeWhTUWFwcWwvRTFYZUZmZ2luSDdzSWtGeWtXY1VySHZU?=
 =?utf-8?B?Z3ppcVRRblcvejNWdUpjSTZqV0tNU21wTW4vTmJ5elZlQU5jNDNHbzJGWEYr?=
 =?utf-8?B?TE9aWDVjYnkrRlVJWlZSNUlBSjhBK2lZbWwvNDNlN0NFaUdtWlpxSVpwTjhO?=
 =?utf-8?B?VUN6NGh6dHlYRFJ0TVpqeFVWNktUbDVZNVpOKzNBWnJvdFFWNW9wVlh1YlNj?=
 =?utf-8?B?Y2xuc0tpbVA5QmxiaERoQ0l3OTdOTkRhOGJJRTV5b3dQWittdzNCelhKaWtt?=
 =?utf-8?B?WlpYYittdTA2YXY3cERPUlI0KzZ3dTZmMDRhampkRjB6aWlDZnMweGd0Yk1v?=
 =?utf-8?B?SC9uQlY3Y0F6d2I4UGlvNk9KaThmcGxxRDk4cmZSV3FkdndDU0tIdnZJSFA5?=
 =?utf-8?B?M3dHT3FySFlSc2ppK3QyUlJFTWV0OWNGYnBBcWJRRlZvRTF4SjFQN01qTnVn?=
 =?utf-8?B?bTY3ZGFHeE84NmFwWG9ZR3ozS1lxa0VaOWtrUnB4WmRzZkFIeE5DdEhCcitx?=
 =?utf-8?B?STFQR0pmSW5sOWFoUmlBQk5xQWlPeXVIWmIveERUVWJ3cVNLK3c4aFBtYVlj?=
 =?utf-8?B?c2o4dEhwbFlSeE1FZExFL1hsY1RsZStVYXI4ekI0ckovcEZ2REJQMTBsZlcv?=
 =?utf-8?B?S04yVythTjk1NTFFR0k0WlVHWEFEQ1JRL3pVYUFlSkx2R3hQcm93bXhnUG5q?=
 =?utf-8?B?L29RenhFeks0Vy9XVUE1cmtWUE9pZnZOVHhaTGQ0S0crNkczNDBGb2JtdDBi?=
 =?utf-8?B?RGNCdTBDUnNuUkhuR2czOUdSazZTeHFtWWZJOTVzMzBXcEEzWmdzM05NVFdz?=
 =?utf-8?B?Qm5LMXlQTjE5c3ZZR1RDZ1FiYmxveGR3TmRLSDRFM2Q4TEZzTC9ublVNZ0hu?=
 =?utf-8?B?Zm9uWVdpV0xlUi95eDJWbUR4eUw4a0V0bTMvK2xEd0tYa1hDMkZWbnhlWWxQ?=
 =?utf-8?B?OWcwSjRlaW9qMDR4cUxmZmIwQ3FCVEwyUkpQVitiVHZ2eUtpTHBtY3laWm1y?=
 =?utf-8?B?NHNMc1k1Mnh0OXFNOHg2b2Vvck1kT0ZvZG52MERnWFQ5WElaVjliQ21qQlFL?=
 =?utf-8?B?ZVZ4d09FMmZQOHMyYVBhRjN3ZTlXUnV2ajZKYXJGSGUxZzB2V0Y4aEdRZWpY?=
 =?utf-8?B?dVBvS0dKWmlDN1dxOXRmQzNDeHNwZTYybFJoaDVRQzhCWHVMelZEb2Urclc2?=
 =?utf-8?B?ZndiSVI4c3pOZWZpajIwWWxKR3FZaHdyV1NFdGdLSzYxV3JpZFFtNkVEM0xF?=
 =?utf-8?B?cEJvN1BlVy9SbzNaNS9aUmg2Vmo3Y3dheVJFOEdlMDRNMCt1cm9BR1FHclQ3?=
 =?utf-8?B?cFlzRkJoT01QcVhiUzRpQkRvandqTE9YdUVLRjI3Vnk3ckh0RWlTcjlTVWlC?=
 =?utf-8?B?YzgvYjdzSjhHemY1QXBjMXk3aGUyUDlRL1pJZzAwSUlSSGd6cll4WGM5YkdY?=
 =?utf-8?B?MDVIbCt1djVCdE9DK040VGdmMk1oWXAwd3l2b1gvYnpPbTRRenZRdGdYS1k3?=
 =?utf-8?B?dFUzNVY0M2tFVzU0aFNtdW5HdXNyMVpNcHZPdnoxaWpaWFJxcy9HRHBWd1ZO?=
 =?utf-8?B?SGh2c2taWmQvNHVNbEo2RkZMOGxhNk81OHpZb1UwbGJBWWsreDBBWHZ5UVRG?=
 =?utf-8?B?bzYxNkh5QVYrNEdWSi8vL1dVMFM2NU1sWHpqd0FKK2dkYVRJWml1SXNwaDJj?=
 =?utf-8?Q?8B6Yg/OUWWx32zG4TbxPBYw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d09edf-cd49-4eef-9ea5-08daccdf662e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 23:15:09.2638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2G/j7WsRXKYmuAX3r/ZBb83fSoIWvDfllHoLj+a9eXcOCxI7qVRHacAgtJ64LaG4lnkeAodyjmj8gw6OvE6jbx0wvW8ewL4BtpObYt4tDvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5311
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



On 11/22/2022 12:09 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The way delimieters (underscores and dots) were added to the UC
> filenames was different for different types of delimter. Rationalise

delimiter misspelled twice. Apart from this, it's a simple cleanup, so:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> them to all be done the same way - implicitly in the concatenation
> macro rather than explicitly in the file name prefix.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 0c80ba51a4bdc..774c3d84a4243 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -118,35 +118,35 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    */
>   #define __MAKE_UC_FW_PATH_BLANK(prefix_, name_) \
>   	"i915/" \
> -	__stringify(prefix_) name_ ".bin"
> +	__stringify(prefix_) "_" name_ ".bin"
>   
>   #define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
>   	"i915/" \
> -	__stringify(prefix_) name_ \
> +	__stringify(prefix_) "_" name_ "_" \
>   	__stringify(major_) ".bin"
>   
>   #define __MAKE_UC_FW_PATH_MMP(prefix_, name_, major_, minor_, patch_) \
>   	"i915/" \
> -	__stringify(prefix_) name_ \
> +	__stringify(prefix_) "_" name_  "_" \
>   	__stringify(major_) "." \
>   	__stringify(minor_) "." \
>   	__stringify(patch_) ".bin"
>   
>   /* Minor for internal driver use, not part of file name */
>   #define MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_) \
> -	__MAKE_UC_FW_PATH_MAJOR(prefix_, "_guc_", major_)
> +	__MAKE_UC_FW_PATH_MAJOR(prefix_, "guc", major_)
>   
>   #define MAKE_GUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
> -	__MAKE_UC_FW_PATH_MMP(prefix_, "_guc_", major_, minor_, patch_)
> +	__MAKE_UC_FW_PATH_MMP(prefix_, "guc", major_, minor_, patch_)
>   
>   #define MAKE_HUC_FW_PATH_BLANK(prefix_) \
> -	__MAKE_UC_FW_PATH_BLANK(prefix_, "_huc")
> +	__MAKE_UC_FW_PATH_BLANK(prefix_, "huc")
>   
>   #define MAKE_HUC_FW_PATH_GSC(prefix_) \
> -	__MAKE_UC_FW_PATH_BLANK(prefix_, "_huc_gsc")
> +	__MAKE_UC_FW_PATH_BLANK(prefix_, "huc_gsc")
>   
>   #define MAKE_HUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
> -	__MAKE_UC_FW_PATH_MMP(prefix_, "_huc_", major_, minor_, patch_)
> +	__MAKE_UC_FW_PATH_MMP(prefix_, "huc", major_, minor_, patch_)
>   
>   /*
>    * All blobs need to be declared via MODULE_FIRMWARE().

