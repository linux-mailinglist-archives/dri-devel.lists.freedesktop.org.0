Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E23C64DA8A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 12:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0532D10E535;
	Thu, 15 Dec 2022 11:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F399B10E52D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 11:39:59 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id q186so5030154oia.9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VnmODK4SGL6uxq3J63LFoLUmm+Foh4kGZyItA+1wS2c=;
 b=JdV/o7xGoVvKiWMhcWyCGkQaWeETwNRmNCcjVNgydmXWDt7oxsR6FYU2KfEMZE7qsx
 CbZktnYlQ4wRJNzOW/Ch40iBHAQ3DLeLHddvI6Ar2HWe4FT3VojgjaeIRnnYlSjUEh5k
 yWinetfTzcG1Pal/IuZyXB+OryuT29et9zTufCefI2yI4HRQQ/kvXllbFIfAnGKsgKe7
 rZA8b5gDhIFhybFck04QGE4PduBvPuakNLbgtFRmFhICrUuWt+riA/6lQeOKaDqaGMtF
 eQs+CI3LQufsmuGNwtw2n5hTfp4awhQzE67XFKV/k9D4faODs+AIbYIkxbG/mV9OuyVb
 R1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VnmODK4SGL6uxq3J63LFoLUmm+Foh4kGZyItA+1wS2c=;
 b=h9Nk50XEH5vvI16+P7IpQ8lyPhKwRnBslu82EKNrtCE8jNbnlA+CGzVpboezwuWztq
 bIRoFXQh73gn/BRGcEgeTBJTy3kumwFrVDYiW7NZMITZfwGlKCPQMAOvZ6rNK/iHJSdg
 NoHW1pboWmIYFpyg5cisPPnPcJLpftMzIBM7AeEq9TOmSQ4Nv9NFBmioUm7qeqaXdStt
 +8k+fAL3SVEV20YgdUZ048Z6GFckUZh+ZPeXcrgStrdmcYboZzcgbGYPGzgBkbHZhAuG
 apAYMTBHu+8I5coaqoVDByULX6ZbxeACFOaX7L+s9Ka2iLHWbaOOeIBoyIiUkMeyB/kU
 KAfw==
X-Gm-Message-State: ANoB5pnxw5bWyfycGmax/PtI4GILAorpDC9UJk7CfwXjMbhf2rnRsNv3
 aM8vKSty0jnoAZ8gDpGlJrowALw7HZ3+d58SmgaUfA==
X-Google-Smtp-Source: AA0mqf4vMq3wsumwJ9cIOvn0MpOlVRGNwIA8MHbfI4mHfpzn/Ht/89T4ZdD7VU7zukH8n7Pc76DeCxaAYoxLo2pDh+8=
X-Received: by 2002:aca:1c07:0:b0:359:ef86:2f4f with SMTP id
 c7-20020aca1c07000000b00359ef862f4fmr311355oic.14.1671104399198; Thu, 15 Dec
 2022 03:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <20221214125907.376148-19-jagan@amarulasolutions.com>
 <e0556056-aa8c-d8fe-a22f-701b8f44936a@kontron.de>
In-Reply-To: <e0556056-aa8c-d8fe-a22f-701b8f44936a@kontron.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Dec 2022 12:39:48 +0100
Message-ID: <CAG3jFyshueF5y9zjiRr-=k8a0AS_mhBorhB1AapzFbMwTnAahQ@mail.gmail.com>
Subject: Re: [PATCH v10 18/18] drm: bridge: samsung-dsim: Add i.MX8M Plus
 support
To: Frieder Schrempf <frieder.schrempf@kontron.de>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Dec 2022 at 10:23, Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 14.12.22 13:59, Jagan Teki wrote:
> > From: Marek Vasut <marex@denx.de>
> >
> > Add extras to support i.MX8M Plus. The main change is the removal of
> > HS/VS/DE signal inversion in the LCDIFv3-DSIM glue logic, otherwise
> > the implementation of this IP in i.MX8M Plus is very much compatible
> > with the i.MX8M Mini/Nano one.
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Acked-by: Robert Foss <robert.foss@linaro.org>
