Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44553247FD6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C4C89CD3;
	Tue, 18 Aug 2020 07:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32356E156
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 00:24:36 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id bh1so8369546plb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 17:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=fIzNe6kBLkkiD888cP6x/Hi2iQ+s1AZsPih0Qi4fjZc=;
 b=IA5/pMtMp5vroeKoC6E1UoM88UwlNdVHVR28k5xmCUvR+oKpm7Qf27cSaXhCse3vky
 Cjwd30Twk5TQNDX0tLBWQO1YIxZGch6pxTP0WGflQiEKqUk9VikrGPipVoOXhQNU9uGC
 c6f0invxLMEpoZ/uvU+OO1lVPwA5CH4mgGASA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=fIzNe6kBLkkiD888cP6x/Hi2iQ+s1AZsPih0Qi4fjZc=;
 b=rgqvLpJfr4E1D017gEGkHh2PMay5pyV1wunN+Vbz2iZbueoPTYgieM1x5Ltk5IfoHA
 u+t/Ulod5p8tD2ATHVKBS9C74YFL8Q8VvLpyFwgwN6IYRBpW53N5IUGtJWlJIZA9cKLK
 pIgUrwvtRoxHJDewKBa/Aa4a6AqDsTM9G/SJ9unCsj1/6u35xI7ya36VjOGF0Eaann8Q
 DBB89pHlNUeOBvydw8Q4V2IRbu2MFRBkLMdFAI0D8GRB1Z6KXP0dIWZnq2rUcAQsEALN
 EwacOy3im2JlOrMHxXXUcwxZvlBZdjF35svlsYJkPngy80X8/dN1HmbS6Wgs7b6/oMDS
 afFA==
X-Gm-Message-State: AOAM5336ATjrzqtYK/dS0xf/5JlvAxMWSB0doHQQ5bTxdh0HOluNoUFQ
 h7O/nrJOnFn28jNBbcLTXscNkzWLWxUsRQ==
X-Google-Smtp-Source: ABdhPJySOSK83lgv0VrVvSo5NN8HgXozKW5Xwsrc4v9hYedTPLRrqRuviKh2CudX25Tf3teS8OfmDw==
X-Received: by 2002:a17:90b:150:: with SMTP id
 em16mr15073789pjb.86.1597710276290; 
 Mon, 17 Aug 2020 17:24:36 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id l22sm18949038pjy.31.2020.08.17.17.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 17:24:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200817225300.2209-1-tanmay@codeaurora.org>
References: <20200817225300.2209-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v6] arm64: dts: qcom: sc7180: Add Display Port dt node
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>
Date: Mon, 17 Aug 2020 17:24:34 -0700
Message-ID: <159771027430.2423498.17739000479526174339@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Cc: devicetree@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-08-17 15:53:00)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 31b9217bb5bf..bf2f2bb1aa79 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2440,6 +2447,71 @@ dsi_phy: dsi-phy@ae94400 {
>  
>                                 status = "disabled";
>                         };
> +
> +                       msm_dp: displayport-controller@ae90000 {

This should come before dsi-phy and dsi node. It should be sorted by the
address (0xae90000).

> +                               status = "disabled";
> +                               compatible = "qcom,sc7180-dp";
> +
> +                               reg = <0 0x0ae90000 0 0x1400>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <12>;
> +
[...]
>                 };
>  
>                 dispcc: clock-controller@af00000 {
> @@ -2449,8 +2521,8 @@ dispcc: clock-controller@af00000 {
>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>                                  <&dsi_phy 0>,
>                                  <&dsi_phy 1>,
> -                                <0>,
> -                                <0>;
> +                                <&msm_dp 0>,
> +                                <&msm_dp 1>;

Don't think we should apply this still because the binding will change
when the phy is split out to qmp node. Maybe just leave this part off
for now?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
