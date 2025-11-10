Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50BAC47011
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A0D10E3BD;
	Mon, 10 Nov 2025 13:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YeqBQVIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE32810E3BD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 13:48:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 086EA601AE;
 Mon, 10 Nov 2025 13:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BFAC113D0;
 Mon, 10 Nov 2025 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762782496;
 bh=c4ibANFzZi0AKft9rX0nhMv9appXuYAGUW3N5OZWpEA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YeqBQVIi2BbRrIY0GKloL18yr4OcPXU/EGUNPRcpaDUkCRs7wKVo+ZtXwKJ1wASFh
 Tmxkm9TQrtZR9iXPwnWpdpQn4h/IvK7W37CgjWEkL35/ioUi5OOJy1WfEya4BwdCX1
 AN5nmpgtprr8f5eS9dtOD9eo3Y/eGNwglxrbxh++GOBGzv0urLqX7HF0E+nVtgP43y
 lvXmtoXFftyoovVo+YC49sbWmkPdSQ2OTRtCgjh4CApdNXCPRYGfSmf+GKJv1rGC23
 PafwZfR1aCq3XSDPT250cO4+4jj1TgNA5YTWLS62jSHPirmJPDgwYUIAZS7Ly9pGue
 plHzAj+FPC7DQ==
Date: Mon, 10 Nov 2025 13:50:25 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH v3 2/2] backlight: aw99706: Add support for Awinic
 AW99706 backlight
Message-ID: <aRHtofMfaB1TI-LX@aspen.lan>
References: <20251109032240.3422503-1-caojunjie650@gmail.com>
 <20251109032240.3422503-3-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109032240.3422503-3-caojunjie650@gmail.com>
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

On Sun, Nov 09, 2025 at 11:22:40AM +0800, Junjie Cao wrote:
> Add support for Awinic AW99706 backlight, which can be found in
> tablet and notebook backlight, one case is the Lenovo Legion Y700
> Gen4. This driver refers to the official datasheets and android
> driver, they can be found in [1].
>
> [1] https://www.awinic.com/en/productDetail/AW99706QNR
>
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> Tested-by: Pengyu Luo <mitltlatltl@gmail.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
