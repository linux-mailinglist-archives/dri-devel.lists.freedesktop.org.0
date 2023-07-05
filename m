Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4607488B0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 17:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C162910E16F;
	Wed,  5 Jul 2023 15:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1399C10E392
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 15:58:52 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3142970df44so5334618f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688572731; x=1691164731;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=moibl62gzAsWVTokluvPSFK/S0tyJbu/881cJb+p80o=;
 b=JSlq8CZYrL0RmBsVMhuobUhV95XMGPxVfjGNavCOWyxUgSDHCaJB4aAXpc5KoUvq40
 fykvC+WCiFXbWE5Z/OEaXbgEQO5+99cEZcZ439cMGWzd0tn/RtXvHe13K1KHd1M/7kxS
 agXTzzdaz8SDtGYRZtw+KzPgomGI6nfejQqRPgLR657DflSyEmtY9+UcMcetjEbXGOj0
 S3SDFqvZOjtSHTaVjrTDKmXS6TOaWRSwrdb5HqsIN2TlRZEbKVeQIt9vc2/DgiklaPyx
 XRzTGp9k6pT2BuWv6adsmAYFJtP1xt8B4r+oL5KMEzcv/dB7IqzPrpdKmwZ961oHLbSQ
 iZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688572731; x=1691164731;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=moibl62gzAsWVTokluvPSFK/S0tyJbu/881cJb+p80o=;
 b=arr6vZT1Bv18YsFUqPwqw09kMUg4rwsxZ44pB5G/sqJNYxju8sfHxmOhpZSs2ub7qZ
 xWznzhjhqO1fwDLF7pnY00QnqJBFBa2IzB4tFUgvdnnW7ywoLf/AMxpWS4Hdgqsz3H1Y
 wuErER+tyGPKyH+yIrSCJooFY4XVj+G8Ev4cck03WMGXQR2Yz/GnYLMjL0dEs4mYKesG
 zbT/PKsXBSlTiRIYJhPVjAxG+Xsl+RPYGsSNLGZEuoykdbVIaZk+NgEmPDH25pdc5SzL
 FuWrFe7/YAQ0RcGNPJxtCAP6xBywSS9T40q4owGI5mXT+MUQI4ZvfZGFHOr7nMBRJ7Xx
 KSew==
X-Gm-Message-State: ABy/qLZ7/CLkBR/gDYGCZR+CebA/wH5sy1zQs6cwcZ7IGF5kWgjjdbVT
 limFmPAGKbToLdTyASIWVWTAXw==
X-Google-Smtp-Source: APBJJlGx+kWWfQ+ERifBEWKHxqWBwGmPAO4EZnQin0ptwlMz0lU3sRP6zkQMsbyuoLdBaBGZMnrUZQ==
X-Received: by 2002:a5d:4f8d:0:b0:314:11ea:480d with SMTP id
 d13-20020a5d4f8d000000b0031411ea480dmr14762913wru.9.1688572731063; 
 Wed, 05 Jul 2023 08:58:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:65eb:d140:2d45:ee85?
 ([2a01:e0a:982:cbb0:65eb:d140:2d45:ee85])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d69cb000000b00313f07ccca4sm27119522wrw.117.2023.07.05.08.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:58:49 -0700 (PDT)
Message-ID: <bd6b9372-6eb0-c54f-9341-1dc46c4e63b0@linaro.org>
Date: Wed, 5 Jul 2023 17:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: RFC: DSI host capabilities (was: [PATCH RFC 03/10] drm/panel: Add
 LGD panel driver for Sony Xperia XZ3)
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
 <617c8f8a-1fc7-c6a0-eaa5-ce75ff2adc1b@linaro.org>
 <CAA8EJppG=MAVpK1J_8bNnkJ23y9NtgY7a2GVResXJvhEKyNsrw@mail.gmail.com>
 <739a8bd9-9ff0-5072-fdae-b64efdf86842@collabora.com>
 <e927cfcd-bf34-5daf-0e24-4dd828106968@linaro.org>
 <epds77sccy4cc5cdpoc4ir7sfz5sz3biwep6rbks2nuyqncidu@77gb4t2wy6vn>
 <47a5678c-1eb3-dfc2-a9ac-f8e497455d11@linaro.org>
 <unsithzszj7awvsmxwr7reshso5ju7u4nssil5tty6pocictf5@gwoltpgeecer>
 <6e070141-8c0e-59ed-8a08-58c3fadb17df@linaro.org>
 <lidknise4copce3vb2wth4z3fl2p4npsc4u6ajqb6zsp6lnpca@rp6wxcmy2aa4>
Organization: Linaro Developer Services
In-Reply-To: <lidknise4copce3vb2wth4z3fl2p4npsc4u6ajqb6zsp6lnpca@rp6wxcmy2aa4>
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
Reply-To: neil.armstrong@linaro.org
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
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/07/2023 16:24, Maxime Ripard wrote:
> On Wed, Jul 05, 2023 at 04:37:57PM +0300, Dmitry Baryshkov wrote:
>>>>>
>>>>> Either way, I'm not really sure it's a good idea to multiply the
>>>>> capabilities flags of the DSI host, and we should just stick to the
>>>>> spec. If the spec says that we have to support DSC while video is
>>>>> output, then that's what the panels should expect.
>>>>
>>>> Except some panels supports DSC & non-DSC, Video and Command mode, and
>>>> all that is runtime configurable. How do you handle that ?
>>>
>>> In this case, most of the constraints are going to be on the encoder
>>> still so it should be the one driving it. The panel will only care about
>>> which mode has been selected, but it shouldn't be the one driving it,
>>> and thus we still don't really need to expose the host capabilities.
>>
>> This is an interesting perspective. This means that we can and actually have
>> to extend the drm_display_mode with the DSI data and compression
>> information.
> 
> I wouldn't extend drm_display_mode, but extending one of the state
> structures definitely.
> 
> We already have some extra variables in drm_connector_state for HDMI,
> I don't think it would be a big deal to add a few for MIPI-DSI.
> 
> We also floated the idea for a while to create bus-specific states, with
> helpers to match. Maybe it would be a good occasion to start doing it?
> 
>> For example, the panel that supports all four types for the 1080p should
>> export several modes:
>>
>> 1920x1080-command
>> 1920x1080-command-DSC
>> 1920x1080-video
>> 1920x1080-video-DSC
>>
>> where video/command and DSC are some kinds of flags and/or information in
>> the drm_display_mode? Ideally DSC also has several sub-flags, which denote
>> what kind of configuration is supported by the DSC sink (e.g. bpp, yuv,
>> etc).
> 
> So we have two things to do, right? We need to expose what the panel can
> take (ie, EDID for HDMI), and then we need to tell it what we picked
> (infoframes).
> 
> We already express the former in mipi_dsi_device, so we could extend the
> flags stored there.
> 
> And then, we need to tie what the DSI host chose to a given atomic state
> so the panel knows what was picked and how it should set everything up.

Yep this looks like a good plan

Neil

> 
>> Another option would be to get this handled via the bus format negotiation,
>> but that sounds like worse idea to me.
> 
> Yeah, I'm not really fond of the format negociation stuff either.
> 
> Maxime

