Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CEC5EF86
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 01:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662BF6E20D;
	Wed,  3 Jul 2019 23:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CEF6E20D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 23:10:50 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id o13so1929895pgp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 16:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VtILuFkGc74DsmIsSVunILdTUJQHhxHrtfAbgQZ5qvs=;
 b=aTkt2wiSoIg29H5hePWf1IBqmqnHOU3ySzm2f1B6p70CzIQ6NfmCyFTVlP2lEYzjuZ
 T03cbvlwHuaqq8QvR2C47pq7V5KvJVHFAG2SVELdD6surJe0ozzc3kddnnBQmlfntwcT
 vrBPVTpTQUFCPTLNMz0DSB8jJv4f+eczwSUzKYBe02XdFN/+GKPoU6q9Ouj9wmn9TJj7
 qsdrro95G+QoE4lr/r6M98P2ImktsdlhyVWUtt70cQCgyKAZAPOlDcHc8nUfeoHOdTEA
 OB3LJhH449v4T0KiHZWHvzRWv+JT5R+NRBT/1q60eo9WpbFyxdGF/1UVZtKuUb4SXm7k
 MLsA==
X-Gm-Message-State: APjAAAVVfgd9yP2LA+VsLMWQkskJw4jIfhqin4GKRxwc+6UwDuGvwW4O
 2gpv8E7Io4YQjiKymGvXsoHj71I9aQM=
X-Google-Smtp-Source: APXvYqzdu53IY5+xel0OAKV3j7iZcG+qkSIVDIFrREs53z4dmZId2m5aElzYKcWloFELCkc5x4F5Nw==
X-Received: by 2002:a17:90a:bb0c:: with SMTP id
 u12mr15908180pjr.132.1562195449109; 
 Wed, 03 Jul 2019 16:10:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 d140sm3619876pfd.135.2019.07.03.16.10.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 16:10:48 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] mesa: Add ir3/ir3_nir_imul.c generation to Android.mk
