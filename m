Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E929263C611
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 18:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9233210E059;
	Tue, 29 Nov 2022 17:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B1510E059
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 17:03:37 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-12c8312131fso17794903fac.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 09:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bAXWficdb5Gh5FzYn9UMAwDhZ8CYJoMoqCIJ7//eDF4=;
 b=ljTM73sTaDXWg3oaSywePDjqX298nSKxGHlaRqrv/LsDQrh3Mk9juSNxGkuzLumWxy
 /O1+AvGM4FAywdTpyxCQGuYt9iKWmSXYzMbOF8AqODsFHqIaEIKHAcDeYgoOxqm3Fr4o
 TBRSen1aQi9VAoZMPuBILu+kBDk8UQm+R3FRy3pdzsmnDkxBuftdOqpEmxAanK+Th54j
 b8OVtjKBlDakl7FEtLr3q1dHi6yezL2+/uByMQUdbFwTiXZVM3v9O0eFVdNSo9ZoknNt
 vw3QrBqFV9EaNlDr4769W5eAGUfmEToEGJFnua/uUW+Qw2+N1owsFPR77QI/qPD9Wf6L
 rAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bAXWficdb5Gh5FzYn9UMAwDhZ8CYJoMoqCIJ7//eDF4=;
 b=urVlqHNqJ5KN/1P1zI/MJ3cpRvzV8BYdPMxjcXbZsTub3U0odxsa9W+TbTRtxv7kgR
 MVHeJTidpde0YZq29At6snOb3ywcs/3/GeEdO2VdiVa4TtvZWsAfsGbvXnpBwlmEdfbo
 91FTiOd2KgSzdnsSGfPAV4X+AedxJhkffBTUsX9yTNlSiTdGCqU9v/93gqW8uhDuyWhR
 EktGvUTnisqNA6xnTrFHQ19GjimboDIWrI/3XDyDwDTbKHsjlxZMAJiUMLhqynHnNwld
 FsWLoGIxiW6FrymNvrIhvu69wuLmmpZ6YGek2PfbaqUJHLcw25kKZupEljShdZ4V25MW
 aThg==
X-Gm-Message-State: ANoB5plfRlX51/uTWMDcLYJ6o/IQiMGx46JpBXT5HZNkLcUp4sxglQnv
 VP/mpklf1KGA8fs3LFLiSnJJPqMbm052mmTaeW+4vQ==
X-Google-Smtp-Source: AA0mqf6Tdo6X8IWcObQq2o/3ErG6HPcwPrWCjYttmbMFTp3CWvG1wKOXHHCA+4UMzfOIMYG1UrxXlV2FAe3l3HjF3RI=
X-Received: by 2002:a05:6870:7988:b0:13c:84e6:96d2 with SMTP id
 he8-20020a056870798800b0013c84e696d2mr36802093oab.72.1669741416887; Tue, 29
 Nov 2022 09:03:36 -0800 (PST)
MIME-Version: 1.0
References: <20221124085436.24900-1-jiaxin.yu@mediatek.com>
 <20221124085436.24900-3-jiaxin.yu@mediatek.com>
In-Reply-To: <20221124085436.24900-3-jiaxin.yu@mediatek.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 29 Nov 2022 18:03:26 +0100
Message-ID: <CAG3jFyvLAHfxtKVoFFUOwUacO+t+FC3x5J9Eg-qWOUVBnU8JfQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: hdmi-codec: Add event handler for hdmi TX
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
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
Cc: neil.armstrong@linaro.org, alsa-devel@alsa-project.org,
 chunxu.li@mediatek.com, nfraprado@collabora.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, allen-kh.cheng@mediatek.com,
 ajye_huang@compal.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Nov 2022 at 09:54, Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> If the speaker and hdmi are connect to the same port of I2S,
> when try to switch to speaker playback, we will find that hdmi
> is always turned on automatically. The way of switching is
> through SOC_DAPM_PIN_SWITCH, however, such events can not be
> handled in hdmi-codec driver.
>
> So add event handler for hdmi TX to solve the above issue.
>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  include/sound/hdmi-codec.h    |  6 ++++++
>  sound/soc/codecs/hdmi-codec.c | 37 +++++++++++++++++++++++++++++++----
>  2 files changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
> index 48ad33aba393..dcbc09254144 100644
> --- a/include/sound/hdmi-codec.h
> +++ b/include/sound/hdmi-codec.h
> @@ -81,6 +81,12 @@ struct hdmi_codec_ops {
>                        struct hdmi_codec_daifmt *fmt,
>                        struct hdmi_codec_params *hparms);
>
> +       /*
> +        * PCM trigger callback.
> +        * Mandatory
> +        */
> +       int (*trigger)(struct device *dev, int cmd);
> +
>         /*
>          * Shuts down the audio stream.
>          * Mandatory
> diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
> index 0b1cdb2d6049..cb4479372e09 100644
> --- a/sound/soc/codecs/hdmi-codec.c
> +++ b/sound/soc/codecs/hdmi-codec.c
> @@ -276,7 +276,31 @@ struct hdmi_codec_priv {
>         u8 iec_status[AES_IEC958_STATUS_SIZE];
>  };
>
> +static int hdmi_tx_event(struct snd_soc_dapm_widget *w,
> +               struct snd_kcontrol *kcontrol, int event)

checkpatch --strict caught this alignment issue.

ASoC: hdmi-codec: Add event handler for hdmi TX
-:44: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#44: FILE: sound/soc/codecs/hdmi-codec.c:280:
+static int hdmi_tx_event(struct snd_soc_dapm_widget *w,
+        struct snd_kcontrol *kcontrol, int event)



> +{
> +       struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +       struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               if (hcp->hcd.ops->trigger)
> +                       hcp->hcd.ops->trigger(component->dev->parent, SNDRV_PCM_TRIGGER_START);
> +               break;
> +       case SND_SOC_DAPM_POST_PMD:
> +               if (hcp->hcd.ops->trigger)
> +                       hcp->hcd.ops->trigger(component->dev->parent, SNDRV_PCM_TRIGGER_STOP);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
>  static const struct snd_soc_dapm_widget hdmi_widgets[] = {
> +       SND_SOC_DAPM_OUT_DRV_E("SDB", SND_SOC_NOPM, 0, 0, NULL, 0, hdmi_tx_event,
> +                              SND_SOC_DAPM_POST_PMD | SND_SOC_DAPM_PRE_PMU),
>         SND_SOC_DAPM_OUTPUT("TX"),
>         SND_SOC_DAPM_OUTPUT("RX"),
>  };
> @@ -808,18 +832,23 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
>         struct hdmi_codec_daifmt *daifmt;
>         struct snd_soc_dapm_route route[] = {
>                 {
> -                       .sink = "TX",
> +                       .sink = dai->driver->capture.stream_name,
> +                       .source = "RX",
> +               },
> +               {
> +                       .sink = "SDB",
>                         .source = dai->driver->playback.stream_name,
>                 },
>                 {
> -                       .sink = dai->driver->capture.stream_name,
> -                       .source = "RX",
> +                       .sink = "TX",
> +                       .source = "SDB",
>                 },
> +
>         };
>         int ret;
>
>         dapm = snd_soc_component_get_dapm(dai->component);
> -       ret = snd_soc_dapm_add_routes(dapm, route, 2);
> +       ret = snd_soc_dapm_add_routes(dapm, route, ARRAY_SIZE(route));
>         if (ret)
>                 return ret;
>
> --
> 2.18.0
>
