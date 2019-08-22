Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B6B98941
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 04:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F846E40B;
	Thu, 22 Aug 2019 02:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0A56E40B;
 Thu, 22 Aug 2019 02:10:34 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id u34so5728512qte.2;
 Wed, 21 Aug 2019 19:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=skJUD71cBc/3zi/ve/lAsdH7aEJlxgIXS9x5Clh2cV8=;
 b=KcsSovh3YvV/KlyFLKA/XwdTjvei8eqJyLCrq0+6tS5xcdutsSIpr4hRlNu/u3fKd4
 o1GdPCEblXDfVIa+fCaOJGKCPml8anMynh2Oc8Q5cWI09nDCrfezhOwFSzM2y3Yah/2o
 bbDTki71iPcXz9eJcgHPGeDY/sfaKtGJGIMKaCoKQ+tqoe/yErI1xgN6JyPCtzqdOYgA
 ZNdnQIPvqnvyLT+oykTLGiVqeSEwQqTmGdu8R5+G+N0IV2SRBAutMMA7omL1na2/p526
 DNegaZXEpIYP+r1zEDWGV3SNtJ8S2ponwgK2+XsHEsV+hUsZLEaWr7Q7dSXqW3Ve7w3g
 vvdw==
X-Gm-Message-State: APjAAAWrdZ1lo+7+ex/H5wFar4/K8UDMPkIXZ/jlhPtHA6VpjaZoKtgJ
 hrVXJCSHLTrXuDPFAZseATi3Tp8i
X-Google-Smtp-Source: APXvYqySwbAcRwdz3nP5068fkN1ce8VrMJYfhimkbR+zgQBeQA05jSQQM++enF/ksx08hpH3S+KqEA==
X-Received: by 2002:ac8:1a36:: with SMTP id v51mr34041352qtj.201.1566439833462; 
 Wed, 21 Aug 2019 19:10:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id n21sm13152172qtc.70.2019.08.21.19.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 19:10:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.3
Date: Wed, 21 Aug 2019 21:10:22 -0500
Message-Id: <20190822021022.3356-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=skJUD71cBc/3zi/ve/lAsdH7aEJlxgIXS9x5Clh2cV8=;
 b=pEQmL/YwbbbdrZ+gUdbfLH1jrcmOWu+PNPeWXRIfiMr2M978/cIAMn94/D7Z76zWIJ
 CsM0REeqDo4fzUMFPkeC362G58wUx+9ixpMaJCr+evUieIGZ74VKc+W/bnCcqczGU3Vp
 OQfeTSWJQUjc3vgM9h3rvsyd9Ytw7De9g7hasdXFHFEfpRwnaca4LZe/MUoo2ME8LgTb
 uiIPPyCEX51pMq71ZUlvn4Hw8tMqk3UqGSuRJssnxgEBfcKvzL3ym0u7p2dnMCu8EYOR
 Zic7oi7IM8Nvx7IJTdzuEydgp8SeijwVgnuoODafsOYkBncZCqtj68T4OBPUl66O4xsy
 zb4A==
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

SGkgRGF2ZSwgRGFuaWVsLAoKQSBmZXcgZml4ZXMgZm9yIDUuMy4gIE5vdGhpbmcgbWFqb3IuCgpU
aGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDJmNjJjNWQ2ZWQwYWJhZThlNzBiZDgz
ZjRkNDFiOWQ2M2FjZGU0NWE6CgogIE1lcmdlIHRhZyAnZHJtLWZpeGVzLTUuMy0yMDE5LTA4LTE0
JyBvZiBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eCBpbnRvIGRybS1m
aXhlcyAoMjAxOS0wOC0xNSAxMzoyOToxOCArMTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9s
aW51eCB0YWdzL2RybS1maXhlcy01LjMtMjAxOS0wOC0yMQoKZm9yIHlvdSB0byBmZXRjaCBjaGFu
Z2VzIHVwIHRvIGVjNmU0OTEzNTNiOTAyNGQ0YjFhNjVjNDhiMjFlM2JjMGZhZWFlNGU6CgogIGRy
bS9hbWQvZGlzcGxheTogQ2FsY3VsYXRlIGJwYyBiYXNlZCBvbiBtYXhfcmVxdWVzdGVkX2JwYyAo
MjAxOS0wOC0yMSAxNzozMzozMiAtMDUwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtLWZpeGVzLTUuMy0yMDE5LTA4
LTIxOgoKYW1kZ3B1OgotIEZpeCBnZnhvZmYgbG9naWMgb24gUlYKLSBQb3dlcnBsYXkgZml4ZXMK
LSBGaXggYSBwb3NzaWJsZSBtZW1vcnkgbGVhayBpbiBDUyBpb2N0bAotIGJwYyBmaXggZm9yIGRp
c3BsYXkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KQWxleCBEZXVjaGVyICgxKToKICAgICAgZHJtL2FtZGdwdS9nZng5OiB1
cGRhdGUgcGdfZmxhZ3MgYWZ0ZXIgZGV0ZXJtaW5pbmcgaWYgZ2Z4IG9mZiBpcyBwb3NzaWJsZQoK
S2VubmV0aCBGZW5nICgxKToKICAgICAgZHJtL2FtZC9hbWRncHU6IGRpc2FibGUgTU1IVUIgUEcg
Zm9yIG5hdmkxMAoKS2V2aW4gV2FuZyAoMik6CiAgICAgIGRybS9hbWQvcG93ZXJwbGF5OiBmaXgg
dmFyaWFibGUgdHlwZSBlcnJvcnMgaW4gc211X3YxMV8wX3NldHVwX3BwdGFibGUKICAgICAgZHJt
L2FtZC9wb3dlcnBsYXk6IHJlbW92ZSBkdXBsaWNhdGUgbWFjcm8gc211X2dldF91Y2xrX2RwbV9z
dGF0ZXMgaW4gYW1kZ3B1X3NtdS5oCgpOaWNob2xhcyBLYXpsYXVza2FzICgxKToKICAgICAgZHJt
L2FtZC9kaXNwbGF5OiBDYWxjdWxhdGUgYnBjIGJhc2VkIG9uIG1heF9yZXF1ZXN0ZWRfYnBjCgpO
aWNvbGFpIEjDpGhubGUgKDEpOgogICAgICBkcm0vYW1kZ3B1OiBwcmV2ZW50IG1lbW9yeSBsZWFr
cyBpbiBBTURHUFVfQ1MgaW9jdGwKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Y3MuYyAgICAgICAgICAgIHwgIDkgKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjlfMC5jICAgICAgICAgICAgIHwgIDQgKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbnYuYyAgICAgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NvYzE1LmMgICAgICAgICAgICAgICAgfCAgNSAtLS0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDE2ICsrKysrKysrKysrKysrLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggICAgfCAgMiAt
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgICAgICAgICB8ICA0
ICsrKy0KIDcgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0p
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
