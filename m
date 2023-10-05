Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8587BAEE9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 00:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0AB10E049;
	Thu,  5 Oct 2023 22:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7017F10E4A5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 22:42:00 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5044dd5b561so1885859e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 15:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696545718; x=1697150518; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qxe0ak/46bJpsp3A6ERBsLYtpfqO5S6jfq8NjVc/4Bc=;
 b=JDQt/UdlCITJMSIPDnZseVmJKR6+ky5t1NHenp4rNepraXnODUFfnLIbkXvs1wzYCK
 c4zqliq1biUl5tQJSPvbFyddd4yqNBbf474wounBE0dbOqbvdsLtj6eyrZauAyMdx35o
 gEDvGNC8FBU4unfL1Uf4wmb6VGTO2QeZPKH+Ks5DmzRREL6GVKOSWDwiOn4cy79lyMGb
 L45cPvsuY5dZlJOtaSD7M3GMt7OFVSd+uPCVeWxABbWGP4T1a45f+stqvm+hkvsnAy0W
 ZucY8GjeFcvGSAq+PYv5HjXYlGz+0EEXkSeECbRDpjxjDbw1H1z2Vv3IwTz1+UnHgCoD
 ahxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696545718; x=1697150518;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qxe0ak/46bJpsp3A6ERBsLYtpfqO5S6jfq8NjVc/4Bc=;
 b=HDMeByVFaIq/hZnBTiEhJh9RHRcEv76NlThvYMdXD9XRaFWzz65g/j0s24BTsgCVh9
 hKAg6QjZiA5m+xNeWJjEFYePX1PQZj3MGSnWK3m98cJyOlEE/pMFNV8+GNRRBRzjTdQ8
 i4FbCXW+KHdU4rY628rOtyKUWd9DaA1LgYv4Y4TPMu3q4uaclDiKj/1MFAwJCAqjUmoL
 wL/Mww2XeyoNppVGN4MwZz6QIE0WqsRn5USzjTO8xUF4pK6BPyNn4OarsIgTZPQO5GES
 r5ADQo3mDAbc/pD93OxqOgUxJgKwKicWr86ajzRW/GqEKWLPJYMJHGCtOnfuYjhsZfK5
 8MrQ==
X-Gm-Message-State: AOJu0Yx8kgM0ZdZu8K0uzDgyqGFNnwiWzaDi/ro/4wUgnaPL7CMwX5D3
 lr0tRWTIC/SxyBfyVEl9ZLkk8g==
X-Google-Smtp-Source: AGHT+IExNB53+dKAaQteMJJ3tL4g6Y2tu2/fzVZjUxh9Ut9cNeMdab+Ao7SyFlG70dLxdVCGxvodhA==
X-Received: by 2002:a05:6512:61c:b0:503:38c1:c848 with SMTP id
 b28-20020a056512061c00b0050338c1c848mr4902498lfe.50.1696545718603; 
 Thu, 05 Oct 2023 15:41:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d24-20020ac25458000000b005009b979e3dsm31121lfn.303.2023.10.05.15.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 15:41:58 -0700 (PDT)
Message-ID: <1ad8c0f9-33cb-4d50-acce-b71c5a06cb71@linaro.org>
Date: Fri, 6 Oct 2023 01:41:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dp: Inline dp_display_is_sink_count_zero()
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230906181226.2198441-1-swboyd@chromium.org>
 <20230906181226.2198441-2-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230906181226.2198441-2-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/09/2023 21:12, Stephen Boyd wrote:
> This function is basically a one-liner when you ignore the debug
> logging. Just inline the function and drop the log to simplify the code.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

