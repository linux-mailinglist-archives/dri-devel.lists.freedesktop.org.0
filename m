Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAFFA098F4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 18:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4122E10E50C;
	Fri, 10 Jan 2025 17:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="F2KAB2pX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F146F10E50C;
 Fri, 10 Jan 2025 17:53:12 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5CA4140E0277; 
 Fri, 10 Jan 2025 17:53:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UgdFvW0kh09k; Fri, 10 Jan 2025 17:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1736531587; bh=hWQNssuWD66YKuLujLHgbp4MStYpf0nY+KZT+LDratA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F2KAB2pXegz//kxjxJ7Ddy0mVXHvSd3Z8jqm8luMh60AZiQKOq15d7sxfSGHUvlKo
 mse7Q09Uw09qDr/v0aA7/ZYUEK4MXP2QNj7KOqS4MaJmRbtT+qNeJIG8XHyGonFL7s
 Aifuq30U0cZWWagtBYlw3jpb5C35JOM93N3LerPNusF2eti+7dUlOmuEyzR5iLnsEr
 3SdEnZn13eorX+YbLrbVl3OMZJULAO+6cWFSBL4mRc70ajmqavTX6xMOdU+y8MISI7
 YAezNaiLs3GJ33qNN/D67PY+u8DzPlDImbAQUbw+iRvcn85MaXqBMO2Au+5zpU+6iB
 zr/foFa2/keLQr2wx031C3xQ4ttLWnPw0L7WzVl+za+S9s5YzTxy1JS141fwTJ1ZNb
 1F1k7+qIX73Fg4OxXYFYwvLqN8tKdzuvILuR/DrvZ/pvSI6d5oqxtZGuS6LIfXOGpd
 HyBbWaMStOUaCz3yM5wDD8bPtIJlv/HKY64KKPuBVVkNbvB3UDNms827c7NKICcAoy
 tgKbepsmqpLkjy1wa/XZbHGYcQ64fEUS+om3eZSngcRsdIzopAYG51kqBMAtXITRhn
 KfeVFh/zy3fPU5gvVMKtQU92I7EzbXpZZSBV/QMszPM2EQvUTyVvm6/dKN4Hndcl3K
 aAT4CkQ6B9XS2ScrypgiafpY=
Received: from zn.tnic (p200300ea971f9337329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:971f:9337:329c:23ff:fea6:a903])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 29FF140E02C1;
 Fri, 10 Jan 2025 17:53:00 +0000 (UTC)
Date: Fri, 10 Jan 2025 18:52:52 +0100
From: Borislav Petkov <bp@alien8.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: kmemleak: Found object by alias at 0xffff888107b65918
Message-ID: <20250110175252.GBZ4FedNKqmBRaY4T3@fat_crate.local>
References: <20250109201740.GEZ4Au5ESOtQd4o1R3@fat_crate.local>
 <CADnq5_OfmegA2XzeCuUNq5PmvbQrX6cdn8vPOUMf4x4BQGb5fQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADnq5_OfmegA2XzeCuUNq5PmvbQrX6cdn8vPOUMf4x4BQGb5fQ@mail.gmail.com>
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

On Thu, Jan 09, 2025 at 03:40:59PM -0500, Alex Deucher wrote:
> Possibly fixed by this patch?
> https://lore.kernel.org/lkml/CAJZ5v0i=ap+w4QZ8f2DsaHY6D=XUEuSNjyQ-2_=DGOLfZjdn+w@mail.gmail.com/T/

Yap, it does.

You can add

Reported-by: Borislav Petkov (AMD) <bp@alien8.de>
Tested-by: Borislav Petkov (AMD) <bp@alien8.de>

if you want to.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
