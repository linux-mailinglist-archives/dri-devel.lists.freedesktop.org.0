Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7185811050
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 12:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF48010E731;
	Wed, 13 Dec 2023 11:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C3610E731;
 Wed, 13 Dec 2023 11:39:54 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E4D8F40E0140; 
 Wed, 13 Dec 2023 11:39:52 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1XUgfF27Zh13; Wed, 13 Dec 2023 11:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1702467589; bh=SJ9D000oUxGHcSdtKN/FU2dMnMwR5Do1+n4O+7VfCGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f+8lb30ld/y2ZXfOcVrxOYsC2g6TNQhIsRt5wY7hxUj1rVaPVqLaRU833CDt7Y5o1
 tIW+ABOfPVVVnqLIdKyYicH7/aMvDtKp0zoZHgSLpEISW4LodLIr0UzrypWW2U+J8z
 b34PfdZFeNZlTZEMF//IGDNf/JKByn8v3dFE61OgayxcFf3R/ERAUIm70eHVKT2R/3
 0a5MUo50KB11kYe1dEet0QRdVn6eYCJW/yTY3YYDigcio6GABCKBvU5YDOLSG37bI0
 KNkEjyLFXDP2O54WzE2e4B7rFb8yqwIlfGBcO25UwmhX5Z36sS9KclRQTm/uXLsaxI
 0H0vSI6xuTgLYNAJgwBvZELycoCW7FWsJCny3WqjYCH3wIjuqwOdzI7n0tDTCpf0Rs
 nBnSWlvv6Laf8I6xL/NVQPNdr+su3tbKEWHNG3jwWfQkdlRoFqBOVP+EtBZGR8zPYP
 Ykiw1PA0V+35ZAPg4F/hp2HuBVV9nOcvJ7CREFZueobKYLQG3ga4TM0N1G1tL3Zu0p
 HmaPLMkb+WLsKxuEK6bwdUrys19Q3ipxr4SLi6tuSyTQhO7+paVMxvyGGgBsAaxr26
 OgnyPYQuNLGRdw3mQvvdG/dZ4UVnGwQfIScRuPX+KcynbxKjuPoID7gjXTUJkZbxtk
 L9wmAxte9HeodXPxAf9Zlegs=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 858AD40E00CB;
 Wed, 13 Dec 2023 11:39:41 +0000 (UTC)
Date: Wed, 13 Dec 2023 12:39:36 +0100
From: Borislav Petkov <bp@alien8.de>
To: Paul Dufresne <dufresnep@zoho.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <me@dakr.org>
Subject: Re: nouveau 0000:01:00.0: drm_WARN_ON(!found_head)
Message-ID: <20231213113936.GBZXmX+MKqX/qOnPn1@fat_crate.local>
References: <20231111120323.GAZU9tiw8e0RSzCGB9@fat_crate.local>
 <20231212224037.GAZXjhZUDeoq50xKJ5@fat_crate.local>
 <18c613ec092.ae61cf7d6029.4389632938517239705@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <18c613ec092.ae61cf7d6029.4389632938517239705@zoho.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 10:35:51PM -0500, Paul Dufresne wrote:
> https://gitlab.freedesktop.org/drm/nouveau/-/issues/282

Let's add more folks who were involved in

1b477f42285e ("drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state")

Apparently, someone wants to know that the loop over the crtcs in
nv50_display_read_hw_or_state() didn't find a head.

Holler if you need me to run a debug patch to figure out why.

We're getting close to releasing so I guess we either debug this or shut
up the WARN.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
