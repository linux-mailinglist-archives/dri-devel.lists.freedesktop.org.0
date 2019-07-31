Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 463057CC9E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 21:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCFB89C86;
	Wed, 31 Jul 2019 19:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4D189C86;
 Wed, 31 Jul 2019 19:16:58 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id k9so46993672vso.5;
 Wed, 31 Jul 2019 12:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QJh69lOPI4fG4HfgnM059ahZFsKY8RxIkdrpH3PZrBE=;
 b=IDJTHyFCpJw0OhXr2wwQxmvS72/QS5GCZ9JrVguGSrwbz8kbPNkJfWahAGjhTCqDCU
 CQXOopgLs3ntmVriyfmnrNxC2P/jusZpr9maYnPLzDuwqGf0jRuCcjiyfhoapWMRqPRb
 ysTzJpGvvyHrB/XmGx6HQtEpE9IFOaHROpClUZgx+0kk8ZvQd20PHv/20TaLWVGXUmTz
 A8Xo3I4TTMKY3tS1Ol6CI7Tboc19FkIab9xBKIP483esLyrk788LMYWpx+auznrkox/p
 9pfu08/96GongHlkAW9t2UU/Q4xbE9Z6lY28Ts+URtX0w9htbdABcNra9aiRasyC4czB
 WCzw==
X-Gm-Message-State: APjAAAVYyND6abKIEtAiS+c+xeIVnVdMHT1c7VZ9U4T4R/obntqqL1YN
 PQTAzTnpoDKRX1flvLxLcyetN8Gc
X-Google-Smtp-Source: APXvYqy44IfLB6Q61Tnse5r5mafCVlVkxpzntjPk3Jec0EeT5IfVcYYjbHHgwtAv8qn+suNkWB2dFQ==
X-Received: by 2002:a67:ed81:: with SMTP id d1mr82508347vsp.157.1564600617286; 
 Wed, 31 Jul 2019 12:16:57 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id j80sm13144539vkj.47.2019.07.31.12.16.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 12:16:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.3
