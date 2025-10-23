Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56058C01355
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F3910E857;
	Thu, 23 Oct 2025 12:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFD+X7Il";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD1710E857
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:47:39 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6PKSe025807
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 24QeiCotR//tHfiqvQEewoseSxEQZNDe4+bx6DoDfNA=; b=oFD+X7IlT7PiQ6fW
 7Kb2nrR4H1OA9YoCEd/Hr0LKFRsr3rvNgJ8g6EUnK+NYCNrvdv2SyX1iAGl09b2J
 RO7LZGq4udYxUFFIixoR+wO/Lhg3mNEGcbrDDLiGYnNPGD48BEbAn75hXE6Bq68x
 eivPVbRXwh0yPdH0F+0JtAXNoTNcOt9DSNgA1sdWhfX1ehOsOfy7X6ZjvwMPcjwx
 3u55VdiVhqsGS+Ai3XVPffZMLU594uX50BYoFEIgMEMfFnsXyeQsAbpVq2IXNgRj
 xZPzfBJLgYNGwP6dD6ITqv4Cvb1/AYgzJOJ8ZIZr9mkltEOS688xkeqLwy/jf9sn
 8Ml+oA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kg864-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:47:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8b15de40fso35996541cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761223657; x=1761828457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=24QeiCotR//tHfiqvQEewoseSxEQZNDe4+bx6DoDfNA=;
 b=FfYmUfwSogq8nx1jRIapy1yUIx41L1EB7sniNNJlGbipGTPtKMOvXs9yJI8t4OPFc/
 kTFbp2EKxXse5EuHPwC+GPevF6MVvBFCnMUuR+vVAhBkhtvqIJ0DPGsoky89/S3Cl7gi
 m3DjQjWzQvd9cR+uV3b4OSCwbqQz3eeCvYHpjrpgwMwslp9o2vhtnKY6gQr7E3p7JK5z
 UVGWGRiga3inlofGyhWJQHVT/xsmPnyimZKCwaPLT4ArcEmDa6Du5Vmd5gr4mJ7IHdhS
 tgCCZVaCmLeW08p1vzY2YTGv6EstHANTtDxbhGbNfC5Fq4YoOwhScX9sRPv+7bOBUN8d
 dPdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyGVxhTCaV7WdAZAPcPVGEng0CYxFFmek94U4Foxt7yoUpIdvHaxbCC3WeevPiXXhFKgSx6O7mbFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+FBqCe9WBzM0uluX5ZUrUwZQat+rHvdnF8HqWOTpFLxK9dIef
 ERgkB7F2aXbrmmR/QUMc2ZxFYkD3DvuzU/1gVB2rd6F++CJmwdoqOky+tJpd0zWkvaz7XFkLzC1
 f2E9S0Zb395FKlKyN5pUCE17W0sfzLQoQ2G5JABZ0AqaBIDnYggX5TIEmhblwwVRmyH2AESs=
X-Gm-Gg: ASbGncu7XMBoiSyY6vkVVHP6Vx1PMDxLh43XzHLCrFFci+2kFT51PmJ5nlCsmMr+hlD
 s37yo2ef8eN3CRY/ADKswYM3u87Yl1COUToAjNthDRbKfUzJLtr9PQEH3lBmylI8kFbERgZJNU9
 oTcWAKCdDL7gzvbz5yRazoOtmUmYNY/ouxgoxdA7vB7OT5joJDAxSvZcx6tn/SB/zQsaRS/Ed8a
 tpbuebn/Wx0fGu4Wwzul5tvAPI9HxTwmGkD1IkBDq6kVfnkoTth3ttSiGvMm2JOc0IMN45SPDYH
 dVhEb5NOnHCc3Ve+IADA83z7eSMujPzocZZQ445DCiIC0YE0g3y3F1dGKA9WbgMdABDAegZWnp0
 HTEHHUgLa/8W7vfgcm4NaaAf4gw==
X-Received: by 2002:ac8:5883:0:b0:4e8:99b0:b35e with SMTP id
 d75a77b69052e-4e89d263140mr293100711cf.30.1761223656896; 
 Thu, 23 Oct 2025 05:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxStyuo5wBQVxSJ8+2cAD62zdY4gfTl+tKvmd0YRbr5e3lLNbpbu15fbW5YGeHHk5tbOiQIQ==
