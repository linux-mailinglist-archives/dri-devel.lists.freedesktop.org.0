Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037765ADB82
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 00:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EE110E48F;
	Mon,  5 Sep 2022 22:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FCD10E48F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 22:49:48 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id q3so9467580pjg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 15:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=Nz+uqA7e4/P8W1+vztFIrzinPtJHEHUsBZrInKc0qlM=;
 b=QV/OF44k3joZDZETl0+ZlAcG808nTpQ+6yaZoVIx1EasnMTt4l9JtEqbk6ylV1sjPH
 CpsCnzKXD1yaRjJY8yjGFM/Rgnq9yiszyTc8TCHLEugHFhpgglTtFg/61iYR6lNKhfNX
 n+f8CJcsIFbu92wir0N7hH/bTYw1QemkS4mo8z9i7RazUS8WbaVUlDCuaya5GJBZu9IE
 QvA+bSBWFp0EO1XhWI8AaZpOPguSsXCXaTdXXwJTBB7rNsozxl6OvfDIM+wu5p0E19qV
 /OGRMYL6CRqyQ5aXHZUHHnxJTRmKFDJXhnoU6eq51SznMODXDCf9krZ5aKy7RCOTOjHC
 Ptlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Nz+uqA7e4/P8W1+vztFIrzinPtJHEHUsBZrInKc0qlM=;
 b=cEktpqd870LGp1pw83jM24h9zvUoMLS0+IaGg2Xb6g9FmNSrLmCNbKGMR4I8EKI0Yt
 E9wbED5PS9+CDI1UflrTsIKKJGahq68bnWFhftCeFeQmpYEe6z8mTWPc85DtqBjLitVo
 Q7AQpIo3wSr+yQlDxeFnTGvnaFpixKdh9TiVifb3Bx751eAsCnlFo7vencZovpn32IUh
 opbogyFZ4/eGuNujHyC1GKMHpoYvHXyn/7DGdhcH2mlbXZDBhcp0QWqP5Si0xylsNJBA
 UWX1YfF+gCJhRgEneZpBah7aYcnH7PXoh/23qWrWmlrxUVRX4pl2jSS+eQWjyw8oX+Ja
 DrIA==
X-Gm-Message-State: ACgBeo3pbmsTFu8JuhGCshkI+PmOzpNztcQM9ocqOX9QD38LlZKOhzat
 tKoBk5Qd9+NzsmZKzTyOJB8=
X-Google-Smtp-Source: AA6agR4K6lIuAxsSdVJ0oNphFJqoDM1Qz4a/ewauw+FqqlvVaYz09d/58GCWTrClE39lnwuTI3+EHg==
X-Received: by 2002:a17:902:d4c4:b0:172:f328:e474 with SMTP id
 o4-20020a170902d4c400b00172f328e474mr51321307plg.144.1662418187481; 
 Mon, 05 Sep 2022 15:49:47 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a170902a38a00b0017300ec80b0sm8054511pla.308.2022.09.05.15.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 15:49:46 -0700 (PDT)
Date: Mon, 5 Sep 2022 15:49:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v1 01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
Message-ID: <YxZ9BkBnQOUpXt/O@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220905071902.fv4uozrsttk3mosu@pali>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-watchdog@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 09:19:02AM +0200, Pali Rohár wrote:
> On Sunday 04 September 2022 23:30:53 Dmitry Torokhov wrote:
> > I would like to limit (or maybe even remove) use of
> > [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> > a bit, so let's switch to the generic device property API. It may even
> > help with handling secondary fwnodes when gpiolib is taught to handle
> > gpios described by swnodes.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> > index 8e323e93be91..929f9363e94b 100644
> > --- a/drivers/pci/controller/pci-tegra.c
> > +++ b/drivers/pci/controller/pci-tegra.c
> > @@ -2202,10 +2202,11 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
> >  		 * and in this case fall back to using AFI per port register
> >  		 * to toggle PERST# SFIO line.
> >  		 */
> > -		rp->reset_gpio = devm_gpiod_get_from_of_node(dev, port,
> > -							     "reset-gpios", 0,
> > -							     GPIOD_OUT_LOW,
> > -							     label);
> > +		rp->reset_gpio = devm_fwnode_gpiod_get(dev,
> > +						       of_fwnode_handle(port),
> > +						       "reset",
> > +						       GPIOD_OUT_LOW,
> > +						       label);
> 
> Why in pci-aardvark.c for PERST# reset-gpio you have used
> devm_gpiod_get_optional() and here in pci-tegra.c you have used
> devm_fwnode_gpiod_get()? I think that PERST# logic is same in both
> drivers.

I believe Andy already answered that, but in this driver we can have
several root ports described via subnodes of dev->of_node, and reset
GPIOs are attached to those subnodes. We are forced to use
devm_fwnode_gpiod_get() instead of devm_gpiod_get_optional() as we need
to supply the exact fwnode we need to look up GPIO in, and can not infer
it from the 'dev' parameter of devm_gpiod_get().

Thanks.

-- 
Dmitry
