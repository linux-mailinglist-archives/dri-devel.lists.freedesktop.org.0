Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4382CC011A9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731D610E3F7;
	Thu, 23 Oct 2025 12:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjYN0jDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7550810E3FB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:24:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7K2Da022504
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uXuANgXqsKXGKeLuCYHue4m8
 RvWUrBUEqqVkisMKjFI=; b=QjYN0jDEbXXPW528UXuem7IR6xFnUhjh8YPcgqRP
 Zu/ImmCyd/69SomauaI7UnWGQGcDb7TWP28Nkv8t56md3HrrEdvDdZKDyOa7Tl10
 H+AWCoCZ1qq5cK/CNU7zDWtnBU0DBZb9IJYe6TKh6hgCS9i8r7hbQuO8sCwPcfEu
 QIFDSbD6ssAz+tNvxJRRg+NeVrCMPkzQCJg8Zv75Rk5ukbZiGX5rxAfD6QjWxQoP
 QW6KzXbyHcEXRV+5JEQHVgHyY5lZLkmVUBTltYEFLZ9yIsnli8ydKAVEFon9r22x
 UKiWqJ3Mh2bQo/9czrwlk7Zo8svrW5MD/CbaDVPIRHpOTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w88c20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:24:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e8aafb21d6so23874131cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761222286; x=1761827086;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uXuANgXqsKXGKeLuCYHue4m8RvWUrBUEqqVkisMKjFI=;
 b=Z8Qzjimnr5cs5TjYugzP0kDyCVLF/HmD/SWVQQ5GYuvOQ9ou8qnl78ZnSPV1T4j8Lc
 TIvW6HVQfusf5IiwMH86vTS4eNRzoUXDO+fB9gb7pP89QRKpibm7gEzirW752QRCfsIY
 IA7QYHrqepLHcB7OYB4ZI99qf2ltuqi4Qf9RLPhjJ2pgGqB1YV5vIWr/stJCYkuPQ0SR
 aUWWu9bZcc2DD4w/eMqxYGjkyQTr99kjX+4DLFrkgjLDQt8qn2vuXWVxgCwfwTt7bzD6
 INwwoxrgabXycohXPz3J/rWkweNTlSdWRJ/exE/JOSp6Po2g/Un2wyWGReQ9CAFStXox
 doSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLBPoEfvdNkO+u0TKuW9SaQg1U1IQiY+ve9cdUeiLOwswJaAc+gKxqfhN03X7kdQPrgOj/ioYzdQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMbdwoC9faJerRjpR0GU141HnphULEF0IdkK4r1m+guPScQH5T
 Hc9i7jLjC8ztAfJIhhu3I0PsBSI4LPYhew4cAtUFuOQ5sM4yQGIsWwF3FAqDgBZM577qzoQJdLc
 53jEcGV68BcfHPgOZndO/OHhtqorwC9m0axeq3v3qbnF5d6nUiBQRBxCsamv/2fJgkqbNZ08=
X-Gm-Gg: ASbGncs46rYKFEWakEGOsMpVNbjjQ2dH82Mb+OqfcZ4AxSdgWZsGObTuCzhjxqJcwXG
 a8RAXqS6MzocJNh+f3qAjMNfR0o7YAj6LNFcQAfdFhLZV+lFPFrNkAuzwKkPg6z8RKd14byXoR4
 84ww7wUaVbSKS/kR5Zcgh+ZHHCyeBK9kwyM2zTbXGQ/qIcFZHvXTdMbR7kFra3bOZ1AUetFI18S
 Joj3KkDEGNQhRZi0VmOHB5p2xaV/Qv+Uwz7T+gdVEig1TLHqJTlhDOWVsTIqCO2mwZoUgDIQFWq
 NDJF7tfb4vHyOvs5kbjXGu47SA0oVgKqcK8xoL+CpyJy5i/MPuEkJT3yzku6H2+7LXbGEL04NkX
 XdyxlJOl8S/sQSRYq7wFQmUiwbUizMOnn2/xPjacHJ/+aY0YrqpKg20kwiX9RLt0SPeQ3KUHB4B
 YnZImzTFfVs3pL