X-Received: by 2002:ac8:5883:0:b0:4e8:99b0:b35e with SMTP id
 d75a77b69052e-4e89d263140mr293100221cf.30.1761223656344; 
 Thu, 23 Oct 2025 05:47:36 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-429898ccd88sm4617224f8f.36.2025.10.23.05.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 05:47:35 -0700 (PDT)
Message-ID: <2ded2868-ae77-4c9d-9456-ac2af775a219@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 13:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, Xilin Wu <sophon@radxa.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 <zlu5x6v2xkum67prrtk26r7govenczuntjvlrflvdb6lpd2ssy@jgrnl6elophe>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <zlu5x6v2xkum67prrtk26r7govenczuntjvlrflvdb6lpd2ssy@jgrnl6elophe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nvm-oGmiX7F-HoXcEbcaMiVBM-K4OGyS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX6JLXPHwP3enH
 brnDkx0lUCmAcxN64t4CDYKzX/fLcM0UP6cli+X6pH5jJPN2ZIqD1dypbBn8LyXsQ3tekGuDk+C
 lHobsdvf0DapNy2wdt5Ua1YKIRhPqTht/QUvUXtcv8vtkkmb+CRzEwZyUm2IPS+64RgrcsuWPGt
 cdEDA7AWbTAWA8hvl6uQuu3dQPj9WkYOS8ZjCquRcP5D9C+4qTKxwXNCFl56SQhOH50Lo43RCU0
 9xGr+ZV7coiLMRk1dox4kjZZGTIWlOrsuAkElV6pyFZUIoCDmQyqAmaNVFWaonPVWL5LY86aoyQ
 vusjoY2xxxGLjPXh2amCoVFqddl9x4gAMl5CDO/WQzafjS+0OynLAONZ8oxytq5if7mqiQ875P8
 vo4XQSVhqnlPymHXb7+YefzyOF7mqQ==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68fa23ea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=y3vTIzG8JlWF4sTvGw8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: nvm-oGmiX7F-HoXcEbcaMiVBM-K4OGyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031
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



