Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B4E1496FE
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 18:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C4A6E8BB;
	Sat, 25 Jan 2020 17:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7366E8BB
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 17:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XzLnRe4nVX37SxJkvQJ35PmYKI3rRwVc9WTSZy1HmOY=; b=peBYGArIFKwzpMpE5uSYUzYTHX
 LnNPL7NjV4kL7675KAzBSD2WAADe29DvN3sXxtd7J85oAgTWGugkLSWD1Yo5HhCRH+pZB9qOWMSjc
 hTrhkSHNH+pCbrdJupHmUEXjEtXfJeg4c6ocJwdyayR+y4SlWyJ/UMHeWsKwxRxMoupClKaldOsZP
 MGx36WR3ZiU+YGwhTGSo7gFQpFl+84DoNmqWx02Vb4J+RSwO3kSxmoEtRUnlK92e6CG4HAehXxBEO
 QWYthdHxxT/sVoP7cvjtMfBH5UkgAq0EwcsWQG/yhfcLWp4PiBZIzlqayT5xj9WIHB2SrFvxjSZN9
 MB11gJdQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55086
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ivPV2-0002bM-QH; Sat, 25 Jan 2020 18:45:36 +0100
Subject: Re: [PATCH 1/2] dt-bindings: add binding for Ilitek ili9486 based
 display panels
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
References: <cover.1579963130.git.kamlesh.gurudasani@gmail.com>
 <ab0780c182b6921a6ca7ebf88f0bcd36ceed6450.1579963130.git.kamlesh.gurudasani@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <a703c620-2573-0d59-8272-20fc6d28d09c@tronnes.org>
Date: Sat, 25 Jan 2020 18:45:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ab0780c182b6921a6ca7ebf88f0bcd36ceed6450.1579963130.git.kamlesh.gurudasani@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 25.01.2020 16.38, skrev Kamlesh Gurudasani:
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
>  .../devicetree/bindings/display/ilitek,ili9486.txt | 27 ++++++++++++++++++++++

For version 2, send the patchset to the devicetree mailinglist as well.
A DT maintainer has to review it. Send the whole set since he wants to
look at the driver as well.

See: Documentation/devicetree/bindings/submitting-patches.txt

Looks like bindings are in yaml format now.

>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9486.txt b/Documentation/devicetree/bindings/display/ilitek,ili9486.txt
> new file mode 100644
> index 0000000..51c8196
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ilitek,ili9486.txt
> @@ -0,0 +1,27 @@
> +Ilitek ILI9486 display panels
> +
> +This binding is for display panels using an Ilitek ILI9486 controller in SPI
> +mode.
> +
> +Required properties:
> +- compatible:   "ozzmaker,piscreen", "waveshare,rpi-lcd-35", "ilitek,ili9486"

Drop the last entry since it doesn't make any sense since the controller
won't work without being initialized (it would make sense if we could
read out from the controller which panel is connected). And the driver
doesn't support this compatible either.

I assume that ozzmaker and waveshare needs to be added to
bindings/vendor-prefixes.yaml, and that would be as a separate patch.

> +- dc-gpios:     D/C pin
> +- reset-gpios:  Reset pin

Both these are optional in the driver.

> +
> +The node for this driver must be a child node of a SPI controller, hence
> +all mandatory properties described in ../spi/spi-bus.txt must be specified.
> +
> +Optional properties:
> +- rotation:     panel rotation in degrees counter clockwise (0,90,180,270)
> +- backlight:    phandle of the backlight device attached to the panel
> +
> +Example:
> +        display@0{
> +                compatible = "ozzmaker,piscreen", "waveshare,rpi-lcd-35", "ilitek,ili9486";

Pick only one compatible for the example.

Noralf.

> +                reg = <0>;
> +                spi-max-frequency = <32000000>;
> +                dc-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
> +                reset-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
> +                rotation = <180>;
> +                backlight = <&backlight>;
> +        };
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
