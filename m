Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012B01E81DB
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 17:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495B76E937;
	Fri, 29 May 2020 15:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FE06E937
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 15:31:48 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t18so4141175wru.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Pl8NY5IfZQOSBMkesMLYtoogC9he39YurVkgcPfkCA=;
 b=q2bHNnFvXEBQ7Wdfl2BV/JOlVBD31iFwhw3mZ85gXY7AkGYuBbYaZV6cSvY51DnlFN
 s7aTu8bb4jXOgpT+rf8Eyw8b9i0zmI0zM4tZCUGWknU38WXPKYg+K7+kXTJT8enISUpS
 YX14sqibTBttbpawj6qdFtdGqQdekWr3yKU4YXzsk5y0/UMd+Zv9nj6Mjq9qIGb/39iI
 LBYh2wjSMZN2exiDUDB8wxAicMNKNfyQiMGi3XjSilOA9qmmuUGpgczwcgOg5D4AfJLF
 lOmz3YkImp+6PPYIzASvZAcCpL0aQVW9SlpPBkwQoHXDUYRkNuVOX9QgSYK37bHAa9bF
 BQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Pl8NY5IfZQOSBMkesMLYtoogC9he39YurVkgcPfkCA=;
 b=MLp+Dugl6tH1JL0Q2pSdIUn2cW7NDrNnkVS0JmnpLhx5DNP1Xjy71+auLtu2Q0jk9B
 BGl604nzeF5HBxxOBp19xjn/ov7c7+6oV9LzrDUzbw7fU8lkRxXek1i+Nm88I3vTfF3U
 tV5MLZ/PQxAZ2F8pVybGFUOz7bMgjc43bUFRT0bgNeYOuKdBdG+up44Z3XBxFkBxM0pY
 HDxX6wy2pFJztiyJ8v38mrBMaqtviM8A/RW3+cpJhslwgaaVQokW7HEqhdQ8NmdfUs3i
 9MGnOnZFBPJXd+Mva6R9q2P5wN29fjiLOqUhOrSEadolQsgD19I+onrxlrRRnnYfZvof
 d7RQ==
X-Gm-Message-State: AOAM533bT5UM2myfn9wvjxuCd8be5Jeq/iHMyF05GxBTNC8x2E1U3NOe
 ld0Cb+30MQPyNHKOvX66bqkjpkt4FRZEuB3ejjE=
X-Google-Smtp-Source: ABdhPJzbQwSLVrA2TrPwIPSInb9kiBHHRKJE8WEjhp5Un1ne1T9L2Gjf3W6uqV9NuQcCytGs/sAVlfZy1swNG0C36+E=
X-Received: by 2002:adf:fd41:: with SMTP id h1mr9593740wrs.374.1590766307060; 
 Fri, 29 May 2020 08:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
 <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
 <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
 <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
 <CADnq5_OX9o5_Gc4SjU5M4B=fthT9++J-FjX3UqTS7x_u6cJHOQ@mail.gmail.com>
 <CAPj87rP+Hxhohb4dEjRwtZzy34fYk+hAdgVfCkLF1u4JufJ=CQ@mail.gmail.com>
 <CADnq5_Pzj+AWQZWOcwvf8WQDVJrpc2DyG6Z1ZYqgfHA-8AXpMA@mail.gmail.com>
 <CAPj87rNO62i5JmRLdMhAg9XbiJUyrrRO7fj1ruXRCh-oxHnifQ@mail.gmail.com>
In-Reply-To: <CAPj87rNO62i5JmRLdMhAg9XbiJUyrrRO7fj1ruXRCh-oxHnifQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 29 May 2020 11:31:35 -0400
Message-ID: <CADnq5_NOWgaw=L+s1dNAvp+fjwA+LzhmP+bWGx9io31TaE_YkQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 11:03 AM Daniel Stone <daniel@fooishbar.org> wrote:
>
> On Fri, 29 May 2020 at 15:36, Alex Deucher <alexdeucher@gmail.com> wrote:
> > On Fri, May 29, 2020 at 10:32 AM Daniel Stone <daniel@fooishbar.org> wrote:
> > > On Fri, 29 May 2020 at 15:29, Alex Deucher <alexdeucher@gmail.com> wrote:
> > > > Maybe I'm over thinking this.  I just don't want to get into a
> > > > situation where we go through a lot of effort to add modifier support
> > > > and then performance ends up being worse than it is today in a lot of
> > > > cases.
> > >
> > > I'm genuinely curious: what do you imagine could cause a worse result?
> >
> > As an example, in some cases, it's actually better to use linear for
> > system memory because it better aligns with pcie access patterns than
> > some tiling formats (which are better aligned for the memory
> > controller topology on the dGPU).  That said, I haven't been in the
> > loop as much with the tiling formats on newer GPUs, so that may not be
> > as much of an issue anymore.
>
> Yeah, that makes a lot of sense. On the other hand, placement isn't
> explicitly encoded for either modifiers or non-modifiers, so I'm not
> sure how it would really regress.
>
> In case it was missed somewhere, there is no generic code doing
> modifier selection for modifier optimality anywhere. The flow is:
>   - every producer/consumer advertises a list of modifier + format
> pairs, declaring what they _can_ support
>   - for every use where a buffer needs to be allocated, the generic
> code intersects these lists of modifiers to determine the set of
> modifiers mutually acceptable to all consumers
>   - the buffer allocator is always handed a _list_ of modifiers, and
> makes its own decision based on ??
>
> For a concrete end-to-end example:
>   - KMS declares which modifiers are supported for scanout
>   - EGL declares which modifiers are supported for EGLImage import
>   - Weston determines that one of its clients could be directly
> scanned out rather than composited
>   - Weston intersects the KMS + EGL set of modifiers to come up with
> the optimal modifier set (i.e. bypassing composition)
>   - Weston sends this intersected list to the client via the Wayland
> protocol (mentioned in previous MR)
>   - the client is using EGL, so Mesa receives this list of modifiers,
> and passes this on to amdgpu
>   - amdgpu uses magic inscrutable heuristics to determine the most
> optimal modifier to use, and allocates a buffer based on that
>
> Weston (or GNOME Shell, or Chromium, or whatever) will never be in a
> position as a generic client to know that on Raven2 it should use a
> particular supertiled layout with no DCC if width > 2048. So we
> designed the entire framework to explicitly avoid generic code trying
> to reason about the performance properties of specific modifiers.
>
> What Weston _does_ know, however, is that display controller can work
> with modifier set A, and the GPU can work with modifier set B, and if
> the client can pick something from modifier set A, then there is a
> much greater probability that Weston can leave the GPU alone so it can
> be entirely used by the client. It also knows that if the surface
> can't be directly scanned out for whatever reason, then there's no
> point in the client optimising for direct scanout, and it can tell the
> client to select based on optimality purely for the GPU.
>
> So that's the thinking behind the interface: that the driver still has
> exactly as much control and ability to use magic heuristics as it
> always has, but that system components can supplement the driver's
> heuristics with their own knowledge, to increase the chance that the
> driver's heuristics arrive at a configuration that a) will definitely
> work, and b) have a much greater chance of working optimally.
>
> Does that help at all?

Yes, that helps a lot.  I has some misconceptions about the higher
parts of the stack.

Thanks!

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
