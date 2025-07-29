Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C3CB14C42
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 12:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC58210E60F;
	Tue, 29 Jul 2025 10:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b="sNATE1mm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 913 seconds by postgrey-1.36 at gabe;
 Tue, 29 Jul 2025 09:35:08 UTC
Received: from mx.olsak.net (mx.olsak.net [37.205.8.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF43310E021
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 09:35:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=0FX94LO7FBG853z0deALFB9wglwXmVAtfiI/k+zwf+c=; 
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1753780697; v=1; x=1754212697;
 b=sNATE1mmnB27c7gYFPLV3+i36LbmX0ue9FYHXt+9JHE+vmdbMjukkICF2pWl+KBxGIGGZGqH
 9BSdoRf07MgTcGVz6sGv4Lrt5RxWVV8DZwwBKwYzzPHxVN2aQOxo6M1PIiKemN/X2o2MsmOsZuI
 jLNtltSf55f8YX1iLssgQqb4Jb7NOTOk0Ht/wr1aFStUJO6za5v0NmQP3GBPprwhNsrmwaysbGP
 R4mKd/nW0OLZBJTR+0dDg4Z6/TgeIYXI86YndlDnB/g8E8i88b1EKLb+cqq2hk+eiJK4vsaZRPR
 gJeH5ckWotsXmqXCdH9YcHu+qcDo5aMFn48TE9pehy/Aw==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 5e0832d2; Tue, 29 Jul 2025 11:18:17 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 linux-leds@vger.kernel.org
Subject: Re: linux-next: Tree for Jul 29 (BACKLIGHT_KTD2801)
Date: Tue, 29 Jul 2025 11:18:16 +0200
Message-ID: <5002743.GXAFRqVoOG@radijator>
In-Reply-To: <b6c481bb-e854-405e-a428-90301789fe20@infradead.org>
References: <20250729153510.3781ac91@canb.auug.org.au>
 <b6c481bb-e854-405e-a428-90301789fe20@infradead.org>
MIME-Version: 1.0
Autocrypt: addr=duje@dujemihanovic.xyz; keydata=
 mDMEZokhzhYJKwYBBAHaRw8BAQdAWJZ0hsI/ytTqHGFV8x6tzd5sB596cTeeDB4CQsTf+wC0KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBG3/QdYN8x
 S1t2umMK0xk1JFj60DBQJmiSHOAhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJEK0xk1JFj60D1GABAJVSorZdMOlrp/oQtCSH/G53NE56x/JHA8VX+ZQBd/H3AP4/EcUf6eef
 DUxVMh2bdkmuQKsVZGgOGiXpMksrVntWBrQpRHVqZSBNaWhhbm92acSHIDxkdWplLm1paGFub3Z
 pY0Bza29sZS5ocj6ImQQTFgoAQRYhBG3/QdYN8xS1t2umMK0xk1JFj60DBQJmiSH/AhsDBQkJZg
 GABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEK0xk1JFj60Dlw8A/i4lPOL7NaYoYePDq
 l8MaJaR9qoUi+D+HtD3t0Koi7ztAQCdizXbuqP3AVNxy5Gpb1ozgp9Xqh2MRcNmJCHA1YhWAbg4
 BGaJIc4SCisGAQQBl1UBBQEBB0DEc9JeA55OlZfWKgvmRgw6a/EpBQ8mDl6nQTBmnd1XHAMBCAe
 IfgQYFgoAJhYhBG3/QdYN8xS1t2umMK0xk1JFj60DBQJmiSHOAhsMBQkJZgGAAAoJEK0xk1JFj6
 0DG5MA/iuo4l2GDEZ1Zf+XaS//8FwdXDO9nHkfbV2MHjF4NZXwAQDroMzBdMcqVvc8GABFlTTgG
 j7KrRDz2HwWNyF8ZeprAQ==
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Tue, 29 Jul 2025 10:35:39 +0000
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

On Tuesday, 29 July 2025 10:32:13 Central European Summer Time Randy Dunlap 
wrote:
> so BACKLIGHT_KTD2801 should:
> 	depends on GPIOLIB

Sounds good to me.

> Also, in drivers/leds/Kconfig, does it need duplicate entries for this?
> Can't the second entry be removed?
> (asking since Duje made both entries)

That's an oversight on my end, and as such the second one (the one inside the 
"if NEW_LEDS" block) should be removed.

Would you like me to send a patch to fix these?

Regards,
-- 
Duje


