Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A78BA45B9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 17:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B1110EA84;
	Fri, 26 Sep 2025 15:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WIYhxgFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F9F10EA84
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 15:09:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWuUV032003
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 15:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xml9I4KJWJ+n/mLooOTRb4jr
 nF4kQuIKgjMLbzeFPFg=; b=WIYhxgFVDjPJC/GSKCkdWOuL54sXvXqRiPPI18rq
 X2kNGEj7aIp59ie7UxCbGCNu4uoFiSviFSSZhMP5D2vxEKkUPp/g2Rz8rq2dZ6YC
 Vez2sH4QsvLhmQoz1DD5c5hqqeEGWLZJUc44Q8eJg0WS6HaVUS1a6mU9kHu0GMg+
 Cm3i48ZM4+UcnAwEUMhqR3vr1l9J5WnirS7DndEIg2KTqYZCgI7OGadhvHmpg0yp
 vz5uUv0YUuEW3LditKCHg0dk8lKXuqW9dU69zTFgQFEj2a6s5cQBZEJwkuchnTbG
 /cq7HaKJ+uRxOxSGYX0KQQGOAwfqE2W9+e5KcRhlKjVsqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rk91p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 15:09:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b78fb75a97so28683161cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 08:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758899360; x=1759504160;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xml9I4KJWJ+n/mLooOTRb4jrnF4kQuIKgjMLbzeFPFg=;
 b=UqkcFBOmFNvvtoXa02QNi8/miQgLAdtMC8dMdXQhhW8CQ1QhWrBIil4ndn1ekLMozw
 Nzk0Scb3lI01tbmHO4duzQ8KLEsY4IGC/3JtL8zQCKW0g7t6WYDbk6i+hNolV6AM3KaT
 +r4Ugj4Y9M1rhx8fMMHF+ld0bz06XL7b+O1+3upDMVQEbYp0YOnqLe5YJGCX85TzHX+7
 sedCKaVAPPxt7EZFQMT3/z5rOGUdG4cvXAl7XWHQq1WKYlneavH545yPzw7/2ZnL3p6j
 dxoME9TgO9uHeZPTPnM/dmDz2h4F2udJu8T/aMJ2riAGmF6JqWtBCMh6aMnTPbM44sp0
 I6MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqsGMpYVRQn6I0W2oFrsdJZyf54wWQhI+NThZ2W3FFmv15A7TGj06fC2GQn9QbDOKk7ae9SqvFLR8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCRadylwCNI3HarXCMaZENwKHSNby1EANMmU/gd7moaqv+liUH
 3q9ubnLqYKkJYsoozQcvitaF3CX3xVWZgTLS6Xsz7pnEo/U51h5SuoOQyG3PGxvFhsd0404mRXn
 Ls+Y92Cn3kKE0Lke/kizomjhLIIi2kLu076Hg0UMEGREjgU7M9yZxFbXBbUOwuDmmESUDiSA=
X-Gm-Gg: ASbGncuAeWzneT1lgj9V6IU1Dz1mVNvuyZuTJNivY8XsMO7oih6ZRy5wu31Yy/gbu+h
 ZAqPosGCnkugLk1uK66M9YzJ9ktb/bggq6nKZNnh+JIy8Kwr9G6YJjO/AJEuPAUVd2uOPirSjL6
 8UN/hSYu/3yU5B1pQSSob8j02KrDkf7h09qLBw8zKi4GElmRKxNfxSwd19SnejKRDjn9Wf+vlWL
 e6O086kXKlXju+SLYrhJia4VyYBV0yaKo8V31RSwEuelltkdPbd2vK1PuwiGZxJ68ytoufsIfdr
 73eTKlknpsMf4suJYaKHdhQdpRNFGsZEWWoAW3lYswlR9ZsJrp9kLoVU4tGL3rx29jmljT+biao
 kpR+weIyzoN1M3vekbYeSoClL87ax6QFrLqWgXeBCOjmKfC0M0ZHn
X-Received: by 2002:ac8:57c6:0:b0:4d8:f0e4:f92d with SMTP id
 d75a77b69052e-4da48a96e98mr117642801cf.34.1758899359091; 
 Fri, 26 Sep 2025 08:09:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVNL1+kS1q2UptTniV/FQ9TTOA5N9MQS67FNYuK7ugL+YJ4ZWes7rk96zqrRI0rqdGs4Uteg==
