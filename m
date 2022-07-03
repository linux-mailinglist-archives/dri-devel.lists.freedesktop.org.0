Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DED565B5E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D754D10EC33;
	Mon,  4 Jul 2022 16:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A9110E103
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=2ZFARzV89Y+zuzcFxn0gSS6YLDJI2j0rdkLanFmF5yY=;
 b=eqioB4rpXH0QoKiHKlPAxvqFS+D/BUinr3JU7uxhhh9+LjrL1GTFdp6jZStBuNm41Qrrvhab+Cu3t
 VI1U97Upb3wfrbpY3hM+W26blpWZxUGS7EUJX/uqRx69RHwwgdbclPfShxwfjOyaCtU1VjltV/VNpE
 u52YCWBEOv0LzUXcMC4rzwfMH7hTGtTZSW+iUYyWejyHasjOjbxkqTxk1/SB3lOGP/ZYtZT3yI4UpC
 v8HgjrT3IvuQExGPBQlyTYzYcU56CKUi/AdFQeeS+UKUvY15j8Vp7qx6zbApSSqL3Q+nn4bSbMPCfb
 ENA3xAycsf1XqU91DVqnE55xX8Jtsxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=2ZFARzV89Y+zuzcFxn0gSS6YLDJI2j0rdkLanFmF5yY=;
 b=Cx0a5B5/DD5o31yngzt4vl46kwrz9eGwoOOrAl4M3VJGXp3PtwfelpEWq9280dD3yZ3oDjVlNvcrU
 qrPIkQdBQ==
X-HalOne-Cookie: ccb8945555c39a4c9f786335d10fca6079fd2d00
X-HalOne-ID: 894cd626-fb02-11ec-8239-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 894cd626-fb02-11ec-8239-d0431ea8bb10;
 Sun, 03 Jul 2022 19:01:25 +0000 (UTC)
Date: Sun, 3 Jul 2022 21:01:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: add EDT ETML0700Y5DHA
 panel
Message-ID: <YsHnhBMObRy9txLp@ravnborg.org>
References: <20220530122407.918874-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530122407.918874-1-m.felsch@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marco,

On Mon, May 30, 2022 at 02:24:06PM +0200, Marco Felsch wrote:
> Add binding for the Emerging Display Technology ETML0700Y5DHA panel.
> It is a 7" WSVGA (1024x600) TFT LCD panel with:
>  - LVDS data interface,
>  - backlight and
>  - capacitive touch.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

I have just pushed this and the second patch to drm-misc
(drm-misc-next).

	Sam
