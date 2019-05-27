Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D2C2B6F5
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 15:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4B36E21B;
	Mon, 27 May 2019 13:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022066E216
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 13:48:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RDm3H7012480;
 Mon, 27 May 2019 08:48:03 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RDm2bt095715
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 08:48:02 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 08:48:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 08:48:00 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RDlviD065947;
 Mon, 27 May 2019 08:47:58 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 0/6] drm/bridge: sii902x: HDMI-audio support and some fixes
Date: Mon, 27 May 2019 16:47:51 +0300
Message-ID: <cover.1558964241.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1558964883;
 bh=sXYcD4XMlQBXTBpB0CQsMmBf9Lno5Nysqf8Tnwt8Cjk=;
 h=From:To:CC:Subject:Date;
 b=m2GaaM/spxeU5LaWXMCB+1hw3hKwko9mDalNCrSwdtKN1xrRhy6VxgMnqd5VaAKBf
 ibOYXUjCYhJF19tjI+wXHSGo+xkz7QR4Qu0i+vHFGkBIqFger4ftDQzSuAW/9tCxwe
 Q+kWWkQw1z2GJfCx5L7VCulFTAsfILDyQRxFuML8=
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

SSB0aGluayB0aGVzZSBzaG91bGQgYmUgcmVhZHkgZm9yIGFwcGx5aW5nIHRvIGRybS1taXNjLgoK
Q2hhbmdlcyBzaW5jZSB2NzoKIC0gRGViYXNlZCBvbiB0b3Agb2YgdGhlIGxhc3RzIGRybS1taXNj
LW5leHQgYW5kIHRlc3RlZAogLSAiZHQtYmluZGluZ3M6IGRpc3BsYXk6IHNpaTkwMng6IEFkZCBI
RE1JIGF1ZGlvIGJpbmRpbmdzIgogICAtIERyb3BwZWQgb2ZmICJvciBoaWdoZXIgdG8gYXZvaWQg
Y29uZmxpY3Qgd2l0aCB2aWRlbyBwb3J0cyIKICAgICBhbmQgYWRkZWQgIlJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiIKClRoZXIgcHJldmlvdXMgcm91bmQ6Cmh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTA5MTkxNzMvCgpKeXJpIFNhcmhhICg1KToK
ICBkcm0vYnJpZGdlOiBzaWk5MDJ4OiBTZXQgb3V0cHV0IG1vZGUgdG8gSERNSSBvciBEVkkgYWNj
b3JkaW5nIHRvIEVESUQKICBkcm0vYnJpZGdlOiBzaWk5MDJ4OiBwaXhlbCBjbG9jayB1bml0IGlz
IDEwa0h6IGluc3RlYWQgb2YgMWtIegogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBzaWk5MDJ4OiBS
ZW1vdmUgdHJhaWxpbmcgd2hpdGUgc3BhY2UKICBkdC1iaW5kaW5nczogZGlzcGxheTogc2lpOTAy
eDogQWRkIEhETUkgYXVkaW8gYmluZGluZ3MKICBkcm0vYnJpZGdlOiBzaWk5MDJ4OiBJbXBsZW1l
bnQgSERNSSBhdWRpbyBzdXBwb3J0CgpUb21pIFZhbGtlaW5lbiAoMSk6CiAgZHJtL2JyaWRnZTog
c2lpOTAyeDogYWRkIGlucHV0X2J1c19mbGFncwoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9zaWk5MDJ4LnR4dCAgICAgICB8ICA0MiArLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5
MDJ4LmMgICAgICAgICAgICAgIHwgNDg4ICsrKysrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFu
Z2VkLCA1MjIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCi0tIApUZXhhcyBJbnN0cnVt
ZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4gWS10dW5u
dXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
