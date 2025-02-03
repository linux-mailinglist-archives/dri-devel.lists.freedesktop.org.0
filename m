Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8F7A26256
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 19:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C978810E14D;
	Mon,  3 Feb 2025 18:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hnbbm+8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B986910E14D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 18:28:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 68300A41B12;
 Mon,  3 Feb 2025 18:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA4EC4CED2;
 Mon,  3 Feb 2025 18:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738607281;
 bh=j6QY1ALFobq2N/DPHsWZlH3iFEMeCCQWmy90WW7dn2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hnbbm+8dCFdJki12PScz0Xj4K8W3cpni97cZY48MKKCvm7A0fXXY/fGXjPsIlTKc7
 9++SiKYwLFw1xi8l/+HEPpwTh/utHMczHLtONvMwnfV9cjGh7vTxl0EtqDhBbJ30Cb
 cCzx/Db6rXfU5K07mW/8GAMyoD+XH+5bmFWgN5PphmDOulC5rCk1DgE2PrmckCBGtT
 dStaGDzsbrNVfjNp9Cd0HirGfgLxMMAJJ8N32JL/yYr4C9GNUR1XomebDo9OSv9ecu
 zOKEtdvyf1VBzxYtbJMXT1TiKERAT8Q9DTY80s7TIEoYcGohUdkpkbZ1lwNGA5/zGr
 513x/O4iV5XjQ==
Date: Mon, 3 Feb 2025 12:27:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de,
 conor+dt@kernel.org, praneeth@ti.com, vigneshr@ti.com,
 maarten.lankhorst@linux.intel.com, s-jain1@ti.com, simona@ffwll.ch,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 r-donadkar@ti.com, devicetree@vger.kernel.org, j-choudhary@ti.com,
 aradhya.bhatia@linux.dev, linux-kernel@vger.kernel.org,
 h-shenoy@ti.com, krzysztof.kozlowski@linaro.org, krzk+dt@kernel.org,
 jyri.sarha@iki.fi, mripard@kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: ti: Fix compatible for am62a7 dss
Message-ID: <173860727794.3352453.14301718625197300615.robh@kernel.org>
References: <20250203155431.2174170-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203155431.2174170-1-devarsht@ti.com>
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


On Mon, 03 Feb 2025 21:24:31 +0530, Devarsh Thakkar wrote:
> Fix incorrect format of compatible string (comma instead of hyphen) for
> TI's AM62A7 SoC.
> 
> s/ti,am62a7,dss/ti,am62a7-dss
> 
> Fixes: 7959ceb767e4 ("dt-bindings: display: ti: Add support for am62a7 dss")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V2: Add Reviewed-by and update commit msg
> ---
>  Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

