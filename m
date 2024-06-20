Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6C9910EE7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 19:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8F110EB9A;
	Thu, 20 Jun 2024 17:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MFa63tUW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939E910EB9A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 17:36:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C7241CE2646;
 Thu, 20 Jun 2024 17:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A07C2BD10;
 Thu, 20 Jun 2024 17:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718905007;
 bh=dPCprZAMLvbfsHJ5R8XAFEw9v43XDOOJojCX40mGVnc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MFa63tUWCVu0pDbyk2NXiXn5zn1JhYShXoY6YSQzWZlfl56HZfdpnG+AFrFgh9DGA
 IY2BrodcPgx4ljsBp95RA1mafgtH705lcRNulA338eoojNV4HjhbYt7VYC1U8Ab4EM
 di51NC0ohtW6h0YjF/N5RL8hclCGtlXVAjyr8QTJnOeelQOHWL8U2C963DDLJ1uu4Y
 ggtGcsqngfG5T+RDRNeBb7jfRwaRPonheqSHxOut639N5IzXZy5E7gc2W3i25qCwQK
 f6KkelyXnl/3qyEXbHpwLqbr17hNUhMDZOE0o7olSzq0f35cySq3BW8EMOvKJIbDXr
 9LDnC0d5aWuWg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Helge Deller <deller@gmx.de>, Jianhua Lu <lujianhua000@gmail.com>, 
 Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
In-Reply-To: <20240619193558.2543645-2-u.kleine-koenig@baylibre.com>
References: <20240619193558.2543645-2-u.kleine-koenig@baylibre.com>
Subject: Re: (subset) [PATCH] backlight: Drop explicit initialization of
 struct i2c_device_id::driver_data to 0
Message-Id: <171890500507.1324703.5444947342099416550.b4-ty@kernel.org>
Date: Thu, 20 Jun 2024 18:36:45 +0100
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

On Wed, 19 Jun 2024 21:35:57 +0200, Uwe Kleine-König wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> [...]

Applied, thanks!

[1/1] backlight: Drop explicit initialization of struct i2c_device_id::driver_data to 0
      commit: bfd3587760498227510acc1b18c4299c7922ffe3

--
Lee Jones [李琼斯]

