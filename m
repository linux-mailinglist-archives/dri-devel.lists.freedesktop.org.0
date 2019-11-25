Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEA2108E94
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 14:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA3B89FD7;
	Mon, 25 Nov 2019 13:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E2489FC3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 13:11:21 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPDBGGw109597;
 Mon, 25 Nov 2019 07:11:17 -0600
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAPDBGtU024160
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 25 Nov 2019 07:11:16 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 25
 Nov 2019 07:11:16 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 25 Nov 2019 07:11:16 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPDB7rn113038;
 Mon, 25 Nov 2019 07:11:14 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <tony@atomide.com>
Subject: [PATCH 4/4] ARM: dts: am57xx-idk-common: add HDMI to the common dtsi
Date: Mon, 25 Nov 2019 15:11:00 +0200
Message-ID: <20191125131100.9839-4-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125131100.9839-1-tomi.valkeinen@ti.com>
References: <20191125131100.9839-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574687477;
 bh=hbZE26zge3K89kExbsBcxPuC5nohmi4Ux2aykhezHaw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=It3k/tsO/eXRNu3D6grUmLFVsmObHbTRFCRAnI/ztmdb+hHRAK7sZopgUDDE946mQ
 f0UvEdhhmtgpRFEm/TQKcXmvjku28wkydWyt6wVR5cpDwHea6L6FIxgYb/GeUiFTGZ
 UKETNs9IDiszxrzNbB7fVQr+FvSAwkrjZ8meVJW0=
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
Cc: mark.rutland@arm.com, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QU01NzF4L0FNNTcyeC9BTTU3NHggSURLIGJhc2UgYm9hcmRzIGhhdmUgSERNSSBvdXRwdXQuIEFk
ZCBEVCBub2RlcyB0bwphbTU3eHgtaWRrLWNvbW1vbi5kdHNpIHRvIGVuYWJsZSBIRE1JLgoKU2ln
bmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KLS0tCiBh
cmNoL2FybS9ib290L2R0cy9hbTU3eHgtaWRrLWNvbW1vbi5kdHNpIHwgNTkgKysrKysrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FtNTd4eC1pZGstY29tbW9uLmR0c2kgYi9hcmNoL2FybS9i
b290L2R0cy9hbTU3eHgtaWRrLWNvbW1vbi5kdHNpCmluZGV4IDQyMzg1NWEyYTJkNi4uYTljOGYy
ODU5YWVhIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hbTU3eHgtaWRrLWNvbW1vbi5k
dHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtNTd4eC1pZGstY29tbW9uLmR0c2kKQEAgLTks
NiArOSw3IEBACiAJYWxpYXNlcyB7CiAJCXJ0YzAgPSAmdHBzNjU5MDM4X3J0YzsKIAkJcnRjMSA9
ICZydGM7CisJCWRpc3BsYXkwID0gJmhkbWkwOwogCX07CiAKIAljaG9zZW4gewpAQCAtOTYsNiAr
OTcsNDggQEAKIAkJCWRlZmF1bHQtc3RhdGUgPSAib2ZmIjsKIAkJfTsKIAl9OworCisJaGRtaTA6
IGNvbm5lY3RvckAwIHsKKwkJY29tcGF0aWJsZSA9ICJoZG1pLWNvbm5lY3RvciI7CisJCWxhYmVs
ID0gImhkbWkiOworCisJCXR5cGUgPSAiYSI7CisKKwkJcG9ydCB7CisJCQloZG1pX2Nvbm5lY3Rv
cl9pbjogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdHBkMTJzMDE1X291dD47
CisJCQl9OworCQl9OworCX07CisKKwl0cGQxMnMwMTU6IGVuY29kZXJAMCB7CisJCWNvbXBhdGli
bGUgPSAidGksdHBkMTJzMDE2IiwgInRpLHRwZDEyczAxNSI7CisKKwkJZ3Bpb3MgPSA8MD4sIC8q
IG9wdGlvbmFsIENUX0NQX0hQRCAqLworCQkJPDA+LCAvKiBvcHRpb25hbCBMU19PRSAqLworCQkJ
PCZncGlvNyAxMiBHUElPX0FDVElWRV9ISUdIPjsJLyogSFBEICovCisKKwkJcG9ydHMgeworCQkJ
I2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKworCQkJcG9ydEAw
IHsKKwkJCQlyZWcgPSA8MD47CisKKwkJCQl0cGQxMnMwMTVfaW46IGVuZHBvaW50QDAgeworCQkJ
CQlyZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWlfb3V0PjsKKwkJCQl9OworCQkJfTsKKworCQkJcG9y
dEAxIHsKKwkJCQlyZWcgPSA8MT47CisKKwkJCQl0cGQxMnMwMTVfb3V0OiBlbmRwb2ludEAwIHsK
KwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pX2Nvbm5lY3Rvcl9pbj47CisJCQkJfTsKKwkJ
CX07CisJCX07CisJfTsKIH07CiAKICZkcmE3X3BteF9jb3JlIHsKQEAgLTQ5MCwzICs1MzMsMTkg
QEAKICZjcHUwIHsKIAl2ZGQtc3VwcGx5ID0gPCZzbXBzMTJfcmVnPjsKIH07CisKKyZoZG1pIHsK
KwlzdGF0dXMgPSAib2theSI7CisKKwl2ZGRhLXN1cHBseSA9IDwmbGRvNF9yZWc+OworCisJcG9y
dCB7CisJCWhkbWlfb3V0OiBlbmRwb2ludCB7CisJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnRwZDEy
czAxNV9pbj47CisJCX07CisJfTsKK307CisKKyZkc3MgeworCXN0YXR1cyA9ICJva2F5IjsKK307
Ci0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4
MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9E
b21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
