Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A78A09F3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 09:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B50B10EF13;
	Thu, 11 Apr 2024 07:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="SSGXKu4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE83B10EFEB
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 07:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5+5LnM92E8OZOOReOchcrKgt2m7AJcZQIcLHyomng0U=; t=1712820942; x=1713425742; 
 b=SSGXKu4MFLgRIU6kNuvAdAu17La04+Vy/Vc0MNFgWawHn3LAaT/AzyDBFGGfp2f5faHTzCBk6ss
 /bTuEU1LvdlItLDBGcEsog5MzU8wgC3owMviR3kPae3lvacoLdYmJGl83yyTy9j9m1OVQKPKa1ECB
 0izAqvVRHUiYCiinuLXWklok+MR8Tr/GiaM/wAc8POFrxHjvf/X0i62/UiSS+wUeblsadDzOHwWNm
 3PdEE8EaUppMiQ5QvOFYZNuUAAS8z5JDB0G8Cx+Yteo5W/vg2Pi0IOd5ygo9GLTkQL1qsOzmNGfzD
 yzXQbEg3JB7W7XVyDg3/WPczNVg2okKZnO/g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.97) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1ruorB-00000002xuo-00YI; Thu, 11 Apr 2024 09:28:25 +0200
Received: from p5b13a9fd.dip0.t-ipconnect.de ([91.19.169.253]
 helo=[192.168.178.20]) by inpost2.zedat.fu-berlin.de (Exim 4.97)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1ruorA-00000002WWD-2R6L; Thu, 11 Apr 2024 09:28:24 +0200
Message-ID: <1a1704ce20b4749206df34dc04099154bf900501.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] fbdev/sh7760fb: allow modular build
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Sam
 Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org,  dri-devel@lists.freedesktop.org
Date: Thu, 11 Apr 2024 09:28:23 +0200
In-Reply-To: <c5436115-0b26-4369-8d71-154cc3c95659@infradead.org>
References: <20240210053938.30558-1-rdunlap@infradead.org>
 <4d01127a9130ce46b7c1d447811c89c1d1503199.camel@physik.fu-berlin.de>
 <c5436115-0b26-4369-8d71-154cc3c95659@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.169.253
X-ZEDAT-Hint: PO
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

Hi Randy,

On Tue, 2024-04-09 at 21:54 -0700, Randy Dunlap wrote:
> Will someone be merging this patch?

Shall I pick it up through my tree?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
