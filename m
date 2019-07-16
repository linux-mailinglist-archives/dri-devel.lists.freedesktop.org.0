Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0D16B733
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A17E6E26D;
	Wed, 17 Jul 2019 07:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F5F89C6C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 13:18:31 +0000 (UTC)
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-01.back.ox.d0m.de by smtp-ox.front (RZmta 44.24 AUTH)
 with ESMTPSA id h0a328v6GDITcPy
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 16 Jul 2019 15:18:29 +0200 (CEST)
Date: Tue, 16 Jul 2019 15:18:29 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie, daniel@ffwll.ch
Message-ID: <1992958141.61517.1563283109549@webmail.strato.com>
In-Reply-To: <20190706140746.29132-16-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-16-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 15/19] drm: rcar-du: Claim CMM support for Gen3 SoCs
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev59
X-Originating-IP: 85.212.152.154
X-Originating-Client: open-xchange-appsuite
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1563283109; 
 s=strato-dkim-0002; d=fpond.eu;
 h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Vbkrp6w7m4D6pHF3/AKyST3n0EHCDNA9AqE+moGYREY=;
 b=eNMDRwL0Tmy2ae924gccbrjpsCQYxgPK8D3Yw9nTBctDCHx0i08nwjDKxIHbAJfNVj
 B/e8DWpJRH3d7XTNhLJyV5E/FOiRGa+7YKVx9loFoS2m0Hf8iORECAKpvgtO1PQHPaSz
 R5scEnNnA7Gr8u7zdOsbqioPP7mPaLW1ztCk/RA9+iI+8J45Imnh7WaWQMsmQibo91Co
 T34Dv+GLrYUnEHJ7sSeQJZx/mb8Hiu3/l08uzAS3OhR3YVfi+xqCr8UD3qiFUOpPB53b
 pNJ9GthjYrFf2j0dW/A9r0CbV7+SbWrl+p1VOg6D73qzE/AjTBRF3Nb4CwyauUr7WN+F
 XENQ==
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
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gT24gSnVseSA2LCAyMDE5IGF0IDQ6MDcgUE0gSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNh
c0BqbW9uZGkub3JnPiB3cm90ZToKPiAKPiAKPiBBZGQgQ01NIHRvIHRoZSBsaXN0IG9mIHN1cHBv
cnRlZCBmZWF0dXJlcyBmb3IgR2VuMyBTb0NzIHRoYXQgcHJvdmlkZSBpdDoKPiAtIFI4QTc3OTUK
PiAtIFI4QTc3OTYKPiAtIFI4QTc3OTY1Cj4gLSBSOEE3Nzk5eAo+IAo+IExlYXZlIFI4QTc3OTcw
IG91dCBhcyBWM00gYW5kIFYzSCBhcmUgdGhlIG9ubHkgR2VuMyBTb0NzIHRoYXQgZG8gbm90Cj4g
c3VwcG9ydCBDTU0uCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVu
ZXNhc0BqbW9uZGkub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1
X2Rydi5jIHwgMTIgKysrKysrKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfZHJ2LmggfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2Fy
X2R1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYwo+IGluZGV4
IDc1YWIxN2FmMTNhOS4uMWU2OWNmYTExNzk4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9y
Y2FyX2R1X2Rydi5jCj4gQEAgLTI0Nyw3ICsyNDcsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJj
YXJfZHVfZGV2aWNlX2luZm8gcmNhcl9kdV9yOGE3Nzk1X2luZm8gPSB7Cj4gIAkuZmVhdHVyZXMg
PSBSQ0FSX0RVX0ZFQVRVUkVfQ1JUQ19JUlFfQ0xPQ0sKPiAgCQkgIHwgUkNBUl9EVV9GRUFUVVJF
X1ZTUDFfU09VUkNFCj4gIAkJICB8IFJDQVJfRFVfRkVBVFVSRV9JTlRFUkxBQ0VECj4gLQkJICB8
IFJDQVJfRFVfRkVBVFVSRV9UVk1fU1lOQywKPiArCQkgIHwgUkNBUl9EVV9GRUFUVVJFX1RWTV9T
WU5DCj4gKwkJICB8IFJDQVJfRFVfRkVBVFVSRV9DTU0sCj4gIAkuY2hhbm5lbHNfbWFzayA9IEJJ
VCgzKSB8IEJJVCgyKSB8IEJJVCgxKSB8IEJJVCgwKSwKPiAgCS5yb3V0ZXMgPSB7Cj4gIAkJLyoK
PiBAQCAtMjgwLDcgKzI4MSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmNhcl9kdV9kZXZpY2Vf
aW5mbyByY2FyX2R1X3I4YTc3OTZfaW5mbyA9IHsKPiAgCS5mZWF0dXJlcyA9IFJDQVJfRFVfRkVB
VFVSRV9DUlRDX0lSUV9DTE9DSwo+ICAJCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfVlNQMV9TT1VSQ0UK
PiAgCQkgIHwgUkNBUl9EVV9GRUFUVVJFX0lOVEVSTEFDRUQKPiAtCQkgIHwgUkNBUl9EVV9GRUFU
VVJFX1RWTV9TWU5DLAo+ICsJCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfVFZNX1NZTkMKPiArCQkgIHwg
UkNBUl9EVV9GRUFUVVJFX0NNTSwKPiAgCS5jaGFubmVsc19tYXNrID0gQklUKDIpIHwgQklUKDEp
IHwgQklUKDApLAo+ICAJLnJvdXRlcyA9IHsKPiAgCQkvKgo+IEBAIC0zMDksNyArMzExLDggQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCByY2FyX2R1X2RldmljZV9pbmZvIHJjYXJfZHVfcjhhNzc5NjVf
aW5mbyA9IHsKPiAgCS5mZWF0dXJlcyA9IFJDQVJfRFVfRkVBVFVSRV9DUlRDX0lSUV9DTE9DSwo+
ICAJCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfVlNQMV9TT1VSQ0UKPiAgCQkgIHwgUkNBUl9EVV9GRUFU
VVJFX0lOVEVSTEFDRUQKPiAtCQkgIHwgUkNBUl9EVV9GRUFUVVJFX1RWTV9TWU5DLAo+ICsJCSAg
fCBSQ0FSX0RVX0ZFQVRVUkVfVFZNX1NZTkMKPiArCQkgIHwgUkNBUl9EVV9GRUFUVVJFX0NNTSwK
PiAgCS5jaGFubmVsc19tYXNrID0gQklUKDMpIHwgQklUKDEpIHwgQklUKDApLAo+ICAJLnJvdXRl
cyA9IHsKPiAgCQkvKgo+IEBAIC0zNTcsNyArMzYwLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBy
Y2FyX2R1X2RldmljZV9pbmZvIHJjYXJfZHVfcjhhNzc5NzBfaW5mbyA9IHsKPiAgc3RhdGljIGNv
bnN0IHN0cnVjdCByY2FyX2R1X2RldmljZV9pbmZvIHJjYXJfZHVfcjhhNzc5OXhfaW5mbyA9IHsK
PiAgCS5nZW4gPSAzLAo+ICAJLmZlYXR1cmVzID0gUkNBUl9EVV9GRUFUVVJFX0NSVENfSVJRX0NM
T0NLCj4gLQkJICB8IFJDQVJfRFVfRkVBVFVSRV9WU1AxX1NPVVJDRSwKPiArCQkgIHwgUkNBUl9E
VV9GRUFUVVJFX1ZTUDFfU09VUkNFCj4gKwkJICB8IFJDQVJfRFVfRkVBVFVSRV9DTU0sCj4gIAku
Y2hhbm5lbHNfbWFzayA9IEJJVCgxKSB8IEJJVCgwKSwKPiAgCS5yb3V0ZXMgPSB7Cj4gIAkJLyoK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmgKPiBpbmRleCAxMzI3Y2QwZGY5MGEu
LmEwMGRjY2M0NDdhYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2Fy
X2R1X2Rydi5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuaAo+
IEBAIC0yOCw2ICsyOCw3IEBAIHN0cnVjdCByY2FyX2R1X2VuY29kZXI7Cj4gICNkZWZpbmUgUkNB
Ul9EVV9GRUFUVVJFX1ZTUDFfU09VUkNFCUJJVCgxKQkvKiBIYXMgaW5wdXRzIGZyb20gVlNQMSAq
Lwo+ICAjZGVmaW5lIFJDQVJfRFVfRkVBVFVSRV9JTlRFUkxBQ0VECUJJVCgyKQkvKiBIVyBzdXBw
b3J0cyBpbnRlcmxhY2VkICovCj4gICNkZWZpbmUgUkNBUl9EVV9GRUFUVVJFX1RWTV9TWU5DCUJJ
VCgzKQkvKiBIYXMgVFYgc3dpdGNoL3N5bmMgbW9kZXMgKi8KPiArI2RlZmluZSBSQ0FSX0RVX0ZF
QVRVUkVfQ01NCQlCSVQoNCkJLyogSGFzIENNTSAqLwo+ICAKPiAgI2RlZmluZSBSQ0FSX0RVX1FV
SVJLX0FMSUdOXzEyOEIJQklUKDApCS8qIEFsaWduIHBpdGNoZXMgdG8gMTI4IGJ5dGVzICovCj4g
IAo+IC0tIAo+IDIuMjEuMAo+CgpSZXZpZXdlZC1ieTogVWxyaWNoIEhlY2h0IDx1bGkrcmVuZXNh
c0BmcG9uZC5ldT4KCkNVClVsaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
