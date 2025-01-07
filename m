Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DA7A04D6B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 00:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406D610E337;
	Tue,  7 Jan 2025 23:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b9VmdG/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB04B10E337
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 23:23:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EAC56A41EC9;
 Tue,  7 Jan 2025 23:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D79EC4CED6;
 Tue,  7 Jan 2025 23:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736292189;
 bh=Q3yRCHCX/2HbN6xwYgE3+FSs8cJMDQK71kn/k4aPaQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b9VmdG/r4WSM89OjKynkbHkiPCfh9P4hlp9oYCNkcTQghHJL9xZBzDox8rX2yIWP4
 ifly861Q0vzP/cTbQL2GWzWkcC9d03uF91VCvuhb0vAAszuQcsdvNK36MIh5IVWagN
 jhf6SxZRNiFonHDOyz/Wr+xBLp7burtrlwIoK3rHprzWTJEB4B53xAoRKm4uqBO9GQ
 3/rMTZqbpIfCSelNsD53b8vczvCGwnvbbhyy2MeXvfzyqbQbWoToeOnxyyxKwD8gpr
 Jegx+MpcBKmJVFKvdaFXJHmqbwdiX789KoyU3TMtQPCTLBO/5884lXby1TPY59fsiH
 Tisw5YZnw51WQ==
Date: Tue, 7 Jan 2025 17:23:08 -0600
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: samsung,mipi-dsim: Document
 fsl,imx7d-mipi-dsim
Message-ID: <20250107232308.GA2039463-robh@kernel.org>
References: <20241217131431.1464983-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217131431.1464983-1-festevam@gmail.com>
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

On Tue, Dec 17, 2024 at 10:14:31AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The i.MX7D MIPI DSIM block is compatible with i.MX8MM.
> 
> imx7s.dtsi uses the following compatible string:
> 
> compatible = "fsl,imx7d-mipi-dsim", "fsl,imx8mm-mipi-dsim";
> 
> Document "fsl,imx7d-mipi-dsim" to fix the following dt-schema warning:
> 
> ['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

I applied this one[1] instead as it reuses an existing items entry.

Rob

[1] https://lore.kernel.org/r/20250107094943.518474-3-alexander.stein@ew.tq-group.com
