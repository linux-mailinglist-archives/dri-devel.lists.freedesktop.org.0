Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE3DB9D624
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 06:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E933610E278;
	Thu, 25 Sep 2025 04:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nr61GEqe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5471B10E278
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 04:28:36 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1Gpv0018069
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 04:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YKdKu5Uqj/R+R4nSJrnpuBnD
 76XZWXqaLeu9ryAtfrQ=; b=nr61GEqeDS6O/9bCZklUE+4xbaVEsGbDtw8rEDjS
 WsKS/6S3x9s3mMJBQuFiDE0rE1Jdc1LQRQZyLR2kUhWjzi4l/d/6PCVLXh4wb7Dy
 nG7fxDu6V4MEpQBSHHGmcLUs4wGrtPJfePi3npnTv9Qdrht4xPU3l5K7osAAdOEa
 QYXtdYk95S3abI7Zl1VnMOn5aKhIgDHyVFaojWFLmB5ZRCbNOjXCuhYkOvzvbbC1
 HyqV5hmwlnI/lCIRV3RTgA7OFzazV0M3tWtPu7eASldRFGm27EFLHtyZ82cCB4lJ
 NxPyGKBdrinFdhwZ8UBEyiNrRO5C/GRf2HswVqqYVvG15A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkapyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 04:28:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4d9a3ca3ec8so10567191cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 21:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758774514; x=1759379314;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YKdKu5Uqj/R+R4nSJrnpuBnD76XZWXqaLeu9ryAtfrQ=;
 b=NnfK6+W43d/m/iLypRa+/u8V4/mc1wG/wos756rAOONZzzR45Ob9hE/wC0eD7e0xYA
 pUsSjB2pPrGgpQsmPqBrUOZS/nHPMESWwKfHhP0jzg4pBcTjfQD+t0u1VIu5b6Y7BN7o
 L3aD0J4bJFG/AOO5l6oBOFvw+vlduXCAsNp408c/AukDIKCr02uYpozd4PMBqrWkpkJk
 C8KxMgpDKJgrPCjBFoJdvkNvutuIUzpImlT874qNmMh6eRrx9CP8GgTSc1bwAkG8gbsV
 oithAy2UbO+Jk4Hm/VTTYohcF0XejYvTOMlLq2PBi6kwf9O5HudNBuBoZSDkbvfHzgXx
 Yh2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF0ITo0dVqdOVd3Ml58UWgbax2X5eaABxfon6EBSkfCi70eTE/8k1J9t6o0VUj7Jd1eWC0XeQ8bmU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVsNqKRESDV4r76Xc1vO7AjSX0BTzlHKtScAaoytt4T4EFcxak
 nrFcvXYsgulI/BMMyR1ukSYFsxzlfHq7pgJihMu07bpGx3NG360QBVgTQaPVAlcGk/Q4cLN3bzy
 DAkFA01igQ2XbWpb47yQKsBZ9h8WNE+qf3CtA0Zvk2I8XvZpnU4MU02P5+tqyNRkgmzuAb2Q=
X-Gm-Gg: ASbGncv3I9NHcre0wN9Du2bBhpr9OOD9NYfE4DEKGKZvWUhzeGLcpRJXZ/nhnM+8dfP
 nvmNxJHirIh5KDwm4xkJDACcGwPceVDa4AEfs84hTY76g/1JLaS6JrDWXW5at9ltfUIdKqXeuwm
 IkP3S4cxYJq51gvmfLBp9GwpDd74yIwdxlTHT7iLdwExKQrAqkV/WLvgJe1aE5bI3s40TSfGhVm
 yqRFipnYmn7E5rdgEWV5pb3KKxaWoAKZIjgjaiS+m+yvd01rlE8kuKhPdXx5qwYAqfrHY2QmGng
 F3KHfnXawtSbDGj1tPH3pottYL4Ldd3COZzTd/9OOXhSsgFC5nx+eTp6Trtn/ZcznKHzTr+4woW
 Buhr5s0vnvnTarPdPMIjcSLsid2fsL8P/cbhv7rNvWvF0LJUAKWB6
X-Received: by 2002:a05:622a:4aca:b0:4b6:18f2:358c with SMTP id
 d75a77b69052e-4da4744ead4mr32115611cf.3.1758774514432; 
 Wed, 24 Sep 2025 21:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAvX5v8YtwH7wuM9PLnsvtwTPCrF2EfJwUTqgkXbR5VNh7MBSXNyhpks3LE2KBzyG0d145jA==
X-Received: by 2002:a05:622a:4aca:b0:4b6:18f2:358c with SMTP id
 d75a77b69052e-4da4744ead4mr32115321cf.3.1758774513968; 
 Wed, 24 Sep 2025 21:28:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb7710256sm2613491fa.45.2025.09.24.21.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 21:28:31 -0700 (PDT)
Date: Thu, 25 Sep 2025 07:28:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, Xilin Wu <sophon@radxa.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925040530.20731-1-liujianfeng1994@gmail.com>
X-Proofpoint-GUID: 1_cksu5ohmoxlZzatsNbgaYNjv-56Py0
X-Proofpoint-ORIG-GUID: 1_cksu5ohmoxlZzatsNbgaYNjv-56Py0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfXx/nz6BFLq3H2
 aGM8gEbOaZj4/YeNB05Yy+Kmu3/Bs2546ll4WoVBFW+OvWRJY4N5vxffE8M3VNNtunYnkHVVcg9
 MhxcOQYaV3jRFrjO5o9+hrBrkra43GBsMVtBS0WDU0Z3fxCXZciJzVjBgQ6RnN/DCAsUgDOm49l
 w2H7jXxK/LDjWIvPy338Xov+jb82AVFDZrPTehoX2bJWoyBH9/zGXYVzqRA4cCkGhHrjMwLQDu9
 AKYBYPY6LILOmCJ+YeJB8j7n2rUFYhwr+mNMDX7bVkiWZBzWZPRp6o+V1Hux8pfVj8/+DEdJ61f
 sdWZFYWUec6Qz5zKhV1A4oEYp6KmmSpEU21AjqOLCt4sYBpJNDVQmqMgk7qfzvw0yHMhSK52V6L
 WMQ1sLbo
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d4c4f3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=vfsuxmVtCGY_ofmyA3EA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
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

On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> use msm_dp_audio_prepare instead. While userspace is still calling
> hw_params to do audio initialization, and we get the following errors:
> 
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback

And a call to hdmi_codec_prepare() comes only at this place.

Srini, Mark, when selecting to only implement .prepare for codec ops I
was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
hook"), which documents that IEC958 status bit is set after
.hw_params(), so it's only visible during .prepare(). Is it okay to
implement both callbacks? Or should the audioreach DAI driver be fixed
somehow instead (I suppose it assumes that the port is available after
.hw_params(), not sure if that assumption is correct)?

> 
> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> hdmi-codec driver can work with userspace alsa.
> 
> Tested with Radxa Dragon Q6A.
> 
> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

The patch LGTM, but I would wait for response from audio maintainers.

> ---
> 
> Changes in v2:
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
> - Use more detailed trace log in commit message.
> - Drop the empty line between Fixex and SoB.
> 
>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> index 7d78b02c1446..6ca1c7ad0632 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
>  
>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
>  	.audio_startup = drm_connector_hdmi_audio_startup,
> +	.hw_params = drm_connector_hdmi_audio_prepare,
>  	.prepare = drm_connector_hdmi_audio_prepare,
>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
