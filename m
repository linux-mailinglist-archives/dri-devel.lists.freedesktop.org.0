Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEE3274318
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 15:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F866E86D;
	Tue, 22 Sep 2020 13:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92F26E86E;
 Tue, 22 Sep 2020 13:32:12 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id u21so22947961eja.2;
 Tue, 22 Sep 2020 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=O07oBqaiM/6+61z2lzE4i19VVZBGsVl4UManDcDiHAs=;
 b=VDxdkU/1dIdEuj7GQ3cNUMk/dhbEek0cECIECNGXQENLapV0iZePykxGBOrb+lUXgv
 5fjBiMJFn1o7T2HWHjr1AyqmwGOinqn0/RI6pJp+pKj9gm1FiArbddNr7Tb+B9m7lng5
 x1t2/CSVGyfSqrJi59sjT9oH8xz1UtGbdvyXAA1oF1zIEsN0/W0om49VsHJIu9hXiTRS
 Ejxy3XVbE60e3ABkVJV+c+33wX129R3TRsZIDUP1TS6oG+bSZTpGIbT/MyJ+6YmtmAnS
 S66Bdf3GtIeUPETJh17UILkEzonfkUjkGI+pScRPXLQioKWylE7iZMRdMIZcY2JRvutx
 1M+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O07oBqaiM/6+61z2lzE4i19VVZBGsVl4UManDcDiHAs=;
 b=sMLxVNhb49XUmZ9w+GHgzvEy70SwWLtGp8x6JSz2MUcHuCEAWaQJNMJ+a/GFBK2r81
 pjkgF19ZcFL5stRsveAPdrbi984WVrRxZxJBT/izFoxvh1nqAKRz+46D1H+ePQpnoBir
 DNe+79lMyVQ8ELEoQJnQkaJbZeKQQgk9Nj9LkjwqJxvURJesyGaCapk8jS2R+N+eB5qp
 /g6bAPnCVlDkUB+39yNf+PsN1oxTuWxLXEi1c8SKd85tImcKR9gbBQ5WS2Te0SJrysy2
 mQcfvNVKLrLfGdfZPwCPi95VRpsFsyMaZ4tgdHuIDCVSNThCjEXazgwVnL7kjceYqVS8
 EI5w==
X-Gm-Message-State: AOAM530Cy2L0sN9czZNnWKvBtuvtevKw2xqf8wyqHBdhfXCOKjAHMyW0
 RGT9c8keUwfRc+SPXBgFiU0=
X-Google-Smtp-Source: ABdhPJyq0q4NMDTN54enCKgkIr6ZfMD9gJHxSlUhJU3PDMUxHL1Va+G8cdUzTVTfPQRC48aY3xvlow==
X-Received: by 2002:a17:906:8297:: with SMTP id
 h23mr4812940ejx.383.1600781531364; 
 Tue, 22 Sep 2020 06:32:11 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:11af:3d77:a1c7:4f3a])
 by smtp.gmail.com with ESMTPSA id z21sm11541028eja.72.2020.09.22.06.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 06:32:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-graphics-maintainer@vmware.com, sroland@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ray.huang@amd.com
