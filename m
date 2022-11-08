Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6A2621748
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 15:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAEB10E29B;
	Tue,  8 Nov 2022 14:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167CE10E29B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 14:48:08 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id m22so2005390eji.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 06:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=udlUQxbpymKCwohxFY8X9JBSfOjmetBU5zbQOm9wbdg=;
 b=flNVoZG0dQayUX3DheVklirArChf7wKr16/xVvQxkvag0tVM5K9IwITBbykd7tROsH
 fTL90PtV9yxmU3v0EDxiW4LmInWBtlAD2Gz1AeXSvyXwb/m1ScBQ1Kj4VPMrhsUtqCRp
 8uGw1qzKnNqzT3B62BdTmwZwQm9ID5XDxOPhYGbJqz+P3frFIg/TSeCCq/KpfhDQFygO
 fUAvZgvalmOlTjuBhF6fenKHF5SyLjE2/EE1eyubAwxTyzxd4LhaltcuSBXswa8BDCqH
 3w+rbdtmvtqlj4k+id3pCqyMTapYSycxr3ffl3bk2lKZMn08xhsV8uPWPZ2eeJss53up
 AQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=udlUQxbpymKCwohxFY8X9JBSfOjmetBU5zbQOm9wbdg=;
 b=XP2rftDCOdhiu8khbnnm8rYjdxAKpOLd2kl+CxGRWS3EKbKGi/lPPxRPN3WO9OjMR1
 U9Jyg54UuH4y2CDHQvRR4c19eRcSbLi679hy1naXYLtdeIzZzUQB5+ZjI6kmfGl7QsUI
 oJ+EXNfKuLrRddIsX4NWi42K1BQPxCHiE0YJHlLHwshOc00UIH6yobI55sxZZwL7OrR9
 ZgumpyPqqa634ZJsj9em2q86q9l/4fsxbUNEpVsePIRjLTofgDzv31LmXuK7+dGtdIzr
 z2KGwTtwkzG7t1Pa+61OIgL87fT7NsGfc+eHgnbQKLUPLs2L6nXhKjdMCN2CmWYQxxS0
 ltmQ==
X-Gm-Message-State: ACrzQf0ih5FC1tuljo2J6Zstu2rKUPRSr2u5Gzgr79JUKntzoHw9k5zj
 pG5m/oXns+EWhmQ522RY7fvr1ryobrMvhiHWmPvyMOpeGgY=
X-Google-Smtp-Source: AMsMyM6wPLp+JJnawhuS9S6jZpX6mhnsHwb+BX87E31yK1EBAt+OPX86JS7UErDrFwQ1Vj7NhSGbHK0eVyErspJyIwA=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr54380391ejw.203.1667918886588; Tue, 08
 Nov 2022 06:48:06 -0800 (PST)
MIME-Version: 1.0
References: <20221103141155.1105961-1-jagan@edgeble.ai>
 <20221103141155.1105961-4-jagan@edgeble.ai>
 <CACRpkdYEW4z6EZ7UC9wT3NtRVnE=0L6AAHJDxtu5Jb-UrB+WSA@mail.gmail.com>
 <CA+VMnFxyx=NP2QUiJ6RnfapZ9c=S4-cj+0kQn8PYyaMTBP3i-g@mail.gmail.com>
In-Reply-To: <CA+VMnFxyx=NP2QUiJ6RnfapZ9c=S4-cj+0kQn8PYyaMTBP3i-g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 15:47:54 +0100
Message-ID: <CACRpkdaZnGgJ3egXEtoH0gTmR0m_-9Q+iGZr2eOx2JVHYgXCXA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm: panel: Add Jadard JD9365DA-H3 DSI panel
To: Jagan Teki <jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 8, 2022 at 3:12 PM Jagan Teki <jagan@edgeble.ai> wrote:
> On Tue, 8 Nov 2022 at 19:31, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Thu, Nov 3, 2022 at 3:12 PM Jagan Teki <jagan@edgeble.ai> wrote:
> >
> > > Jadard JD9365DA-H3 is WXGA MIPI DSI panel and it support TFT
> > > dot matrix LCD with 800RGBx1280 dots at maximum.
> > >
> > > Add support for it.
> > >
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> > > ---
> > > Changes for v3:
> > > - updatd to WXGA
> > > - use JD9365DA_CMD_DCS and JD9365DA_CMD_DELAY
> >
> > My comments on v2 have not been addressed, for example I asked to
> > remove the delay from sequences and just use an explicit delay and
> > to then use the existing sequence sending macro.
>
> True, I responded on the same day [1], since I didn't get the reply I
> have posted by assuming my comment is valid. Would you please check
> and respond?
>
> [1] https://lore.kernel.org/all/CA+VMnFz0w-6O=wt3iuJo1BhQgPZ2XbpX6JdDz6vg_JW9nHTR2A@mail.gmail.com/

OK I see, sorry for not reading close.

The driver just supports one single variant.

What you are doing is preparing the ground for more variants
that may or may not exist. This creates the antipattern "big upfront design"
i.e. abstractions added for things that do not yet exist.

I think it is better to strip it down to just open coding the delay after
the init sequence. When the next variant appears, if ever, they can
add abstraction. Maybe they need the same delay in the same
place? Who knows...

Yours,
Linus Walleij
