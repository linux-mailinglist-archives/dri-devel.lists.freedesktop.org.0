Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2464746DDF3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 23:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB896E2F2;
	Wed,  8 Dec 2021 22:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483956E08E;
 Wed,  8 Dec 2021 22:01:28 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso5206348wmr.4; 
 Wed, 08 Dec 2021 14:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=78Ifs23TtoxatfN7VFvq9AEVPiNcwkeZ+FD9JLKmw8c=;
 b=eoOfS+6CmChrGqIET8UbG2Mcyt7PpnxNsqQBcTKKvvFva2oPLikaLax+o6UFRiitOo
 F75w0TsDGEYb+iHtNj/MgluUFT8K+9sdMVBYHdnKn5GGTM4IuGFSYqfLbj6lKsZVw3cG
 jkY6YDhnrUB/XZ8F7VksJaZbQUZWqAPSCh/CTY1a+j5/SNACoVhI16F5r8rjuQ+8b68t
 RlDrDjlTixZBpkLzx/KRMVrwiNoSvRbJdoOr7k33A/FURILhHfRcEoENHTDBQoChozph
 8NGQBK13gFNv9z3teV47WwN0Voj2yeN7eK9RoFG8b2QlNdIn6hIX4dOGfm0uf5tiwJKZ
 w2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=78Ifs23TtoxatfN7VFvq9AEVPiNcwkeZ+FD9JLKmw8c=;
 b=F9qSfnqUZYPCZkUrGtdLhhIB63LjwQqD1yFaBXuEg16YvzX+ZmJg6dn9fygNiz1TDx
 xEoHlCbNgshE6Qa250claoqh2QVxKEUOyRIOJVGa70JSlYuuNg/OxyzwU/a1N+wReqn+
 EIilM72RPqsZ6D23DcIRjLs2fJx9Bj3M5XHwQ2SeShXN/TVNVzM7+Hff0Zt1NDyLk3at
 XAI6Ww5LuxY6K1hS63cUyUUAw+I4d5+oXHISB4iklGp4f87PBvKkj/y9Zm9hN4ONvRVn
 e/Hw4mOkb4Xz3E/d9Dyp5wywhrvjk7GEKY46C3T/6auheyD7Jsgx8qgsP8hWmcsU5W+c
 ftZA==
X-Gm-Message-State: AOAM532cnl98UNITc/KTs1O1mhRPqlTpPp65niMiaN9po6CRYsTsZwwn
 5ImiAeeINa6T635g5yveTmIOJ7PVNKLbXqXRip8=
X-Google-Smtp-Source: ABdhPJx4+51IKWNFMWdRf7kFk0fQGiVNH4ObQU0Pt5G58JOq7C+3hI5cdOhoebAHEgcFR4QJtJpoZ99D+N6A9Eu9azc=
X-Received: by 2002:a05:600c:4f4b:: with SMTP id
 m11mr1665243wmq.151.1639000886773; 
 Wed, 08 Dec 2021 14:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20211105030434.2828845-1-sean@poorly.run>
 <20211105030434.2828845-14-sean@poorly.run>
In-Reply-To: <20211105030434.2828845-14-sean@poorly.run>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 8 Dec 2021 14:06:43 -0800
Message-ID: <CAF6AEGv9ghHcd1zhWiBQ40pwx1uMeJ=Y_T5EVo2EV5gTRTtAew@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v4 13/14] arm64: dts: qcom: sc7180: Add
 support for HDCP in dp-controller
To: Sean Paul <sean@poorly.run>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Andy Gross <agross@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 4, 2021 at 8:05 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> This patch adds the register ranges required for HDCP key injection and
> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller. Now that these are supported, change the
> compatible string to "dp-hdcp".
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-14-sean@poorly.run #v3
>
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index c8921e2d6480..838270f70b62 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3088,7 +3088,13 @@ mdss_dp: displayport-controller@ae90000 {
>                                 compatible = "qcom,sc7180-dp";
>                                 status = "disabled";
>
> -                               reg = <0 0x0ae90000 0 0x1400>;
> +                               reg = <0 0x0ae90000 0 0x200>,
> +                                     <0 0x0ae90200 0 0x200>,
> +                                     <0 0x0ae90400 0 0xc00>,
> +                                     <0 0x0ae91000 0 0x400>,
> +                                     <0 0x0ae91400 0 0x400>,
> +                                     <0 0x0aed1000 0 0x175>,
> +                                     <0 0x0aee1000 0 0x2c>;

So one small issue, if someone tries to get linux running on a sc7180
windows laptop (which uses qcom's tz instead of the CrOS tz), things
will go BOOM!

We might want instead to move this somewhere chromebook specific,
maybe sc7180-trogdor.dtsi?

BR,
-R

>
>                                 interrupt-parent = <&mdss>;
>                                 interrupts = <12>;
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
