Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7752B663AFD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D99B10E552;
	Tue, 10 Jan 2023 08:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A78210E0CF;
 Mon,  9 Jan 2023 23:16:25 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bf43so15543820lfb.6;
 Mon, 09 Jan 2023 15:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oKRTpVUA1bI23v2sl/8AqQtigjh3NRGLCQQVjyhb50M=;
 b=ID5RD1P7egCKU0bXKs/7TL+oy2vbYrPqA0fq7RbCjpuJJqD6y2euMfTbN41bE9TTrd
 kcR+UfBHEAzY/iTEb8RbL7VCxXF9kTU5/Av8IhzbDu9kHOrnFDFclf7j0435UU1BtpN9
 8ak6JABZpw4OjpAgzCyH4cJn1HsbQL8jCWqrU9TSAb95BiP8h5EfoQhRoAGnY03WuEMh
 8y2yOHsvdcpcgGvRxTpx96IjxORm+b/mJAwaCYUmE7emfv2Ba7HeT6WUS8bDoMJcK2q+
 czJPJACiYDaVHkzsWQ/L+YV10/qcWMbL5nn4TfdqirIQut77ERzZG/aiVhVNsINW7xD/
 OmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oKRTpVUA1bI23v2sl/8AqQtigjh3NRGLCQQVjyhb50M=;
 b=PbvxpL/4SQfDcFyApdKgBVDmPywls1bJmMErfyk2bffC0N1lZIzHB3HyLFnxio45gU
 Zgt8H564D5oZPeHyBGOS2tPQ3YFF6HwwopMpJVJ7xinoibnd09dzxuSLmX/I7vuXHqUZ
 uAdDUqNrZH61ptDa1owiVn4oVHJj9vy3na85BXzhwqewSN22DCAfBjM9Sqqg0mYKpZo2
 j9m60uPyQNiZiCc0//aJvwK3UnApraPFeDgVOQSv6liqtDBUdotGjnQI+TRMso0t+6wK
 2/bzp9tJPrCVIu/y4oCD0+RU8xlFRjE0c/2ApvcuhbjjyizQ2/5Qkm9PWLEbELn8+Eyf
 1CMw==
X-Gm-Message-State: AFqh2kons+Mb/cU54zBK6o2VgSRLtuyZi/LbNsatIykZ4cHL+SB0Mk8t
 liLnGWN0n8q+n8+yPPcS2YQ=
X-Google-Smtp-Source: AMrXdXuXusu5oFoA/8A3+GlBsZULT5rze2ntTHddBwCY5Dp49n+TXLshx1vPGl+8Qyei8sjiNOtWzQ==
X-Received: by 2002:a05:6512:2828:b0:4b9:f5e5:8fbc with SMTP id
 cf40-20020a056512282800b004b9f5e58fbcmr24474236lfb.30.1673306183433; 
 Mon, 09 Jan 2023 15:16:23 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q6-20020a056512210600b004aa0870b5e5sm1836900lfr.147.2023.01.09.15.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:22 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
Subject: Re: [PATCH v3 0/7] drm/msm: add support for SM8550
Message-Id: <167330408777.609993.13359003796525315964.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:28:50 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 09 Jan 2023 11:15:17 +0100, Neil Armstrong wrote:
> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8550 platform.
> 
> This patchset is based on the SM8450 display support serie at [1].
> 
> In order to work, the following patchsets are required:
> - PM8550 LDO fix at [2]
> - DISPCC driver at [3]
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display/msm: document the SM8550 DSI PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/71917f654bae
[2/7] dt-bindings: display/msm: document DPU on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/602082368233
[3/7] dt-bindings: display/msm: document MDSS on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9cb8eacfb528
[4/7] drm/msm/dpu: add support for SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c3cc4e88efb0
[5/7] drm/msm: mdss: add support for SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f96cca5ed719
[6/7] drm/msm/dsi: add support for DSI-PHY on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0fd17f93661d
[7/7] drm/msm/dsi: add support for DSI 2.7.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d797ca161b87

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
