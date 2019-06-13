Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715C743232
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 04:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49134891AC;
	Thu, 13 Jun 2019 02:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2252891AC;
 Thu, 13 Jun 2019 02:19:07 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id h21so20787054qtn.13;
 Wed, 12 Jun 2019 19:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UOYx8NEpdNhPEuei2sKpiKpWDNGBSsssD9MgKJQmsPA=;
 b=QBzjvTgYQckTUT661SHAntcLPt0vTUmOjWMl9j6BT9kQlaNoXistgJR9RpwjAqseOT
 954fgR0J8dyz5fMj2LGnSbjKu0p/q20qyT+ZIbAiq2eyoCqnBfZIvmo+R9tT3ihnypuN
 i2kxdrVwqVzpHK3GbQvb9YOgAnvVxy+wGaSmbl1eQcPXq5hpE/6/HSEOlrBnIRI/N+lu
 8mG96bddHb8hoV2tlyxLhuBjQFlClTkLXoJvlwPl1nmlL/Pg+kkXe4tCiW1lkpsnGk1f
 57pcq8bJrlrP8gLVObqiLRPurWpy6zxieNcH8eRrpYIU0AyHULlx6PfRrzD8k3Vf5etW
 6ltA==
X-Gm-Message-State: APjAAAX4nTwn0kpS1ec4YLbkmFpaoOgs19sYtYXaLQSZEgBSfSlr1zIo
 7KLI5UtrJs4/v/c2NrPzNhkC2YeAX9g=
X-Google-Smtp-Source: APXvYqxySwR6LIa5SaexuMiyTxeSZx5l125y97+rfZIaganaEGWevMQWWyWZJpNM2z0H9Z8ny38DdA==
X-Received: by 2002:aed:378a:: with SMTP id j10mr74527899qtb.6.1560392346689; 
 Wed, 12 Jun 2019 19:19:06 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id d141sm749088qke.3.2019.06.12.19.19.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 19:19:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.2
Date: Wed, 12 Jun 2019 21:18:56 -0500
Message-Id: <20190613021856.3307-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UOYx8NEpdNhPEuei2sKpiKpWDNGBSsssD9MgKJQmsPA=;
 b=JX7Krp2ZJI4UAr8ZEXNB85el0ZdwhcDvZfXZm6g2cVCpj1EMwpAkc40Ua7UnLXkiph
 6jT41r3XYu0SZDasnWu1H4yHHO734xUTk6BC2TZT+DIUfdOwqrQAUm1qWgD4B5ujPkiK
 VgptWazx3pXCFo1r2CzsNLsf4BWbwYnProRFu3guJbXVkTlqGuhnhDeJP3/D32Xb7XuJ
 upgzkarM+Lo13K2doOBbLzLChrsRcjJJx3mwNw88Z5T1PQZ0pGHhKQfx73IoP+gjjsFZ
 6NQp6q1Zkh5rSwrryL+EgfThZu/1ucOA9uKs+qAj1zOgs1bqFo4jNn4DxBEXWh+9g5DG
 ZGUg==
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

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuMjoKLSBFeHRlbmQgcHJldmlvdXMgdmNlIGZp
eCBmb3IgcmVzdW1lIHRvIHV2ZCBhbmQgdmNuCi0gRml4IGJvdW5kcyBjaGVja2luZyBpbiByYXMg
ZGVidWdmcyBpbnRlcmZhY2UKLSBGaXggYSByZWdyZXNzaW9uIG9uIFNJIHVzaW5nIGFtZGdwdQoK
VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2NzFlMmVlNWVlMjEyNzE3OWNhODg0
YjQzOWFiNjAwMWE2MjNlZGQ2OgoKICBNZXJnZSBicmFuY2ggJ2xpbnV4LTUuMicgb2YgZ2l0Oi8v
Z2l0aHViLmNvbS9za2VnZ3NiL2xpbnV4IGludG8gZHJtLWZpeGVzICgyMDE5LTA2LTA3IDE3OjE2
OjAwICsxMDAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdp
dDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4IGRybS1maXhlcy01LjIKCmZv
ciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBmM2E1MjMxYzhmMTRhY2Q0Mjg0NWU5ZTYwZjUw
NmI0ZTk0OGYwZTY4OgoKICBkcm0vYW1kZ3B1OiByZXR1cm4gMCBieSBkZWZhdWx0IGluIGFtZGdw
dV9wbV9sb2FkX3NtdV9maXJtd2FyZSAoMjAxOS0wNi0xMiAyMDozOTo0OSAtMDUwMCkKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KQWxleCBEZXVjaGVyICgxKToKICAgICAgZHJtL2FtZGdwdTogcmV0dXJuIDAgYnkgZGVmYXVs
dCBpbiBhbWRncHVfcG1fbG9hZF9zbXVfZmlybXdhcmUKCkRhbiBDYXJwZW50ZXIgKDEpOgogICAg
ICBkcm0vYW1kZ3B1OiBGaXggYm91bmRzIGNoZWNraW5nIGluIGFtZGdwdV9yYXNfaXNfc3VwcG9y
dGVkKCkKClNoaXJpc2ggUyAoMSk6CiAgICAgIGRybS9hbWRncHUve3V2ZCx2Y259OiBmZXRjaCBy
aW5nJ3MgcmVhZF9wdHIgYWZ0ZXIgYWxsb2MKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcG0uYyAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuaCB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyB8IDQg
KysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYyAgIHwgNSArKysrLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYyAgIHwgNSArKysrLQogNSBmaWxl
cyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
