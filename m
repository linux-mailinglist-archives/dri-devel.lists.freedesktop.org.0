Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CBB51458B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 11:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587DC10E936;
	Fri, 29 Apr 2022 09:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA2910F043
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 09:40:13 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id k27so8415910edk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 02:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wQ2UALvuYRSPgu0V8AOck6B5HmYCenVgKB78DwZPTwM=;
 b=P7M2zfxVjN+5Wd8MumYafWJIMBGQ0Jc6nQZZS4Ge63LJncxEXgHQ36SOaRkLum/PnK
 wrmfJI0E8VHoj6N1xEV7OwDo7oqIJkie9FcMbcneokGzkOxgiAXn6VvkoWAz7NVE5JjO
 S+NtNVIsxxLkv4KkJntQteu+zi8lQ2CZLJkLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wQ2UALvuYRSPgu0V8AOck6B5HmYCenVgKB78DwZPTwM=;
 b=jMJ+5JnbmZisODdX9K8H75lnuuRAPrCV9Mb2GrZpGoZrOvghfMM1Sr5KL5nqzkiXn/
 UQ64vJxna+wICCRoMLgjd8mSImQlvKlED1bIcE0adAuSG72dmTy9h2V8j+Ope3XSHiOn
 /xvJYD5MCdrwBrEB+1o11lAiayVnPFVaiKoYyoZQHTMkxjwFzDRMXZPyZmBrcs8iqHfG
 E18SZkx2uzlBvg+QZlSnh6BvCnV9RfD6WfJ6N/uvXvt0jX3umllm5Hb2lURQhgoWa0oe
 Ps1/aSf3zT8dmGoaQQlg9piOAJ48N2G8SNA9A+yAqy5LNQem19P6O6AtEDWuFa9yD1TF
 WzIA==
X-Gm-Message-State: AOAM533SA5GdwVquTKgbVV7E//5fl1FLi7bg5F5SMagzpDTWIJgZFT7+
 nhFzX2yfGhIhVYxYcqVtNfu+qLHSH/GH2jcrqR2+bg==
X-Google-Smtp-Source: ABdhPJwFHiC8+9gGoQCOlqBd9O/JCWXoLXnjI9sNzpOY4Sn0Ab0tEfaKdoFaOZoZ0O20swi8/cgfutmRm3BLt3bIscU=
X-Received: by 2002:a05:6402:2920:b0:425:d7c7:41f with SMTP id
 ee32-20020a056402292000b00425d7c7041fmr31226896edb.370.1651225211659; Fri, 29
 Apr 2022 02:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
 <20220408162108.184583-11-jagan@amarulasolutions.com>
 <YlMeEqhkQ6HuCKFE@pendragon.ideasonboard.com>
In-Reply-To: <YlMeEqhkQ6HuCKFE@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 29 Apr 2022 15:10:00 +0530
Message-ID: <CAMty3ZDg9chHXv1ZBw86TePxFFFoobMGffFG1gN9btnfkUb5AQ@mail.gmail.com>
Subject: Re: [PATCH 10/11] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Sun, Apr 10, 2022 at 11:42 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jagan,
>
> Thank you for the patch.
>
> On Fri, Apr 08, 2022 at 09:51:07PM +0530, Jagan Teki wrote:
> > Samsung MIPI DSIM bridge can also be found in i.MX8MM/i.MX8MN SoC.
> >
> > Add dt-bingings for it.
> >
> > v1:
> > * new patch
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> > index be377786e8cd..5133d4d39190 100644
> > --- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> > +++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> > @@ -7,6 +7,7 @@ Required properties:
>
> May I try and ask you to convert the DT bindings to YAML as part of this
> series ? :-)

I thought the same and I did it for RFC
https://patchwork.kernel.org/project/dri-devel/patch/20210704090230.26489-9-jagan@amarulasolutions.com/

But, I'm thinking of sending a separate patch series for updating yaml
as the existing binding is old that it has some properties need to
fix.

Let me know if you are okay or not for it?

>
> >               "samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
> >               "samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
> >               "samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
> > +             "fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
>
> Should we have two different compatible strings for i.MX8MM and i.MX8MN
> ?

Yes, MN is fallback to MM. I will update in next series or add it as
part of yaml conversion series.

Thanks,
Jagan.
