Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A6EF3B46
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 23:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101696F7E3;
	Thu,  7 Nov 2019 22:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9476F7E3;
 Thu,  7 Nov 2019 22:21:05 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DF4A206C3;
 Thu,  7 Nov 2019 22:21:04 +0000 (UTC)
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] drm: replace magic nuumbers
Date: Thu,  7 Nov 2019 16:20:45 -0600
Message-Id: <20191107222047.125496-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573165264;
 bh=o/q0uASjJnBVaAfXrJkzJZuhoIg5oq6iWOmQ1ROAA0I=;
 h=From:To:Cc:Subject:Date:From;
 b=CgwqdvpxFsYFx12bPiJSAYNr8E+vT5BSY7bZLFBBgW79yCMnmfg8oz9CqenvyXZHT
 muvgLNiW2RIlaUpPF0niXHW/0E5DGj7maM5/Lta4Su2saJMIqfrq4LUvBcslhfalM0
 rgcPlMplJkcgKk7ZRpqxk2Q6X2wphJGkYQl4hHhg=
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Frederick Lawler <fred@fredlawl.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KCmFtZGdwdSBhbmQgcmFk
ZW9uIGRvIGEgYml0IG9mIG11Y2tpbmcgd2l0aCB0aGUgUENJZSBMaW5rIENvbnRyb2wgMgpyZWdp
c3Rlciwgc29tZSBvZiBpdCB1c2luZyBoYXJkLWNvZGVkIG1hZ2ljIG51bWJlcnMuICBUaGUgaWRl
YSBoZXJlIGlzIHRvCnJlcGxhY2UgdGhvc2Ugd2l0aCAjZGVmaW5lcy4KCkkgaGF2ZW4ndCBzaWdu
ZWQgb2ZmIG9uIHRoZXNlIGJlY2F1c2UgdGhlIGZpcnN0IG9uZSBhY3R1YWxseSBjaGFuZ2VzIHRo
ZQpiaXRzIGludm9sdmVkIGJlY2F1c2UgdGhlIGV4aXN0aW5nIGNvZGUgbG9va3MgbGlrZSBpdCBt
aWdodCBoYXZlIGEgdHlwby4KQnV0IEkgaGF2ZSBubyB3YXkgdG8ga25vdyBmb3Igc3VyZS4KCkkg
ZG9uJ3QgaW50ZW5kIHRoZSBUYXJnZXQgTGluayBTcGVlZCBwYXRjaCB0byBjaGFuZ2UgYW55dGhp
bmcsIHNvIGl0IHNob3VsZApiZSBzdHJhaWdodGZvcndhcmQgdG8gcmV2aWV3LgoKQmpvcm4gSGVs
Z2FhcyAoMik6CiAgZHJtOiByZXBsYWNlIENvbXBsaWFuY2UvTWFyZ2luIG1hZ2ljIG51bWJlcnMg
d2l0aCBQQ0lfRVhQX0xOS0NUTDIKICAgIGRlZmluaXRpb25zCiAgZHJtOiByZXBsYWNlIFRhcmdl
dCBMaW5rIFNwZWVkIG1hZ2ljIG51bWJlcnMgd2l0aCBQQ0lfRVhQX0xOS0NUTDIKICAgIGRlZmlu
aXRpb25zCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrLmMgfCAyMiArKysrKysrKysr
KysrKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaS5jICB8IDE4ICsrKysr
KysrKysrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYyAgICAgfCAyMiArKysr
KysrKysrKysrKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMgICAgICB8IDIy
ICsrKysrKysrKysrKysrLS0tLS0tLS0KIGluY2x1ZGUvdWFwaS9saW51eC9wY2lfcmVncy5oICAg
IHwgIDIgKysKIDUgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25z
KC0pCgotLSAKMi4yNC4wLnJjMS4zNjMuZ2IxYmNjZDNlM2QtZ29vZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
