Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4714171FC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 14:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E847F6E1BA;
	Fri, 24 Sep 2021 12:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3998A6E1BA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 12:37:27 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id b67so3855073vkb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 05:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=42I/j7EJUoe1na+qCjbWLO26DRP+d7+Jsq/Q0zLHtDU=;
 b=mkCEY0D6TEZPRRvCRuKj3MJkIt9iWTwC/wsGsNjIEzJNksh39bm3gHkSvZ3lyu+T9J
 sVv4yzAmaFfQLs7Qa07Omh0DZEn4OBj3LKdGXknduQwy1evhBDc5SfHcqUxa+8JgBr8G
 25Gu+gOgQi2yIBAZpwxP2VsRJR1Pa2Ug5n8IqZc3wX/h/jJYfsJAEO9ASBMvs7aR6O/y
 e9sci+e1vwIpY89llNnhvlvns1envsh9RRiq3NRM/EkiusxCh4T1tTgbTFhLEcz3vMPI
 0zPWujGNEAeWQoUOkDpAqekE4SXmDKVbmEr/7/iiZPjG+wWTdl7VihLbUV8sntISFfLZ
 idxg==
X-Gm-Message-State: AOAM533QCQB01nyOJ5pn935lxJvhWdhMME795shXNrHfbiB3c8iMtM3+
 eaaHaBQ5eWjxBewQGsEvMFPAIBAsuSy5lLIPFmU=
X-Google-Smtp-Source: ABdhPJyDLWMp4EQ2iv6EKC6E6I1Rf7GeNbzBrcz8iYtLmWXuBOn5YU+PcZnZqUd4X/n5/jjpEJnGnJ+041+EGAbSq/w=
X-Received: by 2002:a1f:3a4b:: with SMTP id h72mr7384734vka.19.1632487046079; 
 Fri, 24 Sep 2021 05:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <08f73c2aa0d4e580303357dfae107d084d962835.1632486753.git.geert+renesas@glider.be>
In-Reply-To: <08f73c2aa0d4e580303357dfae107d084d962835.1632486753.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Sep 2021 14:37:14 +0200
Message-ID: <CAMuHMdXQ5vv2rxWsd8EGJWufe4UwnvOoiSEXTSDWj7mUDqy+vA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix reg value
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 24, 2021 at 2:35 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> make dtbs_check:
>
>     arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml: bridge@2c: reg:0:0: 45 was expected
>
> According to the datasheet, the I2C address can be either 0x2c or 0x2d,
> depending on the ADDR control input.
>
> Fixes: e3896e6dddf0b821 ("dt-bindings: drm/bridge: Document sn65dsi86 bridge bindings")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Also seen with the in-flight Falcon DSI display output patch:
>
>     arch/arm64/boot/dts/renesas/r8a779a0-falcon.dt.yaml: sn65dsi86@2c: reg:0:0: 45 was expected
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml        | 2 +-

And the email address of this file's maintainer bounces.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
