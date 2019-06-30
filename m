Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5545AEDC
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 08:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D4A6E9C2;
	Sun, 30 Jun 2019 06:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5CF6E9C2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 06:19:33 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a9so6600343lff.7
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 23:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WBff9Q31WytToFILW5VoVwYEkxeSh4M7iWNthN+AK6I=;
 b=FEHH2qFMA/3h4aEMmdhr19aYFRJdhIR21HNc40ARRHGR/HISAXVleFogcnptctDeyv
 Y6KYdRTz/l3FsP8bmP9qlxJ7jqabpf3C/Wm5L7BPXVxNXusZsrYpGGhB3YmHSyg/oaj7
 R061Sr2CjGz+FMylkRtbEazmTqfLwXN+3OHH20umoaZtyTB5TwjS2XjOgw5/zWZkj5JS
 4TStouzY3fJWmXhxKRYXtq1rQ1G383H2pDbIVYEnMBHXQk/uHr76DLOQTtWLDkdhlvNn
 CIlmwiocC0pF9KUXj2wCtuEjq0PivPWpPwwzTeggKTkvupKQINT3ard+hA1BJydUvsMx
 MBJA==
X-Gm-Message-State: APjAAAVIO/uwkZeqyzD+i8RTBV5bP3jnSNVJ/wmnCFWu0ECKfYg39eye
 TgtFjm3Al16R72nlYemlBDb0EOwmq9VwyA==
X-Google-Smtp-Source: APXvYqwrcoTpWP5VhHTwC52oXSKcJgARlMY1UIo4OQXUv7/qwWhLp2ZyI7Xek4qR9uaa3DSxLagPRA==
X-Received: by 2002:ac2:46ce:: with SMTP id p14mr9097784lfo.148.1561875571620; 
 Sat, 29 Jun 2019 23:19:31 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o74sm1794024lff.46.2019.06.29.23.19.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 23:19:31 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 03/33] drm/stm: drop use of drmP.h
Date: Sun, 30 Jun 2019 08:18:52 +0200
Message-Id: <20190630061922.7254-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WBff9Q31WytToFILW5VoVwYEkxeSh4M7iWNthN+AK6I=;
 b=Gu+je+QvkPfwZwmVMBiAW+7QjNESKrsPTusBSrnlL6x3cKKjMpcKVv6OOktztRyFkm
 LNDS/CQnqpeioeg2vD+CZRyTWXv7GVVUIYCi2LaxfNuCJrBh+SJt4ID4aN49YR8rW5sq
 f0VKml1Mo1WCKiM614KKxegV0o566gY0yHAvQ1xhDPqtm9Z6+5664z/TfdPjNg0Kt3Py
 RG8dQpnvd4zoSMtsFhbY4AKE68BUQ3LJVqix+9c6IYUVGSXXNiMBsDiDEw1SnbZpNeDY
 59Q0MlyqpbqjIk2cOKZEggFOph1f4OOES8KGKe9pjBPK7OWN2Il9qM+IlmBfa9oyxHXq
 8EyA==
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgaGVhZGVyIGZpbGUgZHJtUC5oCmZyb20gdGhlIHNv
bGUgdXNlciBpbiB0aGUgc3RtIGRyaXZlci4KUmVwbGFjZSB3aXRoIG5lY2Vzc2FyeSBpbmNsdWRl
IGZpbGVzLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpD
YzogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KQ2M6IFBoaWxpcHBlIENv
cm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+CkNjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFt
aW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KQ2M6IFZpbmNlbnQgQWJyaW91IDx2aW5jZW50LmFicmlv
dUBzdC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5z
dG0zMkBnbWFpbC5jb20+CkNjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQHN0
LmNvbT4KQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KQ2M6IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCi0tLQpUaGUgbGlzdCBvZiBjYzogd2FzIHRvbyBsYXJnZSB0byBhZGQgYWxsIHJlY2lw
aWVudHMgdG8gdGhlIGNvdmVyIGxldHRlci4KUGxlYXNlIGZpbmQgY292ZXIgbGV0dGVyIGhlcmU6
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1
bmUvdGhyZWFkLmh0bWwKU2VhcmNoIGZvciAiZHJtOiBkcm9wIHVzZSBvZiBkcm1wLmggaW4gZHJt
LW1pc2MiCgogICAgICAgIFNhbQoKIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3Rt
LmMgfCAxMCArKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2kt
c3RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCmluZGV4IDBhYjMy
ZmVlNmMxYi4uYTAzYTY0MmMxNDdjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3
X21pcGlfZHNpLXN0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3Rt
LmMKQEAgLTgsMTMgKzgsMTcgQEAKIAogI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgogI2luY2x1ZGUg
PGxpbnV4L2lvcG9sbC5oPgorI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPgorI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5o
PgogI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgotI2luY2x1ZGUgPGRybS9k
cm1QLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybV9taXBpX2RzaS5oPgotI2luY2x1ZGUgPGRybS9icmlk
Z2UvZHdfbWlwaV9kc2kuaD4KKwogI2luY2x1ZGUgPHZpZGVvL21pcGlfZGlzcGxheS5oPgogCisj
aW5jbHVkZSA8ZHJtL2JyaWRnZS9kd19taXBpX2RzaS5oPgorI2luY2x1ZGUgPGRybS9kcm1fbWlw
aV9kc2kuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CisKICNkZWZpbmUgSFdWRVJfMTMw
CQkJMHgzMTMzMzAwMAkvKiBJUCB2ZXJzaW9uIDEuMzAgKi8KICNkZWZpbmUgSFdWRVJfMTMxCQkJ
MHgzMTMzMzEwMAkvKiBJUCB2ZXJzaW9uIDEuMzEgKi8KIAotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
