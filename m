Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D9A7FB065
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 04:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A6110E418;
	Tue, 28 Nov 2023 03:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE5810E418
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 03:17:33 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so6826429e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 19:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701141451; x=1701746251;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9wp5HnTgZ7ZLaUo9Q/M6nPjzjSUwa62T1Maa/se+gxo=;
 b=JNpJccKwgNmJraFv3lS6amjits7vqvVAK9O85qEYIEeLo9huaPtFEQEN4qz4gh5ACd
 7sHL2vsruub/+x3Bg6/O3sJdjLhp/majqTiYZb3haGD73+My4VApCoD9uHhJYK4/VGbP
 1rrk10AH3FzhEtUXiLzdrPaJSrFT9g7OKuU+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701141451; x=1701746251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9wp5HnTgZ7ZLaUo9Q/M6nPjzjSUwa62T1Maa/se+gxo=;
 b=m/rInmDYuJ1V3RiCyHze25+pfR2BHK4YNcaXHCga5EhDx7G2z+OjhH0k62TMFZOw4u
 h4E/IHLEqaIDVz6j5kqdkN0EqYIKk3MrIFunzyhUZqFfnCMmKoidsEMVx5SoiITVBqPG
 2SLW/ebu5H6UxJBK7VZrjyy68LPd22ZYDqdm13IvifE7oQ+dwpGhGHCcrEVlhYvI3rqb
 Di56hg6j6c+RlB6uU6dEUq8S3BfoXA+UJWio73zHW2eKwXynZtQPL5dm3N2KwBC+jmi7
 89YFV6FUQd5BgrKxjh0TieiQTmfS2BePlDQrHvX+qo6pnnoGUNKozXvfN1m5pHX8reVD
 jXkA==
X-Gm-Message-State: AOJu0YyRQ3gd3c3ki3QMl9EhsCKQ6vGcnyicvfpDujofrYKaX+uogqLc
 GpgNdk731YPqw7WYI5laoKQg1VODFfSN160/I+sK6w==
X-Google-Smtp-Source: AGHT+IGSvCVqHokq1V085rudx0pq9tIghj1AHgkp2YjyyUW/OKHrDERsAUTAxkQUm4r6WUQntkQt94tB1L8sdCreRbM=
X-Received: by 2002:a05:6512:3585:b0:500:d4d9:25b5 with SMTP id
 m5-20020a056512358500b00500d4d925b5mr7469216lfr.56.1701141451084; Mon, 27 Nov
 2023 19:17:31 -0800 (PST)
MIME-Version: 1.0
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-4-jiaxin.yu@mediatek.com>
 <c35ef2d8-ab40-484b-9a4c-38f2f3e7d99c@collabora.com>
In-Reply-To: <c35ef2d8-ab40-484b-9a4c-38f2f3e7d99c@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 28 Nov 2023 11:17:20 +0800
Message-ID: <CAGXv+5G2tP9i8VrUc6-xs2d72_nL9XH9iSCeixzA2AM7X5fXOQ@mail.gmail.com>
Subject: Re: [v3 3/3] drm/bridge: it6505: Add audio support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>
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
Cc: neil.armstrong@linaro.org, alsa-devel@alsa-project.org,
 chunxu.li@mediatek.com, nfraprado@collabora.com,
 kuninori.morimoto.gx@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, ajye_huang@compal.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org, allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 21, 2023 at 8:54=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 30/07/23 20:08, Jiaxin Yu ha scritto:
> > Add audio support for it6505
> >
> > 1. Bridge to hdmi-codec to support audio feature. At the same time,
> >     the function of automatically detecting audio is removed.
> > 2. It is observed that some DP-to-HDMI dongles will get into bad
> >     states if sending InfoFrame without audio data. Defer to enable
> >     it6505's audio feature when PCM triggers START or RESUME.
> >
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
>
> Hello Jiaxin,
> this patch doesn't apply anymore (and it won't build anymore) upstream.
>
> > ---
> >   drivers/gpu/drm/bridge/ite-it6505.c | 81 ++++++++++++++++++++++++++--=
-
> >   1 file changed, 75 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/brid=
ge/ite-it6505.c
> > index 504d51c42f79..1cfcb0731288 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -2162,7 +2162,6 @@ static void it6505_stop_link_train(struct it6505 =
*it6505)
> >
> >   static void it6505_link_train_ok(struct it6505 *it6505)
> >   {
> > -     struct device *dev =3D &it6505->client->dev;
>
> This is because this changed to `struct device *dev =3D it6505->dev;`
>
> >
> >       it6505->link_state =3D LINK_OK;
> >       /* disalbe mute enable avi info frame */
> > @@ -2170,11 +2169,6 @@ static void it6505_link_train_ok(struct it6505 *=
it6505)
> >       it6505_set_bits(it6505, REG_INFOFRAME_CTRL,
> >                       EN_VID_CTRL_PKT, EN_VID_CTRL_PKT);
> >
> > -     if (it6505_audio_input(it6505)) {
> > -             DRM_DEV_DEBUG_DRIVER(dev, "Enable audio!");
> > -             it6505_enable_audio(it6505);
> > -     }
> > -
> >       if (it6505->hdcp_desired)
> >               it6505_start_hdcp(it6505);
> >   }
> > @@ -2846,6 +2840,45 @@ static void __maybe_unused it6505_audio_shutdown=
(struct device *dev, void *data)
> >               it6505_disable_audio(it6505);
> >   }
> >
> > +static int it6505_audio_hw_params(struct device *dev, void *data,
> > +                               struct hdmi_codec_daifmt *daifmt,
> > +                               struct hdmi_codec_params *params)
> > +{
> > +     struct it6505 *it6505 =3D dev_get_drvdata(dev);
> > +
> > +     return it6505_audio_setup_hw_params(it6505, params);
> > +}
> > +
> > +static int it6505_audio_setup_trigger(struct it6505 *it6505, int cmd)
> > +{
> > +     struct device *dev =3D &it6505->client->dev;
>
> ...and because you'll have to change this one, and other occurrences of t=
hat
> as well.
>
> Can you please respin this series?

Please also add a patch adding #sound-dai-cells to the it6505 binding.
