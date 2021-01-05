Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCB72EAC26
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 14:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BBB6E112;
	Tue,  5 Jan 2021 13:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562396E10F;
 Tue,  5 Jan 2021 13:44:13 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id c5so36214242wrp.6;
 Tue, 05 Jan 2021 05:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Xh8qZOWXZauoXa9vZ+K50zm9g9s+n1GKQJc2m0FrV8=;
 b=T9snQ9bKRyo+aHfNWsQiaTwtbweBwUVEbh1FBzR8gZDwjxw5kJ6Urcd3PHcyKp/i7F
 YuuVOjdv/SL6s2B62e00kEz7gzKjGyM2V1HTtHWdXpI5mqFGqPxqfdRX6ZzDCk98Dz8z
 V5Xgz1HalBD2/m+gbbOqiROSZG74t8xD+3fXm9RHa9aIrBnOi/OGvclNG4gq3cjC7Jyw
 hIee/qStDHEI+TPdS8nxykvg/q4+5JRFMwVloX2jOMhP1ty/hfMDlc4ymKMzyfJpWahd
 b74rKOQUOVrhYyGJB4NoBfxZKS7F5XZvn1Z0ajOcrwYWX4skrHOFTFE7Qte7E80ToxCw
 BD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Xh8qZOWXZauoXa9vZ+K50zm9g9s+n1GKQJc2m0FrV8=;
 b=EyswI8WnORHgw1fqYHiby26ahk9On8l4i10y9Xv73R33hr+g/MH9DSZXqdXcCoOxiH
 +1hevbarfoRi2368BgGQeSmpNlbFBZc8jQmWxBqd71NI0DhSsCyV/j42LX5NeQme5NEM
 Sa/vL3ZzsqLCC5Y+OWuWD4/ju0nzG1d22Aum6BRNf1Sei856gN50jyCzgvZuR892QUAb
 EleH/Qfao9qmDYFjMhv3aGdRIX029j0/6KpxNSVGegZRUKhjya+5UhZeDnhffoAimYk/
 vPx8PG2fylSi1AYqpjxxuDCaF1mZdR+ZvxvY3mzhdoIxIsQayyNPwqQQAX4XLmhCTk5B
 2BCA==
X-Gm-Message-State: AOAM530lzWCebHdRVBJu1Y1oDA+0TobnfFCBNVQ5WEX8Frqko8qpJLEr
 Bm6uV0UYG/vntbf55FaqaJY=
X-Google-Smtp-Source: ABdhPJwLkmDD5Zg3fZC6NkuylnaqkeVxjvv3JjNRuhSiiF+n5kQbFv7JVfDkAm/Kbhghi2ev482tTQ==
X-Received: by 2002:adf:dc10:: with SMTP id t16mr80583385wri.345.1609854252040; 
 Tue, 05 Jan 2021 05:44:12 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3137:60b9:8d8f:7f55])
 by smtp.gmail.com with ESMTPSA id l20sm102191243wrh.82.2021.01.05.05.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 05:44:11 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bhelgaas@google.com
Subject: [PATCH 4/4] PCI: add a REBAR size quirk for Sapphire RX 5600 XT Pulse.
Date: Tue,  5 Jan 2021 14:44:04 +0100
Message-Id: <20210105134404.1545-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105134404.1545-1-christian.koenig@amd.com>
References: <20210105134404.1545-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devspam@moreofthesa.me.uk, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3RoZXJ3aXNlIHRoZSBDUFUgY2FuJ3QgZnVsbHkgYWNjZXNzIHRoZSBCQVIuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9wY2kvcGNpLmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3BjaS5jIGIvZHJp
dmVycy9wY2kvcGNpLmMKaW5kZXggMTYyMTYxODZiNTFjLi5iNjZlNDcwM2MyMTQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvcGNpL3BjaS5jCisrKyBiL2RyaXZlcnMvcGNpL3BjaS5jCkBAIC0zNTc3LDcg
KzM1NzcsMTQgQEAgdTMyIHBjaV9yZWJhcl9nZXRfcG9zc2libGVfc2l6ZXMoc3RydWN0IHBjaV9k
ZXYgKnBkZXYsIGludCBiYXIpCiAJCXJldHVybiAwOwogCiAJcGNpX3JlYWRfY29uZmlnX2R3b3Jk
KHBkZXYsIHBvcyArIFBDSV9SRUJBUl9DQVAsICZjYXApOwotCXJldHVybiAoY2FwICYgUENJX1JF
QkFSX0NBUF9TSVpFUykgPj4gNDsKKwljYXAgPSAoY2FwICYgUENJX1JFQkFSX0NBUF9TSVpFUykg
Pj4gNDsKKworCS8qIFNhcHBoaXJlIFJYIDU2MDAgWFQgUHVsc2UgaGFzIGFuIGludmFsaWQgY2Fw
IGR3b3JkIGZvciBCQVIgMCAqLworCWlmIChwZGV2LT52ZW5kb3IgPT0gUENJX1ZFTkRPUl9JRF9B
VEkgJiYgcGRldi0+ZGV2aWNlID09IDB4NzMxZiAmJgorCSAgICBiYXIgPT0gMCAmJiBjYXAgPT0g
MHg3MDApCisJCWNhcCA9PSAweDdmMDA7CisKKwlyZXR1cm4gY2FwOwogfQogRVhQT1JUX1NZTUJP
TChwY2lfcmViYXJfZ2V0X3Bvc3NpYmxlX3NpemVzKTsKIAotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
