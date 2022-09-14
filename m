Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19025B865F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 12:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8044A10E00A;
	Wed, 14 Sep 2022 10:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C636D10E004;
 Wed, 14 Sep 2022 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663151319; x=1694687319;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZSlzwJQZ+dQAcH3lqxXiFp/4ZF299mZ6B7sOpuv93AU=;
 b=GdO1TIbSqJU6DTpuLjJD0vESgRNngqBHCXAPn/aeHz3Vk0xgiIqx1HZa
 7nGPJH3IgN4HCbpQEURqSqIiaPr13sblvMbrGVlLgVUGeR1NmHZY4hbem
 GExbfDXXiKUNV1dnBjMPwXfFaE/MRuuddLQtnU28B6+ol7OivSdWslDwD
 Sm8h6h4TXTH3CKieG1SY1oVaNUkYfmTc01tLiOBlvtM/nCa0WYLOlcPC9
 SAZ7cCQwa+5O2MDeBlYoUVz3anPA/jlpKb+7+F7QNEVbdSfqG0Zelo5/Y
 MvzdRJ5b7MOCM8LKhMjwZ3kId0lc10VUKnep1xqN1Hm9KVPN217Uw6r0Y A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="299752104"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="299752104"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 03:28:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="678988686"
Received: from dbrayfor-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.32.164])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 03:28:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 intel-gfx@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/4] drm: Add missing DP DSC extended capability
 definitions.
In-Reply-To: <20220913141417.8131-2-stanislav.lisovskiy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220913141417.8131-1-stanislav.lisovskiy@intel.com>
 <20220913141417.8131-2-stanislav.lisovskiy@intel.com>
Date: Wed, 14 Sep 2022 13:28:30 +0300
Message-ID: <87czby2qsx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Stanislav.Lisovskiy@intel.com, manasi.d.navare@intel.com,
 jani.saarinen@intel.com, dri-devel@lists.freedesktop.org,
 vinod.govindapillai@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Sep 2022, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com> wrote:
> Adding DP DSC register definitions, we might need for further
> DSC implementation, supporting MST and DP branch pass-through mode.
>
> v2: - Fixed checkpatch comment warning
> v3: - Removed function which is not yet used(Jani Nikula)
>
> Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

Maarten, Maxime, Thomas -

Retry, can we get an ack for merging this one via drm-intel-next?

Thanks,
Jani.


> ---
>  include/drm/display/drm_dp.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index e934aab357be..9bc22a02874d 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -240,6 +240,8 @@
>  #define DP_DSC_SUPPORT                      0x060   /* DP 1.4 */
>  # define DP_DSC_DECOMPRESSION_IS_SUPPORTED  (1 << 0)
>  # define DP_DSC_PASSTHROUGH_IS_SUPPORTED    (1 << 1)
> +# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_COMP_TO_COMP    (1 << 2)
> +# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_UNCOMP_TO_COMP  (1 << 3)
>  
>  #define DP_DSC_REV                          0x061
>  # define DP_DSC_MAJOR_MASK                  (0xf << 0)
> @@ -278,12 +280,15 @@
>  
>  #define DP_DSC_BLK_PREDICTION_SUPPORT       0x066
>  # define DP_DSC_BLK_PREDICTION_IS_SUPPORTED (1 << 0)
> +# define DP_DSC_RGB_COLOR_CONV_BYPASS_SUPPORT (1 << 1)
>  
>  #define DP_DSC_MAX_BITS_PER_PIXEL_LOW       0x067   /* eDP 1.4 */
>  
>  #define DP_DSC_MAX_BITS_PER_PIXEL_HI        0x068   /* eDP 1.4 */
>  # define DP_DSC_MAX_BITS_PER_PIXEL_HI_MASK  (0x3 << 0)
>  # define DP_DSC_MAX_BITS_PER_PIXEL_HI_SHIFT 8
> +# define DP_DSC_MAX_BPP_DELTA_VERSION_MASK  0x06
> +# define DP_DSC_MAX_BPP_DELTA_AVAILABILITY  0x08
>  
>  #define DP_DSC_DEC_COLOR_FORMAT_CAP         0x069
>  # define DP_DSC_RGB                         (1 << 0)
> @@ -345,11 +350,13 @@
>  # define DP_DSC_24_PER_DP_DSC_SINK          (1 << 2)
>  
>  #define DP_DSC_BITS_PER_PIXEL_INC           0x06F
> +# define DP_DSC_RGB_YCbCr444_MAX_BPP_DELTA_MASK 0x1f
> +# define DP_DSC_RGB_YCbCr420_MAX_BPP_DELTA_MASK 0xe0
>  # define DP_DSC_BITS_PER_PIXEL_1_16         0x0
>  # define DP_DSC_BITS_PER_PIXEL_1_8          0x1
>  # define DP_DSC_BITS_PER_PIXEL_1_4          0x2
>  # define DP_DSC_BITS_PER_PIXEL_1_2          0x3
> -# define DP_DSC_BITS_PER_PIXEL_1            0x4
> +# define DP_DSC_BITS_PER_PIXEL_1_1          0x4
>  
>  #define DP_PSR_SUPPORT                      0x070   /* XXX 1.2? */
>  # define DP_PSR_IS_SUPPORTED                1

-- 
Jani Nikula, Intel Open Source Graphics Center
