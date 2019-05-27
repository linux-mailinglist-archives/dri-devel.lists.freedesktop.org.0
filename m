Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6452AFFC
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 10:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F2C899B0;
	Mon, 27 May 2019 08:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A4689958
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 08:19:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e2so7204024wrv.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 01:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQ7eNjW/2eOkTuLgrwZ0jTTijZuZ5pGFb5qu5RgXgtQ=;
 b=G7IUZgYve5g22Rknbc+6oE6Xmxpmf//ZpM6IGw5M+mmmbwtBl+yuQ2N+uy7EZISZLI
 +t0luCRZieNRbPa/0WNWtDKQePz4rWOehAx+w1ShKMsi4u57yEJq7ZmYhs19osmSL+2T
 aYHhv942+x8dJVDpHkuuRl4cY+S5Gk8Efm+pDWwLQE7bX75PfzF+JG6BhRQ7wQNGwgA9
 2ZN7oY8K9t+Lh5YRuLy9YgyaX4F2r2ARrs//YjLOjjYALTJq+zMfKRnO339t+XfObTxM
 U3YiAwY7CxgzFEh43WnRjZBqxA5rLDpQ6rII95TRj2vpIAVNYwklp9RuHwQGuXXwtEYm
 7rlg==
X-Gm-Message-State: APjAAAUU2CxRkAEmvp1M8SkYxmDHBStMEnk5w6yCxsurEqFNehsnttnL
 gK6/JUQbjG/o9FWI0Btxrbl9uyhG
X-Google-Smtp-Source: APXvYqx8Jlz3e+GrwlaEmXL39uXAWQV83oL1FGbdAbGNYw7J7Iqa+/zm6t8CN9vSGQhpFwGVvSiXxA==
X-Received: by 2002:adf:dfd0:: with SMTP id q16mr18498160wrn.235.1558945162311; 
 Mon, 27 May 2019 01:19:22 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id a124sm7511876wmh.3.2019.05.27.01.19.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 01:19:21 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/13] drm/omap: drop DRM_AUTH from DRM_RENDER_ALLOW ioctls
Date: Mon, 27 May 2019 09:17:37 +0100
Message-Id: <20190527081741.14235-9-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527081741.14235-1-emil.l.velikov@gmail.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQ7eNjW/2eOkTuLgrwZ0jTTijZuZ5pGFb5qu5RgXgtQ=;
 b=QYwxU7yBZpfo+MdjjN/v6g6EdqzyX9xFdQBfUpSIqEsXKyNKuLGW/4YRk3T0gpxkyY
 J0V+9O57ahcIfmvAz68K78eVA+5wQHy2NLxbB7K6xBmPQ8pDoNAlozfytMRg7xWIe6Dv
 W6jTEdNHrvbGvPRItASSBdaSk5WQl2m/aUpCU1wRCRQcpzB6AWvZ/9F1qCB6VWQh6Dgo
 fTwXPjDM/vUw+whQzMG+MaWtJOUK+hM4MwX+ItLN/2+rCoHqZSqjtHD75KAcgiWK0opE
 bTMqiYmSOqjpStmtpYkyRtyBetbf1W2gsHfAPgdoloTItIiaKgf3hUUR5zPq0D4jdawi
 oqBw==
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
Cc: David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 emil.l.velikov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClRoZSBhdXRo
ZW50aWNhdGlvbiBjYW4gYmUgY2lyY3VtdmVudGVkLCBieSBkZXNpZ24sIGJ5IHVzaW5nIHRoZSBy
ZW5kZXIKbm9kZS4KCkZyb20gdGhlIGRyaXZlciBQT1YgdGhlcmUgaXMgbm8gZGlzdGluY3Rpb24g
YmV0d2VlbiBwcmltYXJ5IGFuZCByZW5kZXIKbm9kZXMsIHRodXMgd2UgY2FuIGRyb3AgdGhlIHRv
a2VuLgoKTm90ZTogdGhlIG91dHN0YW5kaW5nIERSTV9BVVRIIGluc3RhbmNlIGlzOgogLSAoYmFk
bHkgY29wZWQpIGxlZ2FjeSBEUkkxIGlvY3RsLCB3aGljaCBpcyBhIG5vb3AKCkNjOiBUb21pIFZh
bGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpTaWduZWQtb2Zm
LWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKU2lnbmVkLW9m
Zi1ieTogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYyB8IDEwICsrKysrLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29t
YXBfZHJ2LmMKaW5kZXggMWI5YjZmNWU0OGUxLi5mOTc3ODFmOWQ5MzYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9kcnYuYwpAQCAtNDkxLDE5ICs0OTEsMTkgQEAgc3RhdGljIGludCBpb2N0bF9n
ZW1faW5mbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9pb2N0bF9kZXNjIGlvY3Rsc1tEUk1fQ09NTUFORF9FTkQgLSBEUk1fQ09N
TUFORF9CQVNFXSA9IHsKIAlEUk1fSU9DVExfREVGX0RSVihPTUFQX0dFVF9QQVJBTSwgaW9jdGxf
Z2V0X3BhcmFtLAotCQkJICBEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cpLAorCQkJICBEUk1f
UkVOREVSX0FMTE9XKSwKIAlEUk1fSU9DVExfREVGX0RSVihPTUFQX1NFVF9QQVJBTSwgaW9jdGxf
c2V0X3BhcmFtLAogCQkJICBEUk1fQVVUSCB8IERSTV9NQVNURVIgfCBEUk1fUk9PVF9PTkxZKSwK
IAlEUk1fSU9DVExfREVGX0RSVihPTUFQX0dFTV9ORVcsIGlvY3RsX2dlbV9uZXcsCi0JCQkgIERS
TV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCisJCQkgIERSTV9SRU5ERVJfQUxMT1cpLAogCS8q
IERlcHJlY2F0ZWQsIHRvIGJlIHJlbW92ZWQuICovCiAJRFJNX0lPQ1RMX0RFRl9EUlYoT01BUF9H
RU1fQ1BVX1BSRVAsIGRybV9ub29wLAotCQkJICBEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cp
LAorCQkJICBEUk1fUkVOREVSX0FMTE9XKSwKIAkvKiBEZXByZWNhdGVkLCB0byBiZSByZW1vdmVk
LiAqLwogCURSTV9JT0NUTF9ERUZfRFJWKE9NQVBfR0VNX0NQVV9GSU5JLCBkcm1fbm9vcCwKLQkJ
CSAgRFJNX0FVVEggfCBEUk1fUkVOREVSX0FMTE9XKSwKKwkJCSAgRFJNX1JFTkRFUl9BTExPVyks
CiAJRFJNX0lPQ1RMX0RFRl9EUlYoT01BUF9HRU1fSU5GTywgaW9jdGxfZ2VtX2luZm8sCi0JCQkg
IERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCisJCQkgIERSTV9SRU5ERVJfQUxMT1cpLAog
fTsKIAogLyoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
