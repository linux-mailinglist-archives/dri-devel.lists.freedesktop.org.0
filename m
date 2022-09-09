Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5AB5B31F7
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 10:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E2210EBEC;
	Fri,  9 Sep 2022 08:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A394C10EBEC
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 08:41:05 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id s10so351805ljp.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 01:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=XYf9OC4lap9TDnElghyPNu9PXxrwVFlx/lkpv3HxAMs=;
 b=EjxBHJDnJwzoSYhTo8J4tAB17yMr4WmwDRMKBnVxB+usuYdnAUi6kZsIElQ0E5LBSE
 AdH4T/UaH7zY45A8iwkDiPS/lpVD92TrHG9JX/dzaXDsaNu4m9ClpJO3mX87/7Mpdplu
 WxAGUw4E9jNwuxHfCmE9Kl9+k1DZxkfPm01Z5rB6JN/V1skmoNWlVXfrh+eqdl/gFf8n
 gnWAODE8SpGUIvvxWd+W293oUs08/LLLdzB5YHYgrnT98tE1z23VHMvelj+qJB+/yh12
 AfwfjcYVuE/nGRXZZaCdIYn9Ey6pZ0lAWGWhhNxarzfGifJ/QrzGNSfAOyYv/O4bKY39
 GiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=XYf9OC4lap9TDnElghyPNu9PXxrwVFlx/lkpv3HxAMs=;
 b=ybuSHyKry8MjpbZGlw5ob/9h/0XG5TMAbE2HPC/EQmuUryM2GEek/UGevMQCs1r6UE
 ytujVTvRBpVyIVYoHBBe5uj51/MG0OmUjGGAXiodl9LRTeT5OwoK5k44yZaq+OlpFDB0
 AK5Z5BQOAthdUT9niNFTn4uKtM+dh+tHd8LvKNVk8PhjNQqJOV7iIIakospBZct+kMBQ
 G1qxm2MutBe5bUq643iBCPT8DGDJtxR9sR19Wqr6vgSveu0TskGAHA1jGD0almfRYg6h
 ACbFd/au3+mMQRX4uLWDUPgUyA5nxqseZPqJ9JFeY8X3mMShxPmDd4GZdXxEceWEG3u1
 wV5w==
X-Gm-Message-State: ACgBeo12E2D6+yTsa8dsJRdxpTYr5/OInbWDwHjUCnuJAezD0MncEXBk
 6UV219qzBkIehUmGtU4ogAWM9w==
X-Google-Smtp-Source: AA6agR7th6IcpkIF1sflOabwBqTiFcwUvT2tQzGy67Fmd+p14SID6U7XW7Si/bkyWLQAP/jO2w3pfw==
X-Received: by 2002:a2e:8058:0:b0:26a:d0be:ada6 with SMTP id
 p24-20020a2e8058000000b0026ad0beada6mr2930401ljg.43.1662712863780; 
 Fri, 09 Sep 2022 01:41:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512314200b004946a38be45sm194831lfi.50.2022.09.09.01.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 01:41:03 -0700 (PDT)
Message-ID: <6a911260-93a3-0e0e-eff4-095ae5a7ea7a@linaro.org>
Date: Fri, 9 Sep 2022 10:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 0/3] Limit pluggable display modes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
 <3961088c-d090-6986-491b-7976f5339ac8@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3961088c-d090-6986-491b-7976f5339ac8@linaro.org>
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
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2022 20:05, Dmitry Baryshkov wrote:
> 
> On 30/08/2022 06:33, Abhinav Kumar wrote:
>> As reported on https://gitlab.freedesktop.org/drm/msm/-/issues/17, currently
>> there is no mechanism to limit the display output to the pluggable displays
>> and it lets users connect any monitor on any chipset based device.
>>
>> This can lead to undefined behavior because lets say the display
>> advertises an unsupported pixel clock as its preferred resolution, then
>> the end-user can experience undefined behavior such as black screen,
>> crash or an underrun.
>>
>> The capabilities of every chipset are advertised in the product
>> specification for both on-device displays and pluggable displays.
> 
> After discussing this privately, it was agreed that there are two kinds 
> of issues here:
>   - filtering the modes which can not be handled by the DPU/DSI/DP 
> hardware pieces themselves
> 
>   - filtering the modes which can not be handled by the external 
> limitations (e.g. the bridge not being able to drive this mode, the pcb 
> routing of data lanes being unable to sustain the rate, the connector 
> being the limit, etc).
> 
> Krzysztof, I'd like to ask your advice if adding a properly like 
> `max-link-frequency' sounds like a good idea? The video-interfaces.yaml 
> bindings already has the `link-frequencies' property, but it is an array 
> of discrete frequencies supported by the link in the graph. In our case 
> the list of frequencies is more or less continuous, with max (and min) 

I would just use existing link-frequencies for min-max. Your binding
would need to clarify the difference against video-interfaces.

> values. Also, can it be added to the final device in the chain (e.g. 
> hdmi/dp/vga connectors) or should it be added to the endpoint graph nodes?

The same as existing usage of video-interfaces, so the endpoints?


Best regards,
Krzysztof
