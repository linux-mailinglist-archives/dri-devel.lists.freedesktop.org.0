Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9174B763AD7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 17:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C786710E48A;
	Wed, 26 Jul 2023 15:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5699910E48A;
 Wed, 26 Jul 2023 15:22:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B15D461B5D;
 Wed, 26 Jul 2023 15:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F00C433C8;
 Wed, 26 Jul 2023 15:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690384952;
 bh=9zDz3SagJCMaLUegWEGoTDA+cWb/pILa/bDTQy9G+xY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FQDxUytPwExrxnMDK1NoeR5aEUldj5zSKlNSNR6ZZCSMbwQjpQasj3kzix52ujS+4
 L0W2QvjR865awdef3Owd2xrvr/BEMNLPJgblfqrYM/28fNdVf8hwHCMIQXfnrsjECw
 7wWs18fNf5FWiIIHPxRcU/4iUGM/EqNubKYP4ISthJwOH1LnUQyTkP6gtOmXBA/yi5
 gkBWeihHXrM/uHdrie0MZ/6z8SYYbmz74RIT0zKsUiN9JsCeLJIbOW5m25NPEqRfVR
 +EEk9AR60RVgxJx9oJPZzY0ELPPRgvBfQdX9R3RIYOLGj/hq29H0hOReg4PE/4OWaG
 XF6oKUslZC3ow==
Received: (nullmailer pid 1471317 invoked by uid 1000);
 Wed, 26 Jul 2023 15:22:28 -0000
Date: Wed, 26 Jul 2023 09:22:28 -0600
From: Rob Herring <robh@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v4 04/17] dt-bindings: display/msm: Remove DSI1 ports
 from SM6350/SM6375 example
Message-ID: <169038494815.1471241.4131859739067244773.robh@kernel.org>
References: <20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org>
 <20230723-sm6125-dpu-v4-4-a3f287dd6c07@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230723-sm6125-dpu-v4-4-a3f287dd6c07@somainline.org>
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
Cc: , Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 23 Jul 2023 18:08:42 +0200, Marijn Suijten wrote:
> Both SM6350 and SM6375 support only a single DSI link, and don't have a
> corresponding dsi1 node in DTS.  Their examples should not suggest an
> output interface port on the display-controller node to this inexistant
> DSI host, with a dsi1_in label reference that doesn't exist in the
> example either.
> 
> Fixes: 3b7502b0c205 ("dt-bindings: display/msm: Add SM6350 MDSS")
> Fixes: 2a5c1021bc77 ("dt-bindings: display/msm: Add SM6375 MDSS")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml          | 7 -------
>  .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml          | 7 -------
>  2 files changed, 14 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

