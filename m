Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ED58110E8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 13:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B38A10E278;
	Wed, 13 Dec 2023 12:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85E810E278
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 12:18:46 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-dbcd4637b05so297147276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 04:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702469926; x=1703074726;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VWh2TAmXbh0nz9apU3tkS8M7aheQ9d8T7G1VI3vxO7M=;
 b=LS0Df5W6lYBc2UPztX8WPWjVgc4xWC/TtQ6ibKjlVGCd5fKBM/T/mhggNZAWd3Gwbk
 IbahvYDoASnSRbhzSU6tsGQzaRJhcKx62TvzWbdqLByW/++LFj4bga3UpcYzvLoaeMJI
 8ecdNVjU9NXz0cHl8gJw3Md0UiJxZPQndWjNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702469926; x=1703074726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VWh2TAmXbh0nz9apU3tkS8M7aheQ9d8T7G1VI3vxO7M=;
 b=FQU/NfDbKE1izvdPUit/vF8mYY4Ui7kjytFjj4eZBDRj+ZoL8HCNDTAw4uVJQJajHW
 1uEius5zt8kajqwumYNvvrx5VBFCJFbFmJn1kIfazkmw9WNgIPzFPV/s6QDHULn1QPGJ
 XuKzLu2eth+osLQodGrYAuHHis+p8YwuFBcYBx1xvJGJXJRTxZ5azLQEZNXoc6A7IrO7
 b/GeO5yOvjAP/LX9SNrV2rNXJ8RzPfHYpj/yrEjPC+xdO0zoH11VN7bjcvyKl5Y4Pzw5
 gX5bpgXcn/+j4PKecvkU5I5nRiy7xNRWa1vQqRtydk4vbFK6NdIFAIrK0T0cQl+xDWWN
 m+3g==
X-Gm-Message-State: AOJu0Yw8EbB+Hg6C4V1iAHZbmDpGkLxWvsQPJi8qt00CoqaOeKmuaX3Y
 0A52aKR9LUfmz4xvaX4dEo0hwbZCcCTzt4bse7VaNg==
X-Google-Smtp-Source: AGHT+IHRSVC8g3B8lYtUT1BmmUNibAhdEKjzXIv4l2Nn0+pVfN5TKMdrtjmbetU3VgJeCkdzdphWTs7NgCfnhTuirBk=
X-Received: by 2002:a25:2e04:0:b0:dbc:d342:4e77 with SMTP id
 u4-20020a252e04000000b00dbcd3424e77mr250667ybu.92.1702469925813; Wed, 13 Dec
 2023 04:18:45 -0800 (PST)
MIME-Version: 1.0
References: <20231207141723.108004-1-dario.binacchi@amarulasolutions.com>
 <170228617622.2409693.12899768447819855539.b4-ty@linaro.org>
In-Reply-To: <170228617622.2409693.12899768447819855539.b4-ty@linaro.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 13 Dec 2023 13:18:34 +0100
Message-ID: <CABGWkvp+40oCpajZKH8GDJq6qTD1g_+sVrcxHv6yHAxk4szXiw@mail.gmail.com>
Subject: Re: (subset) [PATCH v5 00/10] Add displays support for bsh-smm-s2/pro
 boards
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com,
 Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Mon, Dec 11, 2023 at 10:16=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On Thu, 07 Dec 2023 15:16:29 +0100, Dario Binacchi wrote:
> > The series adds drivers for the displays used by bsh-smm-s2/pro boards.
> > This required applying some patches to the samsung-dsim driver and the
> > drm_bridge.c module.
> >
> > Changes in v5:
> > - Replace a 'return ret' with a 'goto fail' in the r63353_panel_activat=
e()
> > - Add 'Reviewed-by' tag of Krzysztof Kozlowski
> >
> > [...]
>
> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (=
drm-misc-next)
>
> [06/10] drm/panel: Add Synaptics R63353 panel driver
>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D2e87bad7cd=
339882cf26b7101a1c87dab71962c9
> [07/10] dt-bindings: display: panel: Add Ilitek ili9805 panel controller
>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D549240c98e=
50207244bc1ac182622b8daba89a89
> [08/10] drm/panel: Add Ilitek ILI9805 panel driver
>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Dedbf1d506e=
be8c0857c406bd5d5b81d46ffd8437
> [09/10] drm/panel: ilitek-ili9805: add support for Tianma TM041XDHG01 pan=
el
>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Db1fcb7ee37=
07290466b2cc4956325fb91f09f13b
>
> --
> Neil
>

I think you forgot the patch:
[05/10] dt-bindings: display: panel: Add synaptics r63353 panel controller

I received an email complaining about the lack of documentation for
the Synaptics panel.

Thanks and regards,
Dario

--

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
