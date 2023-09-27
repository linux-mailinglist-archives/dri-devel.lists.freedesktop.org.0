Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129F07B03E1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 14:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8BC10E4FA;
	Wed, 27 Sep 2023 12:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296F410E4FA;
 Wed, 27 Sep 2023 12:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695817238; x=1727353238;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Z9BegjDKZAV6DSysUCO/fVGXA4LIFZxHklWEtaMzQnE=;
 b=BbJR4A3aqZ6vL6cvKdObK2bGOi/oSXV1RAudMXl9t91vmiynuQ/qduWl
 fOhIa6MyqlOv6Z7H+eB6qoE7WEzMKm5i+GSBqFC+8KcGx1/N/PiZCY65P
 I8U1SKzQLFx/kHEAzr7fs/6z+iiZfpwqjSDV384EIh3GioTE/jOK3G1zZ
 YoDCRN90CsVBqwoO0mRmhP1dE0KO0omBIRPTKBGl4Pl2F2RsYKClTzFp6
 QtsfOri+ouEIaM7zPeRzadeCO4b/nxRQvxSLBp/81kND/g6ytjlItUEXl
 nX8f/Ds+Te9HIJQgxSjkUki4aXhbmk++NeeZmACz6RLLPHKM6lAuxzO1N g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381711580"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="381711580"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752552141"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="752552141"
Received: from clkuhl-mobl.amr.corp.intel.com ([10.252.53.225])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:19:59 -0700
Date: Wed, 27 Sep 2023 15:19:56 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 07/15] platform/x86/amd/pmf: Add support update p3t limit
In-Reply-To: <20230922175056.244940-8-Shyam-sundar.S-k@amd.com>
Message-ID: <234e7986-1afe-f2e9-38a-e7eccecfb066@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-8-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, hdegoede@redhat.com, benjamin.tissoires@redhat.com,
 mario.limonciello@amd.com, linux-input@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Sep 2023, Shyam Sundar S K wrote:

> P3T (Peak Package Power Limit) is a metric within the SMU controller
> that can influence the power limits. Add support from the driver
> to update P3T limits accordingly.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    | 3 +++
>  drivers/platform/x86/amd/pmf/tee-if.c | 8 ++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index e64b4d285624..897f61b75e2f 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -46,6 +46,7 @@
>  #define GET_STT_MIN_LIMIT	0x1F
>  #define GET_STT_LIMIT_APU	0x20
>  #define GET_STT_LIMIT_HS2	0x21
> +#define SET_P3T				0x23 /* P3T: Peak Package Power Limit */
>  
>  /* OS slider update notification */
>  #define DC_BEST_PERF		0
> @@ -69,6 +70,7 @@
>  #define PMF_POLICY_STT_MIN					6
>  #define PMF_POLICY_STT_SKINTEMP_APU				7
>  #define PMF_POLICY_STT_SKINTEMP_HS2				8
> +#define PMF_POLICY_P3T						38
>  
>  /* TA macros */
>  #define PMF_TA_IF_VERSION__MAJOR				1
> @@ -472,6 +474,7 @@ struct pmf_action_table {
>  	unsigned long stt_minlimit; /* in mW */
>  	unsigned long stt_skintemp_apu; /* in C */
>  	unsigned long stt_skintemp_hs2; /* in C */
> +	unsigned long p3t_limit; /* in mW */
>  };
>  
>  /* Input conditions */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index eb25d5ce3a9a..883dd143375a 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -105,6 +105,14 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  				dev->prev_data->stt_skintemp_hs2 = val;
>  			}
>  			break;
> +
> +		case PMF_POLICY_P3T:
> +			if (dev->prev_data->p3t_limit != val) {
> +				amd_pmf_send_cmd(dev, SET_P3T, false, val, NULL);
> +				dev_dbg(dev->dev, "update P3T : %d\n", val);

%d vs u32

> +				dev->prev_data->p3t_limit = val;

unsigned long vs u32 ? (as in the other patch)


-- 
 i.

