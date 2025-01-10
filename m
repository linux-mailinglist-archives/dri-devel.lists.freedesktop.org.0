Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F3A08C3B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 10:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8985510E4ED;
	Fri, 10 Jan 2025 09:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q8WzfWta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E23B10E4ED
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 09:35:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so978476f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 01:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736501745; x=1737106545; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t9g79eEr03zcR3C0me3t/ZaJgbQfeT6rUS/5evYzFcY=;
 b=Q8WzfWtaEfZYHGPLo3HsLFS7Nlz1TH03b5/23gS0ZzvIPfdC+qEMTgKk76Nsy03gfA
 Tm704fKIbH4XuTn5OByyZ7Mq6aIrNcRaFCYGJsXw6vWgJZivA1v5+dxZDA4kWAu+vdMV
 BGPqWcaPrA5v8GlPY2MnG74ajvb53Ucv8iZaacVWf0BaHdIn0QvJOGDPgV9TCD+Q4vCk
 oeid/n+V5bkXNR9cnq/tCrjH6+AB99CI50XnZe86Vkmg51mq+/1NRLoEnBzV5MvqGIIm
 q3iEhvSbdWUZKhm2P8fwY48oxuizpDi/i/iQpSENKe1pXbn83nfO+J9xXT5K6iUlEjcI
 W/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736501745; x=1737106545;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t9g79eEr03zcR3C0me3t/ZaJgbQfeT6rUS/5evYzFcY=;
 b=fkv4gsQZEkylYxr76BlgMXPab/NyR/A9HVkdmlTvEwGvjCGc0h6fRECFNK/Z5LtYO3
 alNr309zPLu6A+2ft9E0ATbtRk6kzj8Vv6H6T7hJOyaoVoeqolEho4tV+NCbi9WIQqp5
 W3jt8H96yiQDL/oDb28bCmcwURBhky4RxJYgg9u0OWUguUGsKovyKSz18X4lu+6Pq5GH
 m8eIgPqVJfYrIZ+kVUBA8NMGEOVxnj5gknWfXx3bcR1Ym1mmlAOiKKvX7ZG4QLN4K7JT
 6aXqbFWhIXZENOsgHJQc3swz6HzDtQqkOivzhiSZ7HygFUR+Snj1cqAF/49aUIpd7XWf
 vJWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJukqth9qCWMokA9l2M13ToQGaJcUL5uv4J2RzuZzOvKO5/yF+AClvAcNgl1gpC5AkqPj6x6FxCXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw44gBKLfbw/hM5lHGEkOeeEsBmCWDgbFb2KGNfveap2ys1HRMc
 w9agyTLv957sPd7DHoPvIClje11ayITeSSXNOU6HtcKguTzh8vU7xkgN2Wwo
X-Gm-Gg: ASbGnctHROr+usDoP6wvroiaK5MgRIOtrdhOzoJWRrGdhrj9RQFTUnCh9mRL7VsS23I
 iGOP3rYaTn3phNoc3NCRDJ4/BJ7C9iWrXcTfPm1NOfH6HTrBKQA/qhRtcoGcCZe07iWVOxNG4zR
 L57qyc3CNSDFvAMsoAS2zCkOM6MBsan9XBrq+9b57HflDeqQiY8QvLB/WnrRvDJFC+jY7+pcorp
 JVao+xG4Zim7fONcalMmD3De7h+2grbAO3RwnTQsGQLfEZO7dDsb+mrewiDhPQUJF79IuxzOoJs
 FEM=
X-Google-Smtp-Source: AGHT+IHwl7RTDk7XCHgavjvPYzyw0+x62aQxSFel0BV13NUnPSIe70GA9HfWuDf9a/COfDkzjSeDxQ==
X-Received: by 2002:a5d:6c66:0:b0:38a:4184:151a with SMTP id
 ffacd0b85a97d-38a87336d7emr8612113f8f.37.1736501745179; 
 Fri, 10 Jan 2025 01:35:45 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38c990sm4084563f8f.56.2025.01.10.01.35.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jan 2025 01:35:44 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250110-flat-quantum-frigatebird-2432f1@houat>
Date: Fri, 10 Jan 2025 13:35:30 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <048FF805-BF7E-4D1B-B522-E783415057BD@gmail.com>
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
 <20250110074458.3624094-3-christianshewitt@gmail.com>
 <20250110-flat-quantum-frigatebird-2432f1@houat>
To: Maxime Ripard <mripard@kernel.org>
X-Mailer: Apple Mail (2.3826.200.121)
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

