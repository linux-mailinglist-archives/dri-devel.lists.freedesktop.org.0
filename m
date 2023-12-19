Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E01818905
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 14:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0588810E4C9;
	Tue, 19 Dec 2023 13:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69C110E49F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702994022; x=1734530022;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yfmGb2CU0aifKMp5SXmmNHyvc7SvPOQRc4aakgQN3Vw=;
 b=ejFTNNlAeBuUMsfNYHQ0+vodrkud9uQbetc+MXuXCW9keE7jVwXoNmyI
 Zjm5mrxDDdX/bQO921CFYRygdG4a7veg1sdEhBAD5Mcv3L8M9nhZ6AtNr
 mj2Og11GmQODz+mhij0rqOrAAvwS+baza4xfPiNfslVX6J6hiamKPX+2Q
 eKfbxluheRYs6+Wyj4Hb/IZ0a2voFIt8ASyORch8jSIjxxoP/8lAzJaHh
 ulC7/OoD63VBROV/UuUr3OzSiqh5zc6GhwVgRxeR+1NssPOz/rHyq+eS+
 1mawp7ff8Ta7CEoGWpa0nzZ3kYsKsPk1plxVeSn4K6N1Y2TmeOeBXADBU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="399492489"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="399492489"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 05:53:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769244133"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="769244133"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 19 Dec 2023 05:53:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Dec 2023 15:53:38 +0200
Date: Tue, 19 Dec 2023 15:53:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the header_cleanup tree
Message-ID: <ZYGgYvsCHmazP2jH@intel.com>
References: <20231218174030.3ed72f54@canb.auug.org.au>
 <20231219145734.13e40e1e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231219145734.13e40e1e@canb.auug.org.au>
X-Patchwork-Hint: comment
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
Cc: Dave Airlie <airlied@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 19, 2023 at 02:57:34PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 18 Dec 2023 17:40:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the header_cleanup tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > In file included from include/linux/kernel.h:27,
> >                  from drivers/gpu/ipu-v3/ipu-dp.c:7:
> > include/drm/drm_color_mgmt.h: In function 'drm_color_lut_extract':
> > include/drm/drm_color_mgmt.h:45:46: error: implicit declaration of function 'mul_u32_u32' [-Werror=implicit-function-declaration]
> >    45 |                 return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(user_input, (1 << bit_precision) - 1),
> >       |                                              ^~~~~~~~~~~
> > include/linux/math.h:104:36: note: in definition of macro 'DIV_ROUND_CLOSEST_ULL'
> >   104 |         unsigned long long _tmp = (x) + (__d) / 2;      \
> >       |                                    ^
> > In file included from include/linux/time.h:6,
> >                  from include/linux/videodev2.h:59,
> >                  from include/video/imx-ipu-v3.h:16,
> >                  from drivers/gpu/ipu-v3/ipu-dp.c:14:
> > include/linux/math64.h: At top level:
> > include/linux/math64.h:155:19: error: conflicting types for 'mul_u32_u32'; have 'u64(u32,  u32)' {aka 'long long unsigned int(unsigned int,  unsigned int)'}
> >   155 | static inline u64 mul_u32_u32(u32 a, u32 b)
> >       |                   ^~~~~~~~~~~
> > include/drm/drm_color_mgmt.h:45:46: note: previous implicit declaration of 'mul_u32_u32' with type 'int()'
> >    45 |                 return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(user_input, (1 << bit_precision) - 1),
> >       |                                              ^~~~~~~~~~~
> > include/linux/math.h:104:36: note: in definition of macro 'DIV_ROUND_CLOSEST_ULL'
> >   104 |         unsigned long long _tmp = (x) + (__d) / 2;      \
> >       |                                    ^
> > cc1: some warnings being treated as errors
> > In file included from include/linux/kernel.h:27,
> >                  from drivers/gpu/drm/omapdrm/dss/dispc_coefs.c:7:
> > include/drm/drm_color_mgmt.h: In function 'drm_color_lut_extract':
> > include/drm/drm_color_mgmt.h:45:46: error: implicit declaration of function 'mul_u32_u32' [-Werror=implicit-function-declaration]
> >    45 |                 return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(user_input, (1 << bit_precision) - 1),
> >       |                                              ^~~~~~~~~~~
> > include/linux/math.h:104:36: note: in definition of macro 'DIV_ROUND_CLOSEST_ULL'
> >   104 |         unsigned long long _tmp = (x) + (__d) / 2;      \
> >       |                                    ^
> > In file included from include/linux/jiffies.h:7,
> >                  from include/linux/ktime.h:25,
> >                  from include/linux/timer.h:6,
> >                  from include/linux/workqueue.h:9,
> >                  from include/linux/mm_types.h:19,
> >                  from include/linux/mmzone.h:22,
> >                  from include/linux/gfp.h:7,
> >                  from include/linux/stackdepot.h:25,
> >                  from include/drm/drm_modeset_lock.h:28,
> >                  from include/drm/drm_crtc.h:30,
> >                  from drivers/gpu/drm/omapdrm/dss/omapdss.h:11,
> >                  from drivers/gpu/drm/omapdrm/dss/dispc_coefs.c:9:
> > include/linux/math64.h: At top level:
> > include/linux/math64.h:155:19: error: conflicting types for 'mul_u32_u32'; have 'u64(u32,  u32)' {aka 'long long unsigned int(unsigned int,  unsigned int)'}
> >   155 | static inline u64 mul_u32_u32(u32 a, u32 b)
> >       |                   ^~~~~~~~~~~
> > include/drm/drm_color_mgmt.h:45:46: note: previous implicit declaration of 'mul_u32_u32' with type 'int()'
> >    45 |                 return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(user_input, (1 << bit_precision) - 1),
> >       |                                              ^~~~~~~~~~~
> > include/linux/math.h:104:36: note: in definition of macro 'DIV_ROUND_CLOSEST_ULL'
> >   104 |         unsigned long long _tmp = (x) + (__d) / 2;      \
> >       |                                    ^
> > cc1: some warnings being treated as errors
> 
> This turns out to be a semantic conflict (or exposing a bug in commit
> 
>  c6fbb6bca108 ("drm: Fix color LUT rounding")
> 
> from the drm tree.
> 
> I have applied the following merge fix up patch (which should probably
> be applied to the drm tree, if possible).
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 19 Dec 2023 14:43:41 +1100
> Subject: [PATCH] drm: using mul_u32_u32() requires linux/math64.h
> 
> Some pending include file cleanups produced this error:
> 
> In file included from include/linux/kernel.h:27,
>                  from drivers/gpu/ipu-v3/ipu-dp.c:7:
> include/drm/drm_color_mgmt.h: In function 'drm_color_lut_extract':
> include/drm/drm_color_mgmt.h:45:46: error: implicit declaration of function 'mul_u32_u32' [-Werror=implicit-function-declaration]
>    45 |                 return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(user_input, (1 << bit_precision) - 1),
>       |                                              ^~~~~~~~~~~
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Mea culpa.

I slapped on a
Fixes: c6fbb6bca108 ("drm: Fix color LUT rounding")

and applied this to drm-misc-next-fixes. Thanks.

> ---
>  include/drm/drm_color_mgmt.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 54b2b2467bfd..ed81741036d7 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -24,6 +24,7 @@
>  #define __DRM_COLOR_MGMT_H__
>  
>  #include <linux/ctype.h>
> +#include <linux/math64.h>
>  #include <drm/drm_property.h>
>  
>  struct drm_crtc;
> -- 
> 2.40.1
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Ville Syrjälä
Intel
