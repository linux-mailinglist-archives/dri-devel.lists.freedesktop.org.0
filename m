Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0A4731147
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 09:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108F810E490;
	Thu, 15 Jun 2023 07:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896FB10E490
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 07:49:31 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b1bb2fc9c6so23032861fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686815369; x=1689407369;
 h=content-transfer-encoding:in-reply-to:subject:organization
 :references:cc:to:content-language:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=QNKCE55T6mCVWh0FRxlA50uEkLG4q1p0SmHMNDIDUZg=;
 b=toCxsgNt9AI6vRpcwhHSwe4vgnbjIV/b3WQI4G66Iv0I9yOOseXmOtv2qvqIJwIWnM
 t1Q9sjUqneFtprgj7aafn2irnSoCCB0/LEY5hgS8bvcXBIWHhnPsr6NS2udg9sx97iqe
 JqzOYSqDpdomMB5gSHxoQAFBHrar6453rbnREFIj+tLQv0y6ZOMlvIWnuGovGDgBdwyC
 msmW2SBNpk2LEta/esXY91d4/Lpe2uD+amr9dP1qaHB0UqSkMAB2eoFlR0J1GYJAh3da
 u0ISL1ggJAbpOQwT4KGZyWq++jb5noaIB/INvGgFxZee0NndlDFqnkZ7TpCYmgS6436S
 +sIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686815369; x=1689407369;
 h=content-transfer-encoding:in-reply-to:subject:organization
 :references:cc:to:content-language:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QNKCE55T6mCVWh0FRxlA50uEkLG4q1p0SmHMNDIDUZg=;
 b=bjFPaeVUbzaOAx8FkxijKv+im6t5CAnldxGoRGQxU3OJFDEgr0YkAJDfixr5/Dv9Ia
 m771TMtzZ8o0i/YztAqiryYVG2EPVW/3duxpTmK2+MbN7u61UdWa4Sjy4EXF58oPUKPE
 tY1ejPljxTi5s6irNdeop+EhSpAPYIPhwxZ4P8RRPBfkBP+BtFCiKwkQlKjX5pLD8wRH
 OKf4dYPsrUq20G/dTnjEMUElE8Nz6+zJRlCFUkc0nuo3nrSdGzcZqq0MYZNCioQ79P/i
 NRtXOpqAsQet5ga5Ndzb5PtK48AtlaJL5rR1AwXKq0aA+nkAilDDeeONshjA5J0KXa/I
 8j1Q==
X-Gm-Message-State: AC+VfDyoh4PBqxpdfYXDMC0LBRj0YSvSc0rbrD6mtwLABhbis6XTINav
 0PYntf6HVldgKl8fDJCgn3NkDw==
X-Google-Smtp-Source: ACHHUZ5ZMREpLufLNiD+ZfTU5cEP6//hr16tWKbMuH22rsMYZ59spNvayYRGJjaWbMCuckPUGDrJ2g==
X-Received: by 2002:a19:8c49:0:b0:4f6:2495:31ef with SMTP id
 i9-20020a198c49000000b004f6249531efmr8226145lfj.22.1686815368684; 
 Thu, 15 Jun 2023 00:49:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f60a:f5e3:7ae:6745?
 ([2a01:e0a:982:cbb0:f60a:f5e3:7ae:6745])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a7bc4c9000000b003f7f249e7dfsm19908075wmk.4.2023.06.15.00.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 00:49:28 -0700 (PDT)
Message-ID: <4f78b601-6e6e-2274-3174-87c62d7cfcd5@linaro.org>
Date: Thu, 15 Jun 2023 09:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Ajay Kumar
 <ajaykumar.rs@samsung.com>, Thierry Reding <treding@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>
References: <20230613-panel-dsi-disable-v1-1-5e454e409fa8@linaro.org>
 <ZIjayn8nVy-ejThH@gerhold.net>
 <CACRpkdZ7a3aARMs3iBbBavF_0AkPOPs3fH8e6CrZYo7Ybr6m_A@mail.gmail.com>
Organization: Linaro Developer Services
Subject: Re: [PATCH] drm/panel: move some dsi commands from unprepare to
 disable
In-Reply-To: <CACRpkdZ7a3aARMs3iBbBavF_0AkPOPs3fH8e6CrZYo7Ybr6m_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: neil.armstrong@linaro.org
Cc: Caleb Connolly <caleb.connolly@linaro.org>, linux-arm-msm@vger.kernel.org,
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2023 22:58, Linus Walleij wrote:
> On Tue, Jun 13, 2023 at 11:08 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> 
>> I'm still quite confused about what exactly is supposed to be in
>> (un)prepare and what in enable/disable. I've seen some related
>> discussion every now and then but it's still quite inconsistent across
>> different panel drivers... Can someone clarify this?
> 
> It is somewhat clarified in commit 45527d435c5e39b6eec4aa0065a562e7cf05d503
> that added the callbacks:
> 
> Author: Ajay Kumar <ajaykumar.rs@samsung.com>
> Date:   Fri Jul 18 02:13:48 2014 +0530
> 
>      drm/panel: add .prepare() and .unprepare() functions
> 
>      Panels often require an initialization sequence that consists of three
>      steps: a) powering up the panel, b) starting transmission of video data
>      and c) enabling the panel (e.g. turn on backlight). This is usually
>      necessary to avoid visual glitches at the beginning of video data
>      transmission.
> 
>      Similarly, the shutdown sequence is typically done in three steps as
>      well: a) disable the panel (e.g. turn off backlight), b) cease video
>      data transmission and c) power down the panel.
> 
>      Currently drivers can only implement .enable() and .disable() functions,
>      which is not enough to implement the above sequences. This commit adds a
>      second pair of functions, .prepare() and .unprepare() to allow more
>      fine-grained control over when the above steps are performed.
> 
>      Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>      [treding: rewrite changelog, add kerneldoc]
>      Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> My interpretation is that .enable/.disable is for enabling/disabling
> backlight and well, make things show up on the display, and that
> happens quickly.
> 
> prepare/unprepare is for everything else setting up/tearing down
> the data transmission pipeline.
> 
> In the clock subsystem the enable/disable could be called in fastpath
> and prepare/unprepare only from slowpath so e.g an IRQ handler
> can gate a simple gated clock. This semantic seems to have nothing
> to do with the display semantic. :/

It had to do, .prepare is called when the DSI link is at LP11 state
before it has switched to the VIDEO mode, and .unprepare is the
reverse when VIDEO mode has been disabled and before the DSI link
is totally disabled.

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L938

then

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L855

but Doug has started changing this starting with MSM DSI driver, leading to
current panel drivers not working anymore with the current DSI init mode
and requires setting pre_enable_prev_first for only some DSI hosts
who switched out of set_mode().

The DSI init model doesn't fit at all with the atomic bridge model and
some DSI controllers doesn't support the same features like the allwinner
DSI controller not support sending LP commands when in HS video mode
for example.

Neil

> 
> Yours,
> Linus Walleij

