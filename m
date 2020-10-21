Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537FC295928
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208376F51F;
	Thu, 22 Oct 2020 07:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs22.siol.net [185.57.226.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950678861A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 17:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 00B6B527428;
 Wed, 21 Oct 2020 19:10:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id xaTPb3dd-nCG; Wed, 21 Oct 2020 19:10:51 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id A611B527430;
 Wed, 21 Oct 2020 19:10:51 +0200 (CEST)
Received: from kista.localnet (cpe1-5-97.cable.triera.net [213.161.5.97])
 (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id BACC0527428;
 Wed, 21 Oct 2020 19:10:50 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/3] drm/sun4i: frontend: Rework a bit the phase data
Date: Wed, 21 Oct 2020 19:16:17 +0200
Message-ID: <3090261.6p6c3PZEHK@kista>
In-Reply-To: <20201015093642.261440-1-maxime@cerno.tech>
References: <20201015093642.261440-1-maxime@cerno.tech>
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

SGkhCgpEbmUgxI1ldHJ0ZWssIDE1LiBva3RvYmVyIDIwMjAgb2IgMTE6MzY6NDAgQ0VTVCBqZSBN
YXhpbWUgUmlwYXJkIG5hcGlzYWwoYSk6Cj4gVGhlIHNjYWxlciBmaWx0ZXIgcGhhc2Ugc2V0dXAg
aW4gdGhlIGFsbHdpbm5lciBrZXJuZWwgaGFzIHR3byBkaWZmZXJlbnQKPiBjYXNlcyBmb3Igc2V0
dGluZyB1cCB0aGUgc2NhbGVyIGZpbHRlciwgdGhlIGZpcnN0IG9uZSB1c2luZyBkaWZmZXJlbnQg
cGhhc2UKPiBwYXJhbWV0ZXJzIGZvciB0aGUgdHdvIGNoYW5uZWxzLCBhbmQgdGhlIHNlY29uZCBv
bmUgcmV1c2luZyB0aGUgZmlyc3QKPiBjaGFubmVsIHBhcmFtZXRlcnMgb24gdGhlIHNlY29uZCBj
aGFubmVsLgo+IAo+IFRoZSBhbGx3aW5uZXIga2VybmVsIGhhcyBhIHRoaXJkIG9wdGlvbiB3aGVy
ZSB0aGUgaG9yaXpvbnRhbCBwaGFzZSBvZiB0aGUKPiBzZWNvbmQgY2hhbm5lbCB3aWxsIGJlIHNl
dCB0byBhIGRpZmZlcmVudCB2YWx1ZSB0aGFuIHRoZSB2ZXJ0aWNhbCBvbmUgKGFuZAo+IHNlZW1z
IGxpa2UgaXQncyB0aGUgc2FtZSB2YWx1ZSB0aGFuIG9uZSB1c2VkIG9uIHRoZSBmaXJzdCBjaGFu
bmVsKS4KPiBIb3dldmVyLCB0aGF0IGNvZGUgcGF0aCBzZWVtcyB0byBuZXZlciBiZSB0YWtlbiwg
c28gd2UgY2FuIGlnbm9yZSBpdCBmb3IKPiBub3csIGFuZCBpdCdzIGVzc2VudGlhbGx5IHdoYXQg
d2UncmUgZG9pbmcgc28gZmFyIGFzIHdlbGwuCj4gCj4gU2luY2Ugd2Ugd2lsbCBoYXZlIGFsd2F5
cyB0aGUgc2FtZSB2YWx1ZXMgYWNyb3NzIGVhY2ggY29tcG9uZW50cyBvZiB0aGUKPiBmaWx0ZXIg
c2V0dXAgZm9yIGEgZ2l2ZW4gY2hhbm5lbCwgd2UgY2FuIHNpbXBsaWZ5IGEgYml0IG91ciBmcm9u
dGVuZAo+IHN0cnVjdHVyZSBieSBvbmx5IHN0b3JpbmcgdGhlIHBoYXNlIHZhbHVlIHdlIHdhbnQg
dG8gYXBwbHkgdG8gYSBnaXZlbgo+IGNoYW5uZWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1l
IFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+CgpBY2tlZC1ieTogSmVybmVqIFNrcmFiZWMgPGpl
cm5lai5za3JhYmVjQHNpb2wubmV0PgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
