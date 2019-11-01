Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7CBEC5B2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 16:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2906F829;
	Fri,  1 Nov 2019 15:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88936F829
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 15:37:56 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id u13so8710304ote.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 08:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+yKNdLjlzkZtId7/VHsGjEwHkeu1ea1nr0nNcKO5t6A=;
 b=DcAOIKdR/RapcpvcG8IoFK6EQY/gjl7xe146stVXSG+fS/GX1L654iBJhvl/hQL5tp
 QJoPYRWlVDlzCTm1pUlMK0KWvvDc52Pl7AHlBg7JGu9FbrShSI54tnS4vOxB+VbdJjfJ
 tfu41E/OAtQ1pF3d7CrxK+hljQ5+TFMhhXDoIOcd9oHYrhDY4t9GU/0B+sDdQGEpx97l
 fIUIqv7AxTkTn0m6zMoiH9gEZB457KC9SUxeWIonEifBlL4mvd2bQIN8p7iK1a/D+bVB
 +s3Ih2ECTr3oBkYuDtJCuMhc9EA9QvZZipXHvrruQ32kWOf7gbe7NE8ki18t0iKH8Xb/
 gUcw==
X-Gm-Message-State: APjAAAX2HTwlxYQzF4uVKL8tYADIKrNDM1jLGViWY5Twy35SiqZghrLT
 tcvZhmd+sG7UtxyTaHog7ckO88c=
X-Google-Smtp-Source: APXvYqzgj+8kLVxuNakZZieBzKGqtwkeH2Vc6DDYC9EgCR0ChCGUg6kksKEXjNn5vGMlNjswdtXSeg==
X-Received: by 2002:a05:6830:1491:: with SMTP id
 s17mr9578349otq.310.1572622675509; 
 Fri, 01 Nov 2019 08:37:55 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t10sm2029720oib.49.2019.11.01.08.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 08:37:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/shmem: Add docbook comments for drm_gem_shmem_object
 madvise fields
Date: Fri,  1 Nov 2019 10:37:54 -0500
Message-Id: <20191101153754.22803-1-robh@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG1pc3NpbmcgZG9jYm9vayBjb21tZW50cyB0byBtYWR2aXNlIGZpZWxkcyBpbiBzdHJ1Y3QK
ZHJtX2dlbV9zaG1lbV9vYmplY3Qgd2hpY2ggZml4ZXMgdGhlc2Ugd2FybmluZ3M6CgppbmNsdWRl
L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oOjg3OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0
ZXIgb3IgbWVtYmVyICdtYWR2JyBub3QgZGVzY3JpYmVkIGluICdkcm1fZ2VtX3NobWVtX29iamVj
dCcKaW5jbHVkZS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuaDo4Nzogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAnbWFkdl9saXN0JyBub3QgZGVzY3JpYmVkIGluICdkcm1f
Z2VtX3NobWVtX29iamVjdCcKCkZpeGVzOiAxN2FjYjlmMzVlZDcgKCJkcm0vc2htZW06IEFkZCBt
YWR2aXNlIHN0YXRlIGFuZCBwdXJnZSBoZWxwZXJzIikKUmVwb3J0ZWQtYnk6IFNlYW4gUGF1bCA8
c2VhbkBwb29ybHkucnVuPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4K
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KLS0tCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oIHwgMTMgKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV9zaG1l
bV9oZWxwZXIuaAppbmRleCBlMmU5OTQ3YjQ3NzAuLjkwMWVhZmIwOTIwOSAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1f
Z2VtX3NobWVtX2hlbHBlci5oCkBAIC00NCw3ICs0NCwyMCBAQCBzdHJ1Y3QgZHJtX2dlbV9zaG1l
bV9vYmplY3QgewogCSAqLwogCXVuc2lnbmVkIGludCBwYWdlc191c2VfY291bnQ7CiAKKwkvKioK
KwkgKiBAbWFkdjogU3RhdGUgZm9yIG1hZHZpc2UKKwkgKgorCSAqIDAgaXMgYWN0aXZlL2ludXNl
LgorCSAqIEEgbmVnYXRpdmUgdmFsdWUgaXMgdGhlIG9iamVjdCBpcyBwdXJnZWQuCisJICogUG9z
aXRpdmUgdmFsdWVzIGFyZSBkcml2ZXIgc3BlY2lmaWMgYW5kIG5vdCB1c2VkIGJ5IHRoZSBoZWxw
ZXJzLgorCSAqLwogCWludCBtYWR2OworCisJLyoqCisJICogQG1hZHZfbGlzdDogTGlzdCBlbnRy
eSBmb3IgbWFkdmlzZSB0cmFja2luZworCSAqCisJICogVHlwaWNhbGx5IHVzZWQgYnkgZHJpdmVy
cyB0byB0cmFjayBwdXJnZWFibGUgb2JqZWN0cworCSAqLwogCXN0cnVjdCBsaXN0X2hlYWQgbWFk
dl9saXN0OwogCiAJLyoqCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
