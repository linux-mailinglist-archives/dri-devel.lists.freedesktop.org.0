Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D32AE18C887
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B406EAD6;
	Fri, 20 Mar 2020 08:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBCC6EA45
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 17:48:12 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id f206so1801397pfa.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=iWUSd6tNelA3B2gV8L14dd3S0Goj3iWlFgAqgwk5kPw=;
 b=T5wSGnt2PrWmaej5pxTQjA5iZ75Iq5B8ryc8SsC0GZUqDnlwetsWMpCtffoLmhaty7
 MEpRGQOi8ly0/vnWHX7gn8Je3y5VDnIUpNcgALh6uSrWPV9q0Ly1fiQ5RC4Xi02iZE6W
 JyMt029uRbZPrTBbpHeGtn40yI63DT1zUUIhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=iWUSd6tNelA3B2gV8L14dd3S0Goj3iWlFgAqgwk5kPw=;
 b=KyYZV91DvDJqKfBYNO/8d1goIubt0o1LLR2TjeqS2rtpXcjd/7AaApwB0we1UP7cma
 qanRsToV0uGvW2l8kFBIUpn0XXrROs45F3r9ObAU+Ee6F+BLvYdt3Y56DYKv7UBtqqSg
 g2yk2F3EbwFDIYTxy9DFNqyDo1M1JPWB9bZkTd6CudgPP59x6WsGe4VyhkUCOq0OSNGY
 SvOkpsLy8PtnQhFqVFr8O7fbupYAIuE98uWMmUP+BukjzyZcytWG9YWBSQIJCyFeMb+8
 feO04WYff6Jpo0h//c+Rebi06SkwD7Bkc9PcMc6+8j3rdBe8Tma08Zkhslu3Twey8kiF
 wcWg==
X-Gm-Message-State: ANhLgQ3ySI7O/HO/eH9v9w4MrUlGwGYaHxcYGGIVuLzFiWSeRKm6FRF7
 DnHqG763Z9c25XuTSnK6k68tiw==
X-Google-Smtp-Source: ADFU+vut6Lso223EbxYK+y4BZyU7C3AfV3mD375ioWsMfGKfgEhQlPlHMn0XJNEJoyfTIpfVnP8PYA==
X-Received: by 2002:a63:c811:: with SMTP id z17mr4386751pgg.41.1584640092091; 
 Thu, 19 Mar 2020 10:48:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id h11sm2990799pfq.56.2020.03.19.10.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 10:48:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1584356562-13181-1-git-send-email-mkrishn@codeaurora.org>
References: <1584356562-13181-1-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [v2] arm64: dts: sc7180: modify assigned clocks for sc7180 target
From: Stephen Boyd <swboyd@chromium.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Date: Thu, 19 Mar 2020 10:48:10 -0700
Message-ID: <158464009041.152100.18425074316530931981@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:24 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Subject could be "sc7180: update DPU assigned clocks"

Quoting Krishna Manikandan (2020-03-16 04:02:42)
> Add DISP_CC_MDSS_ROT_CLK and DISP_CC_MDSS_AHB_CLK
> in the assigned clocks list for sc7180 target.

Why?

> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Does this need a Fixes: tag?

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 998f101..e3b60f1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1544,8 +1544,12 @@
>                                 clock-names = "iface", "rot", "lut", "core",
>                                               "vsync";
>                                 assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> -                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> +                                                 <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                                                 <&dispcc DISP_CC_MDSS_AHB_CLK>;
>                                 assigned-clock-rates = <300000000>,
> +                                                      <19200000>,
> +                                                      <19200000>,
>                                                        <19200000>;
>  
>                                 interrupt-parent = <&mdss>;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
