Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3B49FF159
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 19:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B0810E023;
	Tue, 31 Dec 2024 18:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="Dbl0s8Mg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F80E10E023
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 18:50:52 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2ee709715d9so10995945a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 10:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1735670992; x=1736275792;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kltap3Pv1hlN9UPAmHZET72hjTYvMQFRlhAGev33Mns=;
 b=Dbl0s8MgWJLKEiaIEhBrGJq/inywIYAtHC+HzBEpyrrXs4D9j+AVA1qw9lTtmXpnpF
 HuAXfsyOeKkCnzwWg9DYYFQxbRZDmthTpKAEfEksVAz+AM14BoGC+gSTqmE5ZCfdtvwD
 17pu8bfpu2cGHPyO/olZ8HxAwU5Qtsbs3upv9f/BjVWfz3VgN2GazcFI0x4NbGKAIbHA
 f2SPTAzqDrg1sGaxp0psZk9iNCTWpAxKaJd56a1t2ko3k9H/vft2pxpMjtSE3kEZWHfe
 rFU7hkPzItTC374ARp0mZGBg9vfSlcjrOg5zY84vfcCaR1OO+clunN8XWy2Q6R18RDo6
 IgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735670992; x=1736275792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kltap3Pv1hlN9UPAmHZET72hjTYvMQFRlhAGev33Mns=;
 b=ODv1a0R9+XqwTo0nSL6euvmW7v0XX7xYYp+awZOqV0enTJHZmhvzbm2Cp95NfsErAH
 6NQGVgrGPeC/bPZTPVSdPgVS+/Cd97na2WBfLT/jKr+SBeMH7pE31LszCVNPh8C6dvEY
 Bwo2E5WHNmZ+ApwlUKThZywCuXazm3BTHlDUwicuZoW6dzuxrHOgLWtslT1CicabCTZS
 S0DTZ+0CVxTjrU7AQz+n5wy15gQT4+VYNBvZULrTG0G01onTgMi0gtBK9BFujma1iPeU
 htD5cSYnBUnyn0YPV8FzdZ7pV7cnXRm/Eop0IR0U7r5axEJ1nRllWUuYM6HdUUsFCuNP
 1Mbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJhdYO526TJUYL1fF7jP5spw07uvAtzwI7NEZWbmN/Vgms2ak2KRIH7CtxUlO+fjhnUTLim+OaT9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7f0o7nIV8cwHvP60ky+19GL0PVZvQSRleqerTM5UOFNvUeMn0
 Pv0jepfUIno69cCtHaBPyWrMRKVair9a7fYrRVtsdst9TDpB46LZxJJu+VEpdfNLDYChCojPGo6
 1bcVZBZj1CFMCmANHjp7gWqNTG0E=
X-Gm-Gg: ASbGnctlQDG34EHNAsFjcsQ1NjN1EnHRf/C7ccOpv7tuWOHWCr+QE0B+8eyKuprIS0E
 /IWNjK3oGeeevbJ8Q97PSgW6m1HMCAJCe3oHJOl4LhLOGaCuwXgxbZqBF/MwH3D8keial1ks=
X-Google-Smtp-Source: AGHT+IG5FmkROQoSQHWr4cIegxX2It9OOsT8OUh7KWPdH7VQgx2qIDviezjcsQv6GTMSR51Q0h0ZJEqmX+Qz4Kpzuw4=
X-Received: by 2002:a17:90a:d645:b0:2ef:30ec:14c9 with SMTP id
 98e67ed59e1d1-2f452e4ad37mr57281196a91.18.1735670991720; Tue, 31 Dec 2024
 10:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
 <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>
 <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
In-Reply-To: <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 Dec 2024 19:49:40 +0100
Message-ID: <CAFBinCAh8iazDNx6GtOOJyXh_V-NfUs6Uf=ywN9kvQGPEmjrKQ@mail.gmail.com>
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

On Tue, Dec 31, 2024 at 3:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
[...]
> > I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and it
> > seems that there is only a single driver which uses the .prepare
> > callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem to
> > implement .hw_params instead.
>
> Yes. However .hw_params don't have access to the infoframe contents, so
> I had to settle on implementing .prepare.
While debugging I noticed something unrelated to my problem:
hdmi_codec_spdif_dai_ops does not implement .prepare().
FYI just in case someone wants to use your patches and feed the
hdmi-codec with SPDIF instead of I2S.

> >
> > The audio controller code for my platform is already upstream:
> > - sound/soc/meson/aiu-codec-ctrl.c
> > - sound/soc/meson/aiu-encoder-i2s.c
> > - sound/soc/meson/aiu-fifo-i2s.c
> >
> > My understanding is that you have a platform with a lontium-lt9611
> > HDMI controller available for testing. Can you please help me
> > investigate and find out which piece of code is calling
> > hdmi_codec_prepare() and therefore lt9611_hdmi_audio_prepare() on
> > your board?
>
> Sure, this is the call trace on my platform (Qualcomm SDM845,
> sdm845-db845c.dts):
>
> lt9611_hdmi_audio_prepare+0x1c/0xc0 (P)
> drm_bridge_connector_audio_prepare+0x2c/0x40 (L)
> drm_bridge_connector_audio_prepare+0x2c/0x40
> drm_connector_hdmi_audio_prepare+0x24/0x30
> hdmi_codec_prepare+0xec/0x144
> snd_soc_pcm_dai_prepare+0x78/0x10c
Thank you, this helps! snd_soc_pcm_dai_prepare() is where it breaks for me.
I suspect that it's an sound card issue on our platform, so I'm hoping
that Jerome (author of the Amlogic ASoC drivers) will help me debug
it: [0]


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/CAFBinCDdiJ3UNVUcShjq=3D7U2=3DoUw=
T3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com/
