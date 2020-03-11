Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65320181300
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 09:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ADB6E934;
	Wed, 11 Mar 2020 08:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 78464 seconds by postgrey-1.36 at gabe;
 Wed, 11 Mar 2020 07:40:58 UTC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903456E4F9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:40:58 +0000 (UTC)
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 60A9F1BF205;
 Wed, 11 Mar 2020 07:40:53 +0000 (UTC)
Date: Wed, 11 Mar 2020 08:40:52 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH -next 013/491] INGENIC JZ47xx SoCs: Use fallthrough;
Message-ID: <20200311084052.3ca3c331@xps13>
In-Reply-To: <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
References: <cover.1583896344.git.joe@perches.com>
 <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Mar 2020 08:32:41 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9lLAoKSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gd3JvdGUgb24gVHVlLCAxMCBN
YXIgMjAyMCAyMTo1MToyNyAtMDcwMDoKCj4gQ29udmVydCB0aGUgdmFyaW91cyB1c2VzIG9mIGZh
bGx0aHJvdWdoIGNvbW1lbnRzIHRvIGZhbGx0aHJvdWdoOwo+IAo+IERvbmUgdmlhIHNjcmlwdAo+
IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvYjU2NjAyZmNmNzlmODQ5ZTczM2U3
YjUyMWJiMGUxNzg5NWQzOTBmYS4xNTgyMjMwMzc5LmdpdC5qb2UuY29tLwo+Cj4gU2lnbmVkLW9m
Zi1ieTogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYyAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbW1j
L2hvc3Qvano0NzQwX21tYy5jICAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0KPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmRfZHJ2LmMgfCAyICstCj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvano0NzI1Yl9iY2guYyAgICAgIHwgNCArKy0tCj4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvano0NzgwX2JjaC5jICAgICAgIHwgNCArKy0tCj4g
IHNvdW5kL3NvYy9jb2RlY3Mvano0NzcwLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+
ICA2IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpJIGxp
a2UgdmVyeSBtdWNoIHRoZSBuZXcgd2F5IHRvIGFkdmVydGlzZSBmb3IgZmFsbHRocm91Z2ggc3Rh
dGVtZW50cywKYnV0IEkgYW0gbm90IHdpbGxpbmcgdG8gdGFrZSBhbnkgcGF0Y2ggY29udmVydGlu
ZyBhIHNpbmdsZSBkcml2ZXIKYW55bW9yZS4gSSBoYWQgdG9vIG1hbnkgZnJvbSBHdXN0YXZvIHdo
ZW4gdGhlc2UgY29tbWVudHMgaGFkIHRvIGJlCmluc2VydGVkLiBJIHdvdWxkIHJlYWxseSBwcmVm
ZXIgYSBNVEQtd2lkZSBvciBhIE5BTkQtd2lkZSBvciBhdCBsZWFzdCBhCnJhdy1OQU5ELXdpZGUg
c2luZ2xlIHBhdGNoIChhbnl0aGluZyBpbnNpZGUgZHJpdmVycy9tdGQvbmFuZC9yYXcvKS4KCkhv
cGUgeW91J2xsIHVuZGVyc3RhbmQhCgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
