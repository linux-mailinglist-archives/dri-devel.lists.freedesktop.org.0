Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43841B453FE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 12:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9293510EB62;
	Fri,  5 Sep 2025 10:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iz1f8YXs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F6810EB62
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 10:02:27 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7704f3c46ceso1540381b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 03:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757066546; x=1757671346; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mlJOYlx/z1k0Vlh+9uQQpTUfAOydkzaaPUhFUkrjdUk=;
 b=Iz1f8YXs9Ct3gU9BuT1Fud6BkouE8aUfsXPTLPL6Qfe2kdOqmMo3GWbQ/w6OYIUwcg
 IpdrgSqjZyReXuK2t343pffq8QlngHFPMxW8TkU7Tf3cMdoAJ8uogiHnAWbmk3TFXWah
 GqIgJk31smgQw374yHoQCllqzygusnMkSs90o40buffVRNs2Ne70A8XXqPJh/ucRYoAe
 oZJcFyUd1EuyaQE0iUIXzYyDdED2QrlWWyz04tR4KVSF6nAjolMsR9mKDVvNk6rPEeEv
 djCQDPBXz7Eyn7j5jsXePulxd/lKD5oNAtFP71eQwRECGIdaxOQTKP/ZjiRJRDp4iItY
 lucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757066546; x=1757671346;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mlJOYlx/z1k0Vlh+9uQQpTUfAOydkzaaPUhFUkrjdUk=;
 b=veFMvhaWZTbXl+aiALXXt6fnachJEptAf+YhyPFCrZSNKzEQTO2w6lnML84ZKKv13N
 mkhYw3O4nhc48JGghLBaXNPfl2x70+JTThw77hbqDNHdsidwO3EDA185OlmLYuI2nU4W
 6UZQpmZ+kf4X3L9IY9BeS7eWHK/cpl8g65LF3mSSnBV42UV7Pgctk6M4nROpPEWeBgNW
 zeP8mofNXNQNMZQHjxG09FPcnwZ82haVM3+RG9HCUS5qc9IEi/HcbNh4nrcUzbSE5HlK
 HfEoaquGvPj889oB9pLjzYgpMpyff+6a+u/6y183REqY/95+Ur/61JToJhgxVJauI33h
 F2Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVenLJ/AfgaYORqUW/KCA0aaims+e3aIHIGeM8ecpnzzWpOYE6XBk51hQTVJePidEqrjlG4XwHNh50=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzG+3hCOHzAQ9zjVqvH4jbTsVIgJG5mfffEWt4VXB7r/504N2b/
 OlM/iViQzZMSul78AN0QzWriXJppT6b1HpE1UW5cYEFlLXHUptKVBADk
X-Gm-Gg: ASbGncvrSZul4dIAMDwdmB4hmEtYlIW3jSZY4JVANdBcKLxQJe6ZMU7FYduiIWkdxwQ
 qbuKiQ8pDwQNg20XPcmM3w3NDqqyKzVDwdpCWDer+TSycO3NXCF2po+srdMiS69/551vIRtFzm0
 Y+TeQFrjXnR2CyowzeLOfRoX2i3S4+2RKG0QxwdbAb5BMOd6cz8l/UfMedXSMW7i7xMLuM6DIOx
 yHQ94Rll10J7uW3XPrrxlCYsGTtIvD+rRv62l4xvxhjR75Z+jclT5yAJy8shMwsfFkEGisVx74M
 PR0XcDNFNf+RP2A+OMGfrP98yDFtcPl69bFj8yllED1dnyDXObZypoy1DZce6ZWQfiRU4ww57VE
 zGLDdiVzJoD1GHeCUSaAjlgU=
X-Google-Smtp-Source: AGHT+IEZFsGwp0kL92yq64dCob62/5/Te5BujmP7PaehTnILj7OwdceaDPf5lu2ogbouVgnk8eNmNg==
X-Received: by 2002:a05:6a00:b47:b0:772:51f6:3518 with SMTP id
 d2e1a72fcca58-77251f65041mr25029357b3a.14.1757066546096; 
 Fri, 05 Sep 2025 03:02:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5133:5770:79e8:362b])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a269e9csm21898326b3a.17.2025.09.05.03.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:02:25 -0700 (PDT)
Date: Fri, 5 Sep 2025 03:02:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, 
 airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, 
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, 
 edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
 jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com,
 krzk+dt@kernel.org, 
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com,
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, 
 mchehab@kernel.org, minghsiu.tsai@mediatek.com, mripard@kernel.org, 
 p.zabel@pengutronix.de, pabeni@redhat.com, robh@kernel.org,
 sean.wang@kernel.org, 
 simona@ffwll.ch, support.opensource@diasemi.com, tiffany.lin@mediatek.com, 
 tzimmermann@suse.de, yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
Message-ID: <caguo7ud4dapb4yupeq2x4ocwoh4dt5nedwjsyuqsaratugcgz@ozajhsqwfzq6>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
 <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>
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

On Thu, Aug 21, 2025 at 01:56:24PM +0200, Linus Walleij wrote:
> Hi Ariel,
> 
> thanks for your patch!
> 
> On Wed, Aug 20, 2025 at 7:17 PM Ariel D'Alessandro
> <ariel.dalessandro@collabora.com> wrote:
> 
> > +  ce-gpios:
> > +    description: GPIO connected to the CE (chip enable) pin of the chip
> > +    maxItems: 1
> 
> Mention that this should always have the flag GPIO_ACTIVE_HIGH
> as this is required by the hardware.
> 
> Unfortunately we have no YAML syntax for enforcing flags :/

Theoretically there can be an inverter on the line, so from the AP point
of view the line is active low while from the peripheral POV the pin is
active high... 

Thanks.

-- 
Dmitry
