Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2401E10D7D4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 16:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A412D6E92E;
	Fri, 29 Nov 2019 15:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8CE6E92E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 15:23:45 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xATFNis8030613;
 Fri, 29 Nov 2019 09:23:44 -0600
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xATFNijS111907
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 29 Nov 2019 09:23:44 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 29
 Nov 2019 09:23:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 29 Nov 2019 09:23:44 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xATFNgl2051477;
 Fri, 29 Nov 2019 09:23:43 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/bridge: sii902x: Select SND_SOC_HDMI_CODEC if SND_SOC is
 configured
Date: Fri, 29 Nov 2019 17:23:42 +0200
Message-ID: <20191129152342.29145-1-jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575041024;
 bh=9OxaceF7239AT78D5kxAr+eWP0u53XPuA2Op0JcSVd0=;
 h=From:To:CC:Subject:Date;
 b=f5KKuKh7b+XZzFA4JFHJq2GtupikS5+nWA4mFi9NZeppO2yYkj97N2zxcnZ1blwfK
 wz8BObd0+pd85ewNDFSgz3ff3df1+GMRHKefE5ccOXTD53wnKAYFwqIAWHiYMzOhyV
 7Ibc1stRBBz61vsb62Jijia11TE7Z13gM1krUK5E=
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
Cc: peter.ujfalusi@ti.com, tomi.valkeinen@ti.com, thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gZW5hYmxlIEhETUkgYXVkaW8gdGhlIFNORF9TT0NfSERNSV9DT0RFQyBuZWVkcyB0byBiZQpj
b25maWd1cmVkLiBFbmFibGUgSERNSSBhdWRpbyBieSBzZWxlY3RpbmcgU05EX1NPQ19IRE1JX0NP
REVDIGlmClNORF9TT0MgaXMgY29uZmlndXJlZC4gU05EX1NPQ19IRE1JX0NPREVDIGhhcyBubyBj
b25maWcgbWVudSBlbnRyeSBhbmQKc2hvdWxkIGJlIHNlbGVjdGVkIGF0b21hdGljYWxseSBieSB0
aGUgZHJpdmVycyB1c2luZyBpdC4KClNpZ25lZC1vZmYtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0
aS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKaW5kZXggMjZmZjA3
YWQyODdiLi4wYTYwYTU2Y2U2ZGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
S2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKQEAgLTExOCw2ICsx
MTgsNyBAQCBjb25maWcgRFJNX1NJSTkwMlgKIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKIAlzZWxl
Y3QgUkVHTUFQX0kyQwogCXNlbGVjdCBJMkNfTVVYCisJc2VsZWN0IFNORF9TT0NfSERNSV9DT0RF
QyBpZiBTTkRfU09DCiAJLS0taGVscC0tLQogCSAgU2lsaWNvbiBJbWFnZSBzaWk5MDJ4IGJyaWRn
ZSBjaGlwIGRyaXZlci4KIAotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2th
bGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuIFktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIx
LTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
