Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 304A63D4143
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 22:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7B56E9A5;
	Fri, 23 Jul 2021 20:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CA46E3B7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 20:05:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627070742; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=R6B44KvNJoUb62PuGtXARkIntmCEbpuSvDX2oWLc0ew=;
 b=WmmAuZOXBxEsN7/tHyOeAGRobtkGJm5AOXbdbwr0hPqSrMQ36cHH8cwtN0rxegtf4yE1UMbB
 0LgVclqmVtHZA2plqhEnBKGCuSBIH7CxaAN8ALUGTj5ByHqOuQbMOL2p+AwkTyKc7SraCqzL
 CuVwiogrZv5NB4VMZi828kVLcG0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60fb21141dd16c8788b3e36c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Jul 2021 20:05:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 305ACC43144; Fri, 23 Jul 2021 20:05:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 179F8C433F1;
 Fri, 23 Jul 2021 20:05:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 23 Jul 2021 13:05:38 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: msm/dp: Change reg definition
In-Reply-To: <20210722024227.3313096-2-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-2-bjorn.andersson@linaro.org>
Message-ID: <6318d5abc7f1ed9622218bf29394ec64@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-21 19:42, Bjorn Andersson wrote:
> reg was defined as one region covering the entire DP block, but the
> memory map is actually split in 4 regions and obviously the size of
> these regions differs between platforms.
> 
> Switch the reg to require that all four regions are specified instead.
> It is expected that the implementation will handle existing DTBs, even
> though the schema defines the new layout.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  .../bindings/display/msm/dp-controller.yaml           | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 64d8d9e5e47a..a6e41be038fc 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -19,7 +19,11 @@ properties:
>        - qcom,sc7180-dp
> 
>    reg:
> -    maxItems: 1
> +    items:
> +      - description: ahb register block
> +      - description: aux register block
> +      - description: link register block
> +      - description: p0 register block
Do you also want to add the p1 register block here?
> 
>    interrupts:
>      maxItems: 1
> @@ -100,7 +104,10 @@ examples:
> 
>      displayport-controller@ae90000 {
>          compatible = "qcom,sc7180-dp";
> -        reg = <0xae90000 0x1400>;
> +        reg = <0xae90000 0x200>,
> +              <0xae90200 0x200>,
> +              <0xae90400 0xc00>,
> +              <0xae91000 0x400>;
here too?
>          interrupt-parent = <&mdss>;
>          interrupts = <12>;
>          clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,


