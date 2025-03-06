Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2878BA55399
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D30710EA49;
	Thu,  6 Mar 2025 17:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qgmITw3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C587110EA49
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:54:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 389735C0DF4;
 Thu,  6 Mar 2025 17:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F90DC4CEE0;
 Thu,  6 Mar 2025 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741283696;
 bh=U3xdOAHZKeSPz+aKFdQVzR86S0fcAtL0VWeNwF394GU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qgmITw3itpG7rB5G4E2ytRfHOf/CZyLWYSRSCbnm+w+AwTfWijs5gy/RdBsSJMK4b
 3QzzZ0KTatu2G+qOh5xBDH6GImXzOfG4vVdLGB9tiL1h/3RCBu9FWivFK0FRmVxTU/
 RQRBziC0h9xr+87NHjTCvONt//OdhWp+FWnOjIAligvHHuQWxMj6MV+WNuegWpWUou
 rwAz+QYFeqA0Wz2+EpZzjsaFAlFblkhd1JIm9kIDiqE+xtrZEgxrsOAhuvMK7zFXyJ
 wkJLv+8bdL8G8i8UPoaofgbfY4ZfcNgkP7FOL4aunsdNt3yMlhCzOOwvvjXRoBAspa
 Rgbye1eT1DP1w==
Date: Thu, 6 Mar 2025 11:54:55 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: display: mitsubishi,aa104xd12: Adjust
 allowed and required properties
Message-ID: <174128369455.567749.6557990524216998006.robh@kernel.org>
References: <20250225210316.3043357-1-robh@kernel.org>
 <20250225210316.3043357-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225210316.3043357-2-robh@kernel.org>
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


On Tue, 25 Feb 2025 15:03:15 -0600, Rob Herring (Arm) wrote:
> The Mitsubishi aa104xd12 panel requires an external backlight driver
> circuit, so allow the "backlight" property.
> 
> There are users of this panel without a vcc-supply, so it shouldn't be
> required.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

