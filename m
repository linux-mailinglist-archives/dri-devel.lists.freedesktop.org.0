Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECD76B736
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62AB6E277;
	Wed, 17 Jul 2019 07:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9CC89FA7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 13:31:48 +0000 (UTC)
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-01.back.ox.d0m.de by smtp-ox.front (RZmta 44.24 AUTH)
 with ESMTPSA id h0a328v6GDVkcXc
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 16 Jul 2019 15:31:46 +0200 (CEST)
Date: Tue, 16 Jul 2019 15:31:46 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie, daniel@ffwll.ch
Message-ID: <1146567928.62608.1563283906754@webmail.strato.com>
In-Reply-To: <20190706140746.29132-18-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-18-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 17/19] drm: rcar-du: crtc: Enable and disable CMMs
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev59
X-Originating-IP: 85.212.152.154
X-Originating-Client: open-xchange-appsuite
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1563283906; 
 s=strato-dkim-0002; d=fpond.eu;
 h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=KdPMpB0y5dptUz67d+BuffnN6XjmeBJuRxebWH6cybA=;
 b=tZRbDc2J6D6cApM2NVI85OitlUHmZOn/Q/J+SleSSjxWLGE2dITRnHQQ89KOn/NMU9
 z/f9cA6y4N0CN57HS1wTkGxq/200XDriiB83v6cpu2S6E8cKb+UELOSvxFSHRuoXe3KT
 lcjzeBCTEsL52ouKANc8pafA7fXARvO/2GQq5Sg5e5M7Sf3URnx1osdVciy033Qlb/db
 PhjbxWqt0L4l1JjC/J7+1fZNwGzxj7kcK3OIFU7P97q4zRDlaMktnjkRHb2YzdV3SHvc
 1T58sqcZS84QwbChrd9usrrGLdFS1VVPvltAR/qdgZVaEGfu0gknjdMnp87MC0gHh3Do
 6F/Q==
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
c0BqbW9uZGkub3JnPiB3cm90ZToKPiAKPiAKPiBFbmFibGUvZGlzYWJsZSB0aGUgQ01NIGFzc29j
aWF0ZWQgd2l0aCBhIENSVEMgYXQgY3J0YyBzdGFydCBhbmQgc3RvcAo+IHRpbWUgYW5kIGVuYWJs
ZSB0aGUgQ01NIHVuaXQgdGhyb3VnaCB0aGUgRGlzcGxheSBFeHRlbnNpb25hbCBGdW5jdGlvbnMK
PiByZWdpc3RlciBhdCBncm91cCBzZXR1cCB0aW1lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphY29w
byBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMgIHwgNyArKysrKysrCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfZHVfZ3JvdXAuYyB8IDggKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJt
L3JjYXItZHUvcmNhcl9kdV9yZWdzLmggIHwgNSArKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDIw
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
cmNhcl9kdV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYwo+
IGluZGV4IDIzZjFkNmNjMTcxOS4uM2RhYzYwNWMzYTY3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jj
YXItZHUvcmNhcl9kdV9jcnRjLmMKPiBAQCAtMjEsNiArMjEsNyBAQAo+ICAjaW5jbHVkZSA8ZHJt
L2RybV9wbGFuZV9oZWxwZXIuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+Cj4gIAo+
ICsjaW5jbHVkZSAicmNhcl9jbW0uaCIKPiAgI2luY2x1ZGUgInJjYXJfZHVfY3J0Yy5oIgo+ICAj
aW5jbHVkZSAicmNhcl9kdV9kcnYuaCIKPiAgI2luY2x1ZGUgInJjYXJfZHVfZW5jb2Rlci5oIgo+
IEBAIC02MTksNiArNjIwLDkgQEAgc3RhdGljIHZvaWQgcmNhcl9kdV9jcnRjX3N0b3Aoc3RydWN0
IHJjYXJfZHVfY3J0YyAqcmNydGMpCj4gIAlpZiAocmNhcl9kdV9oYXMocmNydGMtPmRldiwgUkNB
Ul9EVV9GRUFUVVJFX1ZTUDFfU09VUkNFKSkKPiAgCQlyY2FyX2R1X3ZzcF9kaXNhYmxlKHJjcnRj
KTsKPiAgCj4gKwlpZiAocmNydGMtPmNtbSkKPiArCQlyY2FyX2NtbV9kaXNhYmxlKHJjcnRjLT5j
bW0pOwo+ICsKPiAgCS8qCj4gIAkgKiBTZWxlY3Qgc3dpdGNoIHN5bmMgbW9kZS4gVGhpcyBzdG9w
cyBkaXNwbGF5IG9wZXJhdGlvbiBhbmQgY29uZmlndXJlcwo+ICAJICogdGhlIEhTWU5DIGFuZCBW
U1lOQyBzaWduYWxzIGFzIGlucHV0cy4KPiBAQCAtNjg2LDYgKzY5MCw5IEBAIHN0YXRpYyB2b2lk
IHJjYXJfZHVfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAgCX0K
PiAgCj4gIAlyY2FyX2R1X2NydGNfc3RhcnQocmNydGMpOwo+ICsKPiArCWlmIChyY3J0Yy0+Y21t
KQo+ICsJCXJjYXJfY21tX2VuYWJsZShyY3J0Yy0+Y21tKTsKPiAgfQo+ICAKPiAgc3RhdGljIHZv
aWQgcmNhcl9kdV9jcnRjX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5jIGIvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5jCj4gaW5kZXggOWVlZTQ3OTY5ZTc3
Li5kMjUyYzliYjk4MDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9kdV9ncm91cC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91
cC5jCj4gQEAgLTE0Nyw2ICsxNDcsMTQgQEAgc3RhdGljIHZvaWQgcmNhcl9kdV9ncm91cF9zZXR1
cChzdHJ1Y3QgcmNhcl9kdV9ncm91cCAqcmdycCkKPiAgCj4gIAlyY2FyX2R1X2dyb3VwX3NldHVw
X3BpbnMocmdycCk7Cj4gIAo+ICsJaWYgKHJjYXJfZHVfaGFzKHJjZHUsIFJDQVJfRFVfRkVBVFVS
RV9DTU0pKSB7Cj4gKwkJdTMyIGRlZnI3ID0gREVGUjdfQ09ERSB8Cj4gKwkJCSAgICAocmdycC0+
Y21tc19tYXNrICYgQklUKDEpID8gREVGUjdfQ01NRTEgOiAwKSB8Cj4gKwkJCSAgICAocmdycC0+
Y21tc19tYXNrICYgQklUKDApID8gREVGUjdfQ01NRTAgOiAwKTsKPiArCj4gKwkJcmNhcl9kdV9n
cm91cF93cml0ZShyZ3JwLCBERUZSNywgZGVmcjcpOwo+ICsJfQo+ICsKPiAgCWlmIChyY2R1LT5p
bmZvLT5nZW4gPj0gMikgewo+ICAJCXJjYXJfZHVfZ3JvdXBfc2V0dXBfZGVmcjgocmdycCk7Cj4g
IAkJcmNhcl9kdV9ncm91cF9zZXR1cF9kaWRzcihyZ3JwKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9yZWdzLmggYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2R1X3JlZ3MuaAo+IGluZGV4IGJjODdmMDgwYjE3MC4uZmI5OTY0OTQ5MzY4IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcmVncy5oCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9yZWdzLmgKPiBAQCAtMTk3LDYgKzE5Nywx
MSBAQAo+ICAjZGVmaW5lIERFRlI2X01MT1MxCQkoMSA8PCAyKQo+ICAjZGVmaW5lIERFRlI2X0RF
RkFVTFQJCShERUZSNl9DT0RFIHwgREVGUjZfVENORTEpCj4gIAo+ICsjZGVmaW5lIERFRlI3CQkJ
MHgwMDBlYwo+ICsjZGVmaW5lIERFRlI3X0NPREUJCSgweDc3NzkgPDwgMTYpCj4gKyNkZWZpbmUg
REVGUjdfQ01NRTEJCUJJVCg2KQo+ICsjZGVmaW5lIERFRlI3X0NNTUUwCQlCSVQoNCkKPiArCgpS
ZXZpZXdlZC1ieTogVWxyaWNoIEhlY2h0IDx1bGkrcmVuZXNhc0BmcG9uZC5ldT4KCkNVClVsaQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
