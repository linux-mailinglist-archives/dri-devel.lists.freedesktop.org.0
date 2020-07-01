Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D921054F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909E56E402;
	Wed,  1 Jul 2020 07:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD276E402
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:48:49 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z24so896510ljn.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uHiWeHvIRTabhJTMwa3fxsZyuvaR5uB2s6b6XKCykyI=;
 b=lA+NKOK7zcmXa+2MC1Gn+Y/TDNNdWs07VZI26+piRmWa5IgJ6SkoLWgnui5+oh39Q6
 JI6t0CXi/MwfxhT8vihn8/G5X/LVpEvZMEq6tZoPu3lZavZG9S0OrLs90EX1D+5GNIjW
 sn5HxzJnDf4UXKGwZsAkmMMGh/L0sPm18+UMSMM1eLMgNI1ScSZ7avbX4Jba1HNPFR01
 Oz9jy9C52A6E2XL5BRjrUkpECbZ+e9Z0fJBkNwYFnAHSKnD0TULcsTh24JxIR23IbQ9B
 1wfadENgJePUvcAFAQh88V1690Yckkn/btGB8V/wCG7M9ur0RaRMuVp1qacys1YinlL/
 Kt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uHiWeHvIRTabhJTMwa3fxsZyuvaR5uB2s6b6XKCykyI=;
 b=s5jD38dVtQ22QW88NKZelK5+Vm1Lt9HCXh2V0orkC9v4K/hmkhWjgNciDjEQ8hFJWA
 4UTjwHZCrj/neGu9FxQC6nTVw8dlsVndgxhi1NEt2WcvdanKcD3hT56S1+vRzrPiU4Gb
 FTv+mgwwu77CfEuBe9PycOTgTTcumCuwxzCDF9yW+YyOi/bjx6oNZIGkcPWfrIYe0/wx
 e4Dch/V+PKp7qfgnH5Hk/2djylsu0dg2vV7dxfDSAQcUKMKaebyRL/E7wOuBcOm8ltzV
 18RLqLfmwPKwtH2EQCP7E5nwlQUsLWfFQOd5N5QwjupnrvSZxrJf9GeHfi4lQi5gVU1U
 oU0g==
X-Gm-Message-State: AOAM531w/F5G9IK5R+Ex7JMaEiHiWOG465oek29d7ZnKMDNHwd4MaMz4
 zEi5ZA+uqT3voC7X1ziYnFml4+Q2EzPX/xEKRbda5A==
X-Google-Smtp-Source: ABdhPJxumtOUJ9MZZWWYdqUsVyvRBEAFzjv5D3L00fsCsWjbg4DvKg1etmzvpIC/d88ZkoLQjiDZIXHRS5fiu1kXPgs=
X-Received: by 2002:a05:651c:112e:: with SMTP id
 e14mr11799081ljo.338.1593589728209; 
 Wed, 01 Jul 2020 00:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200626005601.241022-1-megous@megous.com>
 <20200626005601.241022-7-megous@megous.com>
In-Reply-To: <20200626005601.241022-7-megous@megous.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Jul 2020 09:48:37 +0200
Message-ID: <CACRpkdbWUW4AaZf3ZTvabdQ3SwwwBcdwYFOaE1ou4rbtUAUOEw@mail.gmail.com>
Subject: Re: [PATCH v5 06/13] drm/panel: st7703: Prepare for supporting
 multiple panels
To: Ondrej Jirman <megous@megous.com>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Purism Kernel Team <kernel@puri.sm>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Luca Weiss <luca@z3ntu.xyz>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 2:56 AM Ondrej Jirman <megous@megous.com> wrote:

> Parametrize the driver so that it can support more panels based
> on st7703 controller.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
