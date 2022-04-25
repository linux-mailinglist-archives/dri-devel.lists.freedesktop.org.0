Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD4650E9E8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 22:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D3710E22E;
	Mon, 25 Apr 2022 20:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1BF10E081
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 20:10:30 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-e93ff05b23so4159138fac.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 13:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=K7sT4j1j79zUgHhHLdRo7ZuD61k8VXDTntHyuzX/BXA=;
 b=OUAaD5Us01krjFlnDs+151g4ok09UyRZuEIHUE1jPBEyR9mx/A7sAsmhjHf63EwNHq
 tIGiZUlZHdnlAbywcerGTsEzOjmesGLQUY9f6NI+BrVAm9kyrLaCHdJc504J1oJXK0wM
 YXgRd77RKxlXmiT+xTLg8ZVph4cRCjsfDql8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=K7sT4j1j79zUgHhHLdRo7ZuD61k8VXDTntHyuzX/BXA=;
 b=ThV3dwyxLxm3Ge/l+xMmSeU+3oTQx0O2FR52F0YHT7YnaGQfACgSAxYTaq2/sfBia4
 LH2+IoNe4Yl/vJJBDmI4O7oJeSWY0tV5XBctwIOa9dVzNVmf/1Ecun9rLd/5+sRe4pdd
 T2wSr+b21uCJpuvddC1Y8tiPJw+yhl3+5rL4aJ21xHyOZYyGGd2Smko5oghqwEeoRhpI
 EDNS7FG+wfbOLmWQbMLw1b186fi2mvd7QO+Kd1hvjrT5jwBOmjGm3MB0YHf2P+7Vxruv
 0tCvYmiYfG+MGTFBS6D33y5GmANzeTrzvG45Sz8U5no1OtYy/RqqjzJqlMtb4VMK9Koq
 x8SA==
X-Gm-Message-State: AOAM5334Io4oSvvlJotSeYrHIEF9s50ApfgouuDjqfVAVXuGZmNJcYIp
 Mi1eh47kX5c4aPw9O4eAU7v57yb/yMZj0uSXfETe4A==
X-Google-Smtp-Source: ABdhPJwJ17fs8iCiZSEbXH7jLlKJyr/HpN9dSlTTmysq4gFTTyFY8Gf7w8AN4qbNPPUFTtheyeMgr9f/4ynX6qJHPkc=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr8031779oao.63.1650917430300; Mon, 25
 Apr 2022 13:10:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 13:10:29 -0700
MIME-Version: 1.0
In-Reply-To: <20220425090947.3498897-1-lv.ruyi@zte.com.cn>
References: <20220425090947.3498897-1-lv.ruyi@zte.com.cn>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 13:10:29 -0700
Message-ID: <CAE-0n50fs1fFQcwMCq_x_UG8ZJKprjcYKwcy1+1ckD--XE28+g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: fix error check return value of
 irq_of_parse_and_map()
To: cgel.zte@gmail.com, robdclark@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="UTF-8"
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
Cc: architt@codeaurora.org, linux-kernel@vger.kernel.org, ryadav@codeaurora.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, tiny.windzz@gmail.com,
 angelogioacchino.delregno@somainline.org, dmitry.baryshkov@linaro.org,
 jsanka@codeaurora.org, freedreno@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, skolluku@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting cgel.zte@gmail.com (2022-04-25 02:09:47)
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return a negative value anyhow, so never enter this conditional branch.
>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---

Question still stands why we can't use platform device APIs.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
