Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D142A3D1142
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 16:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA5F6E49A;
	Wed, 21 Jul 2021 14:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469216E49A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 14:26:21 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g22so3519142lfu.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 07:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y5IdCRJZdJYIiudXPCqxlRKiC6LdgtZkGmH8rRPhgTM=;
 b=DfZty/Ixt/tbCkEATYd7Xctiu3ogAgN3WD/IwiROnkAKSZv3xwTODhlTlCT8Xi3nv1
 Dg1qfPy20ffG87fs1hWVi3Q25QSj0diOYe09xTXjyv6um8idOFHt/ZXV3rgZe9NgqdN1
 yEyzWn9IBYZGP9L8EmDpmRxNpbXAYwqRXc8AEIlWBl5F5mpmMfVKsuonN3B9ProzGngQ
 FtKpxS++Sb9F9gquqZzPud504nw7wq++64NoUphdP3fwj8uB/e3VLCpXjjacCc5sBbNu
 oeiMP8oGGghMnRlAM06pfMf3TdJGTqA5LoVQu6KZaJXAzorOV5PfOVReFX+O2e/HD2OK
 PL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y5IdCRJZdJYIiudXPCqxlRKiC6LdgtZkGmH8rRPhgTM=;
 b=mkHn3Sp5413OowGuQ8fC7LGNhKxxLx+KgwBTj6tXSIvVVtM0l38dP/0AP1sqGorAWl
 MzxTNZT9z+WXCnaXCZv8wIZo4LMiDpM98kQAl157YJbUbqAoGjcar1ed/g3iFUx1pNjK
 TQe+LZcEwU6VRIMV45Ty6UaG30IE6Sgu8qilJ6kfv2wn1rVp9b7rz6XJWxWupjS0vqQQ
 ak1zVyb5bpDH8InmhwrWuD8oZSd+3avwjoAGUEA6uv+WXKPTy4yxV2fXkmPTtgLD0gT/
 wVBqEM+RC7F0UYAQ9WfdjA07NNWEivD0mvxBrI2dVA/Kv5xHHDQ4ueRD5O4TqrEqRDz5
 sr8w==
X-Gm-Message-State: AOAM532YX7fMKxHgBLFw8bwo/olG9xiH8K5ieRVztt1A2rI9yMB23M0c
 4tYf9SpiuAmNNnynIfPF6d6stLxdTCIwxi6CENtrng==
X-Google-Smtp-Source: ABdhPJxLJxuektkYlmThnTeKs9wi2CGTur5nFPRKxrsRGLrNNjiiMAw1eN/JZqtaD96z1vToql3upVxtxcQHSW4GACE=
X-Received: by 2002:a05:6512:169e:: with SMTP id
 bu30mr5421776lfb.291.1626877579556; 
 Wed, 21 Jul 2021 07:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210720172025.363238-1-robh@kernel.org>
In-Reply-To: <20210720172025.363238-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 16:26:08 +0200
Message-ID: <CACRpkdZdm=ArA3H86iHwmhLnCtTePxCtuik8O+bOhDBPMXOP=A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Mateusz Holenko <mholenko@antmicro.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-rtc <linux-rtc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dilip Kota <eswara.kota@linux.intel.com>, Wei Xu <xuwei5@hisilicon.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Mark Brown <broonie@kernel.org>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Alessandro Zummo <a.zummo@towertech.it>, netdev <netdev@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 7:20 PM Rob Herring <robh@kernel.org> wrote:

> There's no reason to have "status" properties in examples. "okay" is the
> default, and "disabled" turns off some schema checks ('required'
> specifically).

All of mine are mistakes anyway.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for fixing this up.

Yours,
Linus Walleij
