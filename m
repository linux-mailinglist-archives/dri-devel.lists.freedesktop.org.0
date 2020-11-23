Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C822C042A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B587E89FE8;
	Mon, 23 Nov 2020 11:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7CE89DA4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:56 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k2so18248418wrx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rspc5DyHTiyjnt/zI3mhKCdrn/a3BO0urzTMZbliFpc=;
 b=ccDG24NQJV0M9KJ61WwazAEpBTPdZvVnUdJfyhTRyScfWGmVgacHz/60yz8QINN5xV
 MHc2Q5kRSuZ0EkpeuuLPxslbzc0RQluMm9BfqRo8+48ba3QnOlzMo/gwONBYO7BhoX0y
 NpB+d1tfjRGT6aFGGvnKMh3ZKCpwtgYGvYKDsQCXTKqGm8uziiuSsiHeGZ3Nl8GR1DDx
 de8bYMXazjeAI2NbukBgfZz2yGFSmJF9rKIIoGs8NlKUZcaJ84TCTYmZby5xAblXi0Jj
 5GuPVXW9KTz7UU24M8bR2DeFOhn1Dh5/IqKeaymMW3XGdzJWS1e2lOuvZYRYmDNWSh0M
 FNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rspc5DyHTiyjnt/zI3mhKCdrn/a3BO0urzTMZbliFpc=;
 b=XYokQjZfHz2eqrh8ke9bP8FwqfnapIy4kIodwgkWEdSyGn6+GKXtC3gGZPIV3wJ73E
 Y4xA0nVlZvSEiVWaRmZfXck0Yew7X1qnc708OHFgURRv2tTav23+9hNexmxZ5plwpX8S
 y/Z43R0hvf6ZXEYMV53xHtWvqAATVj3yvopUKWkfK+FWO0kJj+Kf7vT4ovtjTRneoFil
 N8sktw1SERvOAGbPLm0yjJM6qPYJ2Jkf3FmdKlui1RKGG5jVULz2P3+cl9abYqlxVRGE
 KuHPacA7i7od36p7xuH4SyATKjveN9GtoUOPmrURzKvoj//SwaULb3t7Z6DbDPtXud+w
 jbRQ==
X-Gm-Message-State: AOAM532ukI09HWhM2SYuaDNEo+nBaESUro6atUayAk8XPikfQ/pq7WI6
 uY5aMYEDCGIBbVjbdY+ujqJfSw==
X-Google-Smtp-Source: ABdhPJwCK6jYnSWHSowYPd1FM/wjZ/1t8IxyK5UDB5ZjFKBkqXT0dGW7ebvAbZHCMZrE7UCQQx1fWw==
X-Received: by 2002:a5d:690a:: with SMTP id t10mr11961847wru.203.1606130395314; 
 Mon, 23 Nov 2020 03:19:55 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:54 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 26/40] drm/amd/include/navi14_ip_offset: Mark top-level
 IP_BASE as __maybe_unused
Date: Mon, 23 Nov 2020 11:19:05 +0000
Message-Id: <20201123111919.233376-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxNF9yZWdfaW5p
dC5jOjI3OgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9uYXZpMTRfaXBf
b2Zmc2V0Lmg6MTc5OjI5OiB3YXJuaW5nOiDigJhVU0IwX0JBU0XigJkgZGVmaW5lZCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIDE3OSB8IHN0YXRpYyBjb25zdCBzdHJ1
Y3QgSVBfQkFTRSBVU0IwX0JBU0UgPXsgeyB7IHsgMHgwMjQyQTgwMCwgMHgwNUIwMDAwMCwgMCwg
MCwgMCB9IH0sCiB8IF5+fn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5j
bHVkZS9uYXZpMTRfaXBfb2Zmc2V0Lmg6MTcyOjI5OiB3YXJuaW5nOiDigJhVTUNfQkFTReKAmSBk
ZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogMTcyIHwgc3Rh
dGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIFVNQ19CQVNFID17IHsgeyB7IDB4MDAwMTQwMDAsIDB4
MDI0MjU4MDAsIDAsIDAsIDAgfSB9LAogfCBefn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vaW5jbHVkZS9uYXZpMTRfaXBfb2Zmc2V0Lmg6MTUxOjI5OiB3YXJuaW5nOiDigJhT
RE1BX0JBU0XigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxl
PV0KIDE1MSB8IHN0YXRpYyBjb25zdCBzdHJ1Y3QgSVBfQkFTRSBTRE1BX0JBU0UgPXsgeyB7IHsg
MHgwMDAwMTI2MCwgMHgwMDAwQTAwMCwgMHgwMjQwMkMwMCwgMCwgMCB9IH0sCiB8IF5+fn5+fn5+
fgoKTkI6IFNuaXBwZWQgYSBmZXcgb2YgdGhlc2UKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9p
bmNsdWRlL25hdmkxNF9pcF9vZmZzZXQuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
aW5jbHVkZS9uYXZpMTRfaXBfb2Zmc2V0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUv
bmF2aTE0X2lwX29mZnNldC5oCmluZGV4IGVjZGQ5ZWFiZTBkYzguLmMzOWVmNjUxYWRjNmYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9uYXZpMTRfaXBfb2Zmc2V0LmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL25hdmkxNF9pcF9vZmZzZXQuaApAQCAt
MzMsNyArMzMsNyBAQCBzdHJ1Y3QgSVBfQkFTRV9JTlNUQU5DRQogc3RydWN0IElQX0JBU0UKIHsK
ICAgICBzdHJ1Y3QgSVBfQkFTRV9JTlNUQU5DRSBpbnN0YW5jZVtNQVhfSU5TVEFOQ0VdOwotfTsK
K30gX19tYXliZV91bnVzZWQ7CiAKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIEFUSFVC
X0JBU0UgPXsgeyB7IHsgMHgwMDAwMEMwMCwgMHgwMjQwOEMwMCwgMCwgMCwgMCB9IH0sCi0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
