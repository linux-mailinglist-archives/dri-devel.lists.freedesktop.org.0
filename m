Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8514876E28D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB4110E5BF;
	Thu,  3 Aug 2023 08:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4040510E5BF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:11:25 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-317716a4622so583945f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691050283; x=1691655083;
 h=content-transfer-encoding:in-reply-to:subject:organization
 :references:cc:to:content-language:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=0ccPdz93R2ktglChLK92GsVW4oztvWhZvA2sF5gQ4E4=;
 b=Xk3NwDYu/IWY5bxvTmJUzlnKk0MJgrIyWoWVmPtWHROPtQU5f6g103KazMrNOC6IN9
 WhENeO7HTGwFmnMBfzLBC4nBBXcXKCaN4YN1wdjPpF4IODjdqzGMzbtXY/+WpfG8Jptg
 33iA5eKlkCFYM/VvxIowE+LuYumRaOOSNVptfpkVL7JZWfYNSOswXFp2eRrwZmfYFNCi
 2rYN6kBFdgl1+I92huKXp7xG5K8UBvfjDSCWq0QpGT2+uxfMVpS51sXh59M5xbWTT63z
 cq114zttfsDap+T6LOuVWq8WMIXkqP8zRNjra23n8PzE7MHbJEt34gtVgK5qABA1FPL5
 QYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691050283; x=1691655083;
 h=content-transfer-encoding:in-reply-to:subject:organization
 :references:cc:to:content-language:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0ccPdz93R2ktglChLK92GsVW4oztvWhZvA2sF5gQ4E4=;
 b=l6254LKk4Y2/0Lkdjdve0rrwX9iaNt2xnFoFYgHeV1k2w5Lmbkh0X+NtwhyOwtIyCm
 7+6lAVSmJyXBKj7R8wL4OW4okBblgKU9SPPqWcsihYfqrlQui+ftQrX66pdJqFv41Zwk
 iVVLRO6aEviADsDHwug6c/9Q1ObewsS3tyamF/QaBIn+rktdZvPnaCoyBxaNIIcw1Aes
 NSZx3yB7MdKOyHopGquFyOdIHf+U8rtqVKtNY6qBBH+vsEFJ5zlPbtdICa56DR7Pqhb8
 vJwxGyHq0SZ2ekDSZvyX/10Whq7V/pYxRFm1QNKRDvFzqRS6c9KeAzVBN7IDHYVT6q9A
 yzbw==
X-Gm-Message-State: ABy/qLZ1BY+dfH9hEvfazhNUu2LM9+a75tkgBxMSiebyVGZ8mOHVpGXB
 cKhy24Nyk5tFt+/yAaaFmdWJvA==
X-Google-Smtp-Source: APBJJlG9vqYlLa8TO1V125NzyUWy8dv5qhbsaq1Wlu0Ug4Tj9TeUDSeNSlV5glf13iso5ElI9rTb2Q==
X-Received: by 2002:a05:6000:1371:b0:317:5e22:3ed4 with SMTP id
 q17-20020a056000137100b003175e223ed4mr6414482wrz.49.1691050283581; 
 Thu, 03 Aug 2023 01:11:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8656:583:d034:d966?
 ([2a01:e0a:982:cbb0:8656:583:d034:d966])
 by smtp.gmail.com with ESMTPSA id
 y18-20020adff152000000b0031779a6b451sm21101418wro.83.2023.08.03.01.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 01:11:23 -0700 (PDT)
Message-ID: <292c3e7d-82ea-2631-bd4b-ef747f56287c@linaro.org>
Date: Thu, 3 Aug 2023 10:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
Organization: Linaro Developer Services
Subject: Re: [PATCH 0/4] drm/panel: sitronix-st7789v: add support for partial
 mode
In-Reply-To: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 18/07/2023 17:31, Michael Riesch wrote:
> Hi all,
> 
> This series adds support for the partial display mode to the Sitronix
> ST7789V panel driver. This is useful for panels that are partially
> occluded by design, such as the Jasonic JT240MHQS-HWT-EK-E3. Support
> for this particular panel is added as well.
> 
> Note: This series is already based on
> https://lore.kernel.org/lkml/20230714013756.1546769-1-sre@kernel.org/

I understand Maxime's arguments, but by looking closely at the code,
this doesn't look like an hack at all and uses capabilities of the
panel controller to expose a smaller area without depending on any
changes or hacks on the display controller side which is coherent.

Following's Daniel's summary we cannot compare it to TV overscan
because overscan is only on *some* displays, we can still get 100%
of the picture from the signal.
While here, we cannot, there's physically less pixels on the panel.

If there's no more still a strong nack or pending comments,
I plan to apply those tomorrow.

Thanks,
Neil

> 
> Looking forward to your comments!
> 
> ---
> Michael Riesch (4):
>        dt-bindings: vendor-prefixes: add jasonic
>        dt-bindings: display: st7789v: add jasonic jt240mhqs-hwt-ek-e3 display
>        drm/panel: sitronix-st7789v: add support for partial mode
>        drm/panel: sitronix-st7789v: add jasonic jt240mhqs-hwt-ek-e3 support
> 
>   .../bindings/display/panel/sitronix,st7789v.yaml   |  1 +
>   .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c     | 67 +++++++++++++++++++++-
>   3 files changed, 68 insertions(+), 2 deletions(-)
> ---
> base-commit: b43dae411767f34288aa347f26b5ed2dade39469
> change-id: 20230718-feature-lcd-panel-26d9f29a7830
> 
> Best regards,

