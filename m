Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A62C5629
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41086E987;
	Thu, 26 Nov 2020 13:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA3D6E97C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:34 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 1so2457564wme.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VuZf51/6rbT4Y+F0DKDI1W5yRp5gMKolAl3JbWxMH/Y=;
 b=pisVm/rn1U4ASlnA+K2ad3MOviG7WcK7m0ytip6AZ5V+ZahEqcC/N+qhBRNXTuHkZp
 ko49wyV7Vf6eJlfyXLiC5aAbzmVW6rAzSbPTgRiKdjsoT5IpZ8dygbiNxsHF1XuXWfwf
 9vv1Y26Cbn+buNvO7Cv8ebSz4oVmgNILfAinKRefB7PT2t++oPiclWQGOt4nWn3LzjJs
 m9X+RiPK7ANui7vbnIYJ/9uVxveDWjnHNu419aZNGdpS1UAMejAu3C5samgmGP7nShMQ
 djH4l5wasV5qzjKRhoEUsnPEtwerC2XlPgh2hDNjOo/RSmGu1jNsvKfVfwNBk0qeXyL4
 kgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VuZf51/6rbT4Y+F0DKDI1W5yRp5gMKolAl3JbWxMH/Y=;
 b=WC2P5JlfyG+hbFS74FTVylCrP5g4vdovUBJjBKByM1SKVYBYlRXSL7J1vBxekEM4dW
 N988cT7GmTTAyrfKhisQke3KNHz9q7WBuDUaJRrPd1fNAojPD7b5lrWKCtiJ2AM6EE7k
 AGqbcxdAlmT2dDJSL/vWjUG4/MTJdI+owE8yEG8sQqLbteejxtwuLLKSr6vmj3C6rvyV
 cJNJWvi4neVAQCPDaFrv4riRFnCEKu8HxgtOv7/i70ORXptUYY6aRLsK3H4a0Y2X2bet
 C9h2DFmOLzy4v0eisKvBuUXMDOm/QjJpokSj9sQSlMpQngMOtwEgpj+rBYdHILGBtTWI
 W3EQ==
X-Gm-Message-State: AOAM5337OUWiguSZBTeT0tm/eRyy0Z/FjwmLjRAYj4GVPKawedMg4Ygk
 lxvbRagTR/S+r6L9Yk04usAuBA==
X-Google-Smtp-Source: ABdhPJyXwqSGhbR6oE7tW8GUsM+939v/thUOmdrgNzAsSIaz6WTEsqDFmj+ShQapDgKeLqtLrLF+cg==
X-Received: by 2002:a05:600c:286:: with SMTP id
 6mr3443933wmk.125.1606398213104; 
 Thu, 26 Nov 2020 05:43:33 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 32/40] drm/amd/display/amdgpu_dm/amdgpu_dm: Mark
 'link_bandwidth_kbps' as __maybe_unused
Date: Thu, 26 Nov 2020 13:42:32 +0000
Message-Id: <20201126134240.3214176-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

J2xpbmtfYmFuZHdpZHRoX2ticHMnIGlzIGFsd2F5cyBvYnRhaW5lZCwgYnV0IG9ubHkgdXNlZCBp
ZgpDT05GSUdfRFJNX0FNRF9EQ19EQ04gaXMgZGVmaW5lZC4KCkZpeGVzIHRoZSBmb2xsb3dpbmcg
Vz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jOiBJbiBmdW5jdGlvbiDigJhjcmVhdGVf
c3RyZWFtX2Zvcl9zaW5r4oCZOgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmM6NTA4MDoxMTogd2FybmluZzogdmFyaWFibGUg4oCYbGlu
a19iYW5kd2lkdGhfa2Jwc+KAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzog
TGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDA4NTM5ZjQzMTU4NjQuLmFjNzY0M2Q3M2Jj
NjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYwpAQCAtNTA3Nyw3ICs1MDc3LDcgQEAgY3JlYXRlX3N0cmVhbV9mb3Jfc2luayhzdHJ1
Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvciwKICNpZiBkZWZpbmVkKENPTkZJR19E
Uk1fQU1EX0RDX0RDTikKIAlzdHJ1Y3QgZHNjX2RlY19kcGNkX2NhcHMgZHNjX2NhcHM7CiAjZW5k
aWYKLQl1aW50MzJfdCBsaW5rX2JhbmR3aWR0aF9rYnBzOworCXVpbnQzMl90IF9fbWF5YmVfdW51
c2VkIGxpbmtfYmFuZHdpZHRoX2ticHM7CiAKIAlzdHJ1Y3QgZGNfc2luayAqc2luayA9IE5VTEw7
CiAJaWYgKGFjb25uZWN0b3IgPT0gTlVMTCkgewotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
