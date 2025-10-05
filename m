Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD54CBB98C0
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 17:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7335A10E154;
	Sun,  5 Oct 2025 15:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVPFp/xT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3D010E154
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 15:29:27 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595FTRYq023860
 for <dri-devel@lists.freedesktop.org>; Sun, 5 Oct 2025 15:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4dU4ZyLVXnWDFFy7T9bl0m/d
 RVY+plZydhTAkSsQP6E=; b=HVPFp/xTJvl2lVl1+xPWHZHpxZguc0U5/4a0rvRZ
 f51iO7yXY6b8SfNaqCpHLmItfDUzquyn5PdfMf36+/HK+UVbJIDidG/4QPBBRx2u
 7YAcxxIQb/W1cQ1dphnVwFRzT4ZJ0VIfmsVIQzDNzoWCDxfANjJICZCLCIHl57UE
 9GtjJv9YXO/IT5Y5VAkaGe9/C7FdWlSy6JNSjCbaIRWqokKoEw7UHvKTPAoitYuP
 KOQ7/qXUc6EbdU2MkhjQ4TZWrC1lx8CRXgXmKgsVE8y7xWxNM+W0/dnhZ1dlE3/x
 rvaCEWcmss/lpZ3Ul0tp7FcdQVXXyTL4MxHdseVJrTrbQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7j09q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 15:29:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e57359997aso42084621cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 08:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759678165; x=1760282965;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4dU4ZyLVXnWDFFy7T9bl0m/dRVY+plZydhTAkSsQP6E=;
 b=LyTtnixzOKSslbfny63AEGHtLqoX1872ScVePT+CBr5UcbAuKxT+nRdZshOL1mtpCk
 jU8PY5ecvCf8QWYhyJrVmywFMGe0ATRbxddPdXgvkGTCatha3pyYeBzKDQXFMBxhsWJx
 ETMpmz8ZQq1h911tCTNv1xjg892x2mNAGVWze8ksprbm+jaW68brj/wnQTF4t8X1HdCc
 st1A5n4KQ+llrU4OlZJ669yErJLAgQh35BTWtXgTOu3Evo9b3xSdx8J7VK5U+WeuWHVJ
 OJkpkfNHnCNBBKsEoWB57R16Yt4Z8XbWQrDX2vBgH8cyATdwrPOXeNv9RKKxGSEndxT7
 1tgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRP1e/bSHsCC6v/OAnc7tcM6Rn3jG1HGulfA3FscZk4e1+Fb1k57QOjQwoSyXTrrlBtpTNq586E8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydrFT6TtU8+2jNyoB4E6VfwKCC6ERjXOveUymenHV/v7QDjaz1
 niB9GcFeHEaDtBBLfnFDgvfjfCJ92I0LnYMeeVW6B0qTDWdPpPMJ050FPS4O7tci0dGV8Xyw7bn
 UZGTvCGmaMMlVvvBhxjnjBfPWK1PndDbF7Dym5ndq4C+Igs4/WUSv/gks26a4NDoMMydlKJg=
X-Gm-Gg: ASbGncsGvbI3m7U2mhmQeHXGC0sBKSx48Edoy1SkwlZ7Nf5UZLORZsmpg7/4JUDz09q
 8JfpOW0ay2yqv83/45mgaK8/sg53umwghgGUP3FwlCkkX5kz+Ri3xBIXz5WxxQItqFWWU5h7kwu
 CTDOUzz3L5+OjCaJl1qooqEq5KhXlSMo3tM0dsJ0ZTlysh1H4sF0/iqVG5cvIBcYXkY56nKavF/
 Gb8kS9SXSxB78UMWh6h30+d2cHD7OW1NOLEl6P6vdUNY3Gg1DRXgnFNONmaRByPnttuUPKVMkqT
 1q8mKjSZxuhJnaqME1r+cKN0RRQZm01Ztqvp4beE8W57GaFPr3ZWQcV5uAuj3KFgMQLdkqeHrDI
 xKScvP1nyKTcQ2R1m6fFPc3lyX2zRbMGUmnr1SEeexuK5yzij+bwoJKq+Pg==
X-Received: by 2002:a05:622a:13d3:b0:4db:29eb:901a with SMTP id
 d75a77b69052e-4e576a952eemr121578751cf.35.1759678165361; 
 Sun, 05 Oct 2025 08:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPvwQxK935qLiGDwBlISIOFxTmb8S9j72sPD3M1rCcPF9tS1ifCbXNPjF7ssIS5UO8xmwwyA==
X-Received: by 2002:a05:622a:13d3:b0:4db:29eb:901a with SMTP id
 d75a77b69052e-4e576a952eemr121578471cf.35.1759678164809; 
 Sun, 05 Oct 2025 08:29:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b01124040sm4026474e87.19.2025.10.05.08.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 08:29:22 -0700 (PDT)
