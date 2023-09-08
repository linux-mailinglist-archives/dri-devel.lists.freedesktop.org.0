Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD179886E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A0710E8C2;
	Fri,  8 Sep 2023 14:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 407 seconds by postgrey-1.36 at gabe;
 Fri, 08 Sep 2023 14:19:12 UTC
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E7B10E0F8;
 Fri,  8 Sep 2023 14:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/3HL/MY3RdtWh1vMQUHby74pl15LcuHyGtAjiuUTn9o=; b=HP0JT8CodInRO7t0G/x2cSWiKb
 RaUD1gDG99tiv5/ScB3LcXBSM7VnBkf20RRaQB8TwufsQrz0dQ0oKeyci917iqkZQA6yygoCw++Gz
 gF1XTkVVhDvdGa6ItVIbVXFtQydhdPJjiEfap8p91N8FPY27xiAn7XI+oWci6qOGotzyGhj6mEZZW
 pJuaG7K0vUXTiL3ZEcUyX/uiZOgNpPpTYbWp8XKwORkkMvDMg+JAMXxAsvp+WG0EfzxtaZ5oJJ9Ph
 BemoJEYhndR8X1EMhtQwPFRLlyLSG9UGuKFa2VAwFkKa0VibEX9HA1soRNgVuOGOTvkg5VSNhvSrP
 YWja1a3g==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qecKC-001OxZ-Od; Fri, 08 Sep 2023 16:19:08 +0200
Date: Fri, 8 Sep 2023 13:19:02 -0100
From: Melissa Wen <mwen@igalia.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v2 10/34] drm/amd/display: add plane 3D LUT
 driver-specific properties
Message-ID: <20230908141902.5lfgdjusfcabgluw@mail.igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-11-mwen@igalia.com>
 <758deee7-7530-4931-830e-d5a4acff337f@amd.com>
 <20230907105701.5b1c115f.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907105701.5b1c115f.pekka.paalanen@collabora.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/07, Pekka Paalanen wrote:
> On Wed, 6 Sep 2023 15:30:04 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
> > On 2023-08-10 12:02, Melissa Wen wrote:
> > > Add 3D LUT property for plane gamma correction using a 3D lookup table.
> > > Since a 3D LUT has a limited number of entries in each dimension we want
> > > to use them in an optimal fashion. This means using the 3D LUT in a
> > > colorspace that is optimized for human vision, such as sRGB, PQ, or
> > > another non-linear space. Therefore, userpace may need one 1D LUT
> > > (shaper) before it to delinearize content and another 1D LUT after 3D
> > > LUT (blend) to linearize content again for blending. The next patches
> > > add these 1D LUTs to the plane color mgmt pipeline.
> > > 
> > > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 10 ++++++++
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 ++++++++
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 14 +++++++++++
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 23 +++++++++++++++++++
> > >  4 files changed, 56 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > > index 66bae0eed80c..730a88236501 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > > @@ -363,6 +363,16 @@ struct amdgpu_mode_info {
> > >  	 * @plane_hdr_mult_property:
> > >  	 */
> > >  	struct drm_property *plane_hdr_mult_property;
> > > +	/**
> > > +	 * @plane_lut3d_property: Plane property for gamma correction using a
> > > +	 * 3D LUT (pre-blending).
> > > +	 */  
> > 
> > I think we'll want to describe how the 3DLUT entries are laid out.
> > Something that describes how userspace should fill it, like
> > gamescope does for example:
> > https://github.com/ValveSoftware/gamescope/blob/7108880ed80b68c21750369e2ac9b7315fecf264/src/color_helpers.cpp#L302
> > 
> > Something like: a three-dimensional array, with each dimension
> > having a size of the cubed root of lut3d_size, blue being the
> > outermost dimension, red the innermost.
> >
> 
> Here is an example of how we defined a 3D LUT layout in Weston:
> 
> https://gitlab.freedesktop.org/wayland/weston/-/blob/68e2a606c056c8453c770263f41f34cd68bdc9d0/libweston/color.h#L114-152
> 
> I think that is the most clear definition it can be, without needing to
> understand specific terminology.

Thanks for sharing it, Pekka! I'll check Weston's definition for 3D LUT
and also other elements for improving docs.

Melissa

> 
> 
> Thanks,
> pq
> 
> > 
> > > +	struct drm_property *plane_lut3d_property;
> > > +	/**
> > > +	 * @plane_degamma_lut_size_property: Plane property to define the max
> > > +	 * size of 3D LUT as supported by the driver (read-only).
> > > +	 */  
> > 
> > We should probably document that the size of the 3DLUT should
> > be the size of one dimension cubed, or that the cubed root of
> > the LUT size gives the size per dimension.
> > 
> > Harry


