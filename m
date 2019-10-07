Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18D5CF3D3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21406E267;
	Tue,  8 Oct 2019 07:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DC56E17E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 19:35:06 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMgw47ty6c="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
 with ESMTPSA id v00409v97JYnqsA
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Mon, 7 Oct 2019 21:34:49 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 5/5] drm/panel: tpo-td043mtea1: Fix SPI alias
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191007170801.27647-6-laurent.pinchart@ideasonboard.com>
Date: Mon, 7 Oct 2019 21:34:49 +0200
Message-Id: <D69D88E3-F124-452D-BD3D-DE50484FBD35@goldelico.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
 <20191007170801.27647-6-laurent.pinchart@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1570476905; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=dbFdvdKxQBL0uUdYkCNbwfdo/lUnBsJwjvDyfAJone8=;
 b=jxeAAB3NUdf5sbK5TeSrEGgw0Vvy1uLimpupbOfEe9uGkqCQJML/Gum9Aj44UgSkHd
 zwKJey29EgPwAlSFKpVcZgBVA21qWOdZyJI8gjni298pk4OHNADNOpOtA2q34xAOF+e6
 qVxF69pKUMz6WcMpnNbEt6wyKTN/XiLHFYvaok83epllMd6nFAx8VszTTCBtKsOJWw72
 jiXrsTErjZzOURR+hkPljDO8xRRC+ySm5LMFT2cmgrX3Oi1TWFbY9EuQd2EDIV0CW6+/
 8c509Ah0/WGJMTK4aU9TmTQ9+YZoG/T1DYX/GVcOu/wQQBnLkeLnW0NohX/6q0cr3Zq9
 PH0w==
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
Cc: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 thierry.reding@gmail.com, Jyri Sarha <jsarha@ti.com>,
 letux-kernel@openphoenux.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gQW0gMDcuMTAuMjAxOSB1bSAxOTowOCBzY2hyaWViIExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT46Cj4gCj4gVGhlIHBhbmVsLXRwby10ZDA0M210
ZWExIGRyaXZlciBpbmNvcnJlY3RseSBpbmNsdWRlcyB0aGUgT0YgdmVuZG9yCj4gcHJlZml4IGlu
IGl0cyBTUEkgYWxpYXMuIEZpeCBpdCwgYW5kIG1vdmUgdGhlIG1hbnVhbCBhbGlhcyB0byBhbiBT
UEkKPiBtb2R1bGUgZGV2aWNlIHRhYmxlLgo+IAo+IEZpeGVzOiBkYzJlMWU1YjI3OTkgKCJkcm0v
cGFuZWw6IEFkZCBkcml2ZXIgZm9yIHRoZSBUb3Bwb2x5IFREMDQzTVRFQTEgcGFuZWwiKQo+IFJl
cG9ydGVkLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgpUZXN0ZWQtYnk6IEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNvLmNv
bT4gIyBPcGVuUGFuZG9yYQoKPiAtLS0KPiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBv
LXRkMDQzbXRlYTEuYyB8IDkgKysrKysrKystCj4gMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtdHBvLXRkMDQzbXRlYTEuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10
cG8tdGQwNDNtdGVhMS5jCj4gaW5kZXggODQzNzA1NjI5MTBmLi5iYTE2M2M3NzkwODQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRwby10ZDA0M210ZWExLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDQzbXRlYTEuYwo+IEBAIC00
OTEsOSArNDkxLDE3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHRkMDQzbXRl
YTFfb2ZfbWF0Y2hbXSA9IHsKPiAKPiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCB0ZDA0M210ZWEx
X29mX21hdGNoKTsKPiAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfZGV2aWNlX2lkIHRkMDQz
bXRlYTFfaWRzW10gPSB7Cj4gKwl7ICJ0ZDA0M210ZWExIiwgMCB9LAo+ICsJeyAvKiBzZW50aW5l
bCAqLyB9Cj4gK307Cj4gKwo+ICtNT0RVTEVfREVWSUNFX1RBQkxFKHNwaSwgdGQwNDNtdGVhMV9p
ZHMpOwo+ICsKPiBzdGF0aWMgc3RydWN0IHNwaV9kcml2ZXIgdGQwNDNtdGVhMV9kcml2ZXIgPSB7
Cj4gCS5wcm9iZQkJPSB0ZDA0M210ZWExX3Byb2JlLAo+IAkucmVtb3ZlCQk9IHRkMDQzbXRlYTFf
cmVtb3ZlLAo+ICsJLmlkX3RhYmxlCT0gdGQwNDNtdGVhMV9pZHMsCj4gCS5kcml2ZXIJCT0gewo+
IAkJLm5hbWUJPSAicGFuZWwtdHBvLXRkMDQzbXRlYTEiLAo+IAkJLnBtCT0gJnRkMDQzbXRlYTFf
cG1fb3BzLAo+IEBAIC01MDMsNyArNTExLDYgQEAgc3RhdGljIHN0cnVjdCBzcGlfZHJpdmVyIHRk
MDQzbXRlYTFfZHJpdmVyID0gewo+IAo+IG1vZHVsZV9zcGlfZHJpdmVyKHRkMDQzbXRlYTFfZHJp
dmVyKTsKPiAKPiAtTU9EVUxFX0FMSUFTKCJzcGk6dHBvLHRkMDQzbXRlYTEiKTsKPiBNT0RVTEVf
QVVUSE9SKCJHcmHFvnZ5ZGFzIElnbm90YXMgPG5vdGFzYXNAZ21haWwuY29tPiIpOwo+IE1PRFVM
RV9ERVNDUklQVElPTigiVFBPIFREMDQzTVRFQTEgUGFuZWwgRHJpdmVyIik7Cj4gTU9EVUxFX0xJ
Q0VOU0UoIkdQTCIpOwo+IC0tIAo+IFJlZ2FyZHMsCj4gCj4gTGF1cmVudCBQaW5jaGFydAo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
