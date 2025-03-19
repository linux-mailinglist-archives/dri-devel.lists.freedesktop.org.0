Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B12A6876C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 10:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C4210E4E8;
	Wed, 19 Mar 2025 09:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LMkSEzLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BF010E4E8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 09:05:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 84BC3A48FEC;
 Wed, 19 Mar 2025 09:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64A2C4CEEA;
 Wed, 19 Mar 2025 09:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742375149;
 bh=kCICy4CCtytIDn9KKZBypA5lHyaF55VxprlRT8A13I0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LMkSEzLK0AE8oSZ1o5yHkxSyMJ57JbG2luY5yXtjiB/W8pxCZwgypEK/M+nMZYaBg
 PpVzybMdlIqWiRxUvOsNEI3QryysH6j/yiwQ5n+9MfEZVX2wx53p4w41TFjj68aL5H
 4qgG5nKR5hmh+4Xj2ydZHc14ZEYgmyxOxBFQPGFKH+iaR1BLKtgrSQmchEEuv0g6mK
 i3ilnLTyDB8s4Vl2xw9tTEC6jI+1JdJn0kleMs7a/oOx0JMeCQ7EhGjtorhOzZzaPl
 tK2EEcnN3S47XljsuEZB2mnwPgAQ9Fr+w7PVdkZ0NZzZ2YhdMYx/SDJNUI2aM0GMQx
 2shse4TaUepBw==
Date: Wed, 19 Mar 2025 10:05:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add NLT
 NL13676BC25-03F panel
Message-ID: <20250319-monumental-real-ibex-65d7ed@krzk-bin>
References: <20250318-b4-add-nlt-nl13676bc25-03f-v1-0-67e0f8cf2e6f@bootlin.com>
 <20250318-b4-add-nlt-nl13676bc25-03f-v1-1-67e0f8cf2e6f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250318-b4-add-nlt-nl13676bc25-03f-v1-1-67e0f8cf2e6f@bootlin.com>
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

On Tue, Mar 18, 2025 at 08:58:28AM +0100, Antonin Godard wrote:
> Add NLT NL13676BC25-03F 15.6" LCD-TFT LVDS panel compatible string.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

