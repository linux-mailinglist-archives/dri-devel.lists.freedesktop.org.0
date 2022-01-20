Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5BF494D25
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 12:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C2710E514;
	Thu, 20 Jan 2022 11:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2664F10E4C3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 11:41:56 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id o27so593738vkb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 03:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AcK8qyswp9gjQwYqxYG0L3jUGTV1Nm9qXmgnSkoFndU=;
 b=uhjyyCqJ7UVJYr6kFSsnoWr8Yb9oWhPS/21aw0JO8FOnTLNEKxaa7qfmHMBntMzfoH
 mcwlXC55x56Kt76CCX2teuDzOGrIhYeOav8kJjU8lEVEsxSDMK4xkeTP1UC18+BB7nBB
 KctO6TxhvyZfCI8z4dcdOKKsNTnICEfVHJU6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AcK8qyswp9gjQwYqxYG0L3jUGTV1Nm9qXmgnSkoFndU=;
 b=xmrMEV2idvX3evEq7d4dTjnmyWWAO2/lqz1atJo0WqiXPmcI7U5BGRcp7wUjl877lc
 ltaFAj5CJdnbXL043eX1KFkzKgt4AxYnx+jkUkJjzrGXu+DyKi38BHKweVh/Tw+cGJsh
 d11v2aNNlTNXzfHCOgAre4wraeysildg99FPQKUeZ+KpVuezbW681fbdqVrnao82faBW
 VzzCZ+xHzrexexd/tO+lYxp+3eFEaoYeQCktHIrAoa8hbeHRDUd8Pj23f3tGj4jLjdxn
 +f1CoOQ8xsHQelLKslqZ6Bxcd0F4FAcmvJQfGxSNEsscCWOFc+hKUX+oSBfEmgJ3ByMN
 ptEg==
X-Gm-Message-State: AOAM532BJxOpLOCgacNUYIzT8BlRR4jy4SOe99Hke+bAaKLPSVFOPbhP
 1T89BOdHbLEasvnYh3VD8/KPz2WKP6RQDueYbIT84A==
X-Google-Smtp-Source: ABdhPJzKuGisiIKX6JkS19MYQ5lMiIMLo7J6D0ujzzT5zQzQVnVViRq1oJFR8HGXDXxC+J1lbRio0kz39IufKUQWgfo=
X-Received: by 2002:a05:6122:a09:: with SMTP id 9mr1812478vkn.12.1642678915222; 
 Thu, 20 Jan 2022 03:41:55 -0800 (PST)
MIME-Version: 1.0
References: <CAFr9PXnig9YfnwSzMg5UPm3UtAsEAQT_xVheBbLppiU45mc_QQ@mail.gmail.com>
 <Yeg8mi0S2ACy9q8O@phenom.ffwll.local>
 <CAFr9PXkUwfyZ9yJgNYHX5_jo_SFfDU9wKA3Ldf+hbVL23faqKQ@mail.gmail.com>
 <cdeace24-67ba-8e23-29ad-f41abac98d79@gmail.com>
In-Reply-To: <cdeace24-67ba-8e23-29ad-f41abac98d79@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 20 Jan 2022 20:44:55 +0900
Message-ID: <CAFr9PX=-zERaND_DMbtPahAoiNeDDGVa=KwwLAErHrBrYMZohQ@mail.gmail.com>
Subject: Re: [RFC] How to add hardware rotation,
 scaling etc to a DRM/KMS driver
To: Hans de Goede <j.w.r.degoede@gmail.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Thu, 20 Jan 2022 at 20:24, Hans de Goede <j.w.r.degoede@gmail.com> wrote=
:
> > I wanted to do the rotation in the kernel so I didn't have to hack up S=
DL1.
>
> Right, doing the rotation in the kernel to make this all transparent
> was my first idea / wish too. Unfortunately that just doesn't really
> work well. Most display-blocks have multiple layers, for things like
> hw-rendering a mouse cursor, video overlays etc. I guess this is mostly
> exposed through the DRM/kms interfaces, but I believe fbdev also
> export some of this.

That makes sense. This hardware has a bunch of different framebuffer
things with different properties. My plan was just to fix the main
display and forget the rest of it exists. ;)

> For Fedora we have moved all SDL1 apps over to using the SDL1
> compatibility wrapper around SDL2:
>
> https://github.com/laibsdl-org/sdl12-compat

Thanks for the pointer! I didn't know that existed.

> And SDL2 has a drm/kms backend. So I think the best way forward here
> might be to use SDL2 (either directly or through the compat layer)
> with its kms backend and teach that backend to honor the panel
> rotation drm-connector property (so have SDL2 do the 180=C2=B0 flipping
> you want).

I was just looking at this... It seems like currently the KMS/DRM
driver for SDL2 requires a GPU and doesn't work on dumb hardware
according to comments I saw. But it seems like the best route forward.

Thanks for the pointers.

Daniel
