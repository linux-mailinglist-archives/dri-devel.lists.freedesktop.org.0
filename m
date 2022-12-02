Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F264003E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 07:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132C010E071;
	Fri,  2 Dec 2022 06:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0774110E071
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 06:18:25 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f13so5933737lfa.6
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 22:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SAVoHCQgXrBFJsGVATQHU16QH0b4cZRi90HUn6wrjZI=;
 b=qf3yVPTn33uUQtgKtkbptzLYAGVYwWMMDke9A+PeIEDqE5NTsloHp+qS++xmmvt2on
 b5ph9P//n36wmI9UCDCugjDgg3eOl+V79FdQj4H1fuVl+x5mS4bzK7AAY7Eoc4DwZTgV
 F5LeE99v/njeVxMj710FS+kwyzvU6VvXU8sg+pnPoTr5fX0j5+8Fbm/wXgoWvmHPZnsq
 bcnhiniKT5pgisQIRYzVtv9eMGDAetie+5b0ZaYIGpCgqD8BxUy6MPsK+AqXPDHuotjD
 9NKBhQHoIY1hFqvkSmPNtIRBLwRnGCh3IWuyMjvwKU3cyzaUIAc5QH5gJHwn+GjffDXO
 L9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SAVoHCQgXrBFJsGVATQHU16QH0b4cZRi90HUn6wrjZI=;
 b=bwoFKUySczawNeLVWYvZiMlOf04xe+3+kEXkO+3EWld3D4J+tTWtbF5lZfsjCYLAPR
 IVrVt6Bs8z8uWazdu6RO6mbNw+4d+2P3hm8hXQRY6AH6H7wNjcdQl6rRf47yTltjNv+C
 dusj4v151NaPytC8Fm/0mOGmoEp/OvTBDWV4qBis6YZzWOwunue267PldTG9/MWrK7zG
 /bWTo1+HMa3hSGfh3NyGSDU/RMxP2Jnsdh8ZcKHEdRIwXweb0QCTMYkOlTNVZxNQTsvR
 TypnoCdZI+m2eMDFWDgWMy+XlE057jTkkbuMFUK49fOdWyzfDBpj1M+ccvpfmS1lAXEU
 vDNg==
X-Gm-Message-State: ANoB5pmYhK78iDIUIuCcwQd7MyO+tbMuljgubgC7zMHmfnWHY7XB8vaO
 FdrN1FIRG74mdRbRo+wujjjv7Q==
X-Google-Smtp-Source: AA0mqf6K7a50TcFw/T4WgLOspYuBc4JsAEMt4ka9AfjGreJAQnxcirNF4ufy92rPF7BT2NtVDjVGnw==
X-Received: by 2002:ac2:46f8:0:b0:4af:5088:8fa3 with SMTP id
 q24-20020ac246f8000000b004af50888fa3mr24674056lfo.538.1669961903357; 
 Thu, 01 Dec 2022 22:18:23 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a05651220ce00b00497feee98basm897812lfr.274.2022.12.01.22.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 22:18:22 -0800 (PST)
Message-ID: <8aa37c6f-e545-8d7a-1c34-b9dd7a46c5ad@linaro.org>
Date: Fri, 2 Dec 2022 08:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v7 0/5] Add data-lanes and link-frequencies to dp_out
 endpoint
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, agross@kernel.org
References: <1669933049-13106-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1669933049-13106-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/12/2022 00:17, Kuogee Hsieh wrote:
> Add DP both data-lanes and link-frequencies property to dp_out endpoint and support
> functions to DP driver.
> 
> Kuogee Hsieh (5):
>    arm64: dts: qcom: add data-lanes and link-freuencies into dp_out
>      endpoint
>    dt-bindings: msm/dp: add data-lanes and link-frequencies property
>    drm/msm/dp: parser data-lanes as property of dp_out endpoint
>    drm/msm/dp: parser link-frequencies as property of dp_out endpoint
>    drm/msm/dp: add support of max dp link rate

Also, please fix the email address list you are using.

> 
>   .../bindings/display/msm/dp-controller.yaml        | 22 +++++++++----
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  6 +++-
>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |  6 +++-
>   drivers/gpu/drm/msm/dp/dp_display.c                |  4 +++
>   drivers/gpu/drm/msm/dp/dp_panel.c                  |  7 ++--
>   drivers/gpu/drm/msm/dp/dp_panel.h                  |  1 +
>   drivers/gpu/drm/msm/dp/dp_parser.c                 | 38 ++++++++++++++++++----
>   drivers/gpu/drm/msm/dp/dp_parser.h                 |  2 ++
>   8 files changed, 68 insertions(+), 18 deletions(-)
> 

-- 
With best wishes
Dmitry

