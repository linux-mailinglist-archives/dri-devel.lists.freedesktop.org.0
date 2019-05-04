Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CC814537
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A4789336;
	Mon,  6 May 2019 07:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975AF89471
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2019 00:07:26 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id h1so3480167pgs.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 17:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iovEWy/GQChZ/awOVkY7H6FjwQrlO6bXxHcgVwGcj+4=;
 b=g3GW4ibbsJfWeyI6/k9/oNs1pmjt3YqfVLnrXiTEdN7h2XN4z39dz4+IXeeyXoDKDs
 /qIuRs8V/QW9YCoRjiyOIjpYu+RSXM0GIZWfjSMJNcy/bTBJd7oXnXLpqFSbrpgGP0U7
 mzz25LS+VyM8BRSPC2pRsMKqK6zAsBzrN0/Imh4RowywLmmeEYGkL0lQ/55C6BMhNzbC
 nxv5wm+6vJ4+pWzuqu69HQ/7IyaAzGoYO1ax71R/FyR2xWRBMsSzEjJOSst7SN15ElFi
 AEI4/CXnje785gFIGUcHwIvHavjR67cJ8BSQkOvgQC4/eqTV9WDx+QZ/sYCJE4odjUBs
 EgsA==
X-Gm-Message-State: APjAAAV7+PnjxePQ6/XFyS04zB2eaqt0De47hXM5p+mBepz6t4g7ner+
 o1cyDtzCYsusZWWbFjqZaCXc4Q==
X-Google-Smtp-Source: APXvYqzHuVCCkd14uJH1YbxuOuV8rfgJYzruetuIOrsuqy6jbZ3ju1hiUC+6Qr/w2YB8KbnLNyJ5dQ==
X-Received: by 2002:aa7:8d81:: with SMTP id i1mr15024146pfr.127.1556928446138; 
 Fri, 03 May 2019 17:07:26 -0700 (PDT)
Received: from gamepad.lan ([2604:4080:1159:80a0:148b:33f9:3a17:5899])
 by smtp.gmail.com with ESMTPSA id c137sm4868997pfb.154.2019.05.03.17.07.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 17:07:25 -0700 (PDT)
From: Jared Baldridge <jrb@expunge.us>
To: 
Subject: [PATCH] drm: panel-orientation-quirks: Update GPD Win 2 FW dates
Date: Fri,  3 May 2019 17:07:16 -0700
Message-Id: <20190504000716.8063-1-jrb@expunge.us>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=expunge-us.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iovEWy/GQChZ/awOVkY7H6FjwQrlO6bXxHcgVwGcj+4=;
 b=W8rgmekidkx06udnPHuIxrTgcS2YyZ/LnwzT6OTCVziN3r5PRkkLYxoe7fwnd5b0ga
 2VJwv8y76owide44YO6ZyQKvuukxmTgJcLNdo28rpX3HjRdjU5N8L6yMvOsAlTQiPedE
 waro9Bcie9EwVPNqm2XO3FyHPi5rrOykd+55Yx1fHghO74FBmnhDH8EpPCiOMdzuGW3E
 p46lDx1PHKOCTgw6LLFUqgDndChvSBSr2+75BqEEvg2Dvesj7aEiBgkEiK+oLD8Vcdxg
 0XvASQGTgo5FaHaVoUrMynrre74WHv8B4G8Y7riJfNcVdAH4Y9DGcQ9RIhjLhFFASPGP
 2vkw==
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
Cc: Jared Baldridge <jrb@expunge.us>, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdQRCBXaW4gMiBpcyBzaGlwcGluZyB3aXRoIGEgbmV3IGZpcm13YXJlIHJlbGVhc2UgZGF0
ZS4gQXMKdGhlIHF1aXJrIGlzIHN0aWxsIHJlcXVpcmVkIHdpdGggdGhlIG5ldyBmaXJtd2FyZSwg
dGhpcyBjb21taXQKYWRkcyB0aGUgbmV3IHJlbGVhc2UgZGF0ZSB0byB0aGUgcXVpcmtzIHRhYmxl
LgoKU2lnbmVkLW9mZi1ieTogSmFyZWQgQmFsZHJpZGdlIDxqcmJAZXhwdW5nZS51cz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3MuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKaW5kZXggNTJlNDQ1YmIxYWE1
Li5lMGQwZjMxNjk1ODEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3Jp
ZW50YXRpb25fcXVpcmtzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRh
dGlvbl9xdWlya3MuYwpAQCAtNjMsNyArNjMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9k
bWlfcGFuZWxfb3JpZW50YXRpb25fZGF0YSBncGRfd2luMiA9IHsKIAkud2lkdGggPSA3MjAsCiAJ
LmhlaWdodCA9IDEyODAsCiAJLmJpb3NfZGF0ZXMgPSAoY29uc3QgY2hhciAqIGNvbnN0IFtdKXsK
LQkJIjEyLzA3LzIwMTciLCAiMDUvMjQvMjAxOCIsICIwNi8yOS8yMDE4IiwgTlVMTCB9LAorCQki
MTIvMDcvMjAxNyIsICIwNS8yNC8yMDE4IiwgIjA2LzI5LzIwMTgiLCAiMDcvMzAvMjAxOCIsIE5V
TEwgfSwKIAkub3JpZW50YXRpb24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9SSUdIVF9V
UCwKIH07CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
