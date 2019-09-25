Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 353E9BE771
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 23:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464696FDD3;
	Wed, 25 Sep 2019 21:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DD36FDD2;
 Wed, 25 Sep 2019 21:35:12 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id w14so245728qto.9;
 Wed, 25 Sep 2019 14:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dosPEOfaBwxo48jsF5z4dH+L6ejjcGhuwNbvUtND8vw=;
 b=mPQKiLEFmv2bxxQ4nF3NX7Ff/HAZT4g5sctqT1Om/cqEvfadKAjpyHqYp9aXNgOIYf
 Zm5Oa/BVHuk7gP1z8m2eMcDELpIMBBkL9hLrwVwRSTpzsD8S+0FuWp5jEaxVu6hAZHEp
 xwplMO+yO/eLQRb0Zg1h49HdvmLthSYfoz63SYtpW1ZKFnk4OLGDFRerfiGX/rMP82Ae
 /a6mrOVXO2STO3tQBMN59rLKUgQjhL+4AXVrnIhO7yY2HT+ssXJBbByPtrHz2Y7Ng7zh
 9wODgADSFAmFNo1rgIQbFvejMqBSzG9W2NVCrLMjlW26iRz74um8mwZXI3754E92vFLF
 OUrw==
X-Gm-Message-State: APjAAAW3Hz6X5wVwiT2Kew1P/QImJnld0iz3vmKpc3m9tohXOGpubzld
 U0XEP4lYStwjXeF4hbaML5QQfGDk
X-Google-Smtp-Source: APXvYqzWZDt/jtiggNtrfctXlnFJGYo0kGMEXNU83GbcDKXMv5TJGsHVJsge2mm607X8Ve4c+LAwcg==
X-Received: by 2002:a0c:fc4a:: with SMTP id w10mr1639992qvp.46.1569447311499; 
 Wed, 25 Sep 2019 14:35:11 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s23sm78842qte.72.2019.09.25.14.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 14:35:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.4
Date: Wed, 25 Sep 2019 16:35:00 -0500
Message-Id: <20190925213500.3490-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dosPEOfaBwxo48jsF5z4dH+L6ejjcGhuwNbvUtND8vw=;
 b=W4sjRE51gokX0zv5HeOooJgsN7oLZrdGkJzV3CekyhziPDtVMREzzBy+F0I0fzzGTh
 EToSk/EU+ojYklMtPcOXs80dP4CbCBgDF9PDf7+zbUXyWWXt8Fb75zkz8XiPw4vy6fqd
 tRWehmW+T2wmwA0TrB6owt30wfjkpK1wtBZiOPOTVmGDlm7E5lC1DFZySnUhrbhkqQ04
 XScLbonOcvhhxeXm5btePRUp7CNfD3KKOWzdUz08HScTB/TWdQyikQA6nQ5akJ/TQnw+
 ZVpeePKgCwxl2UprK8ERGMuvC3nCRwE/TJUDvNinJc0I4LFsqD4TCPBYrJ6vnmlO0lQL
 IvwA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKTW9yZSBmaXhlcyBmb3IgNS40LiAgTm90aGluZyBtYWpvci4KClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZTE2YTdjYmNlZDcxMTA4NjZkY2RlODRl
NTA0OTA5ZWE4NTA5OWJiZDoKCiAgZHJtL2FtZGdwdTogZmxhZyBuYXZpMTIgYW5kIDE0IGFzIGV4
cGVyaW1lbnRhbCBmb3IgNS40ICgyMDE5LTA5LTE4IDA4OjI5OjMwIC0wNTAwKQoKYXJlIGF2YWls
YWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL3Blb3BsZS5mcmVlZGVza3Rv
cC5vcmcvfmFnZDVmL2xpbnV4IHRhZ3MvZHJtLWZpeGVzLTUuNC0yMDE5LTA5LTI1Cgpmb3IgeW91
IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMTA0YzMwNzE0N2FkMzc5NjE3NDcyZGQ5MWE1YmNiMzY4
ZDcyYmQ2ZDoKCiAgZHJtL2FtZC9kaXNwbGF5OiBwcmV2ZW50IG1lbW9yeSBsZWFrICgyMDE5LTA5
LTI1IDE0OjU4OjM4IC0wNTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkcm0tZml4ZXMtNS40LTIwMTktMDktMjU6Cgph
bWRncHU6Ci0gRml4IGEgNjQgYml0IGRpdmlkZQotIFByZXZlbnQgYSBtZW1vcnkgbGVhayBpbiBh
IGZhaWx1cmUgY2FzZSBpbiBkYwotIExvYWQgcHJvcGVyIGdmeCBmaXJtd2FyZSBvbiBuYXZpMTQg
dmFyaWFudHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KQWxleCBEZXVjaGVyICgyKToKICAgICAgZHJtL2FtZGdwdS9kaXNw
bGF5OiBmaXggNjQgYml0IGRpdmlkZQogICAgICBkcm0vYW1kZ3B1L2Rpc3BsYXk6IGluY2x1ZGUg
c2xhYi5oIGluIGRjbjIxX3Jlc291cmNlLmMKCk5hdmlkIEVtYW1kb29zdCAoMSk6CiAgICAgIGRy
bS9hbWQvZGlzcGxheTogcHJldmVudCBtZW1vcnkgbGVhawoKVGlhbmNpLllpbiAoMSk6CiAgICAg
IGRybS9hbWRncHUvZ2Z4MTA6IGFkZCBzdXBwb3J0IGZvciB3a3MgZmlybXdhcmUgbG9hZGluZwoK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jICAgICAgICAgICAgIHwgMjIg
KysrKysrKysrKysrKysrKy0tLS0tLQogLi4uL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNlMTEw
L2RjZTExMF9jbGtfbWdyLmMgfCAgNCArKystCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEw
MC9kY2UxMDBfcmVzb3VyY2UuYyAgICB8ICAxICsKIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
MTEwL2RjZTExMF9yZXNvdXJjZS5jICAgIHwgIDEgKwogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9k
Y2UxMTIvZGNlMTEyX3Jlc291cmNlLmMgICAgfCAgMSArCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYyAgICB8ICAxICsKIC4uLi9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMgIHwgIDEgKwogLi4uL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYyAgfCAgMiArKwogOCBmaWxlcyBjaGFuZ2Vk
LCAyNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
