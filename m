Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AAD9B0A3B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 18:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0343810E3EA;
	Fri, 25 Oct 2024 16:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n+nU8ydd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6224110EB23
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 16:47:55 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4315baec69eso22494215e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729874873; x=1730479673; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pq8Pls6wfcoOIkkesonALKXUkplX5+7I7+nTvhjnX+Y=;
 b=n+nU8ydd0+hc6xwu+C4bNopbA5c6TJB2ILerjXy6y/mAgE+9QMg4URLyn8jm+1dTn8
 d0J+/0EMhtUYF/HshPN+wF7mbQKSdGk8OGuzSaPAkOY7gmFcu/4hh4sMfKuWqJWyEGWl
 c9hUCKh0Wh/Omqs9JLNMW0t+P6jqSWoDZv/INu+JFy86Ee3ZhAMTDw/zH2GToC05vVLu
 ZrDL/nVGZmFh4ko7de55LL560oRWdXjt2qd3nEKqA3JfIAZgZkVrvjnkif5BAXRdobNy
 I6ZSzxdx84dh5oIJqiKlwjRBA4deek6mStAnewz9/D5rh0gp7B7IvMufz9D7oYPN+5yh
 vmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729874873; x=1730479673;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pq8Pls6wfcoOIkkesonALKXUkplX5+7I7+nTvhjnX+Y=;
 b=cgn99q1aBQm/i5HlWxZptKZRvBCKsjAHDElO2snmod+f8xVHHVqnXrE39TVxFVrg6G
 eGEFJC5pwm475ZMT5RyN3X6pA15LyFVbOMnCEOWw3kxfuvD5+cvWIeVYlQNQ0WiEjlcG
 0jGDc+P/ADHfRziFmytwyu9n3xUKD1Ax1fpODR4vsrh5qXQyUVhX0UFV+3My6UgT5Y2A
 ta9EQsm61Efs3fpVmk0nydrndYKiYNEA6093TJNsD03+vdEbnUFcy74ZZ6J2WYIvwgot
 PbCxEZlSGJyOWzBCnQGWuFUa5K+NUiGrnljU0MfecHLl0ww1DT1ltHv97yMnuObOFUAq
 BUCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXeOhGP8DNSZJxNFal2ZZD27DZHT2H5ygJBCSAlUedOVcSrp1YJ5YvL4tUmIIHETt3jWKjyDxjMWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPbXcSo09xftFu6lOivJbs/r6GQl24wSgLaTrNT08D2POvtPmn
 XhYyjs0XddLAw/FLy/rsOVAS8XJYo/t7GdiNJbH/mNSiAmOBZ3EmI5YMDs8pGyc=
X-Google-Smtp-Source: AGHT+IF02bj5hqk2pa2px5XKt3k6T5GNE8a/QRIUqmwQLRKjQmn5vBqDV0jEbdaIf8k7NaYO4RlifQ==
X-Received: by 2002:adf:facd:0:b0:37d:5103:8894 with SMTP id
 ffacd0b85a97d-380611dc14bmr38014f8f.42.1729874873628; 
 Fri, 25 Oct 2024 09:47:53 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b4a3cesm1949511f8f.63.2024.10.25.09.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 09:47:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Frank Li <Frank.Li@nxp.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org
In-Reply-To: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
Subject: Re: (subset) [PATCH v2 0/5] dt-bindings: mfd: convert
 zii,rave-sp.txt and child txt to yaml format
Message-Id: <172987487249.288365.3434469015929868507.b4-ty@linaro.org>
Date: Fri, 25 Oct 2024 17:47:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 10 Oct 2024 11:42:37 -0400, Frank Li wrote:
> Fixed below warnings:
> 
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> 
> [...]

Applied, thanks!

[3/5] dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml format
      commit: 17d6f058403d4e3458ec9c7dae607c065cabe089

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

