Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E075AEFF
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 08:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EFE6E9DD;
	Sun, 30 Jun 2019 06:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7336E9C9
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 06:19:50 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x144so6585364lfa.9
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 23:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DRdsfWL+TKxNSlU1fuj0nTxTa2na9h2AjqNSbXQgYUk=;
 b=LKhdtqEfJp4f+JF/NuQI3eOzEesiGoaN+rHmzqTLrggYKGI6EwBpjHpbPXFf6XBDp1
 x4N9r9oojyxyIdxaK5+lJ5w2kSeqGuSv42sJNx1p/vMM+lpwS1+66VvSgg4jr8yB3zIf
 PltoCn2oGlT624+d25X//RgDhigaG53qN/1Jl6XTYMfpbbWZ/0kLSvJNAfD9PaxlznNx
 b+pHeDijbpsww/YyDJ8/pXaOb8uB3g0PfGtEFKzEC/piEQLb0c+RBT7To5Q/JFZ/dYQM
 s7Y5LxPutdx9JWbS/CZGHsMF33RHb6uC7ODjMZw3lIGclnTYmTHs7QJauOdtGqw3gMj5
 k6cQ==
X-Gm-Message-State: APjAAAXE6Pu9ZeGnSng9kU48uJOoHsDccEf4WGuT+OxzA/2Kp7FTXn3U
 2mpaDn5Hi1sk1AM7+hsFtaXI5fyi5/pbbQ==
X-Google-Smtp-Source: APXvYqyM9iDni0m9jzSPJtFB7E8UnKVMqn/tEYxg/VjTH/nMIecEhRAKUw/nAECtE3PBp42Nibp2qg==
X-Received: by 2002:a19:a87:: with SMTP id 129mr8494622lfk.98.1561875588504;
 Sat, 29 Jun 2019 23:19:48 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o74sm1794024lff.46.2019.06.29.23.19.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 23:19:48 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 20/33] drm/vgem: drop use of drmP.h
Date: Sun, 30 Jun 2019 08:19:09 +0200
Message-Id: <20190630061922.7254-21-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DRdsfWL+TKxNSlU1fuj0nTxTa2na9h2AjqNSbXQgYUk=;
 b=LWp7M9ZtAfvcA/FKc/t0h1q+3U57pcvwqSm+4oji9aFmKacLmcgO4MiYtfXkYBP2mA
 Rh61hclutFzgQ54TLKRO/6bINy89N52HxRJbGm+b9ojrpb6fcTeXoSZ5LX7rd17z/L8a
 sXMPTMmKajIZH0IG/i4nF6OeRXl04ttY+RMEhIdKSXm2ev2flbnTkR0c+LJ793t7Q3sQ
 p3ZYGMBFRnIWFyKfwfaFQEFC7dh9T3OiY0DPVtwfO0TQoLU5znIx8Khxer/jItXkdz2r
 HTGzhq7+vZdjnlX6epRJWQ2u4u1pwY8BhmGkUKbxHrCCqOGZaOttRZUP08VKqzoHWVBJ
 0ocg==
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
Cc: Deepak Sharma <deepak.sharma@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Eric Biggers <ebiggers@google.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgaGVhZGVyIGRybVAuaC4KUmVwbGFjZSB3aXRoIG5l
Y2Vzc2FyeSBpbmNsdWRlcyBpbiB0aGUgaW5kaXZpZHVhbCAuYyBmaWxlcy4KClNpZ25lZC1vZmYt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEVt
aWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiBFcmljIEFuaG9sdCA8
ZXJpY0BhbmhvbHQubmV0PgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+CkNjOiBSb2RyaWdvIFNpcXVlaXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWlsLmNvbT4K
Q2M6IEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAZ29vZ2xlLmNvbT4KQ2M6IERlZXBhayBTaGFybWEg
PGRlZXBhay5zaGFybWFAYW1kLmNvbT4KQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPgpDYzogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgpD
YzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWci
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiAiTWljaGVsIETDpG56ZXIiIDxtaWNoZWwu
ZGFlbnplckBhbWQuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzog
VGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tClRoZSBsaXN0IG9mIGNjOiB3
YXMgdG9vIGxhcmdlIHRvIGFkZCBhbGwgcmVjaXBpZW50cyB0byB0aGUgY292ZXIgbGV0dGVyLgpQ
bGVhc2UgZmluZCBjb3ZlciBsZXR0ZXIgaGVyZToKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktSnVuZS90aHJlYWQuaHRtbApTZWFyY2ggZm9yICJk
cm06IGRyb3AgdXNlIG9mIGRybXAuaCBpbiBkcm0tbWlzYyIKCiAgICAgICAgU2FtCgogZHJpdmVy
cy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYyAgIHwgMTEgKysrKysrKysrLS0KIGRyaXZlcnMvZ3B1
L2RybS92Z2VtL3ZnZW1fZHJ2LmggICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1f
ZmVuY2UuYyB8ICAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMKaW5kZXggMzg2ZWZjM2I1ODQzLi4yNzIy
MjYzMWNiYWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYwpAQCAtMzAsMTAgKzMwLDE3IEBACiAg
KiBzb2Z0d2FyZSByZW5kZXJlciBhbmQgdGhlIFggc2VydmVyIGZvciBlZmZpY2llbnQgYnVmZmVy
IHNoYXJpbmcuCiAgKi8KIAorI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYuaD4KICNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4KLSNpbmNsdWRlIDxsaW51eC9yYW1mcy5oPgorI2luY2x1ZGUgPGxpbnV4
L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3NobWVtX2ZzLmg+Ci0jaW5jbHVk
ZSA8bGludXgvZG1hLWJ1Zi5oPgorI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KKworI2luY2x1
ZGUgPGRybS9kcm1fZHJ2Lmg+CisjaW5jbHVkZSA8ZHJtL2RybV9maWxlLmg+CisjaW5jbHVkZSA8
ZHJtL2RybV9pb2N0bC5oPgorI2luY2x1ZGUgPGRybS9kcm1fcHJpbWUuaD4KKwogI2luY2x1ZGUg
InZnZW1fZHJ2LmgiCiAKICNkZWZpbmUgRFJJVkVSX05BTUUJInZnZW0iCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdl
bV9kcnYuaAppbmRleCA1YzhmNmQ2MTlmZjMuLjBlZDMwMDMxN2Y4NyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vdmdlbS92
Z2VtX2Rydi5oCkBAIC0yOSw3ICsyOSw2IEBACiAjaWZuZGVmIF9WR0VNX0RSVl9IXwogI2RlZmlu
ZSBfVkdFTV9EUlZfSF8KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+CiAjaW5jbHVkZSA8ZHJtL2Ry
bV9nZW0uaD4KICNpbmNsdWRlIDxkcm0vZHJtX2NhY2hlLmg+CiAKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92Z2VtL3ZnZW1fZmVuY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1f
ZmVuY2UuYwppbmRleCAwODk5N2ZkZDNjY2IuLmQ4NjMwNDY3NTQ5YyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9mZW5jZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92Z2Vt
L3ZnZW1fZmVuY2UuYwpAQCAtMjMsNiArMjMsOCBAQAogI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYu
aD4KICNpbmNsdWRlIDxsaW51eC9yZXNlcnZhdGlvbi5oPgogCisjaW5jbHVkZSA8ZHJtL2RybV9m
aWxlLmg+CisKICNpbmNsdWRlICJ2Z2VtX2Rydi5oIgogCiAjZGVmaW5lIFZHRU1fRkVOQ0VfVElN
RU9VVCAoMTAqSFopCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
