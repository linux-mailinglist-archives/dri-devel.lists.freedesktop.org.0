Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A2B84E338
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 15:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E562410E817;
	Thu,  8 Feb 2024 14:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ImokAwqW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476C110E817
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 14:31:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A53E461E04;
 Thu,  8 Feb 2024 14:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8952CC433C7;
 Thu,  8 Feb 2024 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707402706;
 bh=I3KyQ/QgQFzOr93h4IxaJwGTFCBd9ZOO9qHDg18SGoM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ImokAwqW4mjomuflcDGQ5wTs+rZrsZbysZrBjqs+5J6rAc65rq21Cr3zh1nGuq2u8
 sHztjKgok5lVULu1IW+yvPMBHUvAlbBOdVwyjdZnfUqIFN5Ug4SaNZVOV8cUldeA2w
 yd33VvLQ9uXzdCpuaJFFB7Tz6osCDiNTGYHCwh9ndpnBrb6IGKX3HqEGINWKCqSPOI
 CsS/CXnO1IVhttIm0yvrwS4uf0k2Z0RQizZ2Cb0x16lC5RsAZaKNtnHBPYP34JyCbv
 T1iC4plsm9N/9Z00I0wdqW9xh2Uh0ZyaH1Em896Id/DkmkF0GMMnk8+DoAVT0kMQLh
 CatFU53NuZlkA==
Date: Thu, 8 Feb 2024 14:31:40 +0000
From: Lee Jones <lee@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andersson@kernel.org, quic_kgunda@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: backlight: qcom-wled: Fix bouncing email
 addresses
Message-ID: <20240208143140.GU689448@google.com>
References: <20240202180151.4116329-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240202180151.4116329-1-quic_jhugo@quicinc.com>
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

On Fri, 02 Feb 2024, Jeffrey Hugo wrote:

> Bjorn is no longer at Linaro.  Update his email address to @kernel to
> match the .mailmap entry.
> 
> The servers for @codeaurora are long retired and messages sent there
> will bounce.  Update Kiran's email address to match the .mailmap entry.
> 
> This will help anyone that is looking to reach out about this binding
> and is not using .mailmap to pre-process their message.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  .../devicetree/bindings/leds/backlight/qcom-wled.yaml         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index 5f1849bdabba..a8490781011d 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Qualcomm Technologies, Inc. WLED driver
>  
>  maintainers:
> -  - Bjorn Andersson <bjorn.andersson@linaro.org>
> -  - Kiran Gunda <kgunda@codeaurora.org>
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Kiran Gunda <quic_kgunda@quicinc.com>
>  
>  description: |
>    WLED (White Light Emitting Diode) driver is used for controlling display

Applied, thanks

-- 
Lee Jones [李琼斯]
