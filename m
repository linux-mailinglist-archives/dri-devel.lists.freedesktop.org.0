Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC2F5EE43D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 20:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467CA10E5BB;
	Wed, 28 Sep 2022 18:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C4110E5A9;
 Wed, 28 Sep 2022 18:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664389302; x=1695925302;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KTwhkUb/VcgAqHndphTk9j2Q2jRa3UxeZxoq97pVpzA=;
 b=FTrBZQubcwhD9yGI6iKWism+Tyq3tE2iZrgCAMMvrsUUHX8imx1hKOT7
 5gSBtyxl5gt4IkI8j5Ke9QjWEL+IfZP+W88Huvtuav7/OHsdU3dqjffKs
 k+FA3l1vpR7t1HvkXOpBpZCBYDmH28XuamYsVrmZ9xf+xv5a70Zt2NHlU
 Pn40PLhWxJLg0GuSPJcj3MhV4HtcSOdqjXTO0YNusP3Pm7+/e2vyueups
 3g31BW5mM+/emuO4+1iRlWkzlSa8hOzFhnhOOpNeeuvdV0Al5aAU7rhw+
 1Ow259S1V+JCIP12GkRNxDCsFiGCD3J9YY0BOTz4SiUfX4EDlMUEIKjzK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="299280741"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="299280741"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 11:21:41 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="655233702"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="655233702"
Received: from julianmi-mobl3.ger.corp.intel.com (HELO [10.252.61.94])
 ([10.252.61.94])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 11:21:38 -0700
Message-ID: <14b729d9-9050-61be-78ac-794d88659d6e@linux.intel.com>
Date: Wed, 28 Sep 2022 20:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.1.2
Subject: Re: [PATCH 1/4] drm: Add missing DP DSC extended capability
 definitions.
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220913141417.8131-1-stanislav.lisovskiy@intel.com>
 <20220913141417.8131-2-stanislav.lisovskiy@intel.com>
 <87czby2qsx.fsf@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87czby2qsx.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: manasi.d.navare@intel.com, jani.saarinen@intel.com,
 dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 14-09-2022 om 12:28 schreef Jani Nikula:
> On Tue, 13 Sep 2022, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com> wrote:
>> Adding DP DSC register definitions, we might need for further
>> DSC implementation, supporting MST and DP branch pass-through mode.
>>
>> v2: - Fixed checkpatch comment warning
>> v3: - Removed function which is not yet used(Jani Nikula)
>>
>> Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>>
>> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Maarten, Maxime, Thomas -
>
> Retry, can we get an ack for merging this one via drm-intel-next?
>
> Thanks,
> Jani.
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
>> ---
>>  include/drm/display/drm_dp.h | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
>> index e934aab357be..9bc22a02874d 100644
>> --- a/include/drm/display/drm_dp.h
>> +++ b/include/drm/display/drm_dp.h
>> @@ -240,6 +240,8 @@
>>  #define DP_DSC_SUPPORT                      0x060   /* DP 1.4 */
>>  # define DP_DSC_DECOMPRESSION_IS_SUPPORTED  (1 << 0)
>>  # define DP_DSC_PASSTHROUGH_IS_SUPPORTED    (1 << 1)
>> +# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_COMP_TO_COMP    (1 << 2)
>> +# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_UNCOMP_TO_COMP  (1 << 3)
>>  
>>  #define DP_DSC_REV                          0x061
>>  # define DP_DSC_MAJOR_MASK                  (0xf << 0)
>> @@ -278,12 +280,15 @@
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
>> @@ -345,11 +350,13 @@
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