Date: Sun, 5 Oct 2025 18:29:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
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
Message-ID: <7fwfxr7zqsaudselhru3jtjc2f7pdjvlaj2b464vgdlqcrljek@asci6y3ghq63>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
 <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
 <e69b23de-e9b6-4dfc-af01-7d2726dc23e4@oss.qualcomm.com>
 <bnrpfijh4rljdzroduqncfygysvgblljlhdpvq7ubajlbbwvwd@ohdmpjvpzj33>
 <f9c922f5-52af-45bb-a4ca-7ca80c0c3534@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9c922f5-52af-45bb-a4ca-7ca80c0c3534@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfXxmW49uFuRvTL
 zV4N6MnrTvkopUcgiwHMQDzgARBy9HKojtwV7ghKLY6y6xW2F/ak1GrIFuZCVoKqBu8KEj/v9G1
 4mct6nrcY6hrCC52bVZYNb3Tc9gnyw06ffUVpsXlyj2YFAeirCyPe0+uMBhPY00W7ubQ8SeDcVT
 oiztn9eifPcnEp4iN9bK+sJHzJLH4ILUgYAYUP6pHSzV5oAe/PepzqLnEKuQEtjat8hfI3e7XTc
 doD6C34UeQ0qac000ae6EayhViG+QsG9PLGPX8vcK/sBsrQe1/Tnzng5G6XVCXK7pL2ZROOXZVz
 EYWWRZ13QxydX4Sja6zlR+jqmwWskgFqUjJCMtSNm0lWLifoDcjr/SVqIJwx9WJ+IKo5Vkn/Mll
 x3fb5EW4K6Q2dntWWo4FJLqIfZ0B+g==
X-Proofpoint-ORIG-GUID: KU19Bt22oiiju0zWm9SpxXPdmwIat8uH
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e28ed6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=wW6VRMo5WZfp5zwlR54A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: KU19Bt22oiiju0zWm9SpxXPdmwIat8uH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037
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

On Sat, Oct 04, 2025 at 02:16:08PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 10/3/25 6:02 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 03, 2025 at 05:35:16PM +0100, Srinivas Kandagatla wrote:
> >>
> >>
> >> On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
> >>>>
> >>>>
> >>>> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
> >>>>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> >>>>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> >>>>>> use msm_dp_audio_prepare instead. While userspace is still calling
> >>>>>> hw_params to do audio initialization, and we get the following errors:
> >>>>>>
> >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> >>>>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >>>>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> >>>>>
> >>>>> And a call to hdmi_codec_prepare() comes only at this place.
> >>>>>
> >>>>> Srini, Mark, when selecting to only implement .prepare for codec ops I
> >>>>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
> >>>>> hook"), which documents that IEC958 status bit is set after
> >>>>> .hw_params(), so it's only visible during .prepare(). Is it okay to
> >>>>> implement both callbacks? Or should the audioreach DAI driver be fixed
> >>>>> somehow instead (I suppose it assumes that the port is available after
> >>>>> .hw_params(), not sure if that assumption is correct)?
> >>>>>
> >>>>>>
> >>>>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> >>>>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> >>>>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> >>>>>> hdmi-codec driver can work with userspace alsa.
> >>>>>>
> >>>>>> Tested with Radxa Dragon Q6A.
> >>>>>>
> >>>>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> >>>>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> >>>>>
> >>>>> The patch LGTM, but I would wait for response from audio maintainers.
> >>>>>
> >>>>
> >>>> The ordering matters in this case as we need clocks and audio
> >>>> configuration on DP codec side to be setup before we start configuring
> >>>> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
> >>>> even before it is ready.
> >>>>
> >>>> q6apm prepare loads the dsp pipeline and starts configuring the
> >>>> endpoints, if the DP endpoint is not ready dsp would throw an error.
> >>>>
> >>>> We might be able to pull in some dsp logs to confirm this, but I dont
> >>>> have a setup that I can reproduce this issue.
> >>>
> >>> What would be your recommendation to proceed? Is it okay for the DAI
> >>> driver to depend on the .hw_params enabling the clock? Also I see that
> >>> the error regarding the clocks comes from .prepare callback too. What is
> >>> the order of .prepare callbacks()? Can we influence it?
> >>
> >> prepare follows hw-params, and prepare can be called multiple times
> >>
> >> When you mean order of prepare callbacks, you mean w.r.t codec and dsp
> >> backend dia link drivers ?
> > 
> > Yes. Here we got a dependency from the cpu dai to be prepare()'d after
> > the DP driver performs some actions, which were a part of hw_params()
> > callback but were moved to be executed during prepare() callback.
> > 
> > This leads me to two sets of questions:
> > - In which order are those callbacks executed? Can we make the ASoC
> >   enforce some order of DAI's prepare() callbacks?
> > 
> > - More improtantly, isn't it a sympthom of DP driver (incorrectly)
> >   performing too much in the .hw_params() / .prepare() callback? Should
> >   we move some of the setup to the .audio_startup() instead? What is the
> >   expected split between those callbacks?
> 
> I have not looked at full dp sequences but, if prepare is the only place
> when it enables the required clocks for audio block, then it is a
> problem, we should do it early so that DSP can enable the required
> configuration in prepare.

As I wrote, previously it was done as a part of hw_params, which is
also not optimal as hdmi-codec clearly defines both callbacks as
optional, requiring only one of them. Do you know, what is actually
required on the DP side for the DSP to be able to preapre()?

> 
> Its also doable to move out the clock related settings from  prepare to
> startup which should work aswell.
> 

-- 
With best wishes
Dmitry
