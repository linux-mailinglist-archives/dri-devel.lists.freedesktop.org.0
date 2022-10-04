Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C75F3EFC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 10:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A82110E2D9;
	Tue,  4 Oct 2022 08:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EB910E2D9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 08:59:06 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id qx23so9328635ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fIJl4IiOeRHaHh1QoEObM4QlmMAVfHee9nuHBfhnVzU=;
 b=ZQ+T6F0KeYd1rXAGaq4pxLHWYpf52ZDDnEygNdrbIpL4s8YBrdQcO7AfkSEGUv0rgs
 PFX0nZ/YZZ/5vJRhcUQ+KCgKq9FzByTKnxWsqzqYCUpn5HPGNhy5wX6BHW/FjjLL2QCy
 HwA1c1OlDZEfrap4fJFg2E2Mw0PCrw0R/BLqEOwvYia3xo6QivtKrEUBbwlHEdoXV8du
 UcZnicgvZAEOIVbuJuUzwSBnx5SdiDi8i1HODdcZWVQztvfcWGdGi2SUkfTPAqwcU7sL
 7lzBpIBghaemabuGvzCLQLHwmMYibGDsJfrB+EmoBaLd94CkVF+boO890RDD1EwpvN7q
 5m7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fIJl4IiOeRHaHh1QoEObM4QlmMAVfHee9nuHBfhnVzU=;
 b=4aPnrlEOwnZEscGDSpKBxE7tTPd6vQiMC1RV6wWAsdO6kAW4xnbgaYfAHrbPaMwckB
 JLmMHLb52h0E8gcXAFdUPrYJuDPX8BXgL99wvs+yEXN6ylov/bXsK5EVKO1xKmbnFe6g
 A2xUFJaweXdTfWgYcPV4eXmeuN4S4ffRaAOvh2AC3FqFBXNGG9OPl+DYAynf/HLmsa0U
 v85mjSJ60+RTMFnF1I8mC3g6tF4xHKFE4lyqk4qFD/eNzdutspH7cQeZ0EIb0CjCzBbz
 Ar32cGF7oPkxpevhAXMMQnMWNyzHVKzmCQUFkNkw/uDFAFawCYPsjdtyhRg8Pm9LLIvz
 GCZQ==
X-Gm-Message-State: ACrzQf3lBgrZiXLccwuNVdCvi5WkWsHWIHYQvkG8gifqM6lmh2PQmuXz
 i0ulht2njmRJ5VToNbeZAhzvgqDn3yteMLi77HCicw==
X-Google-Smtp-Source: AMsMyM50R+yprH9k7KbiVmostQiMsE/qB5tlByDLHsJ+zV6rySTLqnkxwD56v0PwMao+NlnRa0NGkBqpPXx5ZKsHAAI=
X-Received: by 2002:a17:907:7805:b0:780:24fd:c4e8 with SMTP id
 la5-20020a170907780500b0078024fdc4e8mr18694277ejc.78.1664873944675; Tue, 04
 Oct 2022 01:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221004044943.2407781-1-treapking@chromium.org>
In-Reply-To: <20221004044943.2407781-1-treapking@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Oct 2022 10:58:53 +0200
Message-ID: <CAG3jFytkKjuW0frBUf1-MEKgzTnfdZEHcdxTTFoeXmvRJz7Y3w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] drm/bridge: it6505: Power management fixes for
 it6505 bridge
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Allen Chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Hermes Wu <hermes.wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Oct 2022 at 06:49, Pin-yen Lin <treapking@chromium.org> wrote:
>
> This series contains 2 fixes related to it6505 power management.
>
> Changes in v3:
> - Handle the error from extcon_get_state
> - Collect review tag
>
> Changes in v2:
> - Handle the error from pm_runtime_get_sync in it6505_extcon_work
>
> Pin-yen Lin (2):
>   drm/bridge: it6505: Adapt runtime power management framework
>   drm/bridge: it6505: Add pre_enable/post_disable callback
>
>  drivers/gpu/drm/bridge/ite-it6505.c | 58 ++++++++++++++++++++++++-----
>  1 file changed, 48 insertions(+), 10 deletions(-)
>
> --
> 2.38.0.rc1.362.ged0d419d3c-goog
>

Applied to drm-misc-next.
