Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD73D1BC013
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 15:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D71289DE6;
	Tue, 28 Apr 2020 13:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4017F89DE6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:46:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u127so2938414wmg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gN0GVe8M5EtlT22Eb8mHv2fX/UR8S4omP2M6sHpuhtY=;
 b=PVUQap13qYZmA0+VZQaqiFB2wfy6Yb6gJeeoAW965a0eLfe3+SDnndcmphBvBwTC+a
 TwEd86l4FrdkLtW8APpGD8WY557COLHBJj/NifZk2Oev5E4NjQdZAUMLpKksXXvSWXll
 LOR6gQnzYyvP96DakhqZV0oxj1ZO6FzTIHyo6SA9YEAWuAdCEAHO17zedLk+VggXrz8H
 ysQBwIzY75Uuz5LoGf08eKmBxZGuyyM4asniqXoc6dirdokrkneVIR7NPQ9yZwh4T+dx
 JGsNYFn8TUPjWIPyfnwsPoMPdk4Iy2l0lmcD7Lez/NnJNxNqfKNEmWPkc5E8Ou+fhVRo
 vWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gN0GVe8M5EtlT22Eb8mHv2fX/UR8S4omP2M6sHpuhtY=;
 b=dBO+fhG3PSwozSlaIE6Ccn06GixLAPRAPEoC/QuHKpFG0MUszZilh8fP+u+pLVY8Sk
 kTCEBUFILBKxQNj8bsm8jhslks0Xvrh/EiqQAI9wb52o74PJ7DtDA0vshBANWHcFPhEX
 PPzBOy41QbALIPWAE3NnALPZfFW1bvrpINm1tNs4oHCkkVQnMK1bWqQRdkulc4N1h4nI
 H5WETH2smw32l+pnp8j3NO33QF77yBwzDbQTkXGQUMXI143c/7v8tlY/FJtbpl/r13jq
 CIGS/payjrB2vmKZnkWQnQ6uSwHyjc35NO3n7DPK91fVQZU/Q8Cbh8ioEPc0O/JZD/Fg
 Wmhg==
X-Gm-Message-State: AGi0PuZo70zyCpK7Fy1tT6CCT9lJmYaeDJobfWPP7RgG06ah0LN0cjK9
 kA7z/42NfV/lvgPJUp0Rl04RwQ==
X-Google-Smtp-Source: APiQypIKINR3nEejvySx45Dvy+4Sem9XA+Zb2Z+9i8nDHYDvUtlNIh60NFXeA0Xeqsojk3YH0gn1Wg==
X-Received: by 2002:a1c:3985:: with SMTP id g127mr4828818wma.102.1588081608902; 
 Tue, 28 Apr 2020 06:46:48 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id o18sm25146103wrp.23.2020.04.28.06.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 06:46:47 -0700 (PDT)
Date: Tue, 28 Apr 2020 14:46:45 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: l4f00242t03: Convert to GPIO descriptors
Message-ID: <20200428134645.eegqa7kuhrtdckb7@holly.lan>
References: <20200415121449.111043-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415121449.111043-1-linus.walleij@linaro.org>
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
Cc: Alberto Panizzo <maramaopercheseimorto@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 02:14:49PM +0200, Linus Walleij wrote:
> This converts the l4f00242t03 backlight driver to use GPIO
> descriptors and switches the two Freescale i.MX boards over
> to passing descriptors instead of global GPIO numbers.
> 
> We use the typical names "enable" and "reset" as found in
> the device tree bindings for panel GPIOs.
> 
> This saves a lot of code in the driver and makes it possible
> to get rid of the platform data header altogether.
> 
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Anson Huang <Anson.Huang@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Alberto Panizzo <maramaopercheseimorto@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> i.MX folks: please test if you can or at least ACK so Lee
> knows if this is OK for you.
> ---

+1!


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
