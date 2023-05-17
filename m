Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A780C7072B6
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 22:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D871710E28C;
	Wed, 17 May 2023 20:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 357 seconds by postgrey-1.36 at gabe;
 Wed, 17 May 2023 20:05:31 UTC
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8275910E475
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 20:05:31 +0000 (UTC)
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4QM3pl47HWz49Q47
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 22:59:27 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1684353567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uT4QeccEOPKkK7gGYPYPm3Y9FH1yk/CYJCXvyI1gFcg=;
 b=LBWv9yX6RcrGy9BlscsbpA4Q+fVHj+eChk9ugZspdM16GPtQuhgrETgWp798sNUzWAv8Ae
 sYB8osC2eX4k+c/XQMkg1dC0NagMiplKKCY/DLI41sh5c5kQwJo0rq8x1ZDsAjXxvuXuaG
 xLdkbhpVW67gZNfHq3WMgnEaitxxcUxypX93WktbOgmV0q1ayq9StRLioswDHR65RPIh/L
 1/rqMmpLz5m61dDVE0KKxmGKjBJRuJZdVvOHZyo2bRIZeTsdcGg7GqcBC0DnhNGz/Fezks
 N+O6Ux5a+4S5OdkUIITQpv7i5w+hpKW6E72iLCffT/zkLF5z682rs/CguqJxsg==
Received: from darkstar.musicnaut.iki.fi (85-76-146-199-nat.elisa-mobile.fi
 [85.76.146.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: aaro.koskinen)
 by meesny.iki.fi (Postfix) with ESMTPSA id 4QM3pT6zgSzyWs;
 Wed, 17 May 2023 22:59:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1684353557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uT4QeccEOPKkK7gGYPYPm3Y9FH1yk/CYJCXvyI1gFcg=;
 b=WZFEpJpuxHgdL66a5PaD1yNk7SpgMp9G9guhbNAaUh3HEUxnbuFWcPk8rHcB/dQQJaayMK
 upe+8t3l5YMswlkboqSxW1TMcS8P/5RX1nVRVXD5ExA19T8y7uQqsCZL1U0nsnp5cTTAW4
 WqLdFf44BWpW+Gcb+Kix2JvPsvJMOEE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1684353557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uT4QeccEOPKkK7gGYPYPm3Y9FH1yk/CYJCXvyI1gFcg=;
 b=uqZALiO1J2n/ZSQ1Zg25g0VKOhsOJ/6Qt1tM/2HyGw+suNSH0P3c0GzRaRzizaWMSFNnCo
 kXUNe5mMx5fBj+8WBcmDkoSMxVBjAarDMIXN1vF1ZIB9LxTfhPvbYuxL0RtKrJA9x3X5j+
 m2hOXBKV8p6FLsSV8qUVN62sMFztjCM=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1684353557; a=rsa-sha256; cv=none;
 b=RKAECBWDBO58k84XgosU1UrhQq2r0jPWNipNo3Gi0fMRoUGJZblm+3P1vXugNvU+LqaNyh
 c2O6jMu7dk5j7DzRa8mJccrAhHhiOFueDQPGfrq0HfU5IqmE4NrXeiRgdWhUIROwa4xfNf
 00KimNUa/R4AbP591nbysQnVZMJjE/A=
Date: Wed, 17 May 2023 22:59:11 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/4] Input: ads7846 - Convert to use software nodes
Message-ID: <20230517195911.GG271152@darkstar.musicnaut.iki.fi>
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
 <20230430-nokia770-regression-v4-1-9b6dc5536b17@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430-nokia770-regression-v4-1-9b6dc5536b17@linaro.org>
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

This does not compile as nokia770_ads7846_props is declared twice,
and nokia770_cbus_props and nokia770_mpuio_gpiochip_swnode are missing.

On Mon, May 08, 2023 at 11:20:06PM +0200, Linus Walleij wrote:
> +static const struct software_node_ref_args nokia770_cbus_gpio_refs[] = {
> +	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_swnode, 9, 0),
> +	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_swnode, 10, 0),
> +	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_swnode, 11, 0),
> +};

These should be nokia770_mpuio_gpiochip_node.

> +static const struct property_entry nokia770_ads7846_props[] = {
> +	PROPERTY_ENTRY_REF_ARRAY("gpios", nokia770_cbus_gpio_refs),
> +	{ }
>  };

This should be nokia770_cbus_props.

A.
