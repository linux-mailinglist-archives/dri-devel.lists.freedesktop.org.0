Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA0C1DB619
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 16:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A330889E65;
	Wed, 20 May 2020 14:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFC289E65
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 14:19:12 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id c3so2535301otr.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 07:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sjoxFxfLtclPDSr6o8yqjRaqVkyg716LkbOcsM9wj6I=;
 b=LyfaSMZcasMyis1bX4fsTjdrcifHQYzE1cgpNTTLJEeDGa1n4K2bK+jgJDD8jTJTHg
 FMSR/R+OOYOb/zhnoUtJG0sng3uHTVbIlP80xIuNBSIV2Ms4a7EE/z1um4y2gpPn4jTh
 4w6+AzLnBhQbl8vBk33rvyv10Wb4WMS1ZYrmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sjoxFxfLtclPDSr6o8yqjRaqVkyg716LkbOcsM9wj6I=;
 b=lhrarAthzG49THOqA/vwiF7vWlHKoKaTmYc9xMJexvoqn4m7P+Y5cNU1PCBL+lR5XI
 VH3qKXyH1LdnrFEdX6Q3HkQQyHEV59SpW5nbcaLUrNKGqbtPahVz9f9KBT/l957RQPBX
 8Gs1yxd1Avy0pWWezkSjO1tXHTFtsihMAIa0Sxpe+Jgg6qHo5p8PXsDZJL0Y7p+rddcK
 ADFqd057sLndo9Jt8jK61vdKtJ+5urPEEbwJVm2c17SjjOrqAU38h0yvkc0XakeyE5hW
 VHObkBQxhZPo6hg+9DMcNAbyc0Q6Q0QAcrjJxebmVAsqkucRQz8t8AzEPiXTsbqg3TYt
 mu7Q==
X-Gm-Message-State: AOAM533kbYjYI2dYlXwFLVJM0DBflLnqAL5rWB5JWcCVmW9OXYMh6uei
 cyHfn/iZb+mjnXnwc2PpQGrT2cSHWfoHid65dWw+Ww==
X-Google-Smtp-Source: ABdhPJyE5KNSmZqOtmd8kjbRnu/8DFYuBMMCJftHFwM+h5k7NgfLsaPgUL7li3lWskKIyvVp7OgrZPGgwo9a7Ztgtao=
X-Received: by 2002:a9d:600e:: with SMTP id h14mr3480769otj.281.1589984351700; 
 Wed, 20 May 2020 07:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200520125556.GY206103@phenom.ffwll.local>
 <4Qkv4p0V0uG4sZ8LjizVLq6bLbZ8U1xAwQ0riB72aHH3sT_ZJYz9QzDFPWCko8PfcA-VGBFkGtCn1n9YfKYqo_vwzvE3BVQUlxyBq61GZ08=@emersion.fr>
In-Reply-To: <4Qkv4p0V0uG4sZ8LjizVLq6bLbZ8U1xAwQ0riB72aHH3sT_ZJYz9QzDFPWCko8PfcA-VGBFkGtCn1n9YfKYqo_vwzvE3BVQUlxyBq61GZ08=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 May 2020 16:19:00 +0200
Message-ID: <CAKMK7uFzk7UW7k8WTMSzKynGOypQeTzhf9Gqxb4maimG+QEdiQ@mail.gmail.com>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
To: Simon Ser <contact@emersion.fr>
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
Cc: Sean Paul <sean@poorly.run>, Dave Airlie <airlied@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 20, 2020 at 3:20 PM Simon Ser <contact@emersion.fr> wrote:
>
> On Wednesday, May 20, 2020 2:55 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > Maybe we should add an explicit note that there's no guarantee about the
> > new chardev minor this new device will get, it could both inherit the
> > existing one (you can't open the old one anymore anyway) or get a new one?
> >
> > Or does userspace want a guarantee, i.e. as long as there's still a handle
> > open kernel guarantees to not recycle the chardev minor (which is what we
> > currently do). In that case better to add that to your list of guarantees
> > above.
>
> The are race conditions to consider too, e.g.
>
> - Compositor sends /dev/dri/card0 to a client
> - card0 goes away
> - Another device takes card0
> - Client receives /dev/dri/card0 and then starts using it, but it's the
>   wrong device

Oh reminds me, what should we do about open() - that one will fail,
the chardev is going away after all, not failing kinda doesn't make
sense. And more tricky, about creating new leases?

I think reasonable semantics here would be that both of these "create
a new open drm fd" operations can fail as soon as the device is
unplugged. Userspace needs to be able to deal with that.
-Daniel

>
> At first glance these seem like edge-cases that almost never happen.
> However I've seen these happen in practice with connectors, especially
> with docks.
>
> One solution would be to number minor numbers like PIDs: don't recycle
> card0 before we've reached the upper minor number limit.



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
