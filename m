Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B30314C92
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 11:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7AE6EAC3;
	Tue,  9 Feb 2021 10:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C400C6EAC3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 10:11:11 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id v5so25260173lft.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 02:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I3/9yayXh6QMAkFp1huulAc1Q7Fo3pUrN8C39Hno9q8=;
 b=ok/OXPUNjpdP/CpMHzx7nHBVLufgpfo5DPhdkPB1OaF1DgZA2Cw+XjTGzuSvtOI61V
 O4Z99GZaeyyQoKFqEOVztudQL/nJBS0GiWnnKW3MjWaeZiukvw7n5L13AWpkdoaUl+ya
 fMXB3XUirLhSFxz6lWCVQ891KRgTXkQ7v6qMx7mfdLFyBcfDHO6rYluS0210Z0FOA1ma
 SPA6PIYNILWOd1JZzY872sg0HHS9Y54FOjVbh0dMPhn96tnDhNQcNqF3Bl3uXzXIyoXG
 nuCOdBAzpz31BEvluRwff3TTcWTanAhDjpUDzNK57qUuZAsaRmgK3Gbb+veMxiHLtXa8
 pItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I3/9yayXh6QMAkFp1huulAc1Q7Fo3pUrN8C39Hno9q8=;
 b=pPQSm2TMXAoioGf6YSdwWN8qHXQbxcsrMs6Y4bkrHenyydpQuNa/Q6R1ubw3wTvAyg
 SkIcFBJ1muxNvVWWVcZEEef/3dW1TKP/R9lM5f0m93PBhtmpSHBtVAtjLLh7lxtVAIGq
 7pgqQ7qQupx1Rh1PXwKGA98dlJhuFz69FU6K+JHU91lj94/HuIsz90Aszz8NxXZBs7Zx
 Mb2IJf71OiLBn+HmUiKoWDltADRIGwA/BjlNe5oDSqnNn1ia+HNnaOHdACes2wAXFR/g
 Wnm3C3WGMJ+jLzNmH1wwkz1DCGs5BEKiBs57DP4xUo2rIIU2NQ2BFnqMtGshHw4RTfTl
 MNEw==
X-Gm-Message-State: AOAM5332Ly4P2QzKSoqjSxdHpNApr0hyKNdxFsRsLks219EtUd0HCczO
 4s8szYVHFTdaAiDSrY609YIarBsn+5j2/SIu3/QYEA==
X-Google-Smtp-Source: ABdhPJzRVhmTkSsRA2O+jrAlgCnS/2satqeVSmR6Oth0mIMokl1ovpU1Dzrz6yHFynRxWjs20HbClrDSeSdzgbaHeOI=
X-Received: by 2002:a05:6512:310d:: with SMTP id
 n13mr5044583lfb.586.1612865470224; 
 Tue, 09 Feb 2021 02:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20210126213200.14366-1-linus.walleij@linaro.org>
 <20210205172718.dajtb5yc3haatz3z@maple.lan>
In-Reply-To: <20210205172718.dajtb5yc3haatz3z@maple.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Feb 2021 11:10:59 +0100
Message-ID: <CACRpkdY6ez23qHq2r0XxFqA4FO7A0d2WmytKY5iaM5=HrqYVrQ@mail.gmail.com>
Subject: Re: [PATCH] backlight: ktd253: Bring up in a known state
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 6:27 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
> On Tue, Jan 26, 2021 at 10:32:00PM +0100, Linus Walleij wrote:
> > The KTD253 backlight might already be on when the driver
> > is probed: then we don't really know what the current
> > ratio is and all light intensity settings will be off
> > relative to what it was at boot.
> >
> > To fix this, bring up the backlight OFF then move it to
> > the default backlight from there so we know the state.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Hmnnn... horid, since the backlight will flicker during boot,
> but I recall that this bit of hardware is pretty horid anyway
> so it is not easily avoided.
>
> Therefore, slightly grudgingly,
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Thanks, and I agree, this makes things better than before though.

The actual problem translates to the generic problem of bringing
misc boot-time conditions over to the kernel, and handing over
any type of hardware in a half-initialized state. We don't really have
a solution to that yet, many have tried.

For this specific case, one can imagine a "kinetic,boot-time-brightness"
(or similar) DT property, with the idea that the boot loader or
DT author knows what to put in there. I put that on my TODO
(the code in this patch will still needed if that property isn't provided).

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
