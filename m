Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F739BB236A
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 03:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D7810E751;
	Thu,  2 Oct 2025 01:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SZ8+aC8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE7410E751
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 01:06:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1921E44B41;
 Thu,  2 Oct 2025 01:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6985C4CEF1;
 Thu,  2 Oct 2025 01:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759367191;
 bh=Qxn/vhGkc5YTClXEb2b63hmCQHA2mOFB0BiYY8jg3wU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SZ8+aC8dTdtQ2vYii9GcDNFXDUWLLI84hMzyMsMRpfx/uSIJn5FRLTK+My05UDUJI
 /tGSHNlpnsEBCyY6jbmuqnbSHbRzTcXFlcIwLXTebUKUpGRG6cuH/aJrFsY64DJyOu
 kgdT0YR/LMvRMOt1Fh98f6sd6wHskduNeaMe+vUTkgvXUr79zXZG6DDXCXnqjy+OdC
 UE7nBIYQmIdom3HGqBn7FNew8AVKEnF/8kHPzVwUsmLxjHQw9VqbX39ffc+cp5t6w+
 OdgRWQyi4fzgk4sX3ES1qxai55PFMZiQ8S1AgQJ04O3VqQBO3HWPHJTDTsQJRRZldH
 IiIm8ikZFw9Og==
Date: Wed, 1 Oct 2025 20:06:29 -0500
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with
 panel
Message-ID: <20251002010629.GA2816459-robh@kernel.org>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-1-9293016768f7@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-s6e3fc2x01-v1-1-9293016768f7@ixit.cz>
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

On Thu, Sep 25, 2025 at 11:12:47AM +0200, David Heidelberg wrote:
> Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 77 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 82 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..489b6b52effe1e627ff5ef5891729c175ad71685
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e3fc2x01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S6E3FC2X01 AMOLED DDIC
> +
> +description: The S6E3FC2X01 is display driver IC with connected panel.
> +
> +maintainers:
> +  - David Heidelberg <david@ixit.cz>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6e3fc2x01-ams641rw

On second thought, this doesn't even tell me the resolution of the 
panel. The existing compatible you remove at least did that.
