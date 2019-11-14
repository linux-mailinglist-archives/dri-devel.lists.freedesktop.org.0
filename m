Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81804FC2C7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 10:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B846E151;
	Thu, 14 Nov 2019 09:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D4E6E151
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 09:40:06 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAE9e0YZ019154;
 Thu, 14 Nov 2019 03:40:00 -0600
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE9e0jm123194;
 Thu, 14 Nov 2019 03:40:00 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 03:40:00 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 03:40:00 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE9dtjo085959;
 Thu, 14 Nov 2019 03:39:58 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/3] ARM: dts: am437x-gp/epos-evm: fix panel compatible
Date: Thu, 14 Nov 2019 11:39:48 +0200
Message-ID: <20191114093950.4101-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191114093950.4101-1-tomi.valkeinen@ti.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1573724400;
 bh=ffkeX6mdwxyykH72z4GaUtOqVyjQZnW9Elst+Vfo44Y=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=R1p6Opm4zug9n/3wz0nSRwgJG5YjF0A4Jm7n3sxBAyqUm/gZKDi+CzCQ5QZAW5uEs
 yLHf80Qzf4LChtFc2dQ+GgQmBpwa3F3LV0eZqzc5iJZ+jlsQRLAMTcodR+3VmNS34L
 JHlAdScicpKykLk55Aeir/NCN7DTuxnq5oMImxjo=
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIExDRCBwYW5lbCBvbiBBTTQgR1AgRVZNcyBhbmQgZVBPUyBib2FyZHMgc2VlbXMgdG8gYmUK
b3NkMDcwdDE3MTgtMTl0cy4gVGhlIGN1cnJlbnQgZHRzIGZpbGVzIHNheSBvc2QwNTdUMDU1OS0z
NHRzLiBQb3NzaWJseQp0aGUgcGFuZWwgaGFzIGNoYW5nZWQgc2luY2UgdGhlIGVhcmx5IEVWTXMs
IG9yIHRoZXJlIGhhcyBiZWVuIGEgbWlzdGFrZQp3aXRoIHRoZSBwYW5lbCB0eXBlLgoKVXBkYXRl
IHRoZSBEVCBmaWxlcyBhY2NvcmRpbmdseS4KClNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVu
IDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvYW00Mzd4LWdw
LWV2bS5kdHMgIHwgMiArLQogYXJjaC9hcm0vYm9vdC9kdHMvYW00M3gtZXBvcy1ldm0uZHRzIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYW00Mzd4LWdwLWV2bS5kdHMgYi9hcmNoL2Fy
bS9ib290L2R0cy9hbTQzN3gtZ3AtZXZtLmR0cwppbmRleCBjYWU0NTAwMTk0ZmUuLjgxMWM4Y2Fl
MzE1YiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYW00Mzd4LWdwLWV2bS5kdHMKKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvYW00Mzd4LWdwLWV2bS5kdHMKQEAgLTg2LDcgKzg2LDcgQEAK
IAkJfTsKIAogCWxjZDA6IGRpc3BsYXkgewotCQljb21wYXRpYmxlID0gIm9zZGRpc3BsYXlzLG9z
ZDA1N1QwNTU5LTM0dHMiLCAicGFuZWwtZHBpIjsKKwkJY29tcGF0aWJsZSA9ICJvc2RkaXNwbGF5
cyxvc2QwNzB0MTcxOC0xOXRzIiwgInBhbmVsLWRwaSI7CiAJCWxhYmVsID0gImxjZCI7CiAKIAkJ
YmFja2xpZ2h0ID0gPCZsY2RfYmw+OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYW00
M3gtZXBvcy1ldm0uZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvYW00M3gtZXBvcy1ldm0uZHRzCmlu
ZGV4IDk1MzE0MTIxZDExMS4uMDc4Y2I0NzNmYTdkIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290
L2R0cy9hbTQzeC1lcG9zLWV2bS5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYW00M3gtZXBv
cy1ldm0uZHRzCkBAIC00Miw3ICs0Miw3IEBACiAJfTsKIAogCWxjZDA6IGRpc3BsYXkgewotCQlj
b21wYXRpYmxlID0gIm9zZGRpc3BsYXlzLG9zZDA1N1QwNTU5LTM0dHMiLCAicGFuZWwtZHBpIjsK
KwkJY29tcGF0aWJsZSA9ICJvc2RkaXNwbGF5cyxvc2QwNzB0MTcxOC0xOXRzIiwgInBhbmVsLWRw
aSI7CiAJCWxhYmVsID0gImxjZCI7CiAKIAkJYmFja2xpZ2h0ID0gPCZsY2RfYmw+OwotLSAKVGV4
YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lu
a2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6
IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
