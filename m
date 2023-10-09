Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150C37BD705
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 11:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACE110E254;
	Mon,  9 Oct 2023 09:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BD410E252
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 09:29:26 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40684f53bfcso39515805e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696843764; x=1697448564; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X8m4m0ieEJ2SA5cCHHqMfizD1ZJJDz/TnRHcokgUvn4=;
 b=KYJkxJwyyRYfR5lJgGdujLxzH8zimjpn6tGtPRRAq9Ekm2AybtAkMYAvv8QonkHVe+
 x/20N76XAIXYBdKVic1M/09pnRj7UwWTXozu6FFEUWjitzj3IhDyI1JriqobzaKuZMPe
 x2GG91kyr7MvoJwWYKrt58grwLdZLhXfDMrhlqxj6AdH7fAzMecLJ811dyvwZCl8SXNr
 JOWLZNgdMchskSxNSRUGMLieDhYq1tbtDNn+urE/rNwhtxvFIdZhty7pDVxh6G+XJnT+
 fgxfgS/8hclPJLWGmaeKhw+zFFgRKqFxXg/B4riLjWHBOu+kWp9Rl3VX8Pm2ZxJbGGUP
 oOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696843764; x=1697448564;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X8m4m0ieEJ2SA5cCHHqMfizD1ZJJDz/TnRHcokgUvn4=;
 b=DhuwxNVHE16jNAqKhe0vRLtjYcxCNY3ItnZE1AudK6sddFVEp1nWEgTeNhcpTdp1SD
 tT8Qq4foCJ0/kizDS0YZsSjmTVG0YUj5bmQ6TtKaMalJkFqFuELqfogpEoMIiC5YvYw7
 tcHHGdcedqQ3ovofOWCQUSjzvXBcfBo4iDpAwONaCuCJ7vtvVqupj+TaDsGnx6KIW4ww
 TQrYjse1wm/w1XtCjLRmwu61FUQWuYOxgIuSRkQBIVvpy1eytfMGmM0qza5a65vhBLEn
 sK2W0zd/C748adi1ykihjN2SAcriYgk2MwE1f6Dmk5rBC8PH3mnFZVzMOiG2YAXTmofA
 51eQ==
X-Gm-Message-State: AOJu0Yz1MX7q0RHjN7LjOwim491x4bfGLaPt6dpOddXGKuofbzORINyq
 uOR+qpYZVkzE50VpFM2P3I7H0w==
X-Google-Smtp-Source: AGHT+IEXeYstdXT6TbrSO2yEei8azH2660L8AX7ojU3STjxM7Q8gohifEoelTb8KAy2MvYiMxGH00g==
X-Received: by 2002:a05:6000:38b:b0:329:6bd7:470c with SMTP id
 u11-20020a056000038b00b003296bd7470cmr9256860wrf.58.1696843764410; 
 Mon, 09 Oct 2023 02:29:24 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfe692000000b0031912c0ffebsm9059425wrm.23.2023.10.09.02.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 02:29:24 -0700 (PDT)
Date: Mon, 9 Oct 2023 10:29:22 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: add Kinetic KTD2801 binding
Message-ID: <20231009092922.GA223751@aspen.lan>
References: <20231005-ktd2801-v1-0-43cd85b0629a@skole.hr>
 <20231005-ktd2801-v1-1-43cd85b0629a@skole.hr>
 <20231006123014.GA96854@aspen.lan> <5984411.lOV4Wx5bFT@radijator>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5984411.lOV4Wx5bFT@radijator>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Karel Balej <balejk@matfyz.cz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 06, 2023 at 03:08:42PM +0200, Duje Mihanović wrote:
> On Friday, October 6, 2023 2:30:14 PM CEST Daniel Thompson wrote:
> > On Thu, Oct 05, 2023 at 08:49:08PM +0200, Duje Mihanović wrote:
> > > +  enable-gpios:
> > > +    maxItems: 1
> >
> > Why "enable"? This is the line we are going to us to bitbang the
> > ExpressWire protocol. Doesn't that make it a control or data pin?
>
> I named it "enable" because the KTD253 driver does so too, but also because
> that pin is also used to power down the IC. If "enable" isn't right
> regardless, is just "gpios" fine for this?

KTD2692 implements ExpressWire and calls this signal ctrl-gpios. I'd
suggest copying that prior art for now.


Daniel.
