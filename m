Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0B4316E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 23:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804AD88B6C;
	Wed, 12 Jun 2019 21:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A913188AD9;
 Wed, 12 Jun 2019 21:20:58 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0A53D20021;
 Wed, 12 Jun 2019 23:20:56 +0200 (CEST)
Date: Wed, 12 Jun 2019 23:20:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Derek Basehore <dbasehore@chromium.org>
Subject: Re: [PATCH 1/5] drm/panel: Add helper for reading DT rotation
Message-ID: <20190612212054.GB13155@ravnborg.org>
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-2-dbasehore@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611040350.90064-2-dbasehore@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8
 a=PWvNCjwUpEQzod5d7NgA:9 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGVyZWsuCgpPbiBNb24sIEp1biAxMCwgMjAxOSBhdCAwOTowMzo0NlBNIC0wNzAwLCBEZXJl
ayBCYXNlaG9yZSB3cm90ZToKPiBUaGlzIGFkZHMgYSBoZWxwZXIgZnVuY3Rpb24gZm9yIHJlYWRp
bmcgdGhlIHJvdGF0aW9uIChwYW5lbAo+IG9yaWVudGF0aW9uKSBmcm9tIHRoZSBkZXZpY2UgdHJl
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEZXJlayBCYXNlaG9yZSA8ZGJhc2Vob3JlQGNocm9taXVt
Lm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jIHwgNDEgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2RybS9kcm1fcGFuZWwuaCAg
ICAgfCAgNyArKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3BhbmVsLmMKPiBpbmRleCBkYmQ1Yjg3M2U4ZjIuLjNiNjg5Y2U0YTUxYSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3BhbmVsLmMKPiBAQCAtMTcyLDYgKzE3Miw0NyBAQCBzdHJ1Y3QgZHJtX3BhbmVsICpv
Zl9kcm1fZmluZF9wYW5lbChjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ICAJcmV0dXJu
IEVSUl9QVFIoLUVQUk9CRV9ERUZFUik7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChvZl9kcm1fZmlu
ZF9wYW5lbCk7Cj4gKwo+ICsvKioKPiArICogb2ZfZHJtX2dldF9wYW5lbF9vcmllbnRhdGlvbiAt
IGxvb2sgdXAgdGhlIHJvdGF0aW9uIG9mIHRoZSBwYW5lbCB1c2luZyBhCj4gKyAqIGRldmljZSB0
cmVlIG5vZGUKPiArICogQG5wOiBkZXZpY2UgdHJlZSBub2RlIG9mIHRoZSBwYW5lbAo+ICsgKiBA
b3JpZW50YXRpb246IG9yaWVudGF0aW9uIGVudW0gdG8gYmUgZmlsbGVkIGluCj4gKyAqCj4gKyAq
IExvb2tzIHVwIHRoZSByb3RhdGlvbiBvZiBhIHBhbmVsIGluIHRoZSBkZXZpY2UgdHJlZS4gVGhl
IHJvdGF0aW9uIGluIHRoZQo+ICsgKiBkZXZpY2UgdHJlZSBpcyBjb3VudGVyIGNsb2Nrd2lzZS4K
PiArICoKPiArICogUmV0dXJuOiAwIHdoZW4gYSB2YWxpZCByb3RhdGlvbiB2YWx1ZSAoMCwgOTAs
IDE4MCwgb3IgMjcwKSBpcyByZWFkIG9yIHRoZQo+ICsgKiByb3RhdGlvbiBwcm9wZXJ0eSBkb2Vz
bid0IGV4aXN0LiAtRUVSUk9SIG90aGVyd2lzZS4KPiArICovCj4gK2ludCBvZl9kcm1fZ2V0X3Bh
bmVsX29yaWVudGF0aW9uKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCAqb3JpZW50
YXRpb24pCj4gK3sKPiArCWludCByb3RhdGlvbiwgcmV0Owo+ICsKPiArCXJldCA9IG9mX3Byb3Bl
cnR5X3JlYWRfdTMyKG5wLCAicm90YXRpb24iLCAmcm90YXRpb24pOwoKSSBqdXN0IG5vdGljZWQg
dGhhdCBldmVyeXdoZXJlIHRoaXMgY29kZSB0YWxrcyBhYm91dCBvcmllbnRhdGlvbiwKYnV0IHRo
ZSBwcm9wZXJ0eSB0aGF0IGl0IHJlYWRzIGFyZSByb3RhdGlvbi4KVG8gbXkgYmVzdCB1bmRlcnN0
YW5kaW5nIHRoZXNlIGFyZSBub3QgdGhlIHNhbWUuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
