Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F59609C1D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 10:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4625E10E2D2;
	Mon, 24 Oct 2022 08:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F68710E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 08:11:07 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id e18so28229204edj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 01:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F0c713oCt9k4k6/+uY2uM123jIigsSx0BNjtESa37L8=;
 b=fM18OWIp12aMWehgSQYFRFmpa7L+2WOuR3JJPfsWwM8qbqkMEJASujJMMEo4p0/H5C
 Ju0vOpraZuqjINV7dUKIKl+o9UPdCzUKzPxVirGwJSXn7srJgyPVYAV93i0tQWv8ohaL
 6qGtw3QZkaKJvVPe/26GQPuUFgpK4HZhb4PqGxrT4j2DG7426bTgIeRPPlc/0Lmibxb0
 VnuU8MlzCM9+Im/VEDOdGvYOzMdK+d63Q/CFvBdzHM4oqBXugTjv8Y4n3KDbNLY2ywoF
 3PhFO/Y9RNzxDD8lO0fFscdEnUzQCkpDK4QcrfBn4DawxCE0EApN9ZV6z6w60Yg9vMlV
 eKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F0c713oCt9k4k6/+uY2uM123jIigsSx0BNjtESa37L8=;
 b=hzpIfpJ+7XpmdtH+y39Cxo1h4IrW6dybiS96AdZloiaKf50FIDy65GsRUqJLIVKAw8
 k8LcByGNp4Rg5aTf/f+EXAvilcyPFrNhYH3v4JPKbYhcrtycPm+gUjcOm46qsf6mL+/5
 Jz31P7BXBVqoz8LynHymI46pw8+61eLN+ta+URw3nTYLkVQSdCuSoAseyR9lVoWHUADH
 ESrwOHJajbhl1q7nP9of3TRG8wpPffTxUQf0L6t16gHbKiEqvPko0Gf9Rka0qtXYGzIp
 5Lk7eIRmGBroID8x7W0YZb5aK/ChyBXRPOE88ioV8oFzz+LAjrkPg0V/yaOdEFiD1Z3v
 0VhQ==
X-Gm-Message-State: ACrzQf0tBDTLY3xDoDUEpBELfYOzEUZ+ocqfr1Z5AuV1rBTzXrw9M3G9
 d9/yblV5p0w3joiCjQ1jxTA8/xyVIUnJcP2uefJSuA==
X-Google-Smtp-Source: AMsMyM4Do78psp3kB2kgopIMTwbjzFM6ZbxCwerNjX0u3iCmgE06NkkT74Ndn4Y4JMEeUX4twWV0BterbnP1x5GKtQg=
X-Received: by 2002:a17:906:7193:b0:78d:b87e:6aa5 with SMTP id
 h19-20020a170906719300b0078db87e6aa5mr26617842ejk.580.1666599065645; Mon, 24
 Oct 2022 01:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221013110411.1674359-1-treapking@chromium.org>
In-Reply-To: <20221013110411.1674359-1-treapking@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 24 Oct 2022 10:10:54 +0200
Message-ID: <CAG3jFyv_-5rg2youVtKg7WGvvc5PMqaJMCmidMwmXf6Sgucm3g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Clean up it6505 driver and improve synchronization
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Oct 2022 at 13:04, Pin-yen Lin <treapking@chromium.org> wrote:
>
> The main purpose of this series is to improve the synchronizations of
> it6505 driver. The first two patches are required for the third one, but
> they alone can be clean ups to the driver.
>
> Changes in v2:
> - Remove redundant spaces in it6505_detect
> - Read sink count in it6505_irq_hpd
> - Add the empty line back
>
> Pin-yen Lin (3):
>   drm/bridge: it6505: Initialize AUX channel in it6505_i2c_probe
>   drm/bridge: it6505: Setup links in it6505_irq_hpd
>   drm/bridge: it6505: Improve synchronization between extcon subsystem
>
>  drivers/gpu/drm/bridge/ite-it6505.c | 106 +++++++++++++---------------
>  1 file changed, 51 insertions(+), 55 deletions(-)
>
> --
> 2.38.0.rc1.362.ged0d419d3c-goog
>

Applied to drm-misc-next.
