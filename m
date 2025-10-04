Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08ECBB8DC1
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 15:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698E110E14B;
	Sat,  4 Oct 2025 13:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h5FuXRY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBB810E14B
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 13:16:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A2D70622A5;
 Sat,  4 Oct 2025 13:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B3FC4CEF1;
 Sat,  4 Oct 2025 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759583791;
 bh=I08Nc5q5l8NppZLvGTcwZIupkZuUfHohxlx6YSbLewk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h5FuXRY3gTUhF8vmvnIftl9SK1p0HVgQBoEaGnoAnkbjYlysNFEMGuFLLApSwqh1P
 N5cvKvZ/R8fc7+01dERuDrHqatFrqmkHblChqJM89tEU0qqgND/gGM2B6PO/DxYl0P
 dBsNXe8nIraqK9Uu1H+Du0IYBmuuJ4CO+65s/BfqXHSlf1pCFcvrFE8b1vf4yX3eGi
 gMF4aXHlselDAZou4l1OdOEvU6jtlTc1CvRxKxZ/yAcY7O1Gw0G4S9tcVwze672uFm
 g77r0geiW3jJJOUrmUze93h3qE7mbcuhOXDPGo9HHJrPiaty9n0ye7bGVPsF74X6/m
 qAE2JrTmIfvwA==
Message-ID: <f9c922f5-52af-45bb-a4ca-7ca80c0c3534@kernel.org>
Date: Sat, 4 Oct 2025 14:16:08 +0100
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
 <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
 <e69b23de-e9b6-4dfc-af01-7d2726dc23e4@oss.qualcomm.com>
 <bnrpfijh4rljdzroduqncfygysvgblljlhdpvq7ubajlbbwvwd@ohdmpjvpzj33>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <bnrpfijh4rljdzroduqncfygysvgblljlhdpvq7ubajlbbwvwd@ohdmpjvpzj33>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 10/3/25 6:02 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 03, 2025 at 05:35:16PM +0100, Srinivas Kandagatla wrote:
>>
>>
>> On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
>>>>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
>>>>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
>>>>>> use msm_dp_audio_prepare instead. While userspace is still calling
>>>>>> hw_params to do audio initialization, and we get the following errors:
>>>>>>
>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>>>>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
>>>>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
>>>>>
>>>>> And a call to hdmi_codec_prepare() comes only at this place.
>>>>>
>>>>> Srini, Mark, when selecting to only implement .prepare for codec ops I
>>>>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
>>>>> hook"), which documents that IEC958 status bit is set after
>>>>> .hw_params(), so it's only visible during .prepare(). Is it okay to
>>>>> implement both callbacks? Or should the audioreach DAI driver be fixed
>>>>> somehow instead (I suppose it assumes that the port is available after
>>>>> .hw_params(), not sure if that assumption is correct)?
>>>>>
>>>>>>
>>>>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
>>>>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
>>>>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
>>>>>> hdmi-codec driver can work with userspace alsa.
>>>>>>
>>>>>> Tested with Radxa Dragon Q6A.
>>>>>>
>>>>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
>>>>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
>>>>>
>>>>> The patch LGTM, but I would wait for response from audio maintainers.
>>>>>
>>>>
>>>> The ordering matters in this case as we need clocks and audio
>>>> configuration on DP codec side to be setup before we start configuring
>>>> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
>>>> even before it is ready.
>>>>
>>>> q6apm prepare loads the dsp pipeline and starts configuring the
>>>> endpoints, if the DP endpoint is not ready dsp would throw an error.
>>>>
>>>> We might be able to pull in some dsp logs to confirm this, but I dont
>>>> have a setup that I can reproduce this issue.
>>>
>>> What would be your recommendation to proceed? Is it okay for the DAI
>>> driver to depend on the .hw_params enabling the clock? Also I see that
>>> the error regarding the clocks comes from .prepare callback too. What is
>>> the order of .prepare callbacks()? Can we influence it?
>>
>> prepare follows hw-params, and prepare can be called multiple times
>>
>> When you mean order of prepare callbacks, you mean w.r.t codec and dsp
>> backend dia link drivers ?
> 
> Yes. Here we got a dependency from the cpu dai to be prepare()'d after
> the DP driver performs some actions, which were a part of hw_params()
> callback but were moved to be executed during prepare() callback.
> 
> This leads me to two sets of questions:
> - In which order are those callbacks executed? Can we make the ASoC
>   enforce some order of DAI's prepare() callbacks?
> 
> - More improtantly, isn't it a sympthom of DP driver (incorrectly)
>   performing too much in the .hw_params() / .prepare() callback? Should
>   we move some of the setup to the .audio_startup() instead? What is the
>   expected split between those callbacks?

I have not looked at full dp sequences but, if prepare is the only place
when it enables the required clocks for audio block, then it is a
problem, we should do it early so that DSP can enable the required
configuration in prepare.

Its also doable to move out the clock related settings from  prepare to
startup which should work aswell.

--srini

> 
>>
>> TBH, Am not sure, I did not find anything that was obvious from the code.
>>
>>
>>
>> --srini
>>
>>
>>
>>>
>>>>
>>>>
>>>> --srini
>>>>>> ---
>>>>>>
>>>>>> Changes in v2:
>>>>>> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
>>>>>> - Use more detailed trace log in commit message.
>>>>>> - Drop the empty line between Fixex and SoB.
>>>>>>
>>>>>>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
>>>>>>  1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>>>>>> index 7d78b02c1446..6ca1c7ad0632 100644
>>>>>> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>>>>>> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>>>>>> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
>>>>>>  
>>>>>>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
>>>>>>  	.audio_startup = drm_connector_hdmi_audio_startup,
>>>>>> +	.hw_params = drm_connector_hdmi_audio_prepare,
>>>>>>  	.prepare = drm_connector_hdmi_audio_prepare,
>>>>>>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
>>>>>>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
>>>>>> -- 
>>>>>> 2.43.0
>>>>>>
>>>>>
>>>>
>>>
>>
> 

