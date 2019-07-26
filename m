Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4309B7635A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 12:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF036ED12;
	Fri, 26 Jul 2019 10:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C606ED12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 10:18:52 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k21so52839627edq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 03:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvX8OAziSNN5OsE8bfDSJk4CpRqBH7dyRkXnk7RG3eI=;
 b=r9y7CsBkuefVPeELIi53cscv6Bfau/oMw1zRnCn+bNkQGV/g/deKJrJiImh56+6Zse
 ccX8yUZT9c43hQY2jHsL2Dare8gXrchz+0HL2KY9D5uN/ocQJxy1eVPvb4cwlme/RPie
 AEAGe+5OAjaRBUIM83Xu24BTWLa43Aq9qe5mytEP6DuPQryMqEAKgdKxcC3Es/uj9EHc
 BaEn0KD253T1pajkMWMIt9JFDbRVUcAr8VuqgtNbl2+g31FoBOSVY0/XgTpIzC5gt7KX
 VWEvUYkZam8AZ7Z8lI4VhXQTGNUuLmY7beQat2Ih6C3Oi+tr9l3atFjHWZmKDk2pFOqp
 6fBw==
X-Gm-Message-State: APjAAAVnFIEEYoodSSjaAdaG3lR6cfiOS/65B0heQo8gEdI9t1VGcqzv
 GAwVpW0JeCcuWiBRpSTK6VFv6TUG
X-Google-Smtp-Source: APXvYqxCyBKloo2ImEn7ZegComMOJVWc4Hd9pm9aIYYqDnpaJVx8KHDgAMTnTb+ts8jOJor/MME7Vw==
X-Received: by 2002:a50:ac6e:: with SMTP id w43mr81856932edc.181.1564136330750; 
 Fri, 26 Jul 2019 03:18:50 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id f26sm6595812ejo.25.2019.07.26.03.18.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 03:18:50 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] video: Demote panel timing not found error message
Date: Fri, 26 Jul 2019 12:18:49 +0200
Message-Id: <20190726101849.27322-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvX8OAziSNN5OsE8bfDSJk4CpRqBH7dyRkXnk7RG3eI=;
 b=SQ+kR3HFvM8rRAriUWeNVj3CtMUPufRrOW+OwICxFGNVnRWXCviwz8rPVrkxPsqWvt
 so/d+iUbNVXle4UoflYpCtgJrbIWBpLrYq7n7BxKuBRd2wcmWzoCepE2yShpS9IDrXxr
 lfoYZn7wzcj3RaFzS0PgYA2VbD81mL4EWnwVCs6lReq1B8FCPihsVM0eQOf4QZWxtHUz
 2DOl/R/0zPso2GBSxcDdxzgfrhqAuvXnmqlwNt77AHzUClOIJzDsuTaTqAzOnD3cUuNC
 8fGfuoXcc67FENJuPfXlPxOrFRYpUGS9Jsn2UZPmXzhV4Z84bSm1yVh7mDOJQ7qieebR
 yVGA==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkZhaWxpbmcgdG8gZmlu
