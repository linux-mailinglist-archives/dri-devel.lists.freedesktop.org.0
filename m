Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD89399BB1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 09:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD286F412;
	Thu,  3 Jun 2021 07:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F716F410
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 07:37:07 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 5-20020a9d01050000b02903c700c45721so3866852otu.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 00:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ExEFQgMl9rp1X5xOtaDvHjwFVhy8KtZGitPAjQyeU+k=;
 b=HV6mkhbyHezmEwjAjCtgPN/dKoASk1HxP4kR7EiuHKw1bYsgsmoT4Mdtb0vQWzrj5q
 rwhJWo6TY/b+3m7fNwQr2O8jrWCCubbNOOw56XwjJSNuC/ZBSMl6OIP00ciufjQP4FnF
 1TlWmX+OHk86YH3PEEsXPdJYmWBbNxtdXhqhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ExEFQgMl9rp1X5xOtaDvHjwFVhy8KtZGitPAjQyeU+k=;
 b=THOWlSqINjFBNEGLUVD3meVq2FMrfd0SVjg2ZMMDtF24QIRzFy3z/7WfxWxrJjPbDk
 oh8BwfYat+/grgSSLSxOY8D0AJkxRP4HuVgBrA+39PQkQXtL/W5/2KLlcCiU8c/xLis0
 peS3d4pa2ETUUlGJeKezIVTpZdHT93lTGaAPpT7MUVW4UkGj1gp/p0/FPufNrSQKmG0x
 LrWyIxT7KudABO4o1QtKkueE7jewfIyoS8f6irs11EL7j5+r2CSbrszBuBfioPVwi31a
 gQ5nyElpwN/is9ABgK5vv8mmJ0ntZP3NwD7bK80X71UZ/8CZTZHe2ZoXzctNFyxr9h6q
 V4+w==
X-Gm-Message-State: AOAM531qRBcaXuXo2cuEF/WPu94mDdw93JWXiFtj19tGrKFb2mPSXh/M
 KCTwevpJhp1A4FmAiosGB+dWCp5hP7bkozq4D/Rinw==
X-Google-Smtp-Source: ABdhPJzCSS/8X7dQ8j1SXKGE/jsm8QaKzNF+fwhMKQdzDFzXRkrAAUr/P4T2iret6WbC2kyk8TeBTpmd/cNwKjhVAQA=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr28713270otq.303.1622705826902; 
 Thu, 03 Jun 2021 00:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <a29eaef9-2457-1393-6757-40956811daf8@linux.intel.com>
 <a6965639-acf6-b5f5-482c-2715e7fa69d4@amd.com>
 <b4c18e45-98c9-ce7f-b22c-c00c795844c2@shipmail.org>
 <baf4f828-76c8-6b47-5bba-9b9c8e7b307b@amd.com>
 <YLfQplT8H6PdCCLX@phenom.ffwll.local>
 <c50fa98f-3735-fe04-d3f9-8a7a08a7562e@linux.intel.com>
In-Reply-To: <c50fa98f-3735-fe04-d3f9-8a7a08a7562e@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 3 Jun 2021 09:36:55 +0200
Message-ID: <CAKMK7uE+fB_+UG668O=QMXwQ9_Xb--KhzehT77HLfBoWve-zLg@mail.gmail.com>
Subject: Re: [Intel-gfx] Merging TTM branches through the Intel tree?
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 8:50 AM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
>
> On 6/2/21 8:40 PM, Daniel Vetter wrote:
> > On Wed, Jun 02, 2021 at 11:48:41AM +0200, Christian K=C3=B6nig wrote:
> >> Am 02.06.21 um 11:16 schrieb Thomas Hellstr=C3=B6m (Intel):
> >>> On 6/2/21 10:32 AM, Christian K=C3=B6nig wrote:
> >>>> Uff I'm just waiting for feedback from Philip to merge a large patch
> >>>> set for TTM through drm-misc-next.
> >>>>
> >>>> I'm pretty sure we will run into merge conflicts if you try to push
> >>>> your changes through the Intel tree.
> >>>>
> >>>> Christian.
> >>> OK, so what would be the best approach here?, Adding the TTM patches =
to
> >>> drm-misc-next when your set has landed?
> >> I think I will send out out my set to Matthew once more for review, th=
en
> >> push the common TTM stuff to drm-misc-next as much as possible.
> >>
> >> Then you should be able to land your stuff to drm-misc-next and rebase=
 on
> >> the end result.
> >>
> >> Just need to note to David that drm-misc-next should be merged to drm-=
next
> >> before the Intel patches depending on that stuff land as well.
> > Other option (because the backmerges tend to be slow) is a topic branch=
,
> > and we just eat/resolve the conflicts in both drm-misc-next and
> > drm-intel-gt-next in the merge commit. If it's not too bad (I haven't
> > looked at what exactly we need for the i915 side from ttm in detail).
> >
> > But also often figuring out the topic branch logistics takes longer tha=
n
> > just merging to drm-misc-next as the patches get ready.
> > -Daniel
>
> Daniel: So the thing we need to get into TTM is the iterator-based
> move_memcpy which is more adaptable than the current one and needed to
> support non-linear lmem buffers, some bug-fixes and minor changes to be
> able to keep our short-term-pinning while on the LRU. A necessary evil.
>
> Christian: it looks like you have landed some TTM changes already, in
> particular the &bo->mem -> bo->resource change which is the main
> conflict I think. Is the 10 patches self-allocation series the main
> remaining part? That will probably cause some conflicts with already
> pushed i915 TTM setup code, but otherwise will not conflict with the
> rest of the TTM code I think, which should make it possible to bring in
> our TTM changes after conflict resolution with what you've already
> pushed. The memcpy code is pretty self-contained.

I think in that case topic branch on top of drm-next (once the ttm
bits we conflict with are there) is probably best, and then pull that
into drm-misc-next and drm-intel-gt-next. Merge window freeze is also
approach, so without topic branch we'd be stuck until like -rc2 when
drm-next reopens. I guess Maarten can do the topic branch logistics in
drm-misc.git for this.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
