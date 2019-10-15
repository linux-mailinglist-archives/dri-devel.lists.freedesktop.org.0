Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406F0D78B6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FD16E831;
	Tue, 15 Oct 2019 14:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948C36E82D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:35:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z9so24162517wrl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b2ipSnrGQak2JEGzft/liLcvROkquAmQuVGcOa33iv8=;
 b=gJJCNKwJyWp7c5giAMZPB1OqY1Ja5ezaZmm+f+cIq34cSJomCh4Eg6R0JyvlLlv8zh
 qQIZyeB6qdWmo8x5XHXVHAdY3byVYhFVIIkfc/j8rnjsKWLfPVyvpXZBP3IHfIOliYap
 LsbvJWeFCYGMBHx1AWwXhvjep7sGBVjXN1fmHR55C5mzTlVz2CjUAkX0qMzk4QxIzRJe
 6PhW1UZAmdsNarwrt1rCJ96+KLKIPgRRVVM1x6NMffU5Qfym34aXruBh9Jrrh3U0lCmX
 BoJHGkz9wWNe9+D7R4pzM7Aloo6YLDNM3d91Eg/xuWcJs6oGVkYBY7Fm4AFJ/8hL3AKw
 iOHA==
X-Gm-Message-State: APjAAAWyq+6lByFxC1ka+bkPQhWIno0Ltg8AuO0hYP55spvwrAo5rY5H
 zwH5hnVWOJbu2ttFaAw1B6/Thq0f
X-Google-Smtp-Source: APXvYqy56EHLoGabq4S1foTQoqDWioCs+lyVVVSiiTbzyPF5rJToneDg7Z82D9aKhn5m0MreNfYGpg==
X-Received: by 2002:adf:e542:: with SMTP id z2mr13509748wrm.338.1571150142570; 
 Tue, 15 Oct 2019 07:35:42 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id u4sm41967084wmg.41.2019.10.15.07.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:35:41 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/15] drm/bridge: tc358767: Use DP nomenclature
Date: Tue, 15 Oct 2019 16:35:06 +0200
Message-Id: <20191015143509.1104985-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015143509.1104985-1-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b2ipSnrGQak2JEGzft/liLcvROkquAmQuVGcOa33iv8=;
 b=KNZBR/U6gPIoigsAx0y0a2dyd13PBegHsIQkWGVC/RCqip4FsSJQfOI8uLhlpyEczy
 ID9UjfXxcl7Fi1+AQhC4b74pXaT3cXYvwfKPpXSZl2TQD3dkAqd+A3CaEyPvtsVBl78e
 2CzhNMhewcJ7QeGf6QWNlTnXj8wJu91YavVF5nTfY+kvD+lGSCvQMsjQmYGNKlnIhUH4
 KjWRy1KjR9zd2Zf+PFLTXsL2hA33U9OxPpdF3x7iXHF9mB2lN6BkcgBUlgxjnxdNFF/0
 NxHlcaFlKvUn9zgzw+yhrelp8dSyfJUEKpFqfFVmGed70nue8T4QnHJq4w+ivFmf/CcS
 VDkQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBEUCBzcGVjaWZp
Y2F0aW9uIHVzZXMgdGhlIHRlcm0gImRlZmF1bHQgZnJhbWluZyIgaW5zdGVhZCBvZiAibm9uLQpl
bmhhbmNlZCBmcmFtaW5nIi4KClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGMzNTg3NjcuYwppbmRleCA4OTA2M2Q1OTcyNjIuLmNkMDAzNzJiMjVhZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYwpAQCAtNzE1LDcgKzcxNSw3IEBAIHN0YXRpYyBpbnQgdGNfZ2V0X2Rp
c3BsYXlfcHJvcHMoc3RydWN0IHRjX2RhdGEgKnRjKQogCQkodGMtPmxpbmsucmF0ZSA9PSAxNjIw
MDApID8gIjEuNjJHYnBzIiA6ICIyLjdHYnBzIiwKIAkJdGMtPmxpbmsubnVtX2xhbmVzLAogCQlk
cm1fZHBfZW5oYW5jZWRfZnJhbWVfY2FwKHRjLT5saW5rLmRwY2QpID8KLQkJImVuaGFuY2VkIiA6
ICJub24tZW5oYW5jZWQiKTsKKwkJImVuaGFuY2VkIiA6ICJkZWZhdWx0Iik7CiAJZGV2X2RiZyh0
Yy0+ZGV2LCAiRG93bnNwcmVhZDogJXMsIHNjcmFtYmxlcjogJXNcbiIsCiAJCXRjLT5saW5rLnNw
cmVhZCA/ICIwLjUlIiA6ICIwLjAlIiwKIAkJdGMtPmxpbmsuc2NyYW1ibGVyX2RpcyA/ICJkaXNh
YmxlZCIgOiAiZW5hYmxlZCIpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
