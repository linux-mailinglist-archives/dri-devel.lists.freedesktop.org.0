Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1E862572C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEE310E12E;
	Fri, 11 Nov 2022 09:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6196A10E12E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 09:45:24 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id k2so11431408ejr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 01:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UMQFen+AlSzqDT2P7hCvWn/+unZBYVNQX2dAC6+w/KI=;
 b=JmxwUPKAzozHR4+sK/xdFxKNC/vPBXXSndaeUvZV/zolRi9mUFwj9fbvX0qWuN2rVd
 5QrD3CB2HM1LcWRA+Q7WLdw3J7Vk5GpEnVWRrvfYBEZm8vgnAIPYJ/aOZIKv7yvBsnTm
 sKXetN7/xl11hLTNdDs71d2D+WTxOxndogFQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UMQFen+AlSzqDT2P7hCvWn/+unZBYVNQX2dAC6+w/KI=;
 b=PoML7c3/gXntqWJAF2SI8f2JsmIewjQB4DRRTI74IDpwFLfHUPoStT1woZIfiojxny
 n6Co4b5oxcBKfZftJ4GtwmjLtIGu6u7D/FLZuaEHWC6DaRCbSC4sVU4mbupa686+ro9N
 0OU0+JVcy9EsMOKSfxo2wgBxUvlCIVS5YZRdvmG41IheGEuPYd5c4rDR/9UxKDpKRsq2
 PpT+H90B6OmLb6EgKRvqiQH59wxtKPj/R38ie8fuzuP6cantXXZE+XjcrXxOHGZv3C4i
 GzXW3Ctry08L0YwtakeOMSxhqGMRi0Vc/TpnAuObiajiUsF7n6DKE0jcxV65Q+m6pTNK
 enCA==
X-Gm-Message-State: ANoB5pnk5eHYv22Mlc5sd51UZA4c28wXeHdZCCWE6q2BsgpLmm6QcVJe
 eOc4dW+Qo9g0ZVzpHUphD/FsLw==
X-Google-Smtp-Source: AA0mqf7x9A8ECGXtLZMM1NHsguIiF0JqVM38iNxjLGIcmH15A3R39dQK9ZYDg+g8+n0ggsJ7mQ3TrA==
X-Received: by 2002:a17:906:714:b0:78d:e4c6:2c8b with SMTP id
 y20-20020a170906071400b0078de4c62c8bmr1255775ejb.164.1668159922749; 
 Fri, 11 Nov 2022 01:45:22 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 l10-20020a1709060cca00b00731803d4d04sm687312ejh.82.2022.11.11.01.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 01:45:22 -0800 (PST)
Date: Fri, 11 Nov 2022 10:45:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Message-ID: <Y24ZsAhAscVJd4Uf@phenom.ffwll.local>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
 <fqY-wVvRxd553E0flH80_NaZMpmiVTIdhvu6F31qM9T4yQ0L5fbT9JiixWIhDcDAt3Hxy1roQxwntvgVEnqm5WK6dzEIKqXnlLRcywGhYH4=@emersion.fr>
 <Y2uwjKCN4KGzm3aN@phenom.ffwll.local>
 <ee755c43-434a-a990-0efa-ed5c6baa237e@linaro.org>
 <Y2uyOcVbadRwr9/O@phenom.ffwll.local>
 <1f291321-1319-f6d8-b2cb-85ddbe970766@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f291321-1319-f6d8-b2cb-85ddbe970766@quicinc.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 05:44:37PM -0800, Jessica Zhang wrote:
> 
> 
> On 11/9/2022 5:59 AM, Daniel Vetter wrote:
> > On Wed, Nov 09, 2022 at 04:53:45PM +0300, Dmitry Baryshkov wrote:
> > > On 09/11/2022 16:52, Daniel Vetter wrote:
> > > > On Tue, Nov 08, 2022 at 06:25:29PM +0000, Simon Ser wrote:
> > > > > On Saturday, October 29th, 2022 at 13:23, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > > > 
> > > > > > On 29/10/2022 01:59, Jessica Zhang wrote:
> > > > > > 
> > > > > > > Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> > > > > > > drm_plane. In addition, add support for setting and getting the values
> > > > > > > of these properties.
> > > > > > > 
> > > > > > > COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
> > > > > > > represents the format of the color fill. Userspace can set enable solid
> > > > > > > fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
> > > > > > > the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> > > > > > > framebuffer to NULL.
> > > > > > 
> > > > > > I suppose that COLOR_FILL should override framebuffer rather than
> > > > > > requiring that FB is set to NULL. In other words, if color_filL_format
> > > > > > is non-zero, it would make sense to ignore the FB. Then one can use the
> > > > > > color_fill_format property to quickly switch between filled plane and
> > > > > > FB-backed one.
> > > > > 
> > > > > That would be inconsistent with the rest of the KMS uAPI. For instance,
> > > > > the kernel will error out if CRTC has active=0 but a connector is still
> > > > > linked to the CRTC. IOW, the current uAPI errors out if the KMS state
> > > > > is inconsistent.
> > > > 
> > > > So if the use-case here really is to solid-fill a plane (and not just
> > > > provide a background color for the crtc overall), then I guess we could
> > > > also extend addfb to make that happen. We've talked in the past about
> > > > propertery-fying framebuffer objects, and that would sort out this uapi
> > > > wart. And I agree the color fill vs PLANE_ID issue is a bit ugly at least.
> > > > 
> > > > But if the use-cases are all background color then just doing the crtc
> > > > background color would be tons simpler (and likely also easier to support
> > > > for more hardware).
> > > 
> > > No. The hardware supports multiple color-filled planes, which do not have to
> > > cover the whole CRTC.
> > 
> > The use case here means the userspace use-case. What the hw can do on any
> > given chip kinda doesnt matter, which is why I'm asking. KMD uapi is not
> > meant to reflect 100% exactly what a specific chip can do, but instead:
> > - provide features userspace actually needs. If you want per-plane fill,
> >    you need userspace that makes use of per-plane fill, and if all you have
> >    is crtc background, then that's it.
> 
> Hey Daniel,
> 
> The userspace use case we're trying to support is the Android HWC SOLID_FILL
> hint here [1], which is specifying per-plane fill.

Does surfaceflinger actually use this for more than background fills? Yes
I'm annoying, but if we can simplify the kernel driver implementation
burden by asking compositors to do the math and simplify things, then I
think we should.

We also need an open source implementation for this that works and is
tested end-to-end. There's the drm_hwc project, but last time I've checked
there's really not much happpening there unfortunately.
-Daniel

> 
> Thanks,
> 
> Jessica Zhang
> 
> [1] https://android.googlesource.com/platform/hardware/interfaces/+/refs/heads/master/graphics/composer/aidl/android/hardware/graphics/composer3/Composition.aidl#52
> 
> > - we should create uapi with an eye towards what's actually possible on a
> >    reasonable set of drivers and hw. Sometimes that means a slightly more
> >    restricted set so that it's possible to implement in more places,
> >    especially if that restricted feature set still gets the job done for
> >    userspace.
> > 
> > Cheers, Daniel
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
