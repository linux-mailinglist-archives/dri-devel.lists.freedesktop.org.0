Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB88E2F0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 04:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29C56E890;
	Thu, 15 Aug 2019 02:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E9A6E88F;
 Thu, 15 Aug 2019 02:57:16 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id j15so944792qtl.13;
 Wed, 14 Aug 2019 19:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k6NQ80tEOfFgI/SeU3UYiNse4TnhVDyltWAaZ9URt30=;
 b=d4q7npXbq5k2DzNDsSTGpDa0cqlwDdcKJoJPbheZtK2f/4/TZLSypeJzW9emdlt/Bt
 dj6i754OWdhCbyqaLgEvqAofcOVbNfXBhOqL/vf/HND9w5psMonFH6vM78/AzWJB8KQv
 2Ijy2CcrYaIer/GZCCYYeXciiAQXRI/DPOb+BMhs1pes/H9MLoFCVcdYXQPnSjTaTpmI
 mxjoXp4WXQVZdyBO0+vuzIT+X14FSd05JlKj/wRiU2DUub+xEidYOKbVnugFSU8/Ghf0
 rEOtFEPkFwQUqtHRf9nSYiE0i5VoeZhOPrZgCH1b32/5sJFVOd+bVLKSWlVozCpR2Od0
 /jSg==
X-Gm-Message-State: APjAAAWPyonQ7atjoalhXfvfOU2Q7i+ztJ3kZK2QZsZt3+RGYJ+NK+Ue
 CfjrOw633uL8vINwRHl8afL9l5ar
X-Google-Smtp-Source: APXvYqwmkNsT7jtw6MHjQdwm+inYxIdvpCcDOekNwUIZNjXq7wxdryHalnU3yz5gHVuxbMy12uWR1Q==
X-Received: by 2002:ac8:1a36:: with SMTP id v51mr2124679qtj.201.1565837368084; 
 Wed, 14 Aug 2019 19:49:28 -0700 (PDT)
Received: from localhost.localdomain ([71.219.46.89])
 by smtp.gmail.com with ESMTPSA id i74sm858133qke.133.2019.08.14.19.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 19:49:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, scheduler drm-fixes-5.3
Date: Wed, 14 Aug 2019 21:49:19 -0500
Message-Id: <20190815024919.3434-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k6NQ80tEOfFgI/SeU3UYiNse4TnhVDyltWAaZ9URt30=;
 b=o4LN1GLIzFDNMQwsku0txVz0SjN6aJWEgXxYN5NE6x/cqiTNLkm+TYGbRZvWogzdWs
 UdbieXIxurAA1hePqxkfxue8aQNSumL4neLKZwTMUa7G/ciNECXNLyXIHrwDj1s8EKJA
 WcRO6KqMyN6h3AD1fWS7ebAyQAPFYs9Fu+1KgvPCAo2IYyXAZU4V7b6mHUERhKhYFKTB
 +yGVZidRtUzdv1YB8NuL1yYLoF8bI6utTiOsdLF4YZwzI5YhHXwAgS5SO6CPnHzZFLOn
 SFfjDqEvWJKvUL4sNWca61IP0iKeMurwAshkExTmXKaYw4vsD1MAYWpCcMDOfky4Yr7s
 zMfg==
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
aGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGQ0NTMzMWIwMGRkYjE3OWUyOTE3NjY2
MTcyNTkyNjFjMTEyZGI4NzI6CgogIExpbnV4IDUuMy1yYzQgKDIwMTktMDgtMTEgMTM6MjY6NDEg
LTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8v
cGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXggdGFncy9kcm0tZml4ZXMtNS4zLTIw
MTktMDgtMTQKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBlMWI0Y2UyNWRiYzkzYWIw
Y2I4ZWQwZjIzNmEzYjlmZjdiMDM4MDJjOgoKICBkcm0vc2NoZWR1bGVyOiB1c2Ugam9iIGNvdW50
IGluc3RlYWQgb2YgcGVlayAoMjAxOS0wOC0xNCAxNTo0NTo1MyAtMDUwMCkKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJt
LWZpeGVzLTUuMy0yMDE5LTA4LTE0OgoKYW1kZ3B1OgotIFVzZSBrdmFsbG9jIGZvciBkY19zdGF0
ZSB0byBhdm9pZCBhbGxvY2F0aW9uCiAgZmFpbHVyZXMgaW4gc29tZSBjYXNlcy4KLSBGaXggZ2Z4
OSBzb2Z0IHJlY292ZXJ5CgpzY2hlZHVsZXI6Ci0gRml4IGEgcmFjZSBjb25kaXRpb24gd2hlbiBk
ZXN0cm95aW5nIGVudGl0aWVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFsZXggRGV1Y2hlciAoMSk6CiAgICAgIGRybS9h
bWQvZGlzcGxheTogdXNlIGt2bWFsbG9jIGZvciBkY19zdGF0ZSAodjIpCgpDaHJpc3RpYW4gS8O2
bmlnICgxKToKICAgICAgZHJtL3NjaGVkdWxlcjogdXNlIGpvYiBjb3VudCBpbnN0ZWFkIG9mIHBl
ZWsKClBpZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyICgxKToKICAgICAgZHJtL2FtZGdwdTogZml4
IGdmeDkgc29mdCByZWNvdmVyeQoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8w
LmMgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyB8
IDExICsrKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5j
IHwgIDQgKystLQogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
