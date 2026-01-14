Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF16D1D74F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 10:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B806110E3A5;
	Wed, 14 Jan 2026 09:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rZonvDP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9DD10E3A5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:18:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EAF236001D;
 Wed, 14 Jan 2026 09:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4405EC4CEF7;
 Wed, 14 Jan 2026 09:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768382327;
 bh=cbSVacEGGbMYoyfPUQodO8IZ9qWw5QrZa/XaiFemHcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rZonvDP4xuuY3ZESpkMQpKhwb4LP44StnjJ6mCr/f/YG2ulSMgOArhG327ppaCImu
 uqbtEZ024B/AzqAx20URe3n0vxig+S2MUz9lAk+d864Mf9btI7zV4eHx1KVMf1rI7i
 Y3KHK0phb1veR7V5LXa2wqpDbFxUwbtDLC7ovrPQX2CTt5TujaekEs+aFJuuVEi69q
 MK+HikAM2dl83j1qIdRmwMYNB8sWThAKVFClYYwPEdEKQoLJ/mjUHLWJA1RrMeNZvv
 vRz6QYQhEdy16RafeWAXBXmY0AV16YyjShEzA+U6ThtjF9VI/Y6mVkXG8v9Q+WAcDd
 rx1vK4JhiEVGA==
Date: Wed, 14 Jan 2026 10:18:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: add EDT ET057023UDBA
 panel
Message-ID: <20260114-pastel-wrasse-of-popularity-bcccb5@quoll>
References: <20260113-v6-18-topic-panel-simple-et057023udba-v1-0-54ad218ee52b@pengutronix.de>
 <20260113-v6-18-topic-panel-simple-et057023udba-v1-1-54ad218ee52b@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113-v6-18-topic-panel-simple-et057023udba-v1-1-54ad218ee52b@pengutronix.de>
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

On Tue, Jan 13, 2026 at 01:18:37PM +0100, Marco Felsch wrote:
> Add EDT ET057023UDBA 5.7" 24-bit 640x480 DPI panel.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 2017428d8828e554f26f7c5d585f55a51b74a2ca..3dc2e0958bcb9965f35a21ed9982225f22ae269e 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -105,6 +105,8 @@ properties:
>        - edt,et035012dm6
>          # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel
>        - edt,et057090dhu
> +        # Emerging Display Technology Corp. 5.7" 24-bit VGA TFT LCD panel
> +      - edt,et057023udba

Misordered, 57090 > 57023.

Best regards,
Krzysztof

