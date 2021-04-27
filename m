Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ACC36C176
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D716E919;
	Tue, 27 Apr 2021 09:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87656E911
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:09:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k14so8740086wrv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 02:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8I7VjfcBSSUhsqKVLIGAKWuS9MBy00j3fhu7r3yQtXA=;
 b=k88xjZmPTOtzFulp/TpAM9qUH/bP6QpceM+9BL6I2/X3/fssikp3RmCuWZtFe7i94x
 7B+j7aweLyEmk+e6rtmVGveJTumzkWtgDjZlEXg6aNV0QJll1GhtNtha3kAi00Co++fI
 yyQww9siVMS30H9v2SwhdZrm6WU2VsNhYWdYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8I7VjfcBSSUhsqKVLIGAKWuS9MBy00j3fhu7r3yQtXA=;
 b=nLoQe5QXsVrsG+Irwb8IKL/sjY/wJMvqkQhByj2bdYjwVrYEBJvBB1gCjumSQ2WazW
 GvEU3DjUXevZPL9RW/uFKpHmE7Yi1VwzaMcY5BD6LF4RGpZb6+NrzrxpcxFGB3Jm1+HY
 lTpS9w+WU/sdbX4teW6OXdqEns+fIwG8712OdaDklWjdQBSWieyPzV/vrpqNtVQ3SZbI
 TsX7OVkr2yjSXmnw/ZD8dn5ubYj2SFpmTJ2ItkBu3jbRiVs2WXo2MTljBgsWLzslgvLE
 J3UpRc1sM3lUwhF7cjwhmxlOcyNAotEuW6k4CzzXBSDwESushbJeu9uykFBlplcM+Y8q
 0ZIw==
X-Gm-Message-State: AOAM531zEmZd6SiyUut+W+hHugLQarRMWYeRgPRrwoFF2OMj3/TF7iUa
 5czAID/ZcAXD8WpuaGuHqu4Zrw==
X-Google-Smtp-Source: ABdhPJyy9htBgSrDpuY+Wk/j6ozijxAl7lWtyLBLZo2BJowGtvPQLwStfo3r5V147NvTQvPNSqkDjw==
X-Received: by 2002:a5d:6607:: with SMTP id n7mr28936533wru.146.1619514579281; 
 Tue, 27 Apr 2021 02:09:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b202sm1918209wmb.5.2021.04.27.02.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:09:38 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:09:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 0/3] A drm_plane API to support HDR planes
Message-ID: <YIfU0HovESDle8Tg@phenom.ffwll.local>
References: <20210426173852.484368-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426173852.484368-1-harry.wentland@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 sebastian@sebastianwick.net, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Bhawanpreet.Lakha@amd.com, Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 01:38:49PM -0400, Harry Wentland wrote:
> 
> ## Introduction
> 
> We are looking to enable HDR support for a couple of single-plane and
> multi-plane scenarios. To do this effectively we recommend new
> interfaces to drm_plane. Below I'll give a bit of background on HDR and
> why we propose these interfaces.

I think this is on of the topics that would tremendously benefit from the
uapi rfc process, with lots of compositor people involved.

https://dri.freedesktop.org/docs/drm/gpu/rfc/

Also for this I think we really do need a pretty solid understanding of
the involve compositor protocols, otherwise the kernel uapi is going to be
for naught.
-Daniel

