Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259FC6AD164
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 23:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F30010E41D;
	Mon,  6 Mar 2023 22:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C04110E41D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 22:19:20 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-536be69eadfso211328497b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 14:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678141159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BIwy9GGWWk7FRheyk7kQvNm+28TrmRYb7v9Ze4E4qE4=;
 b=ICZbYBbMVaIDZmAFB6H5iCrhGOEY35M31GUKkKobfQ8xltOrmn8D7FBBCOITMcflZS
 tG44B2qro/h5+lzF6tMxsW8eAPNd9g34RzZohr48LOpkOe65wBRX5KoI/Ijr40eZ47u0
 hg9LCHTphHBINZkB8S5Stwn7tdrs6yBXkgkm5ESSb9puGdqGNkOVYFJ7AlZ5nH8WM/BX
 VLXoEQKY4rimQFW9XQI71Ag9FOrsXPDGATyku/a5MWV099Hb/BvLMCqc0tbzZW/EPoo/
 JYcXWDx5G47YQPkidEUVePtZhKEOq7OFI76H8ngB+J188eN8H6kWVzpgqs5QTDJcNVaE
 PWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678141159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIwy9GGWWk7FRheyk7kQvNm+28TrmRYb7v9Ze4E4qE4=;
 b=LsH1DvmBXXF6PiYBSFrAUoBIvpfInMFoEaxGSRxL/6FWl4tiZq5xEJkVtu2yg7RxZL
 xVgrQGlV9XYs8JhyNudnq/qN3mS7YyJGdfIl1X9pf4HnCcYUZM+DOLLUZqB//vyZc3FW
 sK0mWkiELRf9ZF03gG6nruunp3uOwZfecDrWcBsAZHYNa+Ve5y0KT1+EYt45PecXXdnd
 KSEL5Xf5vRv/6L/dvZSt+NoHNn6vJZkAO12ylslTpxC5OmUN0CkjBiOzq2QhZsM2YcD8
 Lrl+fczoyxFW1FBrFP9+scxHHSKEzhnLdzrniboZB/hTVJ2MDCls4io/0v2dBPHhtoSD
 YHFw==
X-Gm-Message-State: AO0yUKVVeiqjF+gKgAN8F4IAejO0SB5wJknDNKulSjHLa9674s7XipYa
 ymSuqvln+B95jyAmii5i0jy3UOBJgupw8DAnVscsSg==
X-Google-Smtp-Source: AK7set+FEBHOTN7jH6jw+W4M/INkl80XRa4XzqDzPxdd9YGD5yqFWOonMchaUl4aHKnjh/2xQeNLpP3z0RkBrl7WU5s=
X-Received: by 2002:a81:b705:0:b0:535:fe26:acc with SMTP id
 v5-20020a81b705000000b00535fe260accmr7785857ywh.10.1678141159600; Mon, 06 Mar
 2023 14:19:19 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-21-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-21-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 23:19:08 +0100
Message-ID: <CACRpkdYS54Svj=B-NfrjX+kBDYw5e9Jyt70L0tr_iX5+mVYK4A@mail.gmail.com>
Subject: Re: [PATCH 20/22] drm/tve200: Use GEM DMA fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-aspeed@lists.ozlabs.org, edmund.j.dea@intel.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, anitha.chrisanthus@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 samuel@sholland.org, javierm@redhat.com, jernej.skrabec@gmail.com,
 linux-imx@nxp.com, alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev,
 raphael.gallais-pou@foss.st.com, martin.blumenstingl@googlemail.com,
 s.hauer@pengutronix.de, laurentiu.palcu@oss.nxp.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, hyun.kwon@xilinx.com, tomba@kernel.org,
 andrew@aj.id.au, jyri.sarha@iki.fi, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, kernel@pengutronix.de, khilman@baylibre.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 1, 2023 at 4:31=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

That sounds neat:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
