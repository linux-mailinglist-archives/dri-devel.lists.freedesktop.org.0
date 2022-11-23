Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74619635905
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 11:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305AA10E232;
	Wed, 23 Nov 2022 10:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBCF10E1FF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 10:07:08 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id n21so41566944ejb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 02:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+UdvofUGp6+nqq/FR8FcX4hvZmapqrFr41Q2JO7x4c=;
 b=TQ51N5ElxONDKI/zhDJ3pCgpfLjbZshPT3dmaV8oEwygDZ7SUkV43yilCvjo5DTHkM
 5vinp6v+ldQAo/Z6KGaY5xTUo3Lnhb4v5NMeNcJq5CXQqT+ExG+ICc1x7EqIpc/l8ZI+
 6kkzXHBS485z5Q3W1BWot8CJKckOO6+wlmPxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h+UdvofUGp6+nqq/FR8FcX4hvZmapqrFr41Q2JO7x4c=;
 b=RiSjvX+JY+83pgik3kYsUjiQaYZDhWfMe557ZTWXUCgDc1qwRRIJPOwl6lK95EGoWM
 Bl+GddnwspayUN8hYZfQgtUCmHK73N/Vg0XId1r93J6CoSuQxlOMC6iONM/RWjk3+97m
 rduC7c6/R3wGLIXUXYTwF9gSlW651AX688XdOT7pTLxEdaLfgKlXfC7MYeDYtn8ihlFS
 uTzYZ7Qf144P/YQr7L5OiiZnSC2u/HlwQDcJiaQ2StG7G2hNlufXxh+6mlye14BZydqH
 EIHqXn16lmSXJ/OtSiVFoHr7RYNjaNyQVfAehqkGYDbZc9TDaqV4sWxTNVcPard3x7qX
 9Mwg==
X-Gm-Message-State: ANoB5pmKX9sgFweGt0mP48om3tURn19GBPfpl9QR4sE5eX5apH0GiX5f
 BWZxrKGAI+wrJRHmIrFKRf7ZKTaQ3HtHNcYlhHhUjA==
X-Google-Smtp-Source: AA0mqf7tcZdPWNPPAaRZELTq9mvgZpMH+k/1GataSXqkuF2ePYeDW4qUMkJISiWe8P9mQTOVdyKvWgBCSqeQKGcAWaA=
X-Received: by 2002:a17:907:8197:b0:7b8:eae2:716a with SMTP id
 iy23-20020a170907819700b007b8eae2716amr4704467ejc.516.1669198026954; Wed, 23
 Nov 2022 02:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
In-Reply-To: <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 23 Nov 2022 11:06:55 +0100
Message-ID: <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Jason Gunthorpe <jgg@ziepe.ca>, John Stultz <john.stultz@linaro.org>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Nov 2022 at 10:39, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 23.11.22 um 10:30 schrieb Daniel Vetter:
> > On Wed, 23 Nov 2022 at 10:06, Christian K=C3=B6nig <christian.koenig@am=
d.com> wrote:
> >> Am 22.11.22 um 20:50 schrieb Daniel Vetter:
> >>> On Tue, 22 Nov 2022 at 20:34, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >>>> On Tue, Nov 22, 2022 at 08:29:05PM +0100, Daniel Vetter wrote:
> >>>>> You nuke all the ptes. Drivers that move have slightly more than a
> >>>>> bare struct file, they also have a struct address_space so that
> >>>>> invalidate_mapping_range() works.
> >>>> Okay, this is one of the ways that this can be made to work correctl=
y,
> >>>> as long as you never allow GUP/GUP_fast to succeed on the PTEs. (thi=
s
> >>>> was the DAX mistake)
> >>> Hence this patch, to enforce that no dma-buf exporter gets this wrong=
.
> >>> Which some did, and then blamed bug reporters for the resulting splat=
s
> >>> :-) One of the things we've reverted was the ttm huge pte support,
> >>> since that doesn't have the pmd_special flag (yet) and so would let
> >>> gup_fast through.
> >> The problem is not only gup, a lot of people seem to assume that when
> >> you are able to grab a reference to a page that the ptes pointing to
> >> that page can't change any more. And that's obviously incorrect.
> >>
> >> I witnessed tons of discussions about that already. Some customers eve=
n
> >> modified our code assuming that and then wondered why the heck they ra=
n
> >> into data corruption.
> >>
> >> It's gotten so bad that I've even proposed intentionally mangling the
> >> page reference count on TTM allocated pages:
> >> https://patchwork.kernel.org/project/dri-devel/patch/20220927143529.13=
5689-1-christian.koenig@amd.com/
> > Yeah maybe something like this could be applied after we land this
> > patch here.
>
> I think both should land ASAP. We don't have any other way than to
> clearly point out incorrect approaches if we want to prevent the
> resulting data corruption.
>
> > Well maybe should have the same check in gem mmap code to
> > make sure no driver
>
> Reads like the sentence is somehow cut of?

Yeah, just wanted to say that we need to make sure in as many places
as possible that VM_PFNMAP is set for bo mmaps.

> >> I think it would be better that instead of having special flags in the
> >> ptes and vmas that you can't follow them to a page structure we would
> >> add something to the page indicating that you can't grab a reference t=
o
> >> it. But this might break some use cases as well.
> > Afaik the problem with that is that there's no free page bits left for
> > these debug checks. Plus the pte+vma flags are the flags to make this
> > clear already.
>
> Maybe a GFP flag to set the page reference count to zero or something
> like this?

Hm yeah that might work. I'm not sure what it will all break though?
And we'd need to make sure that underflowing the page refcount dies in
a backtrace.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
