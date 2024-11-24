Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF04F9D6DFC
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 12:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFDB10E20F;
	Sun, 24 Nov 2024 11:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N9F+V2L1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CEC10E20F
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 11:00:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7400A5C4D33;
 Sun, 24 Nov 2024 10:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13041C4CED1;
 Sun, 24 Nov 2024 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732446004;
 bh=95UQNooQ1/xtDHil/lFmvjulG65W+cWONuW8GgkYtUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N9F+V2L16moEeax2rywUzrYkZcOBcCczdpsyl2aNWCKDFLnkFtWjbYI1jEqGibZwy
 eSiDOI+uECaEWMJXIs3DQtEvcBZeNcSSoaizkgvW/Zw+RsKNeiqfDtYc2wvC9S3q2G
 BiXpRNBHdXZoJtp/a9wmQtp9xnWbxodmhYFE/6qErL6TeZWVS/YstTvlkmFRnz8dWZ
 XCNYo88PpDbFDFYcR+INGk1yGrdVXyJTWxXNmrSCEnDpEYbS7aMo1rF8SYaA1MOTww
 8st5Wasj+cYcm8Oe5BDzXjeUBa4hFwczQXmFaiv5qN433pD0SKRyIzCH1ktlMSh/NS
 fuAst+iZb4YVQ==
Date: Sun, 24 Nov 2024 12:00:01 +0100
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
Subject: Re: [PATCH v3 1/4] dt-bindings: display: panel: samsung,atna56ac03:
 Document ATNA56AC03
Message-ID: <k27rqbfvuon3uppgyhcfhcmlqv7ritbn35fmhuljnw2ievqnia@rey3cljv2p2n>
References: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
 <20241124-asus_qcom_display-v3-1-002b723b1920@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241124-asus_qcom_display-v3-1-002b723b1920@hotmail.com>
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

On Sun, Nov 24, 2024 at 11:00:57AM +0100, Maud Spierings wrote:
> The Samsung ATNA56AC03 panel is an AMOLED eDP panel.
> It is similar to the ATNA33xc20 except it is larger and has a different
> resolution.
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation: Please add
Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
or above your Signed-off-by tag. Tag is "received", when provided
in a message replied to you on the mailing list. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for tags received on the version
they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof

