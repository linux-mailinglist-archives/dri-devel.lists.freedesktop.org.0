Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A983782E7F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 18:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F42610E28D;
	Mon, 21 Aug 2023 16:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5740F10E283
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 16:36:35 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso3236309f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 09:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692635794; x=1693240594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YLeAswC8FPpnMLWgDTF18xaCa/KlTJOAu90A2tSHG+E=;
 b=ZMWD+ZPMbu1gWKaNmbRIhaJl6M0UdWARNKG+CVFRFmgdncqHY+nC82h8+Z55xxwz2g
 H4UsCTHk8poZdmNASIEX0eU9XMxgI/NRqCUKqrBG2vVDLwiNsgf7gUgEWSwFrNqO6Sc4
 SwklnAofSB96Y+ZzPmfD8ORqEN/I+Ep8ju9AqMYXJm78IGQEM9fPyCbD+4mAVdhZUlAV
 CcmKjMqJmLtieYZssdfVTjMOqPPWEVy5S0DFCmngIzcQrhUVG1mgUrYasUJoKMEhvuEl
 UoRQDmK0KDDBFlXHw1Pg/V4LleTBGM3NCg9G5IEfXI80uozNpfmuhAdlHauV7n45GWm9
 PRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692635794; x=1693240594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YLeAswC8FPpnMLWgDTF18xaCa/KlTJOAu90A2tSHG+E=;
 b=lgEVneBWL31ch8MTwftxSPInYf7lQxD5oAbwSJXPb/duGElAVtOdM8Cd2beoZBH8ln
 l4pt6OIky0DSpaqZdxlOOt3Dlxp9g1N++ABi+spqunHS7BZh4tZUXFpA96irA2R+Atsw
 0JiHPiD6mV1LgxxNvIfdx76kowb1YhxbxqioljX+OO6hnds2cMCYV5wrRD3R7UEoI+nf
 G7VnwzDrDpCoo/jdMMibFXDvh+CRYcfQYwM5/7xMwcUzz4aQz/eCglhGnM0l9am+JzKc
 I0DmoEx7yZYN4vSD84lgQ0ziQK1iuxbsqt/wAYaT7FvvmQjDLOH95pXhTDn28KbFVv5+
 cJOA==
X-Gm-Message-State: AOJu0YykphYNf7A2UWxVofSZilt3Vm17MUcuj6Vm9ngFXczSvSZRFHQM
 233y8qaF2NdEErb6JrhM1knI6Q==
X-Google-Smtp-Source: AGHT+IFhBb30ZJ4bzxScpzo0htWeygmB0PYxIMb7ZiGf78WIe5bZNnpUTDLFUVFVi2lm3yyfveQCqA==
X-Received: by 2002:adf:d085:0:b0:317:759a:8ca6 with SMTP id
 y5-20020adfd085000000b00317759a8ca6mr4734991wrh.62.1692635793634; 
 Mon, 21 Aug 2023 09:36:33 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 e1-20020adfe7c1000000b0031b2c01f342sm7114191wrn.87.2023.08.21.09.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 09:36:33 -0700 (PDT)
Date: Mon, 21 Aug 2023 17:36:31 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Julius Zint <julius@zint.sh>
Subject: Re: [PATCH v3 1/1] backlight: hid_bl: Add VESA VCP HID backlight
 driver
Message-ID: <20230821163631.GA214013@aspen.lan>
References: <20230820094118.20521-1-julius@zint.sh>
 <20230820094118.20521-2-julius@zint.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820094118.20521-2-julius@zint.sh>
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
Cc: linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 20, 2023 at 11:41:18AM +0200, Julius Zint wrote:
> The HID spec defines the following Usage IDs (p. 345 ff):
>
> - Monitor Page (0x80) -> Monitor Control (0x01)
> - VESA Virtual Controls Page (0x82) -> Brightness (0x10)
>
> Apple made use of them in their Apple Studio Display and most likely on
> other external displays (LG UltraFine 5k, Pro Display XDR).
>
> The driver will work for any HID device with a report, where the
> application matches the Monitor Control Usage ID and:
>
> 1. An Input field in this report with the Brightness Usage ID (to get
>    the current brightness)
> 2. A Feature field in this report with the Brightness Usage ID (to
>    set the current brightness)
>
> This driver has been developed and tested with the Apple Studio Display.
> Here is a small excerpt from the decoded HID descriptor showing the
> feature field for setting the brightness:
>
>   Usage Page (Monitor VESA VCP),  ; Monitor VESA VPC (82h, monitor page)
>   Usage (10h, Brightness),
>   Logical Minimum (400),
>   Logical Maximum (60000),
>   Unit (Centimeter^-2 * Candela),
>   Unit Exponent (14),
>   Report Size (32),
>   Report Count (1),
>   Feature (Variable, Null State),
>
> The full HID descriptor dump is available as a comment in the source
> code.
>
> Signed-off-by: Julius Zint <julius@zint.sh>

I saw Christophe's review (thanks) and won't repeat anything from
there...

> @@ -472,6 +472,14 @@ config BACKLIGHT_LED
>  	  If you have a LCD backlight adjustable by LED class driver, say Y
>  	  to enable this driver.
>
> +config BACKLIGHT_HID
> +	tristate "VESA VCP HID Backlight Driver"
> +	depends on HID
> +	help
> +	  If you have an external display with VESA compliant HID brightness
> +	  controls then say Y to enable this backlight driver. Currently the
> +	  only supported device is the Apple Studio Display.

This contradicts the description which says you write the driver to the
standard but only tested on Apple Studio Display. There is no need to
spell what has been tested in the Kconfig text. Remove the final
sentence!

> diff --git a/drivers/video/backlight/hid_bl.c b/drivers/video/backlight/hid_bl.c
> new file mode 100644
> index 000000000000..b40f8f412ee2
> --- /dev/null
> +++ b/drivers/video/backlight/hid_bl.c
> <snip>
> +static void hid_bl_remove(struct hid_device *hdev)
> +{
> +	struct backlight_device *bl;
> +	struct hid_bl_data *data;
> +
> +	hid_dbg(hdev, "remove\n");

This message probably should be removed (if you want to know if a function was
executed use ftrace).


> +	bl = hid_get_drvdata(hdev);
> +	data = bl_get_data(bl);
> +
> +	devm_backlight_device_unregister(&hdev->dev, bl);
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +	hid_set_drvdata(hdev, NULL);
> +	devm_kfree(&hdev->dev, data);
> +}
> +
> +static int hid_bl_get_brightness_raw(struct hid_bl_data *data)
> +{
> +	struct hid_field *field;
> +	int result;
> +
> +	field = data->input_field;
> +	hid_hw_request(data->hdev, field->report, HID_REQ_GET_REPORT);
> +	hid_hw_wait(data->hdev);
> +	result = *field->new_value;
> +	hid_dbg(data->hdev, "get brightness: %d\n", result);

To be honest I'm a little dubious about *all* the hid_dbg() calls. They
add very little value (e.g. they are useful to get the driver working
but not that important to keeping it working). As such I don't think
they are worth the clutter in a CONFIG_DYNAMIC_DEBUG kernel.

Note this is strictly for the hid_dbg() stuff... the hid_err() stuff in
the probe error paths are much more useful!


Daniel.
