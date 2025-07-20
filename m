Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C3FB0B93D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 01:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6D510E463;
	Sun, 20 Jul 2025 23:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hPshk5gB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D7210E463
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 23:32:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C9755C0FDB;
 Sun, 20 Jul 2025 23:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DB9C4CEE7;
 Sun, 20 Jul 2025 23:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753054377;
 bh=RWzw0XSPmQWo0yyYpdgifZLEFyFQUyfb+2mlWFliVck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hPshk5gB24uJbZXtW3soM7eQk8qsqUoAKCAQ6/KkBG9aTsQkfP5NP0/e1VcE58pq7
 3l+nb777W4YUxChIdTz4usAK5jiOexBieszc2fiuNHY0S0aRgHoZmEhga+NsvOyv67
 DO2XmvzyOCoaUrqZpZeyZNCyd0tOBlSUzLm32jtT1kTdPe+KoIbRuf1fbvi8kHSh0F
 aQw8IJOiiqOcXhIhx0Q9PffxfDHxiqe6BsnoGgSn6xuwXHdKYl65y/h4UfUMd7JhRw
 cU8XzrxnTZCBpwGpy6Di2dOApHVqMo2bPaKxcoADzd3vmTFIv/AefqWa5xDf4o2lHm
 qzU77vlo30lFg==
Date: Sun, 20 Jul 2025 18:32:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: Document Hydis
 HV101HD1 DSI panel
Message-ID: <175305437636.3071163.14273228535635494887.robh@kernel.org>
References: <20250717135752.55958-1-clamor95@gmail.com>
 <20250717135752.55958-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717135752.55958-2-clamor95@gmail.com>
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


On Thu, 17 Jul 2025 16:57:51 +0300, Svyatoslav Ryhel wrote:
> Hydis HV101HD1 is a 2-lane 1366x768 MIPI DSI panel found in ASUS VivoTab RT
> TF600T tablet.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/panel/hydis,hv101hd1.yaml         | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/hydis,hv101hd1.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

