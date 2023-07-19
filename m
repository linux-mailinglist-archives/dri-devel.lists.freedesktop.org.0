Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB499759F58
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 22:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D598310E50B;
	Wed, 19 Jul 2023 20:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D2C10E50B;
 Wed, 19 Jul 2023 20:09:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96EE561807;
 Wed, 19 Jul 2023 20:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F24EC433C7;
 Wed, 19 Jul 2023 20:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689797363;
 bh=klqOWFOUh1QB5odPiLwWfeNWJcVb2PU7gijJT32YqNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A/2dYFF4KVhoHbqExV9WPBfS6C4fOHioJbj1B0mpePbgVhxjl+2zzBPGfp70rL5Dk
 LC0wykkcZrebfGspQLokwey+kP4xeSWCPaQO7vxVeq5rmNY8Ma0TYwI5c3G56Bdksn
 FQcFBYnlefuUVlBkvyEcDtZWip7j1OtLXXGDst3abhqiNtPIAz7j7JmXh2FX/kVk0b
 LqlA6yfDeEJJQmkrp4xAuI2511AJKjSBzRC63H85DyePlqWPkMmV0IF3bMMp6T9/Ns
 4lVVS593VTU/O7DQN2AmYKl027Xxu2ccsdR73CTL6Ly/qBtPWkdEw0kL3rKywZPEe/
 KGn90hFEjFTSw==
Received: (nullmailer pid 687249 invoked by uid 1000);
 Wed, 19 Jul 2023 20:09:20 -0000
Date: Wed, 19 Jul 2023 14:09:19 -0600
From: Rob Herring <robh@kernel.org>
To: Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: display/msm: mdss-common: add
 memory-region property
Message-ID: <168979735935.687074.3349593216589059012.robh@kernel.org>
References: <20230713165238.2814849-1-amit.pundir@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713165238.2814849-1-amit.pundir@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, dt <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 13 Jul 2023 22:22:37 +0530, Amit Pundir wrote:
> Add and document the reserved memory region property in the
> mdss-common schema.
> 
> For now (sdm845-db845c), it points to a framebuffer memory
> region reserved by the bootloader for splash screen.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
> v5: Moving the dt-binding to mdss-common schema with
>     updated commit message and property description.
> 
> v4: Adding this new dt-binding patch, in qcom,sdm845-mdss
>     schema, in the v4 of the follow-up patch for
>     sdm845-db845c.
>     https://lore.kernel.org/lkml/20230712130215.666924-2-amit.pundir@linaro.org/
> 
>  .../devicetree/bindings/display/msm/mdss-common.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

