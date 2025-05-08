Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB5BAAF4A5
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 09:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D85810E8CB;
	Thu,  8 May 2025 07:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cytNPQ0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7C110E8CB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 07:26:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 09B4F629E3;
 Thu,  8 May 2025 07:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26533C4CEEB;
 Thu,  8 May 2025 07:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746689186;
 bh=lDVhoE3V2KBUKc6XkA3MZUxna2iMhYxYrxfM8q0Hm0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cytNPQ0VyKQFqKkF0zNpjCyBrU/cPfvXhhlh6V3+EYdpgk0AGJKMDFRooHr6Gys6F
 4y5cUTxbdIvf0AV+VPyHFVca+7Azp8k43cJqOUZE7J750oLYwgr2TngpFFg6N5MdBq
 FIrkmB55/C3HDIbszl+qXOrL2szdf+LcGtLIqijM/5IBaJvK1QsFfzOAqNZvq9juIQ
 l+8tPFmzylgsQHLW0i74lBD05UWKCpt2IGHEAaU4Y1k2ncDh9q3yjYQO+sp2zYBpmu
 s5TMJfWF/AlAKnnG2c06/Sps4kHZ2/Dc63SJwVNUd0oVa+YK5Lua8Bi1q4+BwQ5og1
 dfajrgZDfaBjg==
Date: Thu, 8 May 2025 09:26:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, ryan@testtoast.com, macromorgan@hotmail.com, 
 p.zabel@pengutronix.de, tzimmermann@suse.de, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org, samuel@sholland.org, 
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH V9 00/24] drm: sun4i: add Display Engine 3.3 (DE33) support
Message-ID: <20250508-foxhound-of-interesting-drizzle-34adae@kuoka>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
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

On Wed, May 07, 2025 at 03:19:19PM GMT, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> I've spoken with Ryan and he agreed to let me take over this series to
> get the display engine working on the Allwinner H616. I've taken his
> previous patch series for Display Engine 3.3 and combined it with the
> LCD controller patch series. I've also fixed a few additional bugs and
> made some changes to the device tree bindings.
> 
> Changes since V8:
>  - Combined the DE33 [1] series and the LCD [2] series to better track
>    all patches necessary to output to an LCD display for the Allwinner
>    H700.

You have here three or four different subsystems. This does not make it
easier, but it makes it a huge patchbomb with unspecific or complex
base.

Such combination makes no sense, because anyway it will have to be split
per subsystem. You just know made it difficult for maintainers to review
and apply, because they cannot apply entire set.

Best regards,
Krzysztof

