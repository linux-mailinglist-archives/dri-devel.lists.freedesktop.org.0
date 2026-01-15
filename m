Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43830D2841A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 20:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2A510E7BF;
	Thu, 15 Jan 2026 19:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rsCBjpuj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063AB10E097
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 19:55:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AD06D6016B;
 Thu, 15 Jan 2026 19:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F813C116D0;
 Thu, 15 Jan 2026 19:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768506918;
 bh=XZncQ0dUakJFPgRU9hpqVTYJ5hxovVt8hAheLyZxs+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rsCBjpujQ0YkwUNZT88VQxZTeJKv0aj3p6U3UzNLEvhie4w7hacgHCrHaNtkv1GWk
 ibyOtVSI7ZS8sav/Zl+nDpW4t52WYtsweyhS+Pnrb72qMiN506D3b5OfKEjAlYRkzx
 qFGtwvFqDURx1FZ2dkRZ83IN7iqhFe2Jpfv/o7bBBzoy6mTRFCRH7VoUv1HEpBD+eV
 BwrWSoyL2BTOoWzF0a8lOTGEuVdwZ4zzEzUkma+mSdwRilbcs3U+IZhzruOI/I7D4a
 rHaBGN/XveBAcXQgZRP1Eq7FHi5DPcSWMQiz2S56uY9YdVItSYPsxnmTzQBc130fnS
 5uDMv1RCczQqA==
Date: Thu, 15 Jan 2026 13:55:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Michael Walle <mwalle@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, linux-amarula@amarulasolutions.com,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/4] dt-bindings: ili9806e: add Rocktech
 RK050HR345-CT106A display
Message-ID: <176850691645.1085868.8711955691654595696.robh@kernel.org>
References: <20260114161636.1076706-1-dario.binacchi@amarulasolutions.com>
 <20260114161636.1076706-4-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114161636.1076706-4-dario.binacchi@amarulasolutions.com>
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


On Wed, 14 Jan 2026 17:16:18 +0100, Dario Binacchi wrote:
> Document the Rocktech 5" 480x854 panel based on the Ilitek ILI9806E
> controller.
> 
> This panel uses SPI for control and an RGB interface for display
> data, so adjust the binding requirements accordingly.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v2:
> - Restore vdd-supply as required for both DSI and SPI types
> - Dop useless settings in case of rocktech,rk050hr345-ct106a
> 
>  .../display/panel/ilitek,ili9806e.yaml        | 38 ++++++++++++++++++-
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

