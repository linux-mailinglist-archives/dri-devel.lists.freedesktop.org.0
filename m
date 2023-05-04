Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D94436F731D
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 21:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDFE10E119;
	Thu,  4 May 2023 19:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1EF10E119
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 19:16:15 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-24e4f674356so853633a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 May 2023 12:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683227775; x=1685819775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z7gJY1h0XBMe9/gdwAJZJNx77lWxRnFXs8IrgX7nH7s=;
 b=rLcOFLD2Gs9oY3cLY2OQBZ6BZCbf5uZ57oezBYG7V3ffGq7/zO+6S6xaY6Ka9eVgsn
 /PEy/gVbnSsLZUsea96GhACjAyRCQ30+NTrioOrj6s9jRGg2nUX3OPPIVxIGeEnyFeDD
 uvjJ/1eHgBJQwwnImUs6I5JzZVF92eW9g7syBk/es/jWRGgln0S0H+cQHkpY2A68s+ca
 5Ne1IsGP5pCIv1SfhviocYhKmThQF1Z9831RHzJGAMC5hHe55uxZK1eQaPMbFEx7z/D5
 03RrZcFXjs2ZfEVB9sVRHwu04KAjR72IvhJ4yzBQRaDm7Xx3FwEgMaWiIa+VsjR5fO1i
 WyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683227775; x=1685819775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7gJY1h0XBMe9/gdwAJZJNx77lWxRnFXs8IrgX7nH7s=;
 b=LVAPgBR6fG5pAeYG7U20irKr2xlr+LU6W0Ot0PATMmk1WP9N7hQopSxl6YIKj9MlRK
 RY2v/RRSelEUPncol6QUIX8ERA8b5X0lYJCccpmKKXl4YX7f3zddrEI+Z0QPrSCVxTGX
 Awca2H44YhYXHJ89c3m+mAcfnOT9KvpLFrnx7I4VMs6zCewSuvqiw1ttLeMtZmNuN22y
 LIdioPIsDYNXdx9KP4pgHCNRBCkyhiXfnYI2ErVP9ejJiv6DZWJTvqWrfZesMmzWazzp
 w8HJcF10dRyxWS8kAUhTJDljG4Z9jodeXkr8oe1TlhiX7HlaX8nIRvoqln6vEE2NiexD
 Bpsg==
X-Gm-Message-State: AC+VfDwcT/ue7PpxpWQ4UHDGCFIBGqPVcsd7fkw2P9sf01CIjtHpKmjG
 tt//84PQiztT2yWWQW7TweN8knlBDvs6WOlX/kg=
X-Google-Smtp-Source: ACHHUZ72F4gGSzEbsjDwIhyhYoMZizj5iYmbC4EJEk5PyUSpGBXtSdR4H97ILckfw14LWmKifnHN/XCb09MeAQWUNbw=
X-Received: by 2002:a17:90b:114:b0:24b:66fe:6b4b with SMTP id
 p20-20020a17090b011400b0024b66fe6b4bmr3038573pjz.47.1683227774810; Thu, 04
 May 2023 12:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221216210742.3233382-1-l.stach@pengutronix.de>
 <20221216210742.3233382-4-l.stach@pengutronix.de>
 <20230307125821.GA722857@g0hl1n.net>
In-Reply-To: <20230307125821.GA722857@g0hl1n.net>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 4 May 2023 14:16:03 -0500
Message-ID: <CAHCN7xLQ1PzOGtFqwpTTrkKn3cUNz-hXpt5hADWXXLTjfFzbdQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
To: Richard Leitner <richard.leitner@linux.dev>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, Robert Foss <robert.foss@linaro.org>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 7, 2023 at 7:07=E2=80=AFAM Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> Hi Lucas,
>
> hope I got the latest version of this series. If not, please feel free
> to point me to the correct one.
>
> On Fri, Dec 16, 2022 at 10:07:42PM +0100, Lucas Stach wrote:
> > This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has=
 a
> > full timing generator and can switch between different video sources. O=
n
> > the i.MX8MP however the only supported source is the LCDIF. The block
> > just needs to be powered up and told about the polarity of the video
> > sync signals to act in bypass mode.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Tested-by: Marek Vasut <marex@denx.de>
>
> I've successfully tested this patch on our custom i.MX8MP board. The
> test case was basically "cat /dev/urandom > /dev/fb1" with a 800x480
> HDMI display.
>
> Therefore please feel free to add:
>
> Tested-by: Richard Leitner <richard.leitner@skidata.com>
>

Lucas,

Is there going to be a subsequent rev of this series?  It seems to be
stuck somewhere without any movement.

thanks

adam
> > ---
> >  drivers/gpu/drm/bridge/imx/Kconfig           |   7 +
> >  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
> >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 202 +++++++++++++++++++
> >  3 files changed, 210 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> >
