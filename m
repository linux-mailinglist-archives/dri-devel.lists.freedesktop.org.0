Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7560E54E62A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 17:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144A810E3E2;
	Thu, 16 Jun 2022 15:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271B810E2DA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 15:36:11 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id u12so3480352eja.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5dVDuCM8VRK665zH/HV+gDuurZlzqRaw3AF4f+4QEQY=;
 b=YpSpNH3K+KjKkXCuVKrFBcVrP5SWlYv3RWSSUdRdHJUnj+BZbndMy/7IyaCo4ZQ5rb
 d5YerNu+HSuaHbXK9sCxIH2I4yswgUI5cbWPgvOV+jsqmpGVVOzFPK8wchjbBtnuyFNC
 yiHYfw8thWjslkqgb7sZ31mB5KIv7561wqhQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5dVDuCM8VRK665zH/HV+gDuurZlzqRaw3AF4f+4QEQY=;
 b=zt3PkxAem/jpCXyObljCFZXlAMTErXqJAzMaKHbAdewuYriHHNI9xP92CesSb52osI
 QFksxXP5DZ7sg1MpWbZZdErCmLkz8wqju+RB4thCW5MfcksImGGvTIyRzDsZeg77UwWc
 rvX3NRVs8EURsSSSLYeoF90eW8nLPIrD7OK4wif64pO1BMGZuLQGYAhu/MSgJcldmRoq
 9nkMDRpvb+jBBPEcJzWTb3UYM0NhMZt97MH74xz6KHJ16E/0o/ffL0M0pJAXjbhJTeXI
 4rLqIth8D8vZOGmSXDgUx2KfbhEa832GLK6sI86c/o29d5CKt5yggbwq45liKBhEGi4O
 /uig==
X-Gm-Message-State: AJIora8csyySK8Ls5Qn6WOoHKbo+T/iNFPhheFAEI62IJv44u4amiT9W
 fL+TKAgLpQM+nS+zgBe5ixcvOVnZaiJcTcXICOM=
X-Google-Smtp-Source: AGRyM1sKSiXxm5CfY1lHYiHV+G0DtLraofZRfshCcuYCcZ1s9LPCddFKy71sXdHvwuHZJTjXRDw2Xg==
X-Received: by 2002:a17:906:804a:b0:70c:1dac:9bb8 with SMTP id
 x10-20020a170906804a00b0070c1dac9bb8mr5024597ejw.92.1655393769281; 
 Thu, 16 Jun 2022 08:36:09 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 u14-20020aa7d88e000000b0042bc97322desm1968923edq.43.2022.06.16.08.36.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 08:36:07 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id g4so2352750wrh.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:36:06 -0700 (PDT)
X-Received: by 2002:a5d:68d2:0:b0:210:31cc:64a6 with SMTP id
 p18-20020a5d68d2000000b0021031cc64a6mr5183133wrw.679.1655393766098; Thu, 16
 Jun 2022 08:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.2.Iae013f0ff4599294189f3a6e91376fad137bbabf@changeid>
In-Reply-To: <20220425140619.2.Iae013f0ff4599294189f3a6e91376fad137bbabf@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 Jun 2022 08:35:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wbi=CXhPpOUJj=1PdgB8i6Lf1Sfr=T7wrQsgBx790S_w@mail.gmail.com>
Message-ID: <CAD=FV=Wbi=CXhPpOUJj=1PdgB8i6Lf1Sfr=T7wrQsgBx790S_w@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: phy: List supplies for qcom,edp-phy
To: Vinod Koul <vkoul@kernel.org>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Apr 25, 2022 at 2:07 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> We're supposed to list the supplies in the dt bindings but there are
> none in the eDP PHY bindings.
>
> Looking at the driver in Linux, I can see that there seem to be two
> relevant supplies: "vdda-phy" and "vdda-pll". Let's add those to the
> bindings.
>
> NOTE: from looking at the Qualcomm datasheet for sc7280, it's not
> immediately clear how to figure out how to fill in these supplies. The
> only two eDP related supplies are simply described as "power for eDP
> 0.9V circuits" and "power for eDP 1.2V circuits". From guessing and
> from comparing how a similar PHY is hooked up on other similar
> Qualcomm boards, I'll make the educated guess that the 1.2V supply
> goes to "vdda-phy" and the 0.9V supply goes to "vdda-pll" and I'll use
> that in the example here.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Even though patch #1 in this series should be dropped, this patch
(patch #2) is still valid. Vinod: I assume this would land in your
tree along with the first two patches in Kuogee's series [1], which
are related. Please let me know if you need me to re-send or anything.
Thanks!

[1] https://lore.kernel.org/r/1653507433-22585-1-git-send-email-quic_khsieh@quicinc.com/

-Doug
