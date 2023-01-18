Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D488E67238E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28B910E79D;
	Wed, 18 Jan 2023 16:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595A310E79C;
 Wed, 18 Jan 2023 16:39:11 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 f5-20020a9d5f05000000b00684c0c2eb3fso10905885oti.10; 
 Wed, 18 Jan 2023 08:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1LIN2pCgiEqpzEppt5R/k/8ZARlzAK3/w8Uxd8kz5AY=;
 b=3N0RijTQSVfVYZudjkhH9Siq5zA8aT0wXPvaqAgkKVn8qKUodfp3AtqzfEJ9Fm6Ahs
 vzIe239mDGYPZwivjprgEIPeePrEaXTM7wIWKbYpF991VIxrmTdtw95HiRHTW+vYG5AF
 LBFdXSD+vfKX6ErYHOLxn09PanYm5jpHlDb/n8WlyS949F3iBsW8HlA6WDzZAom6WTkU
 q2cWfJhAStlAGPwkSSBRUqh1TBwQFAO0nz5aZAigAiZ4yyTFI93zq3ZN3KDv1qdhJmDa
 2g64sXHAeHBxMc/0phyFDby8Zw+o5SWvAltmhBJ2TE2ZRuKZocwnqwX3o5UsVfi8dlu+
 n1hA==
X-Gm-Message-State: AFqh2ko/vPQ21Vt1xz4jpAo7JmzZR581Ey/V9gu5Wy407yS4iqUnZRgy
 pWKVH48X8twbSADRgmyMAQ==
X-Google-Smtp-Source: AMrXdXsFPNs+/L2oeSD8CarId/6QwbzGw9mR31SKjD/iKEhEkuaMEZazpJZos257w2NMkXj2ZJ/ENA==
X-Received: by 2002:a9d:5c10:0:b0:670:88fe:6613 with SMTP id
 o16-20020a9d5c10000000b0067088fe6613mr3486011otk.0.1674059950561; 
 Wed, 18 Jan 2023 08:39:10 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a9d5cca000000b0068657984c22sm1028510oti.32.2023.01.18.08.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 08:39:10 -0800 (PST)
Received: (nullmailer pid 134856 invoked by uid 1000);
 Wed, 18 Jan 2023 16:39:09 -0000
Date: Wed, 18 Jan 2023 10:39:09 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: display/msm: qcom, sc8280xp-mdss: add DP
 / eDP child nodes
Message-ID: <167405994883.134798.3210451257318456033.robh@kernel.org>
References: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
 <20230118031718.1714861-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118031718.1714861-2-dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 18 Jan 2023 05:17:16 +0200, Dmitry Baryshkov wrote:
> Describe DP and eDP devices as subdevices to the MDSS on SC8280XP
> platform.
> 
> Fixes: 45af56bf2d74 ("dt-bindings: display/msm: Add binding for SC8280XP MDSS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sc8280xp-mdss.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
