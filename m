Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417CC9DA89
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 02:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57D96E037;
	Tue, 27 Aug 2019 00:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4552E89F99
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 00:19:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A98522EE;
 Tue, 27 Aug 2019 02:19:33 +0200 (CEST)
Date: Tue, 27 Aug 2019 03:19:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 13/14] drm: rcar-du: kms: Update CMM in atomic commit
 tail
Message-ID: <20190827001927.GA5926@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-14-jacopo+renesas@jmondi.org>
 <20190827000017.GB5274@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827000017.GB5274@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566865173;
 bh=b1IWTKBE4UNZojeNpwZ778+qPdPRYX/fimB2+YFE358=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aVOS0QUTdeeEKHIc3la6YAwSZ4hRlcpUZkCOo9xF4/y1qt4UKquoWQ/7pq4fD/BjA
 oRXwFZueDweOSokmQU2WI1pFEw1nhmJ2Ve4W1eL9JJzLkA2sJ70eO0gV2YRow5VqGF
 Syn/9Qvg/FInHN0XpSjg5Br/0bXzW5+74797AzAQ=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: muroya@ksk.co.jp, uli@fpond.eu, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Harsha.ManjulaMallikarjun@in.bosch.com, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDM6MDA6MTdBTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBKYWNvcG8sCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4gCj4g