ZCBhIHBhbmVsLXRpbWluZyBub2RlIGlzIG5vdCBhbiBlcnJvciBpbiBhbGwgY2FzZXMsIHNvIGRv
Cm5vdCBvdXRwdXQgYW4gZXJyb3IgbWVzc2FnZSBpbiB0aGF0IGNhc2UuIEluc3RlYWQgdHVybiBp
dCBpbnRvIGEgZGVidWcKbWVzc2FnZSBhbmQgbWFrZSB0aGUgZHJpdmVycyB0aGF0IGNhcmUgYWJv
dXQgaXQgb3V0cHV0IGFuIGVycm9yIG1lc3NhZ2UKb2YgdGhlaXIgb3duLgoKU2lnbmVkLW9mZi1i
eTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtbHZkcy5jIHwgNCArKystCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2FtYmEt
Y2xjZC5jICAgIHwgNCArKystCiBkcml2ZXJzL3ZpZGVvL29mX2Rpc3BsYXlfdGltaW5nLmMgIHwg
MiArLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMKaW5kZXggMWVjNTdkMDgwNmE4Li43ZmNiMzUyN2M3
ODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYwpAQCAtMTQ3LDggKzE0NywxMCBAQCBz
dGF0aWMgaW50IHBhbmVsX2x2ZHNfcGFyc2VfZHQoc3RydWN0IHBhbmVsX2x2ZHMgKmx2ZHMpCiAJ
aW50IHJldDsKIAogCXJldCA9IG9mX2dldF9kaXNwbGF5X3RpbWluZyhucCwgInBhbmVsLXRpbWlu
ZyIsICZ0aW1pbmcpOwotCWlmIChyZXQgPCAwKQorCWlmIChyZXQgPCAwKSB7CisJCWRldl9lcnIo
bHZkcy0+ZGV2LCAiJXBPRjogY291bGQgbm90IGZpbmQgcGFuZWwgdGltaW5nXG4iLCBucCk7CiAJ
CXJldHVybiByZXQ7CisJfQogCiAJdmlkZW9tb2RlX2Zyb21fdGltaW5nKCZ0aW1pbmcsICZsdmRz
LT52aWRlb19tb2RlKTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9hbWJhLWNs
Y2QuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYW1iYS1jbGNkLmMKaW5kZXggODkzMjRlNDJhMDMz
Li4xM2RmODk4YTM0ODEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYW1iYS1jbGNk
LmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hbWJhLWNsY2QuYwpAQCAtNTYxLDggKzU2MSwx
MCBAQCBzdGF0aWMgaW50IGNsY2RmYl9vZl9nZXRfZHBpX3BhbmVsX21vZGUoc3RydWN0IGRldmlj
ZV9ub2RlICpub2RlLAogCXN0cnVjdCB2aWRlb21vZGUgdmlkZW87CiAKIAllcnIgPSBvZl9nZXRf
ZGlzcGxheV90aW1pbmcobm9kZSwgInBhbmVsLXRpbWluZyIsICZ0aW1pbmcpOwotCWlmIChlcnIp
CisJaWYgKGVycikgeworCQlwcl9lcnIoIiVwT0Y6IGNvdWxkIG5vdCBmaW5kIHBhbmVsIHRpbWlu
Z1xuIiwgbm9kZSk7CiAJCXJldHVybiBlcnI7CisJfQogCiAJdmlkZW9tb2RlX2Zyb21fdGltaW5n
KCZ0aW1pbmcsICZ2aWRlbyk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vb2ZfZGlzcGxh
eV90aW1pbmcuYyBiL2RyaXZlcnMvdmlkZW8vb2ZfZGlzcGxheV90aW1pbmcuYwppbmRleCBmNWMx
YzQ2OWMwYWYuLjkzODViNTE4MzQ5ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9vZl9kaXNw
bGF5X3RpbWluZy5jCisrKyBiL2RyaXZlcnMvdmlkZW8vb2ZfZGlzcGxheV90aW1pbmcuYwpAQCAt
MTI1LDcgKzEyNSw3IEBAIGludCBvZl9nZXRfZGlzcGxheV90aW1pbmcoY29uc3Qgc3RydWN0IGRl
dmljZV9ub2RlICpucCwgY29uc3QgY2hhciAqbmFtZSwKIAogCXRpbWluZ19ucCA9IG9mX2dldF9j
aGlsZF9ieV9uYW1lKG5wLCBuYW1lKTsKIAlpZiAoIXRpbWluZ19ucCkgewotCQlwcl9lcnIoIiVw
T0Y6IGNvdWxkIG5vdCBmaW5kIG5vZGUgJyVzJ1xuIiwgbnAsIG5hbWUpOworCQlwcl9kZWJ1Zygi
JXBPRjogY291bGQgbm90IGZpbmQgbm9kZSAnJXMnXG4iLCBucCwgbmFtZSk7CiAJCXJldHVybiAt
RU5PRU5UOwogCX0KIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
