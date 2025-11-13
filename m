Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC10C59F48
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 21:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E9810E1F8;
	Thu, 13 Nov 2025 20:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kANWmNZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF7C10E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:24:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B6B0B600CB;
 Thu, 13 Nov 2025 20:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A4AC4CEFB;
 Thu, 13 Nov 2025 20:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763065475;
 bh=4NO2Xdkz+jSDa61SzpnaLxD87yK+fJMEQl6hv5p3foU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kANWmNZt1Ib/MEjszjq3IIn1PYr6mCiLIBAhiqYeog6m2ahduTP9W0j9Wjdh98b94
 5NwldTDIdGZvV/ZnR3ppFS5bn1vWpQ/cKeSHou9697vZZGaCGDRdn+YCA1rEjU4Unw
 X3S7a45nV5XpczwpLG9uvQhr5SxrhtLOc3iy/rtBEZwNWxHH2TTRJC8oHasptjG6ZG
 HvqBE6U5UyhUwN3H5UcQhgs+ueZMDM/DIIWhhiBQDDNYu+ho+SnBhvm0CsZzuWXW/o
 4MnZIqnYisZWY7Kv4N+JVQIhEofCUwYqwSxCqwJIqWDkYg01Lrd5GgtOaf96FAJvIB
 firhIZDFs8TUg==
Date: Thu, 13 Nov 2025 14:28:58 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 02/12] arch: arm64: qcom: sdm845-enchilada: Specify
 panel name within the compatible
Message-ID: <mccbyhok747hjopkigm7rj7y6564bhnqxzcpo5yqjhbfffa4z4@5odvenhhsh3p>
References: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
 <20251113-sofef00-rebuild-v2-2-e175053061ec@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113-sofef00-rebuild-v2-2-e175053061ec@ixit.cz>
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

On Thu, Nov 13, 2025 at 06:57:36PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>

No "arch: " prefix on these files, please. (If patch 1 is picked in the
current form, I can fix it up for you) 

Regards,
Bjorn

> 
> sofef00 is name of the DDIC, it doesn't contain name of the panel used.
> The DDIC is also paired with other panels, so make clear which panel is
> used.
> 
> New device-tree will work with old driver as expected, due to secondary
> compatible.
> 
> cosmetic: sort the node.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> index a259eb9d45ae0..8aead6dc25e00 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> @@ -31,9 +31,9 @@ battery: battery {
>  };
>  
>  &display_panel {
> -	status = "okay";
> +	compatible = "samsung,sofef00-ams628nw01", "samsung,sofef00";
>  
> -	compatible = "samsung,sofef00";
> +	status = "okay";
>  };
>  
>  &bq27441_fg {
> 
> -- 
> 2.51.0
> 
> 
