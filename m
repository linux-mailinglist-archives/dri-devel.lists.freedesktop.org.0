Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4B45AEF28
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 17:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECD210E6E7;
	Tue,  6 Sep 2022 15:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB7F10E6E4;
 Tue,  6 Sep 2022 15:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662479023; x=1694015023;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=CaMgLHEjsfrl4wy2+FqMtiXTpfVitXdiE74La0RhvIU=;
 b=ZAWW3/oHQhcAeceFAWn8ailtwn+QE4RAvneKhFA1s4XrbIy1K+rBCGI2
 d1zpf+AcfUfHaLgZrtIEBxHsT3zAfuay2pjV2Yj/uNp0K/YuTDYCr0HbR
 MBlgoeyfgk8tTpiC3VSvcLvonlOJaXoz04Dm9pPNjKbAudz9I2iIQn8+U
 UoD0LC63vJEWN1Zh7I18NP6RkB1HHwYVXDesbspYGjuVdwyEuHzt0Dr8M
 rn4YAvxMZiCNhPTnoqSTavHOCh7Pf09QwUlmjECEcy/DSZ8ETor7o0We4
 17L7zU/H+DOvm6PN95KjCdHNjzhYbYcIBJ5n2BZHmf9k6R/6/gi1ViKwb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="382922938"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="382922938"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 08:43:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="644215558"
Received: from amomin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.44.228])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 08:43:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/4] drm: Add missing DP DSC extended capability
 definitions.
In-Reply-To: <8735d4a7vm.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220905085744.29637-1-stanislav.lisovskiy@intel.com>
 <20220905085744.29637-2-stanislav.lisovskiy@intel.com>
 <8735d4a7vm.fsf@intel.com>
Date: Tue, 06 Sep 2022 18:43:22 +0300
Message-ID: <87sfl48q5h.fsf@intel.com>
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
Cc: manasi.d.navare@intel.com, vinod.govindapillai@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Sep 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> On Mon, 05 Sep 2022, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com> wrote:
>> Adding DP DSC register definitions, we might need for further
>> DSC implementation, supporting MST and DP branch pass-through mode.
>>
>> v2: - Fixed checkpatch comment warning
>> v3: - Removed function which is not yet used(Jani Nikula)
>>
>> Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>>
>> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>
> Maarten, Maxime, Thomas -
>
> So this got pushed to drm-intel-next without your acks. Apologies. Can
> we live with it, or want a revert?

I've reverted anyway for other reasons. But can we have an ack for the
future? :)

BR,
Jani.

>
>
> BR,
> Jani.
>
>
>> ---
>>  include/drm/display/drm_dp.h | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
>> index 6c0871164771..02c4b6f20478 100644
>> --- a/include/drm/display/drm_dp.h
>> +++ b/include/drm/display/drm_dp.h
>> @@ -239,6 +239,9 @@
>>  
>>  #define DP_DSC_SUPPORT                      0x060   /* DP 1.4 */
>>  # define DP_DSC_DECOMPRESSION_IS_SUPPORTED  (1 << 0)
>> +# define DP_DSC_PASS_THROUGH_IS_SUPPORTED   (1 << 1)
>> +# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_COMP_TO_COMP    (1 << 2)
>> +# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_UNCOMP_TO_COMP  (1 << 3)
>>  
>>  #define DP_DSC_REV                          0x061
>>  # define DP_DSC_MAJOR_MASK                  (0xf << 0)
>> @@ -277,12 +280,15 @@
>>  
>>  #define DP_DSC_BLK_PREDICTION_SUPPORT       0x066
>>  # define DP_DSC_BLK_PREDICTION_IS_SUPPORTED (1 << 0)
>> +# define DP_DSC_RGB_COLOR_CONV_BYPASS_SUPPORT (1 << 1)
>>  
>>  #define DP_DSC_MAX_BITS_PER_PIXEL_LOW       0x067   /* eDP 1.4 */
>>  
>>  #define DP_DSC_MAX_BITS_PER_PIXEL_HI        0x068   /* eDP 1.4 */
>>  # define DP_DSC_MAX_BITS_PER_PIXEL_HI_MASK  (0x3 << 0)
>>  # define DP_DSC_MAX_BITS_PER_PIXEL_HI_SHIFT 8
>> +# define DP_DSC_MAX_BPP_DELTA_VERSION_MASK  0x06
>> +# define DP_DSC_MAX_BPP_DELTA_AVAILABILITY  0x08
>>  
>>  #define DP_DSC_DEC_COLOR_FORMAT_CAP         0x069
>>  # define DP_DSC_RGB                         (1 << 0)
>> @@ -344,11 +350,13 @@
>>  # define DP_DSC_24_PER_DP_DSC_SINK          (1 << 2)
>>  
>>  #define DP_DSC_BITS_PER_PIXEL_INC           0x06F
>> +# define DP_DSC_RGB_YCbCr444_MAX_BPP_DELTA_MASK 0x1f
>> +# define DP_DSC_RGB_YCbCr420_MAX_BPP_DELTA_MASK 0xe0
>>  # define DP_DSC_BITS_PER_PIXEL_1_16         0x0
>>  # define DP_DSC_BITS_PER_PIXEL_1_8          0x1
>>  # define DP_DSC_BITS_PER_PIXEL_1_4          0x2
>>  # define DP_DSC_BITS_PER_PIXEL_1_2          0x3
>> -# define DP_DSC_BITS_PER_PIXEL_1            0x4
>> +# define DP_DSC_BITS_PER_PIXEL_1_1          0x4
>>  
>>  #define DP_PSR_SUPPORT                      0x070   /* XXX 1.2? */
>>  # define DP_PSR_IS_SUPPORTED                1

-- 
Jani Nikula, Intel Open Source Graphics Center
