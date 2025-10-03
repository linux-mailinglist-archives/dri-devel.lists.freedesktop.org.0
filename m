Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924B9BB7531
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 17:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4486610E035;
	Fri,  3 Oct 2025 15:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgSglLBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F247A10E035
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 15:31:34 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593BLJZa005645
 for <dri-devel@lists.freedesktop.org>; Fri, 3 Oct 2025 15:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cN2q9ybhrW5wodtD1jj2UWHaeowHEfEaUpKoifZ8W1w=; b=JgSglLBqxaA41vtD
 Q5S/ju+caQWPeospqF3DznLwbXfqEqveMw0oQXYhN6HR47X+3oC8rcpEf2TD0ExJ
 3ezLaP04evxRzSLyRnsSa1UUHk9q1o5ibgrlKcyvi+kgEgjsN3maPfdY2vu5I6hd
 92+HfgiOcIvdkEBEEv35vIJoUMYk9MzQjeq3d2jdhQBPio4mqiaiV6pYB2XWhYWp
 TzrXBL1zXl+sgM/oHwT/FMrY2+uvqhgQK6nt/Bd3cTvbyphNNIHYLRVQvVwIqRIQ
 vt5IjdAU6tcKiEmcjsNpj0/agYPCN/+vwLtzWtF4jqOkwIZy3XL0Zwg3fMfFYfqs
 q39wJw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdtxgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 15:31:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-54aa22d5862so1113908e0c.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 08:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759505493; x=1760110293;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cN2q9ybhrW5wodtD1jj2UWHaeowHEfEaUpKoifZ8W1w=;
 b=QqQbbAJsGBqgtUIdfD6c8pg29wt1AjmNSutljQkCwinzUsS1NQ2vNiOtM/zSZIdWhJ
 0nRgcJfZGiWl5d2oWx8sAYzd8zpZQ5gIOoXetfK5RVgKc1+ska6ccsTnm2eyVoVJ2Den
 CodVY3nEaletd7YvhSzUBktoFNcTwAk8NUzJD1bl9ZLA1N1dB15ZIAcO7RZxioPO0cyr
 6Iq4RGl05L5sgDHyRSbR/SrgiQyLr95+PRLt2bKQkgAly0Mq9EMimg+0jZii769iO4Dh
 fOxx9BBh62xYGNtzI9w2k0xbAhreJwtK8bo5yBlkaTZbjt7fgqwrldMsQc16pUItb++R
 /MXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnuD5Qd2pd7rWF3QgaNuYJaRt8L0nSq5EWwCsGTHboRi+EPIAME8Atkj7irXJd2AImAnT50pZUgBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlV8FZNO7K0valp/fllJxdJqw9FL1ZIUfGWXovNt0j9ZDzzual
 fS7j8/hT6FGwh9W33bTJg2HWE+XW96/u7xZy0QTXZhM7t46e5JGPK+Qxcr0BDz0CmuEKp1VdgsF
 5bT3rjaObLuBrMfGOEHC4W5g8jlyxseQWUsANSre+mWDxIaURZvy/HJF+v5fSRzdRxm8u1pY=
X-Gm-Gg: ASbGncsvicuTSWSO0TVlGJZ4By8ZtWC6K6PKIhthIt6dsVjxCXttodgA5qhqtI8TDCQ
 o832LCNzQO8v2oDb5IyTgUDHqv8XckOp4qcO2gvD+skZEJ2MTmq2scBe5dfyMjYYPKJjaVNmqOZ
 wL+TrQxPk+y9g9vE7FTZT9/LuQ3tQl2u2cMAZ+xWst6uKOoJudcYWTIH0V1eSh0/b51r+J/cxm/
 imiJQCTtu1iRpUDubYc84aOcsODGhId/ZCAVUdNsip5IsrkQ6YgA93yNZmPZp0XMiglwh7WEeT/
 5N8EVpSnTeqPf+p/SN/xyH9fECBJmSUzJkwQjixNaMETHv3b0Jumk0i5cV9qREof2L5sJIRuN2E
 XPPlPf6pDgpB5+PuDQxC3jn5n94osEmSi