T24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMDM6NTE6NTNQTSArMDIwMCwgSmFjb3BvIE1vbmRpIHdy
b3RlOgo+ID4gVXBkYXRlIENNTSBzZXR0aW5ncyBhdCBpbiB0aGUgYXRvbWljIGNvbW1pdCB0YWls
IGhlbHBlciBtZXRob2QuCj4gPiAKPiA+IFRoZSBDTU0gaXMgdXBkYXRlZCB3aXRoIG5ldyBnYW1t
YSB2YWx1ZXMgcHJvdmlkZWQgdG8gdGhlIGRyaXZlcgo+ID4gaW4gdGhlIEdBTU1BX0xVVCBibG9i
IHByb3BlcnR5Lgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogVWxyaWNoIEhlY2h0IDx1bGkrcmVuZXNh
c0BmcG9uZC5ldT4KPiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkg
PGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX2R1X2ttcy5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX2R1X2ttcy5jCj4gPiBpbmRleCA2MWNhMWQzYzM3OWEuLjA0N2ZkYjk4MmEx
MSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMK
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKPiA+IEBAIC0y
Miw2ICsyMiw3IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+Cj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L3dhaXQuaD4KPiA+ICAKPiA+ICsjaW5jbHVkZSAicmNhcl9jbW0uaCIKPiA+
ICAjaW5jbHVkZSAicmNhcl9kdV9jcnRjLmgiCj4gPiAgI2luY2x1ZGUgInJjYXJfZHVfZHJ2Lmgi
Cj4gPiAgI2luY2x1ZGUgInJjYXJfZHVfZW5jb2Rlci5oIgo+ID4gQEAgLTM2OCw2ICszNjksMzcg
QEAgcmNhcl9kdV9mYl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9m
aWxlICpmaWxlX3ByaXYsCj4gPiAgICogQXRvbWljIENoZWNrIGFuZCBVcGRhdGUKPiA+ICAgKi8K
PiA+ICAKPiA+ICtzdGF0aWMgdm9pZCByY2FyX2R1X2F0b21pY19jb21taXRfdXBkYXRlX2NtbShz
dHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gPiArCQkJCQkgICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0
ZSAqb2xkX3N0YXRlKQo+ID4gK3sKPiA+ICsJc3RydWN0IHJjYXJfZHVfY3J0YyAqcmNydGMgPSB0
b19yY2FyX2NydGMoY3J0Yyk7Cj4gPiArCXN0cnVjdCByY2FyX2NtbV9jb25maWcgY21tX2NvbmZp
ZyA9IHt9Owo+ID4gKwo+ID4gKwlpZiAoIXJjcnRjLT5jbW0gfHwgIWNydGMtPnN0YXRlLT5jb2xv
cl9tZ210X2NoYW5nZWQpCj4gPiArCQlyZXR1cm47Cj4gPiArCj4gPiArCWlmICghY3J0Yy0+c3Rh
dGUtPmdhbW1hX2x1dCkgewo+ID4gKwkJY21tX2NvbmZpZy5sdXQuZW5hYmxlID0gZmFsc2U7Cj4g
PiArCQlyY2FyX2NtbV9zZXR1cChyY3J0Yy0+Y21tLCAmY21tX2NvbmZpZyk7Cj4gPiArCj4gPiAr
CQlyZXR1cm47Cj4gPiArCX0KPiA+ICsKPiA+ICsJY21tX2NvbmZpZy5sdXQuZW5hYmxlID0gdHJ1
ZTsKPiA+ICsJY21tX2NvbmZpZy5sdXQudGFibGUgPSAoc3RydWN0IGRybV9jb2xvcl9sdXQgKikK
PiA+ICsJCQkgICAgICAgY3J0Yy0+c3RhdGUtPmdhbW1hX2x1dC0+ZGF0YTsKPiA+ICsKPiA+ICsJ
LyogU2V0IExVVCB0YWJsZSBzaXplIHRvIDAgaWYgZW50cmllcyBzaG91bGQgbm90IGJlIHVwZGF0
ZWQuICovCj4gPiArCWlmICghb2xkX3N0YXRlLT5nYW1tYV9sdXQgfHwKPiA+ICsJICAgIG9sZF9z
dGF0ZS0+Z2FtbWFfbHV0LT5iYXNlLmlkICE9IGNydGMtPnN0YXRlLT5nYW1tYV9sdXQtPmJhc2Uu
aWQpCj4gPiArCQljbW1fY29uZmlnLmx1dC5zaXplID0gY3J0Yy0+c3RhdGUtPmdhbW1hX2x1dC0+
bGVuZ3RoCj4gPiArCQkJCSAgICAvIHNpemVvZihjbW1fY29uZmlnLmx1dC50YWJsZVswXSk7Cj4g
Cj4gSXQgaGFzIGp1c3Qgb2NjdXJyZWQgdG8gbWUgdGhhdCB0aGUgaGFyZHdhcmUgb25seSBzdXBw
b3J0IExVVHMgb2YKPiBleGFjdGx5IDI1NiBlbnRyaWVzLiBTaG91bGQgd2UgcmVtb3ZlIGNtbV9j
b25maWcubHV0LnNpemUgKHNpbXBsaWZ5aW5nCj4gdGhlIGNvZGUgaW4gdGhlIENNTSBkcml2ZXIp
LCBhbmQgYWRkIGEgY2hlY2sgdG8gdGhlIENSVEMgLmF0b21pY19jaGVjaygpCj4gaGFuZGxlciB0
byByZWplY3QgaW52YWxpZCBMVVRzID8gU29ycnkgZm9yIG5vdCBoYXZpbmcgY2F1Z2h0IHRoaXMK
PiBlYXJsaWVyLgoKSnVzdCBhbiBhZGRpdGlvbmFsIGNvbW1lbnQsIGlmIHdlIGRyb3AgdGhlIHNp
emUgZmllbGQsIHRoZW4gdGhlCmNtbV9jb25maWcubHV0LnRhYmxlIHBvaW50ZXIgc2hvdWxkIGJl
IHNldCB0byBOVUxMIHdoZW4gdGhlIExVVCBjb250ZW50cwpkb24ndCBuZWVkIHRvIGJlIHVwZGF0
ZWQuCgo+ID4gKwllbHNlCj4gPiArCQljbW1fY29uZmlnLmx1dC5zaXplID0gMDsKPiA+ICsKPiA+
ICsJcmNhcl9jbW1fc2V0dXAocmNydGMtPmNtbSwgJmNtbV9jb25maWcpOwo+ID4gK30KPiA+ICsK
PiA+ICBzdGF0aWMgaW50IHJjYXJfZHVfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsCj4gPiAgCQkJCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKPiA+ICB7Cj4gPiBA
QCAtNDEwLDYgKzQ0Miw5IEBAIHN0YXRpYyB2b2lkIHJjYXJfZHVfYXRvbWljX2NvbW1pdF90YWls
KHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpvbGRfc3RhdGUpCj4gPiAgCQkJcmNkdS0+ZHBhZDFf
c291cmNlID0gcmNydGMtPmluZGV4Owo+ID4gIAl9Cj4gPiAgCj4gPiArCWZvcl9lYWNoX29sZF9j
cnRjX2luX3N0YXRlKG9sZF9zdGF0ZSwgY3J0YywgY3J0Y19zdGF0ZSwgaSkKPiA+ICsJCXJjYXJf
ZHVfYXRvbWljX2NvbW1pdF91cGRhdGVfY21tKGNydGMsIGNydGNfc3RhdGUpOwo+ID4gKwo+ID4g
IAkvKiBBcHBseSB0aGUgYXRvbWljIHVwZGF0ZS4gKi8KPiA+ICAJZHJtX2F0b21pY19oZWxwZXJf
Y29tbWl0X21vZGVzZXRfZGlzYWJsZXMoZGV2LCBvbGRfc3RhdGUpOwo+ID4gIAlkcm1fYXRvbWlj
X2hlbHBlcl9jb21taXRfcGxhbmVzKGRldiwgb2xkX3N0YXRlLAo+IAo+IC0tIAo+IFJlZ2FyZHMs
Cj4gCj4gTGF1cmVudCBQaW5jaGFydAoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
