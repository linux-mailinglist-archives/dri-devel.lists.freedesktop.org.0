Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A80B9D4EF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 05:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE2A10E264;
	Thu, 25 Sep 2025 03:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R2Tjy9W4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB23110E264
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:23:59 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-26e81c17d60so1039525ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 20:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758770639; x=1759375439; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ALtdxioioVUPdZ249fa6+reQMnKejsflkFYaDtWyvw=;
 b=R2Tjy9W4LB4VdhwauxJOvMSEh4i3oxZlpP05H8jr0z92qFg+BgWR2BHkchJhFaWJJt
 7iATSRHoLmu33yYoKosvfSqI6ckUX1G/b1Q+3EQMtrBlKvXMl4EYBp3Ul9JhueZ1t+WR
 +P4GpnDEHTdg4KzZMw8BirzWt/rIwLO9g+QPWMmUt3pOIZLVNNPvTzJRhFeNVWjMR0ck
 ej/sLMkaOv7UXZp1mlghzY3SNMk71+Hly6W+eHWVH2vi8G1Vv+PZJueaEzp8R0N7Rmab
 gLCUCfhakdxX4dsAh858SdyPDVOZTyamOkzlGIkYn0jb3Dm6lN5nRTEZ4tgcjRJ4CEfZ
 +hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758770639; x=1759375439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ALtdxioioVUPdZ249fa6+reQMnKejsflkFYaDtWyvw=;
 b=CoAtc5aoYgvljZPXogV06j9wN3rVrWH5jCCgCHYcwRXyBZ8zfpi/sSPuU60mTJkL/1
 Hyg5CMtjrLwTS03cjXjE9/qo/TKQC1vZl67ws4bKcYKQuOPWtQdC28nEDhUhn6Uf2Tvm
 HFsT/BdFTjISGqMIksE29Rj7eX9BlJPV/JMhk013aPJeke9tYASj0c3KuroljGxvOAgA
 Og2s1xLm+lDyGc0Hl/fbXGmqBnXt4F6eTWhvJKQ+dK5L1IpBhL8KB101skdZvyYGkPUk
 ycNd5zC1cP59GxON8vA7W5V2ML/hD3aWshJFthwtPSshLJK+w381tdCMmk2rsoFi5PaK
 Zhmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVkkq5LMPWJRNc3LoKHAExeoRI+fLtkU2yy9KlaGkxy5SYQlDPEAZ9Ql3nzh0mMKyDWBRDqXdnbZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoQPBov9yi3m/IkTJtCfD5QoNhZuyzpEL3AR2AisJh89HSz9E6
 KvVGLd2YcE4RuZDa79xoo5KnI7HESL0zPselbeDGukJfUTc3ceOHjbAs
X-Gm-Gg: ASbGnctXCyc6CQXXr39HX6w1MGLy8K/FG1Kmv+0DoQvjV/iHX2CvfQPDL320KkGHUD0
 bJoPreNF7zKtua2LLeO4qXyGibJJg4h65PueG9S3nyrsUZstaeRFn8s4pGYtGPLPl3gcTpKwTfE
 YvWqvqQh2SY0DV/nRxxa3dJxCP+qEu56KddkE5jBXLV2l9FgZJVgT1EGC0cdmsqwyjFRCg1dppZ
 NfLdopEWkt8obbRNed+qASTxhVC1n1zJ7Mb4oCzvr3DPjm510WBksXSPDj6/LI87wVMf/Wljcby
 XX0m1I71lp2uqth40ich9iBjT+OYHajn0otpP+n9E3KHxKGqtoqj4U+UbpUVEtca9DwyJ8RB5ZO
 74aYFKnjaPazGGdqDq+5pbHs=
X-Google-Smtp-Source: AGHT+IExiuoke1BO1yKig9GT9/NXxGRxhsCiCsu8+WVeI+rNb6cIW7R9xXIvDy8Jo/2hG/yxkf2Ddw==
X-Received: by 2002:a17:902:f551:b0:274:506d:7fe5 with SMTP id
 d9443c01a7336-27ed4a17347mr12353165ad.4.1758770639109; 
 Wed, 24 Sep 2025 20:23:59 -0700 (PDT)
Received: from rock-5b.. ([45.32.55.39]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a3cab8fsm503548a91.1.2025.09.24.20.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 20:23:58 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: airlied@gmail.com, broonie@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 liujianfeng1994@gmail.com, lumag@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 quic_abhinavk@quicinc.com, simona@ffwll.ch, sophon@radxa.com,
 tzimmermann@suse.de
Subject: Re: [PATCH] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Date: Thu, 25 Sep 2025 11:23:38 +0800
Message-ID: <20250925032338.20243-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5au5p32oyouifgmqlnl7unm6n7tbxq45wpwpqx57xoepiucmxw@tjqlbh2a57yk>
References: <5au5p32oyouifgmqlnl7unm6n7tbxq45wpwpqx57xoepiucmxw@tjqlbh2a57yk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

On Thu, 25 Sep 2025 06:08:58 +0300, Dmitry Baryshkov wrote:
>> [   14.055198] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>> [   14.067225] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>> [   14.089925] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>> [   14.105988] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
>> [   14.106027] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>> [   14.122707] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started
>
>From this log I don't see, why the function would fail in the way you've
>described. Could you please post (for comparison) a trace log without
>your patch?

Here is the trace log without mu patch:

[   14.093437] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.105285] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.127546] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.144819] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   14.144855] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.652233] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[   14.659556] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[   14.666326] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[   14.677484] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[   14.690897]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
[   14.699779] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/a660_gmu.bin from new location
[   14.702160] [drm] Loaded GMU firmware v3.1.10
[   14.714573] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   14.721910] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   14.721923] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   15.231216] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[   15.238577] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[   15.245323] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[   15.256528] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[   15.269943]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
[   15.279988] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   15.279997] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   15.785610] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[   15.792908] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[   15.799687] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[   15.811261] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[   15.825865]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
[   15.843283] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   15.843300] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   15.991449] rfkill: input handler disabled
[   16.349109] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[   16.356529] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[   16.363279] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[   16.374539] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[   16.388835]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
[   16.399355] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   16.399371] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   16.905665] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[   16.913032] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[   16.919837] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[   16.931141] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[   16.946106]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
[   16.958230] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   16.958242] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   17.464922] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[   17.472219] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[   17.478985] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[   17.490126] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[   17.503539]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
[   17.513599] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   17.513606] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   18.019162] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[   18.026682] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[   18.033427] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[   18.044729] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[   18.058144]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
[   18.068168] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   18.068176] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   18.574028] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[   18.581321] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[   18.588086] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[   18.599667] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[   18.613127]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
[   18.646419] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   18.646443] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   19.152583] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[   19.160139] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[   19.166909] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[   19.178407] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[   19.191821]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
[   19.222661] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   19.222678] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   19.730557] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[   19.738156] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[   19.744933] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[   19.756633] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[   19.770042]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
[   19.789888] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   19.799242] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   19.799252] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   20.308857] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[   20.316540] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[   20.323280] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[   20.334923] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[   20.348392]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
[   20.358449] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   20.358456] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   20.865298] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[   20.873431] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[   20.880197] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[   20.891777] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[   20.905293]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
[   20.924421] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
[   20.924455] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
[   21.431143] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[   21.439239] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[   21.445985] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[   21.457877] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[   21.471375]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback

Best regards,
Jianfeng
