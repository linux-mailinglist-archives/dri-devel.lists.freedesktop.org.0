Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5522B1C32
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8EC6E52C;
	Fri, 13 Nov 2020 13:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070B76E52C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:49:57 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d142so8200018wmd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7u3R7+OjGQISbkuCs2m/TsCWsUoo+j2lw9OomX7FkgE=;
 b=oVPSe3gKajXzmTwgKcAiPMc6n66vSQUTIbxQGrlpz617vtWWaflWGSCujuQ8cnhsl8
 Flp6j1U3fpCW7BBDGzKQP/99ib4s8fxs/3AQJXmBbOgVUYM9cW6lcnZJ6CnLvJKja8Ko
 d8CatTkf5GLBuTFXz+J+cf8WtmeIFmL5KsDnbuSwPcotT3zNcJ6w1GsXt+oCK9Lbw+nZ
 gm0psYuaDRRopbobUkafy6BIEHXJI+i+Eh5apV9e39CP9yF7cHUUGtaYNL6A+xjJB/xM
 6gmjz6brGCBOeN1cuNZFWtroPbG536JOhvA1Fyspe4+AV4ymKme21mmgH9JPXwIC3zjR
 ZyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7u3R7+OjGQISbkuCs2m/TsCWsUoo+j2lw9OomX7FkgE=;
 b=QQv1vpw5bGcLz5VSiiWYtUlKnqKlp0HJSlt0EI7KYj75db48hnvXjGJn33MIRoHb++
 Avn9YSF49U52+JYJShUJu26uS8mjXnLRbyKpf3o7xAy+OLRQCYiDv2zMOt3nCsaRuTNh
 H0NY89LNpj61x/zxXIMbqxoaHCZx/XwUXmWXd5fyfHzGi8t0/8l7banmPUYV/BenZCia
 yiu8TK4fU17aROsY6Vj5zJ/V1/QqVnZhKSk2wu02Q77NauZ5zrj+Y7qgZvwti/XJhADO
 0U8k0FOPPGI78Usdsvdg2v/T/rgL0TXF+kB1nrdKsSQLzVL5xrB8fvW6JkSJLpCPyvWF
 5Xug==
X-Gm-Message-State: AOAM532PK2KM/iN4cBE540zlWub1S+amkfsvIm1zunkRB2Z014AHGhf7
 YN1N4aWr6sGmHPZFI8aos83Pmg==
X-Google-Smtp-Source: ABdhPJxQxDqy7G7JaMskfG7ggUP9cLK1dW0ajER8rOj49sVwLKSqBc/GlSBicq1fC1nSz6FeOTHKOg==
X-Received: by 2002:a1c:2cd7:: with SMTP id s206mr2531152wms.182.1605275395681; 
 Fri, 13 Nov 2020 05:49:55 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:55 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/40] drm/amd/amdgpu/amdgpu_pll: Fix kernel-doc formatting,
 missing and extra params
