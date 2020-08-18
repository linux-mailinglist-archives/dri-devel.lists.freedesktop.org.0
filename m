Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B464F247FD5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A5C89C99;
	Tue, 18 Aug 2020 07:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC216E159
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 00:22:28 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id u128so9069184pfb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 17:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=G4S72b5uoF0KvLSq8Fxn7M3pQq4TBaiGBup4iTUl/TU=;
 b=lD3hYa4SkXByNwvhpt56gj/tstJy1tqXwYDtCWD3Qh1s2U6dZw5MEzqRk08E30ztkT
 H/Lu0d2EH0rF/bkPDTJVXWn47uVNcdiGJ1hCMU3zKIXlLYl+dtVhUKvm1nAu1iFV1A6i
 FBmisgXAtLRbUcQ4JPFyzI1jg1WPfNLwNE1gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=G4S72b5uoF0KvLSq8Fxn7M3pQq4TBaiGBup4iTUl/TU=;
 b=nbnGidBJKGIyOdVa/RKDjqHCS3aWWhLLHQTYMJ5+37QW9OwCodMMH5B59Zpp/fbpQ5
 2zTPthAU3Q0x1KzHqxghJf93ckUoLcCwBu7ZVwTzMVdd0kRoYR4UFJY2tGtpkeJCKVte
 r9/htWmRsfogYKAY+iayrraNusOFPuYp5K1yvdCnwLj6weS+rCL+iUvxeCIStuUDHY+u
 YWfSjnhZJMrqFJsAPpCYIfTvCxW7dkI67iF0yg+MqqfhRTiwD6Ru+nn8GvTjiEHImoRl
 OQN0yEUMwh7/9o8JEr5Hhr4q8eEo9TQjRq8JPaWoErAAkofJsnDcUm82XIwNV94vCHUP
 y/Yg==
X-Gm-Message-State: AOAM532JetZRTqezRe6OBMX7aG3CPO9wyPI1KXuERE8RECzu+hqhwUhp
 xRkL4CiasuAaU3b32jGRlPyvog==
X-Google-Smtp-Source: ABdhPJyx5W7AFU45MW9bjlWtaga4TqK2K/MQWMdH80dZVXkjSwadqmJpL5/JLqjL+aKPBgsgPwBzeg==
X-Received: by 2002:a63:30c6:: with SMTP id
 w189mr11295826pgw.241.1597710147966; 
 Mon, 17 Aug 2020 17:22:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id h5sm21282963pfq.146.2020.08.17.17.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 17:22:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200817225912.3149-1-tanmay@codeaurora.org>
References: <20200817225912.3149-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add DisplayPort HPD pin dt
 node
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>
Date: Mon, 17 Aug 2020 17:22:25 -0700
Message-ID: <159771014584.2423498.11072252787625455437@swboyd.mtv.corp.google.com>
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

Quoting Tanmay Shah (2020-08-17 15:59:12)
> This node defines alternate DP HPD functionality of GPIO.
> 
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index bf2f2bb1aa79..0eedf057acc1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1457,6 +1457,19 @@ pinconf-sd-cd {
>                                         drive-strength = <2>;
>                                 };
>                         };
> +
> +                       dp_hot_plug_det: dp-hot-plug-det {

And this should be sorted alphabetically instead of put at the end of
the node.

> +                               pinmux {
> +                                       pins = "gpio117";
> +                                       function = "dp_hot";
> +                               };
> +
> +                               pinconf {
> +                                       pins = "gpio117";
> +                                       bias-disable;
> +                                       input-enable;
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
