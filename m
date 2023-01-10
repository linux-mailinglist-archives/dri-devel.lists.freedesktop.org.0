Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97051664D74
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 21:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E550B10E65F;
	Tue, 10 Jan 2023 20:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAFF10E65F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 20:30:12 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id x6so2372654ill.10
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 12:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w0Ug/ql1k2yCindQKTRR7rZIRzQnKNrHLeSqG8fryRU=;
 b=lLxUx/bMoyOfuYe2X/8VFsQ+pLZ38ds+Rz4HDvDSmzx62mxYFzBIdYtTKovwsZi9i+
 la0f9V3xZrTk6WFUBU8WLFd90V5NdTf63r04MkaXO3bOPatguw9Avrkcmgr7dFcHJh0L
 s3mA0o5rahMqaSVak4BdlT0j7sTgadkvT1Xu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w0Ug/ql1k2yCindQKTRR7rZIRzQnKNrHLeSqG8fryRU=;
 b=izZxP8F/RERH+Vs2DZAmEqLh2Dn8XhWlDVGZkE/OQm7lKfTp5XmSpefM/jZqfhVk8O
 8dW2zBYDpRZ4jeV8Etstaa5/mbwPSdHUPSyRXkixMM5mbi1srr9JFPvT1gNxAtvO6Nut
 7YNNqDlLtLxQ9p6ATBdry6xjFKwi7vjaMiQ3t1KjtOnb2lS0lp6Qfa/rAqcjDu78Lzh4
 5Pxd7itWSPBbyZKCOZPwIX5wzqM5fCOt0X9uPJtcoxRVMhXZV8uJh2zOsZhPzAbnnJfL
 /ZvHGUA2OKRnDjuIv3lWexZh2bn2IsSvt2+0vXQLwhU3W6jEDQNcfXBuaMmR7Q5IlmTR
 arow==
X-Gm-Message-State: AFqh2kqAzyPey/AxsCmREdk6IhViNpX12OFGo+tsLeUIot7eANsLKPUv
 17UCmwkMAxMe3tumv2WMHjttXw==
X-Google-Smtp-Source: AMrXdXuYEbx64HsIkwIR1X0fW6/MkoxznuZHCX2SRdTFXE879B3OEgvIbygmt0TOAFMmFnqN+0lsCg==
X-Received: by 2002:a92:1e08:0:b0:30d:7ce3:448b with SMTP id
 e8-20020a921e08000000b0030d7ce3448bmr15581670ile.14.1673382611793; 
 Tue, 10 Jan 2023 12:30:11 -0800 (PST)
Received: from chromium.org ([2620:15c:183:200:d1f8:2b5e:3e1d:2620])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a92d14d000000b003039a19a927sm3913441ilg.7.2023.01.10.12.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 12:30:11 -0800 (PST)
Date: Tue, 10 Jan 2023 13:30:09 -0700
From: Drew Davenport <ddavenport@chromium.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH] drm/i915/display: Check source height is > 0
Message-ID: <Y73K0T+tQD1wj8Xp@chromium.org>
References: <20221226225246.1.I15dff7bb5a0e485c862eae61a69096caf12ef29f@changeid>
 <8b4448d0-d9ea-95a6-83ee-513fe73c793f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b4448d0-d9ea-95a6-83ee-513fe73c793f@gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Juha-Pekka =?iso-8859-1?Q?Heikkil=E4?= <juha-pekka.heikkila@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 03, 2023 at 12:42:43PM +0200, Juha-Pekka Heikkila wrote:
> Hi Drew,

Hi Juha-Pekka, sorry for the late response since I was on vacation.

> 
> this is good find. I went looking where the problem is in and saw what you
> probably also saw earlier.
> 
> I was wondering if diff below would be better fix? I assume this would end
> up with einval or erange in your case but code flow otherwise would stay as
> is while fixing all future callers for same issue:

Yes, the function you identify below is where I encountered
divide-by-zero errors. If width/height less than 1 is a legitimate use
case, then your proposed solution looks like it would be better. It
should have no risk of regression in userspace either, which is nice.

I tested your patch, and as expected I did not hit the divide-by-zero
error, though the test commit was rejected due to a check further along
inside skl_update_scaler. Perhaps there is some other configuration
which would pass the test commit with a width/height less than 1, but I
didn't dig much further.

> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index 10e1fc9d0698..a9948e8d3543 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -144,7 +144,7 @@ unsigned int intel_adjusted_rate(const struct drm_rect
> *src,
>                                  const struct drm_rect *dst,
>                                  unsigned int rate)
>  {
> -       unsigned int src_w, src_h, dst_w, dst_h;
> +       unsigned int src_w, src_h, dst_w, dst_h, dst_wh;
> 
>         src_w = drm_rect_width(src) >> 16;
>         src_h = drm_rect_height(src) >> 16;
> @@ -155,8 +155,10 @@ unsigned int intel_adjusted_rate(const struct drm_rect
> *src,
>         dst_w = min(src_w, dst_w);
>         dst_h = min(src_h, dst_h);
> 
> -       return DIV_ROUND_UP_ULL(mul_u32_u32(rate, src_w * src_h),
> -                               dst_w * dst_h);
> +       /* in case src contained only fractional part */
> +       dst_wh = max(dst_w * dst_h, (unsigned) 1);
> +
> +       return DIV_ROUND_UP_ULL(mul_u32_u32(rate, src_w * src_h), dst_wh);
>  }
> 
>  unsigned int intel_plane_pixel_rate(const struct intel_crtc_state
> *crtc_state,
> 
> 
> What do you think? I'll in any case come up with some test for this in igt.

I see that you've posted your fix to the list already. Adding a
test to cover this in IGT also sounds great. Thanks!

Breadcrumbs to Juha-Pekka's patch for anyone following this
thread: https://patchwork.freedesktop.org/series/112396/

> 
> /Juha-Pekka
> 
> On 27.12.2022 7.53, Drew Davenport wrote:
> > The error message suggests that the height of the src rect must be at
> > least 1. Reject source with height of 0.
> > 
> > Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> > 
> > ---
> > I was investigating some divide-by-zero crash reports on ChromeOS which
> > pointed to the intel_adjusted_rate function. Further prodding showed
> > that I could reproduce this in a simple test program if I made src_h
> > some value less than 1 but greater than 0.
> > 
> > This seemed to be a sensible place to check that the source height is at
> > least 1. I tried to repro this issue on an amd device I had on hand, and
> > the configuration was rejected.
> > 
> > Would it make sense to add a check that source dimensions are at least 1
> > somewhere in core, like in drm_atomic_plane_check? Or is that a valid
> > use case on some devices, and thus any such check should be done on a
> > per-driver basis?
> > 
> > Thanks.
> > 
> >   drivers/gpu/drm/i915/display/skl_universal_plane.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index 4b79c2d2d6177..9b172a1e90deb 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -1627,7 +1627,7 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
> >   	u32 offset;
> >   	int ret;
> > -	if (w > max_width || w < min_width || h > max_height) {
> > +	if (w > max_width || w < min_width || h > max_height || h < 1) {
> >   		drm_dbg_kms(&dev_priv->drm,
> >   			    "requested Y/RGB source size %dx%d outside limits (min: %dx1 max: %dx%d)\n",
> >   			    w, h, min_width, max_width, max_height);
> 
