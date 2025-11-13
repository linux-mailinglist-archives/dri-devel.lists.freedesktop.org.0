Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D2FC58C38
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515A410E8D6;
	Thu, 13 Nov 2025 16:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e6P8PKTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC5C10E8D8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 16:35:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0424B60103;
 Thu, 13 Nov 2025 16:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CE6C4CEF7;
 Thu, 13 Nov 2025 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763051754;
 bh=cdRHosx/O0Ulg6B2qMkVUn6h8soMr/wMKtBDIxclsCQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=e6P8PKTYBXBkE46MfBoh73NNTFoOnQsFrGHnUxNszYYBR8rmiH4+bGwrXEY7nVI1j
 NCzxvV9Hk6ciT7d5ZTjRz2eTKVQLyIsBUPcc8Oxwjn24omMqJr5kOyEijTtcbvgEaN
 aHER5YzX7Cp/g+HSYjHu/EEVVb70tLLq8t/PvR9eAaKhuD3rv1rncLZZUhGdh300RZ
 xGWVjM3OHI6tq/fWLvRMIT6iGN2Nnn13aNoZH0XFE3/JAKAi+PH5HCS796Um74rdWL
 S1IPHsshtGpyT/hAcDnA0EEytgdGds5w+q9rm9RMBuePjxW/krhfl4fLntIyUoxvDi
 vg5fBmtevzlVg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Junjie Cao <caojunjie650@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
In-Reply-To: <20251109032240.3422503-3-caojunjie650@gmail.com>
References: <20251109032240.3422503-3-caojunjie650@gmail.com>
Subject: Re: (subset) [PATCH v3 2/2] backlight: aw99706: Add support for
 Awinic AW99706 backlight
Message-Id: <176305175143.1576992.14048590828107741090.b4-ty@kernel.org>
Date: Thu, 13 Nov 2025 16:35:51 +0000
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

On Sun, 09 Nov 2025 11:22:40 +0800, Junjie Cao wrote:
> Add support for Awinic AW99706 backlight, which can be found in
> tablet and notebook backlight, one case is the Lenovo Legion Y700
> Gen4. This driver refers to the official datasheets and android
> driver, they can be found in [1].
> 
> [1] https://www.awinic.com/en/productDetail/AW99706QNR
> 
> [...]

Applied, thanks!

[2/2] backlight: aw99706: Add support for Awinic AW99706 backlight
      commit: 88a8e9b49ee80a9aafc1e0b8c6cf0884f63eefbb

--
Lee Jones [李琼斯]