X-Received: by 2002:ac8:57c6:0:b0:4d8:f0e4:f92d with SMTP id
 d75a77b69052e-4da48a96e98mr117641741cf.34.1758899358147; 
 Fri, 26 Sep 2025 08:09:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316d14010sm1877513e87.124.2025.09.26.08.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 08:09:17 -0700 (PDT)
Date: Fri, 26 Sep 2025 18:09:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, Xilin Wu <sophon@radxa.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d6aca1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Hfy8LQLwNBXcVyXodC8A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ITyhU303_bYzlPdLbu9PpVrTQKiC6VcQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX8ARMgjnqnUzN
 EJ+tgvcIyrw1+GUIuIvr8TYC/1dFw+z7vl1JJy5gXzVdv5ynNjhrXKCWUWdrV17A+5i6M0rcg5r
 w0bwJmSCN05/oASi8BOZgMtdlyc/fVKb1Gse+e1Bz0dnKfXrAn+tbaP9ohqodrBrj1vPEeKwiUW
 e14rP/H77CvMcEmd8kVpOyKX+fKiateqsgqzBcTuGuT4cCp6weLchspBkQ6CKBjbHDowDyEpsGI
 SSUjnLFnFAjZC5xl+m64OAElJtIRSeIQ0WRM2zP46KKcVKurr8pU5sjXpcqW0w7jiKLbwgiTkea
 Ge95g4oEBRgqZlEeSa/CM0aR8rVsmJ+Dh3rqcS5n/ZR9jQf2rZxq25vZG2sCgcCjldW0aUdRpwk
 MZl5wJqAzDZnhz+nYsN0+WHHTpzUvQ==
X-Proofpoint-GUID: ITyhU303_bYzlPdLbu9PpVrTQKiC6VcQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_05,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
> > On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
> >> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> >> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> >> use msm_dp_audio_prepare instead. While userspace is still calling
> >> hw_params to do audio initialization, and we get the following errors:
> >>
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> >> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> > 
> > And a call to hdmi_codec_prepare() comes only at this place.
> > 
> > Srini, Mark, when selecting to only implement .prepare for codec ops I
> > was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
> > hook"), which documents that IEC958 status bit is set after
> > .hw_params(), so it's only visible during .prepare(). Is it okay to
> > implement both callbacks? Or should the audioreach DAI driver be fixed
> > somehow instead (I suppose it assumes that the port is available after
> > .hw_params(), not sure if that assumption is correct)?
> > 
> >>
> >> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> >> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> >> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> >> hdmi-codec driver can work with userspace alsa.
> >>
> >> Tested with Radxa Dragon Q6A.
> >>
> >> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> >> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> > 
> > The patch LGTM, but I would wait for response from audio maintainers.
> > 
> 
> The ordering matters in this case as we need clocks and audio
> configuration on DP codec side to be setup before we start configuring
> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
> even before it is ready.
> 
> q6apm prepare loads the dsp pipeline and starts configuring the
> endpoints, if the DP endpoint is not ready dsp would throw an error.
> 
> We might be able to pull in some dsp logs to confirm this, but I dont
> have a setup that I can reproduce this issue.

What would be your recommendation to proceed? Is it okay for the DAI
driver to depend on the .hw_params enabling the clock? Also I see that
the error regarding the clocks comes from .prepare callback too. What is
the order of .prepare callbacks()? Can we influence it?

> 
> 
> --srini
> >> ---
> >>
> >> Changes in v2:
> >> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
> >> - Use more detailed trace log in commit message.
> >> - Drop the empty line between Fixex and SoB.
> >>
> >>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >> index 7d78b02c1446..6ca1c7ad0632 100644
> >> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
> >>  
> >>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
> >>  	.audio_startup = drm_connector_hdmi_audio_startup,
> >> +	.hw_params = drm_connector_hdmi_audio_prepare,
> >>  	.prepare = drm_connector_hdmi_audio_prepare,
> >>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
> >>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
> >> -- 
> >> 2.43.0
> >>
> > 
> 

-- 
With best wishes
Dmitry
