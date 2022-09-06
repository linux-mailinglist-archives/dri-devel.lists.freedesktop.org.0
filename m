Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA95F5AF2C3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C7510E715;
	Tue,  6 Sep 2022 17:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD12D10E715;
 Tue,  6 Sep 2022 17:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662485697; x=1694021697;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TQ9dKMxqsXgQNDL2iWpZuowxxptPr09tChGl1+c9C+s=;
 b=gAYVhRW51XS53+Nhed54h9ZnpJFGEKfSjmOhEDsuYQcnXa1+Qd8TrU0L
 UuBX2H6Nb+bLl47eL0ymhiMwgEKSCuMvMdk/LgnrGZlQs5NA5rs8aUbD/
 STaITDul3lT8Uekp+hHRnd5x+qj8jut/hpDzjz1ezZSlL/OSUEYqENsL+
 Bwaff083Rk1r74a3b1wn89rzis/FlvjeQY5YhDa+suq9pRDxXljmajLOA
 /gNg9T+LaF1jwrpvC2hXi4r5C8EOgPFyimJnkTbdZm57a3xOf7CBTNHg/
 CNmjH0kwc9/tQb9e7waefoP9HIkH/pDbhzCMwMinrbTKiiu6K7SOk+ZOb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="322837486"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="322837486"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 10:34:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="675791880"
Received: from amomin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.44.228])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 10:34:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Subject: Re: [PATCH 1/4] drm: Add missing DP DSC extended capability
 definitions.
In-Reply-To: <Yxd6SXEkPpMF4d5l@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220905085744.29637-1-stanislav.lisovskiy@intel.com>
 <20220905085744.29637-2-stanislav.lisovskiy@intel.com>
 <8735d4a7vm.fsf@intel.com> <87sfl48q5h.fsf@intel.com>
 <Yxd6SXEkPpMF4d5l@intel.com>
Date: Tue, 06 Sep 2022 20:34:37 +0300
Message-ID: <87leqw8l02.fsf@intel.com>
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
Cc: vinod.govindapillai@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, manasi.d.navare@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Sep 2022, "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com> wrote:
> On Tue, Sep 06, 2022 at 06:43:22PM +0300, Jani Nikula wrote:
>> On Tue, 06 Sep 2022, Jani Nikula <jani.nikula@intel.com> wrote:
>> > On Mon, 05 Sep 2022, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com> wrote:
>> >> Adding DP DSC register definitions, we might need for further
>> >> DSC implementation, supporting MST and DP branch pass-through mode.
>> >>
>> >> v2: - Fixed checkpatch comment warning
>> >> v3: - Removed function which is not yet used(Jani Nikula)
>> >>
>> >> Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>> >>
>> >> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>> >
>> > Maarten, Maxime, Thomas -
>> >
>> > So this got pushed to drm-intel-next without your acks. Apologies. Can
>> > we live with it, or want a revert?
>> 
>> I've reverted anyway for other reasons. But can we have an ack for the
>> future? :)
>> 
>> BR,
>> Jani.
>
> I've resolved the conflict properly now(not the best way of learning about
> drm-rerere) but I guess its too late now. Sorry for the hassle.

Yeah, I'm sorry too. The conflict looked too involved for us to figure
out right now, with the diverged baselines between drm-misc-next and
drm-intel-next, so Rodrigo and I decided to go for the revert. We needed
to get drm-tip building again.

And really, the patches as applied on top of current drm-intel-next
weren't tested, because they were changed on the fly.

> But what am I supposed to do now? Should proceed with merge again or 
> wait for some acks? 
> Patches basically would be the same anyway.

The patches will be the same, but we'll need to get the baseline
resolved first. drm-misc-next and drm-intel-next have diverged on
intel_dp_mst.c, due to Lyude's DP MST changes, and we'll need to get
them in sync in drm-intel-next before applying the patches. It'll be the
easiest for everyone.

