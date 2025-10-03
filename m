Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C86BB7A42
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 19:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1E710E94D;
	Fri,  3 Oct 2025 17:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXiVTmgh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E3D10E94D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 17:02:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593A9SPm006537
 for <dri-devel@lists.freedesktop.org>; Fri, 3 Oct 2025 17:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KgoxikXo2ZLB4qRYHWwK6Hmk
 lhI2iR3jWmKfpn6+5BU=; b=PXiVTmghXPDtT3Nr2+qSWeiRnA5fgCLitmfqYLGB
 TKSHqsHFcXgEU2MHmUubMUBcFj+LzL8T34iFf3XOUI/5qGr62B1c9rgmdXwD4XH7
 NCj7e36Z7ygyU0XsiH+ECSjkwREAeGzen/NvrEhvPLPbL63JMC0+xD2a6lJKpScp
 WK7JYkgr0pi4V6ts6AZ4yZjaqVFMQyyGgLWsweyaDwg1em/1/KDqC0MFbtoEwyWI
 EHNqctiqXGekQM4enaPq8jEVfWqK8Sv8ueskiKfdWzG5Szh1JJPX0vAyJC70Ym//
 RSKbLOtE8BtuZEAmb8MJkIIARnGql740GNJxvzP2a7gphQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851uf6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 17:02:44 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-43f11fb7029so872853b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 10:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759510963; x=1760115763;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KgoxikXo2ZLB4qRYHWwK6HmklhI2iR3jWmKfpn6+5BU=;
 b=cLxC0MD8f9HW6ezhsPySczjSTiIewmTl3r2qywbEF2T79Tm7Q7c5wVa0FF75li85qi
 A0vBs6WVQO9D/Z7LqoBPGM55e6ULGk10V+iogzGwzGtDaQhYM8iU+j6lHqJ4CgUXJ32T
 nKEQTzPHsoP/JvH9QPGS93vFRT2VEbwPp41y4LJt7lKz2NkDxWPfaPyJaqSc6WdHUF0/
 E5Z4uZ2VZNf/DS7t3Frh9sFUuMjUzhVqF754lAA+u9yxALQ/CjorLBfRRjhLBkrbPvgP
 hosHtTxxd/utyjzn8dkLGiKpncphQopnYOTTiqcJHcrOGrjzkEUN5+pS1UwG3j5RN+2c
 uO8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK/8UAisvL7nnYQwGkYehTvQXzMh0QwWA3q05Gtji+alSqZziDD1iAmWwpe9gWm2LUMdvso3J1HKw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywaqy3Bo5SqmbCGGeSrhZ1AdbrdqivLqsf12hKZtRDMS9LeU9hV
 nczhp5RgiztBaA3KBEPL1GFP6ELirZhM+eT3c1iA2JGke18DGjYoN6Kezoj+6JhNRan+FMLWbAA
 wiK9JKKLAR3OtG70FupmgRIFpjeK4yM8P5pdUTLw3KAxJ++BiGvy8YOK3qZ5dfw6zfBlb3OY=
X-Gm-Gg: ASbGnctAfK6MInItcGqyl/2G7ay1kji9yLgGutCP414MnRF6XdeCR7c+qALH8e40aGC
 ykEUUrQ5K5EZZBdPcYtaeRQPnd/L+9dHuFdrlfUZ9qqlKdclDXpL2JkybUAHDXVL8ZbY0RlkWCc
 DNZctwQM+dgZgi/OhpG/3A/Vf3qoyBVq9MIaUMwl9hTPKJBYOgatzkBRTtXsvibMJ1/1ibeDoDW
 Ij9/lNlUDgXV9TtSuKwFupg4YkFfO21ZD3q94vkU5eFvQkiLjQjimyrYs2lDNp+v+S6exi90qyQ
 8E13KfA8cdMhD0tZyqTZN2hslYyy3Z77Z1nmHttdUx0gdX1bjz5e1zIwbZTrd3QugPHXIEAO7bp
 Flxc69mqebM4GgJrU6t6bquHcKizqoQVIoLsRoW8X3pRlRG1J+Z4VGjOTmg==
X-Received: by 2002:a05:6808:159f:b0:43d:2004:bf3d with SMTP id
 5614622812f47-43fc1830c2cmr1748763b6e.32.1759510963165; 
 Fri, 03 Oct 2025 10:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSLjjxQA4p0EfAhPSPlC8pxdM4ZJElDgCUfgufaoYhlOS1ukf+CvDzO3irSmuShAdwAqpqXw==
X-Received: by 2002:a05:6808:159f:b0:43d:2004:bf3d with SMTP id
 5614622812f47-43fc1830c2cmr1748700b6e.32.1759510962583; 
 Fri, 03 Oct 2025 10:02:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b01124297sm2012104e87.23.2025.10.03.10.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:02:41 -0700 (PDT)
