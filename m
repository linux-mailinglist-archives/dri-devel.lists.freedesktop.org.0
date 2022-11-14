Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35393627CBB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 12:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A38D10E03F;
	Mon, 14 Nov 2022 11:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6F910E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 11:46:22 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id k2so27674999ejr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 03:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JcA3WTxOLVsx9HyWrWLCEt+YOch5fZ11V6/Dj+y46aA=;
 b=J5IbFNRIl4mZrIOBZFbbul4vZSjr+pCopQ7xC7t7IOFNWt6LK4uxEvTlJnvi3DcCwg
 Mj0qHZIjwFJVNplqULbN/194xLESjkxtAhp/nuowYUfaRBLpXSknAajP3SX6Dgrzv59V
 yKghZNr1yjbX3bREjwDCaVqXxzRKTLp2WxROFiJm78qSAUevR0I+XZ0yL2AhwA5Pa8OC
 Ar++AW2/6pNlTjaFzQ+AU5BsmOCluF6KQGAxfnIzvKmg3YcHdqbB1xKailKTBo/9bQke
 f1lNIWQKey8NrtlSX6lZgrcC1R5huFLvUHeJ1g7l+kQtdhx1JHnLlDYNnPfod7M6u2NM
 5PWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JcA3WTxOLVsx9HyWrWLCEt+YOch5fZ11V6/Dj+y46aA=;
 b=2iGHhr9ITz9hZJjeSllAedW743MznvOTSC3MkFJGfWFXdkfFrLnKGfWArxDAWgS8Bf
 8ff07Zrs294RycuLsfdR98ReF6c+j47CQTOHM4rVu5zPtUTL1azfWYurHk8R6GImJLC0
 WK/VEsQ/i1SYtdjc5TfsQDhFk2MOwozB8Zoc5gtQc0M8XO3I7jWnkFY3EIXuoQpDLUP+
 Hjn0KyVI8TLHAq8LyhAcHmonkgWc1KI+9ZJHvA3boh3CExSMN6KcyFaNQrtkNKOByGVp
 96cTCVmXFPLJC6uh0KqhinOvsfSrnyGXkBJ1Ano2tX7fnd8PYR0+k96SZMSXGvy/3YFd
 cKOg==
X-Gm-Message-State: ANoB5pmIMoZIk1PAPrGTbfOXP1znpC1Langs2UqT6qBwPUAPpJiinKH1
 WIyOIHX69ejYssmO81TedAvYYk97mOtioZHMvyo/fQ==
X-Google-Smtp-Source: AA0mqf55Kgh4Bv2j+bcln0t870AQldqCRbuXxJ4UGCTGQspRwPvvgmh0WJDtUtbiPYrjd10rLRWtolMp2Yb6CagXlUk=
X-Received: by 2002:a17:906:4911:b0:7ad:9891:8756 with SMTP id
 b17-20020a170906491100b007ad98918756mr10170402ejq.203.1668426381321; Mon, 14
 Nov 2022 03:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20221111203130.9615-1-macroalpha82@gmail.com>
In-Reply-To: <20221111203130.9615-1-macroalpha82@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Nov 2022 12:46:10 +0100
Message-ID: <CACRpkdatn3SFaSDwj33QVvx_B-020TaTDoPz3p_9K=EiT7A_7w@mail.gmail.com>
Subject: Re: [PATCH V5 0/3] drm/panel: Add NewVision NV3051D Panels
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 Chris Morgan <macromorgan@hotmail.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 9:31 PM Chris Morgan <macroalpha82@gmail.com> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add the NewVision NV3051D panel as found on the Anbernic RG353P and
> RG353V. The underlying LCD panel itself is unknown (the NV3051D is
> the controller), so the device name is used for the panel with a
> fallback to the driver IC.
>
> Changes from V4:
>  - Removed "prepared" as its tracked by the framework.
>  - Use mipi_dsi_dcs_write_seq instead of custom implementation.
>  - Changed devm_gpiod_get_optional to assert GPIO as high at probe so
>    it is held in reset on suggestion from maintainer.
>  - Removed requirement for vdd-supply in documentation.
>  - Added description in documentation for reset gpio to note it should
>    be active low.

v5 looks good, patches applied to drm-misc-next and pushed, I had to fix
a minor checkpatch complaint in the driver but it was trivial.

Yours,
Linus Walleij
