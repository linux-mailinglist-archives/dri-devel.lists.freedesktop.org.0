Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406F13A31EB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 19:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5588E6E4B0;
	Thu, 10 Jun 2021 17:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789E06E4B0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 17:17:50 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l2so3179454wrw.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eYawZ5aExV6n84uhZjgGkFgKnGmPPDiujBBcssECG+Y=;
 b=DnZEq6rt04PbNJCE1lGlqtLTjhx0QU9StTmx8ovgvbBUss+ZdfnTewNBBrKCvC/KZB
 fKXGtylK/DLAwlTW1xW3HzkR9MEREoeu5lwXYRcHSNZqfNTB481KLS2ltaISyLmXiyC+
 5APeUG1KmfqdrjDaEe/t/VK3DcBIUUXIq60SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eYawZ5aExV6n84uhZjgGkFgKnGmPPDiujBBcssECG+Y=;
 b=iUwgp2TERFP1t0gttEjpc4zRepRLczifKwS4IMtUUC1ClhrvIfis52qgoEsCB2Afz5
 NpGgCSEtB7gQdxFyKHZkjft+y3U9OvyxsSVQblTF7gElZLPHPCaC3/ht55RAuq1AIoHD
 UOAkBguu/2Vyrg9wt2FGXj+32BEW0t5E+ZheDJjG8GbNbXQotGMnbvedtfqnxU1lpFSb
 AYWr6vCvtgYwnMKa81yHplf61yKPciZDvGRICD5NKCbZfdFbp8NeGa4WspS8RK2lozID
 bOR4qnMBHfMmG9J0qq27Gv3T4VEmU7V2gyjl4l0LDkNM8BUCWNwY96h+HIbFxzJGQ0Bm
 F6nA==
X-Gm-Message-State: AOAM5339Pg/dwBMz2IkOmAjjyRB09IqZl7JU9/GLnKYwHFMP+98+eY59
 FrSB7FTX0fa6SiJLyZg0CqgPvw==
X-Google-Smtp-Source: ABdhPJzahNe/16BfcvolHqk3BE4ZCktEsTiUM7MNOT9LA9SHBRCkVznNJMjNiZS8PPX2uhdHN3GYhA==
X-Received: by 2002:adf:f805:: with SMTP id s5mr6490490wrp.231.1623345469165; 
 Thu, 10 Jun 2021 10:17:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h6sm4281863wrt.20.2021.06.10.10.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 10:17:48 -0700 (PDT)
Date: Thu, 10 Jun 2021 19:17:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v4 1/2] drm/doc: document how userspace should find out
 CRTC index
Message-ID: <YMJJOiLtiaxT5lMs@phenom.ffwll.local>
References: <20210609230039.73307-1-leandro.ribeiro@collabora.com>
 <20210609230039.73307-2-leandro.ribeiro@collabora.com>
 <20210610112742.17d21f7c@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610112742.17d21f7c@eldfell>
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 11:27:42AM +0300, Pekka Paalanen wrote:
> On Wed,  9 Jun 2021 20:00:38 -0300
> Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:
> 
> > In this patch we add a section to document what userspace should do to
> > find out the CRTC index. This is important as they may be many places in
> > the documentation that need this, so it's better to just point to this
> > section and avoid repetition.
> > 
> > Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> > ---
> >  Documentation/gpu/drm-uapi.rst    | 13 +++++++++++++
> >  drivers/gpu/drm/drm_debugfs_crc.c |  8 ++++----
> >  include/uapi/drm/drm.h            |  4 ++--
> >  3 files changed, 19 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > index 04bdc7a91d53..7e51dd40bf6e 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -457,6 +457,19 @@ Userspace API Structures
> >  .. kernel-doc:: include/uapi/drm/drm_mode.h
> >     :doc: overview
> > 
> > +.. _crtc_index:
> > +
> > +CRTC index
> > +----------
> > +
> > +CRTC's have both an object ID and an index, and they are not the same thing.
> > +The index is used in cases where a densely packed identifier for a CRTC is
> > +needed, for instance a bitmask of CRTC's. The member possible_crtcs of struct
> > +drm_mode_get_plane is an example.
> > +
> > +DRM_IOCTL_MODE_GETRESOURCES populates a structure with an array of CRTC ID's,
> > +and the CRTC index is its position in this array.
> > +
> >  .. kernel-doc:: include/uapi/drm/drm.h
> >     :internal:
> > 
> > diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugfs_crc.c
> > index 3dd70d813f69..bbc3bc4ba844 100644
> > --- a/drivers/gpu/drm/drm_debugfs_crc.c
> > +++ b/drivers/gpu/drm/drm_debugfs_crc.c
> > @@ -46,10 +46,10 @@
> >   * it reached a given hardware component (a CRC sampling "source").
> >   *
> >   * Userspace can control generation of CRCs in a given CRTC by writing to the
> > - * file dri/0/crtc-N/crc/control in debugfs, with N being the index of the CRTC.
> > - * Accepted values are source names (which are driver-specific) and the "auto"
> > - * keyword, which will let the driver select a default source of frame CRCs
> > - * for this CRTC.
> > + * file dri/0/crtc-N/crc/control in debugfs, with N being the :ref:`index of
> > + * the CRTC<crtc_index>`. Accepted values are source names (which are
> > + * driver-specific) and the "auto" keyword, which will let the driver select a
> > + * default source of frame CRCs for this CRTC.
> >   *
> >   * Once frame CRC generation is enabled, userspace can capture them by reading
> >   * the dri/0/crtc-N/crc/data file. Each line in that file contains the frame
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 67b94bc3c885..bbf4e76daa55 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -635,8 +635,8 @@ struct drm_gem_open {
> >  /**
> >   * DRM_CAP_VBLANK_HIGH_CRTC
> >   *
> > - * If set to 1, the kernel supports specifying a CRTC index in the high bits of
> > - * &drm_wait_vblank_request.type.
> > + * If set to 1, the kernel supports specifying a :ref:`CRTC index<crtc_index>`
> > + * in the high bits of &drm_wait_vblank_request.type.
> >   *
> >   * Starting kernel version 2.6.39, this capability is always set to 1.
> >   */
> > --
> > 2.31.1
> > 
> 
> Hi,
> 
> with the caveat that I didn't actually build the docs and see how they
> look:
> 
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Pushed to drm-misc-next, thanks for the patch&review.
-Daniel

> 
> 
> Thanks,
> pq



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
