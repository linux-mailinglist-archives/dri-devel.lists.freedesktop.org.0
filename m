Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F85A70730A
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 22:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3436D10E2A6;
	Wed, 17 May 2023 20:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1855 seconds by postgrey-1.36 at gabe;
 Wed, 17 May 2023 20:30:19 UTC
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0955E10E2A6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 20:30:18 +0000 (UTC)
Received: from darkstar.musicnaut.iki.fi (85-76-146-199-nat.elisa-mobile.fi
 [85.76.146.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: aaro.koskinen)
 by meesny.iki.fi (Postfix) with ESMTPSA id 4QM4VF60zwzyWs;
 Wed, 17 May 2023 23:30:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1684355415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hTkUMKFrciCQ4jvTUoCLaFdooSw1ob2FrpRn38lXzSc=;
 b=zFSqMzYpKIoO2u9ou920IiHgMUT6AJ4zTnOheAdfxrpUGH7C7Ms1V2Rl5w1p9jZwSR06an
 uklHtEjV39RsP+eSV3D3EhNHvJC9RzGOO9UppS7bmngSQvnv0wTIl6qEKYNPcClXqztNt0
 0TrdBA4L8eovau8osgSuF/OJ6O6RiNs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1684355415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hTkUMKFrciCQ4jvTUoCLaFdooSw1ob2FrpRn38lXzSc=;
 b=MseZBiMF3JsOdjPfUiXfvsFdWJHKy/+NCnhp7jv/O/Thws6O18OalODIcnGze7eMrJGvQW
 cYy6b6gSYvMe+12PRjfTg27fJj7tSTzmqGiAc+mu6NIhoeujqB4j2pu7lD8lVALb7Dqk/e
 G612Mn780vfcocyGetTmDEo9mNt0FwE=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1684355415; a=rsa-sha256; cv=none;
 b=N0eWTuiTSlWvCqqFgNs3lGYhdcQDcTkJNp7aeODqoJNFSAu0lYRvEVO5WlYNrdEDzS1nNs
 gLvJdu8WXbtSegTRz74AKm4FlJs5LLTLz2FVTGvvCBkEWJ7s29ekpkRe98AiEye6aRXSSt
 Y1l1Z+SjdvgjCuX3c4rUCRsnZ9C68Wo=
Date: Wed, 17 May 2023 23:30:11 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/4] ARM/mmc: Convert old mmci-omap to GPIO descriptors
Message-ID: <20230517203011.GH271152@darkstar.musicnaut.iki.fi>
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
 <20230430-nokia770-regression-v4-2-9b6dc5536b17@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430-nokia770-regression-v4-2-9b6dc5536b17@linaro.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andreas Kemnade <andreas@kemnade.info>,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This one has some issue as mmci-omap is unable to find the GPIOs on 770.

On Mon, May 08, 2023 at 11:20:07PM +0200, Linus Walleij wrote:
> +static struct gpiod_lookup_table nokia770_mmc_gpio_table = {
> +	.dev_id = "mmci-omap",

Changing this to "mmci-omap.1" helped, not sure if that is a correct way.
Most likely N800 and N810 are broken as well.

A.
