Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C406B54387
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 09:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11F610EBB0;
	Fri, 12 Sep 2025 07:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E2uUG2di";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D88910EBB0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 07:09:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1414A443C0;
 Fri, 12 Sep 2025 07:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DBEC4CEF4;
 Fri, 12 Sep 2025 07:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757660984;
 bh=4AlYbUZqbeoGnHZ92DdTmZ5FEV+tYiDs7FOZ8YpY29U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E2uUG2diI3Zm5h84JEAUPN/VYN+T1o384EdT5mjkNcnGKKElEiA+X75BxRaieiVLH
 nzXpIAK0bfxjhBqku0zTNcL4s9mf07zhnV4dlawdAkmcueJKwOu4ql/yW+f08huXjd
 YSJyc/43tlOEORw99ZXvBsitrmzxArTfvGWxCXh7XQOrTBDPlcwZa0EbDEvpS+udRx
 lBevJk/fJQcgLlpk5jYmzHK9zn9Y6xUtL29OHgrj1ZWEixm238y/kh0jz7psdpf0bW
 OSvCwXcoLUjV3FZLE0gC+KkWgQBWN7wfNbgFxJIEF/YIQ4N375yKrwibeGXbWe+Paf
 PMCzca9hZg2kQ==
Date: Fri, 12 Sep 2025 09:09:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/9] dt-bindings: display: imx: Add i.MX94 DCIF
Message-ID: <20250912-astonishing-bipedal-raccoon-4a9c67@kuoka>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
 <20250911-dcif-upstreaming-v5-4-a1e8dab8ae40@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911-dcif-upstreaming-v5-4-a1e8dab8ae40@oss.nxp.com>
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

On Thu, Sep 11, 2025 at 02:37:04PM +0300, Laurentiu Palcu wrote:
> DCIF is the i.MX94 Display Controller Interface which is used to
> drive a TFT LCD panel or connects to a display interface depending
> on the chip configuration.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/display/imx/nxp,imx94-dcif.yaml       | 82 ++++++++++++++++++++++
>  1 file changed, 82 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

