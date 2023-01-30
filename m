Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACCA681A2E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 20:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6778910E043;
	Mon, 30 Jan 2023 19:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0768410E09A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 19:18:33 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m2so34367764ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 11:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fIRqqOqpVqRjVUN22YESgyUqHwFPSL4VZRIDcAALzk0=;
 b=O33jMYK/mxbkswTrZQ7pPS/UbI0ctBeRZ4BWZvTBeNGOsc74pcU7NvUBh43XgbnKUN
 Y5/NatnpgtWUw9JVFNU12SYDn6XsGOqYgNEXkkhNPvoGM4Z6aqkGCQ7MGzucTnXaT0yM
 qDavtW7yENHt56XYymY+kDGnUu7g9GBBZyzeOzzezP7ZSsPXc9mm/XH8nvFpnBhfeCzr
 Zi5Ox5Fty4/ds5rrUP1lHhLKVxcEaRMVrDx7DwXsLLWinSqT2rN+PWXMLJmoB9TSPw5y
 fpXVd7D74ObUHVptgyY704nRKuHTXC4UtcTNEmjY0EdpmWHvPCBdZrKFNv4vhjYY3G/+
 wPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fIRqqOqpVqRjVUN22YESgyUqHwFPSL4VZRIDcAALzk0=;
 b=HNlbShCQdHeC0+89U2JNbURPrjVpHtYUtZPUua33KA8chbAtvg1KXJ3bo2oCmsWhX3
 Do/aBox8RGmgfdahMic6yTDTgjNAZrbVr9rHM2LeMnr+njO682pIEJBjx1uiLFmbM9tr
 sLJj4QqopR8Jueqbq/q9qX7N/2BMNDIMEhdwF6vb5Bt3TJ5OTDnQHqZttwVfXR4DzsB0
 1CJR+Caaun6H7Rj1fmac/fLxe3m1KxfryerEXFb65GXieeZKb3Wh3bFvRDLq+FCF/8SU
 Y+lxXcLm5LKJ6oNR0lixLXvkZ0/VCOjGuEWxB4wFA0GK9uvCU0lTwnOens0Ty/lnr9I+
 GEuw==
X-Gm-Message-State: AO0yUKU+AO0Jd3JJugRT2fNizLNNCmrD9T2grKQKjR9NVjyrdE7Vc+Rx
 FXg/BkMt3HDHv2+D+h3ZTLxK+Q==
X-Google-Smtp-Source: AK7set+6wv6rUoXBVutS7MvyjITK2qUIduGwzP07FHLaad0soJT8wioRedVLbLcyIxSJ5fP7a3wcUw==
X-Received: by 2002:a17:907:868a:b0:879:767f:6e45 with SMTP id
 qa10-20020a170907868a00b00879767f6e45mr18114656ejc.17.1675106311525; 
 Mon, 30 Jan 2023 11:18:31 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a170906814900b0088091cca1besm4725741ejw.134.2023.01.30.11.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 11:18:31 -0800 (PST)
Message-ID: <31661b18-8519-cadb-0c56-6a1fa34633b2@linaro.org>
Date: Mon, 30 Jan 2023 21:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] Reserve dspps based on user request
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com,
 marijn.suijten@somainline.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/01/2023 17:21, Kalyan Thota wrote:
> This series will enable color features on sc7280 target which has primary panel as eDP
> 
> The series removes dspp allocation based on encoder type and allows the dspp reservation
> based on user request via ctm.
> 
> The series will release/reserve the dpu resources when ever there is a topology change
> to suit the new requirements.

Nit: the subject of the cover letter should include the version, if you 
are including one into the individual patches Subject.

> 
> Kalyan Thota (3):
>    drm/msm/disp/dpu1: clear dspp reservations in rm release
>    drm/msm/disp/dpu1: add dspps into reservation if there is a ctm
>      request
>    drm/msm/disp/dpu1: reserve the resources on topology change
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 54 +++++++++++++++++++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  6 ++--
>   5 files changed, 50 insertions(+), 17 deletions(-)
> 

-- 
With best wishes
Dmitry

