Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8BA73399
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 14:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6E010E0A6;
	Thu, 27 Mar 2025 13:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b3zbp2vC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6A910E0A6;
 Thu, 27 Mar 2025 13:51:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 459C9435AB;
 Thu, 27 Mar 2025 13:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF8DC4CEDD;
 Thu, 27 Mar 2025 13:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743083489;
 bh=MfBm0ARJgTYvHs/SLl+TW6RGQHEr5XhW8mIQcvpQV/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b3zbp2vCLZn9ZlT2QEbh1A0R7IEjqDiIznyRlG+JaVlPo9CdrAQWF841fTJQT7PXD
 bFrglbFD1lxaZ7/tvE14qFs3+puZcuX7rf7bltfMFOdm30DloW7ZF/+5gv5tsD43i0
 DQ7ZU57m3+jUMwU1FELZhnzb+CIOVEN3tR6bcvLC/b3nbRumukVf+65+uryUPEcnwm
 OCQz9O9EVzlWbdTUnLgD2A+AP/E8NJ6j7nv28BO1IzrlNXGty776djdcgJ2YmNh857
 rDd8R3ohbKz8F1RGxIDPXBZmN1M4RYW0iMY4zEhp3PohA2MQeQDJECw8jX3dZCva2c
 49mlgwALUGspw==
Date: Thu, 27 Mar 2025 14:51:25 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: M Henning <mhenning@darkrefraction.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
Message-ID: <Z-VX3TJPI6Tgin2G@cassiopeiae>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <CAAgWFh2dHZs2D7R4ejY9sNQ+QCtLQeGGS2PNtcsm_MPeV3edLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAgWFh2dHZs2D7R4ejY9sNQ+QCtLQeGGS2PNtcsm_MPeV3edLw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 21, 2025 at 06:06:34PM -0400, M Henning wrote:
> On Thu, Mar 20, 2025 at 2:18 PM Danilo Krummrich <dakr@kernel.org> wrote:
> > On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
> > > +     __u32 width_align_pixels;
> > > +     __u32 height_align_pixels;
> > > +     __u32 pixel_squares_by_aliquots;
> > > +     __u32 aliquot_total;
> > > +     __u32 zcull_region_byte_multiplier;
> > > +     __u32 zcull_region_header_size;
> > > +     __u32 zcull_subregion_header_size;
> > > +     __u32 subregion_count;
> > > +     __u32 subregion_width_align_pixels;
> > > +     __u32 subregion_height_align_pixels;
> > > +
> > > +     __u32 ctxsw_size;
> > > +     __u32 ctxsw_align;
> > > +};
> >
> > What if this ever changes between hardware revisions or firmware versions?
> 
> There was some previous discussion of that here:
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/12596#note_2796853
> 
> From what I can tell, this structure hasn't really changed since
> FERMI_C (circa 2011), so I'm not too worried about it changing on us
> too quickly. When it does change, we have the option of appending more
> members to this struct in the usual way, or if the change is more
> fundamental we can return an error from this ioctl and add a new
> interface. Userspace needs to handle an error from this ioctl
> gracefully anyway since whether it works or not depends on the gpu
> generation and what firmware is loaded right now.

We could also define it as

	struct drm_nouveau_get_zcull_info {
		__u32 version;
		__u32 _pad;

		union {
			struct drm_nouveau_get_zcull_info_v1 info;
		}
	}

just to be safe.
