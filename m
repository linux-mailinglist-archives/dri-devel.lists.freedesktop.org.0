Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF67B1073D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 12:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F30410E914;
	Thu, 24 Jul 2025 10:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fUrFtZZx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7C410E914
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 10:02:13 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-558facbc19cso644231e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753351332; x=1753956132;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=;
 b=fUrFtZZxcUrj/f7atU9ISXfsoxBksOVN88j41mcF5Pdh1u2cbHC67D0R6B+3rsiBTo
 eKL/D2Ug4qhSd1s6w3YApuJH1mjt8+3O/O0pF8oLrE5gHPKFACYBQWd+nMprtw0We1fI
 9Ogk3GohuxI1VMK1HJa1FNVSAQ5Kto0lINo04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753351332; x=1753956132;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=;
 b=SmdChY4rjUKpO7DpTFXy42O2djPdC2Vse9y20WPTQCI+QLBTEcnX3rVipNpUZAtLcQ
 SqiwIC20cd3gKrCbxpOc3HLVKbBBzIrBCJ6zTrDXd2ewcbmpTPZWp+1zi79GZdYEcd2z
 QhJnbwOKAvIW5Eud2r0aT8gZHBCGBW0YGL8okuWI+WZwf42obNr13tTiBSGe0M0BLAWm
 8C5Bm8i+EfgG/wqNIyqt3m3j0zSBlxvytfOFEHDqxgIoyrXtzdy5CxigmhNc5itC//DP
 uH0yBJK1M0ycxrsZk9P20axGp6RqCz5dC8LLK9DJVfmnLP3Y1ghwLg5o5bJvbzaP/BO7
 vbTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL3hoCqlrkQckZWHc/Up5FN6TA2XP3gDVkUS9KZQVNthLZEJImxbCzAsYnPy+r9zbPSWGttGgJKiA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxrb6L0o0vVc9flJKljefj5m4KkuiYVqE3Mr7V16EvhfmX7DtEO
 MKOvL0IUPHAgwpUG3gGK1jD0oiFjSDCwhsf98FnLWy/0kbUXEowEmsJ7vdbVnot9czZaWLy5GVY
 zehi2BVLvRNUH+6aZgYM9TXxjUB92BRUW5etZawDH
X-Gm-Gg: ASbGnct2va7s7CiBcR4Et4ZcgxTQl7HZUe5Ds9gUSi+btdb0kS5cArPKgfmZ7NRs8CB
 ubjEvgTg1p3L6XPMuFhdyKv0ZycO1gEZZYNBMczYzKus1/f/mOoi0A0wXpzTkKU+UdTc9jcXPzb
 N+FfurDlBvw/69tjWUc5Tco+zYnnloj0OeCTd2MN6LsrYIJowGq8a3xebi0lABX6dyFNnJvHQEk
 7IjVR+ey5aLTObK+Lb6uNAvi5h0NmD862o=
X-Google-Smtp-Source: AGHT+IESUy0W5d8sN6DOxHQC9VYSfHke7csoBbtn4oiuNMESAIIOLfvRI9EoIcZqqzK+oAmlqA1BtKODIpYwZl1nk3k=
X-Received: by 2002:a05:6512:b06:b0:55a:4b25:b33b with SMTP id
 2adb3069b0e04-55a513879f4mr2300615e87.15.1753351331794; Thu, 24 Jul 2025
 03:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-36-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 18:02:00 +0800
X-Gm-Features: Ac12FXxwmEtskk9yW4VS4U_sXrqKN7rxCsdJIjp0VaKRTEqFbUzw8Bs63nu9Nbw
Message-ID: <CAGXv+5Gar47gRZoT6DUDpPRabjzoSE==Zi0wrR76A7g-SJL1=A@mail.gmail.com>
Subject: Re: [PATCH 35/38] arm64: dts: mediatek: mt8195-cherry: Move
 VBAT-supply to Tomato R1/R2
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
 herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
 mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
 andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
 ck.hu@mediatek.com, houlong.wei@mediatek.com, 
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
 olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
 arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
 frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 24, 2025 at 4:41=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Move the VBAT supply to mt8195-cherry-tomato-{r1,r2} as this power
> supply is named like that only for the Realtek RT5682i codec.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
