Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDDA915822
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 22:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB6010E22D;
	Mon, 24 Jun 2024 20:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oFf4xeeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C0910E22D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 20:40:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 133E560F86;
 Mon, 24 Jun 2024 20:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B10AC2BBFC;
 Mon, 24 Jun 2024 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719261642;
 bh=HKHNjN12ghdanNjkpEpORPJCe/LeiaO7ZQFLm/IYZGI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oFf4xeeL4k9sn/LrwNkV8wU0k/8bvCXvTg8J1It92zmlMz0GGWeI4K0YXclivemlX
 BfwuzPtHnzow81aSVsFGyQyfK0ACOe4RMOn3b6WjMtSBvQdf27D3/s9iHNsXlubd3Y
 7irgaOqdrnXra1FSplPt8d1t6lMzdV/V4ioQHteSjsyqxVL10FrB8kzb//TYckIjDD
 JKq+y/Wi/JSreT59/65IPFsRTrpVCPwsNGitM0flyQnrT2vvb2gbP5JKffeYejV4Zu
 1S4ziI/pSocxLMoKCZnh9vGJyMz1bxbfKDCWx3UI1Bi8CBCUlreK0v1FCbVkqPYZmO
 bXwt334UpzoQw==
Date: Mon, 24 Jun 2024 14:40:41 -0600
From: Rob Herring <robh@kernel.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Henrik Rydberg <rydberg@bitmath.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/7] dt-bindings: arm: qcom: add OnePlus 8 series
Message-ID: <20240624204041.GA375582-robh@kernel.org>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-3-388eecf2dff7@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-oneplus8-v1-3-388eecf2dff7@postmarketos.org>
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

On Mon, Jun 24, 2024 at 03:30:27AM +0200, Caleb Connolly wrote:
> Add bindings for the OnePlus 8, 8 Pro, and 8T devices.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index d839691a900c..a41eeb8c3fc5 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -986,8 +986,11 @@ properties:
>            - enum:
>                - qcom,qrb5165-rb5
>                - qcom,sm8250-hdk
>                - qcom,sm8250-mtp
> +              - oneplus,kebab
> +              - oneplus,instantnoodle
> +              - oneplus,instantnoodlep

Which one is which device in the commit msg? I can only guess that 'p' 
here corresponds to Pro. A comment after the compatibles would help.

>                - sony,pdx203-generic
>                - sony,pdx206-generic
>                - xiaomi,elish
>                - xiaomi,pipa
> 
> -- 
> 2.45.0
> 
