Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B57B4693C2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322867A2F6;
	Mon,  6 Dec 2021 10:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4919C6E116
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Dec 2021 13:34:29 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s139so16154029oie.13
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Dec 2021 05:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dba45p7IFQxVo1vPtCiUXFLb3CpInduB/iaplQ8c3uo=;
 b=WWF+XA1PW9A/weFCUYey0M+NVqv3qo4KmSHR7X3OIsoKntb2alN6CnASlRxcR1wjrW
 8MrCNjpkrDgesjicsAEcqw1GKizk6s6SXK0uSiGQc+Pmpb/0n/yB5HtEbigGNa0hJnjh
 q0gJ9kxi+JYbMWRiDfyV5pDZiyPvz40d8v8ogcIydmRrIis064FSgR4hwzMXzPvQukKH
 BKSgmSLoEngKHaFh4Ckhd7T4sCgkMK8NGINEPExqKFtr09FHrMy8n+92UYOcFn3ZAS8i
 R98QgjvMEzNOOHW/WRzcKNzqmvs9H504opIUDnwLJqhGQAUj52z83iVo9/yQOQeNoJwx
 xJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dba45p7IFQxVo1vPtCiUXFLb3CpInduB/iaplQ8c3uo=;
 b=lpO9z/oVjCgALTZ0qGV/CukABvplKgYUjG1m5adctwSGdqsB7ylRO+DL41ssAtJIpw
 eAFmo0rwoR1CwB2J880WVc4xKdMt76oChS4aWunzXZ82J+9+1t10AVSccGP+e+fb0RBo
 GBHd+l0UPCOoK8d0l8cuJW71ub9gw9/FSqCdug3s5vyKKmy+GVIb9OcAD+n4RRWklky/
 hMmS+G7G6NPu1eKTEYWGw+tW9kKUwNQEijgDS/SZCqNpfVjeX9gtNko9M/jydAhBdjlB
 wyFqWwQnjE42RWe19WEXsotJ9oJWYbrCIQrJ9VdZz8XX9E3YopYOJIy1OC9RP3xjGv9L
 G4Yg==
X-Gm-Message-State: AOAM531kschERtHkCIeozdIAL6Do0ZxaaTsIegBUxNUSkp6AZI8KBbTK
 tTJWuaNtIjYWcnFYFS6SMsf+Oy0bo+4X4pRaViND4A==
X-Google-Smtp-Source: ABdhPJw9hEkYX3cFBYgzwRUX6ZP3BdzP6NM0jzNKsvFb9axBVn+Sz3vDkPsJIXB72KPvBe+IvI+TiFtz1WU/GBhW8ZE=
X-Received: by 2002:a54:4791:: with SMTP id o17mr19757864oic.114.1638711268277; 
 Sun, 05 Dec 2021 05:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20200928200856.1897023-1-pcc@google.com>
 <0dc9f36b-417d-bfad-9eb7-858c3041ff0c@baylibre.com>
 <20200929093201.GL438822@phenom.ffwll.local>
 <CAMn1gO7w1wUo3e9vUmGeF7fp0K9mq2ydSskX2xD3H=Kndzhc+A@mail.gmail.com>
In-Reply-To: <CAMn1gO7w1wUo3e9vUmGeF7fp0K9mq2ydSskX2xD3H=Kndzhc+A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 5 Dec 2021 14:34:16 +0100
Message-ID: <CACRpkdYGG-6OoWD29Jqo9dnhfWc2KMxpbCdRRYRmpuciiVrLAw@mail.gmail.com>
Subject: Re: [PATCH] Revert "video: fbdev: amba-clcd: Retire elder CLCD driver"
To: Peter Collingbourne <pcc@google.com>, John Stultz <john.stultz@linaro.org>
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
Cc: Eric Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Russell King <linux@armlinux.org.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter,

[Paging John Stultz on this]

On Tue, Sep 29, 2020 at 6:30 PM Peter Collingbourne <pcc@google.com> wrote:
> On Tue, Sep 29, 2020 at 2:32 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Tue, Sep 29, 2020 at 09:28:56AM +0200, Neil Armstrong wrote:

> > > Can't Android FVP use drm-hwcomposer instead ?
>
> Not without kernel changes. See e.g.
> https://www.spinics.net/lists/dri-devel/msg255883.html

Has this gotten better in the last year+ so you can now use
drm-hwcomposer?

I.e. can we now delete the fbdev driver?

> > Also, if we need to add more random fbdev ioctls to the drm fbdev
> > emulation, then let's do that. Not keep fbdev drivers on life support for
> > longer than necessary.

I wanted to fix this and started to look at it at one point,
however the required Android userspace build was a bit
intimidating to get going. I would be able to look into this
if a prebuilt Android for the emulation model was available.

Yours,
Linus Walleij
