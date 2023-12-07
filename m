Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C39808E1E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 18:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DA010E0C3;
	Thu,  7 Dec 2023 17:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0739E10E0C3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 17:03:07 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5cdc0b3526eso7739797b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 09:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701968586; x=1702573386; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eGavWJn3BFskMXePj8G/Gc7zkKDdmqreyDRTVCoA6Wg=;
 b=csxMM7l47ljWqVxdS4Z4vO87cjyPAdpdH6/bTQsz+dhBNrZkbWvRNDl4QKhObhRdEj
 mNrGcPN8reG3exIQ8M6hMuW3KjTgohZKMeFwXcT7bDsRHZyCvSjczSaLEKoeXKdQ2IqD
 a6bdm5byjYSPlW/JsPyqyDn8+heUSOI0eu+hJuMhs+h/wrC97fyimH4L6FMWd9MZCpFo
 xZrcBXJdwEq9POdTIgcGfXTfwSVyEf9G3tgrY2yIpWkW12kRaQBek18mDx4rStuoP9u+
 CuQsjq3Tu1t2tRA9scmn/06idCDjyXzb+9OXuVDa/thLbkM9QvEOtvkPtlF/DbkCbizc
 80dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701968586; x=1702573386;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eGavWJn3BFskMXePj8G/Gc7zkKDdmqreyDRTVCoA6Wg=;
 b=whqzCi9otPjkx6mXeA8gqNIO+uv5WqMA64CekmAmVhdlJ4x/0gjPMxLkVB+04A+QlE
 qeXV6BHEb5FVILxjps1VjGVYiFjGlSa769zGGe/38X8cb/JIqQYSw0ztAxCDtnTfexpj
 mXVN1DVUZ0QtIKR9jLh7wDrgy7/k1tYdb9TWwcOig7rfMroSPKUZRQDs/C7LPDFgBuuS
 ODnAabylg+5eZcmEeaAGHez2136ia4dqyEZikOg1GUB1D0z3jksbfHAb0/jqBZ1wm+hu
 RBLuPoEwN3kJ89V41sJcs/lLebkogyPDqClcUvhzzF0F2adZD8PQfu9Dw2mCS6XFOqmV
 YgtQ==
X-Gm-Message-State: AOJu0Yzv9hbL8ebtCsT0wP9oBUdif3z45Sn30Wkq05oXO6uda/w9wQl3
 UKLn72MnifuNSlMa6FJ0oKstWiMBybMb5/bYHhsOUg==
X-Google-Smtp-Source: AGHT+IFi1Lw+dYQG5rp3RmkzlgCLipb19CQiXyiuFQHGeZdsmEG6DXb3riJxACss4LeAc2sE3dJFU23/biQpd2Etzf8=
X-Received: by 2002:a05:690c:2b06:b0:5d3:b71b:4d30 with SMTP id
 em6-20020a05690c2b0600b005d3b71b4d30mr3163725ywb.17.1701968586143; Thu, 07
 Dec 2023 09:03:06 -0800 (PST)
MIME-Version: 1.0
References: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
 <20231207-topic-sm8650-upstream-dp-v1-2-b762c06965bb@linaro.org>
In-Reply-To: <20231207-topic-sm8650-upstream-dp-v1-2-b762c06965bb@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 19:02:55 +0200
Message-ID: <CAA8EJprskAYWm6M_yOOmUEHdWV9Ot3_VBxo4MtPYDKBizPHyuQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dp: Add DisplayPort controller for SM8650
To: Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Dec 2023 at 18:37, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The Qualcomm SM8650 platform comes with a DisplayPort controller
> with a different base offset than the previous SM8550 SoC,
> add support for this in the DisplayPort driver.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)

-- 
With best wishes
Dmitry
