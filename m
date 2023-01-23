Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A7677B4F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5335A10E482;
	Mon, 23 Jan 2023 12:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB3B10E482
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:43:59 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id c124so14505517ybb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 04:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xm1c4o5Qws8Ruu+DZEzGakbPQg7gR3fqPXnzIHM18Ic=;
 b=gd1X0bgNFwzVjEV9KLuK5vYNVLNIocazpdbZ8klm6a8wgWdRQ8T7AzuOGkwaRdk/uO
 mq7wT6qhBfYLzFqtV92OhtRE4kKo5LumBL6ZLbuZKZCxnMAk5MagkYbqgBRIISM11g9O
 2NEufEOLjwW3ufX0V/qtCkLCkg6LSW8AL3n7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xm1c4o5Qws8Ruu+DZEzGakbPQg7gR3fqPXnzIHM18Ic=;
 b=ve7Wf29BwJGev49Xe1akW8eX6dEXfRk+tlfGysrKG4WdjN79pHRH+5kIgywcRPP7Nd
 6ShTIVAIFt2D2RiL62M6rC6+oGssHIRbF5oaaXtL0QSIGbxw63cM6aSPflMSyspMUBDi
 LfMVY+tCAohYxMHNzWFppsvomtuK0Ci2dC4mZlyWjWh50xvYe3TQo2NVEJTae0cPotsv
 pFD3QMXRSZCVmdpqQRCAjhXcaB5p/TCSMUjuJS25QrxkJrR+ziHqIpyT7K7NdLEOJ7pc
 tbRH+wTH769l5mo7GYNOfYyFYE1fZbprw/8CJiHhdFz6dwHGNooUjV62eVl4pXMfRImi
 D+ag==
X-Gm-Message-State: AFqh2kp/tC+PPQpB++mQRXt5GuRxKna00mD66rPpdnlQDIVDo1SVu38p
 1xpq10qzrQTk4kLnoqjj0jg95NChSQj2IjZNFJf1rg==
X-Google-Smtp-Source: AMrXdXuh1Rh81U9xnljENDm/W7joPbbVUTyssB+1n88rC1Tk94ZPV/ASJaEyEgQLq6rEWGfqxTTMXsE1SwMyV991K/E=
X-Received: by 2002:a25:bd54:0:b0:7d3:851c:e744 with SMTP id
 p20-20020a25bd54000000b007d3851ce744mr2967367ybm.84.1674477839174; Mon, 23
 Jan 2023 04:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
 <20230123122319.261341-18-jagan@amarulasolutions.com>
 <7d3d2ff3-961f-55e8-e36a-68a7304bd205@kontron.de>
In-Reply-To: <7d3d2ff3-961f-55e8-e36a-68a7304bd205@kontron.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 23 Jan 2023 18:13:47 +0530
Message-ID: <CAMty3ZDiM1UF98Ls-Ose5iyf8T0iToA=BbCQ3k4LtW4B_J9ZTw@mail.gmail.com>
Subject: Re: [PATCH v11 17/18] dt-bindings: display: exynos: dsim: Add NXP
 i.MX8M Plus support
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
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 6:08 PM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 23.01.23 13:23, Jagan Teki wrote:
> > Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.
> >
> > Add dt-bingings for it.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v11:
> > - collect ACK from Rob
>
> Tag is missing

Ohh, I think I will resend the series again. with RESEND prefix of the
same version.

Jagan.
