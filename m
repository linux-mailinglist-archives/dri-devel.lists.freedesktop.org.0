Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BE1861669
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 16:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D80D10EC4C;
	Fri, 23 Feb 2024 15:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r1XxEo3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F7010EC4C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 15:54:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D6C28CE2A54;
 Fri, 23 Feb 2024 15:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C903CC433F1;
 Fri, 23 Feb 2024 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708703655;
 bh=ZmMfeIezk17nGjdTO/Z3REthdAgXIK1fQj7QC6r47z8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=r1XxEo3oy+d1t8vPKLoJbxuutY7k+6GhiI6iLMURCdwm2J55wvZpF8FXctsqgJf/X
 PszC5HMV2RJ317DTqkdG9Ue1WYTFAF4X5/J3wTjfXMsd5tSY62MQwcAmP0gjIJ+6MJ
 9oVTbOK25gsNcUomFTY4uk6iJ9MB9G3OLLPW5YjY+LgDWq1SMDm7be9ZLVf4dhYRDq
 YTlrtexsTn5gNviFB+Q6Jv0wz5kYSXFS6bIfUccvx/3hdP1xqNZ3PXSD3ANbkA+cqO
 WnFnUUMhm4n8SovhIje73o1m+Ko2Zmb/58vE0s5/byZEoODyRG3EOFzGT5sebBKdgm
 a/ao45y3QGakQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Flavio Suligoi <f.suligoi@asem.it>, Hans de Goede <hdegoede@redhat.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Helge Deller <deller@gmx.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Karel Balej <balejk@matfyz.cz>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20240216-expresswire-deps-v2-0-8be59c4a75f5@skole.hr>
References: <20240216-expresswire-deps-v2-0-8be59c4a75f5@skole.hr>
Subject: Re: [PATCH v2 0/2] leds: expresswire: Fix dependencies
Message-Id: <170870365155.1722159.6291358322517617428.b4-ty@kernel.org>
Date: Fri, 23 Feb 2024 15:54:11 +0000
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

On Fri, 16 Feb 2024 22:15:42 +0100, Duje Mihanović wrote:
> LEDS_EXPRESSWIRE does not depend on NEW_LEDS in practice but still does
> in Kconfig. Fix up its Kconfig entry to reflect this and fix a Kconfig
> warning.
> 
> 

Applied, thanks!

[1/2] Revert "leds: Only descend into leds directory when CONFIG_NEW_LEDS is set"
      commit: 7a28f9cf6b7c8cad760b4d4ee7f53231cd76d8e4
[2/2] leds: expresswire: don't depend on NEW_LEDS
      commit: 8cd0da0634222ceb434281f3034ad773ddfe0f4f

--
Lee Jones [李琼斯]

