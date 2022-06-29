Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BC856028E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 16:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F1710E33D;
	Wed, 29 Jun 2022 14:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C590A10E17D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 14:25:59 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ay16so32961457ejb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 07:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nzVAkjUIXnSmifmZO/KNuTW33GCGTCzsi9aX026XXeg=;
 b=S2dVib/eYmAFl827WdIoCLllzfbxALRjIjzfRRwuBWpdbVEMsjXdf1fQZ0QK1n2n0J
 7Rc0uKmDUlj06sv7gme85B+3fLmze+mOouy0tIsuBDVpy1nD4eEh9k2i1LyAyfo/z7Zj
 KDlk5RBwfb1T/0o1rVzuZORFiKZsCvSsNfve9fNt60vuT8XdzQWLTwkS/9FAhK69nmEs
 mEzSIHBFyIvznhb3ZYEmWznM5HxrpFTwi8PXn2kSF7LDJWEQQU2316sTZ03OvudAaN+G
 thYeRK11RnXT7zItby/QP43/O2E1Z4EfVZv3Nyn7dRrR7zoEuvKZKKrx+f9P5pfvx3Rg
 uLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nzVAkjUIXnSmifmZO/KNuTW33GCGTCzsi9aX026XXeg=;
 b=HY8nRqFLNun9zl1Y6QbmC6h9ZsuBuX2LxxijWSbwkR8Tzk85Sr4nPaaJavxcjODAfk
 mk+mdIEorJA9N+iv4zHRbHnrPuLMw8IH1gOWsEbjhnoIKu5KYk+LfC4Cz806Af2Pnzzs
 yDNjkEtvnK5o6T2Vc+NR1G4r1KZOapUrO4hADj1p1IoPUA3l82hEc5Bt7FuaKt0DrbtG
 Ssw6nP/apZTYVump63JFuH158uKs1vnTk7BY8/dOgY1cuVuUAGx2QQtFJ7PrYbkSZFiG
 f5oiWYI9feLeePf2+nnJl3SUqhdAOhSL/2s0Dd7SIPgt2GFXFp5SCniNNz7Gex5mkaRM
 hLaw==
X-Gm-Message-State: AJIora/+cO3zQzEx6AytGqry1AJvbIodXgXhnNCgvZ/I3GINaElZVR/t
 mmi+1lNscssnrJbMReypHq8=
X-Google-Smtp-Source: AGRyM1vLxTFMIxeh0MQDJmw094z51hmalDIKhKM+71jelG0gY6NpuuzQXDALY4ZT1iSuYjMs9++euw==
X-Received: by 2002:a17:906:58cf:b0:722:e4e1:c174 with SMTP id
 e15-20020a17090658cf00b00722e4e1c174mr3593366ejs.85.1656512758310; 
 Wed, 29 Jun 2022 07:25:58 -0700 (PDT)
Received: from [10.29.0.16] ([37.120.217.82]) by smtp.gmail.com with ESMTPSA id
 jy19-20020a170907763300b007263713cfe9sm7220580ejc.169.2022.06.29.07.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 07:25:57 -0700 (PDT)
Message-ID: <80117936-6869-19b2-45a6-96a4562c6cd2@gmail.com>
Date: Wed, 29 Jun 2022 16:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, kasan-dev@googlegroups.com, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-omap@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Bastien Nocera <hadess@hadess.net>,
 linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, Shawn Tu <shawnx.tu@intel.com>,
 linux-hwmon@vger.kernel.org, acpi4asus-user@lists.sourceforge.net,
 linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-gpio@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 platform-driver-x86@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-crypto@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 linux-integrity@vger.kernel.org, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/28/22 16:03, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
> 
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

[...]
>   drivers/platform/surface/surface3_power.c                 | 4 +---

[...]

> diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
> index 444ec81ba02d..3b20dddeb815 100644
> --- a/drivers/platform/surface/surface3_power.c
> +++ b/drivers/platform/surface/surface3_power.c
> @@ -554,7 +554,7 @@ static int mshw0011_probe(struct i2c_client *client)
>   	return error;
>   }
>   
> -static int mshw0011_remove(struct i2c_client *client)
> +static void mshw0011_remove(struct i2c_client *client)
>   {
>   	struct mshw0011_data *cdata = i2c_get_clientdata(client);
>   
> @@ -564,8 +564,6 @@ static int mshw0011_remove(struct i2c_client *client)
>   		kthread_stop(cdata->poll_task);
>   
>   	i2c_unregister_device(cdata->bat0);
> -
> -	return 0;
>   }
>   
>   static const struct acpi_device_id mshw0011_acpi_match[] = {

For the quoted above:

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
