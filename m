Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4329A6B1162
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 19:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF0210E13D;
	Wed,  8 Mar 2023 18:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446F310E13D;
 Wed,  8 Mar 2023 18:51:06 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-176261d7f45so19707537fac.11; 
 Wed, 08 Mar 2023 10:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678301465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KxHmoWTI8MLGT4ZibFgSPu97U/Mok0BTnkOY7p1ZoA8=;
 b=Bh3n3DhjE9PyOSmfW+o07eJjCNKskeI/CYf7r9Bz7FMQ9/F0EoJuyf1hCekYQqs368
 +EzNm0SKpbnO9KVpFmXExDvbH7BpeuotBR81FxYnR26RieCgEah5kVJKy6AR+o9N2wh0
 PPlYZwk8HxW/jLSVHrCMvNP1seFyL+AsGA+ltuuiJzqlsdiU18IS+XPaqrngUoMU7Mc1
 gZxE5fbd+CmxHX2ZIWiIGu2X7tULpwaKjllVu9IOvQWxIAxx7PYk8B1qEk+kqWx8aIQY
 zzuwO+Dpnvkt21a+xbrypdRhuIbYfyN5zNVD7BNQ9K0TqmKm3gHSjW4rakRYhNhcnzeV
 trPg==
X-Gm-Message-State: AO0yUKV1CrsJfqFvAQNbDV6szsurbpms2nIgNnT+VrsN7FC8+udSD93d
 rSuhkAKETHI5amd0LW4JPA==
X-Google-Smtp-Source: AK7set9i5XHntQJl5sc/hGUJ494y7HgMwr3hwqLZ0laP2jB5VlHjCdPUWv4BQRChS7BqTraYIEMKDA==
X-Received: by 2002:a05:6870:7394:b0:16d:eac4:7b5f with SMTP id
 z20-20020a056870739400b0016deac47b5fmr11900569oam.48.1678301465508; 
 Wed, 08 Mar 2023 10:51:05 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 du41-20020a0568703a2900b001764b4a05f6sm6504401oab.39.2023.03.08.10.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 10:51:04 -0800 (PST)
Received: (nullmailer pid 3587173 invoked by uid 1000);
 Wed, 08 Mar 2023 18:51:03 -0000
Date: Wed, 8 Mar 2023 12:51:03 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v3 09/10] dt-bindings: display/msm: dsi-controller-main:
 Add SM6115
Message-ID: <167830146346.3587111.3542934829511061872.robh@kernel.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
 <20230307-topic-dsi_qcm-v3-9-8bd7e1add38a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-topic-dsi_qcm-v3-9-8bd7e1add38a@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 07 Mar 2023 14:01:47 +0100, Konrad Dybcio wrote:
> Add a compatible for the DSI on SM6115.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 8 +++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

