Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685C5182A9B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86F06EA59;
	Thu, 12 Mar 2020 08:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D3189491
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:29:29 +0000 (UTC)
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9615760009;
 Wed, 11 Mar 2020 14:29:23 +0000 (UTC)
Date: Wed, 11 Mar 2020 15:29:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH -next 013/491] INGENIC JZ47xx SoCs: Use fallthrough;
Message-ID: <20200311152922.2dc56137@xps13>
In-Reply-To: <CAPDyKFo2UensmH_gYkH+u22bs=K9Xn0q3Dr9v6tq6GPNRg_Lew@mail.gmail.com>
References: <cover.1583896344.git.joe@perches.com>
 <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
 <20200311084052.3ca3c331@xps13>
 <CAPDyKFo2UensmH_gYkH+u22bs=K9Xn0q3Dr9v6tq6GPNRg_Lew@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: alsa-devel@alsa-project.org, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>, Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org, Joe Perches <joe@perches.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3cm90ZSBvbiBXZWQsIDExIE1h
ciAyMDIwIDE1OjIwOjU5CiswMTAwOgoKPiBPbiBXZWQsIDExIE1hciAyMDIwIGF0IDA4OjQwLCBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBI
aSBKb2UsCj4gPgo+ID4gSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gd3JvdGUgb24gVHVl
LCAxMCBNYXIgMjAyMCAyMTo1MToyNyAtMDcwMDoKPiA+ICAKPiA+ID4gQ29udmVydCB0aGUgdmFy
aW91cyB1c2VzIG9mIGZhbGx0aHJvdWdoIGNvbW1lbnRzIHRvIGZhbGx0aHJvdWdoOwo+ID4gPgo+
ID4gPiBEb25lIHZpYSBzY3JpcHQKPiA+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC9iNTY2MDJmY2Y3OWY4NDllNzMzZTdiNTIxYmIwZTE3ODk1ZDM5MGZhLjE1ODIyMzAzNzku
Z2l0LmpvZS5jb20vCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvZSBQZXJjaGVzIDxqb2VA
cGVyY2hlcy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5n
ZW5pYy1kcm0uYyAgICAgICAgICAgfCAyICstCj4gPiA+ICBkcml2ZXJzL21tYy9ob3N0L2p6NDc0
MF9tbWMuYyAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tCj4gPiA+ICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYyB8IDIgKy0KPiA+ID4gIGRyaXZlcnMv
bXRkL25hbmQvcmF3L2luZ2VuaWMvano0NzI1Yl9iY2guYyAgICAgIHwgNCArKy0tCj4gPiA+ICBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2p6NDc4MF9iY2guYyAgICAgICB8IDQgKystLQo+
ID4gPiAgc291bmQvc29jL2NvZGVjcy9qejQ3NzAuYyAgICAgICAgICAgICAgICAgICAgICAgfCAy
ICstCj4gPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pICAKPiA+Cj4gPiBJIGxpa2UgdmVyeSBtdWNoIHRoZSBuZXcgd2F5IHRvIGFkdmVydGlzZSBm
b3IgZmFsbHRocm91Z2ggc3RhdGVtZW50cywKPiA+IGJ1dCBJIGFtIG5vdCB3aWxsaW5nIHRvIHRh
a2UgYW55IHBhdGNoIGNvbnZlcnRpbmcgYSBzaW5nbGUgZHJpdmVyCj4gPiBhbnltb3JlLiBJIGhh
ZCB0b28gbWFueSBmcm9tIEd1c3Rhdm8gd2hlbiB0aGVzZSBjb21tZW50cyBoYWQgdG8gYmUKPiA+
IGluc2VydGVkLiBJIHdvdWxkIHJlYWxseSBwcmVmZXIgYSBNVEQtd2lkZSBvciBhIE5BTkQtd2lk
ZSBvciBhdCBsZWFzdCBhCj4gPiByYXctTkFORC13aWRlIHNpbmdsZSBwYXRjaCAoYW55dGhpbmcg
aW5zaWRlIGRyaXZlcnMvbXRkL25hbmQvcmF3LykuCj4gPgo+ID4gSG9wZSB5b3UnbGwgdW5kZXJz
dGFuZCEgIAo+IAo+IEkgZnVsbHkgYWdyZWUgKGZvciBtbWMpLiBPbmUgcGF0Y2ggcGxlYXNlLgo+
IAo+IEFub3RoZXIgb3B0aW9uIGlzIHRvIG1ha2UgYSBiaWcgZmF0IHRyZWUgd2lkZSBwYXRjaCBh
bmQgYXNrIExpbnVzIGlmCj4gaGUgd2FudCB0byBwaWNrIHVwIGltbWVkaWF0ZWx5IGFmdGVyIGFu
IHJjMS4gVGhhdCBzaG91bGQgY2F1c2UgbGVzcwo+IGRpc3R1cmJhbmNlIGZvciBldmVyeW9uZSwg
bm8/CgpBYnNvbHV0ZWx5LgoKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
