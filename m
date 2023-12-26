Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D06E181E870
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 17:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8BF10E0D0;
	Tue, 26 Dec 2023 16:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDD310E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 16:32:42 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4T00gD3yZnz9x1s;
 Tue, 26 Dec 2023 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1703608361; bh=7Z0QZDUqtUb0SVOcfo3DjMkSg2JZFz632/axgQAClno=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JXqaeUHrIrSN6gbZDKjZy79covUTsKAg6oibqlNHR+2TlmeRWbH4NZGI+wU02FXtW
 LIpb6ARaMqpHBgrNEVK8k0S/uJ4FMR7ixYu2c1VxHJXhXXIZeKlCnYXTw8WLuDVaM/
 Voc/WXwl9uttpnd8/zNHB6out9t98u05IhOW5C5Y=
X-Riseup-User-ID: E3266E2FE8A468CF052B0366B6691ACFC63C59369F6E61E12BD8CA58073E2F17
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4T00ft4lBtzJmth;
 Tue, 26 Dec 2023 16:32:22 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>,
 Manuel Traut <manut@mecka.net>, Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v2 0/4] arm64: rockchip: Pine64 pinetab2 support
Date: Tue, 26 Dec 2023 16:32:10 +0000
Message-ID: <6875992.lOV4Wx5bFT@melttower>
In-Reply-To: <2905432.tPBmtbmofK@bagend>
References: <20231223-pinetab2-v2-0-ec1856d0030e@mecka.net>
 <2905432.tPBmtbmofK@bagend>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, Manuel Traut <manut@mecka.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, December 26, 2023 1:32:32 PM UTC Diederik de Haas wrote:
> [    5.570059] dwmmc_rockchip fe2c0000.mmc: could not set regulator OCR
> (-22) [    5.570835] dwmmc_rockchip fe2c0000.mmc: failed to enable vmmc
> regulator [    5.616373] dwmmc_rockchip fe2c0000.mmc: could not set
> regulator OCR (-22) [    5.621903] dwmmc_rockchip fe2c0000.mmc: failed to
> enable vmmc regulator
This is the WLAN SDIO, the error shows up when the device is not powered on.

> Both also have an error wrt `goodix_911_cfg.bin` firmware, but the error
> could be because Debian kernel 'upgraded' a warning to an error.
> I've searched online for that filename, but haven't found anything.
> The touchscreen works, so I guess that one can be ignored.
This can be ignored, it's for touch panels where it's config is not on flash 
(typically touch panel calibration data).


