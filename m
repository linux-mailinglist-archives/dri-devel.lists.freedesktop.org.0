Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F7C2F0D4
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 04:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B88510E22D;
	Tue,  4 Nov 2025 03:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WKESfiwn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7610E10E22D;
 Tue,  4 Nov 2025 03:04:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 24ADC44058;
 Tue,  4 Nov 2025 03:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD56C4CEFD;
 Tue,  4 Nov 2025 03:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762225478;
 bh=ZlrAYcT8RP/bgBcBfF8bGO2Rd1/BQTXE1H4fj1wz00s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WKESfiwnLJ6ikA/MjCzt7Ftb/R0x3Yck+4cw3QGFh2eMdY9BstQTxqGe8CQt58W3t
 JxUPLLNQ2hdkRkEMui834cNUnYqFeDH5iqF7zTyTzaEwpcXodHPVtH9Pd1oU4SuzVr
 BkTwPpIFSTu1UgxjvqgaaLwqwfhTI+Mo0ormO6XReaqfYgI0lufezJKzhBuSmNrEiS
 nKrzlFa0GRwwiY9omxqrZvpgJakZ+5tOrsDB0lLojZmql9n20Aw63ublkth3z43h4u
 wLsD5Yl8F+9ga9XF6xJDAsdzXGJvELtiP+nFJN8cAHOC3/ZgA5l0rREgEUmEt9dFsD
 g7seOqFnRi3lA==
Date: Mon, 3 Nov 2025 21:08:09 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: Reference DAI schema for
 DAI properties
Message-ID: <mrz254g4ujnwq2bsu63ajqxvgbtokbrwusbdydcj7nny3ctqv3@evj2xqqgiela>
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
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

On Tue, Oct 21, 2025 at 01:10:51PM +0200, Krzysztof Kozlowski wrote:
> DisplayPort nodes are DAIs (Digital Audio Interfaces): they have already
> 'sound-dai-cells'.  Reference the common DAI schema to bring common
> properties for them, which allows also customizing DAI name prefix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index aeb4e4f36044..08c273f707c1 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -198,6 +198,7 @@ allOf:
>                  - qcom,sa8775p-dp
>                  - qcom,x1e80100-dp
>        then:
> +        $ref: /schemas/sound/dai-common.yaml#
>          oneOf:
>            - required:
>                - aux-bus
> @@ -295,7 +296,7 @@ allOf:
>            minItems: 6
>            maxItems: 8
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.48.1
> 
