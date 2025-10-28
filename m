Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A475C14990
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8195610E5C5;
	Tue, 28 Oct 2025 12:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="teYCzjcf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DC810E5D8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:21:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 96B1845B00;
 Tue, 28 Oct 2025 12:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF51FC4CEE7;
 Tue, 28 Oct 2025 12:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761654102;
 bh=F1yAdiDYrdDLxP84lx9QVn1zjhW7IesRkHoYslG/PWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=teYCzjcfSbq7gGRP9JKtgbbIrz+JLL0d46u9j4/vG1Jl8xpbWEhrQABLG3sglqPc4
 vNDqlSSF1jqXTxFzGisZfrvlYaZ3ndmy0rEp6IBji/d3oNGH5vf1Vl75MSeMt9AL7c
 2CqKfGc8NUYf7ciwr0rbURBp6MKAUTh/dMA19tl+cTy4Wk9M4yamnIJFzkCK13QzsH
 Dgt3AXt6GWtcO9bsWv9fihYCCtI//sz8qGgfX51khITJOreLYL9FKK0ERFqpFG2SCw
 ELm2cf0pSirBNiCAYyX9kCICzk+peIIw3glPoSsqGQe45BbnQy/m0AYwn51K3WFP1I
 sDe51zom4b+VQ==
Date: Tue, 28 Oct 2025 12:22:32 +0000
From: Daniel Thompson <danielt@kernel.org>
To: duje.mihanovic@skole.hr
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: ktd2801: depend on GPIOLIB
Message-ID: <aQC1iJlm2jS479_0@aspen.lan>
References: <20250411-ktd-fix-v1-1-e7425d273268@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250411-ktd-fix-v1-1-e7425d273268@skole.hr>
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

On Fri, Apr 11, 2025 at 07:22:18PM +0200, Duje Mihanović via B4 Relay wrote:
> From: Duje Mihanović <duje.mihanovic@skole.hr>
>
> The ExpressWire library used by the driver depends on GPIOLIB, and by
> extension the driver does as well. This is not reflected in the driver's
> Kconfig entry, potentially causing Kconfig warnings. Fix this by adding
> the dependency.
>
> Link: https://lore.kernel.org/all/5cf231e1-0bba-4595-9441-46acc5255512@infradead.org
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
