Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDCBD08BB6
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89EE10E899;
	Fri,  9 Jan 2026 10:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WwVfFtBg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F8B10E899
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:55:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 955A960163;
 Fri,  9 Jan 2026 10:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABD4C4CEF1;
 Fri,  9 Jan 2026 10:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767956155;
 bh=jSsdAsuMK4AyU9vZfxLT0k9quVeP0qbf7NiuoqNtX/E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WwVfFtBgVNDhNZr8A5KrkACFPzarvIAA+JDvRqzoT7iSBrRGqviv3pIkQhgk/fdIX
 W9MtuvtFkMCHnJMK9Vp4jYONhtYnD8JfH2W09VqdZGkpf7I84O9mNPATTCPU3fJKPe
 ZsODbcr/BpuX4zm212qvWr0iIxbOKKf+ht0X/eZnzLgCNshI8L7k9ABpr2tjh/kBHw
 rQ2ekYmJeQm4K/TWPXDDvMW5t8IqKTcwGIc+P4Pd901JjrGMFdEsrSwZsQKj68o1fc
 DvGnM5gtXEV2Fz2AvGVVEwiZhZQ/Cco/qBvjXvWQKAX/0C4dtaTF65KMfSnm3xguro
 IfEZfSQdNLDoQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 dharma.b@microchip.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251218040521.463937-1-manikandan.m@microchip.com>
References: <20251218040521.463937-1-manikandan.m@microchip.com>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: mfd: atmel,hlcdc: Add
 sama7d65 compatible string
Message-Id: <176795615103.1641584.16279123145525426075.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 10:55:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Thu, 18 Dec 2025 09:35:19 +0530, Manikandan Muralidharan wrote:
> Add LCD compatible string for sama7d65.
> 
> 

Applied, thanks!

[1/3] dt-bindings: mfd: atmel,hlcdc: Add sama7d65 compatible string
      commit: 9efacd6c2fdde4fe1919034ef1b0ed666458c275
[2/3] mfd: atmel-hlcdc: Add compatible for sama7d65 XLCD controller
      commit: b323fbb6f6237fe030ac9391319b32353a4b0e68

--
Lee Jones [李琼斯]