On 10/23/25 1:24 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 12:48:59PM +0100, Srinivas Kandagatla wrote:
>>
>>
>> On 10/23/25 12:43 PM, Dmitry Baryshkov wrote:
>>> On Sun, Oct 05, 2025 at 06:29:20PM +0300, Dmitry Baryshkov wrote:
>>>> On Sat, Oct 04, 2025 at 02:16:08PM +0100, Srinivas Kandagatla wrote:
>>>>>
>>>>>
>>>>> On 10/3/25 6:02 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, Oct 03, 2025 at 05:35:16PM +0100, Srinivas Kandagatla wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
>>>>>>>>>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
>>>>>>>>>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
>>>>>>>>>>> use msm_dp_audio_prepare instead. While userspace is still calling
>>>>>>>>>>> hw_params to do audio initialization, and we get the following errors:
>>>>>>>>>>>
>>>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>>>>>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
>>>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>>>>>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>>>>>>>>>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>>>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
>>>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
>>>>>>>>>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
>>>>>>>>>>
>>>>>>>>>> And a call to hdmi_codec_prepare() comes only at this place.
>>>>>>>>>>
>>>>>>>>>> Srini, Mark, when selecting to only implement .prepare for codec ops I
>>>>>>>>>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
>>>>>>>>>> hook"), which documents that IEC958 status bit is set after
>>>>>>>>>> .hw_params(), so it's only visible during .prepare(). Is it okay to
>>>>>>>>>> implement both callbacks? Or should the audioreach DAI driver be fixed
>>>>>>>>>> somehow instead (I suppose it assumes that the port is available after
>>>>>>>>>> .hw_params(), not sure if that assumption is correct)?
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
>>>>>>>>>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
>>>>>>>>>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
>>>>>>>>>>> hdmi-codec driver can work with userspace alsa.
>>>>>>>>>>>
>>>>>>>>>>> Tested with Radxa Dragon Q6A.
>>>>>>>>>>>
>>>>>>>>>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
>>>>>>>>>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
>>>>>>>>>>
>>>>>>>>>> The patch LGTM, but I would wait for response from audio maintainers.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> The ordering matters in this case as we need clocks and audio
>>>>>>>>> configuration on DP codec side to be setup before we start configuring
>>>>>>>>> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
>>>>>>>>> even before it is ready.
>>>>>>>>>
>>>>>>>>> q6apm prepare loads the dsp pipeline and starts configuring the
>>>>>>>>> endpoints, if the DP endpoint is not ready dsp would throw an error.
>>>>>>>>>
>>>>>>>>> We might be able to pull in some dsp logs to confirm this, but I dont
>>>>>>>>> have a setup that I can reproduce this issue.
>>>>>>>>
>>>>>>>> What would be your recommendation to proceed? Is it okay for the DAI
>>>>>>>> driver to depend on the .hw_params enabling the clock? Also I see that
>>>>>>>> the error regarding the clocks comes from .prepare callback too. What is
>>>>>>>> the order of .prepare callbacks()? Can we influence it?
>>>>>>>
>>>>>>> prepare follows hw-params, and prepare can be called multiple times
>>>>>>>
>>>>>>> When you mean order of prepare callbacks, you mean w.r.t codec and dsp
>>>>>>> backend dia link drivers ?
>>>>>>
>>>>>> Yes. Here we got a dependency from the cpu dai to be prepare()'d after
>>>>>> the DP driver performs some actions, which were a part of hw_params()
>>>>>> callback but were moved to be executed during prepare() callback.
>>>>>>
>>>>>> This leads me to two sets of questions:
>>>>>> - In which order are those callbacks executed? Can we make the ASoC
>>>>>>   enforce some order of DAI's prepare() callbacks?
>>>>>>
>>>>>> - More improtantly, isn't it a sympthom of DP driver (incorrectly)
>>>>>>   performing too much in the .hw_params() / .prepare() callback? Should
>>>>>>   we move some of the setup to the .audio_startup() instead? What is the
>>>>>>   expected split between those callbacks?
>>>>>
>>>>> I have not looked at full dp sequences but, if prepare is the only place
>>>>> when it enables the required clocks for audio block, then it is a
>>>>> problem, we should do it early so that DSP can enable the required
>>>>> configuration in prepare.
>>>>
>>>> As I wrote, previously it was done as a part of hw_params, which is
>>>> also not optimal as hdmi-codec clearly defines both callbacks as
>>>> optional, requiring only one of them. Do you know, what is actually
>>>> required on the DP side for the DSP to be able to preapre()?
>>>
>>> Srinivas, did you have a chance to look at this? Or the .hw_prepare
>>> ordering? I really don't want to land this fix only to face the same
>>> issue because on some of the platforms .hw_prepare() callbacks will be
>>> called in a different order.
>>>
>> Dmitry, few days back Krzysztof was enabling DP audio on T14s, and we
>> have seen that the DSP is not happy and returning error 1 when we try to
>> prepare the dp port. The exact reason is codec is not ready at that point.
>>
>>
>> By adding this patch, Krzystof managed to get DP working.
>> XElite platforms were working before 2fef64eec23a ("ASoC: hdmi-codec:
>> Add a prepare) patch was merged, basically 2fef64eec23a broke what was
>> working before.
>>
>> Am happy with this patch, better move to hw_params instead of prepare.
> 
> And I'm not happy with it :-)
> 
> hdmi-codec defines that one of the callbacks can be optional. We know
> that at .hw_params time we don't have IEC 958 status bits, so we will be
> programming incorrect audioframe.
Your statement is contradicting with callbacks that are supported by
hdmi-codec.

hdmi-codec uses IEC 958 status bits both in hw_params and prepare, if
hw_params is not the right place, then that should be clarified and not
correct for any of the codec drivers to use this callback.>
> Should some bits of code be moved to .audio_enable isntead? If so, which
> bits?

I have not read the data sheet of msm dp block yet, but what it looks to
me is the audio engine in the DP is powered off while dsp is trying to
set it up.

--srini>
> I agree that there is a regression and that this patch fixes it. I argue
> that the fix is incorrect.

> 

