Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5401F64B1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 11:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5576E8C0;
	Thu, 11 Jun 2020 09:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8DE6E060;
 Thu, 11 Jun 2020 09:26:02 +0000 (UTC)
IronPort-SDR: 7CBmPK5Vpixkh5dvHCE5/ibjLU6BpPi6sxlKtU5Vdfrj1kev8dFdueVEgEWWuD5nK0fZ64EeCB
 0KkbVe8b4SGg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 02:26:01 -0700
IronPort-SDR: GPQzoh9Bx+RX+Tk1e1fWY7vAqHvvL6Vq+NjhyiNCj6ZIYNqwYaoN9QIW4YBXJ9HM4rjEvW7NKE
 rWf9khWxisEw==
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; d="scan'208";a="447857473"
Received: from cstenzel-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.45.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 02:25:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 2/5] drm: add constant N value in helper file
In-Reply-To: <20200609034047.9407-1-tanmay@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200609034047.9407-1-tanmay@codeaurora.org>
Date: Thu, 11 Jun 2020 12:25:54 +0300
Message-ID: <87mu5avtr1.fsf@intel.com>
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, Tanmay Shah <tanmay@codeaurora.org>,
 swboyd@chromium.org, seanpaul@chromium.org, abhinavk@codeaurora.org,
 Vara Reddy <varar@codeaurora.org>, sam@ravnborg.org, linux-clk@vger.kernel.org,
 chandanu@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 08 Jun 2020, Tanmay Shah <tanmay@codeaurora.org> wrote:
> From: Chandan Uddaraju <chandanu@codeaurora.org>
>
> The constant N value (0x8000) is used by i915 DP
> driver. Define this value in dp helper header file
> to use in multiple Display Port drivers. Change
> i915 driver accordingly.
>
> Change in v6: Change commit message
>
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via drm-misc if that helps you.


> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 2 +-
>  include/drm/drm_dp_helper.h                  | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 9ea1a39..4b2cfff 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8085,7 +8085,7 @@ static void compute_m_n(unsigned int m, unsigned int n,
>  	 * which the devices expect also in synchronous clock mode.
>  	 */
>  	if (constant_n)
> -		*ret_n = 0x8000;
> +		*ret_n = DP_LINK_CONSTANT_N_VALUE;
>  	else
>  		*ret_n = min_t(unsigned int, roundup_pow_of_two(n), DATA_LINK_N_MAX);
>  
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 2035ac4..589132a 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1134,6 +1134,7 @@
>  #define DP_MST_PHYSICAL_PORT_0 0
>  #define DP_MST_LOGICAL_PORT_0 8
>  
> +#define DP_LINK_CONSTANT_N_VALUE 0x8000
>  #define DP_LINK_STATUS_SIZE	   6
>  bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
>  			  int lane_count);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