X-Received: by 2002:ac8:7f06:0:b0:4e8:a967:953e with SMTP id
 d75a77b69052e-4e8a9679e65mr251440991cf.24.1761222285495; 
 Thu, 23 Oct 2025 05:24:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVfVx4NRvt1CYWR2h8fbEsyadOtBDfpsDEnBpaGw2vZHVqcYjFk6imZkMy/IOObieOX2c1UQ==
X-Received: by 2002:ac8:7f06:0:b0:4e8:a967:953e with SMTP id
 d75a77b69052e-4e8a9679e65mr251440601cf.24.1761222284973; 
 Thu, 23 Oct 2025 05:24:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d66bb005sm4458881fa.10.2025.10.23.05.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:24:43 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:24:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, Xilin Wu <sophon@radxa.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <zlu5x6v2xkum67prrtk26r7govenczuntjvlrflvdb6lpd2ssy@jgrnl6elophe>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
 <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
 <e69b23de-e9b6-4dfc-af01-7d2726dc23e4@oss.qualcomm.com>
 <bnrpfijh4rljdzroduqncfygysvgblljlhdpvq7ubajlbbwvwd@ohdmpjvpzj33>
 <f9c922f5-52af-45bb-a4ca-7ca80c0c3534@kernel.org>
 <7fwfxr7zqsaudselhru3jtjc2f7pdjvlaj2b464vgdlqcrljek@asci6y3ghq63>
 <jymgfmn5pje4qaslyaivzfm4m7ho774pid3uenj6yfrlrdk3ss@2nqojclepgsu>
 <f1338318-0135-415e-ab65-482cef20f919@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1338318-0135-415e-ab65-482cef20f919@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX8PVopIoTH7w/
 TSvaGvC5nJM1xmoQMc7nUwd+cEMT/h5M++zWZCwcNGJN9Q+XLfKA1Hm8yi+7SMOEXsWdpyBqbQn
 FrpYRBYiHundS5la8sdEAM9C1OKbNLjSvret0n1EtzYIu48TG6sM6gDbO/W4AGgk04uQ1emeywE
 Uo4h5DJ9sAu4wjlIMYDCAckT5nl/optxr7Bg2Io6a3QBuUcH5qBXZHVnZMfyguPlqOrC922XYaa
 mpQS0O+toHn3X9VLI8EzrZqd03Gk6qpAEhLaACzbB8Hvw2XLWbKco2owJDgT7TMblL0xdnFAMvG
 MNrsciUWjbmG7vgA0nbv3vU3PSVwqzbwrk/sSd5q0nLmPRUYmXSouOAYg9ldijZpRfSt/73LIA9
 j2zQZKi7R9Ofi2ZYyO8taM0A0BKYyw==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fa1e8e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8
 a=grqte4VfTkGWRzHCIIUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: g85a98HvmNGNbzYCsM3N6EJ7EnHnQyJx
X-Proofpoint-ORIG-GUID: g85a98HvmNGNbzYCsM3N6EJ7EnHnQyJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
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

