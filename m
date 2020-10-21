Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6501B29592A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D916F521;
	Thu, 22 Oct 2020 07:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 455 seconds by postgrey-1.36 at gabe;
 Wed, 21 Oct 2020 17:18:29 UTC
Received: from mail.siol.net (mailoutvs11.siol.net [185.57.226.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D378861A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 17:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 77CC8527434;
 Wed, 21 Oct 2020 19:13:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 7pY5Dxuq1YDw; Wed, 21 Oct 2020 19:13:11 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 2576652743A;
 Wed, 21 Oct 2020 19:13:11 +0200 (CEST)
Received: from kista.localnet (cpe1-5-97.cable.triera.net [213.161.5.97])
 (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id AA475527434;
 Wed, 21 Oct 2020 19:13:10 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/3] drm/sun4i: frontend: Reuse the ch0 phase for RGB
 formats
Date: Wed, 21 Oct 2020 19:18:37 +0200
Message-ID: <3169628.grsLiRHT83@kista>
In-Reply-To: <20201015093642.261440-2-maxime@cerno.tech>
References: <20201015093642.261440-1-maxime@cerno.tech>
 <20201015093642.261440-2-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: Taras Galchenko <tpgalchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpEbmUgxI1ldHJ0ZWssIDE1LiBva3RvYmVyIDIwMjAgb2IgMTE6MzY6NDEgQ0VTVCBqZSBN
YXhpbWUgUmlwYXJkIG5hcGlzYWwoYSk6Cj4gV2hlbiB1c2luZyB0aGUgc2NhbGVyIG9uIHRoZSBB
MTAtbGlrZSBmcm9udGVuZCB3aXRoIHNpbmdsZS1wbGFuYXIgZm9ybWF0cywKPiB0aGUgY3VycmVu
dCBjb2RlIHdpbGwgc2V0dXAgdGhlIGNoYW5uZWwgMCBmaWx0ZXIgKHVzZWQgZm9yIHRoZSBSIG9y
IFkKPiBjb21wb25lbnQpIHdpdGggYSBkaWZmZXJlbnQgcGhhc2UgcGFyYW1ldGVyIHRoYW4gdGhl
IGNoYW5uZWwgMSBmaWx0ZXIgKHVzZWQKPiBmb3IgdGhlIEcvQiBvciBVL1YgY29tcG9uZW50cyku
Cj4gCj4gVGhpcyBjcmVhdGVzIGEgYmxlZWQgb3V0IHRoYXQga2VlcHMgcmVwZWF0aW5nIG9uIG9m
IHRoZSBsYXN0IGxpbmUgb2YgdGhlCj4gUkdCIHBsYW5lIGFjcm9zcyB0aGUgcmVzdCBvZiB0aGUg
ZGlzcGxheS4gVGhlIEFsbHdpbm5lciBCU1AgZWl0aGVyIGFwcGxpZXMKPiB0aGUgc2FtZSBwaGFz
ZSBwYXJhbWV0ZXIgb3ZlciBib3RoIGNoYW5uZWxzIG9yIHVzZSBhIHNlcGFyYXRlIG9uZSwgdGhl
Cj4gY29uZGl0aW9uIGJlaW5nIHdoZXRoZXIgdGhlIGlucHV0IGZvcm1hdCBpcyBZVVY0MjAgb3Ig
bm90Lgo+IAo+IFNpbmNlIFlVVjQyMCBpcyBib3RoIHN1YnNhbXBsZWQgYW5kIG11bHRpLXBsYW5h
ciwgYW5kIHNpbmNlIFlVWVYgaXMKPiBzdWJzYW1wbGVkIGJ1dCBzaW5nbGUtcGxhbmFyLCB3ZSBj
YW4gcnVsZSBvdXQgdGhlIHN1YnNhbXBsaW5nIGFuZCBhc3N1bWUKPiB0aGF0IHRoZSBjb25kaXRp
b24gaXMgYWN0dWFsbHkgd2hldGhlciB0aGUgZm9ybWF0IGlzIHNpbmdsZSBvcgo+IG11bHRpLXBs
YW5hci4gQW5kIGl0IGxvb2tzIGxpa2UgYXBwbHlpbmcgdGhlIHNhbWUgcGhhc2UgcGFyYW1ldGVy
IG92ZXIgYm90aAo+IGNoYW5uZWxzIGZvciBzaW5nbGUtcGxhbmFyIGZvcm1hdHMgZml4ZXMgb3Vy
IGlzc3VlLCB3aGlsZSB3ZSBrZWVwIHRoZQo+IG11bHRpLXBsYW5hciBmb3JtYXRzIHdvcmtpbmcg
cHJvcGVybHkuCj4gCj4gUmVwb3J0ZWQtYnk6IFRhcmFzIEdhbGNoZW5rbyA8dHBnYWxjaGVua29A
Z21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50
ZWNoPgoKQWNrZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4K
CkJlc3QgcmVnYXJkcywKSmVybmVqCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
