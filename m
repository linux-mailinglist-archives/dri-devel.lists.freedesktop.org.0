Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C99F4CA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 23:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A06897FB;
	Tue, 27 Aug 2019 21:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEF2897FB;
 Tue, 27 Aug 2019 21:12:30 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 196so196470pfz.8;
 Tue, 27 Aug 2019 14:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oL1GWqOgGJTUP/aWDisoRY9YUOhWjgpc42t3TLlasqI=;
 b=DgaDcxHFCkwp6PcF0TMBpqDaHrPqibgDb4M3zzcnowNTanCdtGf0oYMmFRc+SfOxNT
 PoMNKvWO7pMgnGoyW/j/uTLFUn8bZcKeQ/53lc46DopH89OmQyB6hM2vyn5stoTNrbA2
 P5NieNc6/bUu4+8InP1KZDt0QBRDT2GSdWCpPcnXAYrfBoQLBVwsX7xoA7Rz5tDsJ+kW
 1lV2QL0w8arAyvfUVUA45NfJBjh2phk3FHDAPeSEDiay1IKYlI4fBIOdfLP5P7nk2F1V
 o/4ngcgeKAUkxuN3U8pHIXbN9xt7XEdn1f+8QUyqIpw6B1eNDeLBH0YzqukDmZ4R8cwy
 hw7Q==
X-Gm-Message-State: APjAAAX5mlxN/8jyzFLypiaAnMMMY+ODBas5xd8Tw4C8pex6iDWH9NGU
 3vH+3Qw1zOV/hL8divPM8nAqy5HW90M=
X-Google-Smtp-Source: APXvYqxYD6any9nW+zK6K4XhJJ0N2mcL84DjNDyOLURw69g/TpNdeXKyvCThlPyAs/Q/GKoyeRZoCA==
X-Received: by 2002:a65:4808:: with SMTP id h8mr436492pgs.22.1566940349493;
 Tue, 27 Aug 2019 14:12:29 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id z14sm131424pjr.23.2019.08.27.14.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 14:12:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: remove stray "\n"
Date: Tue, 27 Aug 2019 14:10:09 -0700
Message-Id: <20190827211016.18070-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oL1GWqOgGJTUP/aWDisoRY9YUOhWjgpc42t3TLlasqI=;
 b=s5+0+hI1teFiarwiw5+rK/Q/iNAOVIhSBKphVOHZ5QClySxbYLYH6WDerBGWk/7y9+
 Q3e8fvkcjesT0E61joXjZV6HP+vEqoD+kAZ04wFh3Mz8OttC0ZdLTku7JRdiQA1nwcGQ
 ljyLDNYjOAH63EswSRCB5l9XF0SJm+8adNZQxPnuhGhJxeGNLqbQfzmk/v7pUU7xltf+
 rXqvPgOdvNqLByVfuGDVnJ9bSVIubEFZlGi8aQV9GOD4c0CrTpfMnmJSGFkM1w4v49d/
 CXXJ5L9rUacb8cBTC3LSs3Ios857CIBM+c1bodtTEwoCl2awTuJG5amJ1nxNFTnHhto9
 uNew==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jayant Shekhar <jshekhar@codeaurora.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, Bruce Wang <bzwang@chromium.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhlIGV4dHJhIGxpbmUt
YnJlYWsgaW4gdHJhY2VzIHdhcyBhbm5veWluZyBtZS4KClNpZ25lZC1vZmYtYnk6IFJvYiBDbGFy
ayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfdHJhY2UuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV90cmFjZS5oIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3RyYWNlLmgK
aW5kZXggNzY1NDg0NDM3ZDExLi5lZWNmZTliMzE5OWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV90cmFjZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV90cmFjZS5oCkBAIC0zOTIsNyArMzkyLDcgQEAgVFJBQ0VfRVZFTlQoZHB1
X2VuY19yYywKIAkJX19lbnRyeS0+cmNfc3RhdGUgPSByY19zdGF0ZTsKIAkJX19hc3NpZ25fc3Ry
KHN0YWdlX3N0ciwgc3RhZ2UpOwogCSksCi0JVFBfcHJpbnRrKCIlczogaWQ6JXUsIHN3X2V2ZW50
OiVkLCBpZGxlX3BjX3N1cHBvcnRlZDolcywgcmNfc3RhdGU6JWRcbiIsCisJVFBfcHJpbnRrKCIl
czogaWQ6JXUsIHN3X2V2ZW50OiVkLCBpZGxlX3BjX3N1cHBvcnRlZDolcywgcmNfc3RhdGU6JWQi
LAogCQkgIF9fZ2V0X3N0cihzdGFnZV9zdHIpLCBfX2VudHJ5LT5kcm1faWQsIF9fZW50cnktPnN3
X2V2ZW50LAogCQkgIF9fZW50cnktPmlkbGVfcGNfc3VwcG9ydGVkID8gInRydWUiIDogImZhbHNl
IiwKIAkJICBfX2VudHJ5LT5yY19zdGF0ZSkKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
