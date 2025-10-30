Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465ABC1FDF9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 12:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBF710E960;
	Thu, 30 Oct 2025 11:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nd+CpjmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082F910E960
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 11:47:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 264F4601FF;
 Thu, 30 Oct 2025 11:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A38C4CEF1;
 Thu, 30 Oct 2025 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761824832;
 bh=NPtLpyBMJ6lKixCBeff+DHHfeoHFoRb6MzwjeRD2Ve0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nd+CpjmIm1eD9VFr3DBUOApbeBPryyS/Ln6Ax9h++X2ggQEyzzm6rOGtd/DiE5qta
 fZdmPq8ZlAEZEoi6igQPRabzrZlorPu01Fl7wJgdagnTgBo1nLbentCtqDBCcNLXKH
 K9+malVlfl1ORI9PR3O2jaeBtk5lH+5XgvwHhFQL5pqMwdf4xOxGPrx+k4vHmF2xh8
 +yWNbN7GwctOWz9vWzdrZHU9mE/oyctg2TV/lwaKtMoAKcIVK5pz/M+5ySTSUQBiEa
 gv401J7j87BqQQPIRPO3leh259+IttAWZUnkCSbPd6nt6/7LZoK+MpCOhVS01oBtSY
 hA6Sg5YAvILqg==
Date: Thu, 30 Oct 2025 11:48:15 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/2] backlight: ktd2801: Depend on GPIOLIB
Message-ID: <aQNQf33cUcvo0HvR@aspen.lan>
References: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
 <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>
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

On Tue, Jul 29, 2025 at 07:18:30PM +0200, Duje Mihanović wrote:
> The LEDS_EXPRESSWIRE library used by the driver requires GPIOLIB. Make
> sure this dependency is not left unsatisfied.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/b6c481bb-e854-405e-a428-90301789fe20@infradead.org/
> Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
