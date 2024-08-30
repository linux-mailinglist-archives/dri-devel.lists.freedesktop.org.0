Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5A0965A3C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C2F10E853;
	Fri, 30 Aug 2024 08:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S6pf6yW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Fri, 30 Aug 2024 08:25:53 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F29410E850
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:25:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 76C34AE3A49;
 Fri, 30 Aug 2024 08:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93A5C4CEC2;
 Fri, 30 Aug 2024 08:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725006019;
 bh=8BnN5DBF5PyD8ejLqZl3nUmYt2pMYCYaD3RZT+KL8Js=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S6pf6yW2mEYxVJ8pMscwAphZR8+YV89giq2YbpUBupjpdXp7czVUvq3xG7G9XnRRH
 zw9ou5Lps/5xdysFVs4DY9PKf2t7oaoQAbZwp4bWCMp+6SlBwTrbYTMWbPKudpor5P
 zDCFaVZK7RIAlxf8qVydbijUBKgYCvOZlGTQHoYjCmidvs6ShU4NyaQnBiLIbI2vuj
 htfEL+cm2DaqDVqoCsYSJCBVRtteeljSo2+z7tzzWcc/c68Xbj7Xhmy06B8zOxapOL
 zf+1CsvX2G7hRz+n5ZIEfixA+8M/2DBMCQygmQMVcgSoUvfiUP6+Lt2dZ6xUvH5inO
 jtqr7UnuG+dtA==
Date: Fri, 30 Aug 2024 10:20:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RFC PATCH 3/4] dt-bindings: reserved-memory: add
 linaro,restricted-heap
Message-ID: <3bqb6mktkvbdl6h4eekad4mpjhyvzx7mjidhnanboygbwu2asz@6ros56bp6isd>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-4-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240830070351.2855919-4-jens.wiklander@linaro.org>
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

On Fri, Aug 30, 2024 at 09:03:50AM +0200, Jens Wiklander wrote:
> From: Olivier Masse <olivier.masse@nxp.com>
> 
> DMABUF reserved memory definition for OP-TEE secure data path feature.
> 
> Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  .../linaro,restricted-heap.yaml               | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml b/Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
> new file mode 100644
> index 000000000000..0ab87cf02775
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/linaro,restricted-heap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Linaro Secure DMABUF Heap
> +
> +maintainers:
> +  - Olivier Masse <olivier.masse@nxp.com>
> +
> +description:
> +  Linaro OP-TEE firmware needs a reserved memory for the
> +  Secure Data Path feature (aka SDP).
> +  The purpose is to provide a restricted memory heap which allow
> +  the normal world OS (REE) to allocate/free restricted buffers.
> +  The TEE is reponsible for protecting the SDP memory buffers.
> +  TEE Trusted Application can access restricted memory references
> +  provided as parameters (DMABUF file descriptor).

And what is the difference from regular reserved memory? Why it cannot
be used?

> +
> +allOf:
> +  - $ref: "reserved-memory.yaml"

It does not look like you tested the bindings, at least after quick
look. Please run  (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

> +
> +properties:
> +  compatible:
> +    const: linaro,restricted-heap
> +
> +  reg:
> +    description:
> +      Region of memory reserved for OP-TEE SDP feature
> +
> +  no-map:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Avoid creating a virtual mapping of the region as part of the OS'
> +      standard mapping of system memory.
> +
> +unevaluatedProperties: false

This goes after "required:" block.

> +
> +required:
> +  - compatible
> +  - reg
> +  - no-map
> +
> +examples:
> +  - |
> +  reserved-memory {
> +    #address-cells = <2>;
> +    #size-cells = <2>;
> +
> +    sdp@3e800000 {
> +      compatible = "linaro,restricted-heap";
> +      no-map;
> +      reg = <0 0x3E800000 0 0x00400000>;

lowercase hex

Best regards,
Krzysztof

