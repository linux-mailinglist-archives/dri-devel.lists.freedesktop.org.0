Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E79129506E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 18:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EAC6EDE2;
	Wed, 21 Oct 2020 16:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787306E3DA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 16:11:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i1so3820419wro.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cUTBfGpkjGkTGsbmO8B74xJhEbatmI1Pg7TKd6Jp7xc=;
 b=qb2bfz4GMq6ppSk0FR11s15QV/mAhYonEMEGTUklymuUl42ck/vWXik8vjowaN9D8h
 1UPZyMeprtZpdSEPui11fZAfkrzjHcOEpS7S4OeDK59Tsv7zvRbNjvmU4rxAG+RjpfPt
 LExdqHKSZBoM76yiM9SKHSJfYqZtceenr5kDZu7LCQSQbZJUZMk1oAsVdEeMQQRcRuPe
 BkLTzzn6rKPOWvobD/mWChTIlRmhz3x58/Ai9nGbzZyGLhKo2q7lmP3w2Kt8Jnr1RUkE
 SVcez6usB8HSsv7VoZumnVqc2pJ5J4XpTNuiFD+ruQP+r4SXGPlEj4uSkT7BVpJknbQP
 3mmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cUTBfGpkjGkTGsbmO8B74xJhEbatmI1Pg7TKd6Jp7xc=;
 b=XMcNBy/eHpU/3hfashtIiMClIyAWCVmmZbVyJSkrqVao15D5YxoGgq6dCpvY0gvJvG
 65cjEypjHqlngmiYCnLgwK5GA+hMYOiCFY1XhjAblUfjaXsIpIdhLsV7QszoNA0c4dyJ
 wCBKkwP5UhadwdKR5sw6gXPUw+LyGu5rE5J7rUTYFqDnchF7SUUntuFpZnR+ir/VOAhH
 3QVP+EkRqbBRJva1ektAkxTyQ/VV1+i/0fG+7PS5BTDpTg79IdGsJj33v+Cuwvmgn36q
 e/2UdcGS1G2QdZxV2aDpPmfFUeTvL1+mQC8NcE1p0F5AqubjDQeKQahTIB3sAeJlZPA4
 Iw6w==
X-Gm-Message-State: AOAM532FBcSdL740lkaLza3r2xjYquRxc8cb+WCCELXAeSzoycEd/p3H
 hoIZSrML+ADtgKwt8+Tl9C1j/t3+//bB56oZcbTeAA==
X-Google-Smtp-Source: ABdhPJxXFtGlvHIqa5a+sgsJes9EYbVcRpLjtnMZhqt4Uo0c1vANxIcqCm0CzhsFXdENgze/7oF4+tfJ/CV9VUn5puY=
X-Received: by 2002:a05:6000:107:: with SMTP id
 o7mr5605939wrx.354.1603296672913; 
 Wed, 21 Oct 2020 09:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201021065404.1336797-1-kenbshuang@google.com>
 <xyxxV-NdH-NcnbRURBYThCKj5j6VFLMi0twD2wptimtzrod1EyQ_Rp5BYQoQlVKUXsmZGxhrltrYBW4dgD4UDvgKSgW2CAzt_Q1e5bCNWlk=@emersion.fr>
 <20201021083415.GN401619@phenom.ffwll.local>
 <CAJxBc99xxc1S6CrE0KswPpY2Rf3KS0AQewNZQOfmOTbMWrtnTA@mail.gmail.com>
 <CAKMK7uECj12NaOeh3PzLM8C_oT=_bce515z-5rDGnjkKf92Htw@mail.gmail.com>
In-Reply-To: <CAKMK7uECj12NaOeh3PzLM8C_oT=_bce515z-5rDGnjkKf92Htw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 21 Oct 2020 17:11:00 +0100
Message-ID: <CAPj87rMc5=eBKRDJUg0VSCCWcvNk6_8vj1TZeJcK8oPdi=DVwQ@mail.gmail.com>
Subject: Re: [PATCH] drm: add client cap to expose low power modes
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Ken Huang <kenbshuang@google.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Adrian Salido <salidoa@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Oct 2020 at 16:58, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Oct 21, 2020 at 4:59 PM Ken Huang <kenbshuang@google.com> wrote:
> > It's useful in Android and other embedded devices to implement Always On Display (ex. showing clock faces with less than 15% OPR on screen).
> >
> > OPR (On Pixel Ratio) is the percentage of luminance amount over the display area.
> > It's derived by gray levels of display image pattern and the backlight (or OLED) driving force (or current).
> > ex: OPR=100% means a full white pattern with maximum backlight (or OLED) brightness, while full black would be OPR=0%.
> >
> > In userspace, when the client initializes, we can set capability via drmSetClientCap() to ask the display driver to expose the drm modes with DRM_MODE_FLAG_LOW_POWER flag.
> > Userspace can check DRM_MODE_FLAG_LOW_POWER flag to know which modes can be used to consume the least amount of power during Always On Display.
> > Ignoring modes with this flag set during normal operating mode.
>
> Hm I'm not really sure what this changes ... I think we need the
> entire pile of patches: Userspace, driver, drm core, anything else.
> Just adding this flag doesn't make much sense really, since I have no
> idea what the semantics are. Even after you've explained the use-case.

It makes sense to me: some modes are annotated with a 'low-power'
flag, tucked away behind a client cap which makes clients opt in, and
they can switch into the low-power mode (letting the display/panel
save a lot of power) _if_ they only have at most 15% of pixels lit up.

My worry is about the 15% though ... what happens when hardware allows
up to 20%, or only allows 10%?

If we can reuse the same modelines, then rather than create new
modelines just for low-power modes, I'd rather create a client CRTC
property specifying the number/percentages of pixels on the CRTC which
are lit non-zero. That would give us more wriggle room to change the
semantics, as well as redefine 'low power' in terms of
monochrome/scaled/non-bright/etc modes. But it does make the
switching-between-clients problem even worse than it already is.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
