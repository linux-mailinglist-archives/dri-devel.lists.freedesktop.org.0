Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B39BBFA71
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 00:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F8C10E160;
	Mon,  6 Oct 2025 22:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pwWVmz4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CC510E160
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 22:14:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3639E611A0;
 Mon,  6 Oct 2025 22:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E35C4CEF5;
 Mon,  6 Oct 2025 22:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759788867;
 bh=AU+k/K3xMbR9LgDL/XNA560DPNBR4afmkhdDKAJ7ihY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pwWVmz4wmaS0pmnb99IVxxgp596uVaBe7cpSuGTbI4lqzdrZLwjLdtRau8PG/LAs1
 Y/t4Pis908onQGf1VHJURvOhoD1a+yjcs3AjdAAstvBbk9keGmGTBrNjIIc/pW7HXz
 8B/XdjBKY8Znfzc795TGfaQTi3YsIZtCqk5vmZKsmnEb2ZyqKY/TFne6nGv0Un4J30
 FyL4tps1vtJt5KsCd3eFII44WuYkYo2QQT7XUbOVTIixlLx9JlZbgtjviu/MtMMwsi
 +W8gatYWa0OkRtiinBHpTRt8ueYpeEQ9DQia7qxnwTJwCeHTzVYEMVdN0ICxhuOxkU
 fj6R2d/vMmWbA==
Date: Mon, 6 Oct 2025 17:14:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-tegra@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 6/8] dt-bindings: display: panel: document Samsung
 LTL106HL02 MIPI DSI panel
Message-ID: <175978886632.674313.2041606700442235816.robh@kernel.org>
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-7-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929142455.24883-7-clamor95@gmail.com>
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


On Mon, 29 Sep 2025 17:24:52 +0300, Svyatoslav Ryhel wrote:
> Samsung LTL106HL02 is a simple DSI which requires only a power supply and
> an optional reset gpio.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

