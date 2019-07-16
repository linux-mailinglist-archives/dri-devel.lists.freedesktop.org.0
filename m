Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB286A257
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 08:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789A46E0AB;
	Tue, 16 Jul 2019 06:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC8F89133
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 06:44:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r9so18753520ljg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 23:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+/36LAk7R2VAebPvKDqciE1K6qFXd52Km5YEX41pLTo=;
 b=SZkasBiNZq3Ol+cFleURe1mVWyDLc8/wXzew5Iix1yb5JsZfImkJp3YaTxL6D5wM2W
 zZ8sSGaR+j7ffMBtZwKmF3c+qrgAV1kCd2fnCkyhAHDDq1Zs3/qNWZCAjLmkGingwjTp
 dIXc6J1MLBjOWapZRT5oRMTXC1i9TUOHBTUBqdlHjdvR6iBIDgDpSnVCI/VdsuPF0p/k
 YQPJwjzQPy1d62HcXLJIs42C0F32pMhE2WOGcuW/prxFveX1ZlCGw+3lF/2jn2K23HpM
 y6tUhj/So/EqysBXn2ACFEP9QRMkDx8F0eIHBE0peiCPIVAEyjOBEzrnGmlePPX/pYjD
 GNRw==
X-Gm-Message-State: APjAAAUW8T1K4X4A6F+Xvl4T/Ew90BNZbMwU7E3Myc3D7sgQbvUuQWlu
 +r0KR9yDy7v5iMLk9tyfxBA2sEtF44Q=
X-Google-Smtp-Source: APXvYqzn/oIF1mTYVsprFxxYYMt8JU5NFAZZsJ8ar0ZPDjF1+sbMvkWSHZA7e1FCF+zpIktByZu+gw==
X-Received: by 2002:a2e:9758:: with SMTP id f24mr16602074ljj.58.1563259491768; 
 Mon, 15 Jul 2019 23:44:51 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 27sm3529993ljw.97.2019.07.15.23.44.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 23:44:51 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/19] drm/r128: drop use of drmP.h
Date: Tue, 16 Jul 2019 08:42:08 +0200
Message-Id: <20190716064220.18157-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716064220.18157-1-sam@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+/36LAk7R2VAebPvKDqciE1K6qFXd52Km5YEX41pLTo=;
 b=M7ANGIIWAvzqLeSClUBsLb6XrnRpyBk4sClff0IK9HqPAceg5SOEgObNVmDKX51WSR
 F/mb04c9WAEscgGCeXTh5ic0KUZnch8AcE3pHNXUrNXyc52OjQoqoFhqhj7KfihvJZz0
 jrqyILqQ4WYuWfOrLViFSJJq49W67ivHO+IQeUGbXmkTPAl8dul7nXKkYTLe/aq0xu6k
 jVI8WyKxO4ccF/J+Ip/+ewQR9HxRE7OiSYKGkbS67V2PajolNsLcTUzgqzrJOHpvD7en
 evuoeBt0AbN7uZlafLEkfwmb9IbrF0jefspt60ALxL4Bp/sn7LbR/hTbB2GHGWiZdI0M
 FhFA==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlCndpdGggcmVs
ZXZhbnQgaW5jbHVkZXMuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+CkFja2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29t
PgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfaW9jMzIuYyB8
IDMgKystCiBkcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X2lycS5jICAgfCA1ICsrKystCiAyIGZp
bGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X2lvYzMyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcjEy
OC9yMTI4X2lvYzMyLmMKaW5kZXggNjU4OWY5ZTAzMTBlLi42YWM3MTc1NWMyMmQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfaW9jMzIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcjEyOC9yMTI4X2lvYzMyLmMKQEAgLTI5LDEwICsyOSwxMSBAQAogICogT1VUIE9GIE9SIElO
IENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5H
UwogICogSU4gVEhFIFNPRlRXQVJFLgogICovCisKICNpbmNsdWRlIDxsaW51eC9jb21wYXQuaD4K
IAotI2luY2x1ZGUgPGRybS9kcm1QLmg+CiAjaW5jbHVkZSA8ZHJtL3IxMjhfZHJtLmg+CisKICNp
bmNsdWRlICJyMTI4X2Rydi5oIgogCiB0eXBlZGVmIHN0cnVjdCBkcm1fcjEyOF9pbml0MzIgewpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9pcnEuYyBiL2RyaXZlcnMvZ3B1
L2RybS9yMTI4L3IxMjhfaXJxLmMKaW5kZXggOTczMGY0OTE4OTQ0Li5kODRlOWM5NmUyMGEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfaXJxLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3IxMjgvcjEyOF9pcnEuYwpAQCAtMzAsOCArMzAsMTEgQEAKICAqICAgIEVyaWMgQW5o
b2x0IDxhbmhvbHRARnJlZUJTRC5vcmc+CiAgKi8KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Cisj
aW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cisj
aW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KICNpbmNsdWRlIDxkcm0vcjEyOF9kcm0uaD4KKwog
I2luY2x1ZGUgInIxMjhfZHJ2LmgiCiAKIHUzMiByMTI4X2dldF92YmxhbmtfY291bnRlcihzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlwZSkKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
