Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E041543DFC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 22:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D168D11A0E5;
	Wed,  8 Jun 2022 20:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F2111A0E5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 20:57:15 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e656032735so28825020fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7HuOLi1pz8TClFoTL+rZB2VywOYDNgZNcPsKAhcwhDU=;
 b=G21/aKkUSjkrb1rz382eogv0q+fqealbOBP6erxKAk6hOhSVN1Gb5tADqPrMJrcTpE
 LBGyoN22m373bi4xwyHHpBY7THXwbBjsdKkd2QEiW1VylqSYPJCMzQ+98B2QamS3jBr9
 D6LDnHUesGUIrGR/j6Q/1b/o0kaR7DNAXo45Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7HuOLi1pz8TClFoTL+rZB2VywOYDNgZNcPsKAhcwhDU=;
 b=UUlEuWo6o0i9TF5bEEibeLg/C7kRo4Fyt2TMK82iGxUnqrfs5oPALjcYmBQ7wmmyi/
 lqD0mFMl66+zudrn/DGIffbLl+g/dZPl1SlyWovtaEWoCJEudybwntBR2rmmXq8d50vH
 utb52Mszqnz+GGJa669tAcsZ4uA2YAv30Mbkql9v87K4Ps0diMqNGbZQhUPICdpJ0pmo
 W5duUh63PiJwxQIMvXY572Z3W3FQRnq6iyGgc+05Xgv+fuSrKu4c3IoNVLw+uyCBv2Zh
 OaL0QKR9jmLFsD9wX5BM+4hv+jmtFSZbaBjcbTv4OMVHj5OpUyzXYMzD8zzhXUVrGEcZ
 s10Q==
X-Gm-Message-State: AOAM531rj4/GT83MnoUXRLIlFju1Psgxlv05pL6PwQmZQcoWZWROQvmY
 UtWruBBGBC2UNem5QStrdLlQuhTO6jom80vwAtm2Mw==
X-Google-Smtp-Source: ABdhPJwENV+5v4HsKCmxScnymfhi+4EFnfR5wionjJb+lf3WPyLHg71mAzkYzbBGADbUwxuUs6CBt/xEv3nXYPRu8Mk=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1751882oap.63.1654721834435; Wed, 08 Jun
 2022 13:57:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:57:14 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-5-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 13:57:14 -0700
Message-ID: <CAE-0n53MTinLneHvkyf8UY=nzy3jTK8-f56BusQJ+0G+CSiMyw@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] arm: dts: qcom: apq8064-ifc6410: drop
 hdmi-mux-supply
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-08 05:07:15)
> The HDMI circuitry on the IFC6410 is not powered by the 3v3. Drop the
> hdmi-mux-supply property.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
