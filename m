Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEEE6A0CF8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 16:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4B110EBD7;
	Thu, 23 Feb 2023 15:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB97B10EBD7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 15:32:38 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id e24so4949153ljj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 07:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LRKRWprEZuD2eBwpUD29JzKZTLuOFVMqqL7Lx+nXuUU=;
 b=eh/ODz/HpObGw9DUdcihpcqQXSZ4JBk2sakl4v/kqlyd1dr9ykX5wA0w4TXymNXNJK
 lfF0J7bNo8oCwheZreU64j17DMviDkqjBL3W61vHHWGqYy/qkfHatCOVqEEkodUh/Jsf
 GsTQFpHlZTyI/0+aZq5GQXlNo/u+T4aU6c4ZsgQrgXz0P37ca+VCRSA/jpRFCwyhctXI
 jNL4WNPP5NP/OP0WCE7PeLvQ7za+A0VX5vT9gfXBkfhkM6KAwHKoBNT9875lTFiV2MJt
 bQljsRSW5ed3ORe2gbLNFemzYwZeYGioMzDp7k8guN8UsAlq0LBsl2eYBhEaHtbE0neZ
 drqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LRKRWprEZuD2eBwpUD29JzKZTLuOFVMqqL7Lx+nXuUU=;
 b=0yOoLTdNEsc3u7HFMbqBTgvl3487fEqYHEOP9ARdYnTVG+TcZGhySSkuD/6ZnkRxOn
 dnBElZXGgQk4xMe4oi0fSt7QAYoxrZW6eV/phcaFHgD2N64/s+nNV8SuIGwU+5nrPfYq
 fovuX1Q4djf8BlqvKUeQtWfXuPvfjxHXXgEvwZC15WNCMZFD2G6ppQquTCu8pV4CJTLa
 Qw96seDxRh5hkhMLFxCFlT5C2vqKC2M3cbVlvZh/+3d86HmH5uFMoluRDxpBO7sBZ74g
 +bjGNWYmy0D2dCfaATJW77vxNv1g9HqCka6ahgRaFRX/2u56F/ml5++2RAoIT4ZQvxup
 Sy2Q==
X-Gm-Message-State: AO0yUKUENjwaFwKW0gWgoqXyHcZn9tT+1PnzMAmUirWcS5krmZMoWcR9
 EqOBiY/5h0tALHAx6J2S7xWt1g==
X-Google-Smtp-Source: AK7set+gDpYSnmThwzayYEy7qKRW50AOGBJZpkb3kJM+3R0C2IYIfKQw4BstjGsuW05TEGxOJzPYYg==
X-Received: by 2002:a05:651c:204a:b0:293:4ff1:5936 with SMTP id
 t10-20020a05651c204a00b002934ff15936mr3865262ljo.47.1677166356725; 
 Thu, 23 Feb 2023 07:32:36 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a05651c030d00b002906c22d6f1sm1045866ljp.18.2023.02.23.07.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 07:32:35 -0800 (PST)
Message-ID: <365754f1-757e-a997-a734-19e79550c63b@linaro.org>
Date: Thu, 23 Feb 2023 17:32:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 1/7] drm/msm/a2xx: Include perf counter reg values in
 XML
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
 <20230223-topic-opp-v3-1-5f22163cd1df@linaro.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230223-topic-opp-v3-1-5f22163cd1df@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2023 12:51, Konrad Dybcio wrote:
> This is a partial merge of [1], subject to be dropped if a header
> update is executed.
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21480/
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a2xx.xml.h | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

