Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F8921056F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEFE6E802;
	Wed,  1 Jul 2020 07:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471256E802
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:51:53 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id t74so13046795lff.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=THSsMEdwUkIuQErJNTSneyWBjmNxLfAXVIDX4NKt1Z4=;
 b=lsK7zBiHNb6ChGBJ4kEzabV7KMiGLiwSMTGvcXRcsTVAcRdfAq7KHVGcId9mA+aMag
 V3ZkTiFnPCiQcsQjreRimXObyR1YN7YeU9t3zqhZGe6ukwB7Kabok9Pf6SsaQi0xWvWZ
 9sHML1TYiKIm/bLTyTuSMsZq0cPVfycCcZg0buB3K/pY3Uqlh+rXoFHg6xrSS2bQoxFs
 Tmpg/aD0TaD+trri+EoYsaNu6ha1j3ul/W8MxWsTcQ0JHj+DNnoFHNvZFzXnVfRbG14x
 g8WJxHQlpNJQ5fGDNlHD09PSFn10YiFyi6FJMnqDqjRbrcFbDdLmDhtViOSk9S2vyrCj
 JVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=THSsMEdwUkIuQErJNTSneyWBjmNxLfAXVIDX4NKt1Z4=;
 b=PDcruKUm+/jASfY9mR8SOH+7wHyZZS5+93QKUz3mDvUyWAO8Wv4eqGkR8azEUVEjAc
 a6WCSRRabB0p8nOCmLyU6HHQAqACb+oizxbpakK52MMAgyWez5Si4yvRoCTyULS/8C/y
 bsoC5LUR7x07Qkzk71cIATj229rZdzQsok6G0AA+DeABieuXLUKe13gVCuwgtxetb2Cp
 ADvE5hCODzDgGhbcSjxxrkDUd2RXgmY75Zzhc8FP6qw2k4HAxtA88obwS42g/M/ifOS0
 qjpyrUIuuFRrDhnceCrgAXOLTWHAIrmGD1lf1aVAdyITDkrilpR2Pk+IS+PY9GiJyc//
 +9Kw==
X-Gm-Message-State: AOAM530SJ3OWe5jhJI3+UTRe6rwxi/rbY3zn1Vnm2OQx8MdC3rh12/CV
 XeaANv6UKLfs8qtMi5hc/qYMBje0TI0CQfykXb0YNA==
X-Google-Smtp-Source: ABdhPJzsrXRiDZ3PkD9so8U9yDLfPpdekZBYhYQLf31C8+u6SV4k6PNFMTYLo99L9aQ6TZ/WW4DiQG4fnfo9xGSuqc0=
X-Received: by 2002:a19:ccd0:: with SMTP id
 c199mr14351117lfg.194.1593589911704; 
 Wed, 01 Jul 2020 00:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200626005601.241022-1-megous@megous.com>
 <20200626005601.241022-12-megous@megous.com>
In-Reply-To: <20200626005601.241022-12-megous@megous.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Jul 2020 09:51:40 +0200
Message-ID: <CACRpkdab8pOgrssi91wmKSJC5v2gu7VoQKt1MWG0g5AkNxk+7w@mail.gmail.com>
Subject: Re: [PATCH v5 11/13] drm/panel: st7703: Assert reset prior to
 powering down the regulators
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

> The reset pin is inverted, so if we don't assert reset, the actual gpio
> will be high and may keep driving the IO port of the panel.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
