Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE43C4FBD3D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BA510F074;
	Mon, 11 Apr 2022 13:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79AB10F074
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:35:48 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id 141so1012836qkf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6S8S+a0YX9xrAM7ZLPpu+Eb5jo+Pr1Yp9P1ijuzXncc=;
 b=bCpErw4dSh4TxlxDG/yS/ySIkzLNhC5cXeFdHWJCGGex56FNtD9dgiPPStVMzAxm2Y
 DHteAwvDBUjmfHfmhdcBkGqFaG23dGupRyXPFvEVAGoD5aDDOImFyzrQyKDuyLJOskEZ
 72jqeIEJjbRMlZODazYVFTAbLP3AhgYcAbAdvXKXbPL5dqYrPcjZnBKIyaaS3N3Q1DM9
 IsiunPYV9HnWitw/l15jdnGR/pXHtgNca9AXEEfeRkHlIZM/CpmI9CSMiCWxeP90V4p8
 IkdrWzrVjNHfs74D+f6ob/MXxXYCegAMYJOhSYoA/8xsZVq8zNuO2EW8U5LPvzk7QUXi
 E3dg==
X-Gm-Message-State: AOAM533DaJ3vQuQYW2rpyrKuQQParfRvb/g4erHVLP+SUS481pZxAcrR
 Nl2zHAjDbqmOx2myNZP4hKhRh+fM3wi9dw==
X-Google-Smtp-Source: ABdhPJz0jf7Wy6EbhznprtEoReBNd/cjwCKdoqtKRemIWG1eH4dDgpDRsZy23CVoniURlZVRlVpzbw==
X-Received: by 2002:a05:620a:13f9:b0:69a:17b:7a0a with SMTP id
 h25-20020a05620a13f900b0069a017b7a0amr14256147qkl.67.1649684147579; 
 Mon, 11 Apr 2022 06:35:47 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 k189-20020a3788c6000000b0069c10860b10sm3039398qkd.107.2022.04.11.06.35.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 06:35:47 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-2db2add4516so165678507b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:35:47 -0700 (PDT)
X-Received: by 2002:a0d:e743:0:b0:2eb:3106:9b32 with SMTP id
 q64-20020a0de743000000b002eb31069b32mr26595858ywe.512.1649684146995; Mon, 11
 Apr 2022 06:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220406172956.3953-1-wens@kernel.org>
 <20220406172956.3953-3-wens@kernel.org>
In-Reply-To: <20220406172956.3953-3-wens@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Apr 2022 15:35:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMc35MrWwbDXvsRNx9qSRf1bACNrhsGpeFcLCETsL4dw@mail.gmail.com>
Message-ID: <CAMuHMdUMc35MrWwbDXvsRNx9qSRf1bACNrhsGpeFcLCETsL4dw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: display: ssd1307fb: Add entry for
 SINO WEALTH SH1106
To: Chen-Yu Tsai <wens@kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chen-Yu,

On Wed, Apr 6, 2022 at 10:13 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> The SINO WEALTH SH1106 is an OLED display driver that is somewhat
> compatible with the SSD1306. It supports a slightly wider display,
> at 132 instead of 128 pixels. The basic commands are the same, but
> the SH1106 doesn't support the horizontal or vertical address modes.
>
> Add a compatible string for it.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -13,6 +13,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - sinowealth,sh1106-i2c

Please don't introduce new compatible values including the bus type.
There is no need for that, and this will only lead to more deprecated
compatible values soon...

Oops, this is already commit 97a40c23cda5d64a ("dt-bindings:
display: ssd1307fb: Add entry for SINO WEALTH SH1106") in
drm-misc/for-linux-next...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
