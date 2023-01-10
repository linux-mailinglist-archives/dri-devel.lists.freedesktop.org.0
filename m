Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1765664079
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 13:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C08010E107;
	Tue, 10 Jan 2023 12:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE1D10E107
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 12:30:13 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id e76so11582690ybh.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 04:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IkuSAVZKOMsJ1gBdMEqLNegz0l4XsEs9PuRldm+SHM8=;
 b=U09OCe5+MuYI8K/ycZrcs7CYd3trN9s+7ymZIPZ0kBsWgNeufoNdJlYaNMpvS89KDC
 gm3ZGksFLNVdTjYoQxW3pntyPPCywQaGSiiviTEz6sMN1vBeZUC2J55e0vRp8+tEQLWn
 7J9tstD1zFKR7m95JI+6sKmRdmt81tSyz4EVea8wE41cK2v3K04gGsEo8S5wkopCQupc
 vcAJTYeuN/hoZ9vYthwJdrESEuXOafq66E/tBFOUWkU9Qwp71NYucLSoCUWFAA3gO2qf
 yWORl4B/9OUjDbVkhgHiCqHiJ/TIFUHg/mp9zUik6oDEg4XTLmsreqPYAo7Wx+cdPLpU
 YCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IkuSAVZKOMsJ1gBdMEqLNegz0l4XsEs9PuRldm+SHM8=;
 b=xK8V+DjptYWHDI4y22cyX4KZ/1C8RxbWU0z1d2ms94ZlRR1TMZckAtr8jB0kj3LjwZ
 7MPAKca/pD51l1zIICPezcO03/Gcp8Ccfvc8Ahq1W53pamH2zjj/ZMuCeZ4HrABfXfdm
 Z3mxYFvHBh7UvfbZ1DVu070Ef2JlyHop1rWqUDXhPX71lcyaxKAzM79sIQchJMKANMF7
 tRqZFFpWpXXYYe5McsZLN1+a3NvYDzLHjwwQPgSBqxAt2NmZKae4GaRiRGZL7lagdhHv
 IoHdmRcwdEibE2/DdvUKHRyiFVXRI2rvR3ooR9AGUXUASHINodSolBJwqubM76mbNEK1
 w9kw==
X-Gm-Message-State: AFqh2koVPrVxuACYlChofVwOutago5KrRX0F+0pGE+XqIzBdt9q8i6du
 JDI6iYKVsaP3vvvfM9g/Rnr4zD4yc89nlYNGfno/ww==
X-Google-Smtp-Source: AMrXdXuazqX69BR7RE1uv30pTTanD5lHxZjQvOynOcbPo0qKA4l4TamAC0py24Ol3McuVecCEHZpbSDl/p9n8AwmalI=
X-Received: by 2002:a25:6982:0:b0:700:e0f1:6335 with SMTP id
 e124-20020a256982000000b00700e0f16335mr6074124ybc.520.1673353812884; Tue, 10
 Jan 2023 04:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20230102230733.3506624-1-javierm@redhat.com>
In-Reply-To: <20230102230733.3506624-1-javierm@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jan 2023 13:30:02 +0100
Message-ID: <CACRpkdadwiG=OMMHFUKYHyr1zRpeZzVR9pkmsBEBxqZzN2H53g@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add PinePhone Pro display support
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 3, 2023 at 12:07 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:

> This series adds support for the display present in the PinePhone Pro.
>
> Patch #1 adds a devicetree binding schema for panels based on the Himax
> HX8394 controller, such as the HSD060BHW4 720x1440 TFT LCD panel present
> in the PinePhone Pro. Patch #2 adds the panel driver for this controller
> and finally patch #3 adds an entry for the driver in MAINTAINERS file.
>
> This version doesn't include the DTS changes, since Ondrej mentioned that
> there are still things to sort out before enabling it. The DTS bits will
> be proposed as a follow-up patch series.
>
> This allows for example the Fedora distro to support the PinePhone Pro with
> a DTB provided by the firmware.
>
> This is a v5 of the patch-set that addresses issues pointed out in v4:

I looked over the patches a last time. This driver looks great.
Acks by Krzysztof and Sam are in place.
Patches applied to drm-misc-next!

Yours,
Linus Walleij
