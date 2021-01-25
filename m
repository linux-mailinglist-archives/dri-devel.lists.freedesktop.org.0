Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE5D3028F0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 18:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E44D896DD;
	Mon, 25 Jan 2021 17:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9803896DD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 17:32:37 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1l45j9-0006qT-Q9; Mon, 25 Jan 2021 18:32:35 +0100
Message-ID: <fc50ea1f9a53d0898817ff86d692e88d177af419.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: dump: fix sparse warnings
From: Lucas Stach <l.stach@pengutronix.de>
To: Marc Kleine-Budde <mkl@pengutronix.de>, dri-devel@lists.freedesktop.org
Date: Mon, 25 Jan 2021 18:32:35 +0100
In-Reply-To: <20201223195110.2264558-1-mkl@pengutronix.de>
References: <20201223195110.2264558-1-mkl@pengutronix.de>
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIGRlbSAyMy4xMi4yMDIwIHVtIDIwOjUxICswMTAwIHNjaHJpZWIgTWFyYyBL
bGVpbmUtQnVkZGU6Cj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgZm9sbG93aW5nIHNwYXJzZSB3YXJu
aW5ncywgYnkgYWRkaW5nIHRoZSBtaXNzaW5nIGVuZGlhbmVzcwo+IGNvbnZlcnNpb24gZnVuY3Rp
b25zLgo+IAo+ID4gZXRuYXZpdi9ldG5hdml2X2R1bXAuYzo3ODoyNjogd2FybmluZzogcmVzdHJp
Y3RlZCBfX2xlMzIgZGVncmFkZXMgdG8gaW50ZWdlcgo+ID4gZXRuYXZpdi9ldG5hdml2X2R1bXAu
Yzo4ODoyNjogd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gYXNzaWdubWVudCAoZGlmZmVyZW50
IGJhc2UgdHlwZXMpCj4gPiBldG5hdml2L2V0bmF2aXZfZHVtcC5jOjg4OjI2OiAgICBleHBlY3Rl
ZCByZXN0cmljdGVkIF9fbGUzMiBbdXNlcnR5cGVdIHJlZwo+ID4gZXRuYXZpdi9ldG5hdml2X2R1
bXAuYzo4ODoyNjogICAgZ290IHVuc2lnbmVkIHNob3J0IGNvbnN0Cj4gPiBldG5hdml2L2V0bmF2
aXZfZHVtcC5jOjg5OjI4OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25tZW50IChk
aWZmZXJlbnQgYmFzZSB0eXBlcykKPiA+IGV0bmF2aXYvZXRuYXZpdl9kdW1wLmM6ODk6Mjg6ICAg
IGV4cGVjdGVkIHJlc3RyaWN0ZWQgX19sZTMyIFt1c2VydHlwZV0gdmFsdWUKPiA+IGV0bmF2aXYv
ZXRuYXZpdl9kdW1wLmM6ODk6Mjg6ICAgIGdvdCB1bnNpZ25lZCBpbnQKPiA+IGV0bmF2aXYvZXRu
YXZpdl9kdW1wLmM6MjEwOjQzOiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25tZW50
IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKPiA+IGV0bmF2aXYvZXRuYXZpdl9kdW1wLmM6MjEwOjQz
OiAgICBleHBlY3RlZCByZXN0cmljdGVkIF9fbGUzMgo+ID4gZXRuYXZpdi9ldG5hdml2X2R1bXAu
YzoyMTA6NDM6ICAgIGdvdCBsb25nCgpUaGFua3MsIEkndmUgYWRkZWQgdGhpcyBwYXRjaCB0byBt
eSBldG5hdml2L25leHQgYnJhbmNoLgoKUmVnYXJkcywKTHVjYXMKCj4gU2lnbmVkLW9mZi1ieTog
TWFyYyBLbGVpbmUtQnVkZGUgPG1rbEBwZW5ndXRyb25peC5kZT4KPiAtLS0KPiDCoGRyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jIHwgOCArKysrLS0tLQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kdW1wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZXRuYXZpdi9ldG5hdml2X2R1bXAuYwo+IGluZGV4IDcwNmFmMDMwNGNhNC4uZjQxOGUwYjc1Nzcy
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kdW1wLmMKPiBAQCAtNzUsNyAr
NzUsNyBAQCBzdGF0aWMgdm9pZCBldG5hdml2X2NvcmVfZHVtcF9oZWFkZXIoc3RydWN0IGNvcmVf
ZHVtcF9pdGVyYXRvciAqaXRlciwKPiDCoAloZHItPmZpbGVfc2l6ZSA9IGNwdV90b19sZTMyKGRh
dGFfZW5kIC0gaXRlci0+ZGF0YSk7Cj4gwqAKPiAKPiAKPiAKPiDCoAlpdGVyLT5oZHIrKzsKPiAt
CWl0ZXItPmRhdGEgKz0gaGRyLT5maWxlX3NpemU7Cj4gKwlpdGVyLT5kYXRhICs9IGxlMzJfdG9f
Y3B1KGhkci0+ZmlsZV9zaXplKTsKPiDCoH0KPiDCoAo+IAo+IAo+IAo+IMKgc3RhdGljIHZvaWQg
ZXRuYXZpdl9jb3JlX2R1bXBfcmVnaXN0ZXJzKHN0cnVjdCBjb3JlX2R1bXBfaXRlcmF0b3IgKml0
ZXIsCj4gQEAgLTg1LDggKzg1LDggQEAgc3RhdGljIHZvaWQgZXRuYXZpdl9jb3JlX2R1bXBfcmVn
aXN0ZXJzKHN0cnVjdCBjb3JlX2R1bXBfaXRlcmF0b3IgKml0ZXIsCj4gwqAJdW5zaWduZWQgaW50
IGk7Cj4gwqAKPiAKPiAKPiAKPiDCoAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShldG5hdml2
X2R1bXBfcmVnaXN0ZXJzKTsgaSsrLCByZWcrKykgewo+IC0JCXJlZy0+cmVnID0gZXRuYXZpdl9k
dW1wX3JlZ2lzdGVyc1tpXTsKPiAtCQlyZWctPnZhbHVlID0gZ3B1X3JlYWQoZ3B1LCBldG5hdml2
X2R1bXBfcmVnaXN0ZXJzW2ldKTsKPiArCQlyZWctPnJlZyA9IGNwdV90b19sZTMyKGV0bmF2aXZf
ZHVtcF9yZWdpc3RlcnNbaV0pOwo+ICsJCXJlZy0+dmFsdWUgPSBjcHVfdG9fbGUzMihncHVfcmVh
ZChncHUsIGV0bmF2aXZfZHVtcF9yZWdpc3RlcnNbaV0pKTsKPiDCoAl9Cj4gwqAKPiAKPiAKPiAK
PiDCoAlldG5hdml2X2NvcmVfZHVtcF9oZWFkZXIoaXRlciwgRVREVU1QX0JVRl9SRUcsIHJlZyk7
Cj4gQEAgLTIwNyw3ICsyMDcsNyBAQCB2b2lkIGV0bmF2aXZfY29yZV9kdW1wKHN0cnVjdCBldG5h
dml2X2dlbV9zdWJtaXQgKnN1Ym1pdCkKPiDCoAkJaWYgKCFJU19FUlIocGFnZXMpKSB7Cj4gwqAJ
CQlpbnQgajsKPiDCoAo+IAo+IAo+IAo+IC0JCQlpdGVyLmhkci0+ZGF0YVswXSA9IGJvbWFwIC0g
Ym9tYXBfc3RhcnQ7Cj4gKwkJCWl0ZXIuaGRyLT5kYXRhWzBdID0gY3B1X3RvX2xlMzIoKGJvbWFw
IC0gYm9tYXBfc3RhcnQpKTsKPiDCoAo+IAo+IAo+IAo+IMKgCQkJZm9yIChqID0gMDsgaiA8IG9i
ai0+YmFzZS5zaXplID4+IFBBR0VfU0hJRlQ7IGorKykKPiDCoAkJCQkqYm9tYXArKyA9IGNwdV90
b19sZTY0KHBhZ2VfdG9fcGh5cygqcGFnZXMrKykpOwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
