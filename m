Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68730BB78F3
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 18:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C772210E947;
	Fri,  3 Oct 2025 16:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAYwIsBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572AB10E947
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 16:35:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593A9M5X024148
 for <dri-devel@lists.freedesktop.org>; Fri, 3 Oct 2025 16:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BN+cZQE2ZHFMS/s2TQ1gBGDyzcU+J84X5eJjxhN4d/M=; b=DAYwIsBvKmf08Anr
 mMaZuN4CqYoRkXU8A/rRhgyQj/rgO8zVT5TEYrPKI4BrhVGyys9l/lAo8anED9xU
 JSX5P4CtMqR6/htjwRqPFxaUGs1HqRSjAbLhH+2QM9u8rx/tuWxO0CzXD6hqYckX
 VwKkwSuLBU9dHeN/EwwpOq/q2lo54zmwczfgwsNN2UnWr7TiOcajcRjcV+TSLh56
 kGaIOBRxXNtc6QguvQ10+TywfWqLSFNSZ4BBFuylO9JNj06LAen4MBjDmA4qk5ht
 6sypZnEtxE+scBWdjdfAoQG1fQVONxLxd4h+eY0fZ7BhgBNYlslV724pAXEYardb
 ErpOTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a6bd11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 16:35:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e0fcbf8eb0so59941071cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 09:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759509319; x=1760114119;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BN+cZQE2ZHFMS/s2TQ1gBGDyzcU+J84X5eJjxhN4d/M=;
 b=BqxynrmetoVG/jQWGHErfxE/x9qZZ4NQbJuP3grWC93lX4iupEGZJf/04bgNyBPgbR
 6AgS8g08SHgzLv2m0aiadgufmjtHnHKKi9uX5Hs6Ns+1EgswartMdHrl+xxpQW4Sgtab
 +1LmtC84cltAbkMmkEEMZuxizesBh/DmmkltLAg9fjQHqpC4C8ayjQxDIZYlhvRYgCqK
 PY95naqvF2DyqAngu4A8J2qYrimYNlZkqbL1fh6vlvPc2HvZporyW81l0IfEQTrhkI0g
 ozEHpkLmeLx31mSRjK8BBDeQcfbGVpwBnE55/5D0PvhNzTwJKlHzvrTZqvePEEl6mTAR
 f3AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1jF2mkyHnBIJA7HXQyQTTxUOO5/NMtmi8pKxQJ9A9NCCvarHLJlt71OoKPnLdmXbjPQbxwMx2b6c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzvda1LvO1Y19LRBqiANFNjnoS2EJHSZ9tZ9S/BsnmxY1QKMeA0
 qUDJZUAxgzIEP6k3CdbMj0SkZldmW1bbHCVBdAHhHFakJTceg9WVeNmxoOZPuh1hJAMDtZ/M9f2
 GuYqdMOUAvJ8wfn1zUX5zMt16nP7VPyOZsG+8azTPOneNV/ymyKio/phXhdvOqemGZ+YOnjE=
X-Gm-Gg: ASbGncunvEoyC7YO7/OMwuoADXNM2BpULQdCvo0AwzwNKs5T4Bdw2HH2ZVFZZnyDPww
 1WyWDO8WrIvUUuSAFZHLp5GLp9/g+mZPDTJBiltVbxBe6M2lC4HPe9hrqEupll/s2FK9AjiWNkP
 tEZ9aFORGy81T4x6DrcinE5vbL6eJPDr9rzK/DFDpUggmVDh9EUamxifw2vHeXdKfopNw3Q3ZtP
 CLMRxO9e8s7nNn0m0AYnf86yEKK5+uPcgezN24pY1LhMXwSWxL9KM9Gf9zLhvb2f4KKQvwOX+yg
 oEv66a07TCuoNXp+il2F01nzsEJ6xmrx5sfLvF6zMjgNKPxqMnC3/LyLE2+RIscwLSX3oWQg
X-Received: by 2002:ac8:57c3:0:b0:4d3:ee51:7819 with SMTP id
 d75a77b69052e-4e576b405aemr52572931cf.76.1759509318961; 
 Fri, 03 Oct 2025 09:35:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5X64Ute70habcixAOvg2eexQGJ08nl+IYTPWnk0+F/5qtQEOhct1LHk+KKy0StXX4wfKJvQ==
X-Received: by 2002:ac8:57c3:0:b0:4d3:ee51:7819 with SMTP id
 d75a77b69052e-4e576b405aemr52572371cf.76.1759509318346; 
 Fri, 03 Oct 2025 09:35:18 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-46e5b633afdsm81561215e9.2.2025.10.03.09.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 09:35:17 -0700 (PDT)
Message-ID: <e69b23de-e9b6-4dfc-af01-7d2726dc23e4@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 17:35:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dffb48 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=98231OFmOk8s024PzkQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4QBzEXZtmzJuEdm9jqvKR1uyx5JaG-xN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXwckzQFiryvyK
 207ooaLFuEUYkaRDmR31aHz23Ve2eCxO7OliTLJd9BCI7u+pyk7TIf8lnj557L4LtGvU8j+LcYU
 zOhfKegO7PKiiMGASL6HPhl6mj6XEtqorG62R486f1FAPEzaWTqhJ69CuLRRBwT6rI4NzJ4NzOd
 wV232Hu2K1H7chfzlMu2vwitzmrkeUWTPcHYPkvfnAthsQRUoRNGisVTE0Fd7j4HT9ifCfvWm96
 l6r82NA+L2jxAwBK77ntWJTBWq1npplhoXWlMXYSXUSMlpaHuj/euwItDVXscU0Vgu81eP2PV4F
 ak6SPnhcKNRcFgjE6w/d0tCN1VZv4hRDFU9KUywzl6W0ZOD7ICY418I5+gENCDs5JCFP/bfxPRZ
 YN5tDcxWD38uFFE/ckrA0/Hf3xpbLw==
X-Proofpoint-ORIG-GUID: 4QBzEXZtmzJuEdm9jqvKR1uyx5JaG-xN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
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



On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
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

prepare follows hw-params, and prepare can be called multiple times

When you mean order of prepare callbacks, you mean w.r.t codec and dsp
backend dia link drivers ?

TBH, Am not sure, I did not find anything that was obvious from the code.



--srini



> 
>>
>>
>> --srini
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
>>>> - Use more detailed trace log in commit message.
>>>> - Drop the empty line between Fixex and SoB.
>>>>
>>>>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>>>> index 7d78b02c1446..6ca1c7ad0632 100644
>>>> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>>>> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>>>> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
>>>>  
>>>>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
>>>>  	.audio_startup = drm_connector_hdmi_audio_startup,
>>>> +	.hw_params = drm_connector_hdmi_audio_prepare,
>>>>  	.prepare = drm_connector_hdmi_audio_prepare,
>>>>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
>>>>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
>>>> -- 
>>>> 2.43.0
>>>>
>>>
>>
> 

