Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2579A542
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 04:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166356EAAA;
	Fri, 23 Aug 2019 02:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67C66EAAA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 02:12:19 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id z17so7345841otk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 19:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bGIhbEl6FGUkeXAW9XEa8bOciGqkRpwspU8I3hxNATk=;
 b=a9c2lOsn78jbsTAPi5943VupW3y1SQC6pyy+Jk2lAF2q44HAr2wZS0exfYa0zUlvhN
 GPMDuj2ff+4LRyieFFtFjnY5MwOI6WrWrGYUHOaDWiZkw/BN8EtVsVG4oUOLVALhilGR
 +n77s+yKxo1J+JUCX733X3EvkUwzTfL3GDbdZGZDR/1YEo0ks+yoMDNpi/fYT3UI9wpA
 2sZ8BRcLt/2bTVzCkw9HpjGrMZUnEIOsyxcpntdSSSj9ABRsz/aH+vd4bEAFdbdDEvzk
 oZNZXrmbUP/OpGaqEB8PlZXtEbksncmAyO68epOeAiZjExROIK5XMM9PcqaVEv9fv9rC
 idOA==
X-Gm-Message-State: APjAAAWG0izO3Npu54/m+KJJKypIEiBcAf9b9RCbXJLYCfYTiiehbq43
 LnmNTzvL7fsj+Wxd2m38sHrSq+Q=
X-Google-Smtp-Source: APXvYqwu2kQB0MXBHCASFglOHHR89XDffrzoFSTB9R2/mzUPj2ez5KvJ5KvzUf7CumxMZHjW49PD6w==
X-Received: by 2002:a9d:741a:: with SMTP id n26mr2304910otk.198.1566526338497; 
 Thu, 22 Aug 2019 19:12:18 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id c1sm457747oic.31.2019.08.22.19.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 19:12:17 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: 
Date: Thu, 22 Aug 2019 21:12:08 -0500
Message-Id: <20190823021216.5862-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3ViamVjdDogW1BBVENIIHYyIDAvOF0gcGFuZnJvc3Q6IExvY2tpbmcgYW5kIHJ1bnRpbWUgUE0g
Zml4ZXMKCldpdGggZnVydGhlciB0ZXN0aW5nIG9mIHJlY2VudCBjaGFuZ2VzIHdpdGggbG9ja2Rl
cCBhbmQgb3RoZXIgbG9ja2luZwpjaGVja3MgZW5hYmxlZCwgd2UndmUgZm91bmQgc2V2ZXJhbCBi
dWdzIGluIHRoZSBzaHJpbmtlciBjb2RlIGFuZCBvbmUKc2xlZXAgd2hpbGUgYXRvbWljIGluIHBh
bmZyb3N0X2dlbV9vcGVuKCkuIFRoaXMgc2VyaWVzIGFkZHJlc3NlcyB0aG9zZQppc3N1ZXMuCgpE
ZWxheWluZyB0aGUgdW5tYXBwaW5nIG9mIHBhZ2VzIHR1cm5zIG91dCB0byBiZSBhIGJhZCBpZGVh
LiBJbnN0ZWFkIHdlIApuZWVkIHRvIHJld29yayBwYW5mcm9zdF9tbXVfdW5tYXAoKSB0byBub3Qg
ZG8gYSBydW50aW1lIFBNIHJlc3VtZSB3aGljaCAKdGFrZXMgc2V2ZXJhbCBsb2NrcyBhbmQgY2F1
c2VzIG1vcmUgbG9ja2RlcCB3YXJuaW5ncy4gVW5mb3J0dW5hdGVseSwgCnRoZXJlIGluaXRpYWxs
eSBhcHBlYXJlZCB0byBiZSBzb21lIG1pc21hdGNoZXMgYmV0d2VlbiB0aGUgcnVudGltZSBQTSAK
c3RhdGUgYW5kIHRoZSBoL3cuIFRoZSByZXN1bHQgaXMgc2V2ZXJhbCBmaXhlcyB0byB0aGUgcnVu
dGltZSBQTSAKaW5pdGlhbGl6YXRpb24gYW5kIGhhbmRsaW5nIGluIGpvYnMuIFdpdGggdGhpcywg
dGhlIGNoYW5nZXMgdG8gCnBhbmZyb3N0X21tdV91bm1hcCgpIGFyZSB3b3JraW5nIGNvcnJlY3Rs
eS4KCnYyOgogLSBEcm9wIGFscmVhZHkgYXBwbGllZCAnZHJtL3BhbmZyb3N0OiBGaXggc2xlZXBp
bmcgd2hpbGUgYXRvbWljIGluIAogICBwYW5mcm9zdF9nZW1fb3BlbicKIC0gUnVudGltZSBQTSBj
bGVhbi11cHMKIC0gS2VlcCBwYW5mcm9zdF9nZW1fcHVyZ2UgYW5kIHVzZSBtdXRleF90cnlsb2Nr
IHRoZXJlCiAtIFJld29yayBwYW5mcm9zdF9tbXVfdW5tYXAgcnVudGltZSBQTQoKUm9iCgpSb2Ig
SGVycmluZyAoOCk6CiAgZHJtL3BhbmZyb3N0OiBGaXggcG9zc2libGUgc3VzcGVuZCBpbiBwYW5m
cm9zdF9yZW1vdmUKICBkcm0vcGFuZnJvc3Q6IFJld29yayBydW50aW1lIFBNIGluaXRpYWxpemF0
aW9uCiAgZHJtL3BhbmZyb3N0OiBIb2xkIHJ1bnRpbWUgUE0gcmVmZXJlbmNlIHVudGlsIGpvYnMg
Y29tcGxldGUKICBkcm0vc2htZW06IERvIGRtYV91bm1hcF9zZyBiZWZvcmUgcHVyZ2luZyBwYWdl
cwogIGRybS9zaG1lbTogVXNlIG11dGV4X3RyeWxvY2sgaW4gZHJtX2dlbV9zaG1lbV9wdXJnZQog
IGRybS9wYW5mcm9zdDogVXNlIG11dGV4X3RyeWxvY2sgaW4gcGFuZnJvc3RfZ2VtX3B1cmdlCiAg
ZHJtL3BhbmZyb3N0OiBSZXdvcmsgcGFnZSB0YWJsZSBmbHVzaGluZyBhbmQgcnVudGltZSBQTSBp
bnRlcmFjdGlvbgogIGRybS9wYW5mcm9zdDogUmVtb3ZlIHVubmVjZXNzYXJ5IGZsdXNoaW5nIGZy
b20gdGxiX2ludl9jb250ZXh0CgogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVy
LmMgICAgICAgIHwgMTMgKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
ZXZpY2UuYyAgICB8ICA5IC0tLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
cnYuYyAgICAgICB8IDE2ICsrKystLS0KIC4uLi9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dl
bV9zaHJpbmtlci5jICB8IDExICsrKy0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3Rfam9iLmMgICAgICAgfCAxNiArKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfbW11LmMgICAgICAgfCA0NyArKysrKysrKystLS0tLS0tLS0tCiBpbmNsdWRlL2RybS9k
cm1fZ2VtX3NobWVtX2hlbHBlci5oICAgICAgICAgICAgfCAgMiArLQogNyBmaWxlcyBjaGFuZ2Vk
LCA1OSBpbnNlcnRpb25zKCspLCA1NSBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
