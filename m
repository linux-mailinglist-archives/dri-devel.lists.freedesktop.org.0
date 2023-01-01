Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B76965A9FB
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jan 2023 13:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B744D10E03D;
	Sun,  1 Jan 2023 12:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0664710E03D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jan 2023 12:27:38 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-46198b81e5eso359358427b3.4
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jan 2023 04:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2bWIRx0OjUiiIyER71vIk1rtm1u64tQPJZk2feH605U=;
 b=TluG41Rwc+6pjqk30yxZybimGt7+O6R3MyNiv699OFH83tN10SaLOwYpWTdQ7AWgLS
 EATAkvwk3w+1SThVegNvSV1VPnkjnECmkS4ahcCnfTvIP8QfBYgW/Ia4ZRcA6Bqv8egE
 PEJfcqX/UDVfBl9JyJiUN+7IiIVLZ+0hZDrgq4AdDU7rpmY94WjS4m8euscKNFlEGgwb
 yRfJycNDBK+sRp2RfjN9aPZRGiGGDq2Ni3wozwXNsuEkagQreBC1nRdZINZhht5wa4eO
 P+NCQXiQY5BeMy5+j/LZjh8NCzOcUL0XR8c+V4980ORW0CQYlAqusTFgTJ7lqlgKlt9f
 XJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2bWIRx0OjUiiIyER71vIk1rtm1u64tQPJZk2feH605U=;
 b=x0lPpKI2aD2po5WSoa0FjEiNVo/ASm7n1x26r6iFRlq91VE0q1INL8BweC+jZDcc7X
 TR8RFQ/kOUJeAKX8cPCwkTx/oBoqTu4kOCchTvxKPvX5imDWVS+YIorkC1Y1Qwyag6xI
 vCibyjL0sr7yrkHWh+39yLiEJ5VREL6tmdhqMlIBGGmOla1NHKtfSG2sr8jO3GtZeRe8
 ZZn8DZZPg654WT+tioMgpOEkuvsjI16qMtnLXmRK0LfRcLs+aZ+Bduv1lCTnyVQmc+Q5
 jP17pTIAe5tOBig/Qs/9ZxUqpys/khuDFO7k5Mbnwv6XMn0IgmZKHi3FX0l2HtITQXWe
 ezKw==
X-Gm-Message-State: AFqh2kqWLy+0MRjSAUc53cbENO8DhlAgo1+6LwOykEsqH/9nQmnYsiCn
 9poy0p1CMrLdMKiuZeXFPbKHS6/1/Q1qokXBB6owTg==
X-Google-Smtp-Source: AMrXdXvMw65HDtWFdqX2AnBda4/ddwCGwlF1XJLicIXoOn/3Sx6jOAd2wcSVV/Qr+2ien1/O22ItMviPcZfEztg61OQ=
X-Received: by 2002:a05:690c:fd5:b0:4a4:7135:9214 with SMTP id
 dg21-20020a05690c0fd500b004a471359214mr210838ywb.378.1672576057902; Sun, 01
 Jan 2023 04:27:37 -0800 (PST)
MIME-Version: 1.0
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-8-marijn.suijten@somainline.org>
In-Reply-To: <20221231215006.211860-8-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 1 Jan 2023 14:27:27 +0200
Message-ID: <CAA8EJpraCLQpWn3PZLz9BGYrESVdWmHw0LpNtcx9ntQ_9=HgRg@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] drm/msm/dpu: Remove intr_rdptr from DPU >= 5.0.0
 pingpong config
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 31 Dec 2022 at 23:50, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Now that newer DPU platforms use a readpointer-done interrupt on the
> INTF block, stop providing the unused interrupt on the PINGPONG block.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
