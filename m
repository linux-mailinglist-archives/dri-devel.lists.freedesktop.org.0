Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D3BB7383
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 16:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B166610E12F;
	Fri,  3 Oct 2025 14:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="jvY7NOxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7771310E12F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 14:42:56 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-637dbabdb32so4412815a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1759502575; x=1760107375; darn=lists.freedesktop.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SlNE36EJ5Kom/3DEY05rCkapMs77Y5jFnAKGd9Vbt6k=;
 b=jvY7NOxx/DgKd9dJrqpqZy5yLHspGxdhE0JhOMvVNjVbnJ0ZjX+Aodk4GNr+c0Hn4T
 bKB8MeXn9BFGkAienGFIY6l61ChKKm7I4fj8Sm0Iw6Bm4S8jjPZxVHiZUEA2Pinw5UP0
 dWBaL6VyvyH7/SQtgOFHfHaCrijsMrTkwp7U7kzCzZQ9CGel+ozfoxPHyEIVip4OXwRj
 FJLxeVYMudYIXkctmgMOF+aCYVJ9xuDf89RkYBGuzk5lIkFRhq7CyJy5oExvKnLBsKEo
 8uu9drVlmePvrwtFfHrIDyRnPtRl6uXqKJiYZz3KPIJbPiRxSIjfkaiqkAVitUXRralq
 GlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759502575; x=1760107375;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SlNE36EJ5Kom/3DEY05rCkapMs77Y5jFnAKGd9Vbt6k=;
 b=SIubHCNIRIK/5P8z5ue677EqsSzdiZAaKZSCP9yG0mYkKjwi3+W5sO/xrjBIN+nxqe
 Pop+rkWL7qQI8ehNNA7VDfSkmEZUxa0faHQWQKsWU07QJ6zEHQn1w2jhh3uEOw16HHD1
 5c31Dv1onGyqdTRBiAomMRdAJQZKWBqu8YPSrO5YH110lhviRuV268WBY/7xklRqlqgo
 EjSwXmXXUB+86z1xjgkbopmcyn0DnnMk9yjE8TjXUJv1FwVBFtPLvtilGkV/DYZziY30
 46Xb+hAXxl3YTIwWdguc5BHN9xyFuGIzif58ndlxp+YeXW82BgWlDmYBhaPzscJADftv
 uRaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1++NyNazKsafSWJNSfbcQTCazDEiHrLHIiBu/wNak91yKVhuNI0KqetVZKA54d+m1vMr5cJXFV+8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXo6+A3OE9ie2KEwX3slOU8izvPqav3HmPWYQBfHtzzbZo5vb8
 LImhtim7c39JUlTiq40P/A9glXK4G106niu8qL/dfFbTkiA0TTd90Zg0X5FTSPAL7fo=
X-Gm-Gg: ASbGncvWrgZBWNd4TAbtTYx/gQMZEe9bnHnEm38R6UbfHGHgHtOfNeBMLRzo0/O0z0V
 Fi7BtxEh6N5NKYnwTiMGwtyOyUsM3olWYV29Ky84HkY32a/bgcf+cSx74ntUjx/QpGmZVzghjL6
 EWkjyigO6Uc7gOTRxp2e6zBRduSpe2UpXKBOGORihU3azUfP+2vCat98yLZNbLLMo8kwExEqcgS
 YzklAGpo8ESDw+Q8AoXTawGOQ/BLSWvD4x0iE2DJzfHCKinMEzReAzysWIQRIPS6tOFQeAdsa/B
 5CV3S8bXuUDKYqaziLiSpgbrURDHrKmwTZrTLEh7qGCy4GikiVu2jSuqiiu8qr+oR3Os9QlE8+/
 LDQIxkdq5UE6b3EQh2Cc4kMTjf1Lnbh/Lh3JfEFscoLQodz7nGg9xAHCHtV/Rn9IFYt3GMxC99U
 a7KTyyDdcvkIrOFZomYKwR8176l6Q=
X-Google-Smtp-Source: AGHT+IGX8Mwauo0jMUzXRHaaKVWDDG9Q+j/DlBoCJbJpO1bZGiCPJWunCvR+Fi60aTitcRmnndjPYQ==
X-Received: by 2002:a05:6402:2230:b0:637:e361:f44b with SMTP id
 4fb4d7f45d1cf-639348cce60mr2774437a12.12.1759502574735; 
 Fri, 03 Oct 2025 07:42:54 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6376b3abcd7sm4152122a12.2.2025.10.03.07.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 07:42:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Oct 2025 16:42:53 +0200
Message-Id: <DD8RLVPWQQ7O.1B3E1P6VNMWV1@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jianfeng Liu" <liujianfeng1994@gmail.com>, <linux-arm-msm@vger.kernel.org>
Cc: "Xilin Wu" <sophon@radxa.com>, "Abhinav Kumar"
 <quic_abhinavk@quicinc.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Mark Brown" <broonie@kernel.org>,
 "Maxime Ripard" <mripard@kernel.org>, "Simona Vetter" <simona@ffwll.ch>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
In-Reply-To: <20250925040530.20731-1-liujianfeng1994@gmail.com>
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

Hi Jianfeng Liu,

On Thu Sep 25, 2025 at 6:05 AM CEST, Jianfeng Liu wrote:
> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> use msm_dp_audio_prepare instead. While userspace is still calling
> hw_params to do audio initialization, and we get the following errors:
>
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6ap=
m_lpass_dai_prepare() started
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6ap=
m_lpass_dai_prepare() started
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6ap=
m_lpass_dai_prepare() started
> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6ap=
m_lpass_dai_prepare() started
> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Fail=
ed to start APM port 104
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC=
 error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on M=
ultiMedia2 Playback
>
> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> hdmi-codec driver can work with userspace alsa.

This also fixes DP audio regression on qcm6490-fairphone-fp5 (using
Elite audio architecture)

[  133.986865] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 fa=
iled -110
[  133.986878] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: =
fail to start AFE port 68
[  133.986881] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: =
ASoC error (-110): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[  134.045112] qcom-q6afe aprsvc:service:4:4: cmd =3D 0x100e5 returned erro=
r =3D 0x9
[  134.045192] qcom-q6afe aprsvc:service:4:4: DSP returned error[9]
[  134.045214] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 fa=
iled -22
[  134.045231] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: =
fail to start AFE port 68
[  134.045243] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: =
ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5

And I guess, even though I reported it after this patch was sent:

Closes: https://lore.kernel.org/linux-arm-msm/DD8PK8AI24P7.YK0OGVYC0QFM@fai=
rphone.com/

Regards
Luca

>
> Tested with Radxa Dragon Q6A.
>
> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation=
")
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
>
> Changes in v2:
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-=
1-liujianfeng1994@gmail.com/
> - Use more detailed trace log in commit message.
> - Drop the empty line between Fixex and SoB.
>
>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_audio_helper.c
> index 7d78b02c1446..6ca1c7ad0632 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify=
);
> =20
>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops =3D {
>  	.audio_startup =3D drm_connector_hdmi_audio_startup,
> +	.hw_params =3D drm_connector_hdmi_audio_prepare,
>  	.prepare =3D drm_connector_hdmi_audio_prepare,
>  	.audio_shutdown =3D drm_connector_hdmi_audio_shutdown,
>  	.mute_stream =3D drm_connector_hdmi_audio_mute_stream,