> On 10 Jan 2025, at 12:36=E2=80=AFpm, Maxime Ripard =
<mripard@kernel.org> wrote:
>=20
> Hi,
>=20
> On Fri, Jan 10, 2025 at 07:44:58AM +0000, Christian Hewitt wrote:
>> Playing YUV420 @ 59.94 media causes HDMI output to lose sync
>> with a fatal error reported:
>>=20
>> [   89.610280] Fatal Error, invalid HDMI vclk freq 593406
>>=20
>> In meson_encoder_hdmi_set_vclk the initial vclk_freq value is
>> 593407 but YUV420 modes halve the value to 296703.5 and this
>> is stored as int which loses precision by rounding down to
>> 296703. The rounded value is later doubled to 593406 and then
>> meson_encoder_hdmi_set_vclk sets an invalid vclk_freq value
>> and the error triggers during meson_vlkc_setup validation.
>>=20
>> Fix precision in meson_encoder_hdmi_set_vclk by switching to
>> unsigned long long KHz values instead of int MHz. As values
>> for phy_freq are now more accurate we also need to handle an
>> additional match scenario in meson_vclk_setup.
>>=20
>> Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>> drivers/gpu/drm/meson/meson_encoder_hdmi.c | 42 =
+++++++++++-----------
>> drivers/gpu/drm/meson/meson_vclk.c         |  3 +-
>> 2 files changed, 23 insertions(+), 22 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c =
b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> index 0593a1cde906..fa37cf975992 100644
>> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> @@ -70,12 +70,12 @@ static void meson_encoder_hdmi_set_vclk(struct =
meson_encoder_hdmi *encoder_hdmi,
>> {
>> struct meson_drm *priv =3D encoder_hdmi->priv;
>> int vic =3D drm_match_cea_mode(mode);
>> - unsigned int phy_freq;
>> - unsigned int vclk_freq;
>> - unsigned int venc_freq;
>> - unsigned int hdmi_freq;
>> + unsigned long long vclk_freq;
>> + unsigned long long phy_freq;
>> + unsigned long long venc_freq;
>> + unsigned long long hdmi_freq;
>>=20
>> - vclk_freq =3D mode->clock;
>> + vclk_freq =3D mode->clock * 1000ULL;
>=20
> You should be using drm_hdmi_compute_mode_clock() here

Hello Maxime,

If we=E2=80=99re talking a one-two line change than I=E2=80=99d like =
pointers
and guidance on how to go about that (offline to avoid group
noise). I have only rudimentary c skills though, so anything
that looks like replumbing a driver around drm_connector is
way beyond my current drm code and general coding knowledge;
I can only offer a fix not a proper improvement :(

Christian

> /* For 420, pixel clock is half unlike venc clock */
>> if (encoder_hdmi->output_bus_fmt =3D=3D MEDIA_BUS_FMT_UYYVYY8_0_5X24)
>> @@ -85,8 +85,9 @@ static void meson_encoder_hdmi_set_vclk(struct =
meson_encoder_hdmi *encoder_hdmi,
>> phy_freq =3D vclk_freq * 10;
>>=20
>> if (!vic) {
>> - meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq,
>> -  vclk_freq, vclk_freq, vclk_freq, false);
>> + meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq / 1000ULL,
>> +  vclk_freq / 1000ULL, vclk_freq / 1000ULL,
>> +  vclk_freq / 1000ULL, false);
>> return;
>> }
>>=20
>> @@ -107,12 +108,9 @@ static void meson_encoder_hdmi_set_vclk(struct =
meson_encoder_hdmi *encoder_hdmi,
>> if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>> venc_freq /=3D 2;
>>=20
>> - dev_dbg(priv->dev, "vclk:%d phy=3D%d venc=3D%d hdmi=3D%d =
enci=3D%d\n",
>> - phy_freq, vclk_freq, venc_freq, hdmi_freq,
>> - priv->venc.hdmi_use_enci);
>> -
>> - meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq, vclk_freq,
>> -  venc_freq, hdmi_freq, priv->venc.hdmi_use_enci);
>> + meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq / 1000ULL,
>> +  vclk_freq / 1000ULL, venc_freq / 1000ULL, hdmi_freq / 1000ULL,
>> +  priv->venc.hdmi_use_enci);
>> }
>>=20
>> static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct =
drm_bridge *bridge,
>> @@ -122,10 +120,10 @@ static enum drm_mode_status =
meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
>> struct meson_encoder_hdmi *encoder_hdmi =3D =
bridge_to_meson_encoder_hdmi(bridge);
>> struct meson_drm *priv =3D encoder_hdmi->priv;
>> bool is_hdmi2_sink =3D display_info->hdmi.scdc.supported;
>> - unsigned int phy_freq;
>> - unsigned int vclk_freq;
>> - unsigned int venc_freq;
>> - unsigned int hdmi_freq;
>> + unsigned long long vclk_freq;
>> + unsigned long long phy_freq;
>> + unsigned long long venc_freq;
>> + unsigned long long hdmi_freq;
>> int vic =3D drm_match_cea_mode(mode);
>> enum drm_mode_status status;
>>=20
>> @@ -149,7 +147,7 @@ static enum drm_mode_status =
meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
>> } else if (!meson_venc_hdmi_supported_vic(vic))
>> return MODE_BAD;
>>=20
>> - vclk_freq =3D mode->clock;
>> + vclk_freq =3D mode->clock * 1000ULL;
>=20
> And here too.
>=20
> Maxime


