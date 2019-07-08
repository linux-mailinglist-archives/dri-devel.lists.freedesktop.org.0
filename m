Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A480C61CE9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 12:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F5189C5E;
	Mon,  8 Jul 2019 10:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B6E89C5E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 10:27:16 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68ARBXf118524;
 Mon, 8 Jul 2019 05:27:11 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68ARBHV009832
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Jul 2019 05:27:11 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 05:27:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 05:27:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68ARAvE027118;
 Mon, 8 Jul 2019 05:27:10 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
Subject: [PATCH v2 3/4] dt-bindings: backlight: Add led-backlight binding
Date: Mon, 8 Jul 2019 12:26:59 +0200
Message-ID: <20190708102700.23138-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708102700.23138-1-jjhiblot@ti.com>
References: <20190708102700.23138-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562581631;
 bh=lMpw70wzgXRddxylMnjFZez3adtd5wWViru0eP3oWv4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Vkl7NJT5viByd33Timp5MUb/aoNybG7DPggyp1yNvT4OHO9UMX62sG+CZrQ7h62nb
 plgpHRlqe6ybCKfosDiyeGvVhsFh6ilVM74XTK/TzivuxxcbGejud4gexYWOpIYZb/
 CYTvIRUE6WGgjXum6IrR9PWm2Gk0yQ5DKkfdx5vM=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, dmurphy@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIERUIGJpbmRpbmcgZm9yIGxlZC1iYWNrbGlnaHQuCgpTaWduZWQtb2ZmLWJ5OiBKZWFuLUph
Y3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2xlZHMvYmFj
a2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IHwgMjkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNr
bGlnaHQvbGVkLWJhY2tsaWdodC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwLi40ZjU0NTMxNmIyODgKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdo
dC50eHQKQEAgLTAsMCArMSwyOSBAQAorbGVkLWJhY2tsaWdodCBiaW5kaW5ncworCitUaGlzIGJp
bmRpbmcgaXMgdXNlZCB0byBkZXNjcmliZSBhIGJhc2ljIGJhY2tsaWdodCBkZXZpY2UgbWFkZSBv
ZiBMRURzLgorSXQgY2FuIGFsc28gYmUgdXNlZCB0byBkZXNjcmliZSBhIGJhY2tsaWdodCBkZXZp
Y2UgY29udHJvbGxlZCBieSB0aGUgb3V0cHV0IG9mCithIExFRCBkcml2ZXIuCisKK1JlcXVpcmVk
IHByb3BlcnRpZXM6CisgIC0gY29tcGF0aWJsZTogImxlZC1iYWNrbGlnaHQiCisgIC0gbGVkczog
YSBsaXN0IG9mIExFRHMKKworT3B0aW9uYWwgcHJvcGVydGllczoKKyAgLSBicmlnaHRuZXNzLWxl
dmVsczogQXJyYXkgb2YgZGlzdGluY3QgYnJpZ2h0bmVzcyBsZXZlbHMuIFRoZXNlCisgICAgICAg
ICAgICAgICAgICAgICAgIGFyZSBpbiB0aGUgcmFuZ2UgZnJvbSAwIHRvIDI1NS4gVGhlIGFjdHVh
bCBicmlnaHRuZXNzCisgICAgICAgICAgICAgICAgICAgICAgIGxldmVsIHByb2dyYW1tZWQgaW4g
ZWFjaCBMRUQgd2lsbCBiZSBhZGp1c3RlZCBiYXNlZCBvbgorICAgICAgICAgICAgICAgICAgICAg
ICBpdHMgbWF4aW11bSBicmlnaHRuZXNzOgorICAgICAgICAgICAgICAgICAgICAgICBsZWQgYnJp
Z2h0bmVzcyA9IChsZXZlbCAqIG1heGltdW0gYnJpZ2h0bmVzcykgLyAyNTUKKworICAtIGRlZmF1
bHQtYnJpZ2h0bmVzcy1sZXZlbDogVGhlIGRlZmF1bHQgYnJpZ2h0bmVzcyBsZXZlbCAoaW5kZXgg
aW50byB0aGUKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFycmF5IGRlZmluZWQgYnkg
dGhlICJicmlnaHRuZXNzLWxldmVscyIgcHJvcGVydHkpLgorCitFeGFtcGxlOgorCisJYmFja2xp
Z2h0IHsKKwkJY29tcGF0aWJsZSA9ICJsZWQtYmFja2xpZ2h0IjsKKworCQlsZWRzID0gPCZsZWQx
PiwgPCZsZWQyPjsKKwkJYnJpZ2h0bmVzcy1sZXZlbHMgPSA8MCA0IDggMTYgMzIgNjQgMTI4IDI1
NT47CisJCWRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbCA9IDw2PjsKKwl9OwotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
