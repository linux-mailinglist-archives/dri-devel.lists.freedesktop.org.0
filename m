Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3612586149B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 15:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0327810EC38;
	Fri, 23 Feb 2024 14:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iTvL5YBJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F7410EC3C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 14:50:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4B5563524;
 Fri, 23 Feb 2024 14:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0A9C433F1;
 Fri, 23 Feb 2024 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708699830;
 bh=uTDFI3qXOS3f4GpeIF/0ruRqhLbU5D7lTlLgmM2NO8Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iTvL5YBJSskBOLBGMDEhZ7s7Pf4O0ymZO6zF9fbdIw2+1L2vU31g94wp3QbyS4EFN
 xabHX4yt8L/M8rMef6156JtTh1SLGUXN7wqblmmHLo1o4qLos20Lo72WOrQIqET+VE
 7l2jGYbq0cvJGTceZbuvwhXin9jfVaEhju0d2B3zvDFCwg0qZAZd/rrSdyTzxqzNxq
 VY1ZtN5Df83RZeb2wBKNmzgboZdAG3ySD+FwHT11TxSPz/xx3psIs4kd4wEBdvkS/a
 TvaZ+v6ao78nwp1ocYINZztYgwdfMwolRS/DhS1ilaeCjeR+FXgeA0XXiAfKG9WANU
 q1zbYllLWpUzA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Karel Balej <balejk@matfyz.cz>, Linus Walleij <linus.walleij@linaro.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20240210-ktd2801-static-v1-1-90ad2e2e8483@skole.hr>
References: <20240210-ktd2801-static-v1-1-90ad2e2e8483@skole.hr>
Subject: Re: (subset) [PATCH] backlight: ktd2801: make timing struct static
Message-Id: <170869982803.1679597.4693204509792498409.b4-ty@kernel.org>
Date: Fri, 23 Feb 2024 14:50:28 +0000
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

On Sat, 10 Feb 2024 17:16:17 +0100, Duje Mihanović wrote:
> The struct containing the KTD2801 timing can be made static as it's not
> referenced outside the KTD2801 driver. Do this to prevent sparse
> complaints.
> 
> 

Applied, thanks!

[1/1] backlight: ktd2801: make timing struct static
      commit: ed2ac75acf99d33444a5d440fcad4261ad6f0d5c

--
Lee Jones [李琼斯]

