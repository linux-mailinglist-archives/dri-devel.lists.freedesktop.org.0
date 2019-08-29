Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41F2A0F93
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 04:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EA68925C;
	Thu, 29 Aug 2019 02:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F290891F8;
 Thu, 29 Aug 2019 02:29:37 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id t12so1983152qtp.9;
 Wed, 28 Aug 2019 19:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LtHbxL90dUZuabDG2kHu/tTrsVIEz3szQp8FcLzR6pk=;
 b=P4Wj2CmgGbPpYOkIIdpK3EQSR1hgl/LC6kqLoizwzGOJV9H0QNAwEc+zhd6m5t5Okv
 SisrGwEOPKse2xcCwSyqHJUOKpEKcSONzwnMGD5CrAAetjDCST4v38L6A/3lU5RO457D
 m7bdhE4TZPwEMKJBnEagkaXcMh5iZqNERJg6rlBntiR6aPLJjkTPsKNljODcWWUrFAB2
 OyensDytXqSoUMBkPX5PJIILfu+AjspSGI2xKZm3fW68/zx4HzFVxT+6nGnFvNzvrSzm
 dE8zkUsd1z0AI7rWOBXMWNHkUqQKxzQ5qAebp5e4CO9/3K4KVfBiCEL6c2MGmIPjNkB4
 vBHA==
X-Gm-Message-State: APjAAAUQi17IPh5wx6hY73/lBmrA9dhEmg8gD44jCXWq3ggn1SbeWC5z
 aUNuV+Yi98aDA5t1+LcxOypSfR4K
X-Google-Smtp-Source: APXvYqxcRkyt19Yj6MmtdvlxhUFahlaIgmmcdVkAnWWDo0i/O9E5w2IPyh07TkKYb8Crc2pSECmRyg==
X-Received: by 2002:ac8:5219:: with SMTP id r25mr7947253qtn.43.1567045776311; 
 Wed, 28 Aug 2019 19:29:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id e2sm495542qki.70.2019.08.28.19.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 19:29:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.3
Date: Wed, 28 Aug 2019 21:29:25 -0500
Message-Id: <20190829022925.32678-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LtHbxL90dUZuabDG2kHu/tTrsVIEz3szQp8FcLzR6pk=;
 b=uQlmH71rYZPb6FDjpcVTeqSCc1P9cdNxM57zEqtRO4EgNvvGKXe6whfMhBWmbMkxz1
 mfRc7PsK8OtC7R86sHKu5FTkzwIgweXZ2Pu6fJQzBFJZrJ3myLfAIQlgMpuHcZ6EJxiA
 w2B7Yix4mzuk9bR/F+Rrkeem/ogQdxisxHceZC5WDIPGV0oMN4zxIGbbAgUuPjJYtR27
 49Vq59sa6kazLeEy7a9yhiC5/YpaGQVcDrIX5RkEuzVxbuYf0BP2rDMUJyTle9yn/4bs
 zPGoA79fJQFlO8BhaoYIaI3UOv3RwUtDD8Tt1ECR3XPosEMOfrMPznMEihcIGk8z9LH1
 GM5A==
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

SGkgRGF2ZSwgRGFuaWVsLAoKQSBmZXcgZml4ZXMgZm9yIDUuMy4gIE5vdGhpbmcgdG9vIG1ham9y
LgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3ODM3OTUxYTEyZmRhZjg4ZDJj
NTFmZjA3NTc5ODBjMDAwNzI3OTBjOgoKICBkcm0vbWVkaWF0ZWs6IGluY2x1ZGUgZG1hLW1hcHBp
bmcgaGVhZGVyICgyMDE5LTA4LTI0IDE1OjA5OjIwICsxMDAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0
aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFn
ZDVmL2xpbnV4IHRhZ3MvZHJtLWZpeGVzLTUuMy0yMDE5LTA4LTI4Cgpmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8gNDE5NDBmZjUwZjZjMzQ3ZjM1NDExNjM3MDI1NjZjZDUyNjIwMGQ5ODoK
CiAgZHJtL2FtZGdwdTogZml4IEdGWE9GRiBvbiBQaWNhc3NvIGFuZCBSYXZlbjIgKDIwMTktMDgt
MjcgMTI6MjU6MjAgLTA1MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRybS1maXhlcy01LjMtMjAxOS0wOC0yODoKCmFt
ZGdwdToKLSBGaXggR0ZYT0ZGIHJlZ3Jlc3Npb24gZm9yIFBDTyBhbmQgUlYyCi0gRml4IG1pc3Np
bmcgZmVuY2UgcmVmZXJlbmNlCi0gRml4IFZHMjAgcG93ZXIgcmVhZGluZ3Mgb24gY2VydGFpbiBT
TVUgZmlybXdhcmUgdmVyc2lvbnMKLSBGaXggZHBtIGxldmVsIHNldHVwIGZvciBWRzIwCi0gQWRk
IGFuIEFUUFggbGFwdG9wIHF1aXJrCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFhcm9uIExpdSAoMSk6CiAgICAgIGRybS9h
bWRncHU6IGZpeCBHRlhPRkYgb24gUGljYXNzbyBhbmQgUmF2ZW4yCgpDaHJpc3RpYW4gS8O2bmln
ICgxKToKICAgICAgZHJtL2FtZGdwdTogZml4IGRtYV9mZW5jZV93YWl0IHdpdGhvdXQgcmVmZXJl
bmNlCgpFdmFuIFF1YW4gKDEpOgogICAgICBkcm0vYW1kL3Bvd2VycGxheTogY29ycmVjdCBWZWdh
MjAgZHBtIGxldmVsIHJlbGF0ZWQgc2V0dGluZ3MKCkthaS1IZW5nIEZlbmcgKDEpOgogICAgICBk
cm0vYW1kZ3B1OiBBZGQgQVBUWCBxdWlyayBmb3IgRGVsbCBMYXRpdHVkZSA1NDk1CgpLZW50IFJ1
c3NlbGwgKDIpOgogICAgICBkcm0vcG93ZXJwbGF5OiBGaXggVmVnYTIwIEF2ZXJhZ2UgUG93ZXIg
dmFsdWUgdjQKICAgICAgZHJtL3Bvd2VycGxheTogRml4IFZlZ2EyMCBwb3dlciByZWFkaW5nIGFn
YWluCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0cHhfaGFuZGxlci5jICAg
fCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMgICAgICAgICAg
ICB8IDI3ICsrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAg
ICAgICAgICAgICAgfCAxNCArKy0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdt
Z3IvdmVnYTIwX2h3bWdyLmMgfCA2NiArKysrKysrKysrKysrKysrKysrLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgICAgICAgICB8IDExICsrKy0KIDUgZmls
ZXMgY2hhbmdlZCwgOTIgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