Date: Fri, 3 Oct 2025 20:02:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
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
Message-ID: <bnrpfijh4rljdzroduqncfygysvgblljlhdpvq7ubajlbbwvwd@ohdmpjvpzj33>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
 <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
 <e69b23de-e9b6-4dfc-af01-7d2726dc23e4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e69b23de-e9b6-4dfc-af01-7d2726dc23e4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68e001b4 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=vpI0o0ENzK3Q5gXZhecA:9
 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX0lpIfC3CSrYQ
 wjM59qKoO5wWO4Ut5GBq8FK/n1s9u5a5w6/5aHBaH00oYouAr9kPnqsQC9GuctR8+p9RM9gy0u3
 PX2rPeak57M7iCC1n32dipNz54mULh95/FtW8hQQcCGvlUDZeMQ9t0Ji+obEIpItApaBfSGokmk
 O3F9xfJE0iUTPfNexdh/XzjYEsbpsruqqtRZcA1/RiB3xSqp5UGwUGrP0WvkoJeaVg7EoHXLqWq
 d3ZTlMrF9f5e6A9Mh6sVwW+433r+2BWf9C28psmCNb2ADnWKHttZvTyWT3iWxseXxPsLWdPtATi
 yZGqwN6EUkGYvXiQbD5GxUUkJQPHyFri4V8EWCnyVP5UlVQpuLbjBHcSGF1Fuxz0nHKXAX3d9uc
 BNBjhRB6N7M2yN4E6wygDtEP3TPtSw==
X-Proofpoint-ORIG-GUID: ln-uHqgAEEpSMVb89CquFCfPqISK4MRq
X-Proofpoint-GUID: ln-uHqgAEEpSMVb89CquFCfPqISK4MRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
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

On Fri, Oct 03, 2025 at 05:35:16PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
> >>
> >>
> >> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
> >>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
> >>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> >>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> >>>> use msm_dp_audio_prepare instead. While userspace is still calling
> >>>> hw_params to do audio initialization, and we get the following errors:
> >>>>
> >>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> >>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> >>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> >>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> >>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> >>>
> >>> And a call to hdmi_codec_prepare() comes only at this place.
> >>>
> >>> Srini, Mark, when selecting to only implement .prepare for codec ops I
> >>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
> >>> hook"), which documents that IEC958 status bit is set after
> >>> .hw_params(), so it's only visible during .prepare(). Is it okay to
> >>> implement both callbacks? Or should the audioreach DAI driver be fixed
> >>> somehow instead (I suppose it assumes that the port is available after
> >>> .hw_params(), not sure if that assumption is correct)?
> >>>
> >>>>
> >>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> >>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> >>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> >>>> hdmi-codec driver can work with userspace alsa.
> >>>>
> >>>> Tested with Radxa Dragon Q6A.
> >>>>
> >>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> >>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> >>>
> >>> The patch LGTM, but I would wait for response from audio maintainers.
> >>>
> >>
> >> The ordering matters in this case as we need clocks and audio
> >> configuration on DP codec side to be setup before we start configuring
> >> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
> >> even before it is ready.
> >>
> >> q6apm prepare loads the dsp pipeline and starts configuring the
> >> endpoints, if the DP endpoint is not ready dsp would throw an error.
> >>
> >> We might be able to pull in some dsp logs to confirm this, but I dont
> >> have a setup that I can reproduce this issue.
> > 
> > What would be your recommendation to proceed? Is it okay for the DAI
> > driver to depend on the .hw_params enabling the clock? Also I see that
> > the error regarding the clocks comes from .prepare callback too. What is
> > the order of .prepare callbacks()? Can we influence it?
> 
> prepare follows hw-params, and prepare can be called multiple times
> 
> When you mean order of prepare callbacks, you mean w.r.t codec and dsp
> backend dia link drivers ?

Yes. Here we got a dependency from the cpu dai to be prepare()'d after
the DP driver performs some actions, which were a part of hw_params()
callback but were moved to be executed during prepare() callback.

This leads me to two sets of questions:
- In which order are those callbacks executed? Can we make the ASoC
  enforce some order of DAI's prepare() callbacks?

- More improtantly, isn't it a sympthom of DP driver (incorrectly)
  performing too much in the .hw_params() / .prepare() callback? Should
  we move some of the setup to the .audio_startup() instead? What is the
  expected split between those callbacks?

> 
> TBH, Am not sure, I did not find anything that was obvious from the code.
> 
> 
> 
> --srini
> 
> 
> 
> > 
> >>
> >>
> >> --srini
> >>>> ---
> >>>>
> >>>> Changes in v2:
> >>>> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
> >>>> - Use more detailed trace log in commit message.
> >>>> - Drop the empty line between Fixex and SoB.
> >>>>
> >>>>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >>>> index 7d78b02c1446..6ca1c7ad0632 100644
> >>>> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >>>> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >>>> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
> >>>>  
> >>>>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
> >>>>  	.audio_startup = drm_connector_hdmi_audio_startup,
> >>>> +	.hw_params = drm_connector_hdmi_audio_prepare,
> >>>>  	.prepare = drm_connector_hdmi_audio_prepare,
> >>>>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
> >>>>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
> >>>> -- 
> >>>> 2.43.0
> >>>>
> >>>
> >>
> > 
> 

-- 
With best wishes
Dmitry
