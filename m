Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77975CAFAEE
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 11:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A5610E502;
	Tue,  9 Dec 2025 10:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="HO0IY+aP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 320 seconds by postgrey-1.36 at gabe;
 Tue, 09 Dec 2025 10:50:46 UTC
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADC210E502
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 10:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
 Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=V43iKeuXkWEbsOTGyK/7fvOM7cegPuuBRLGvWn7Si9k=; t=1765277446;
 x=1765882246; b=HO0IY+aPY/V5gYzzwCahtME7vZYyyNuK6VJznhIgyfcGy1KCc0Eb8qaa4cPyN
 GECJJtxyfkoCTNnbrScaUntWBHhKKS8SAI3EYKDWmZ4Zl8YzFhJd6ZXXxVK25kxmzS32WhRB+YDZZ
 oSYTCNJ4b2UEp54GWKgeb2rVczFK6iIvPHzgr5RgwnuvvgLzvOIMIzX3uZWUbNYJ6QSHvnU7h6JmF
 Knt/79oziO2fnNFq7E+i7ujLYOmcxrsKmUT44CYP5N6ITG3aRGczblX4nFsAhnXtNp0+M5eASNbEK
 VbGakMay1ImPY1nqEgZiZKmfuFFDX2nVCfCnUu1YthqrT32NPA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.99) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vSvDW-00000000kdw-08Hs; Tue, 09 Dec 2025 11:45:14 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41]
 helo=[192.168.178.61]) by inpost2.zedat.fu-berlin.de (Exim 4.99)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1vSvDV-00000000qRg-3H26; Tue, 09 Dec 2025 11:45:13 +0100
Message-ID: <2189d38d368b1b580ee440d1d406bfcd3631213f.camel@physik.fu-berlin.de>
Subject: Re: Kconfig dangling references (BZ 216748)
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Rob Landley <rob@landley.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, andrew.jones@linux.dev, Alexander
 Shishkin	 <alexander.shishkin@linux.intel.com>,
 "dri-devel@lists.freedesktop.org"	 <dri-devel@lists.freedesktop.org>, Paul
 Kocialkowski <paulk@sys-base.io>, 	chrome-platform@lists.linux.dev, Paul
 Cercueil <paul@crapouillou.net>, 	linux-stm32@st-md-mailman.stormreply.com,
 Srinivas Kandagatla <srini@kernel.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>, Matti Vaittinen <mazziesaccount@gmail.com>,
 Jonathan Cameron	 <jic23@kernel.org>, Vaibhav Hiremath
 <hvaibhav.linux@gmail.com>, 	linux-sh@vger.kernel.org, Max Filippov
 <jcmvbkbc@gmail.com>
Date: Tue, 09 Dec 2025 11:45:12 +0100
In-Reply-To: <f10e135e-14c5-4bc0-8100-1712be3796dd@landley.net>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <f10e135e-14c5-4bc0-8100-1712be3796dd@landley.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.197.95.41
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

Hi,

On Mon, 2025-12-08 at 16:20 -0600, Rob Landley wrote:
> On 12/7/25 20:04, Randy Dunlap wrote:
> > USB_OHCI_SH ---
> > arch/sh/Kconfig:334:	select USB_OHCI_SH if USB_OHCI_HCD
> > arch/sh/Kconfig:344:	select USB_OHCI_SH if USB_OHCI_HCD
> > arch/sh/Kconfig:429:	select USB_OHCI_SH if USB_OHCI_HCD
> > arch/sh/Kconfig:455:	select USB_OHCI_SH if USB_OHCI_HCD
> > arch/sh/configs/sh7757lcr_defconfig:61:CONFIG_USB_OHCI_SH=3Dy
> Commit 231a72e03af6 removed the only user of CONFIG_USB_OHCI_SH (an=20
> #ifdef in drivers/usb/host/ohci-hcd.c), commit f6723b569a67 missed it=20
> cleaning up, then commit 4f6dfc2136fb special case removed the symbol=20
> but not references to it.
>=20
> It can go.

I will take care of this. If someone wants to help, please feel free to
post a patch to the linux-sh mailing list and I will then review it and
pick it up from there into my sh-linux tree.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
