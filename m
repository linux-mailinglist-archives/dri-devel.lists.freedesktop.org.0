Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F6B45CD0B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 20:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F2D6E0F3;
	Wed, 24 Nov 2021 19:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9B46E0F3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 19:17:03 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id e27so2288549vkd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 11:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ggEL9HUUpm+JbkKDLEjpku9ZfkI+413TqoZLSa6ibks=;
 b=mcA5PAUKbEWRimVWCrK5Zc1ePyEWUvQyUbkim4OI+Ysv6+wcUIgRCWoIYptRPoZwZS
 QdmbYTP56FrYu5szsXxS/zqUvwh4BJLr8rM2zkxchJh0mkPjabMexk1GTJYVTXCjWzRc
 nOzl6X+SAo44cLFLgLH62z3WypN2QCxeO82zORcscZmqBoyzycibCW5KfGJ/pbzmq/HD
 0r9JBUlXaUkCMFqDQs7merpmlEETUfoCrIWgBxfN4atCrgNc61zqnWCkhwyjFwEpdfFc
 d9WPYEGaGwyilqF5/6FHRpWErnStxB7bBaD7I+EMhyQSXfM3VUAerLUGsBuh2Eq47WKT
 dQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ggEL9HUUpm+JbkKDLEjpku9ZfkI+413TqoZLSa6ibks=;
 b=lG91Xpxb0n50aMROuaFCto7PkT+XP9JXWL31Wl+mdBWQR17jLssYY8xgbQUn1J6Azg
 DQp1S5FzyZjIXbBSWzmXn15NbkY4hSxsqVrRzyJavhhiWTPyMg3ETPVU+AIt9KDLSV42
 EIjAEebWe+uBCkDp1qaVRN5hoj2nA2PMyfmLffFRspVglkNqF/nsp8OpzDwixj6YQk7V
 Sn2yW4ET9zam1aDzAOTVp0QN9H54OpEUYY2HeLWO095EeXaYis2BjJRXOPOKEyBMytjD
 I8Ojy0a5XqwqQIDk/YmNl8tgFWAdxrriOZRIU4Xsq5UlcmwKa8DGrA1LtsgWZXWfid7P
 0jzQ==
X-Gm-Message-State: AOAM531BfcTXb0kXsl+pRoVOARpGL6qRjNHwz9xmIYOwlYXHPBBINFY+
 Dh1giEQKL+kb4aMRQbrOYLS43xwOTTxczCu8FnI=
X-Google-Smtp-Source: ABdhPJzzyMSVlilRU7Hm7IxeZfRV28vGA+3VsvN5ZAzUeV3DyzOEvSPetk/tin/1U79iBQKeiKTDCXRWjvAtmYNHb7I=
X-Received: by 2002:a1f:2591:: with SMTP id l139mr31963933vkl.5.1637781422283; 
 Wed, 24 Nov 2021 11:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20211124172553.519309-1-jagan@amarulasolutions.com>
In-Reply-To: <20211124172553.519309-1-jagan@amarulasolutions.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 24 Nov 2021 16:16:51 -0300
Message-ID: <CAOMZO5C9LhoKKW_TapKtqgAEq2h3dqe97dU9-11ezs+Cx+zr3g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Add TI DLPC3433 bindings
To: Jagan Teki <jagan@amarulasolutions.com>
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
 <devicetree@vger.kernel.org>, Christopher Vollo <chris@renewoutreach.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On Wed, Nov 24, 2021 at 2:26 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> TI DLPC3433 is a MIPI DSI based display controller bridge
> for processing high resolution DMD based projectors.
>
> It has a flexible configuration of MIPI DSI signal input
> produces RGB565, RGB666, RGB888 output format with maximum
> of 720p resolution in 60 and 120 Hz refresh rates.
>
> Add dt-bingings for it.
>
> Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../bindings/display/bridge/ti,dlpc3433.yaml  | 112 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +

Shouldn't the MAINTAINERS change be part of patch 2/2 instead?
