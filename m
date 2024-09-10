Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578509735E8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 13:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D10C10E790;
	Tue, 10 Sep 2024 11:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="h1euPbz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D86C10E790
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 11:07:08 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8128C40E0285; 
 Tue, 10 Sep 2024 11:07:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qrGWVqrTr6ZO; Tue, 10 Sep 2024 11:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1725966422; bh=q7/7i/hleCHmeIelV+J/jkKAUyMAdVAI7TwF0D/iof4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h1euPbz/eINJg26bo1VdAuCGL3YtT4WXke/s/QTbdUBNuaw4tN4CZ2Tmwg7p4jGrx
 XOrZ1Xbpw3qhbn77G5Igcv5fYT+S+6uiE5sTP8nx+qOoSK22Y9s1QGQhszVhQTlqvZ
 XeWOGIsqIMyMmgKYujxQO/9aerou17O6fY6rmGm6fQEm81kDLJ8ub8rUWE/lR8tYiu
 qsuFZQ4h4iVZKFTgoPnTnYfPQQajXawwBusQNj+z9DEprwXor4oNiT5trlmEzjVqXO
 AJfJQu5usxw27FxDDFy2XRTRQSfguyIOC3VK+g1jkrGnKkvo3mud8NlPuLkkutJ6yN
 H183fcPIn54bti3UYfOsqDvQXv21LJsuvhtySTvjhXO/vCc6T9ypjtTf79gjYbvea4
 WN41/pCIA+Sutaigak2gTF7//QjGVuP8D35AuD2TyJ83/la7RGt1MhawAV7paR2f6Z
 wlYaCF8+xUWqsXEKTcJ6+e9Dxae+rMN79LkY17PpWBCZG9TjqdXa5LeRLsLqobHXYQ
 S/DZjwPJsC/1cLTT9SQ3CGgqs45SE7Gd/c4KKJhibWXGjCd4MJL17ovU5O0pj6nzs1
 GXilzgnSdSObcBPWsf2F5ugfx+owoNuu6uxoj8iQfRgKyEU1rdJHfArG4Y1zDxFeJQ
 rllAmw1rHXWh9frbC1OqTDQo=
Received: from zn.tnic (p5de8e8eb.dip0.t-ipconnect.de [93.232.232.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C421740E0081;
 Tue, 10 Sep 2024 11:06:47 +0000 (UTC)
Date: Tue, 10 Sep 2024 13:06:42 +0200
From: Borislav Petkov <bp@alien8.de>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: dw_mipi_dsi-stm.c:(.text+0x8db9a3): undefined reference to
 `clk_hw_unregister'
Message-ID: <20240910110642.GAZuAoQnZqcr98x5en@fat_crate.local>
References: <20240905081902.GAZtlpdlQp5XOm5XtO@fat_crate.local>
 <544a633e-de53-493d-9c29-de8ff52630da@foss.st.com>
 <20240909084506.GBZt61kqqGVUTqjKc4@fat_crate.local>
 <0e9018d0-c49f-4dac-aa0f-b05504f9c6f6@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0e9018d0-c49f-4dac-aa0f-b05504f9c6f6@foss.st.com>
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

On Tue, Sep 10, 2024 at 12:48:49PM +0200, Raphael Gallais-Pou wrote:
> Unless I am mistaken, the link you provided refers to a PowerPC linker error:

Ah, the kernel test robot is doing other architectures now too, sorry about
that. In any case, I am triggering it on x86 too.

> What do you mean by 'sending it to Linus' ? If you meant to do a pull request,
> then no. This patch is already in the drm-misc tree, which means it will keep
> its usual pace of merging with the rest of the drm-misc tree.

That's ok - I'll simply disable CONFIG_DRM_STM from building in my randconfigs
for the time being.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
