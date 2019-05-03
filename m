Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA312DA4
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06B689F3C;
	Fri,  3 May 2019 12:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CEF89155
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:31:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CVQQE098058;
 Fri, 3 May 2019 07:31:26 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CVQRE122309
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:31:26 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:31:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:31:26 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYu3002029;
 Fri, 3 May 2019 07:31:23 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 19/23] drm/bridge: tc358767: remove tc_connector_best_encoder
Date: Fri, 3 May 2019 15:29:45 +0300
Message-ID: <20190503122949.12266-20-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886686;
 bh=H0rmjFZZ+gyBLGyVNofOYdYtxpoFAb/EGTY9YbDjcEw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=YayZmUZ8VyNQ4nT5fXxnC4oBjaGEHelH0auwdh/llyzQLoWGtDc9jDzPZpqDEZyG0
 fKRo5Ypj6muTYiCf98KGTk4FanoRp1hrbSzDzueiM3eqbpsqbyUilT0/wjVYTVtsXx
 FmhxxssaGL1aamMgSWdqpmp4AuAFUi1RP4WNcfyQ=
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

ZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MuYmVzdF9lbmNvZGVyIGlzIG9ubHkgbmVlZGVkIHdo
ZW4gdGhlCmNvbm5lY3RvciBjYW4gaGF2ZSBtb3JlIHRoYW4gb25lIGVuY29kZXIsIGFuZCB0aGF0
IGlzIG5ldmVyIHRoZSBjYXNlCmhlcmUuCgpTbyByZW1vdmUgdGNfY29ubmVjdG9yX2Jlc3RfZW5j
b2Rlci4KClNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5j
b20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDkgLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3
LmMKaW5kZXggZjM5NTI4ZGJkZTIyLi41OTFiZjY0YWM5MTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rj
MzU4NzY3LmMKQEAgLTEyMTYsMTcgKzEyMTYsOCBAQCBzdGF0aWMgdm9pZCB0Y19jb25uZWN0b3Jf
c2V0X3BvbGxpbmcoc3RydWN0IHRjX2RhdGEgKnRjLAogCQkJICAgIERSTV9DT05ORUNUT1JfUE9M
TF9ESVNDT05ORUNUOwogfQogCi1zdGF0aWMgc3RydWN0IGRybV9lbmNvZGVyICoKLXRjX2Nvbm5l
Y3Rvcl9iZXN0X2VuY29kZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKLXsKLQlz
dHJ1Y3QgdGNfZGF0YSAqdGMgPSBjb25uZWN0b3JfdG9fdGMoY29ubmVjdG9yKTsKLQotCXJldHVy
biB0Yy0+YnJpZGdlLmVuY29kZXI7Ci19Ci0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5l
Y3Rvcl9oZWxwZXJfZnVuY3MgdGNfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyA9IHsKIAkuZ2V0X21v
ZGVzID0gdGNfY29ubmVjdG9yX2dldF9tb2RlcywKLQkuYmVzdF9lbmNvZGVyID0gdGNfY29ubmVj
dG9yX2Jlc3RfZW5jb2RlciwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
cl9mdW5jcyB0Y19jb25uZWN0b3JfZnVuY3MgPSB7Ci0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5s
YW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5l
c3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
