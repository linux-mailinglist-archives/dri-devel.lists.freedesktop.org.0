Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B018F17E74E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 19:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4576E6E508;
	Mon,  9 Mar 2020 18:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228166E508
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 18:37:25 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id o42so3693457uad.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 11:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+M0Xm70FBs1+Uld/cCfy6Z+mGrIDdQ74Y8mdd67aBFU=;
 b=SeP+pOWYEaQ4gjLIVKDagh/dGetv/8k3NJ27r1tA7zi4nhrpj8M+cuBv+cFs344i27
 gCu6+sNJ96QNBnPl4eIIzMOd0UcSpV2EyUhE79BocD6Xnhczpk9dDxFqEt1W7cfQmQKJ
 KpyQsF8I141YZBiWG1WLVCMyuo0o+0+wHLqvUy/AXIUAt3G6XI872sLuMIWZS4obcuC8
 Lxs+BfrxeEp2eh9MiVUAbVVlDPyOUbklhHo0d3IYgvtlstnp+sFqtv+G1OPOM3BR5YZ2
 GI14TMiV3VGK4dnybAbnjwrpCAdYDWHDgnTBMcEHS1IcH1X90h8grhpPlfpxilAnxeBn
 RwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+M0Xm70FBs1+Uld/cCfy6Z+mGrIDdQ74Y8mdd67aBFU=;
 b=Tm0+dtYsaDqvkDkzPH5g+eYrUmgxoSHi102JbcpZJKKYEvF2GtIzCizc4dYWdRDPEv
 cZwn16YBNAwSfE9TZ6zh03a99o8VFV/1ZDMURW1a3KgVl7eKnOctMo4kzXUTuXACA2s4
 xj1SVOA7oiWnltgqxVep5rK0mvD2N1YaTDgz51c1gG6Cx5NSUEb7CGCDRy2VtSyI/jC/
 cMk+z9aiUYwQbOsZFW8vnxnOQV/ZW6tblaLLp5kWstrNWUIfEC18E6oSXvJG7nqnPlxf
 OPnlLtb2BEpBY3fSx+osVENEFfX0g7+gntVjbIjfSiM8mszgT1J//TMjgP3FW8zt/8Qy
 Ed8w==
X-Gm-Message-State: ANhLgQ1iv7zOiIU1Es1u1NJKV781SP6pFXSAv0F/BjugWHVnkB1mAk9Z
 olLTvjZUbQwEXDFF1LQM8ynRBfNMgCJ+KR/mMuw=
X-Google-Smtp-Source: ADFU+vtTh7L+jHMIF3SN2nrc1ee4DChk/Uh/h1923VaBfvZqFRmfphr9SGCnKI0BWv4l28EDweFfEgIEI+DEDC/B2jo=
X-Received: by 2002:ab0:5b52:: with SMTP id v18mr9571016uae.64.1583779044176; 
 Mon, 09 Mar 2020 11:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200219132728.64083-1-emil.l.velikov@gmail.com>
 <20200306160012.42274b9a@eldfell.localdomain>
 <CACvgo51cC08dqpqfsUddu-EuX+5bxVo70V7vDBohEJAZ_h1kKA@mail.gmail.com>
 <20200309103824.7d106671@eldfell.localdomain>
 <CACvgo51TO7ByNWVN880uUZA35zjiwLmHMj3HoXHm6+u--AJ5Zg@mail.gmail.com>
In-Reply-To: <CACvgo51TO7ByNWVN880uUZA35zjiwLmHMj3HoXHm6+u--AJ5Zg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 9 Mar 2020 18:36:40 +0000
Message-ID: <CACvgo52-GsY9QXsNcaOH8rNYr7Y+DWAcvDf5gtx4ZpKyW=Lqzg@mail.gmail.com>
Subject: Re: [PATCH] drm: rework SET_MASTER and DROP_MASTER perm handling
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Mar 2020 at 13:13, Emil Velikov <emil.l.velikov@gmail.com> wrote:

> > OTOH, if applications exist that rely on drop-master failing in this
> > specific case, making drop-master succeed would break them. That might
> > include a buggy set-master path that was written, but does not actually
> > work because it was never tested since drop-master never worked.
> >
> > So I do not fully buy this argument yet, but I also cannot name any
> > explicit examples that would break.
> >
> >
> I've ventured for a while in the X (Xorg + drivers), Weston,
> sway/wlroots and Mesa's codebase.
> There were zero instances of such misuse. If other projects come to
> mind - I'll gladly take a look.
>
Just checked a few other projects with git pickaxe* - zero cases of
mentioned (mis)use. In particular:
 - qtbase + qtwayland + gtk
Never used the wrappers or ioctls

 - kwin + plasmashell
Never used the wrappers or ioctls

 - mutter + gnome-shell
Briefly used the wrappers. Sane codepath

 - igt-gpu-tools ... just because I had it open
Sane use both wrappers and ioctls.

Any other projects I should check?

-Emil

* Both via libdrm and directly calling the ioctl
git log -p -S DROP_MASTER
git log -p -S drmDropMaster
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
