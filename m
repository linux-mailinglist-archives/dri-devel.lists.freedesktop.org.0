Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E550EEC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 16:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A241F89C16;
	Mon, 24 Jun 2019 14:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F22189C29;
 Mon, 24 Jun 2019 14:46:11 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id p144so9892590qke.11;
 Mon, 24 Jun 2019 07:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=14FTeQ+XlpcA4RP/PiRUraM8P4UY1+awcl1QeG4+Urc=;
 b=MJT6g/zr67yz3AZMqwbs1kceDHKUFtw0lSkLSi3/lVNXsnXKiR6N48T/BkHSSsOhis
 0ajSgfWDtHmS9CJL86Wmst/8oRolkpnaDYVSK/lOmUIMJjHimzDjlR9iJBwBf3+7DXjh
 s/aVjqHk8jRu4x4yAA1ClvKMo9w20FR1NQL9hUlLfwC97vhfrvbqRLiAbvAkT/bkVFPg
 ZDLel/H7rIq5Tpd+YBYavReG89ywewYK64ccBpxysVuKwp/Ovo7m/ORy41gZHWwrqi0T
 DwWhxXjGvUGhX6hfrAHvMbQ86JX4FDyFN6HF43CvUaucFYDeA2FeS+Mb/Garlp4zgzzv
 LZpA==
X-Gm-Message-State: APjAAAV8lD8/5mv7+HsYGnf2AJb0VjgA5HnKSvIKNaGhU/Jh16rlI4oG
 OvDX0LEFL9rm2aF4y0RIfh9wXyaI+MY=
X-Google-Smtp-Source: APXvYqzPAIzeuO/cWGUg3haDyM0ge9UNb6SN/BxCU1n0lgALtJeVfv++rpAXsmfA/b29obgxeeeNTQ==
X-Received: by 2002:a37:a1d6:: with SMTP id
 k205mr103167692qke.171.1561387570011; 
 Mon, 24 Jun 2019 07:46:10 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id y29sm6200477qkj.8.2019.06.24.07.46.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 07:46:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-next-5.3
Date: Mon, 24 Jun 2019 09:46:02 -0500
Message-Id: <20190624144602.31655-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=14FTeQ+XlpcA4RP/PiRUraM8P4UY1+awcl1QeG4+Urc=;
 b=J/P6DAgdx1KDw3G8CX90CclDsSrzMV08B9HIQMXgXpSnqzb7eN7cnvQaYkLic/wCv9
 GOStytsq8vhwIdlXQmEAjb7JZJxlhX5j8C09R76R7aqcE33KcTgMT8rnSufDsJ3Z0VS5
 zdRjzi8dXvg6UjO0JP+0GPZu77iT0wxCVyu1Cy85f+wjtztYCFaQEpBAOxbeBJPrhTIV
 tZ5GVKmS+Tv/UdI/YtfP+A+b8c1uX8UOJYwRtWLFU6e9I2Ab44+Ra9mip7t/LX3botEX
 zzaIgjXCdBZc2JxuLv5mFylWokB9fzTICesFpyyjAYdqK6+Tw3Vnz8KwfUlO1xCQdYor
 zJqg==
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

SGkgRGF2ZSwgRGFuaWVsLAoKSnVzdCBhIGZvbGxvdyB1cCBwdWxsIHRvIGZpeCBhIHJlZ3Jlc3Np
b24gb24gb2xkZXIgYXNpY3MgZHVlIHRvIHRoZSBuYXZpMTAKbWVyZ2UuCgpUaGUgZm9sbG93aW5n
IGNoYW5nZXMgc2luY2UgY29tbWl0IGYzZjQ4ZDczMzFjZjVhZDlhNmIzYTZiZWZmMzhmM2RhZDE4
NzFiNDk6CgogIGRybS9hbWRncHU6IGRyb3AgdW51c2VkIGRmIGluaXQgY2FsbGJhY2sgKDIwMTkt
MDYtMjIgMDk6MzQ6MTQgLTA1MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoKCiAgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXggdGFncy9k
cm0tbmV4dC01LjMtMjAxOS0wNi0yNAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDhh
Yzg3NWRiMGZkYzFjZmE1NWM0MjRiMzhhODFjZjUyODJmM2RmMGI6CgogIGRybS9hbWRncHU6IGRp
c2FibGUgZ2Z4b2ZmIG9uIG5hdmkxMCAoMjAxOS0wNi0yNCAwOTozMTo0MyAtMDUwMCkKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KZHJtLW5leHQtNS4zLTIwMTktMDYtMjQ6CgphbWRncHU6Ci0gRml4IGEgcmVncmVzc2lvbiB3
aXRoIHV2ZCBpbml0IG9uIHNvbWUgb2xkZXIgYXNpY3MgZHVlIHRvIE5hdmkgbWVyZ2UKLSBEaXNh
YmxlIGdmeCBvZmYgb24gbmF2aTEwIHVudGlsIGl0J3MgcmVhZHkKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSGF3a2luZyBa
aGFuZyAoMSk6CiAgICAgIGRybS9hbWRncHU6IGZpeCBtb2Rwcm9iZSBmYWlsdXJlIGZvciB1dmRf
NC81LzYKCnRpYW5jeWluICgxKToKICAgICAgZHJtL2FtZGdwdTogZGlzYWJsZSBnZnhvZmYgb24g
bmF2aTEwCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RwbS5jICAgIHwgMTEg
KysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jICAgICB8
ICA0ICstLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8ICAz
ICsrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
