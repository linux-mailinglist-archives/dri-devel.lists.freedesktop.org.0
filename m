Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77044258ADB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 10:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BB56E484;
	Tue,  1 Sep 2020 08:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66E56E484
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 08:57:43 +0000 (UTC)
Date: Tue, 01 Sep 2020 08:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1598950661;
 bh=xS/YRlImtljqm7ETg33B59R/Pa8qsUPNDUud3zarTGk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=SJFNbnyIAbEItmUJEOrsR896BmZwgnsZxfug7OMUQETCJwyqHaQJ5XATjAPDdlExm
 cm8QRp1uSRQnDL4Adkx8D9PctEtm88pUNQNF5t9O27xzNmfgqsLNQsyDrCRT5w1c3M
 Xrdzc+jt72n788adu8dJVgZYqQcpEWi6tiPviNfk4UQKeGrBQJf/pvcbpA6VehtHbY
 qTCoM3bptvaf7vv7LfwhLFMjQ+hFr0MnSVh3DrYPbzyZmN1mYKIs+g3SG2euEjT/hE
 ZIEgxjyVnswtyIoJmDnvdmFwGEWdD9msLSEAXySmVQBq08PgSmQkQ2KkLRJNoSmsih
 JielrcdRjQoWw==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: add support for gamma_set interface
Message-ID: <C7EgdPUBX9nRTKx9kkGIZijd0yGMOLEtXOwa2jvk-rKtprmNZKSDP-Jos7mYU88DOQYiXJBnz0_D2FAQ1x7jCwLcR-cmZtzCc5cLsJqyDCk=@emersion.fr>
In-Reply-To: <20200831134852.GY6112@intel.com>
References: <20200829140647.7626-1-realwakka@gmail.com>
 <UeJwFKvmNgKdZY_icN0-nrFly9R1vbzaMZ-TiyxIIPBcdl278uZsK6YdTTdRl6rFukBAmN-eyCFpnfsIB-El9QpyYiutdcpgJg64n4tsRRc=@emersion.fr>
 <20200831133858.GA9280@realwakka> <20200831134852.GY6112@intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCBBdWd1c3QgMzEsIDIwMjAgMzo0OCBQTSwgVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+ID4gPiBJdCBkb2Vzbid0IHNlZW0g
bGlrZSB0aGlzIElHVCB0ZXN0J3MgZ29hbCBpcyB0byBleGVyY2lzZSBzdXBwb3J0IGZvcgo+ID4g
PiBnYW1tYSBMVVRzLiBEb2VzIHRoZSB0ZXN0IGp1c3QgdHJpZXMgdG8gcmVzZXQgdGhlIGdhbW1h
IExVVCB0byBsaW5lYXI/Cj4gPiA+IElmIHNvLCBJIHRoaW5rIHRoZSBJR1QgdGVzdCBzaG91bGQg
YmUgZml4ZWQgdG8gaWdub3JlICJJIGRvbid0IHN1cHBvcnQKPiA+ID4gZ2FtbWEiIGVycm9ycy4K
PiA+Cj4gPiBJdCBzZWVtcyBsaWtlIHRoYXQgSUdUIHRlc3QgcGl4ZWwtZm9ybWF0IGlzIHRvIG1h
a2UgZ2FtbWEgbHV0IGxpa2UgYmVsb3cuCj4gPiBmb3IgKGkgPSAwOyBpIDwgbHV0X3NpemU7IGkr
KykKPiA+IGx1dFtpXSA9IChpICogMHhmZmZmIC8gKGx1dF9zaXplIC0gMSkpICYgbWFzazsKPiA+
IEFuZCBzZXQgdGhpcyB0YWJsZSB0byBkcm0gZHJpdmVyLiBhbmQgdGVzdCBiZWdpbnMuIEl0J3Mg
dGhlIHRlc3QgYWJvdXQgcGl4ZWwKPiA+IGZvcm1hdC4gSSB0aGluayB5b3UncmUgcmlnaHQuIEl0
J3Mgbm90IGFib3V0IGdhbW1hIGx1dC4KPgo+IFRoZSBwb2ludCBvZiB0aGUgZ2FtbWEgTFVUIHN0
dWZmIGluIHRoZSBwaXhlbCBmb3JtYXQgdGVzdCBpcyB0byB0aHJvdwo+IGF3YXkgYSBidW5jaCBv
ZiB0aGUgbHNicyBzbyB0aGF0IHRoZSB0ZXN0IHBhc3NlcyB3aGVuIHRoZSByZXN1bHQgaXMKPiAi
Y2xvc2UgZW5vdWdoIiB0byB0aGUgOGJwYyBSR0IgcmVmZXJlbmNlIGltYWdlLiBXaXRob3V0IGl0
IHdlIHdvdWxkCj4gbmV2ZXIgZ2V0IGEgY3JjIG1hdGNoIHdoZW4gdGVzdGluZyBub24tOGJwYyBv
ciBZQ2JDciBmb3JtYXRzLgoKT0ssIHRoYXQgbWFrZXMgc2Vuc2UuIFdvdWxkIGl0IGJlIHNlbnNp
YmxlIHRvOgoKLSBEb24ndCBzZXQgZ2FtbWEgaWYgdGhlIHBpeGVsIGZvcm1hdCBiZWluZyB0ZXN0
ZWQgaXMgOGJwYwotIE1ha2UgdGhlIHRlc3Qgc2tpcCBpZiB0aGUgcGl4ZWwgZm9ybWF0IGlzID44
YnBjIGFuZCBnYW1tYSBpc24ndAogIHN1cHBvcnRlZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
