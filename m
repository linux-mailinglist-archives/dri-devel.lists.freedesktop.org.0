Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 817B4748E95
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 22:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029AD10E3B9;
	Wed,  5 Jul 2023 20:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943A810E3B7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 20:09:45 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b6afc1ceffso118223701fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 13:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688587782; x=1691179782;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QedvqYyJQViKyDdMD30O1M4fPDEkDaVf9Y43Xrvhkbs=;
 b=gT9o+qi7q8GI67qc4H1S3zeZyOR3NCtEjmK0kMBoZOTeO4eBGtk6kqTc+1ashkwQ4g
 GQVIp1YvHYbKOlHdL5mAsdfcLO/RGERkQTLW0IfvDcrRWKwVkAvr0CmU8an6E82KjVW6
 Ucj9ymEzDo7uDP33JNxTLDI9R22B3AeH8O6HGYoSJA4yz43ZseJkxwt51XIT3TSmNI1n
 vOkWp+ZH42ubdsgyAVft+AF3xzr2r269xq4FQvq9HjdwNgAdx/Wkmki0UyxiXhrKxQu/
 mANCf5VBOihpSsQnOFfrROEzMY0EXY059H57mHKkudw/2UEgv0Qyh3kUffcYG9JXaU4f
 Dc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688587782; x=1691179782;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QedvqYyJQViKyDdMD30O1M4fPDEkDaVf9Y43Xrvhkbs=;
 b=ewY77LO3qXwcMRltYo9yfljsV+nhaWwsTaKcKQX7iEVJF8WRFwKk5cmKIArMbEqBgf
 yo+vFkkCb4MI+AMUuOHLorrCawkNnEYTgJjU2nAbAs9IlaJFW38f18KVY96O7YlGIs11
 AdhcKjSkYnkaatNLayGI2nMx/SBeAtpCHxjs3bGMS7wW32+0Xv7uTmS1eZQKCGNzrpo5
 ED4G1lZclOvYskbbURjFNGd41pcvo8y85lpbbQufmWQbeyT/s/QlOXxNJ1Mc5q0UjtpS
 6ZuUPM4Gw6r/z5NUsHbj/8+r72x7QQFgq6mrOII9YQ3JgjkJ/aZKIysCqVRbb6LkcjDo
 GD1g==
X-Gm-Message-State: ABy/qLbAoQHKGCMXBmVwzw8GGeI9uRocA/v4XyNY6ls09Sq+0FiHFX9Q
 +po/+jDJFLYkkQKJy+JtIRgLnw==
X-Google-Smtp-Source: APBJJlHHNVJDZhY4e/En6E7OEuxyXThgyg1SBCxz7UAziGWfAUAugUI9omkfweqDp8gyvViv/f1ycw==
X-Received: by 2002:a2e:8e8d:0:b0:2b6:cf18:7397 with SMTP id
 z13-20020a2e8e8d000000b002b6cf187397mr10609414ljk.5.1688587782244; 
 Wed, 05 Jul 2023 13:09:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a2e850a000000b002b6ca539d92sm3957501lji.138.2023.07.05.13.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 13:09:41 -0700 (PDT)
Message-ID: <a718f7c1-4ef1-18c8-33c7-c5da22e92c89@linaro.org>
Date: Wed, 5 Jul 2023 23:09:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: RFC: DSI host capabilities (was: [PATCH RFC 03/10] drm/panel: Add
 LGD panel driver for Sony Xperia XZ3)
Content-Language: en-GB
To: Maxime Ripard <mripard@kernel.org>
References: <617c8f8a-1fc7-c6a0-eaa5-ce75ff2adc1b@linaro.org>
 <CAA8EJppG=MAVpK1J_8bNnkJ23y9NtgY7a2GVResXJvhEKyNsrw@mail.gmail.com>
 <739a8bd9-9ff0-5072-fdae-b64efdf86842@collabora.com>
 <e927cfcd-bf34-5daf-0e24-4dd828106968@linaro.org>
 <epds77sccy4cc5cdpoc4ir7sfz5sz3biwep6rbks2nuyqncidu@77gb4t2wy6vn>
 <47a5678c-1eb3-dfc2-a9ac-f8e497455d11@linaro.org>
 <unsithzszj7awvsmxwr7reshso5ju7u4nssil5tty6pocictf5@gwoltpgeecer>
 <6e070141-8c0e-59ed-8a08-58c3fadb17df@linaro.org>
 <lidknise4copce3vb2wth4z3fl2p4npsc4u6ajqb6zsp6lnpca@rp6wxcmy2aa4>
 <CAA8EJpq_VeY=44FqYm7QAT32AR=rmMOV0RtAfNFkb1hpSp29dw@mail.gmail.com>
 <djrx34qwb7yen47dmlsym4mg2pib4syncvdy52ma3sin7uhs7j@gi3znayuucnj>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <djrx34qwb7yen47dmlsym4mg2pib4syncvdy52ma3sin7uhs7j@gi3znayuucnj>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/07/2023 19:53, Maxime Ripard wrote:
