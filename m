Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1B916910A
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 18:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560B86E96A;
	Sat, 22 Feb 2020 17:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BAC6E969
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 17:54:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id a9so5211676wmj.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 09:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lwDm2OlkUyaElN02AldWQQrzxsnfcCauG4tM+zkjPSU=;
 b=h6YvFFfMBaO84i86fCz/yflsB8VJIPF0XQU8QTyEJvo4UyiQ2NnvRZ1B7wpX6t1j92
 NnI6PPYYL3mqzKX/1Yf7/26rLaQWZXev7I+SKmCMVi1YihFPJKPCofQadRisgxI3MM5g
 cxlZ+dLvUMAydg+aiRtdh8ndtnwJ8jV2By7Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lwDm2OlkUyaElN02AldWQQrzxsnfcCauG4tM+zkjPSU=;
 b=kK5xu5aP0VwNij/4vzHN0QX6b9dpjqE7Fs2i2fAkgggCC0h432vNB/HwLECxQ3zz36
 Huh2aCkZx0ZtTXqP1clO/x2vJpIHiaciRhziw8deVbFbwMYOXMtNT2cJ3vffE3oBQhZn
 U1QA7fwN2qW0dnHi3c2ut7mZ47EusM36b03mdc6YGiet5WrjDbMx96KKPTGlcUS5Kswc
 3NN7YBhFVBxf3Q1+Ugjspyxuq2cpYNR9V1HL7VA2fag9aRcIWT7pVC8QiC8Bakept9Yj
 q5T+zihD5ra/xJv6qlRif5ooB0PUsi/J9HBMRwAoPohTmeDnKb2pVrZBl466v/cPBbsH
 mUzg==
X-Gm-Message-State: APjAAAWmkui9G/AVWysy9UFND5CejkoUCE4BtkPUBcBbIhNjukFqiLEQ
 ElRLLOrf1jtipAR7ulvH7vFN0EIRIjQ=
X-Google-Smtp-Source: APXvYqw+YfcL/1ZT3sTq8eYCYgk5Op69Z/yKfFP1A9oAMZuV8IJeQzev7R7KEy5bV1J6vsqIkXWgkQ==
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr11675393wmj.133.1582394079331; 
 Sat, 22 Feb 2020 09:54:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l15sm9373405wrv.39.2020.02.22.09.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 09:54:38 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: Drop DRIVER_USE_AGP
Date: Sat, 22 Feb 2020 18:54:31 +0100
Message-Id: <20200222175433.2259158-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 "Tianci.Yin" <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBkb2Vzbid0IGRvIGFueXRoaW5nIGV4Y2VwdCBhdXRvLWluaXQgZHJtX2FncCBzdXBwb3J0
IHdoZW4geW91CmNhbGwgZHJtX2dldF9wY2lfZGV2KCkuIFdoaWNoIGFtZGdwdSBzdG9wcGVkIGRv
aW5nIHdpdGgKCmNvbW1pdCBiNThjMTEzMTRhMTcwNmJmMDk0YzQ4OWVmNWNiMjhmNzY0NzhjNzA0
CkF1dGhvcjogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpEYXRlOiAg
IEZyaSBKdW4gMiAxNzoxNjozMSAyMDE3IC0wNDAwCgogICAgZHJtL2FtZGdwdTogZHJvcCBkZXBy
ZWNhdGVkIGRybV9nZXRfcGNpX2RldiBhbmQgZHJtX3B1dF9kZXYKCk5vIGlkZWEgd2hldGhlciB0
aGlzIHdhcyBpbnRlbnRpb25hbCBvciBhY2NpZGVudGFsIGJyZWFrYWdlLCBidXQgSQpndWVzcyBh
bnlvbmUgd2hvIG1hbmFnZXMgdG8gYm9vdCBhIHRoaXMgbW9kZXJuIGdwdSBiZWhpbmQgYW4gYWdw
CmJyaWRnZSBkZXNlcnZlcyBhIHByaWNlLiBBIHByaWNlIEkgbmV2ZXIgZXhwZWN0IGFueW9uZSB0
byBldmVyIGNvbGxlY3QKOi0pCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CkNjOiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+CkNjOiBYaWFvamllIFl1
YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgpDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNv
bT4KQ2M6ICJUaWFuY2kuWWluIiA8dGlhbmNpLnlpbkBhbWQuY29tPgpDYzogIk1hcmVrIE9sxaHD
oWsiIDxtYXJlay5vbHNha0BhbWQuY29tPgpDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVk
aGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IDQ1OTg4MzZjNWZhNC4uNmNlYTky
MDE3MTA5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBAIC0xMzc5
LDcgKzEzNzksNyBAQCBpbnQgYW1kZ3B1X2ZpbGVfdG9fZnByaXYoc3RydWN0IGZpbGUgKmZpbHAs
IHN0cnVjdCBhbWRncHVfZnByaXYgKipmcHJpdikKIAogc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVy
IGttc19kcml2ZXIgPSB7CiAJLmRyaXZlcl9mZWF0dXJlcyA9Ci0JICAgIERSSVZFUl9VU0VfQUdQ
IHwgRFJJVkVSX0FUT01JQyB8CisJICAgIERSSVZFUl9BVE9NSUMgfAogCSAgICBEUklWRVJfR0VN
IHwKIAkgICAgRFJJVkVSX1JFTkRFUiB8IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX1NZTkNPQkog
fAogCSAgICBEUklWRVJfU1lOQ09CSl9USU1FTElORSwKLS0gCjIuMjQuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
