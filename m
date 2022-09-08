Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 075285B254F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD30410EB89;
	Thu,  8 Sep 2022 18:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE55E10EB89
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 18:06:01 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id v6so7494524ljj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 11:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=i6R+T1LxzHrLjcWK+Adp5zlhp4ZmO7ZHrUGFuap8v4g=;
 b=Bt6tIkPhP/94b+3TXdX20M3nrhbAQzpfREfJGMTJtMzJTM7tk4CGTRep3GepAI78kE
 wHVoZI9q7qCWUkSfAvYpVwoFU66IuLTh+VrsNK+LHMfxYVdCVQzFkv9IkgK/yDWfUFRI
 61aI/sbJqkY+GVG4D8aLqMR/aJ2e5Z+vjedvy9pr/qszYDW0idZgOA2SONU1weSbMITj
 eQNizgRhUpSHgFjUDaRkDnRM4aCjD/rLn4ARMBHjHxFS4ZtMy9AEBD5FyaEGXWvN4L9J
 FMC5KPxdUWELHSCEAEkYsslh+q6ELJnF6BJhSbazh6Sd4LoZRYwLgZuGUoqj3LjZ2la2
 gMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=i6R+T1LxzHrLjcWK+Adp5zlhp4ZmO7ZHrUGFuap8v4g=;
 b=GQtROQWkgauGBLdk8BL4qV9MUZ5SVxqnumQqPfEjQnRHcANdqks/6YSGeYr3a9QcuU
 NTUv/BOW/MTouxSVaz8mI7qR+jtS/b1aZkLSb37s50po6jhYEvxajc2XyeFpFuKLGS78
 ELlsOCSMzGv0S/vRxEHXnh8Ay5lfWy/M4TOAdOaTJKHi4MRuftzfm6xnX80Pi7YaoV6G
 FUgU5yWToJb889ub1MSaBeHzYdPtn/1Gob0s2Hlpm9f0JO7Xr4LixdZzYbkirG8cbkFA
 85Yw0VktmvixbIXuQA6xByz4wMdAjN+K2N/zJcdNCGYIouFWex+0Ohs7YS6bp1jAd+6r
 9wDA==
X-Gm-Message-State: ACgBeo2bOnmR60yq2XxLaKtbd0psU45csnEvuCYx6zQx0vzLJJhtCA42
 Gw6DktruBhPUGtnrDjqEkBbhow==
X-Google-Smtp-Source: AA6agR5WJMSDclSm4Gl/NoQeBPciYND4nSeVr3axIRBYZuzQUt/Fptcx3HfRHEwCqxK3tICB1eFAEg==
X-Received: by 2002:a2e:a98b:0:b0:25f:d9e9:588d with SMTP id
 x11-20020a2ea98b000000b0025fd9e9588dmr2926280ljq.205.1662660358907; 
 Thu, 08 Sep 2022 11:05:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05651c124a00b0026a92616cd2sm776011ljh.35.2022.09.08.11.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 11:05:58 -0700 (PDT)
Message-ID: <3961088c-d090-6986-491b-7976f5339ac8@linaro.org>
Date: Thu, 8 Sep 2022 21:05:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [RFC PATCH 0/3] Limit pluggable display modes
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 30/08/2022 06:33, Abhinav Kumar wrote:
> As reported on https://gitlab.freedesktop.org/drm/msm/-/issues/17, currently
> there is no mechanism to limit the display output to the pluggable displays
> and it lets users connect any monitor on any chipset based device.
> 
> This can lead to undefined behavior because lets say the display
> advertises an unsupported pixel clock as its preferred resolution, then
> the end-user can experience undefined behavior such as black screen,
> crash or an underrun.
> 
> The capabilities of every chipset are advertised in the product
> specification for both on-device displays and pluggable displays.

After discussing this privately, it was agreed that there are two kinds 
of issues here:
  - filtering the modes which can not be handled by the DPU/DSI/DP 
hardware pieces themselves

  - filtering the modes which can not be handled by the external 
limitations (e.g. the bridge not being able to drive this mode, the pcb 
routing of data lanes being unable to sustain the rate, the connector 
being the limit, etc).

Krzysztof, I'd like to ask your advice if adding a properly like 
`max-link-frequency' sounds like a good idea? The video-interfaces.yaml 
bindings already has the `link-frequencies' property, but it is an array 
of discrete frequencies supported by the link in the graph. In our case 
the list of frequencies is more or less continuous, with max (and min) 
values. Also, can it be added to the final device in the chain (e.g. 
hdmi/dp/vga connectors) or should it be added to the endpoint graph nodes?

> Documents such as [1], [2] and [3] can easily be found on the vendor's
> website which advertise the max resolution support for that chipset.
> 
> Utilize this information to filter out the resolutions which have
> pixel clock more than the supported limits.
> 
> This change only addresses pluggable displays because the underlying
> assumption is that for the built-in displays, the display being chosen
> for the product will be done so after referring to the advertised limits.
> 
> For calculating the pixel clock, the value has been taken from the CEA
> speficiation if the resolution is a CEA one and from the CVT specification
> for non-CEA.
> 
> This change has only been compile tested so far to get a general feedback
> first and once it takes a final shape, will validate on whatever devices I have
> and will appreciate help from others who have devices which I dont.
> 
> [1]: https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/prod_brief_qcom_sd7c.pdf
> [2]: https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/prod_brief_qcom_sd7c_gen2.pdf
> [3]: https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/prod_brief_qcom_sd8cx_gen2.pdf
> 
> Abhinav Kumar (3):
>    drm/msm/dpu: add max external pixel clock for all targets
>    drm/msm: filter out modes for DSI bridge having unsupported clock
>    drm/msm: filter out modes for DP/eDP bridge having unsupported clock
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  8 ++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 18 ++++++++----
>   drivers/gpu/drm/msm/dp/dp_display.c            | 16 +++++++++--
>   drivers/gpu/drm/msm/dp/dp_parser.h             |  1 -
>   drivers/gpu/drm/msm/dsi/dsi.c                  |  5 ++++
>   drivers/gpu/drm/msm/dsi/dsi.h                  |  6 ++--
>   drivers/gpu/drm/msm/dsi/dsi_host.c             | 40 ++++++++++++++++++++++----
>   drivers/gpu/drm/msm/dsi/dsi_manager.c          |  2 +-
>   drivers/gpu/drm/msm/msm_drv.h                  |  9 ++++--
>   10 files changed, 88 insertions(+), 19 deletions(-)
> 

-- 
With best wishes
Dmitry

