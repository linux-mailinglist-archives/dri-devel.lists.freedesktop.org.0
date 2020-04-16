Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8431AD0EC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 22:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266A66EB5A;
	Thu, 16 Apr 2020 20:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A806EB5A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 20:15:31 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id p19so2753640qve.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 13:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RrhoCocMui3bsFc5qkdYNErfeCVARryDRP7TYadbG5M=;
 b=QfKW6F7xCXl6+vxdlzAiOL5ivPMy1SHP4U5CM8CVeegJchb5+KDPwsbTufj449g+u4
 SD8E5bdY6BjaDM0KbK7iKkgwtLkedOn6so4ibg1BTWRdPCngH3jq4GS1rAXU0x3tqAW+
 +Z+52kZuoEnBLuNVBNWfPaISsumvknew1jf03TvmuKfwG9QZs3ABAS2cvd1he0XhnLDQ
 aeKzpcLxXOlZl4GkR6FTBIMSIghnearpfUmTipNkoasRCwGXVJ76zE+VYDzzcJFVV3tu
 IXG/BpW9slI84n6+qwgUnA2Ga9rgXPyqvF4yPDwBPGswDWoEGlWhip+xHunJQ8F1C6C2
 YMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RrhoCocMui3bsFc5qkdYNErfeCVARryDRP7TYadbG5M=;
 b=fXrvNlg4MPcisYdGw0lDOnTZnilbibI0GvxW1CG+z/UZGvQsJe/+IZucifctg299l/
 PK5EteNGKw9tpkZycgEGNDU2BtdxSugbfNu3fHubXtq6TGiectgtLQR7/JIA+jIYkfI9
 /Qc96RbSNt/D7BTGiejnXT4w8U9y4+XFKFuGh8R4y4DzRB1/DWH4T5UGGblG4nNBgHS1
 wI4psfw8k42o3NfwyhFf3qdqpcjAE2u5y01B6bIMu1W9e7Iy0PiOhJ0QPJ9H1jBv73wa
 90vXMqp7E4q5IUHg3zLYOkyJs+QRrLVeL2CqqHlg0pztU8yvwI32WsVKAuCbAJjTDm20
 a/Wg==
X-Gm-Message-State: AGi0PuZhfSbKJzfcQKwHJi/363hNYpcWoPsudDgV8mPtlEqRy/aqonTG
 FhZiyhxtzLJ8++HYKQ7Q+cHN3FWS4D9VxlrKLNg=
X-Google-Smtp-Source: APiQypLEw9l7W2hSliB15jHFogvAHufSRGn0ZYH76LQ8VoeRoID9myxCgGr4Pn9PvD87gHrPUOj8sgZxasNifp8qNh4=
X-Received: by 2002:a0c:f748:: with SMTP id e8mr11834286qvo.237.1587068130311; 
 Thu, 16 Apr 2020 13:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200414151955.311949-1-adrian.ratiu@collabora.com>
 <20200414151955.311949-2-adrian.ratiu@collabora.com>
 <CAFqH_52eKB4jtmn5e4HQubv8ijOPqDqncp1dRGahhU3NOorJMQ@mail.gmail.com>
 <87lfmvjmt5.fsf@collabora.com>
In-Reply-To: <87lfmvjmt5.fsf@collabora.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 16 Apr 2020 22:15:19 +0200
Message-ID: <CAFqH_513KB+En_xbpXSBG6Q38kYxWCgw0KO3NVxCb6fqHDaKBA@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm: bridge: dw_mipi_dsi: add initial regmap
 infrastructure
To: Adrian Ratiu <adrian.ratiu@collabora.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Adrian Pop <pop.adrian61@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adrian,

[snip]

> >>
> >> +static void dw_mipi_dsi_get_hw_version(struct dw_mipi_dsi
> >> *dsi) +{ +       regmap_read(dsi->regs, DSI_VERSION,
> >> &dsi->hw_version); +       dsi->hw_version &= VERSION; +
> >> if (!dsi->hw_version) +               dev_err(dsi->dev, "Failed
> >> to read DSI hw version register\n");
> >
> > Is this an error that should be ignored? If you can't get the HW
> > version, probably, there is something wrong with your hardware
> > so, don't you need to return an error?
> >
>
> After thinking a bit more about it, that error should be a
> warning.
>
> I added it because in some cases (for eg. if the peripheral clock
> is disabled) the reads can return 0 which is obviously an invalid
> version and the bridge will error in the next step when not
> finding a layout.
>

If you'll error anyway, why wait? IIUC at this point the clock *must*
be enabled, and if not, something is wrong with the driver, I don't
see any advantage on delay the error. do you have a use case where
this is called and peripheral clock disabled?

> So I'll make this a warning in v7 and explicitely mention that
> reads version == 0 can be caused by a disabled pclk.
>

-- Enric
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
