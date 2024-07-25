Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A13DB93BD38
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 09:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E9D8922E;
	Thu, 25 Jul 2024 07:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MDV5N8hE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F85F8922E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 07:39:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 86D63CE0F9E;
 Thu, 25 Jul 2024 07:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4845FC116B1;
 Thu, 25 Jul 2024 07:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721893182;
 bh=rZbqeLmUbzXJmgBM3m+8k4Y0LrMSil6mRCOoJlqsPPo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MDV5N8hEtCO8v1cR/SlO+GLIF1XKIo80Hj9vJHi28c8i96PMInGdR+xCPn3L80MJJ
 jASqv7keBWlUtODBJdo+WLJJlx1HL1zZH+MQkrcERdKZEzpFrbIi84gCAbeyAa+SH5
 0rpFvT1ZlglEFpRHMB1Lm64310Pmwq0UWuJ9aJmtqpDis4mio31l0LJ1CgR2YZFG65
 Q/u5KWjU4QD1AC1o21TvSeHGdP+AYphlfrwRSBsdLTBWnBRMeSmYmP0etem7jx43aG
 O6uardvjUyLp7IEUUIJHWPZedxwtA54+FTi34w/tIg0yPzO5Y0bxfHAzIN7cc8xnnq
 MRrOwk8p+f4Kw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
 deller@gmx.de, Chen Ni <nichen@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240705092800.3221159-1-nichen@iscas.ac.cn>
References: <20240705092800.3221159-1-nichen@iscas.ac.cn>
Subject: Re: (subset) [PATCH v2] backlight: l4f00242t03: Add check for
 spi_setup
Message-Id: <172189318103.830301.4585902101500100253.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 08:39:41 +0100
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

On Fri, 05 Jul 2024 17:28:00 +0800, Chen Ni wrote:
> Add check for the return value of spi_setup() and return the error
> if it fails in order to catch the error.
> 
> 

Applied, thanks!

[1/1] backlight: l4f00242t03: Add check for spi_setup
      commit: cec01c3b62f11efabc8c92f91472575651c593a9

--
Lee Jones [李琼斯]

