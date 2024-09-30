Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466C398A2EA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9676010E412;
	Mon, 30 Sep 2024 12:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P9+ONkiv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868C010E412
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 12:39:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 50124A41AEB;
 Mon, 30 Sep 2024 12:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DCEC4CEC7;
 Mon, 30 Sep 2024 12:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727699995;
 bh=kAVtAOO6pbXEe0U9LbI4ZPQxLHXljXirrFbrLGE2m5k=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=P9+ONkivtD4dtqN54aIMYRcRA9Xf15l641k5jcXr3M2qGlqAOVtG0e7WFssGMFBwk
 GUXRgBcM3WGTHDZos1HTRPeiIA/KCdAGz7aN3Je6T/p76IsUUHx7zIgporr5hf+NVL
 6LvaCQYTDX/Y4CK4peCGyaqAfKSyioBSsxhTCsStUZuHtY9cXbYhVCsFkewpVdGKf5
 j/SlFljXYLYK+g3fNgQGcRIpJ/y9IWuIiVySatEvK81oEZfUDREDC3phBvoB97PgRt
 AR68ol9VjydHDuijK9o4IFFmU6mXIUvdSKffsif4XPTXrJ6DnVjMpsXuW9Gi6hwKyK
 LJqKmhChCj/HA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
 deller@gmx.de, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240822062546.3490076-1-ruanjinjie@huawei.com>
References: <20240822062546.3490076-1-ruanjinjie@huawei.com>
Subject: Re: (subset) [PATCH -next] backlight: 88pm860x_bl: Simplify with
 scoped for each OF child loop
Message-Id: <172769999349.449795.6539745050608375081.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 13:39:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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

On Thu, 22 Aug 2024 14:25:46 +0800, Jinjie Ruan wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
> 
> 

Applied, thanks!

[1/1] backlight: 88pm860x_bl: Simplify with scoped for each OF child loop
      commit: 3db60398b4c10425dd32c076280af7f334431064

--
Lee Jones [李琼斯]