> On Wed, Jul 05, 2023 at 06:20:13PM +0300, Dmitry Baryshkov wrote:
>> On Wed, 5 Jul 2023 at 17:24, Maxime Ripard <mripard@kernel.org> wrote:
>>>
>>> On Wed, Jul 05, 2023 at 04:37:57PM +0300, Dmitry Baryshkov wrote:
>>>>>>>
>>>>>>> Either way, I'm not really sure it's a good idea to multiply the
>>>>>>> capabilities flags of the DSI host, and we should just stick to the
>>>>>>> spec. If the spec says that we have to support DSC while video is
>>>>>>> output, then that's what the panels should expect.
>>>>>>
>>>>>> Except some panels supports DSC & non-DSC, Video and Command mode, and
>>>>>> all that is runtime configurable. How do you handle that ?
>>>>>
>>>>> In this case, most of the constraints are going to be on the encoder
>>>>> still so it should be the one driving it. The panel will only care about
>>>>> which mode has been selected, but it shouldn't be the one driving it,
>>>>> and thus we still don't really need to expose the host capabilities.
>>>>
>>>> This is an interesting perspective. This means that we can and actually have
>>>> to extend the drm_display_mode with the DSI data and compression
>>>> information.
>>>
>>> I wouldn't extend drm_display_mode, but extending one of the state
>>> structures definitely.
>>>
>>> We already have some extra variables in drm_connector_state for HDMI,
>>> I don't think it would be a big deal to add a few for MIPI-DSI.
>>>
>>> We also floated the idea for a while to create bus-specific states, with
>>> helpers to match. Maybe it would be a good occasion to start doing it?
>>>
>>>> For example, the panel that supports all four types for the 1080p should
>>>> export several modes:
>>>>
>>>> 1920x1080-command
>>>> 1920x1080-command-DSC
>>>> 1920x1080-video
>>>> 1920x1080-video-DSC
>>>>
>>>> where video/command and DSC are some kinds of flags and/or information in
>>>> the drm_display_mode? Ideally DSC also has several sub-flags, which denote
>>>> what kind of configuration is supported by the DSC sink (e.g. bpp, yuv,
>>>> etc).
>>>
>>> So we have two things to do, right? We need to expose what the panel can
>>> take (ie, EDID for HDMI), and then we need to tell it what we picked
>>> (infoframes).
>>>
>>> We already express the former in mipi_dsi_device, so we could extend the
>>> flags stored there.
>>>
>>> And then, we need to tie what the DSI host chose to a given atomic state
>>> so the panel knows what was picked and how it should set everything up.
>>
>> This is definitely something we need. Marijn has been stuck with the
>> panels that support different models ([1]).
>>
>> Would you prefer a separate API for this kind of information or
>> abusing atomic_enable() is fine from your point of view?
>>
>> My vote would be for going with existing operations, with the slight
>> fear of ending up with another DSI-specific hack (like
>> pre_enable_prev_first).
> 
> I don't think we can get away without getting access to the atomic_state
> from the panel at least.
> 
> Choosing one setup over another is likely going to depend on the mode,
> and that's only available in the state.
> 
> We don't have to go the whole way though and create the sub-classes of
> drm_connector_state, but I think we should at least provide it to the
> panel.
> 
> What do you think of creating a new set of atomic_* callbacks for
> panels, call that new set of functions from msm and start from there?

We are (somewhat) bound by the panel_bridge, but yeah, it seems possible.

-- 
With best wishes
Dmitry

