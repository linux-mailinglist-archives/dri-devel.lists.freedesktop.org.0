Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DFF2B6E9
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 15:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049516E218;
	Mon, 27 May 2019 13:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1996E216
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 13:48:13 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RDm68Y073368;
 Mon, 27 May 2019 08:48:06 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RDm6xC054858
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 08:48:06 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 08:48:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 08:48:04 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RDlviF065947;
 Mon, 27 May 2019 08:48:02 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 2/6] drm/bridge: sii902x: Set output mode to HDMI or DVI
 according to EDID
Date: Mon, 27 May 2019 16:47:53 +0300
Message-ID: <c42838073b83185a5cf9949caab3c70ee093b791.1558964241.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1558964241.git.jsarha@ti.com>
References: <cover.1558964241.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1558964886;
 bh=Hf8IFHndzk4D6oqYha5f5/8yYRj5fgQTA/zOXHmnD2s=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=GyzUuE8DUCwo1pogTWF8uek1L63iZTVcZKPiu1iQUQ1fWkBeLSW/4r3PW1kL6+Lax
 iK5y31Ik6dhiV0RVKFqGuiu4NzHynba9GoPc1LiuwzXjR1Ot47ftL4oseyxAAXU8tR
 WKEE0uAtZp/DYr1soZyH+KIvgAJJ+ZswVP6y9ywA=
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
Cc: peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V0IG91dHB1dCBtb2RlIHRvIEhETUkgb3IgRFZJIGFjY29yZGluZyB0byBFRElEIEhETUkgc2ln
bmF0dXJlLgoKU2lnbmVkLW9mZi1ieTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KUmV2aWV3
ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+ClJldmlld2VkLWJ5OiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgfCA5ICsrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKaW5kZXggMGQz
ZDczMGI5N2ZmLi4xMjhkOGZkYjRiYTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc2lpOTAyeC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCkBAIC0x
ODEsMTIgKzE4MSwxNiBAQCBzdGF0aWMgaW50IHNpaTkwMnhfZ2V0X21vZGVzKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IpCiB7CiAJc3RydWN0IHNpaTkwMnggKnNpaTkwMnggPSBjb25u
ZWN0b3JfdG9fc2lpOTAyeChjb25uZWN0b3IpOwogCXUzMiBidXNfZm9ybWF0ID0gTUVESUFfQlVT
X0ZNVF9SR0I4ODhfMVgyNDsKKwl1OCBvdXRwdXRfbW9kZSA9IFNJSTkwMlhfU1lTX0NUUkxfT1VU
UFVUX0RWSTsKIAlzdHJ1Y3QgZWRpZCAqZWRpZDsKIAlpbnQgbnVtID0gMCwgcmV0OwogCiAJZWRp
ZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIHNpaTkwMngtPmkyY211eC0+YWRhcHRlclswXSk7
CiAJZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eShjb25uZWN0b3IsIGVkaWQpOwog
CWlmIChlZGlkKSB7CisJICAgICAgICBpZiAoZHJtX2RldGVjdF9oZG1pX21vbml0b3IoZWRpZCkp
CisJCQlvdXRwdXRfbW9kZSA9IFNJSTkwMlhfU1lTX0NUUkxfT1VUUFVUX0hETUk7CisKIAkJbnVt
ID0gZHJtX2FkZF9lZGlkX21vZGVzKGNvbm5lY3RvciwgZWRpZCk7CiAJCWtmcmVlKGVkaWQpOwog
CX0KQEAgLTE5Niw2ICsyMDAsMTEgQEAgc3RhdGljIGludCBzaWk5MDJ4X2dldF9tb2RlcyhzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAK
KwlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoc2lpOTAyeC0+cmVnbWFwLCBTSUk5MDJYX1NZU19D
VFJMX0RBVEEsCisJCQkJIFNJSTkwMlhfU1lTX0NUUkxfT1VUUFVUX01PREUsIG91dHB1dF9tb2Rl
KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCiAJcmV0dXJuIG51bTsKIH0KIAotLSAKVGV4
YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lu
a2kuIFktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6
IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
