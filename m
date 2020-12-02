Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE662CD101
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B576E9B7;
	Thu,  3 Dec 2020 08:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB826EA0A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 12:14:24 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmHvM13p4z9sW0;
 Wed,  2 Dec 2020 23:14:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606911257;
 bh=dHdu5NS4Xw4IX9X/GFAxYuxXCqWGRcHQlDUnVy182gE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qtDh7IvvHnc1+eKidZ76vTxF/6g74s2Qv4NdJCP3ZbL1MvM7SMn0lhAVe5tKSzbZQ
 HAZWdo85rrG0VGkeOEqwRUPOnvHmcNv66RNAVaUJFUprFf5SkMq27aOekm8dbPRCY5
 gkzvsxHN3LwDnlCxInjPmxzTiDx21ibFqTqqu3eDy34Z8nkx1csBez+MJFFdL11gkd
 f/LwaVwDLEtHeYQ1e4yz1BkCIl0n6WAAZmXjde8XppUxjXPuEllv155QVe9hK1naST
 fh3/pL4XJyDtWcjIvBpmTiEV3p97PKO/mL+YIWoTYOapjBgcldMx3HEGaWB6OkoQ9g
 G0I0mDDBKdB0w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 2/2] powerpc/ps3: make system bus's remove and shutdown
 callbacks return void
In-Reply-To: <20201129173153.jbt3epcxnasbemir@pengutronix.de>
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
 <20201126165950.2554997-2-u.kleine-koenig@pengutronix.de>
 <s5hv9dphnoh.wl-tiwai@suse.de>
 <20201129173153.jbt3epcxnasbemir@pengutronix.de>
Date: Wed, 02 Dec 2020 23:14:06 +1100
Message-ID: <875z5kwgkx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
Cc: alsa-devel@alsa-project.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Mackerras <paulus@samba.org>, linux-scsi@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>, Jakub Kicinski <kuba@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jim Paris <jim@jtan.com>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JpdGVz
Ogo+IEhlbGxvIE1pY2hhZWwsCj4KPiBPbiBTYXQsIE5vdiAyOCwgMjAyMCBhdCAwOTo0ODozMEFN
ICswMTAwLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4+IE9uIFRodSwgMjYgTm92IDIwMjAgMTc6NTk6
NTAgKzAxMDAsCj4+IFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+PiA+IAo+PiA+IFRoZSBkcml2
ZXIgY29yZSBpZ25vcmVzIHRoZSByZXR1cm4gdmFsdWUgb2Ygc3RydWN0IGRldmljZV9kcml2ZXI6
OnJlbW92ZQo+PiA+IGJlY2F1c2UgdGhlcmUgaXMgb25seSBsaXR0bGUgdGhhdCBjYW4gYmUgZG9u
ZS4gRm9yIHRoZSBzaHV0ZG93biBjYWxsYmFjawo+PiA+IGl0J3MgcHMzX3N5c3RlbV9idXNfc2h1
dGRvd24oKSB3aGljaCBpZ25vcmVzIHRoZSByZXR1cm4gdmFsdWUuCj4+ID4gCj4+ID4gVG8gc2lt
cGxpZnkgdGhlIHF1ZXN0IHRvIG1ha2Ugc3RydWN0IGRldmljZV9kcml2ZXI6OnJlbW92ZSByZXR1
cm4gdm9pZCwKPj4gPiBsZXQgc3RydWN0IHBzM19zeXN0ZW1fYnVzX2RyaXZlcjo6cmVtb3ZlIHJl
dHVybiB2b2lkLCB0b28uIEFsbCB1c2Vycwo+PiA+IGFscmVhZHkgdW5jb25kaXRpb25hbGx5IHJl
dHVybiAwLCB0aGlzIGNvbW1pdCBtYWtlcyBpdCBvYnZpb3VzIHRoYXQKPj4gPiByZXR1cm5pbmcg
YW4gZXJyb3IgY29kZSBpcyBhIGJhZCBpZGVhIGFuZCBlbnN1cmVzIGZ1dHVyZSB1c2VycyBiZWhh
dmUKPj4gPiBhY2NvcmRpbmdseS4KPj4gPiAKPj4gPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+PiAKPj4gRm9yIHRoZSBz
b3VuZCBiaXQ6Cj4+IEFja2VkLWJ5OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+Cj4KPiBh
c3N1bWluZyB0aGF0IHlvdSBhcmUgdGhlIG9uZSB3aG8gd2lsbCBhcHBseSB0aGlzIHBhdGNoOiBO
b3RlIHRoYXQgaXQKPiBkZXBlbmRzIG9uIHBhdGNoIDEgdGhhdCBUYWthc2hpIGFscmVhZHkgYXBw
bGllZCB0byBoaXMgdHJlZS4gU28geW91Cj4gZWl0aGVyIGhhdmUgdG8gd2FpdCB1bnRpbHMgcGF0
Y2ggMSBhcHBlYXJzIGluIHNvbWUgdHJlZSB0aGF0IHlvdSBtZXJnZQo+IGJlZm9yZSBhcHBseWlu
Zywgb3IgeW91IGhhdmUgdG8gdGFrZSBwYXRjaCAxLCB0b28uIChXaXRoIFRha2FzaGkKPiBvcHRp
bmFsbHkgZHJvcHBpbmcgaXQgdGhlbi4pCgpUaGFua3MuIEkndmUgcGlja2VkIHVwIGJvdGggcGF0
Y2hlcy4KCklmIFRha2FzaGkgZG9lc24ndCB3YW50IHRvIHJlYmFzZSBoaXMgdHJlZSB0byBkcm9w
IHBhdGNoIDEgdGhhdCdzIE9LLCBpdAp3aWxsIGp1c3QgYXJyaXZlIGluIG1haW5saW5lIHZpYSB0
d28gcGF0aHMsIGJ1dCBnaXQgc2hvdWxkIGhhbmRsZSBpdC4KCmNoZWVycwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
