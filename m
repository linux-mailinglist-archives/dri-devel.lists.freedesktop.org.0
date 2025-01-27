Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D71A1D27E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 09:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD9F10E21D;
	Mon, 27 Jan 2025 08:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="stPSlalc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5AF10E199
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 08:43:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 003D3A40D06;
 Mon, 27 Jan 2025 08:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59D3C4CED2;
 Mon, 27 Jan 2025 08:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737967432;
 bh=jLX2rDd3SzantgTErJwwxmWIGZdNZQCcLp89H0S17hQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=stPSlalcbrxVIbCYH+u79LVjyyJ+qf05Ji0dIjBEMKNeCQ6LlbbNnjgeDvvxTJgKn
 ohQ5Whe081H4oHnFeziuQCLpJ9UTus7xNZsZySB2vEKC7dWYxo94k5JGbZgljuXNCg
 I0cDRe7KWJ9ue4ikcj0rGBwkXvzCZRUOyo2O9NcfqXuvNZPWW4hfxJwc9/Zt30zH8Z
 /rJ0MsT83MqxLsEcr2X5uNvEjLMSxtPzLPEC7wzSSgAKD3Zz9a7NEVg9jwMDdzBwnb
 0Wf8qp5821CxDB93Rivg2pqKF6g8X1YfwMEFcv1lqzoaDfpP4W5QXGc/G35bRygxq5
 8vuapDbzP6MoA==
Date: Mon, 27 Jan 2025 09:43:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, dianders@chromium.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: Add compatible for
 CSOT PNA957QT1-1
Message-ID: <20250127-copper-dalmatian-of-excitement-c474da@krzk-bin>
References: <20250127014605.1862287-1-yelangyan@huaqin.corp-partner.google.com>
 <20250127014605.1862287-2-yelangyan@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250127014605.1862287-2-yelangyan@huaqin.corp-partner.google.com>
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

On Mon, Jan 27, 2025 at 09:46:04AM +0800, Langyan Ye wrote:
> Add a new compatible for the panel CSOT PNA957QT1-1. This panel
> uses HX83102 IC, so add the compatible to the hx83102 binding files.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
> index c649fb085833..d876269e1fac 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
> @@ -18,6 +18,8 @@ properties:
>        - enum:
>            # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
>            - boe,nv110wum-l60
> +          # CSOT pna957qt1-1 10.95" WUXGA TFT LCD panel
> +          - csot,pna957qt1-1

You need to add such vendor prefix first.

It does not look like you tested the DTS against bindings. Please run
'make dtbs_check W=1' (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

Point us to your DTS so we can validate that you really tested it.

Best regards,
Krzysztof