On Thu, Oct 23, 2025 at 12:48:59PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 10/23/25 12:43 PM, Dmitry Baryshkov wrote:
> > On Sun, Oct 05, 2025 at 06:29:20PM +0300, Dmitry Baryshkov wrote:
> >> On Sat, Oct 04, 2025 at 02:16:08PM +0100, Srinivas Kandagatla wrote:
> >>>
> >>>
> >>> On 10/3/25 6:02 PM, Dmitry Baryshkov wrote:
> >>>> On Fri, Oct 03, 2025 at 05:35:16PM +0100, Srinivas Kandagatla wrote:
> >>>>>
> >>>>>
> >>>>> On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
> >>>>>> On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
> >>>>>>>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
> >>>>>>>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> >>>>>>>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> >>>>>>>>> use msm_dp_audio_prepare instead. While userspace is still calling
> >>>>>>>>> hw_params to do audio initialization, and we get the following errors:
> >>>>>>>>>
> >>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>>>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> >>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>>>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> >>>>>>>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> >>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> >>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >>>>>>>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> >>>>>>>>
> >>>>>>>> And a call to hdmi_codec_prepare() comes only at this place.
> >>>>>>>>
> >>>>>>>> Srini, Mark, when selecting to only implement .prepare for codec ops I
> >>>>>>>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
> >>>>>>>> hook"), which documents that IEC958 status bit is set after
> >>>>>>>> .hw_params(), so it's only visible during .prepare(). Is it okay to
> >>>>>>>> implement both callbacks? Or should the audioreach DAI driver be fixed
> >>>>>>>> somehow instead (I suppose it assumes that the port is available after
> >>>>>>>> .hw_params(), not sure if that assumption is correct)?
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> >>>>>>>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> >>>>>>>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> >>>>>>>>> hdmi-codec driver can work with userspace alsa.
> >>>>>>>>>
> >>>>>>>>> Tested with Radxa Dragon Q6A.
> >>>>>>>>>
> >>>>>>>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> >>>>>>>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> >>>>>>>>
> >>>>>>>> The patch LGTM, but I would wait for response from audio maintainers.
> >>>>>>>>
> >>>>>>>
> >>>>>>> The ordering matters in this case as we need clocks and audio
> >>>>>>> configuration on DP codec side to be setup before we start configuring
> >>>>>>> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
> >>>>>>> even before it is ready.
> >>>>>>>
> >>>>>>> q6apm prepare loads the dsp pipeline and starts configuring the
> >>>>>>> endpoints, if the DP endpoint is not ready dsp would throw an error.
> >>>>>>>
> >>>>>>> We might be able to pull in some dsp logs to confirm this, but I dont
> >>>>>>> have a setup that I can reproduce this issue.
> >>>>>>
> >>>>>> What would be your recommendation to proceed? Is it okay for the DAI
> >>>>>> driver to depend on the .hw_params enabling the clock? Also I see that
> >>>>>> the error regarding the clocks comes from .prepare callback too. What is
> >>>>>> the order of .prepare callbacks()? Can we influence it?
> >>>>>
> >>>>> prepare follows hw-params, and prepare can be called multiple times
> >>>>>
> >>>>> When you mean order of prepare callbacks, you mean w.r.t codec and dsp
> >>>>> backend dia link drivers ?
> >>>>
> >>>> Yes. Here we got a dependency from the cpu dai to be prepare()'d after
> >>>> the DP driver performs some actions, which were a part of hw_params()
> >>>> callback but were moved to be executed during prepare() callback.
> >>>>
> >>>> This leads me to two sets of questions:
> >>>> - In which order are those callbacks executed? Can we make the ASoC
> >>>>   enforce some order of DAI's prepare() callbacks?
> >>>>
> >>>> - More improtantly, isn't it a sympthom of DP driver (incorrectly)
> >>>>   performing too much in the .hw_params() / .prepare() callback? Should
> >>>>   we move some of the setup to the .audio_startup() instead? What is the
> >>>>   expected split between those callbacks?
> >>>
> >>> I have not looked at full dp sequences but, if prepare is the only place
> >>> when it enables the required clocks for audio block, then it is a
> >>> problem, we should do it early so that DSP can enable the required
> >>> configuration in prepare.
> >>
> >> As I wrote, previously it was done as a part of hw_params, which is
> >> also not optimal as hdmi-codec clearly defines both callbacks as
> >> optional, requiring only one of them. Do you know, what is actually
> >> required on the DP side for the DSP to be able to preapre()?
> > 
> > Srinivas, did you have a chance to look at this? Or the .hw_prepare
> > ordering? I really don't want to land this fix only to face the same
> > issue because on some of the platforms .hw_prepare() callbacks will be
> > called in a different order.
> > 
> Dmitry, few days back Krzysztof was enabling DP audio on T14s, and we
> have seen that the DSP is not happy and returning error 1 when we try to
> prepare the dp port. The exact reason is codec is not ready at that point.
> 
> 
> By adding this patch, Krzystof managed to get DP working.
> XElite platforms were working before 2fef64eec23a ("ASoC: hdmi-codec:
> Add a prepare) patch was merged, basically 2fef64eec23a broke what was
> working before.
> 
> Am happy with this patch, better move to hw_params instead of prepare.

And I'm not happy with it :-)

hdmi-codec defines that one of the callbacks can be optional. We know
that at .hw_params time we don't have IEC 958 status bits, so we will be
programming incorrect audioframe.

Should some bits of code be moved to .audio_enable isntead? If so, which
bits?

I agree that there is a regression and that this patch fixes it. I argue
that the fix is incorrect.

-- 
With best wishes
Dmitry
