Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECC9666301
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 19:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F53E10E7E1;
	Wed, 11 Jan 2023 18:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB5D10E7E1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 18:47:56 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id n85so405783iod.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 10:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4OQq5enpe7uRtVIP5uPdIxkFgnD6rZwRWFBHq4d9gkI=;
 b=ZtKOhPcK0GTSIlyIhnr2fU5AT2NjJlk9UJoPOyfsMLRjdllYyKV64qjazsNzsOMmlb
 FSAXVnBCYdeNYH6c633YANE2da8Qlbt7Z5sSxP6r15a2vAurfB7QS53Wu9AxWhoPqKtS
 m0DfctcTOF/KMp62PgaFXDDsWPHJKilO17tx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4OQq5enpe7uRtVIP5uPdIxkFgnD6rZwRWFBHq4d9gkI=;
 b=u7T0Zyucozu6PLdZBGgIP14Sbjnn2pK2Wlzcln6vSjXZukz8+GZRL0DDqvC8CEFMpF
 I1AdLnem89jx+OY2H2kb72+nixCVez40VqErCGCW3x81A+1vvrWJZoZGClvA1LKWtB76
 IQhipr284nVBarlpyRHtMO067YK9XPFmwjlpIdupi0fP4kchU0uKTczLzRlDmywoXSIs
 aRGVEqVXfTrVw/DTXFsSsCqz0Px5Mj0ySco5zGmt91ycR57oP1HJmLuKFSkynWAgZT7d
 cw6ip3A/fKvqeiyERrvB0et62BmjpC70mqaSHiDEh3+DB4Cg9Tz27AzOKvSTTCQfRhpO
 1I3Q==
X-Gm-Message-State: AFqh2kp5hwpdRFhmJIcjwsBmf4NHXXeBGuIAyy/DXIoI3LVZ2JTnXD9L
 p5jw/SDSqS8bvot1XsKDCV1nFQ==
X-Google-Smtp-Source: AMrXdXtim/CfcPszSVRQEjo3AWNfMIwqK9s+RWgNA+uETTtDhb+IUaVTvMGd99fgsRm1V6tSDRdbPA==
X-Received: by 2002:a6b:bd05:0:b0:6eb:3bcc:a9ca with SMTP id
 n5-20020a6bbd05000000b006eb3bcca9camr51838960iof.8.1673462875113; 
 Wed, 11 Jan 2023 10:47:55 -0800 (PST)
Received: from chromium.org ([2620:15c:183:200:632c:a4be:969f:51ab])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a056602158200b006dfa5af69f5sm5320863iow.0.2023.01.11.10.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 10:47:54 -0800 (PST)
Date: Wed, 11 Jan 2023 11:47:52 -0700
From: Drew Davenport <ddavenport@chromium.org>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Check source height is > 0
Message-ID: <Y78EWH8YCdkHZrvP@chromium.org>
References: <20221226225246.1.I15dff7bb5a0e485c862eae61a69096caf12ef29f@changeid>
 <e9cfd7b7b23294592192869bd16a20596f3276c2.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9cfd7b7b23294592192869bd16a20596f3276c2.camel@intel.com>
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 27, 2022 at 05:55:17PM +0000, Teres Alexis, Alan Previn wrote:
> Is there a better place for this check higher up the intel specific atomic-check? (so the check won't be skl specific - i notice that intel_adjusted_rate is also called by
> ilk_foo as well and non-backend-specific functions). Else, perhaps intel_adjusted_rate should add a check + WARN? (if we are trying to propagate this slowly across HW).

Would intel_plane_atomic_check_with_state be a more appropriate
place to check that the src width and height are at least 1? This is
where skl_plane_check and other HW's foo_plane_check functions are called
from.

I don't think that the potential divide-by-zero will be hit in the case
where intel_adjusted_rate is called from ilk_pipe_pixel_rate because the
src rect will not have a fractional part to it in this case. I'm assuming
that something earlier on would catch and reject a src with zero
width/height.

Drew

> 
> 
> ...alan 
> 
> On Mon, 2022-12-26 at 22:53 -0700, Drew Davenport wrote:
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
> >  drivers/gpu/drm/i915/display/skl_universal_plane.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index 4b79c2d2d6177..9b172a1e90deb 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -1627,7 +1627,7 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
> >  	u32 offset;
> >  	int ret;
> >  
> > -	if (w > max_width || w < min_width || h > max_height) {
> > +	if (w > max_width || w < min_width || h > max_height || h < 1) {
> >  		drm_dbg_kms(&dev_priv->drm,
> >  			    "requested Y/RGB source size %dx%d outside limits (min: %dx1 max: %dx%d)\n",
> >  			    w, h, min_width, max_width, max_height);
> > -- 
> > 2.39.0.314.g84b9a713c41-goog
> > 
> 
