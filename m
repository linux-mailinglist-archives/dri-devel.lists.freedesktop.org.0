Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9568E6A2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF486E8FE;
	Thu, 15 Aug 2019 08:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6B76E0AF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:05:17 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c81so2220505pfc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 02:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t3wpPIeYDmknkdSyZyxww3InCgWDpiyi06busxNzQhU=;
 b=sRJNmRuqjVn0uoQencBLITECIC2L/QLWSGGC5VLsEjOJ5soHpx0YNWiNLvIy1tGsgq
 kCIvmufjg2WfQAI3ee+1Y16uCmHptWcUEAK3nu0MMMr268I9tUhdupL4TDpf+sVOACMT
 oUCOhdUcpF+YGeg1bBc3kDpl3RoGdI4r0NQbvYM6o17HdcFXPQqpy4L/mHVSiSfDURqt
 dvt2tPjtT2gL+0ohdNC8l3F0zsi49GqZAq+F4ynLSlMQq0qNMSMttDaO5o/6qRX/DiRu
 1n5nBm8zmIAwPTO1jHxPv98J9E54n+lofmydkhflYQHDqzlqAxYgbQwRWzAad+ei58zh
 +IBg==
X-Gm-Message-State: APjAAAUH9c8z/vt9USjZAR2CXRQWmNaxvABDCYexbJmxs603WhTCE/XY
 Xp+irRwWxiYggYthfnefcEc=
X-Google-Smtp-Source: APXvYqyoVe5MZe1A6A9qZv4etT1yuByQe0pr9YU5ZURpcYTMBspAQ9d05B2xbGEX/4un8h3joraRFg==
X-Received: by 2002:a62:174a:: with SMTP id 71mr41118636pfx.140.1565687116805; 
 Tue, 13 Aug 2019 02:05:16 -0700 (PDT)
Received: from localhost.localdomain ([122.163.110.75])
 by smtp.gmail.com with ESMTPSA id m4sm186140578pff.108.2019.08.13.02.05.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 02:05:16 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: jsarha@ti.com, tomi.valkeinen@ti.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/tilcdc: plane: Make structure tilcdc_plane_funcs constant
Date: Tue, 13 Aug 2019 14:35:03 +0530
Message-Id: <20190813090503.9063-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t3wpPIeYDmknkdSyZyxww3InCgWDpiyi06busxNzQhU=;
 b=N0a0JGMnnXQCSakxjehNpVvNJ/VwB/kRVxPg3MD0FtxeXGBIjxXY1zcuJn1MraBrHi
 uJXQu4nENsbeQKMLAcDFIgPn7ug1LnJRHq2w7MePRD3nPTNWYsN3u82Lul9ARer/sBd4
 XNBcSzjeX3ge8mKWVRfKHgTSn0W+rlRpDdmsOviYr6jqQmsnlenCtTicuGXSAoFeYYnN
 +LJYCNgqv0WDGNANX21buudUOdux8Up8D0btWmclf7vx7bzTDHc7kPN9yQUf8qThgjfq
 0EpP8WFlh00L3LYVzY15QaPS7YLVHQ8MG3rfPWQqP0CaFiVeUn4deW8mn9SdUbtRTgxF
 VLeQ==
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHN0YXRpYyBzdHJ1Y3R1cmUgdGlsY2RjX3BsYW5lX2Z1bmNzLCBvZiB0eXBlIGRybV9wbGFu
ZV9mdW5jcywgaXMKdXNlZCBvbmx5IHdoZW4gcGFzc2VkIHRoZSBmb3VydGggYXJndW1lbnQgdG8g
ZHJtX3BsYW5lX2luaXQoKTsgaG93ZXZlciwKdGhpcyBmb3VydGggcGFyYW1ldGVyIGlzIGRlY2xh
cmVkIGFzIGNvbnN0IGluIHRoZSBmdW5jdGlvbiBkZWZpbml0aW9uLgpIZW5jZSBtYWtlIHRpbGNk
Y19wbGFuZV9mdW5jcyBjb25zdGFudCBhcyB3ZWxsLgpJc3N1ZSBmb3VuZCB3aXRoIENvY2NpbmVs
bGUuCgpTaWduZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3VwdGEgPG5pc2hrYWRnLmxpbnV4QGdtYWls
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19wbGFuZS5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS90aWxjZGMvdGlsY2RjX3BsYW5lLmMKaW5kZXggOGMyNzc2YWNkZjk5Li5iZmQ1ZGNjY2E3MDkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3BsYW5lLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfcGxhbmUuYwpAQCAtMTMsNyArMTMsNyBAQAog
CiAjaW5jbHVkZSAidGlsY2RjX2Rydi5oIgogCi1zdGF0aWMgc3RydWN0IGRybV9wbGFuZV9mdW5j
cyB0aWxjZGNfcGxhbmVfZnVuY3MgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9m
dW5jcyB0aWxjZGNfcGxhbmVfZnVuY3MgPSB7CiAJLnVwZGF0ZV9wbGFuZQk9IGRybV9hdG9taWNf
aGVscGVyX3VwZGF0ZV9wbGFuZSwKIAkuZGlzYWJsZV9wbGFuZQk9IGRybV9hdG9taWNfaGVscGVy
X2Rpc2FibGVfcGxhbmUsCiAJLmRlc3Ryb3kJPSBkcm1fcGxhbmVfY2xlYW51cCwKLS0gCjIuMTku
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