Subject: [PATCH 02/11] drm/vmwgfx: remove unused placement combination
Date: Tue, 22 Sep 2020 15:31:59 +0200
Message-Id: <20200922133208.1273-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922133208.1273-1-christian.koenig@amd.com>
References: <20200922133208.1273-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBzb21lIGRlYWQgY29kZSBjbGVhbnVwLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2Rydi5oICAgICAgICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3R0bV9idWZmZXIuYyB8IDMwIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hh
bmdlZCwgMzEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAppbmRl
eCAxNTIzYjUxYTcyODQuLjljZWVlNGViMGIxMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
ZHJ2LmgKQEAgLTEwMDgsNyArMTAwOCw2IEBAIGV4dGVybiBzdHJ1Y3QgdHRtX3BsYWNlbWVudCB2
bXdfdnJhbV9wbGFjZW1lbnQ7CiBleHRlcm4gc3RydWN0IHR0bV9wbGFjZW1lbnQgdm13X3ZyYW1f
bmVfcGxhY2VtZW50OwogZXh0ZXJuIHN0cnVjdCB0dG1fcGxhY2VtZW50IHZtd192cmFtX3N5c19w
bGFjZW1lbnQ7CiBleHRlcm4gc3RydWN0IHR0bV9wbGFjZW1lbnQgdm13X3ZyYW1fZ21yX3BsYWNl
bWVudDsKLWV4dGVybiBzdHJ1Y3QgdHRtX3BsYWNlbWVudCB2bXdfdnJhbV9nbXJfbmVfcGxhY2Vt
ZW50OwogZXh0ZXJuIHN0cnVjdCB0dG1fcGxhY2VtZW50IHZtd19zeXNfcGxhY2VtZW50OwogZXh0
ZXJuIHN0cnVjdCB0dG1fcGxhY2VtZW50IHZtd19zeXNfbmVfcGxhY2VtZW50OwogZXh0ZXJuIHN0
cnVjdCB0dG1fcGxhY2VtZW50IHZtd19ldmljdGFibGVfcGxhY2VtZW50OwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jCmluZGV4IDc0NTRmNzk3ZDM3Yi4uZDdlYTY1
OGU5OTEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVm
ZmVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jCkBA
IC02NSwxMyArNjUsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHR0bV9wbGFjZSBnbXJfcGxhY2Vt
ZW50X2ZsYWdzID0gewogCS5mbGFncyA9IFRUTV9QTF9GTEFHX0NBQ0hFRAogfTsKIAotc3RhdGlj
IGNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgZ21yX25lX3BsYWNlbWVudF9mbGFncyA9IHsKLQkuZnBm
biA9IDAsCi0JLmxwZm4gPSAwLAotCS5tZW1fdHlwZSA9IFZNV19QTF9HTVIsCi0JLmZsYWdzID0g
VFRNX1BMX0ZMQUdfQ0FDSEVEIHwgVFRNX1BMX0ZMQUdfTk9fRVZJQ1QKLX07Ci0KIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgdHRtX3BsYWNlIG1vYl9wbGFjZW1lbnRfZmxhZ3MgPSB7CiAJLmZwZm4gPSAw
LAogCS5scGZuID0gMCwKQEAgLTEyOCwyOSArMTIxLDYgQEAgc3RydWN0IHR0bV9wbGFjZW1lbnQg
dm13X3ZyYW1fZ21yX3BsYWNlbWVudCA9IHsKIAkuYnVzeV9wbGFjZW1lbnQgPSAmZ21yX3BsYWNl
bWVudF9mbGFncwogfTsKIAotc3RhdGljIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgdnJhbV9nbXJf
bmVfcGxhY2VtZW50X2ZsYWdzW10gPSB7Ci0JewotCQkuZnBmbiA9IDAsCi0JCS5scGZuID0gMCwK
LQkJLm1lbV90eXBlID0gVFRNX1BMX1ZSQU0sCi0JCS5mbGFncyA9IFRUTV9QTF9GTEFHX0NBQ0hF
RCB8Ci0JCQkgVFRNX1BMX0ZMQUdfTk9fRVZJQ1QKLQl9LCB7Ci0JCS5mcGZuID0gMCwKLQkJLmxw
Zm4gPSAwLAotCQkubWVtX3R5cGUgPSBWTVdfUExfR01SLAotCQkuZmxhZ3MgPSBUVE1fUExfRkxB
R19DQUNIRUQgfAotCQkJIFRUTV9QTF9GTEFHX05PX0VWSUNUCi0JfQotfTsKLQotc3RydWN0IHR0
bV9wbGFjZW1lbnQgdm13X3ZyYW1fZ21yX25lX3BsYWNlbWVudCA9IHsKLQkubnVtX3BsYWNlbWVu
dCA9IDIsCi0JLnBsYWNlbWVudCA9IHZyYW1fZ21yX25lX3BsYWNlbWVudF9mbGFncywKLQkubnVt
X2J1c3lfcGxhY2VtZW50ID0gMSwKLQkuYnVzeV9wbGFjZW1lbnQgPSAmZ21yX25lX3BsYWNlbWVu
dF9mbGFncwotfTsKLQogc3RydWN0IHR0bV9wbGFjZW1lbnQgdm13X3ZyYW1fc3lzX3BsYWNlbWVu
dCA9IHsKIAkubnVtX3BsYWNlbWVudCA9IDEsCiAJLnBsYWNlbWVudCA9ICZ2cmFtX3BsYWNlbWVu
dF9mbGFncywKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
