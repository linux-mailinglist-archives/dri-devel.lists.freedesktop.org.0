Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B29D269BF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 18:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C0110E7B4;
	Thu, 15 Jan 2026 17:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O3PF5a3e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3204810E7B4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 17:40:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 08132433A2;
 Thu, 15 Jan 2026 17:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B0AC116D0;
 Thu, 15 Jan 2026 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768498848;
 bh=vdsPn0752ZUNlaPfpcfVirjmE9to0sS9ZCmiPv19dTc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O3PF5a3eshlsBXUXlqRZeJ0irz0rLqZR3slSBrlLLEkXsssx6Iz9BwRG+XJZkSBU5
 pBE3zDZ8+U6SQcJuJvEada1Z5oTKZvq2x3LS+HaB4JELw6BZYmMT8BEdRyvdCad5Vf
 CSCBdyAKWvHg6GnbYGFuOf+Sub9mRnsfVj53sHjB6t9fYoHKYv8Heesr6P3n3dBaTi
 2dkHQX5aYbsaGwrtgH2cS/b0W7LuBRN4AaGnGNGs/TTs42fWeOg6EdaGGYpzfv8OWP
 v67nLdMMwcdBoym4l29C2gnT1PeTHK0U4yQr5wV1BeEeFT0JEad4JwfJtFSJRO7edG
 kfzeEwoQV6bPg==
Date: Thu, 15 Jan 2026 11:40:47 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
Message-ID: <20260115174047.GA930768-robh@kernel.org>
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
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

On Tue, Jan 13, 2026 at 01:05:30AM +0100, Marek Vasut wrote:
> Move the Waveshare panels description into separate document, so they
> can be properly described with compatible = "waveshare,...", "panel-dpi"
> and attached to "waveshare,dsi2dpi" bridge.

But why do we need "panel-dpi"? Adding that requires changing a DT. 
Can't you make the kernel handle these compatible strings as a 
"panel-dpi" without the compatible?

Rob
