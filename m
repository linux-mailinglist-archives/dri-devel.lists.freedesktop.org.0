Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63B24DD02C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 22:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E4F10E101;
	Thu, 17 Mar 2022 21:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1038610E101
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 21:28:27 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id q129so4988593oif.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 14:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=UNSHY9stDEkYj4x5uGDPU+/xpghSYFwE9UEK93GK/gM=;
 b=UJ6ChFrD90E+fyCqG323ewJ4CboNt0noYEGXnfAPEfX84YTjFpiHIqWLGryy+REnEl
 m+BeB7MRpK2nOqB4s2Vd8hj6AzSxqmyqCSgGwWoDz4bynPsW6Kd44b2jxUBbqTKRdx5M
 rGSwbd+IxqOivaCpFLd6L9XgHkiW067VR7wP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=UNSHY9stDEkYj4x5uGDPU+/xpghSYFwE9UEK93GK/gM=;
 b=RQ+8K5jzh4WdN4mo8TKfj+simHx971wbkK59qSZyM2qtQ0lYbw82gYCUgQD62q2Bh8
 EmzGYJ6dtY8ZcK81W7dTLvwwUk+YBHjyfsa32Y2yvfNK5Cbn28O54TCMavFP4DY3eSwK
 2XBpQY2hKbfKfsxGk7xz2OKiam/G6zkyk3pqoIW1Q5IAxL8SvS54E55VjaAiaoRTVD3t
 M7ooZPXAseNjCqkiBUzkG2C0MAN/zyT6Gzfqug7Q7xy0VgO/W45LJIp1BFk8bwMV/ZTF
 RbpLL6PrecolpAiZI/02XdIwxxAuf9uJ37qp3e6pJlFhmVw6p0tmkgeITfd0PmwgRB+D
 qu7A==
X-Gm-Message-State: AOAM530wHINebs5sH51FTl4u8XygvzRp229YgLwQzsJUotSX2exMVPpv
 qKgheSah97fZiT1jcogLoA2236zmDyvPexTXDRdSqA==
X-Google-Smtp-Source: ABdhPJyv2KBnd9epOKRH7UvrY9oWjNtBrVHvuV99b+9vkNMSlZzoiR1rQ+l7ignHhDoNDiXp1SY6ndIb2XVw3NaYJjs=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr3029465oif.63.1647552506394; Thu, 17
 Mar 2022 14:28:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 17:28:25 -0400
MIME-Version: 1.0
In-Reply-To: <1647452154-16361-4-git-send-email-quic_sbillaka@quicinc.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-4-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Mar 2022 17:28:25 -0400
Message-ID: <CAE-0n51SCm2HJ4O-DPJy3zKLrbgn9EFQbYPkzJDyqNncnC=4mA@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] arm64: dts: qcom: sc7280: Enable backlight for eDP
 panel
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, sam@ravnborg.org, quic_abhinavk@quicinc.com,
 robh+dt@kernel.org, quic_khsieh@quicinc.com, agross@kernel.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, thierry.reding@gmail.com,
 krzk+dt@kernel.org, bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-03-16 10:35:48)
> Enable backlight support for eDP panel on CRD platform for sc7280.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>
> Changes in v5:
>   - Separate out backlight nodes
>
>  arch/arm64/boot/dts/qcom/sc7280-crd.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> index 2df654e..16d1a5b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> @@ -37,6 +37,15 @@
>                 pinctrl-0 = <&edp_panel_power>;
>         };
>
> +       edp_backlight: edp-backlight {

Does this also move to qcard.dtsi? Why can't this be combined with the
previous patch?

> +               compatible = "pwm-backlight";
> +
> +               power-supply = <&vreg_edp_bp>;
> +               pwms = <&pm8350c_pwm 3 65535>;
> +
> +               enable-gpios = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
> +       };
> +
>         vreg_edp_bp: vreg-edp-bp-regulator {
>                 compatible = "regulator-fixed";
>                 regulator-name = "vreg_edp_bp";
> @@ -123,7 +132,9 @@ ap_ts_pen_1v8: &i2c13 {
>                 edp_panel: edp-panel {
>                         compatible = "edp-panel";
>
> +                       backlight = <&edp_backlight>;
>                         power-supply = <&edp_3v3_regulator>;
> +

Nitpick: Remove this newline from this hunk and put it in when
power-supply is introduced.

>                         ports {
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> @@ -172,6 +183,13 @@ ap_ts_pen_1v8: &i2c13 {
>         };
>  };
>
> +&pm8350c_pwm {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&edp_bl_pwm>;

I see the pinctrl is used now but it would be easier to review this
patch if the pinctrl was in this patch.
