Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868D5678CCF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 01:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A9D10E212;
	Tue, 24 Jan 2023 00:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A994110E217
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 00:26:53 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ss4so34865820ejb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KwGmEa06omOhettp+Z0U9Hx95U15RGfyvNHOg11/HaU=;
 b=BxgM0uL92DiH8vBmFVQX5YRizpa0FSpTigSVNf68cvSGiLSmrrd+HL0LU8nGEtgI9U
 47PNKMUWousS1hlKa3LGIf5eaPSy6GV8c0rTXUT33Vqu+/GfXC2nLqKj9dLUQ+iog9um
 iygD4KYwtU1nQI9dq2rPz0mCQcd4poIfQNdwV4V+gtPR9sjCPWKmnYOJyHAzLZ3T5isy
 Y2JrFY9lKIOtWqRXEKKtWEf0qeGdt1Ig0yCQCkXZMok04YiPsPqom50vJZtHp67j6MVD
 wJ6r9WJq2B1Hdwyo4gUHBvjOz4YJdoqWYSne4c+jU22HEhLALYJjlC4F5pxW2wiOJRtq
 C5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KwGmEa06omOhettp+Z0U9Hx95U15RGfyvNHOg11/HaU=;
 b=G5snVFqbTpoo4aDHN/p67E7rRPHWHwwNA02pkFF9jx4YD0oLXnAQbRBFLBgEjg+jsV
 Uj8KrMTwviB+RSFS3eaJQrC0tBgx2GtrZtq93paotM0H9wRzM/Qxkx8UTI/3sAXVyja1
 loqHPam27sH2RxlH4fSbNLm51y+X4fahdcWDrQITYPwpwiUSdBR81SQIrVccj51Zkrbu
 JAN3NQrWOj3zUsEhlHwHlutkCQI6UjtaMTfK58zErAiPbEpFPiUcdNwWSau6M1+ef/Zb
 x1TCD4W2qkRPQ3ow48klMBxfrMzcW/OusajdYnErPTl0n2xKSP4VpmPuDV79lO82btvI
 QPxA==
X-Gm-Message-State: AFqh2kqrrfyv51PaOIW+WlNzuyMZTHuu/sK0Ufm8EQoxKySyxMUwl305
 gdV5X3GVX5GRJZ8Y5ZZ7CJTMAw==
X-Google-Smtp-Source: AMrXdXts2d88Uk+7HdLIKXrZYxU82+pFx+YRlzrEXNldi8ylu63Erwb2h8tt2KYbCBT6aJShQ/Ijfg==
X-Received: by 2002:a17:907:9b06:b0:872:f259:a7ea with SMTP id
 kn6-20020a1709079b0600b00872f259a7eamr28628465ejc.53.1674520012237; 
 Mon, 23 Jan 2023 16:26:52 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 jl20-20020a17090775d400b0082535e2da13sm142641ejc.6.2023.01.23.16.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 16:26:51 -0800 (PST)
Message-ID: <b86bf5b7-2b73-0955-8a12-d997f7715067@linaro.org>
Date: Tue, 24 Jan 2023 02:26:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH Resend v11 13/15] drm/msm/disp/dpu: reset the datapath
 after timing engine disable
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1674138393-475-1-git-send-email-quic_vpolimer@quicinc.com>
 <1674138393-475-14-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674138393-475-14-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/01/2023 16:26, Vinod Polimera wrote:
> Reset the datapath after disabling the timing gen, such that
> it can start on a clean slate when the intf is enabled back.
> This was a recommended sequence from the DPU HW programming guide.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

