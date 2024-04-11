Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528DB8A09F0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 09:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AD210EEED;
	Thu, 11 Apr 2024 07:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="fS8fYhAP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 415 seconds by postgrey-1.36 at gabe;
 Thu, 11 Apr 2024 07:35:27 UTC
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4ED910EEED
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 07:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QPDpZoE/tjUUBV8p6vi4T9AN0aehyjX15I4+zRojGDo=; t=1712820927; x=1713425727; 
 b=fS8fYhAPioeO+DZDf3ked5Is5Bd7c0XY3PCnsW7kmsc3wRiIpevoSxBcUpimG84LBZ2YoKvtlM0
 D82futGcI0nAWUlI53YU3sbMRcA5QF81MO3HNy2md/nZA/IkLdYuPIVYFKC+0O0HdK9If15efqV0v
 uLk7pquI0OfrPtIwBp2aoh4cUI1HrQ94QPUwcoLajzlppi4I3/nKqui8v8b3F+5zgAd3H4DVoY2G9
 tExuVWQs37sqGoynigDmhR9CM6bOW6ETCcbTJNNce3m9TT3iOhaGjT3WgBVKfxaJZ2SllbG0+aFi9
 /O/WVaxTX8Xx8Z6wnlzHVRSCMNOcbL+sEWew==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.97) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1ruout-00000002zUf-32Mw; Thu, 11 Apr 2024 09:32:15 +0200
Received: from p5b13a9fd.dip0.t-ipconnect.de ([91.19.169.253]
 helo=[192.168.178.20]) by inpost2.zedat.fu-berlin.de (Exim 4.97)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1ruout-00000002XFi-27xs; Thu, 11 Apr 2024 09:32:15 +0200
Message-ID: <404299f95cf50003eeee5d6598bd484117fe5378.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] fbdev/sh7760fb: allow modular build
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, 
 linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Sam
 Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Date: Thu, 11 Apr 2024 09:32:14 +0200
In-Reply-To: <5191337e-9ffc-44b7-9700-eb5f1f2fc4cc@gmx.de>
References: <20240210053938.30558-1-rdunlap@infradead.org>
 <4d01127a9130ce46b7c1d447811c89c1d1503199.camel@physik.fu-berlin.de>
 <c5436115-0b26-4369-8d71-154cc3c95659@infradead.org>
 <5191337e-9ffc-44b7-9700-eb5f1f2fc4cc@gmx.de>
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

On Wed, 2024-04-10 at 15:17 +0200, Helge Deller wrote:
> On 4/10/24 06:54, Randy Dunlap wrote:
> > Hi,
> >=20
> > Will someone be merging this patch?
>=20
> I've just added it to the fbdev git tree.

Ah, good. Then I can drop it from my queue again.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