In practice this means a drm-misc-next pull request to drm-next, and
then a backmerge from drm-next to drm-intel-next. There was a
drm-misc-next pull request merged today, but only up to tag
drm-misc-next-2022-08-20-1, and there's 88 commits in drm-misc-next
since. Including Lyude's changes.

BR,
Jani.


>
> Stan
>
>> 
>> >
>> >
>> > BR,
>> > Jani.
>> >
>> >
>> >> ---
>> >>  include/drm/display/drm_dp.h | 10 +++++++++-
>> >>  1 file changed, 9 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
>> >> index 6c0871164771..02c4b6f20478 100644
>> >> --- a/include/drm/display/drm_dp.h
>> >> +++ b/include/drm/display/drm_dp.h
>> >> @@ -239,6 +239,9 @@
>> >>  
>> >>  #define DP_DSC_SUPPORT                      0x060   /* DP 1.4 */
>> >>  # define DP_DSC_DECOMPRESSION_IS_SUPPORTED  (1 << 0)
>> >> +# define DP_DSC_PASS_THROUGH_IS_SUPPORTED   (1 << 1)
>> >> +# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_COMP_TO_COMP    (1 << 2)
>> >> +# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_UNCOMP_TO_COMP  (1 << 3)
>> >>  
>> >>  #define DP_DSC_REV                          0x061
>> >>  # define DP_DSC_MAJOR_MASK                  (0xf << 0)
>> >> @@ -277,12 +280,15 @@
>> >>  
>> >>  #define DP_DSC_BLK_PREDICTION_SUPPORT       0x066
>> >>  # define DP_DSC_BLK_PREDICTION_IS_SUPPORTED (1 << 0)
>> >> +# define DP_DSC_RGB_COLOR_CONV_BYPASS_SUPPORT (1 << 1)
>> >>  
>> >>  #define DP_DSC_MAX_BITS_PER_PIXEL_LOW       0x067   /* eDP 1.4 */
>> >>  
>> >>  #define DP_DSC_MAX_BITS_PER_PIXEL_HI        0x068   /* eDP 1.4 */
>> >>  # define DP_DSC_MAX_BITS_PER_PIXEL_HI_MASK  (0x3 << 0)
>> >>  # define DP_DSC_MAX_BITS_PER_PIXEL_HI_SHIFT 8
>> >> +# define DP_DSC_MAX_BPP_DELTA_VERSION_MASK  0x06
>> >> +# define DP_DSC_MAX_BPP_DELTA_AVAILABILITY  0x08
>> >>  
>> >>  #define DP_DSC_DEC_COLOR_FORMAT_CAP         0x069
>> >>  # define DP_DSC_RGB                         (1 << 0)
>> >> @@ -344,11 +350,13 @@
>> >>  # define DP_DSC_24_PER_DP_DSC_SINK          (1 << 2)
>> >>  
>> >>  #define DP_DSC_BITS_PER_PIXEL_INC           0x06F
>> >> +# define DP_DSC_RGB_YCbCr444_MAX_BPP_DELTA_MASK 0x1f
>> >> +# define DP_DSC_RGB_YCbCr420_MAX_BPP_DELTA_MASK 0xe0
>> >>  # define DP_DSC_BITS_PER_PIXEL_1_16         0x0
>> >>  # define DP_DSC_BITS_PER_PIXEL_1_8          0x1
>> >>  # define DP_DSC_BITS_PER_PIXEL_1_4          0x2
>> >>  # define DP_DSC_BITS_PER_PIXEL_1_2          0x3
>> >> -# define DP_DSC_BITS_PER_PIXEL_1            0x4
>> >> +# define DP_DSC_BITS_PER_PIXEL_1_1          0x4
>> >>  
>> >>  #define DP_PSR_SUPPORT                      0x070   /* XXX 1.2? */
>> >>  # define DP_PSR_IS_SUPPORTED                1
>> 
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
