Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B17E6984E2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 20:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FF510EC12;
	Wed, 15 Feb 2023 19:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D2D10E2AA;
 Wed, 15 Feb 2023 19:46:56 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id bi19so16820648oib.2;
 Wed, 15 Feb 2023 11:46:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ES8N8Hh2D7hQsUypK+gMa+ocupch+L82j/qPG7r9WpE=;
 b=XqabWusdW08wsG5lEzAKpwXTgGQDvcpbCbJJ/AYSHcc6AjSLvk0D4JAG+LYkEhTvhL
 /kP7k1W+nZwJppDrEFDMXCEVjUj2eM/i74ZuR5wvpiFQoOY877lM3DZ8BbY2/Fzw8NJY
 699BJ1HsjIbXBFGNB6Xmi7QPLPjbiPjQjfGV2Z5nDIzSRXBZ6UJ28KRQr6cbYktXwRzE
 J1MlZFn+zYHyDsgj55DDk79fNo0+iO+/Pd9l8U/gBuF3C371doIz5OMAlHoypxOw9Leu
 RehjP+n9exoae1VpgnWWPpGxZKGzjpgGoeC/Lg89loh4YkSnpMoqQ1079ltElMnEIpDC
 jsDw==
X-Gm-Message-State: AO0yUKXkOL9+2mAqi/NyYn9rHxqzrCsZ0D/24gx8e+f1YfIaFn9/8k0r
 ZWLZmwF9K19CfflQZ9qHjg==
X-Google-Smtp-Source: AK7set8ruhe6908E1A45EySWkYOia5CVpYGuR38kcmC2APgjfq0ejeqyOBjiYT28fJdXwmCjaOc3zw==
X-Received: by 2002:a05:6808:1314:b0:377:f784:3332 with SMTP id
 y20-20020a056808131400b00377f7843332mr258161oiv.24.1676490415555; 
 Wed, 15 Feb 2023 11:46:55 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i126-20020acaea84000000b0037887ca2150sm7612534oih.22.2023.02.15.11.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:46:55 -0800 (PST)
Received: (nullmailer pid 458210 invoked by uid 1000);
 Wed, 15 Feb 2023 19:46:54 -0000
Date: Wed, 15 Feb 2023 13:46:54 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: display/msm: dsi-controller-main:
 Fix deprecated QCM2290 compatible
Message-ID: <167649041349.458158.6164203599398852315.robh@kernel.org>
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
 <20230213121012.1768296-2-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213121012.1768296-2-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, agross@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 13 Feb 2023 13:10:04 +0100, Konrad Dybcio wrote:
> The qcom, prefix was missed previously. Fix it.
> 
> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