Date: Wed, 31 Jul 2019 14:16:48 -0500
Message-Id: <20190731191648.25729-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QJh69lOPI4fG4HfgnM059ahZFsKY8RxIkdrpH3PZrBE=;
 b=dIfQJuCUUSDL3qLq713ufhVzCc9J/deWkE38mG9+Mfk7AgeZ8yblas3jowxN3dMjnx
 ya4pvEuoNn/DWJoB2uQm9rBjbGJ9baPf9z74M0FUzG/zgPnF/cNi5ELsNdlKVskqfbn6
 2DK0NJ2OwvF/JbbDx+4579yiQb3z+s+QICbdY6v0d4kqp3aEEFCBR9t0cMiKULvsYDov
 FqHxpCJ7TDJU4DGT+8WsygN+0hRqEwiA2QkwVaT++yK0SSwt1Kj073z51brcb88v7bx6
 1fsKvXTz0zugDv9SPYzd/aAEOTHbo2BBQKzlvJXqsV5Q7UFQONeM9gyo2vWkTRWYSqxi
 he9A==
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

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuMy4gIE5vdGhpbmcgdG9vIG1ham9yLiAgQSBm
ZXcgZml4ZXMgZm9yIG5hdmkgYW5kIHNvbWUgZ2VuZXJhbApmaXhlcy4KClRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyBzaW5jZSBjb21taXQgNGQ1MzA4ZTc4NTI3NDEzMThlNGQ0MGZiOGQ0M2Q5MzExYjM5
ODRhZToKCiAgTWVyZ2UgdGFnICdkcm0tZml4ZXMtNS4zLTIwMTktMDctMjQnIG9mIGdpdDovL3Bl
b3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4IGludG8gZHJtLWZpeGVzICgyMDE5LTA3
LTI2IDE0OjEwOjI2ICsxMDAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkg
YXQ6CgogIGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4IHRhZ3MvZHJt
LWZpeGVzLTUuMy0yMDE5LTA3LTMxCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNmRl
ZTQ4MjljZmRlMTA2YThhZjdkMGQzYmEyMzAyMmY4ZjA1NDc2MToKCiAgZHJtL2FtZC9wb3dlcnBs
YXk6IGNvcnJlY3QgVVZEL1ZDRS9WQ04gcG93ZXIgc3RhdHVzIHJldHJpZXZhbCAoMjAxOS0wNy0z
MSAwMjowMjoyMiAtMDUwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtLWZpeGVzLTUuMy0yMDE5LTA3LTMxOgoKYW1k
Z3B1OgotIEZpeCB0ZW1wZXJhdHVyZSBncmFudWxhcml0eSBmb3IgbmF2aQotIEZpeCBzdGFibGUg
cHN0YXRlIHNldHRpbmcgZm9yIG5hdmkKLSBGaXggVkNOIERQTSBlbmFibGVtZW50IG9uIG5hdmkK
LSBGaXggZXJyb3IgaGFuZGxpbmcgb24gQ1MgaW9jdGwgd2hlbiBwcm9jZXNzaW5nIGRlcGVuZGVu
Y2llcwotIEZpeCBwb3NzaWJsZSBpbmZvcm1hdGlvbiBsZWFrIGluIGRlYnVnZnMKCmFtZGtmZDoK
LSBmaXggbWVtb3J5IGFsaWdubWVudCBmb3IgVmVnYU0KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQWxleCBEZXVjaGVyICgx
KToKICAgICAgZHJtL2FtZGdwdS9wb3dlcnBsYXk6IHVzZSBwcm9wZXIgcmV2aXNpb24gaWQgZm9y
IG5hdmkKCkNocmlzdGlhbiBLw7ZuaWcgKDEpOgogICAgICBkcm0vYW1kZ3B1OiBmaXggZXJyb3Ig
aGFuZGxpbmcgaW4gYW1kZ3B1X2NzX3Byb2Nlc3NfZmVuY2VfZGVwCgpFdmFuIFF1YW4gKDcpOgog
ICAgICBkcm0vYW1kL3Bvd2VycGxheTogZml4IG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSBhcm91
bmQgZHBtIHN0YXRlIHJlbGF0ZXMKICAgICAgZHJtL2FtZC9wb3dlcnBsYXk6IGVuYWJsZSBTVyBT
TVUgcmVzZXQgZnVuY3Rpb25hbGl0eQogICAgICBkcm0vYW1kL3Bvd2VycGxheTogYWRkIG5ldyBz
ZW5zb3IgdHlwZSBmb3IgVkNOIHBvd2VyZ2F0ZSBzdGF0dXMKICAgICAgZHJtL2FtZC9wb3dlcnBs
YXk6IHN1cHBvcnQgVkNOIHBvd2VyZ2F0ZSBzdGF0dXMgcmV0cmlldmFsIG9uIFJhdmVuCiAgICAg
IGRybS9hbWQvcG93ZXJwbGF5OiBzdXBwb3J0IFZDTiBwb3dlcmdhdGUgc3RhdHVzIHJldHJpZXZh
bCBmb3IgU1cgU01VCiAgICAgIGRybS9hbWQvcG93ZXJwbGF5OiBjb3JyZWN0IE5hdmkxMCBWQ04g
cG93ZXJnYXRlIGNvbnRyb2wgKHYyKQogICAgICBkcm0vYW1kL3Bvd2VycGxheTogY29ycmVjdCBV
VkQvVkNFL1ZDTiBwb3dlciBzdGF0dXMgcmV0cmlldmFsCgpLZW50IFJ1c3NlbGwgKDEpOgogICAg
ICBkcm0vYW1ka2ZkOiBGaXggYnl0ZSBhbGlnbiBvbiBWZWdhTQoKS2V2aW4gV2FuZyAoMik6CiAg
ICAgIGRybS9hbWQvcG93ZXJwbGF5OiBhZGQgY2FsbGJhY2sgZnVuY3Rpb24gb2YgZ2V0X3RoZXJt
YWxfdGVtcGVyYXR1cmVfcmFuZ2UKICAgICAgZHJtL2FtZC9wb3dlcnBsYXk6IGZpeCB0ZW1wZXJh
dHVyZSBncmFudWxhcml0eSBlcnJvciBpbiBzbXUxMQoKV2FuZyBYaWF5YW5nICgxKToKICAgICAg
ZHJtL2FtZGdwdTogZml4IGEgcG90ZW50aWFsIGluZm9ybWF0aW9uIGxlYWtpbmcgYnVnCgogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jICB8ICAzICstCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyAgICAgICAgICAgIHwgMjYgKysr
Ky0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgICAgICAg
fCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgICAgICAgICAg
ICB8IDc0ICsrKysrKysrKysrKysrKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1
ZGUva2dkX3BwX2ludGVyZmFjZS5oICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jICAgICAgICB8IDIzICsrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMgfCAgOSArKysKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgICAgICAgIHwgNDggKysrKysrKysrLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyAgICAgICAgIHwgMzYg
KysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyAg
ICAgICAgfCAzNCArKysrLS0tLS0tLQogMTEgZmlsZXMgY2hhbmdlZCwgMTUwIGluc2VydGlvbnMo
KyksIDEwNyBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
