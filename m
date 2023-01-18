Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E080067238A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B5110E79E;
	Wed, 18 Jan 2023 16:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DC510E79E;
 Wed, 18 Jan 2023 16:38:44 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 h12-20020a4a940c000000b004fa81915b1cso973566ooi.4; 
 Wed, 18 Jan 2023 08:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0f4AajlKivLZzEuRli1ZnJsZtgypNSW0pfvgWosYbSg=;
 b=dLvLERASHp91SN/dxt7GQPB7mC5/ZUAPlqgSt8ppAdCrJIOFKyQJ8Vl5DdzIteriGe
 +S03PbgJikASw8knoHaOsRt3RWpTCtk2Ul3+tSBMFEvvwFfJXucH+P99UZG5cKPxiwH+
 9xyIFldgSAo098UsuO4hpEtCxFkAjHCArAxjOKtItZpejrVVDU8gQzeTB1OplTBcvYLa
 /F3nvu8ZFDLH1/LMij4TMJln0p05ihTqvdHpKeNw+S/GfTqyn6+hZBGE/BWNxHUOM+3Y
 PKUfd9xhJRkPzjJGRd6zQm2CREP5Jgz1vJSzRFKaE66RjkB0cC8ROFZjqZebAnWtE59Z
 CNkA==
X-Gm-Message-State: AFqh2koCOdWGqK33tQrCPXcYgPIEh7ZGPqC89asHNvGBaJrl9deaVC74
 QhBGK2DDnsNXO6eyr66pXEv3QppqyA==
X-Google-Smtp-Source: AMrXdXuxkYOQs5Ku/hOsUiwkyRuQTRSetfG/ANmbqW9hvEZctLIMrBYb93DE+Crp+bmR/O1ZXrXd5A==
X-Received: by 2002:a4a:3745:0:b0:4f2:cf1:36ee with SMTP id
 r66-20020a4a3745000000b004f20cf136eemr3662087oor.1.1674059924192; 
 Wed, 18 Jan 2023 08:38:44 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a056820030400b004f73632d096sm2905262ooe.6.2023.01.18.08.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 08:38:43 -0800 (PST)
Received: (nullmailer pid 134153 invoked by uid 1000);
 Wed, 18 Jan 2023 16:38:43 -0000
Date: Wed, 18 Jan 2023 10:38:43 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: add qcom,sc8280xp-edp to
 list of eDP devices
Message-ID: <167405992255.134101.6407970989523760202.robh@kernel.org>
References: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 18 Jan 2023 05:17:15 +0200, Dmitry Baryshkov wrote:
> Add qcom,sc8280xp-edp to the list of eDP devices, unblocking `aux-bus'
> property and fobidding `#sound-dai-cells' property. Also since
> sc8280xp-edp, overriding sc8280xp-dp, will contain 5 reg resources, drop
> the reg contraint (as it will become equivalent to the top-level one,
> requiring min 4 and max 5 reg entries).
> 
> Fixes: b6f8c4debc00 ("dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
