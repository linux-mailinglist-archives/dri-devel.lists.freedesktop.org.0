Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDD09FF6C9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 09:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACA210E2F9;
	Thu,  2 Jan 2025 08:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GteS3qox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0542010E2F9
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 08:22:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ECA43A40C59;
 Thu,  2 Jan 2025 08:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C37DC4CED0;
 Thu,  2 Jan 2025 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735806133;
 bh=msN4as29mKxk7DUjz/+TMM5v7m3GXDPe+X4uz2SOAjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GteS3qox4OIUc9PXK+t3pRoR5Nxw6DkZAwHA2TTWhgtHS2p2CXin6mjAAK/1yBiag
 KyGVuietYvvaO3UkqOQAbTmZy1/3O86uYwAR6E/ljS9b/zaBXkVLsCa+YFPZtV7smS
 IQf2rv8wwvxNI5cKOV0ME3L2IG2GOWWrbwZBgDHh8EUGnV+yrSPna876+rKq8VYRwV
 xy1snUiv/H/lMv6V8Fu7hBLOfNRILfJ4eGJlFFxQ5Gxybl1R8nl7QUxG0q2Fdlp9na
 EBCpjd7o7DWkyWrfzPO5nUDhBuep7OxX6CbGGFWtGNDAXNxwc3NHd1ApbwUIwt/1B5
 P3wPgNNgBFWNQ==
Date: Thu, 2 Jan 2025 09:22:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, simona@ffwll.ch, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 
 praneeth@ti.com, vigneshr@ti.com, aradhya.bhatia@linux.dev, s-jain1@ti.com, 
 r-donadkar@ti.com, j-choudhary@ti.com, h-shenoy@ti.com
Subject: Re: [PATCH 1/2] dt-bindings: display: ti,am65x-dss: Add support for
 AM62L DSS
Message-ID: <tq3s2ssbp3yypzff66qzagd3bmx2eat24dzwddzppttijhsquj@mgbc36we7nrg>
References: <20241231090432.3649158-1-devarsht@ti.com>
 <20241231090432.3649158-2-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241231090432.3649158-2-devarsht@ti.com>
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

On Tue, Dec 31, 2024 at 02:34:31PM +0530, Devarsh Thakkar wrote:
> The DSS controller on TI's AM62L SoC is an update from that on TI's
> AM625/AM65x/AM62A7 SoC. The AM62L DSS [1] only supports a single display
> pipeline using a single overlay manager, single video port and a single
> video lite pipeline which does not support scaling.
> 
> The output of video port is routed to SoC boundary via DPI interface and
> the DPI signals from the video port are also routed to DSI Tx controller
> present within the SoC.
> 
> [1]: Section 11.7 (Display Subsystem and Peripherals)
> Link : https://www.ti.com/lit/pdf/sprujb4
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

