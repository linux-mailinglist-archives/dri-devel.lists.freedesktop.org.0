Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 590E9101AD1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA9E6EB9B;
	Tue, 19 Nov 2019 08:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7186E81F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:33 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b20so14913270lfp.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YfRQS8FRsreLwU82cR0lmVr72UzAKLB+Ti08zkiWA2g=;
 b=VZtQL6VJAWNSNpigny8k1cMDQfC452SZQbqCtiy2DkcGRrDvIbKmTU9SkaQHcaipMk
 wgaCd7GH0npkbb2cs1Xoy1d4q47sMdcBuo4Hj80zabmQX9U89UD7hGZhIDQor1v8Itr8
 kBMpiox2w83TANIS1d979PPfpH7y3Q5vz9yVAxQb4IJPMb4uBuF7GP4nzDi7b0sSc0y7
 akq/0ZVTrYc/BmZEWDKwQX34rBC5FdjmdJTGka/F3SiAzUVVhjsLWYlAfIYSZAXBlG1t
 bm3dMSTkemFQQWQMROV8sqd4EeGzT+DDeFBXCstKUOYD6lVbLZ3074ssVDmaoU227h+Y
 Pomg==
X-Gm-Message-State: APjAAAWlp08X4I8uUJ+ZXFrN8YVD/eQHBxWuXttfO/GvobdJUq3xbJSQ
 ZZ9JNh/0wx/U+ifzNQH7YY8=
X-Google-Smtp-Source: APXvYqw/CNkRKTWQcvTgT1y2MDU/N7d5RKCQec2znR/p7a4NaamXmNcG0FHRmTUehsLlMo7c8uJOvQ==
X-Received: by 2002:ac2:5dc1:: with SMTP id x1mr802357lfq.177.1574107531785;
 Mon, 18 Nov 2019 12:05:31 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:31 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 02/29] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
Date: Mon, 18 Nov 2019 23:02:20 +0300
Message-Id: <20191118200247.3567-3-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YfRQS8FRsreLwU82cR0lmVr72UzAKLB+Ti08zkiWA2g=;
 b=gzNXLwLzE6umljasXje0Th90a21x+svtaa3a0cHtRBOrZwKf2Fh8ILCS2QMfM1A8je
 quppks4fV35q39gw/tZySz51c4s6ZKUJ4o6IAq9YO4ENOQwUrIdrEE7o2M/5WQDmJ+fa
 MARto3dREx4NeuJ1Cq2hnreh7ejZShlBtDAv+S/2aTjh3M8D8FcN+FRvaykTehq8K6I5
 c11fAeSiRzbN1JKwfMUJIpk9PqispbeDAnbukjaKsjRIjNvAJZ/BLvF8ygm0cg0tUK+J
 +u/rNQC3ymN/s+Vt24rsGP2S12B7PUpj+kq5NrJj8nXm/RnNl7i+zV3+0zKHsJu9Cfqy
 jt3g==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXh0ZXJuYWwgbWVtb3J5IGNvbnRyb2xsZXIgaXMgaW50ZXJjb25uZWN0ZWQgd2l0aCBtZW1vcnkg
Y29udHJvbGxlciBhbmQKd2l0aCBleHRlcm5hbCBtZW1vcnkuIERvY3VtZW50IG5ldyBpbnRlcmNv
bm5lY3QgcHJvcGVydHkgd2hpY2ggZGVzaWduYXRlcwpleHRlcm5hbCBtZW1vcnkgY29udHJvbGxl
ciBhcyBpbnRlcmNvbm5lY3QgcHJvdmlkZXIuCgpTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVu
a28gPGRpZ2V0eEBnbWFpbC5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVy
cy9udmlkaWEsdGVncmEyMC1lbWMudHh0ICAgICAgICB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMjAtZW1jLnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRl
Z3JhMjAtZW1jLnR4dAppbmRleCBhZGQ5NTM2NzY0MGIuLjc1NjZkODgzZjkyMSAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9u
dmlkaWEsdGVncmEyMC1lbWMudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMjAtZW1jLnR4dApAQCAtMTIsNiAr
MTIsOSBAQCBQcm9wZXJ0aWVzOgogICBpcnJlc3BlY3RpdmUgb2YgcmFtLWNvZGUgY29uZmlndXJh
dGlvbi4KIC0gaW50ZXJydXB0cyA6IFNob3VsZCBjb250YWluIEVNQyBHZW5lcmFsIGludGVycnVw
dC4KIC0gY2xvY2tzIDogU2hvdWxkIGNvbnRhaW4gRU1DIGNsb2NrLgorLSAjaW50ZXJjb25uZWN0
LWNlbGxzIDogU2hvdWxkIGJlIDEuIFRoaXMgY2VsbCByZXByZXNlbnRzIGV4dGVybmFsIG1lbW9y
eQorICBpbnRlcmNvbm5lY3QuIFRoZSBhc3NpZ25tZW50cyBtYXkgYmUgZm91bmQgaW4gaGVhZGVy
IGZpbGUKKyAgPGR0LWJpbmRpbmdzL2ludGVyY29ubmVjdC90ZWdyYS1pY2MuaD4uCiAKIENoaWxk
IGRldmljZSBub2RlcyBkZXNjcmliZSB0aGUgbWVtb3J5IHNldHRpbmdzIGZvciBkaWZmZXJlbnQg
Y29uZmlndXJhdGlvbnMgYW5kIGNsb2NrIHJhdGVzLgogCkBAIC0yMCw2ICsyMyw3IEBAIEV4YW1w
bGU6CiAJbWVtb3J5LWNvbnRyb2xsZXJANzAwMGY0MDAgewogCQkjYWRkcmVzcy1jZWxscyA9IDwg
MSA+OwogCQkjc2l6ZS1jZWxscyA9IDwgMCA+OworCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPCAx
ID47CiAJCWNvbXBhdGlibGUgPSAibnZpZGlhLHRlZ3JhMjAtZW1jIjsKIAkJcmVnID0gPDB4NzAw
MGY0MDAwIDB4MjAwPjsKIAkJaW50ZXJydXB0cyA9IDwwIDc4IDB4MDQ+OwotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
