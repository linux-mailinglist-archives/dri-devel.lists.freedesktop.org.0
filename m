Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CFE622D08
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 14:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5477110E5D6;
	Wed,  9 Nov 2022 13:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D14010E5D6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 13:59:26 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id r14so27368577edc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 05:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DMkOBtT6ObLYy25oIgnCsgVbQYMchVinpbWDYzQjMs4=;
 b=L+QdDEi5Ht9Q/Ahc5HiTLg+H07UBVGKbXPJ6mMMu7d9iXXtRBx4C6HziIj3xF8XfJM
 hToaoS81myOhtdl2AGQopt9vBn9GPREAkPxvG8ZVF6KHNWt4FgpouVWhd5HWbR7MAdXd
 92q2pDpOspptsiichLv8pJ43Cc+CGNZzSashA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DMkOBtT6ObLYy25oIgnCsgVbQYMchVinpbWDYzQjMs4=;
 b=an9TYHnJpHAsRXzBVu/nWxKDYGwbju1tiqBWXBFP8yji4wte3A+IC/GDcGld/1XvIa
 jQmJLeCnoEM8MyFtp0roF6NfgXt8KU39XfPul53mggt4HkVjCZ7RF/wQhCjiEHRNM9OO
 I4llDu0z08I6cszmUjl8Fzd8uuQ8S8JoD/FOacvRkuiGIwpuNriSEnUs4BQQSI/ly+1G
 GR6TvLz4PsrshNQ00P7Dw4UDK+myjWSwt/nRqRjxgGKgB0QHeUkvfbZXP3gKPmygsnyB
 rXqAw/38CGVjL41ASDXwuDvzdggwdB9xdXKDG5+Zm0nH3J7pEqA4UenZPJtHAb4r1B0m
 TUIg==
X-Gm-Message-State: ANoB5pkctZF1Ct9cUz23Veo4oWhzQHTwT18/jtbPvjzZB8s3cevymXOc
 hVrN4OmnxI/rIWvf8F7zjm/Rmw==
X-Google-Smtp-Source: AA0mqf5Df8RAFDDstHdqMCyloMhuIL43rSDRflmFTW1LmU3mQWkvhHRC+anCIHsBnl8RS8zvUKgT4Q==
X-Received: by 2002:aa7:db4e:0:b0:463:2979:5e49 with SMTP id
 n14-20020aa7db4e000000b0046329795e49mr16244024edt.266.1668002364506; 
 Wed, 09 Nov 2022 05:59:24 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 10-20020a170906210a00b0078d21574986sm5816943ejt.203.2022.11.09.05.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 05:59:23 -0800 (PST)
Date: Wed, 9 Nov 2022 14:59:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Message-ID: <Y2uyOcVbadRwr9/O@phenom.ffwll.local>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
 <fqY-wVvRxd553E0flH80_NaZMpmiVTIdhvu6F31qM9T4yQ0L5fbT9JiixWIhDcDAt3Hxy1roQxwntvgVEnqm5WK6dzEIKqXnlLRcywGhYH4=@emersion.fr>
 <Y2uwjKCN4KGzm3aN@phenom.ffwll.local>
 <ee755c43-434a-a990-0efa-ed5c6baa237e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee755c43-434a-a990-0efa-ed5c6baa237e@linaro.org>
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
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 04:53:45PM +0300, Dmitry Baryshkov wrote:
> On 09/11/2022 16:52, Daniel Vetter wrote:
> > On Tue, Nov 08, 2022 at 06:25:29PM +0000, Simon Ser wrote:
> > > On Saturday, October 29th, 2022 at 13:23, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > 
> > > > On 29/10/2022 01:59, Jessica Zhang wrote:
> > > > 
> > > > > Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> > > > > drm_plane. In addition, add support for setting and getting the values
> > > > > of these properties.
> > > > > 
> > > > > COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
> > > > > represents the format of the color fill. Userspace can set enable solid
> > > > > fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
> > > > > the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> > > > > framebuffer to NULL.
> > > > 
> > > > I suppose that COLOR_FILL should override framebuffer rather than
> > > > requiring that FB is set to NULL. In other words, if color_filL_format
> > > > is non-zero, it would make sense to ignore the FB. Then one can use the
> > > > color_fill_format property to quickly switch between filled plane and
> > > > FB-backed one.
> > > 
> > > That would be inconsistent with the rest of the KMS uAPI. For instance,
> > > the kernel will error out if CRTC has active=0 but a connector is still
> > > linked to the CRTC. IOW, the current uAPI errors out if the KMS state
> > > is inconsistent.
> > 
> > So if the use-case here really is to solid-fill a plane (and not just
> > provide a background color for the crtc overall), then I guess we could
> > also extend addfb to make that happen. We've talked in the past about
> > propertery-fying framebuffer objects, and that would sort out this uapi
> > wart. And I agree the color fill vs PLANE_ID issue is a bit ugly at least.
> > 
> > But if the use-cases are all background color then just doing the crtc
> > background color would be tons simpler (and likely also easier to support
> > for more hardware).
> 
> No. The hardware supports multiple color-filled planes, which do not have to
> cover the whole CRTC.

The use case here means the userspace use-case. What the hw can do on any
given chip kinda doesnt matter, which is why I'm asking. KMD uapi is not
meant to reflect 100% exactly what a specific chip can do, but instead:
- provide features userspace actually needs. If you want per-plane fill,
  you need userspace that makes use of per-plane fill, and if all you have
  is crtc background, then that's it.
- we should create uapi with an eye towards what's actually possible on a
  reasonable set of drivers and hw. Sometimes that means a slightly more
  restricted set so that it's possible to implement in more places,
  especially if that restricted feature set still gets the job done for
  userspace.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
