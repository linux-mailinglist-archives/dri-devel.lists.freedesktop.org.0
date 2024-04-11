Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62508A1331
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 13:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE0610F01D;
	Thu, 11 Apr 2024 11:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ri+HxRUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6EB10EF60
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 11:39:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6933E61D29;
 Thu, 11 Apr 2024 11:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629A0C43390;
 Thu, 11 Apr 2024 11:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712835584;
 bh=X9vV5K79v2Fsvok6tE2lAzLxQa6MEqPuFqe5Gd+2Kr4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ri+HxRUr5vyTIfa0Unyvmv2zEC8qGF5cLrMibV08si52f6ZHji6gEMu5rgiw81Pfx
 mD+rI6qNqEnXZmcc1JOmYqOc0IaJKv/fgnjxRYFJcYIN2TOG8sD1HzOR7x0ucW+lSP
 1+w6CGAigsZGgZuobueP/ZQevDlDGhsZndaKji8yEshG3Dt8CApShNHq9NivFpzoYO
 9i+yytz0HEWGm+262QBJIxr3/7zPtJXkTer7+LjhVDr369FrB9EKQkr5Ke/Hw/bePW
 id7vDgr4xIrsdYM+bdxJzZ9wcodWF7pzHbjzpewhl3j8Jgqa9P4pG8pfiwRaHrTxTI
 DW2Lb2kUsIufw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 kernel@pengutronix.de, linux-pwm@vger.kernel.org
In-Reply-To: <20240314113529.923708-2-u.kleine-koenig@pengutronix.de>
References: <20240314113529.923708-2-u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH v2] backlight: lp8788: Drop support for
 platform data
Message-Id: <171283558214.2316283.6027739768348217475.b4-ty@kernel.org>
Date: Thu, 11 Apr 2024 12:39:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
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

On Thu, 14 Mar 2024 12:35:28 +0100, Uwe Kleine-König wrote:
> The backlight driver supports getting passed platform data. However this
> isn't used. This allows to remove quite some dead code from the driver
> because bl->pdata is always NULL, and so bl->mode is always
> LP8788_BL_REGISTER_ONLY.
> 
> 

Applied, thanks!

[1/1] backlight: lp8788: Drop support for platform data
      commit: 150476e60a80ebb93d49aae7b636934eb04b83d2

--
Lee Jones [李琼斯]

