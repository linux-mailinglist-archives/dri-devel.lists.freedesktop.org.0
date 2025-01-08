Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77817A05864
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 11:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B787610E857;
	Wed,  8 Jan 2025 10:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oNKj1/hk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A89B10E854
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 10:41:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AD900A40AC4;
 Wed,  8 Jan 2025 10:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDD8C4CEDF;
 Wed,  8 Jan 2025 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736332917;
 bh=WmfS8WCoNt6jj/+YKKOpy0JjmbTDxj2kikSVgcXZn2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oNKj1/hk9puW7qlcHbCto0eDlorfwprV9zhNVsGDWEridQUVIxw03u11XmjQkjF/9
 cAZh+Vf9lGdvLZhENGP6Mbdx3XyqcnjiHlPsMTW9s9mHxvLskvxCfa2O5dtigC1Xt1
 xqi1ZEobsb1YaECz9qBBVHAmm3FO2uAGlt9NIeJJ/UmTgVpbd8GExSHX4Pk9hprv/Z
 UmjF+3VtydjXWeLCPC3kip1WmuVJ5v4f1SnXn9mW0IYHueiDumdVfNVfTGvGv69cPl
 0Ok2NSK29wlK9CepBu/6wT9EqtO2purXCLygLGvNS5rNLhxUptfYBONw/R+FgU3/Ko
 mp9whUKAxCWWg==
Date: Wed, 8 Jan 2025 10:41:50 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 Apple DWI backlight
Message-ID: <Z35Wbs3-VrQZu846@aspen.lan>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-2-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211113512.19009-2-towinchenmi@gmail.com>
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

On Wed, Dec 11, 2024 at 07:34:37PM +0800, Nick Chan wrote:
> Add backlight controllers attached via Apple DWI 2-wire interface.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
