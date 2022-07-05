Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82114568023
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 09:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27ED11237E;
	Wed,  6 Jul 2022 07:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6662910E021
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 10:08:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BB4A1F91F;
 Tue,  5 Jul 2022 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657015735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvMJ4J1/LuqJ2bm7BlZIoOLJOYmWh+4Rpvkk33SZGOA=;
 b=eByb4sSPqg6rRuVWR7Uyol2qkXUh2FlAJZJl6kQB2+c8EEhcdaxtq/jkX0dVzdvL/5s6D3
 /efNTsY/bdasP3pVQxu6qP4nvHO+zcS4O9fblGgs1NR89rSYgTvYETM292rGHy3CrhOSj+
 qGcOFU+GGl+mKHAF54mbZA9ZrTUJOaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657015735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvMJ4J1/LuqJ2bm7BlZIoOLJOYmWh+4Rpvkk33SZGOA=;
 b=jKWTp5GMggeoLloojImrUvPvKkYL+8GQzQSR8Qi8VzqCYEK46zUKh7GMjl/cO3qvfPDiP7
 DHXFfHIde+vxx5CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E2AF1339A;
 Tue,  5 Jul 2022 10:08:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VBGsCbYNxGK1BQAAMHmgww
 (envelope-from <jdelvare@suse.de>); Tue, 05 Jul 2022 10:08:54 +0000
Date: Tue, 5 Jul 2022 12:08:52 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220705120852.049dc235@endymion.delvare>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 06 Jul 2022 07:41:40 +0000
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
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev,
 kasan-dev@googlegroups.com, linux-clk@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Jun 2022 16:03:12 +0200, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
>=20
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
>=20
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

That's a huge change for a relatively small benefit, but if this is
approved by the I2C core maintainer then fine with me. For:

>  drivers/hwmon/adc128d818.c                                | 4 +---
>  drivers/hwmon/adt7470.c                                   | 3 +--
>  drivers/hwmon/asb100.c                                    | 6 ++----
>  drivers/hwmon/asc7621.c                                   | 4 +---
>  drivers/hwmon/dme1737.c                                   | 4 +---
>  drivers/hwmon/f75375s.c                                   | 5 ++---
>  drivers/hwmon/fschmd.c                                    | 6 ++----
>  drivers/hwmon/ftsteutates.c                               | 3 +--
>  drivers/hwmon/ina209.c                                    | 4 +---
>  drivers/hwmon/ina3221.c                                   | 4 +---
>  drivers/hwmon/jc42.c                                      | 3 +--
>  drivers/hwmon/mcp3021.c                                   | 4 +---
>  drivers/hwmon/occ/p8_i2c.c                                | 4 +---
>  drivers/hwmon/pcf8591.c                                   | 3 +--
>  drivers/hwmon/smm665.c                                    | 3 +--
>  drivers/hwmon/tps23861.c                                  | 4 +---
>  drivers/hwmon/w83781d.c                                   | 4 +---
>  drivers/hwmon/w83791d.c                                   | 6 ++----
>  drivers/hwmon/w83792d.c                                   | 6 ++----
>  drivers/hwmon/w83793.c                                    | 6 ++----
>  drivers/hwmon/w83795.c                                    | 4 +---
>  drivers/hwmon/w83l785ts.c                                 | 6 ++----
>  drivers/i2c/i2c-core-base.c                               | 6 +-----
>  drivers/i2c/i2c-slave-eeprom.c                            | 4 +---
>  drivers/i2c/i2c-slave-testunit.c                          | 3 +--
>  drivers/i2c/i2c-smbus.c                                   | 3 +--
>  drivers/i2c/muxes/i2c-mux-ltc4306.c                       | 4 +---
>  drivers/i2c/muxes/i2c-mux-pca9541.c                       | 3 +--
>  drivers/i2c/muxes/i2c-mux-pca954x.c                       | 3 +--

Reviewed-by: Jean Delvare <jdelvare@suse.de>

--=20
Jean Delvare
SUSE L3 Support
