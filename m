Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F75C47005
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3E310E2B7;
	Mon, 10 Nov 2025 13:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CW5VnlND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B66510E2B7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 13:47:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B9E384087F;
 Mon, 10 Nov 2025 13:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38CFC4CEF5;
 Mon, 10 Nov 2025 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762782475;
 bh=A7lr2LrvBFmcDLApeRBjnBjJ324Uj8x6sVYi9mBW+C0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CW5VnlNDs0ntjgzY5b+Tz/4O07oZEAQzo9CAYfSJhyFQBD2/pbbthFEIsDyKDp3hB
 aiysJubGXin0vHJV0/xHjso2jH4qEbtUleBkQhwVL1Ex5tkJKJXiuu/5Iv2KDkuGw+
 jcZpiX2hC4V7HCCyAZqJKup16o5VVX6bqFXBqxBNhee3+UYhkL0sjsfZqSUwKd1O+0
 ngLmq9vZTZGiJjyFLac14kRDd1hsZ/19JrZCTpG6PYYDjDRi5ZQ/ATbn6pFJn7hwMG
 LP59OJJdc6krKXQvO0rr9ov1dzIesPfQTt/3CIYa9SmeBOZtK8Bl0E5DdE7iOjUdYx
 1HuaeAi8oLgpw==
Date: Mon, 10 Nov 2025 13:50:04 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
Message-ID: <aRHtjGuzLHwNGe_o@aspen.lan>
References: <20251109032240.3422503-1-caojunjie650@gmail.com>
 <20251109032240.3422503-2-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109032240.3422503-2-caojunjie650@gmail.com>
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

On Sun, Nov 09, 2025 at 11:22:39AM +0800, Junjie Cao wrote:
> Add Awinic AW99706 backlight binding documentation.
>
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