Date: Fri, 13 Nov 2020 13:49:09 +0000
Message-Id: <20201113134938.4004947-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BsbC5jOjEyMTogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAnZnJlcScgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3BsbF9j
b21wdXRlJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BsbC5jOjEyMTogd2Fy
bmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZmJfZGl2X3AnIG5vdCBkZXNjcmli
ZWQgaW4gJ2FtZGdwdV9wbGxfY29tcHV0ZScKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wbGwuYzoxMjE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2Zy
YWNfZmJfZGl2X3AnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9wbGxfY29tcHV0ZScKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbGwuYzoxMjE6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ3JlZl9kaXZfcCcgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1
X3BsbF9jb21wdXRlJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BsbC5jOjEy
MTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncG9zdF9kaXZfcCcgbm90
IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3BsbF9jb21wdXRlJwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BsbC5jOjMxNzogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRl
ciAnZW5jb2RlcicgZGVzY3JpcHRpb24gaW4gJ2FtZGdwdV9wbGxfZ2V0X3NoYXJlZF9ub25kcF9w
cGxsJwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJD
aHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcGxsLmMgfCAxMCAr
KysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbGwuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbGwuYwppbmRleCAxZjIzMDViN2Jk
MTM1Li5mMmUyMDY2NmM5YzFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcGxsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bs
bC5jCkBAIC0xMDIsMTEgKzEwMiwxMiBAQCBzdGF0aWMgdm9pZCBhbWRncHVfcGxsX2dldF9mYl9y
ZWZfZGl2KHVuc2lnbmVkIG5vbSwgdW5zaWduZWQgZGVuLCB1bnNpZ25lZCBwb3N0XwogICogYW1k
Z3B1X3BsbF9jb21wdXRlIC0gY29tcHV0ZSBQTEwgcGFyYW1hdGVycwogICoKICAqIEBwbGw6IGlu
Zm9ybWF0aW9uIGFib3V0IHRoZSBQTEwKKyAqIEBmcmVxOiByZXF1ZXN0ZWQgZnJlcXVlbmN5CiAg
KiBAZG90X2Nsb2NrX3A6IHJlc3VsdGluZyBwaXhlbCBjbG9jawotICogZmJfZGl2X3A6IHJlc3Vs
dGluZyBmZWVkYmFjayBkaXZpZGVyCi0gKiBmcmFjX2ZiX2Rpdl9wOiBmcmFjdGlvbmFsIHBhcnQg
b2YgdGhlIGZlZWRiYWNrIGRpdmlkZXIKLSAqIHJlZl9kaXZfcDogcmVzdWx0aW5nIHJlZmVyZW5j
ZSBkaXZpZGVyCi0gKiBwb3N0X2Rpdl9wOiByZXN1bHRpbmcgcmVmZXJlbmNlIGRpdmlkZXIKKyAq
IEBmYl9kaXZfcDogcmVzdWx0aW5nIGZlZWRiYWNrIGRpdmlkZXIKKyAqIEBmcmFjX2ZiX2Rpdl9w
OiBmcmFjdGlvbmFsIHBhcnQgb2YgdGhlIGZlZWRiYWNrIGRpdmlkZXIKKyAqIEByZWZfZGl2X3A6
IHJlc3VsdGluZyByZWZlcmVuY2UgZGl2aWRlcgorICogQHBvc3RfZGl2X3A6IHJlc3VsdGluZyBy
ZWZlcmVuY2UgZGl2aWRlcgogICoKICAqIFRyeSB0byBjYWxjdWxhdGUgdGhlIFBMTCBwYXJhbWV0
ZXJzIHRvIGdlbmVyYXRlIHRoZSBnaXZlbiBmcmVxdWVuY3k6CiAgKiBkb3RfY2xvY2sgPSAocmVm
X2ZyZXEgKiBmZWVkYmFja19kaXYpIC8gKHJlZl9kaXYgKiBwb3N0X2RpdikKQEAgLTMwOCw3ICsz
MDksNiBAQCBpbnQgYW1kZ3B1X3BsbF9nZXRfc2hhcmVkX2RwX3BwbGwoc3RydWN0IGRybV9jcnRj
ICpjcnRjKQogICogYW1kZ3B1X3BsbF9nZXRfc2hhcmVkX25vbmRwX3BwbGwgLSByZXR1cm4gdGhl
IFBQTEwgdXNlZCBieSBhbm90aGVyIG5vbi1EUCBjcnRjCiAgKgogICogQGNydGM6IGRybSBjcnRj
Ci0gKiBAZW5jb2RlcjogZHJtIGVuY29kZXIKICAqCiAgKiBSZXR1cm5zIHRoZSBQUExMIChQaXhl
bCBQTEwpIHVzZWQgYnkgYW5vdGhlciBub24tRFAgY3J0Yy9lbmNvZGVyIHdoaWNoIGNhbgogICog
YmUgc2hhcmVkIChpLmUuLCBzYW1lIGNsb2NrKS4KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
