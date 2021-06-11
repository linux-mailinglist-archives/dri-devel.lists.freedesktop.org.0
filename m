Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE9B3A3D34
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 09:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF146EE3C;
	Fri, 11 Jun 2021 07:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF7D6EE3C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 07:33:51 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so2326356otg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZlIQe9qv8O6FQ2CsCDmcJ8/H7zvy6iG9vnscteytW7A=;
 b=ODuU6q+6Si5vOfDfTpjCXZwBawjE6HchKMMGiHwHHIy6az39Jpp1yCR+Fdx/WJEgLm
 00GikXqxGnZwBSZzCX5B1KlPj7+duiwHLHtMaLU2v1g4DAIJOLELqCtc2C4ck/IZA3sr
 bQP8JgH2RLh3CEKQCwZG7wStm7GThZnTRirDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZlIQe9qv8O6FQ2CsCDmcJ8/H7zvy6iG9vnscteytW7A=;
 b=JNGrku21mI/q8eB+ruH77YySJ68YrRI94cG4gDOElqBkdb8h6cxGxgY7RZVS9Q1wGF
 SDawJ2OyFTvOEMIBEgUfcGrujlIfCDoESQBx87t0Lky+eDMWhRKS0A8WV2mz3+1bbx9j
 HYe9iw+TaOut5RzTX4diiFAACmgRq0gGVnVvjBfW+Tafhdh2Prdz3+fB36P5OCrnM+3N
 BM6pU+1urOpfErFPnmr+0xrXRPItDXENQxJTaOyHI3DyrQAHu64k7Dzjt/G8tQqPD/L3
 i7T+xcFVHr+BaC2S6cSqv78XJVbPdlZDB4RBhlxU9FFL+inifCY7cSN/2nVkJ+cgD4zp
 lY0w==
X-Gm-Message-State: AOAM533zQnl2f6s/ziO5pfgrBdc1y/xKxzaO53n6DvD3Ud974FJH++/y
 V1mRdLH5OZoIsDtl0tsVSRc5fwE9GUxT8RCFYb6R09i8UFI=
X-Google-Smtp-Source: ABdhPJxgDXtdkinGOH7LTP931QLG3WXc/kRPXslrOCkw7PSnT+dSuSwHqkJoNpi4tSfw5PGzt3JT0x+2oaW4LgcVPFY=
X-Received: by 2002:a9d:12eb:: with SMTP id g98mr1883581otg.303.1623396831099; 
 Fri, 11 Jun 2021 00:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210610203824.50965-1-leandro.ribeiro@collabora.com>
 <20210610203824.50965-2-leandro.ribeiro@collabora.com>
 <20210611101945.2e7ef9e4@eldfell>
In-Reply-To: <20210611101945.2e7ef9e4@eldfell>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 11 Jun 2021 09:33:40 +0200
Message-ID: <CAKMK7uHgmawQJ+dS1mLKhFuMZehs-dQZLzXyp6n0dxPNmT19Rw@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/doc: document drm_mode_get_plane
To: Pekka Paalanen <ppaalanen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@linux.ie>, Collabora Kernel ML <kernel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 9:20 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Thu, 10 Jun 2021 17:38:24 -0300
> Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:
>
> > Add a small description and document struct fields of
> > drm_mode_get_plane.
> >
> > Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> > ---
> >  include/uapi/drm/drm_mode.h | 35 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index 9b6722d45f36..698559d9336b 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -312,16 +312,51 @@ struct drm_mode_set_plane {
> >       __u32 src_w;
> >  };
> >
> > +/**
> > + * struct drm_mode_get_plane - Get plane metadata.
> > + *
> > + * Userspace can perform a GETPLANE ioctl to retrieve information about a
> > + * plane.
> > + *
> > + * To retrieve the number of formats supported, set @count_format_types to zero
> > + * and call the ioctl. @count_format_types will be updated with the value.
> > + *
> > + * To retrieve these formats, allocate an array with the memory needed to store
> > + * @count_format_types formats. Point @format_type_ptr to this array and call
> > + * the ioctl again (with @count_format_types still set to the value returned in
> > + * the first ioctl call).
> > + */
> >  struct drm_mode_get_plane {
> > +     /**
> > +      * @plane_id: Object ID of the plane whose information should be
> > +      * retrieved. Set by caller.
> > +      */
> >       __u32 plane_id;
> >
> > +     /** @crtc_id: Object ID of the current CRTC. */
> >       __u32 crtc_id;
> > +     /** @fb_id: Object ID of the current fb. */
> >       __u32 fb_id;
> >
> > +     /**
> > +      * @possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's
> > +      * are created and they receive an index, which corresponds to their
> > +      * position in the bitmask. Bit N corresponds to
> > +      * :ref:`CRTC index<crtc_index>` N.
> > +      */
> >       __u32 possible_crtcs;
> > +     /**
> > +      * @gamma_size: Number of entries of the legacy gamma lookup table.
> > +      * Deprecated.
> > +      */
> >       __u32 gamma_size;
>
> Hi,
>
> I wonder, has this field ever been used?
>
> "The legacy gamma" refers to CRTC gamma LUT AFAIK, but this here is
> about planes. I forgot that at first, so didn't see anything funny.

Yeah "Deprecated" isn't really conveying that this was never used or
implemented anywehere ever. I think we should put that into the docs
to make this clear, otherwise someone is going to wonder whether maybe
they still need to parse it since it's only deprecated and there's no
other plane gamma (yet). I wouldn't even put any further  docs than
that in it, because stating that it's the number of entries for
something we never implemented is going to be confusing at best :-)
-Daniel

>
> Anyway, whether the doc for this field is as is, or is changed to
> "never used" or "unused" or "reserved" or whatever, you have my:
>
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>
> With the caveat that I didn't actually build the docs to see how they
> look.
>
>
> Thanks,
> pq
>
> >
> > +     /** @count_format_types: Number of formats. */
> >       __u32 count_format_types;
> > +     /**
> > +      * @format_type_ptr: Pointer to ``__u32`` array of formats that are
> > +      * supported by the plane. These formats do not require modifiers.
> > +      */
> >       __u64 format_type_ptr;
> >  };
> >
> > --
> > 2.31.1
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
