Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9827C8AF6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 18:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C69810E61E;
	Fri, 13 Oct 2023 16:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB78410E61E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 16:27:02 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9be3b66f254so15657466b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 09:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1697214421; x=1697819221;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dDChyjARcHDkjDQPX6XB8cVwDI75Vj0OVvNyqfGNTb8=;
 b=F1GbXrreLT1/DksYknb+fqjm481Iu8mAKqg9CztDIqzWQ4zIHLhft70dpVrzUP4bSK
 UC0eiEkWnHwpuEqHxcoiBG3pOmg0agPnXH9pHs96T8a1+6TS7woXRTJYqImbMFnz+P2q
 vCxDVHotiyZn+xamhZ2+VpTIYzSHc+Bp2AIpJOk9NW+MiL76ql2k9FAzP6knqDxFkkDN
 zB8lUgHVsZKKTALGXKiiFn+yA7phD6/YpXRzkz7YAjJV19I2KyF+gLy4PwZc6VHvlSbd
 DqSqGQTwibudUfkZt+0e3K6b3GQrkuiQgGPYqa4VuNWlIFn6+NPEUvVUXM9YSV00dhkp
 G14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697214421; x=1697819221;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dDChyjARcHDkjDQPX6XB8cVwDI75Vj0OVvNyqfGNTb8=;
 b=iewt5PJVbU7Ng/BMLK4bFb+NnvQzNC3dJL91rKgXaUHsFsQA0K4dUc1q35xj4vPgYo
 dhXth3S4o84rwmoEQG7nuNLT9Vd5w35AqvgndMxvMbiGEyVxGN8GqnwqnU0IpQJhdzTy
 EmkbZnUGVRzmJ2MOCRLpK5LN9O48rxTAXiZLprJGQKoWQXAsMWGj7EmAZzHl0m9Zef/b
 E+S3AIK6zg98GF2mXJRE2cs2qOo0zilJCsVnmh8CpyzRy4YmA0Unzxtz3Zp3SuegO6z+
 hn070IZLMi1tM7ZH1sD3+SlD49ZvcXQ4r++5mPtPFbBYpZglGT5i4GYdBo6xRhHkIwp7
 nPaw==
X-Gm-Message-State: AOJu0YzzwBwBIRafmLaZynizEHdFs9QONcEz+Eqroz059PZBjSJMYjsc
 V61K0yQ/8sgMPwYe3SnXfprM3v7e13p3krqRM2zrpQ==
X-Google-Smtp-Source: AGHT+IH4mCWm8Z2elsfB5wPDuFnQnwc2DSuvszMcvKnLJwB6uCPWL0qpI196Srkb4PahcQqJyczrTAjD9wvlQcukgRA=
X-Received: by 2002:a17:907:74b:b0:9bd:bbc1:1c5f with SMTP id
 xc11-20020a170907074b00b009bdbbc11c5fmr1802252ejb.35.1697214421164; Fri, 13
 Oct 2023 09:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
 <20231006073831.10402-5-shawn.sung@mediatek.com>
In-Reply-To: <20231006073831.10402-5-shawn.sung@mediatek.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 13 Oct 2023 17:26:47 +0100
Message-ID: <CAPj87rMUbP12uwzyhV=94wR7LkQK4JfTB4kEMGADq2YJOk8Vrw@mail.gmail.com>
Subject: Re: [PATCH v7 04/23] dt-bindings: display: mediatek: padding: Add
 MT8188
To: Hsiao Chien Sung <shawn.sung@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Nancy . Lin" <nancy.lin@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Shawn,

On Fri, 6 Oct 2023 at 08:38, Hsiao Chien Sung <shawn.sung@mediatek.com> wrote:
> +  Padding provides ability to add pixels to width and height of a layer with
> +  specified colors. Due to hardware design, Mixer in VDOSYS1 requires
> +  width of a layer to be 2-pixel-align, or 4-pixel-align when ETHDR is enabled,
> +  we need Padding to deal with odd width.
> +  Please notice that even if the Padding is in bypass mode, settings in
> +  register must be cleared to 0, or undefined behaviors could happen.

If I understand the driver correctly, padding is automatically applied
to compensate for unaligned dimensions. The first/last rows/columns of
the overlay area will be filled with a specified colour (black?) to
preserve the area. This is unfortunately not OK to do transparently.
Userspace must be aware of this policy decision and specifically
request it. If not, the atomic request check should fail and tell
userspace that the requested configuration is not possible to achieve.

Cheers,
Daniel
