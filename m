Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8157782A3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 23:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D3910E60C;
	Thu, 10 Aug 2023 21:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEBB10E60B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 21:19:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8904B65E9B;
 Thu, 10 Aug 2023 21:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E412CC433C7;
 Thu, 10 Aug 2023 21:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691702383;
 bh=4kGVfgLy4tWMQ3Bm3kTeHSuZdGBBUrsV8AAjFrGH5/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qr/ga7T4dkt08vmjv9uk+R3afcK8sHFsNzTqjq0/LgXfDeC7S1CnrOViWLUtPX//r
 r5p/svzqpLj8E5BooNFvaDbgd2wwfgvHlVfK2aiTkNB/rPw3+X6UPcTmsXX9nSX8nM
 s7FDYVm6VdZVltTX0HlZWGtFk8nnwzlpTbKpegVRcEtTOj9rtWJ9c8LyaktNpuu2Vt
 LmwpYld9JNG/meKH4RyvO3R+90KtCLG5O0moadhgEsI3MaMzTnHj2rcft5z0eP6/4v
 SWjksQB6OMdAQuN3VA0hLm0ap1VOCb8pXnED+gCzlxJDZF7UA3cNR/elVJ++VEFKVD
 lM6WGvV0gMVBw==
Received: (nullmailer pid 1207316 invoked by uid 1000);
 Thu, 10 Aug 2023 21:19:40 -0000
Date: Thu, 10 Aug 2023 15:19:40 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Add panels based on
 ILITEK ILI9806E
Message-ID: <169170238026.1207230.3686279612864971969.robh@kernel.org>
References: <20230810144116.855951-1-luca.ceresoli@bootlin.com>
 <20230810144116.855951-2-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810144116.855951-2-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 10 Aug 2023 16:41:15 +0200, Luca Ceresoli wrote:
> Add bindings for LCD panels based on the ILITEK ILI9806E RGB controller
> connected over SPI and the "ShenZhen New Display Co NDS040480800-V3"
> 480x800 panel based on it.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v2:
>  - remove T: line form MAINTAINERS entry
>  - reference spi-peripheral-props.yaml
>  - add 'maxItems: 1' to reg
>  - use unevaluatedProperties
>  - remove out of scope backlight node
> ---
>  .../display/panel/ilitek,ili9806e.yaml        | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

