Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A399D6A2A
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 17:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A276310E041;
	Sat, 23 Nov 2024 16:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TTRv2N5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C096910E041
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 16:33:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BDBB5A404D6;
 Sat, 23 Nov 2024 16:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C906CC4CECD;
 Sat, 23 Nov 2024 16:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732379602;
 bh=jtPaC/8V83pmoo1oI3ijzttqC3sYVafXEh2XKPi5yfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TTRv2N5JqwcFG9f1tFHGlmYgoPRmipvpGqC3nYE1pCLWCkjS93krGA5KbsHYlEaBT
 Ek5MxsgfBDbBe2PRbuhBV7PLeLjqFF4zq2g0iva3v31JuIRjcuFq8rz4loNPzIuo4Z
 qf8OVBM8VnshsF3yus+mJoOe3mnHUz4JcP1qWRsLvvVpOOfZRB+TPD8AOZSdXEbQNV
 95CmPxi3MYkyTaZMVX3vbvaW8IN8IhUiG66BV3CzFs1xVHBpTfcnpHVx9XcM80PsWn
 wUyXlNF7yFHzSQKBDMiL+TFraxbK/mQj5W/19Mf2HAP+nQj7ibnztD1jDHhxCNzDnt
 2MYUrD7z40Ftw==
Date: Sat, 23 Nov 2024 17:33:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna56ac03:
 Document ATNA56AC03
Message-ID: <domsicrb6edzobtqhc4ql5guaz6rphc654ugp34ulhuuy3hmwr@x5ievo575wnj>
References: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
 <20241123-asus_qcom_display-v2-1-a0bff8576024@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241123-asus_qcom_display-v2-1-a0bff8576024@hotmail.com>
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

On Sat, Nov 23, 2024 at 01:58:53PM +0100, Maud Spierings wrote:
> The Samsung ATNA56AC03 panel is an AMOLED eDP panel.
> It is similar to the ATNA33xc20 except it is larger
> and has a different resolution.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

