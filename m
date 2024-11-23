Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46D89D6A2D
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 17:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B99B10E480;
	Sat, 23 Nov 2024 16:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lRivZ1Ah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B41910E480
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 16:34:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3966EA402A4;
 Sat, 23 Nov 2024 16:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC1DC4CECD;
 Sat, 23 Nov 2024 16:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732379639;
 bh=tCT6K2z82iu0OMh4jUxwxzcAFtbKbAgIOhD7MXXZQs8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lRivZ1AhgEXJbZbV9l438hEX0b8CCKvQX9AhNRdO9NQwXCST1A2ILw7z1oxGw9yxP
 E1+G/7py140ruRt7BhffX2NxhFJRZbW6KtqFqGO9fj68b7RIhPa05iyE+8nS/YYEGA
 qv4rZ7hNZYCd4I6ohZOj90ZSSgxlE8GD6j7Pmb2w+bgyJv0e5cjMQWBs2KvUuu6brM
 ADa/OFhVYQKHbgOhIa7sgPvBnipD8X3KxVrKBE8+yt3ZK64SP6SIITd7jBRmf0MNhr
 pOUcB3ITzHmpx1iMOVLGWpYrhRyYpQxaUGUt7ZHfTDUsZbksuISulFfwwLEAXYjSxL
 /bEBKAkldkFkA==
Date: Sat, 23 Nov 2024 17:33:55 +0100
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
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: x1e80100-vivobook-s15: Add lid
 switch
Message-ID: <auvo564udpfdhufn3ccv6ty74d7otvpdgs3s4epbgzxpfdlkuq@fvdknv5akuym>
References: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
 <20241123-asus_qcom_display-v2-3-a0bff8576024@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241123-asus_qcom_display-v2-3-a0bff8576024@hotmail.com>
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

On Sat, Nov 23, 2024 at 01:58:55PM +0100, Maud Spierings wrote:
> +
>  	pmic-glink {
>  		compatible = "qcom,x1e80100-pmic-glink",
>  			     "qcom,sm8550-pmic-glink",
> @@ -537,6 +552,12 @@ edp_reg_en: edp-reg-en-state {
>  		bias-disable;
>  	};
>  
> +	hall_int_n_default: hall-int-n-state {
> +			pins = "gpio92";
> +			function = "gpio";

Messed indentation.

Best regards,
Krzysztof

