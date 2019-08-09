Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A68882E2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 20:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E936EE81;
	Fri,  9 Aug 2019 18:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401B76EE81;
 Fri,  9 Aug 2019 18:48:23 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id w190so72423418qkc.6;
 Fri, 09 Aug 2019 11:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BJYSRJCsyQ/ii7E1bFnlPcr2Xe3vgNH18wBZYVfkUsw=;
 b=XBXiUWV1acdJyN3RvILRPJOoOvPnQ1H6cwi6EqS5rlMdwCr4QAZ5oXRTmidDa6/QVv
 i9SpYlxm8nHNb3xeNtdIqLSGmsfru9aBildyTnbFXfH0SuGgOi7lBSwPV0qNjtIlXGic
 v0wG9HM/Av9aBOxAFcRxv3DKlUxNM7icT95Qr7xzWdg903FxdIJDbOoSI57KA/toBusI
 jG1Atkfcm9oXNb1o5nu9i56sqj9LhDLcqvgKUlnCze9Pb+wq1Htaj4GQvW0nX1wHUCAR
 X0+apyGwV23h3Yz6AjbH/q5VyUrEnkLG11cOIoR6jZMqEDbRBXOEdcp0trcoZoVMvtZ9
 VgxQ==
X-Gm-Message-State: APjAAAUTaWt+EikMuCEVk8nrz8cdtvCQWCfzyVTdgAIrwQQBz09sfz4j
 ep6m2vt7aq6e4uDuysOeUOxdruRO
X-Google-Smtp-Source: APXvYqyqqnjcWXVIdeYNj4G/U4OOiAAwRctXkxMj57L9xSKgwE0KCs2mGrVa8/CE4Qcxq1TK7uzufQ==
X-Received: by 2002:a37:2d43:: with SMTP id t64mr19131978qkh.472.1565376501951; 
 Fri, 09 Aug 2019 11:48:21 -0700 (PDT)
Received: from localhost.localdomain ([172.56.29.195])
 by smtp.gmail.com with ESMTPSA id n14sm286030qkk.75.2019.08.09.11.48.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 11:48:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd, radeon, ttm drm-next-5.4
Date: Fri,  9 Aug 2019 13:48:07 -0500
Message-Id: <20190809184807.3381-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BJYSRJCsyQ/ii7E1bFnlPcr2Xe3vgNH18wBZYVfkUsw=;
 b=NqzZBWqX3iPQtypBHOAvsvfs5zUGzSSYlomK2AiDgATFqbV/rJG6yu2FMCYL4kQTt6
 KrM8ZJTA92BZmV6n7yFY/85LaieHO35+E8mlKSdH/MsuPyovMC/FVzUqhhgohlryR0yO
 ibegwPiH6aePdDdIsdMWdA/bol3z+R2M3FUMMSj+q9acMyrwgmOVjq9biDqL6ad4O5gz
 huEFnmpTEWHH/4ncegXtLwib2SWNbMidLegDUgfZxYcw2tGsSZYVtGL/0rkkaCHW0TNZ
 7igvY2dEAAYbd0vh+07NpZBRBij53kfvwV49twlG88FBqgs5m8fnpinfSztIqWjOcT0a
 QoKA==
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

SGkgRGF2ZSwgRGFuaWVsLAoKU2FtZSByZXF1ZXN0IGFzIGVhcmxpZXIsIGJ1dCB3aXRoIHRoZSBy
ZWFkcS93cml0ZXEgc3R1ZmYgcmVzb2x2ZWQgYW5kIDUuMy1yYzMKYmFja21lcmdlZC4gIGRpZmZz
dGF0IHRyaW1tZWQgZm9yIHNpemUuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0
IDQxYTVhMmE4NTMxZjk1ZDE4YmI0ZWZkZGVhNTgxY2NiNDY5ZThlZTU6CgogIGRybS9hbWQvZGlz
cGxheTogaW5pdCByZXNfcG9vbCBkY2NnX3JlZiwgZGNodWJfcmVmIHdpdGggeHRhbGluX2ZyZXEg
KDIwMTktMDctMTggMTQ6MTI6MDggLTA1MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoKCiAgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXgg
dGFncy9kcm0tbmV4dC01LjQtMjAxOS0wOC0wOQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIDNmNjFmZDQxZjM4MzI4ZjBhNTg1ZWFiYTJkNzJkMzM5ZmU5YWVjZGE6CgogIE1lcmdlIHRh
ZyAndjUuMy1yYzMnIGludG8gZHJtLW5leHQtNS40ICgyMDE5LTA4LTA5IDEzOjA3OjI4IC0wNTAw
KQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpkcm0tbmV4dC01LjQtMjAxOS0wOC0wOToKClNhbWUgYXMgZHJtLW5leHQtNS40
LTIwMTktMDgtMDYsIGJ1dCB3aXRoIHRoZQpyZWFkcS93cml0ZXEgc3R1ZmYgZml4ZWQgYW5kIDUu
My1yYzMgYmFja21lcmdlZC4KCmFtZGdwdToKLSBBZGQgbmF2aTE0IHN1cHBvcnQKLSBBZGQgbmF2
aTEyIHN1cHBvcnQKLSBBZGQgQXJjdHVydXMgc3VwcG9ydAotIEVuYWJsZSBtY2xrIERQTSBmb3Ig
TmF2aQotIE1pc2MgREMgZGlzcGxheSBmaXhlcwotIEFkZCBwZXJmbW9uIHN1cHBvcnQgZm9yIERG
Ci0gQWRkIHNjYXR0ZXIvZ2F0aGVyIGRpc3BsYXkgc3VwcG9ydCBmb3IgUmF2ZW4KLSBJbXByb3Zl
IFNNVSBoYW5kbGluZyBmb3IgR1BVIHJlc2V0Ci0gUkFTIHN1cHBvcnQgZm9yIEdGWAotIERyb3Ag
bGFzdCBvZiBkcm1QLmgKLSBBZGQgc3VwcG9ydCBmb3Igd2lwaW5nIG1lbW9yeSBvbiBidWZmZXIg
cmVsZWFzZQotIEFsbG93IGN1cnNvciBhc3luYyB1cGRhdGVzIGZvciBmYiBzd2FwcwotIE1pc2Mg
Zml4ZXMgYW5kIGNsZWFudXBzCgphbWRrZmQ6Ci0gQWRkIG5hdmkxNCBzdXBwb3J0Ci0gQWRkIG5h
dmkxMiBzdXBwb3J0Ci0gQWRkIEFyY3R1cnVzIHN1cHBvcnQKLSBDV1NSIHRyYXAgaGFuZGxlcnMg
dXBkYXRlcyBmb3IgZ2Z4OSwgMTAKLSBEcm9wIGxhc3Qgb2YgZHJtUC5oCi0gVXBkYXRlIE1BSU5U
QUlORVJTCgpyYWRlb246Ci0gTWlzYyBmaXhlcyBhbmQgY2xlYW51cHMKLSBNYWtlIGtleGVjIG1v
cmUgcmVsaWFibGUgYnkgdGVhcmluZyBkb3duIHRoZSBHUFUKCnR0bToKLSBBZGQgcmVsZWFzZV9u
b3RpZnkgY2FsbGJhY2sKCnVhcGk6Ci0gQWRkIHdpcGUgbWVtb3J5IG9uIHJlbGVhc2UgZmxhZyBm
b3IgYnVmZmVyIGNyZWF0aW9uCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
