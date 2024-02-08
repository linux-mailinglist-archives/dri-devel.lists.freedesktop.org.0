Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F86284DEB2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 11:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3197810E5CD;
	Thu,  8 Feb 2024 10:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A6h59rw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47CC10E5F0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 10:52:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 485B361BC8;
 Thu,  8 Feb 2024 10:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E7BC433F1;
 Thu,  8 Feb 2024 10:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707389561;
 bh=NjNSfhEcjSG5tAQPM6gOvRlfxb1YnyNXjNsO7vePUMw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=A6h59rw2GM1lbtLDFzDaniCuHjjsEJxV4Ht+EAzuikpOsRmtVAKvLlrl3PbIn4QU5
 t8itmryf0ubsnAsFVCb9MjM8wXRbTs64hEioQK/lPekWsa6pGr30a4x5DibrzWFlU6
 n7786l7U9cVi59/mfJ7OoDChtBq1GbMQHuiWwwjbCdslq+pDmcNj5huSmtQ6VqzPDj
 0Qeo+6eVXj3puhbFa0KTYWnd3ntngeil/eB2KfwQ8W+DjBgAvUsthWYleMe/3LH3g/
 T2SKiarEDBiG081/fbWAeCKO8JKgkV+AD7PONePtyS98MPX9TBNc4jNWsPQC5J0rsf
 BDuXznCWOIYkA==
From: Lee Jones <lee@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
In-Reply-To: <20240201144951.294215-1-andriy.shevchenko@linux.intel.com>
References: <20240201144951.294215-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/4] backlight: hx8357: Clean up and make OF-independent
Message-Id: <170738956012.925871.18016345920241211144.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 10:52:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
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

On Thu, 01 Feb 2024 16:47:41 +0200, Andy Shevchenko wrote:
> A few ad-hoc cleanups and one patch to make driver OF-independent.
> 
> Chagelog v2:
> - renamed init to init_fn and typedef accordingly (Daniel)
> - added tags (Daniel, Javier)
> 
> Andy Shevchenko (4):
>   backlight: hx8357: Make use of device properties
>   backlight: hx8357: Move OF table closer to its consumer
>   backlight: hx8357: Make use of dev_err_probe()
>   backlight: hx8357: Utilise temporary variable for struct device
> 
> [...]

Applied, thanks!

[1/4] backlight: hx8357: Make use of device properties
      commit: d965a5ee7c95ce9414259181cbdccb1d2f1c1247
[2/4] backlight: hx8357: Move OF table closer to its consumer
      commit: 3d226ecdfd83c0d89c1d4a430706e8228022685d
[3/4] backlight: hx8357: Make use of dev_err_probe()
      commit: f0ed1589885ae933e2b2f9c63e16f5be3fb0324d
[4/4] backlight: hx8357: Utilise temporary variable for struct device
      commit: 27a4701c92250ae0aecb2edea1109f89cf344ba1

--
Lee Jones [李琼斯]

