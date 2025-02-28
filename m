Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA79A4A3DA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 21:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2886310ED2E;
	Fri, 28 Feb 2025 20:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dEKk3fjw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F1310ED2E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 20:16:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 602D26127F;
 Fri, 28 Feb 2025 20:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55366C4CED6;
 Fri, 28 Feb 2025 20:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740773815;
 bh=8TFtmmo8Cj/1mL9CXXBf+fIuueDZSkXfv+2WvtbbpDo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dEKk3fjwrOLQ2ZdEJn6sLVv2phon3voA3UhAbVtZ0MzIS79r0ke/YsbpLpEr+Lunw
 a56B0uXYVEtxmwwB3CqG7XPJPAYJ0AoQL5fUGVMUoGwrISCk1dO81Mr1Eah8RwsN8N
 p0VGImGK3qlmR5ohnOhO3zUKv0fiBvwg07mUlSrao97lLbGnx3d/7L8+arvyRTlJxg
 MYcc1ZQeyFxi7ZDvM1CIma2iy/Lt6Gv8YRSDyax5DOa7TQqM/v4czDzbSXDo3sHjgn
 9wBVeNPdHwNQEncrPoUig4EUSNgRDfAV+qI0iNiYFFkapQd0auNrxBTCKLv99Wkz1T
 wHT8S78eQTqXA==
Date: Fri, 28 Feb 2025 14:16:53 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, heiko@sntech.de,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v3 05/15] dt-bindings: gpu: Add rockchip,rk3562-mali
 compatible
Message-ID: <174077381343.3590059.11657408912105758197.robh@kernel.org>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
 <20250227111913.2344207-6-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227111913.2344207-6-kever.yang@rock-chips.com>
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


On Thu, 27 Feb 2025 19:19:03 +0800, Kever Yang wrote:
> The Rockchip RK3562 GPU is ARM Mali-G52, use the same driver with
> "arm,mali-bifrost". Extend the binding accordingly to allow
> 
> 	compatible = "rockchip,rk3562-mali", "arm,mali-bifrost";
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v3:
> - Update the commit message,
> - remove the change for clock maxItems
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

