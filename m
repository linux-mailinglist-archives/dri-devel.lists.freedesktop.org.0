Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED94A01A9D
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2025 17:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D320B10E088;
	Sun,  5 Jan 2025 16:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="gok+39u+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEEE10E088
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2025 16:34:52 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-860f0e91121so7647792241.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 08:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1736094832; x=1736699632;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hbu7641CeG8xNiROLSccwQDpo4bojGzR/nTssY8hmOI=;
 b=gok+39u+st6VvsO6g9BhO6VHCTcaShQJ7R8gTJDB+jDCalGQFcdMXp0AW+WD/SOcD7
 bDQRQ+q/ZWoR2epI9LE/7DJB1NZq0Yspp9vLrb0U7hl69ezg7n2gt/khr3QiFQls6k44
 7dpBdg2ENuTCtrRF/UTrgwsm6n++DwWwHsp8loAh9QuTqECZ7EyNdQMzU0tdKhxQrQ0i
 aoTE7frokWmsIcpwT8A5i5dRqykzIVFVM/oiPAoq7ElQHzTG3ovFBfvFClpNdl/LMA1B
 aCw5+LbdHvCYtz7s6xFyt244ScTZs7++KPQUx4aYZtLCRVZN33mgSPHBJC9zI3ooyNPG
 z9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736094832; x=1736699632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hbu7641CeG8xNiROLSccwQDpo4bojGzR/nTssY8hmOI=;
 b=cYaFLMSiT0kchVKoLqiZFmGWZRAUpUgF6gTLjkBS2i8JA+4PkNmFb+CdFLpv1r6ELE
 hFDxfJAlMbIgRSrZL5a+swBTEQMLWsAhbSS5ZemQw8sydMxo3FK9s55DE6VCppjbweko
 sbzdrVLe2adaPrRDQahniY5qvUcYnK46xyxX6dxtVw0hrH6NK4YEyIyxQfuO4Rge4xL/
 YxiHT1rrZiguG3wrGS4fVEfI/+T+UzI2WGzYDLHSkZrLEI57YfLNjsBvSU72vIvhMp3c
 x6LuHAhWssuA4s1LML5rSWhbAyr0hY1vTMrDMQ1PyuwmLgl/3p5A4lkMRXj2QawzhSA2
 wqjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVayldP46YgGq5KBNRKUunJSqOa3++W3mcG2cr1efqtYACopmZgF4MCRg9RuXPTvjEI12+Hap7Wtg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgG2fVUHtbZHwLEluxK4MP+C0X5fNImI5o8ve7M5Ig5efmQ61p
 qe5noM4GjoI3JBmILVrwlrFusFTIE2BvwcUoOkJkbR2oBI/i63v3HNk0uO4TZfu49MKeCOLoW9c
 r0WgwsuANiRV0NS0Vt9OPaGkujsc0Bv4r
X-Gm-Gg: ASbGncuDh027OLQR4FZNzoUCjxYJzt7B0LItaZVIl0XKqYLHUMJQ4vUq0cKDFRFcNWD
 BwKn0jTCjd40eCFb0ZGnwOJdI49/HKSuFdleOIHL8loiVteC8cEXY
X-Google-Smtp-Source: AGHT+IFvM6SBJtTLap+Q+DAFUbWc5zkuC4KMXDzaQJdqhN7s7+4kdqDXZd2/wUV9q/FU9iZ8tCHqn6eI4aaM7ptY90Q=
X-Received: by 2002:a17:90b:2545:b0:2e2:c2b0:d03e with SMTP id
 98e67ed59e1d1-2f453633e61mr74488893a91.5.1736094354238; Sun, 05 Jan 2025
 08:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
 <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>
 <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
 <CAFBinCAh8iazDNx6GtOOJyXh_V-NfUs6Uf=ywN9kvQGPEmjrKQ@mail.gmail.com>
 <x73a2utr5sp4iffk5626zqfth4ayu3x4jkxd7xwjti7ehrgnzi@ploxx4i5db5h>
In-Reply-To: <x73a2utr5sp4iffk5626zqfth4ayu3x4jkxd7xwjti7ehrgnzi@ploxx4i5db5h>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Jan 2025 17:25:43 +0100
Message-ID: <CAFBinCBstfDa966+5wKLFdQNhnjW+d5Mpj=x3BDY+R5nHNnKLQ@mail.gmail.com>
Subject: Re: [PATCH v10 03/10] drm/connector: implement generic HDMI audio
 helpers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 alain.volmat@foss.st.com, alim.akhtar@samsung.com, andrzej.hajda@intel.com, 
 andy.yan@rock-chips.com, angelogioacchino.delregno@collabora.com, 
 broonie@kernel.org, chunkuang.hu@kernel.org, dave.stevenson@raspberrypi.com, 
 dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com, 
 inki.dae@samsung.com, jani.nikula@linux.intel.com, jernej.skrabec@gmail.com, 
 jonas@kwiboo.se, kernel-list@raspberrypi.com, krzk@kernel.org, 
 kyungmin.park@samsung.com, lgirdwood@gmail.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com, 
 matthias.bgg@gmail.com, mcanal@igalia.com, mripard@kernel.org, 
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, perex@perex.cz, 
 ple@baylibre.com, rfoss@kernel.org, rgallaispou@gmail.com, simona@ffwll.ch, 
 sw0312.kim@samsung.com, tiwai@suse.com, tzimmermann@suse.de
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

On Fri, Jan 3, 2025 at 1:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Dec 31, 2024 at 07:49:40PM +0100, Martin Blumenstingl wrote:
> > On Tue, Dec 31, 2024 at 3:34=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > [...]
> > > > I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and i=
t
> > > > seems that there is only a single driver which uses the .prepare
> > > > callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem t=
o
> > > > implement .hw_params instead.
> > >
> > > Yes. However .hw_params don't have access to the infoframe contents, =
so
> > > I had to settle on implementing .prepare.
> > While debugging I noticed something unrelated to my problem:
> > hdmi_codec_spdif_dai_ops does not implement .prepare().
> > FYI just in case someone wants to use your patches and feed the
> > hdmi-codec with SPDIF instead of I2S.
>
> Could you please send submit a patch to the hdmi-codec driver?
Sure, see [0]


[0] https://lore.kernel.org/linux-sound/20250105162407.30870-1-martin.blume=
nstingl@googlemail.com/T/#u
