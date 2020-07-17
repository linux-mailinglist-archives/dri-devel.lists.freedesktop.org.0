Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A7C22427E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 19:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72316E22A;
	Fri, 17 Jul 2020 17:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704546E22A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 17:47:19 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id f12so11718142eja.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 10:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MCHMQCyaGiFmiAEOZCGJJ9+ZHHBfKYMD4ndLx0utt+k=;
 b=kL6cSQaA7ZAVb822SFcAn7jM2Z6R7qPL+QjfpbvzDVzuf+tomRxqOFWAJ20xTDf1tY
 2rbaQqrOLOC/Bo8gmXu2gTHqxX6Qo4NB57ye5M0qR6u6UtQM5s8N+0UVlh9tLUyFdjL/
 Eyj8QpTzQ9BBM2QPHD6E8YuSF8JTRCENbiVEYnryF8HkLcdFxrbD313fC06dlQ2mRqAv
 YMyf04NxtyDacYtALlkVvz5xR1aGACID1vGMZI0WQsm1aXahrqOuctfNzpptlK/1atPw
 h5zCqVW2HBLNE64+8ZJPcJqL5mjo3EtLkUTKyOAKfciGLTj114RioK73jR5iAjg69Lsb
 XMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MCHMQCyaGiFmiAEOZCGJJ9+ZHHBfKYMD4ndLx0utt+k=;
 b=Wb+uAZPd7ng2yeg9kXveaAeiHQ5AsBzW8KttUJW6aN/uXUWuTEX54V0+rlyzotiWt0
 rnNsfJ8i7x48LLfeMkrfpSrS/vMFIb0l5ShYpzcjS9w5YdTyopxLd4MhGQCyhccUdlhz
 qYguNLRWuRPnfEYnRAK//JjFzgCgVTdWLDIMQoY644b8ALZ+KGNd3WGgYYWrLDiWsNIE
 DbMSsP4Ysvirk7niy+JNWG4mkBBWo4rzUI5KvHbXv13YwBwYma8H3Qp9J+qmQ2lmUAO7
 uqbhmHIu78+smGPQUaMDKqkrwcdu+cKzoawAVeE29VLi8i8Spzvpp0qiRQ2OmQk0bfBQ
 dxkQ==
X-Gm-Message-State: AOAM533Z4fePskZ5TzrclMXoirCxg37dRtBai8TNpq3T5oQ194xm46oY
 IRyFqY3FBTTLpFxHt1ZSGDvfiO2d43tKqUutL5s=
X-Google-Smtp-Source: ABdhPJwtmM5I9XsUxydmrAjDhrNrNvfs/8okO6i9fpHQnBYs8v9G4H73wAYeFtCw/gPwg6HQpmgc6UytC/0WnR2RsRo=
X-Received: by 2002:a17:906:7c54:: with SMTP id
 g20mr9931963ejp.460.1595008037981; 
 Fri, 17 Jul 2020 10:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <1594292674-15632-1-git-send-email-rnayak@codeaurora.org>
 <1594292674-15632-4-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1594292674-15632-4-git-send-email-rnayak@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 17 Jul 2020 10:47:51 -0700
Message-ID: <CAF6AEGvioVKKSN-UP35OfJcfUXeHy34Y6w2eM_FZU+zpTaRE7A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: sdm845: Add DSI and MDP OPP tables and
 power-domains
To: Rajendra Nayak <rnayak@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>, Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 9, 2020 at 4:05 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Add the OPP tables for DSI and MDP based on the perf state/clk
> requirements, and add the power-domains property to specify the
> scalable power domain.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Tested-by: Rob Clark <robdclark@gmail.com>

Bjorn, the two driver patches are queued up in msm-next, I assume
you'll pickup the two dt patches?

BR,
-R

> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 59 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fee50d9..3efdd70 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3296,6 +3296,35 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               dsi_opp_table: dsi-opp-table {
> +                       compatible = "operating-points-v2";
> +
> +                       opp-19200000 {
> +                               opp-hz = /bits/ 64 <19200000>;
> +                               required-opps = <&rpmhpd_opp_min_svs>;
> +                       };
> +
> +                       opp-180000000 {
> +                               opp-hz = /bits/ 64 <180000000>;
> +                               required-opps = <&rpmhpd_opp_low_svs>;
> +                       };
> +
> +                       opp-275000000 {
> +                               opp-hz = /bits/ 64 <275000000>;
> +                               required-opps = <&rpmhpd_opp_svs>;
> +                       };
> +
> +                       opp-328580000 {
> +                               opp-hz = /bits/ 64 <328580000>;
> +                               required-opps = <&rpmhpd_opp_svs_l1>;
> +                       };
> +
> +                       opp-358000000 {
> +                               opp-hz = /bits/ 64 <358000000>;
> +                               required-opps = <&rpmhpd_opp_nom>;
> +                       };
> +               };
> +
>                 mdss: mdss@ae00000 {
>                         compatible = "qcom,sdm845-mdss";
>                         reg = <0 0x0ae00000 0 0x1000>;
> @@ -3340,6 +3369,8 @@
>                                                   <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>                                 assigned-clock-rates = <300000000>,
>                                                        <19200000>;
> +                               operating-points-v2 = <&mdp_opp_table>;
> +                               power-domains = <&rpmhpd SDM845_CX>;
>
>                                 interrupt-parent = <&mdss>;
>                                 interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> @@ -3364,6 +3395,30 @@
>                                                 };
>                                         };
>                                 };
> +
> +                               mdp_opp_table: mdp-opp-table {
> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-19200000 {
> +                                               opp-hz = /bits/ 64 <19200000>;
> +                                               required-opps = <&rpmhpd_opp_min_svs>;
> +                                       };
> +
> +                                       opp-171428571 {
> +                                               opp-hz = /bits/ 64 <171428571>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
> +                                       };
> +
> +                                       opp-344000000 {
> +                                               opp-hz = /bits/ 64 <344000000>;
> +                                               required-opps = <&rpmhpd_opp_svs_l1>;
> +                                       };
> +
> +                                       opp-430000000 {
> +                                               opp-hz = /bits/ 64 <430000000>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +                               };
>                         };
>
>                         dsi0: dsi@ae94000 {
> @@ -3386,6 +3441,8 @@
>                                               "core",
>                                               "iface",
>                                               "bus";
> +                               operating-points-v2 = <&dsi_opp_table>;
> +                               power-domains = <&rpmhpd SDM845_CX>;
>
>                                 phys = <&dsi0_phy>;
>                                 phy-names = "dsi";
> @@ -3450,6 +3507,8 @@
>                                               "core",
>                                               "iface",
>                                               "bus";
> +                               operating-points-v2 = <&dsi_opp_table>;
> +                               power-domains = <&rpmhpd SDM845_CX>;
>
>                                 phys = <&dsi1_phy>;
>                                 phy-names = "dsi";
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
