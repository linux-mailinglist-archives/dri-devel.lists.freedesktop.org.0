Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CBFC2747
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 22:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED89589DF9;
	Mon, 30 Sep 2019 20:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAB489DF9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 20:53:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 7E39228B90F
Message-ID: <8063b9555d5bce6f2c002e49da3b7afaca9ae0b4.camel@collabora.com>
Subject: Re: [PATCH v4 8/9] drm: rcar-du: kms: Update CMM in atomic commit tail
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu, 
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 30 Sep 2019 17:53:00 -0300
In-Reply-To: <20190906135436.10622-9-jacopo+renesas@jmondi.org>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-9-jacopo+renesas@jmondi.org>
Organization: Collabora
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Harsha.ManjulaMallikarjun@in.bosch.com,
 Doug Anderson <dianders@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K0RvdWcsIEhlaWtvOgoKT24gRnJpLCAyMDE5LTA5LTA2IGF0IDE1OjU0ICswMjAwLCBKYWNvcG8g
TW9uZGkgd3JvdGU6Cj4gVXBkYXRlIENNTSBzZXR0aW5ncyBhdCBpbiB0aGUgYXRvbWljIGNvbW1p
dCB0YWlsIGhlbHBlciBtZXRob2QuCj4gVGhlIENNTSBpcyB1cGRhdGVkIHdpdGggbmV3IGdhbW1h
IHZhbHVlcyBwcm92aWRlZCB0byB0aGUgZHJpdmVyCj4gaW4gdGhlIEdBTU1BX0xVVCBibG9iIHBy
b3BlcnR5Lgo+IAo+IFdoZW4gcmVzdW1pbmcgZnJvbSBzeXN0ZW0gc3VzcGVuZCwgdGhlIERVIGRy
aXZlciBpcyByZXNwb25zaWJsZSBmb3IKPiByZXByb2dyYW1taW5nIGFuZCBlbmFibGluZyB0aGUg
Q01NIHVuaXQgaWYgaXQgd2FzIGluIHVzZSBhdCB0aGUgdGltZSB0aGUKPiBzeXN0ZW0gZW50ZXJl
ZCB0aGUgc3VzcGVuZCBzdGF0ZS4gIEZvcmNlIHRoZSBjb2xvcl9tZ210X2NoYW5nZWQgZmxhZyB0
bwo+IHRydWUgaWYgdGhlIERSTSBnYW1tYSBsdXQgY29sb3IgdHJhbnNmb3JtYXRpb24gcHJvcGVy
dHkgd2FzIHNldCBpbiB0aGUKPiBDUlRDIHN0YXRlIGR1cGxpY2F0ZWQgYXQgc3VzcGVuZCB0aW1l
LCBhcyB0aGUgQ01NIGdldHMgcmVwcm9ncmFtbWVkIG9ubHkKPiBpZiBzYWlkIGZsYWcgaXMgYWN0
aXZlIGluIHRoZSByY2FyX2R1X2F0b21pY19jb21taXRfdXBkYXRlX2NtbSgpIG1ldGhvZC4KPiAK
PiBSZXZpZXdlZC1ieTogVWxyaWNoIEhlY2h0IDx1bGkrcmVuZXNhc0BmcG9uZC5ldT4KPiBSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRp
Lm9yZz4KPiAtLS0KPiAKPiBEYW5pZWwgY291bGQgeW91IGhhdmUgYSBsb29rIGlmIHJlc3VtZSBi
aXRzIGFyZSB3b3J0aCBiZWluZyBtb3ZlZCB0byB0aGUKPiBEUk0gY29yZT8gVGhlIGNvbG9yX21n
bXRfY2hhbmdlZCBmbGFnIGlzIHNldCB0byBmYWxzZSB3aGVuIHRoZSBzdGF0ZSBpcwo+IGR1cGxp
Y2F0ZWQgaWYgSSByZWFkIHRoZSBjb2RlIGNvcnJlY3RseSwgYnV0IHdoZW4gdGhpcyBoYXBwZW5z
IGluIGEKPiBzdXNwZW5kL3Jlc3VtZSBzZXF1ZW5jZSBpdHMgdmFsdWUgc2hvdWxkIHByb2JhYmx5
IGJlIHJlc3RvcmVkIHRvIHRydWUgaWYKPiBhbnkgY29sb3IgbWFuYWdlbWVudCBwcm9wZXJ0eSB3
YXMgc2V0IGluIHRoZSBjcnRjIHN0YXRlIHdoZW4gc3lzdGVtIGVudGVyZWQKPiBzdXNwZW5kLgo+
IAoKUGVyaGFwcyB3ZSBjYW4gdXNlIHRoZSBmb3JfZWFjaF9uZXdfY3J0Y19pbl9zdGF0ZSgpIGhl
bHBlciBoZXJlLAphbmQgbW92ZSBpdCB0byB0aGUgY29yZSBsaWtlIHRoaXM6CgotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2F0b21pY19oZWxwZXIuYwpAQCAtMzIzNCw4ICszMjM0LDIwIEBAIGludCBkcm1fYXRvbWljX2hl
bHBlcl9yZXN1bWUoc3RydWN0CmRybV9kZXZpY2UgKmRldiwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpCiB7CiAgICAgICAgc3RydWN0
IGRybV9tb2Rlc2V0X2FjcXVpcmVfY3R4IGN0eDsKKyAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3Rh
dGUKKmNydGNfc3RhdGU7CisgICAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjOworICAgICAgIHVu
c2lnbmVkIGludCBpOwogICAgICAgIGludCBlcnI7CiAKKyAgICAgICBmb3JfZWFjaF9uZXdfY3J0
Y19pbl9zdGF0ZShzdGF0ZSwgY3J0YywgY3J0Y19zdGF0ZSwgaSkgeworICAgCiAgICAgICAgICAg
IC8qCisgICAgICAgICAgICAgICAgKiBGb3JjZSByZS1lbmFibGVtZW50IG9mIENNTSBhZnRlciBz
eXN0ZW0gcmVzdW1lIGlmIGFueQorICAgICAgICAgICAgICAgICogb2YgdGhlIERSTSBjb2xvciB0
cmFuc2Zvcm1hdGlvbiBwcm9wZXJ0aWVzCndhcyBzZXQgaW4KKyAgICAgICAgICAgICAgICAqIHRo
ZSBzdGF0ZSBzYXZlZCBhdCBzeXN0ZW0gc3VzcGVuZCB0aW1lLgorICAgICAgICAgICAgICAgICov
CisgICAgICAgICAgICAgICBpZiAoY3J0Y19zdGF0ZS0+Z2FtbWFfbHV0KQorICAgICAgICAgICAg
ICAgICAgICAKICAgY3J0Y19zdGF0ZS0+Y29sb3JfbWdtdF9jaGFuZ2VkID0gdHJ1ZTsKKyAgICAg
ICB9CgpUaGlzIHByb2JhYmx5IGlzIHdyb25nLCBhbmQgc2hvdWxkIGJlIGluc3RlYWQgY29uc3Ry
YWluZWQgdG8gc29tZQpjb25kaXRpb24gb2Ygc29tZSBzb3J0LgoKRldJVywgdGhlIFJvY2tjaGlw
IERSTSBpcyBnb2luZyB0byBuZWVkIHRoaXMgYXMgd2VsbC4KCkFueSBpZGVhcz8KClRoYW5rcywK
RXplcXVpZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
