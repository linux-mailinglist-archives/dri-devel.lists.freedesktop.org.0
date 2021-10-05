Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B6423278
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 22:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329BE89D7C;
	Tue,  5 Oct 2021 20:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F5589D7C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 20:56:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633467386; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=d2UIVnPOW3ElF02gfggo+xeMDHqG4QtmTz1NBPCyNOc=;
 b=dM4+e4TorjJdz3/I8JX4muQ+GT2u5uPB22jT9X4QMz5emBep5E5+4TJgfEGjdJNZLtSHjvQs
 BhdoTzzGVxaXuRcGPepcR0/g6Rrtfi0w0DCx/dnjAK8lUKTgnOPagaoJWabGvP0BUst6ErED
 Y9MhODt8uM2Hh00UolNGzYnn2ao=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 615cbbf24ccdf4fe5792a85a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 20:56:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 598B6C4361C; Tue,  5 Oct 2021 20:56:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6416DC43460;
 Tue,  5 Oct 2021 20:56:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 05 Oct 2021 13:56:16 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>, Chandan
 Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring
 <robh@kernel.org>
Subject: Re: [Freedreno] [PATCH v3 1/5] dt-bindings: msm/dp: Change reg
 definition
In-Reply-To: <20211001174400.981707-2-bjorn.andersson@linaro.org>
References: <20211001174400.981707-1-bjorn.andersson@linaro.org>
 <20211001174400.981707-2-bjorn.andersson@linaro.org>
Message-ID: <78cc9c0faafcab3375f74a4f52790a52@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-10-01 10:43, Bjorn Andersson wrote:
> reg was defined as one region covering the entire DP block, but the
> memory map is actually split in 4 regions and obviously the size of
> these regions differs between platforms.
> 
> Switch the reg to require that all four regions are specified instead.
> It is expected that the implementation will handle existing DTBs, even
> though the schema defines the new layout.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
> 
> Changes since v2:
> - None
> 
>  .../bindings/display/msm/dp-controller.yaml         | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index d89b3c510c27..6bb424c21340 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -19,7 +19,12 @@ properties:
>        - qcom,sc7180-dp
> 
>    reg:
> -    maxItems: 1
> +    items:
> +      - description: ahb register block
> +      - description: aux register block
> +      - description: link register block
> +      - description: p0 register block
> +      - description: p1 register block
> 
>    interrupts:
>      maxItems: 1
> @@ -99,7 +104,11 @@ examples:
> 
>      displayport-controller@ae90000 {
>          compatible = "qcom,sc7180-dp";
> -        reg = <0xae90000 0x1400>;
> +        reg = <0xae90000 0x200>,
> +              <0xae90200 0x200>,
> +              <0xae90400 0xc00>,
> +              <0xae91000 0x400>,
> +              <0xae91400 0x400>;
>          interrupt-parent = <&mdss>;
>          interrupts = <12>;
>          clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
