Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C014F55131B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 10:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E471810E2DC;
	Mon, 20 Jun 2022 08:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CA710E2D4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 08:44:41 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id u12so19641997eja.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 01:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YVi3D194sdyxvkGLsBfImbrrFHaWe6koIaOfRs7xpZY=;
 b=GPJVd9wkS9872Pj6ecAxEq4OgSG9RQlHL7uaN25HxLizxECezEa516LpRk84sqWK3Y
 fWhr02IZzun6+I5QhG6UV4h7kEJ615sHnaYtV1mA8qPMVQc/vd4UZHDX8HAGh76E12aL
 RB2eyQHZcDVnN/wLQ+E9FtzLksHOdVnc4UMA6bNJm6V2QtPXeM3Wd22lQbPTxGKZuiBT
 DN8OVWndEk+6BM8JCt/OAdkxe/MLv/cxfDxfY8tOPuhMIfyDPKDQDROTERcYrBnHAlRe
 DuceiGj5V9LPzVZP+npWxX+NDPlSg9SJywqHCgbnpQfwPla/iECYH/RktYNt90kJlRDP
 PZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YVi3D194sdyxvkGLsBfImbrrFHaWe6koIaOfRs7xpZY=;
 b=HPxJJ2sAdYFH1/qxH8iqsr8Tpyk+9J5x6wjynfQqhh6xTZZP9he6q/xv+kDsZ6BIuT
 SRU56l20GolNTDGDXvaRiL80NuArT15YHaioFRdyCL88EWpzry7ttofDpoIZ+aJM1kH2
 hx8d31FabEsqh3lwRjyEmcGQcqgcmV6ydBSHefuLXSAn4RgmljKm9oGK5Xpz4uYVdT5l
 Wpjag74JRatb5nj+QE/R3DqNEu3OrAFURWtK3Nuh0bR4hCTCnLJWN3Ty4/fKsbiilw+Y
 Iu6jH0FO3cd0CpUsqHYXqM5+lvb9eScAb9DvfnxUkMn41qD3wRYGBy6SnYnhRCN0NPf0
 J41Q==
X-Gm-Message-State: AJIora9yLlLLbAo6ODGgH/zIzaYI9w9BKLTiPrifmVFkfqyKgIKREDa6
 nN5VH1verx494b84lAToVXoTBZZw+XFhng==
X-Google-Smtp-Source: AGRyM1vBG8xyJ+oIiy6ksUK6rwiJB4h9TTzdrWLDcYP9XK5oslrB5xcWli9w3hX/TofWDYdMRlCMVA==
X-Received: by 2002:a17:907:1c87:b0:6f0:29ea:cc01 with SMTP id
 nb7-20020a1709071c8700b006f029eacc01mr19990953ejc.671.1655714680330; 
 Mon, 20 Jun 2022 01:44:40 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 o2-20020a170906768200b0070fd7da3e47sm5525104ejm.127.2022.06.20.01.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 01:44:39 -0700 (PDT)
Message-ID: <93da288d-d6c3-56c8-676c-c5ed22de7bd0@linaro.org>
Date: Mon, 20 Jun 2022 10:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8996: add #clock-cells and XO
 clock to the HDMI PHY node
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
 <20220620010300.1532713-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220620010300.1532713-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/06/2022 03:03, Dmitry Baryshkov wrote:
> Add #clock-cells property to the HDMI PHY device node to let other nodes
> resolve the hdmipll clock. While we are at it, also add the XO clock to
> the device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