Date: Wed,  3 Jul 2019 23:10:38 +0000
Message-Id: <20190703231038.73097-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190703231038.73097-1-john.stultz@linaro.org>
References: <20190703231038.73097-1-john.stultz@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VtILuFkGc74DsmIsSVunILdTUJQHhxHrtfAbgQZ5qvs=;
 b=WGEE8YgmaciVX4Zwlc4EIZjwfst09XWNRED7KusVMRYDhsX+ixFzDGN6rXBocr7QLz
 +8T4ZnCkusKRsK1wYDfG8hqvLjgh+NhzpLLLPa4sv8CvG+sOxd2CvCrXW7gNcyZy05Nd
 PFHarp3OeBZFMRBibfs0F2WvzFRg5W6S1jpfTuM7ouK9ynG0i5gB6alvaTOO44SM0JHL
 CrECMlo3gXv1oPojaUc8Ecrvn0JhK/1sEyOJD/yhXlrqN8sXljWweoui9kRJPCIw6zdF
 urhmk0opKodzTal16NEZvwE7WQBYKIA7ead42M11Nl8DdHAAozoCeo62pxsy/swINmIr
 xJxQ==
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
Cc: Rob Clark <robdclark@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 Greg Hartman <ghartman@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCBjdXJyZW50IG1hc3RlciB3ZSdyZSBzZWVpbmcgYnVpbGQgZmFpbHVyZXMgd2l0aCBBT1NQ
OgogIGVycm9yOiB1bmRlZmluZWQgc3ltYm9sOiBpcjNfbmlyX2xvd2VyX2ltdWwKClRoaXMgaXMg
ZHVlIHRvIHRoZSBpcjNfbmlyX2ltdWwuYyBmaWxlIG5vdCBiZWluZyBnZW5lcmF0ZWQKaW4gdGhl
IEFuZHJvaWQubWsgZmlsZXMuCgpUaGlzIHBhdGNoIHNpbXBseSBhZGRzIGl0IHRvIHRoZSBBbmRy
b2lkIGJ1aWxkLCBhZnRlciB3aGljaAp0aGlnbnMgYnVpbGQgYW5kIGJvb3Qgb2sgb24gZGI0MTBj
LgoKQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KQ2M6IEVtaWwgVmVsaWtv
diA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgpDYzogQW1pdCBQdW5kaXIgPGFtaXQucHVuZGly
QGxpbmFyby5vcmc+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpD
YzogQWxpc3RhaXIgU3RyYWNoYW4gPGFzdHJhY2hhbkBnb29nbGUuY29tPgpDYzogR3JlZyBIYXJ0
bWFuIDxnaGFydG1hbkBnb29nbGUuY29tPgpDYzogVGFwYW5pIFDDpGxsaSA8dGFwYW5pLnBhbGxp
QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFy
by5vcmc+Ci0tLQogc3JjL2ZyZWVkcmVuby9NYWtlZmlsZS5zb3VyY2VzICAgICAgICAgICAgICAg
fCAzICsrLQogc3JjL2dhbGxpdW0vZHJpdmVycy9mcmVlZHJlbm8vQW5kcm9pZC5nZW4ubWsgfCA3
ICsrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvc3JjL2ZyZWVkcmVuby9NYWtlZmlsZS5zb3VyY2VzIGIvc3JjL2ZyZWVk
cmVuby9NYWtlZmlsZS5zb3VyY2VzCmluZGV4IGQ4YWFmMmNhZWNjLi43NWVjMzYxNjYzYiAxMDA2
NDQKLS0tIGEvc3JjL2ZyZWVkcmVuby9NYWtlZmlsZS5zb3VyY2VzCisrKyBiL3NyYy9mcmVlZHJl
bm8vTWFrZWZpbGUuc291cmNlcwpAQCAtNDgsNyArNDgsOCBAQCBpcjNfU09VUkNFUyA6PSBcCiAJ
aXIzL2lyM19zdW4uYwogCiBpcjNfR0VORVJBVEVEX0ZJTEVTIDo9IFwKLQlpcjMvaXIzX25pcl90
cmlnLmMKKwlpcjMvaXIzX25pcl90cmlnLmMgXAorCWlyMy9pcjNfbmlyX2ltdWwuYwogCiByZWdp
c3RlcnNfRklMRVMgOj0gXAogCXJlZ2lzdGVycy9hMnh4LnhtbC5oIFwKZGlmZiAtLWdpdCBhL3Ny
Yy9nYWxsaXVtL2RyaXZlcnMvZnJlZWRyZW5vL0FuZHJvaWQuZ2VuLm1rIGIvc3JjL2dhbGxpdW0v
ZHJpdmVycy9mcmVlZHJlbm8vQW5kcm9pZC5nZW4ubWsKaW5kZXggZDI5YmExNTlkNWMuLjFkM2Vl
NWZmODU2IDEwMDY0NAotLS0gYS9zcmMvZ2FsbGl1bS9kcml2ZXJzL2ZyZWVkcmVuby9BbmRyb2lk
Lmdlbi5taworKysgYi9zcmMvZ2FsbGl1bS9kcml2ZXJzL2ZyZWVkcmVuby9BbmRyb2lkLmdlbi5t
awpAQCAtMjgsMTEgKzI4LDE4IEBAIGlyM19uaXJfdHJpZ19kZXBzIDo9IFwKIAkkKE1FU0FfVE9Q
KS9zcmMvZnJlZWRyZW5vL2lyMy9pcjNfbmlyX3RyaWcucHkgXAogCSQoTUVTQV9UT1ApL3NyYy9j
b21waWxlci9uaXIvbmlyX2FsZ2VicmFpYy5weQogCitpcjNfbmlyX2ltdWxfZGVwcyA6PSBcCisJ
JChNRVNBX1RPUCkvc3JjL2ZyZWVkcmVuby9pcjMvaXIzX25pcl9pbXVsLnB5CisKIGludGVybWVk
aWF0ZXMgOj0gJChjYWxsIGxvY2FsLWdlbmVyYXRlZC1zb3VyY2VzLWRpcikKIAogJChpbnRlcm1l
ZGlhdGVzKS9pcjMvaXIzX25pcl90cmlnLmM6ICQoaXIzX25pcl90cmlnX2RlcHMpCiAJQG1rZGly
IC1wICQoZGlyICRAKQogCSQoaGlkZSkgJChNRVNBX1BZVEhPTjIpICQ8IC1wICQoTUVTQV9UT1Ap
L3NyYy9jb21waWxlci9uaXIgPiAkQAogCiskKGludGVybWVkaWF0ZXMpL2lyMy9pcjNfbmlyX2lt
dWwuYzogJChpcjNfbmlyX2ltdWxfZGVwcykKKwlAbWtkaXIgLXAgJChkaXIgJEApCisJJChoaWRl
KSAkKE1FU0FfUFlUSE9OMikgJDwgLXAgJChNRVNBX1RPUCkvc3JjL2NvbXBpbGVyL25pciA+ICRA
CisKIExPQ0FMX0dFTkVSQVRFRF9TT1VSQ0VTICs9ICQoYWRkcHJlZml4ICQoaW50ZXJtZWRpYXRl
cykvLCBcCiAJJChpcjNfR0VORVJBVEVEX0ZJTEVTKSkKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
