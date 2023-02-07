Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67C868DCD3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 16:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97A010E517;
	Tue,  7 Feb 2023 15:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFED10E517
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 15:21:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qw12so44008791ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YTPYfaNfHTlgzHYyV9+fBlSvLMoaCZHX7hD5pX806Bw=;
 b=yM2LjNDtT8Di21u7MkpL8aEYysXvyagUm5aFbBZ47I6Hp8/h+0a6HUX7mqE/WMGGQM
 WnHyppQiTUdXfcPULg81UxftTgArLfn0DrEOlvPmqv0GuN4frYzktmX7+3FTAtBE5TZB
 3I1Gol6P/42HRIH+oV61kzOydHpL1TAaxE+RUOLmFhuc9Aq/M64FlW9VdvsSKLjzZDmj
 XCNiFpFySOrnA/GcbDMlWlzg1Q8NDk557SxUE4x4dZK6FAUPZfvfjd8J9EFLbhMEbkDm
 v6+t8B2cMGUkBTM/WBn5ksA8GWz1UBv6/tKz8nkVe6mUM3e1Qb+L2TVtzPB6LPeRR4j6
 Pt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YTPYfaNfHTlgzHYyV9+fBlSvLMoaCZHX7hD5pX806Bw=;
 b=WZ9dEYmVPz88F8gnOHZ82SoM+B/4ZMyGnY/S3rC8MUH2+OszcLd0uUjUqjo8yl385T
 eOrsPln1SbWDeJSUw1wiZVG1sQiPeE+c0Lc4YOLyuNgkcULvUkpVYyXoo1c4grvZMe61
 iT3hyQ+pri2lpPLBBwJcn0AvHmGfM2RUdkW91wJrQsWZuzbiu3MuxX8e3WSFbFYNX93C
 WAUGMTZE28wbu2MPL77FhhgwKy8S9gHhyV4/tHjDfPITwnYyu60364BrMhzmg9JdsH1h
 n7LskmwXE9Q008jkJ1f4qtGcVwIJ07luAPxsc2+wIRJSfNSmmIGpsdU3h46U2DnMD0Lh
 5CWg==
X-Gm-Message-State: AO0yUKXtCE2P3xW+9WWPqRHhaHzgKrpWXSe3idEUuIBBKYMZagbcn0t0
 WrHeS7o+FhLcM6pOU/kWNMxGWA==
X-Google-Smtp-Source: AK7set8584YuXOspFQeCKZnkVa3k+0F5o6MK5ItC2rBbYRItlVp13BBNRpy1PcI/NjxZgLO++QQCdg==
X-Received: by 2002:a17:906:604d:b0:878:7b5c:3811 with SMTP id
 p13-20020a170906604d00b008787b5c3811mr4171364ejj.42.1675783295577; 
 Tue, 07 Feb 2023 07:21:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 bl11-20020a170906c24b00b0088d0b51f056sm6921120ejb.40.2023.02.07.07.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:21:35 -0800 (PST)
Message-ID: <f57c7137-0470-ca04-68fa-f0a2f5fabb4f@linaro.org>
Date: Tue, 7 Feb 2023 17:21:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: avoid unnecessary check in DPU
 reservations
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1675780196-3076-1-git-send-email-quic_kalyant@quicinc.com>
 <1675780196-3076-4-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675780196-3076-4-git-send-email-quic_kalyant@quicinc.com>
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

On 07/02/2023 16:29, Kalyan Thota wrote:
> Return immediately on failure, this will make dpu reservations
> part look cleaner.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