> 
> 
> ## Defining a pixel's luminance
> 
> Currently the luminance space of pixels in a framebuffer/plane presented to the display is not well defined. It's usually assumed to be in a 2.2 or 2.4 gamma space and has no mapping to an absolute luminance value but is interpreted in relative terms.
> 
> Luminance can be measured and described in absolute terms as candela per meter squared, or cd/m2, or nits. Even though a pixel value can be mapped to luminance in a linear fashion to do so without losing a lot of detail requires 16-bpc color depth. The reason for this is that human perception can distinguish roughly between a 0.5-1% luminance delta. A linear representation is suboptimal, wasting precision in the highlights and losing precision in the shadows.
> 
> A gamma curve is a decent approximation to a human's perception of luminance, but the PQ (perceptual quantizer) function [1] improves on it. It also defines the luminance values in absolute terms, with the highest value being 10,000 nits and the lowest 0.0005 nits.
> 
> Using a content that's defined in PQ space we can approximate the real world in a much better way.
> 
> Here are some examples of real-life objects and their approximate luminance values:
> 
> | Object            | Luminance in nits |
> | ----------------- | ----------------- |
> | Sun               | 1.6 million       |
> | Fluorescent light | 10,000            |
> | Highlights        | 1,000 - sunlight  |
> | White Objects     | 250 - 1,000       |
> | Typical objects   | 1 - 250           |
> | Shadows           | 0.01 - 1          |
> | Ultra Blacks      | 0 - 0.0005        |
> 
> 
> ## Describing the luminance space
> 
> **We propose a new drm_plane property to describe the Eletro-Optical Transfer Function (EOTF) with which its framebuffer was composed.** Examples of EOTF are:
> 
> | EOTF      | Description                                                               |
> | --------- |:------------------------------------------------------------------------- |
> | Gamma 2.2 | a simple 2.2 gamma                                                        |
> | sRGB      | 2.4 gamma with small initial linear section                               |
> | PQ 2084   | SMPTE ST 2084; used for HDR video and allows for up to 10,000 nit support |
> | Linear    | Linear relationship between pixel value and luminance value               |
> 
> 
> ## Mastering Luminances
> 
> Now we are able to use the PQ 2084 EOTF to define the luminance of pixels in absolute terms. Unfortunately we're again presented with physical limitations of the display technologies on the market today. Here are a few examples of luminance ranges of displays.
> 
> | Display                  | Luminance range in nits |
> | ------------------------ | ----------------------- |
> | Typical PC display       | 0.3 - 200               |
> | Excellent LCD HDTV       | 0.3 - 400               |
> | HDR LCD w/ local dimming | 0.05 - 1,500            |
> 
> Since no display can currently show the full 0.0005 to 10,000 nits luminance range the display will need to tonemap the HDR content, i.e to fit the content within a display's capabilities. To assist with tonemapping HDR content is usually accompanied with a metadata that describes (among other things) the minimum and maximum mastering luminance, i.e. the maximum and minimum luminance of the display that was used to master the HDR content.
> 
> The HDR metadata is currently defined on the drm_connector via the hdr_output_metadata blob property.
> 
> It might be useful to define per-plane hdr metadata, as different planes might have been mastered differently.
> 
> 
> ## SDR Luminance
> 
> Since SDR covers a smaller luminance range than HDR, an SDR plane might look dark when blended with HDR content. Since the max HDR luminance can be quite variable (200-1,500 nits on actual displays) it is best to make the SDR maximum luminance value configurable.
> 
> **We propose a drm_plane property to specfy the desired maximum luminance of the SDR plane in nits.** This allows us to map the SDR content predictably into HDR's absolute luminance space.
> 
> 
> ## Let There Be Color
> 
> So far we've only talked about luminance, ignoring colors altogether. Just like in the luminance space, traditionally the color space of display outputs has not been well defined. Similar to how an EOTF defines a mapping of pixel data to an absolute luminance value, the color space maps color information for each pixel onto the CIE 1931 chromaticity space. This can be thought of as a mapping to an absolute, real-life, color value.
> 
> A color space is defined by its primaries and white point. The primaries and white point are expressed as coordinates in the CIE 1931 color space. Think of the red primary as the reddest red that can be displayed within the color space. Same for green and blue.
> 
> Examples of color spaces are:
> 
> | Color Space | Description                                |
> | ----------- | ------------------------------------------ |
> | BT 601      | similar to BT 709                          |
> | BT 709      | used by sRGB content; ~53% of BT 2020      |
> | DCI-P3      | used by most HDR displays; ~72% of BT 2020 |
> | BT 2020     | standard for most HDR content              |
> 
> The color space is defined in DRM for YCbCr planes via the color_encoding property of the drm_plane. 
> 
> **We propose to add definitions for the RGB variants of the BT color spaces.**
> 
> 
> ## Color Primaries and White Point
> 
> Just like displays can currently not represent the entire 0.0005 - 10,000 nits HDR range of the PQ 2084 EOTF, they are currently not capable of representing the entire BT.2020 color Gamut. For this reason video content will often specify the color primaries and white point used to master the video, in order to allow displays to be able to map the image as best as possible onto the display's gamut.
> 
> 
> ## Displays and Tonemapping
> 
> External displays are able to do their own tone and color mapping, based on the mastering luminance, color primaries, and white space defined in the HDR metadata.
> 
> Internal panels (which are currently few and far between) usually don't include the complex HW to do tone and color mapping on their own and will require the display driver to perform appropriate mapping.
> 
> 
> ## Pixel Formats
> 
> The pixel formats, such as ARGB8888, ARGB2101010, P010, or FP16 are unrelated to color space and EOTF definitions. HDR pixels can be formatted in different ways but in order to not lose precision HDR content requires at least 10 bpc precision. For this reason ARGB2101010, P010, and FP16 are the obvious candidates for HDR. ARGB2101010 and P010 have the advantage of requiring only half the bandwidth as FP16, while FP16 has the advantage of enough precision to operate in a linear space, i.e. without EOTF.
> 
> 
> ## Proposed use-cases
> 
> Although the userspace side of this work is still in the early stages it is clear that we will want to support the following two use-cases:
> 
> **One XRGB2101010 HDR Plane:** A single, composited plane of HDR content. The use-case is a video player on a desktop with the compositor owning the composition of SDR and HDR content. The content shall be PQ BT.2020 formatted. The drm_connector's hdr_output_metadata shall be set.
> 
> **One ARGB8888 SDR Plane + One P010 HDR Plane:** A normal 8bpc desktop plane, with a P010 HDR video plane underlayed. The HDR plane shall be PQ BT.2020 formatted. The desktop plane shall specify an SDR boost value. The drm_connector's hdr_output_metadata shall be set.
> 
> **One XRGB8888 SDR Plane - HDR output:** In order to support a smooth transition we recommend an OS that supports HDR output to provide the hdr_output_metadata on the drm_connector to configure the output for HDR, even when the content is only SDR. This will allow for a smooth transition between SDR-only and HDR content. In this use-case the SDR max luminance value should be provided on the drm_plane.
> 
> In DCN we will de-PQ or de-Gamma all input in order to blend in linear space. For SDR content we will also apply any desired boost before blending. After blending we will then re-apply the PQ EOTF and do RGB to YCbCr conversion if needed.
> 
> 
> ## Summary of proposed interface changes
> 
> per drm_plane:
> - new RGB color space definitions, mirroring the existing YUV color space definitions
> - new transfer function property
> - new SDR maximum white level property
> 
> 
> ## References
> 
> [1] https://en.wikipedia.org/wiki/High-dynamic-range_video#Perceptual_Quantizer
> 
> 
> ## Further Reading
> 
> https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/color.rst
> http://downloads.bbc.co.uk/rd/pubs/whp/whp-pdf-files/WHP309.pdf
> https://app.spectracal.com/Documents/White%20Papers/HDR_Demystified.pdf
> 
> 
> Bhawanpreet Lakha (3):
>   drm/color: Add RGB Color encodings
>   drm/color: Add Color transfer functions for HDR/SDR
>   drm/color: Add sdr boost property
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
>  .../gpu/drm/arm/display/komeda/komeda_plane.c |  4 +-
>  drivers/gpu/drm/arm/malidp_planes.c           |  4 +-
>  drivers/gpu/drm/armada/armada_overlay.c       |  4 +-
>  drivers/gpu/drm/drm_atomic_uapi.c             |  8 ++
>  drivers/gpu/drm/drm_color_mgmt.c              | 84 +++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_sprite.c   |  4 +-
>  .../drm/i915/display/skl_universal_plane.c    |  4 +-
>  drivers/gpu/drm/nouveau/dispnv04/overlay.c    |  4 +-
>  drivers/gpu/drm/omapdrm/omap_plane.c          |  4 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  4 +-
>  drivers/gpu/drm/tidss/tidss_plane.c           |  6 +-
>  include/drm/drm_color_mgmt.h                  | 25 +++++-
>  include/drm/drm_plane.h                       | 30 +++++++
>  14 files changed, 173 insertions(+), 16 deletions(-)
> 
> -- 
> 2.31.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
