Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B013F247FF6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9218E89F2E;
	Tue, 18 Aug 2020 07:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560F589B62
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 22:50:59 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id c10so8503902pjn.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 15:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=SQkF1er9CI/HdoW+CwMyTYmnG8SOeqdla6TOsxwwXL8=;
 b=EVAxOV8OGoEBu6rnvdmhL7nV88zwX29yi/vbnC+n+vOBoGdfRXKTYRNxwwIeZ+BjCL
 n00zv8FJcL4GNWB1T9HqvbiknMeFsz4MVl/oKDDvDv4xSzjhGPRsrR7FG1kxoxuIVabp
 rL28hlM7qopNZnIsSx/06Xt488jLS5/+IANV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=SQkF1er9CI/HdoW+CwMyTYmnG8SOeqdla6TOsxwwXL8=;
 b=quO/ZTYupGkjpTP+KDRn1o51JpVQlms9AgaDOnv+hml4NMSph2oMKa+0HXwA5uEA/5
 LnIbozFpLvPpRXET2k9zSvxLaeJnwpcIYcA4ILNYVZCSXuw96Z3wYG1+QShqqk1T/jXE
 fMInWohwE1d3mkPlqtq4+xnUiBOvhO6CXF/TJ/AJWGGevenNhZyM30AAvKet8JMgI1F6
 GBu1wC12RdyzGPJY2N/AzsUopO6NNHW+jdyAZwCTgWQys/4zLCtZYfCWOj2bod5lAyMZ
 MnU/9IAr7GG3BzJRZRb3AVtb3xWZkwE/pRiQaa25w55obTHZL1GVvqThCH9K1XKDrv1Z
 Yo7g==
X-Gm-Message-State: AOAM5336lKacpY0oDzLz8toOOMpRXWVGHucPoij6IGrbgsxwUUZdTDQI
 gt6/i0j7cWp3XNXv+7KKObyW1MbTSt34EQ==
X-Google-Smtp-Source: ABdhPJyJOVgzQkXpdtBDVbGzjM+WmdvtLlVBSbnc4J38wcBX/4/0hz901JkQfbgFaPFVLg8jtt6UJA==
X-Received: by 2002:a17:90a:d252:: with SMTP id
 o18mr13953355pjw.146.1597704658834; 
 Mon, 17 Aug 2020 15:50:58 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id z23sm18201207pgv.57.2020.08.17.15.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 15:50:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200817224527.28532-1-tanmay@codeaurora.org>
References: <20200817224527.28532-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7180: Add DisplayPort HPD pin dt
 node
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, devicetree@vger.kernel.org
Date: Mon, 17 Aug 2020 15:50:56 -0700
Message-ID: <159770465685.2423498.15137387317243148552@swboyd.mtv.corp.google.com>
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
Cc: Tanmay Shah <tanmay@codeaurora.org>, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-08-17 15:45:27)
> This node defines alternate DP HPD functionality of GPIO.
> 
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index bf2f2bb1aa79..9f97cf5dd9ab 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1457,6 +1457,20 @@ pinconf-sd-cd {
>                                         drive-strength = <2>;
>                                 };
>                         };
> +
> +                       dp_hot_plug_det: dp-hot-plug-det {
> +                               pinmux {
> +                                       pins = "gpio117";
> +                                       function = "dp_hot";
> +                               };
> +
> +                               config {

The node name is usualy called pinconf. Please use that.

> +                                       pins = "gpio117";
> +                                       bias-disable;
> +                                       input-enable;
> +                                       drive-strength = <2>;

My understanding is that drive-strength doesn't do anything when the pin
is input. So this line should be removed.

> +                               };
> +                       };
>                 };
>  
>                 gpu: gpu@5000000 {
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