X-Received: by 2002:a05:6122:910:b0:54a:87d3:2f09 with SMTP id
 71dfb90a1353d-5524e83e376mr1225309e0c.2.1759505492332; 
 Fri, 03 Oct 2025 08:31:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRK9X4ifva4mfBadLEBPmnh/d5o8SFjQ0l3cv9c3lPG9Nfn3Q7h+okNiMAu/HKT8Ho3zUORQ==
X-Received: by 2002:a05:6122:910:b0:54a:87d3:2f09 with SMTP id
 71dfb90a1353d-5524e83e376mr1224983e0c.2.1759505490450; 
 Fri, 03 Oct 2025 08:31:30 -0700 (PDT)
Received: from [192.168.10.38] (91-154-146-251.elisa-laajakaista.fi.
 [91.154.146.251]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b01140c6asm1929581e87.56.2025.10.03.08.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 08:31:29 -0700 (PDT)
Message-ID: <e602afc6-6492-4e96-88c8-963600ab696a@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 18:31:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
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
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
 <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
Content-Language: en-US
In-Reply-To: <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xIQQDiymmseHfuvJ03XABesBhmCbNbjN
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dfec56 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=CKk/IlMN6Gw3Dq31eR3Dfg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=K3JhrWoqGPPN_aSwzY8A:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: xIQQDiymmseHfuvJ03XABesBhmCbNbjN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX+uy/zwmXFImg
 oqFh3F9en/FbsLGj0Uat2dgkw6qDMux6FUfOd/8mk70bwAU0PxZCTYwPbIHOVI3jpb0Tb7lxRTC
 8e5SJDbSHAI+HaVqzyjIKzTJ+aZ1YgwLt6MikMCIXJdDpxDmqXMIMT4yJuXq7TqMitOempFZkeL
 CezPsdnCrfpE5ltGugH+6fC4XebHX/Ae+JL3dmhHO3QbF+l2U6dc06hxXbor5g5drfFe6QPPMm5
 sXhf4amtXgOhjcJFnX0xCpD/XASpPJaHs279nYs1poxTPcCPGw+RYdcq6th7SQF65VFq6ErDuiI
 FhW1vLWW6p4pxodx/75OcfeeWxxt+knEO2B4TrhHsbzBkkDttpRqLIvZpTRliAGiGK0n4bz1KH0
 MEAnkjncgA+Xn4315MP3TR8n5UgWaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
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

On 26/09/2025 18:09, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
>>
>>
>> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
>>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
>>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
>>>> use msm_dp_audio_prepare instead. While userspace is still calling
>>>> hw_params to do audio initialization, and we get the following errors:
>>>>
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
>>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
>>>
>>> And a call to hdmi_codec_prepare() comes only at this place.
>>>
>>> Srini, Mark, when selecting to only implement .prepare for codec ops I
>>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
>>> hook"), which documents that IEC958 status bit is set after
>>> .hw_params(), so it's only visible during .prepare(). Is it okay to
>>> implement both callbacks? Or should the audioreach DAI driver be fixed
>>> somehow instead (I suppose it assumes that the port is available after
>>> .hw_params(), not sure if that assumption is correct)?
>>>
>>>>
>>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
>>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
>>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
>>>> hdmi-codec driver can work with userspace alsa.
>>>>
>>>> Tested with Radxa Dragon Q6A.
>>>>
>>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
>>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
>>>
>>> The patch LGTM, but I would wait for response from audio maintainers.
>>>
>>
>> The ordering matters in this case as we need clocks and audio
>> configuration on DP codec side to be setup before we start configuring
>> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
>> even before it is ready.
>>
>> q6apm prepare loads the dsp pipeline and starts configuring the
>> endpoints, if the DP endpoint is not ready dsp would throw an error.
>>
>> We might be able to pull in some dsp logs to confirm this, but I dont
>> have a setup that I can reproduce this issue.
> 
> What would be your recommendation to proceed? Is it okay for the DAI
> driver to depend on the .hw_params enabling the clock? Also I see that
> the error regarding the clocks comes from .prepare callback too. What is
> the order of .prepare callbacks()? Can we influence it?

Srinivas, any response from your side?


-- 
With best wishes
Dmitry
