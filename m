Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FD212D9D
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA5B89ED6;
	Fri,  3 May 2019 12:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCB989ED6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:31:13 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CVAvg032403;
 Fri, 3 May 2019 07:31:10 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CVAlk049342
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:31:10 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:31:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:31:08 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYtu002029;
 Fri, 3 May 2019 07:31:05 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 12/23] drm/bridge: tc358767: ensure DP is disabled before LT
Date: Fri, 3 May 2019 15:29:38 +0300
Message-ID: <20190503122949.12266-13-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886670;
 bh=Efk1Ycnio9/QwgjEM+QHlSLQM9m/K9+niYYOJwjq81k=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=wAHzrFARiRE6cXiloPGTSzCYCytliDw7juNO6DDObS0VThAyfbi0dkFYEzMqBYfLh
 rb1CMSBjVxPdkKq5dxXbs8ktlhmlQD8eCfrENUGocl3/lRWlYvby12LK2oe9OG5B1/
 A6PBJ0I+a5900xaMOk2RC3xW66lLXUjI8V3ZEmhI=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGluayB0cmFpbmluZyB3aWxsIHNvbWV0aW1lcyBmYWlsIGlmIHRoZSBEUCBsaW5rIGlzIGVuYWJs
ZWQgd2hlbgp0Y19tYWluX2xpbmtfZW5hYmxlKCkgaXMgY2FsbGVkLiBUaGUgZHJpdmVyIG1ha2Vz
IHN1cmUgdGhlIERQIGxpbmsgaXMKZGlzYWJsZWQgd2hlbiB0aGUgRFAgb3V0cHV0IGlzIGRpc2Fi
bGVkLCBhbmQgd2UgbmV2ZXIgZW5hYmxlIHRoZSBEUAp3aXRob3V0IGZpcnN0IGRpc2FibGluZyBp
dCwgc28gdGhpcyBzaG91bGQgbmV2ZXIgaGFwcGVuLgoKSG93ZXZlciwgYXMgdGhlIEhXIGJlaGF2
aW9yIHNlZW1zIHRvIGJlIHNvbWV3aGF0IHJhbmRvbSBpZiBEUCBsaW5rIGhhcwplcnJvbmVvdXNs
eSBiZWVuIGxlZnQgZW5hYmxlZCwgbGV0J3MgYWRkIGEgV0FSTl9PTigpIGZvciB0aGUgY2FzZSBh
bmQKc2V0IERQMENUTCB0byAwLgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWku
dmFsa2VpbmVuQHRpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMg
fCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMKaW5kZXggODZlMmUxNmM1YTkwLi5jZWM4MjU2MDAxNTggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RjMzU4NzY3LmMKQEAgLTgzOSw2ICs4MzksMTAgQEAgc3RhdGljIGludCB0Y19tYWlu
X2xpbmtfZW5hYmxlKHN0cnVjdCB0Y19kYXRhICp0YykKIAogCWRldl9kYmcodGMtPmRldiwgImxp
bmsgZW5hYmxlXG4iKTsKIAorCXRjX3JlYWQoRFAwQ1RMLCAmdmFsdWUpOworCWlmIChXQVJOX09O
KHZhbHVlICE9IDApKQorCQl0Y193cml0ZShEUDBDVEwsIDApOworCiAJdGNfd3JpdGUoRFAwX1NS
Q0NUUkwsIHRjX3NyY2N0cmwodGMpKTsKIAkvKiBTU0NHIGFuZCBCVzI3IG9uIERQMSBtdXN0IGJl
IHNldCB0byB0aGUgc2FtZSBhcyBvbiBEUDAgKi8KIAl0Y193cml0ZShEUDFfU1JDQ1RSTCwKLS0g
ClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhl
bHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWlj
aWxlOiBIZWxzaW5raQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
