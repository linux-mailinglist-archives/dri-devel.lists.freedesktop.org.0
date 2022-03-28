Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6498C4E9CAD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 18:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2E210E0E6;
	Mon, 28 Mar 2022 16:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59F210E0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 16:47:05 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id c10so11509103ejs.13
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 09:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=240TDsg9YUtR0a9x8qUKpdyaJpg3b26fnS8FPgo8OlE=;
 b=VNNANou4q1lqBOe6AYHFYWdg0u1p6UkItahtEsA+qoQBTDL0o7MF6Shyl46mNSWA6Z
 W2iyPIh/YOhGBzWLVDG/LYnDEVnCqxrfRPN08ub6+ZsH+UNaSdaV/rnKPiVChW08ziv0
 Ipbbsu9RpBMe0S4fmX5OE9icR2schY6lYsZ+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=240TDsg9YUtR0a9x8qUKpdyaJpg3b26fnS8FPgo8OlE=;
 b=7hevQJndMp/L/KzV6UFkNZmeLVYdat+F0cQ/nLxhLEEmlv0U0skoZkiOW5RX4dtgTS
 F44N71kJzyor20cXgiLdC9/EZkNc0TzWPOwfZwiyOW8FlzDbh2/BkhwkKnpy71AFZWfb
 49xQ9V3PEkBh8CbhAWowu6hJfXdJQjJGSxAcmL9rEsI83jbSALh1lm3ZcvyL8r0gtZ4Y
 +MSsyvaC7E8+1H6ZmFiZ30itDutbqejSL7FX5jfEAxIAg/iDIAUccSwC1d37hw4sCuuW
 AXUNjNDYlyILjcefyLr+Mc/L2tgZhwz6cROebXizSzYq5IUy7l67XBge+38GGfT39lL1
 TL9g==
X-Gm-Message-State: AOAM532pIpNaAelnBMYkUWH2BT/+G6e/RMaXN5e3ygHKYsLERQ/eLSUK
 98OOcFRIv+9OprsADeU0oQyvdiDQv3mMgZQdO+ExOg==
X-Google-Smtp-Source: ABdhPJyEzl7muW1qyQjIhKc2p2Vw4L3CG46U7tmxJtfp1ljwICaarwHUeQ8a1FaAEQ2KAL2HYMBAwohB5WMyE7SUFA8=
X-Received: by 2002:a17:907:60cf:b0:6df:a8e8:3597 with SMTP id
 hv15-20020a17090760cf00b006dfa8e83597mr27889019ejc.111.1648486024366; Mon, 28
 Mar 2022 09:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220308082726.77482-1-jagan@amarulasolutions.com>
In-Reply-To: <20220308082726.77482-1-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 28 Mar 2022 22:16:52 +0530
Message-ID: <CAMty3ZDmBbr7JUWU-Dw=E4wVntCi1Fc9tV4qnn-sNNQMBLb4iA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] Revert "drm/bridge: dw-mipi-dsi: Find the possible
 DSI devices"
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 1:57 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> This reverts commit c206c7faeb3263a7cc7b4de443a3877cd7a5e74b.
>
> In order to avoid any probe ordering issues, the I2C based downstream
> bridge drivers now register and attach the DSI devices at the probe
> instead of doing it on drm_bridge_function.attach().
>
> Examples of those commits are:
>
> commit <6ef7ee48765f> ("drm/bridge: sn65dsi83: Register and attach our
> DSI device at probe")
> commit <d89078c37b10> ("drm/bridge: lt8912b: Register and attach our DSI
> device at probe")
> commit <864c49a31d6b> ("drm/bridge: adv7511: Register and attach our DSI
> device at probe")
>
> dw-mipi-dsi has panel or bridge finding code based on previous downstream
> bridges, so revert the same and make the panel or bridge funding in host
> attach as before.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3, v2:
> - none

Gentle Ping on this series?

Jagan.
