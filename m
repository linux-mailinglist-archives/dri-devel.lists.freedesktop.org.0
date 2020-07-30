Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F3A232A75
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 05:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD626E84B;
	Thu, 30 Jul 2020 03:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96566E84B;
 Thu, 30 Jul 2020 03:36:39 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id j187so24395492qke.11;
 Wed, 29 Jul 2020 20:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D2Tt4RgP7idQaX+mnJJ27xjysW2dvtl+WcOyrBF4R5Y=;
 b=rmI0ntvnShyGnaLYiZ8R29LhZbx4bJb9NlGc+sE3/cluyk+dHvTChDudUjdoMvd5XH
 NKWMUEfXHKlTcMJf/7/sBL2hJnMLrAiNTv6y3biQG3ZsLRKDV1ontmnTpLmaYUji9sNU
 VVfDnvGOWWDtltPJ3PEOrcXOKklwh8pAtiJnKtKdCMfSCyzglzKiB0CC4vrCTevlD8IS
 wX8Q9yKF+zRM6RP6Oi6l2D8HDNjkNkfOsgLUVrsXjsuPH5vd2HRh8relBjDio8NUxRro
 FtLZmLCPqWPMWS6R7eQ+X7oVJDXVrINPuDSuyuSedS1r5PjI92E5Q1nno8Ut6b9FUkcY
 yoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D2Tt4RgP7idQaX+mnJJ27xjysW2dvtl+WcOyrBF4R5Y=;
 b=U7ac87iflg+FXGngfvURs7ONa60da+cehM35teCUyIMiVnQZgZupy8LqUihabMjMzw
 BgW0mpu/CvtRReoN9uf/xUMXt/FGsOt/SuBV6B2Ry/aTM0JJ/Dn4KGPaYROrAbj7lIOK
 1Sd97uwSxCdvTwBEvL3CNWJ3pTKfHKBOLbjGxDmKrJzxpc4/U/QHKBWEesP33pp/6xok
 twCjlH0eeY2jg0Yt9lukK/WWti/APfDifQ8PioRAkZP+71HAHB10wBHfZzsrVqhe+mqm
 KAXF9J357TdW+A/58+I1TblVaw/I+DX7TMNZH3pVwWRVHfGeHviK8XHtnXR2TUWPCoGq
 PTOQ==
X-Gm-Message-State: AOAM530Y8ku0WS5sR9w7h5EWKGHCUeiQwbCQNuWR5sd41RxZs/mAWCvd
 r9NH7sGLjrhEw/Epahd3dh563Qo+
X-Google-Smtp-Source: ABdhPJxiwhil7aObYSlToav8bCgs785jTBdZ51bzqFvHID4xczXM/bIdKG1Z7u373pUiS5lxb+py/A==
X-Received: by 2002:a05:620a:7e9:: with SMTP id
 k9mr35422317qkk.415.1596080198463; 
 Wed, 29 Jul 2020 20:36:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id b186sm3317223qkd.28.2020.07.29.20.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 20:36:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.8
Date: Wed, 29 Jul 2020 23:36:30 -0400
Message-Id: <20200730033630.4455-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKQSBmZXcgZml4ZXMgZm9yIDUuOC4gIEl0IHdvdWxkIGJlIG5pY2Ug
dG8gZ2V0IHRoZXNlIGluIGZvciA1LjggZmluYWwsIGJ1dCBpZgppdCdzIHRvbyBsYXRlLCB0aGV5
IGNhbiBnbyBiYWNrIHZpYSBzdGFibGUgZnJvbSA1LjkuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMg
c2luY2UgY29tbWl0IGE0YTI3MzliZWI4OTMzYTE5MjgxYmNhMDc3ZmRiODUyNTk4ODAzZWQ6Cgog
IE1lcmdlIHRhZyAnZHJtLW1pc2MtZml4ZXMtMjAyMC0wNy0yOCcgb2YgZ2l0Oi8vYW5vbmdpdC5m
cmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjIGludG8gZHJtLWZpeGVzICgyMDIwLTA3LTI5IDEy
OjQ2OjU4ICsxMDAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cgog
IGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4IHRhZ3MvYW1kLWRybS1m
aXhlcy01LjgtMjAyMC0wNy0yOQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGE0Zjhi
OTUzYTQyZWY2ZjM2NTVkY2Y4M2Q1NjA1MjhiOWY0MTYyZGM6CgogIGRybS9hbWQvZGlzcGxheTog
Q2xlYXIgZG1fc3RhdGUgZm9yIGZhc3QgdXBkYXRlcyAoMjAyMC0wNy0yOSAyMzoxNzoyMyAtMDQw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KYW1kLWRybS1maXhlcy01LjgtMjAyMC0wNy0yOToKCmFtZGdwdToKLSBGaXgg
YSByZWdyZXNzaW9uIGNhdXNlZCBieSBhIE5VTEwgcG9pbnRlciBmaXgKLSBGaXggcG90ZW50aWFs
IGtlcm5lbCBpbmZvIGxlYWsKLSBGaXggYSB1c2UtYWZ0ZXItZnJlZSBidWcgdGhhdCB3YXMgdW5j
b3ZlcmVkIGJ5IGFub3RoZXIgY2hhbmdlIGluIDUuNwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNYXppbiBSZXprICgxKToK
ICAgICAgZHJtL2FtZC9kaXNwbGF5OiBDbGVhciBkbV9zdGF0ZSBmb3IgZmFzdCB1cGRhdGVzCgpQ
YXdlxYIgR3Jvbm93c2tpICgxKToKICAgICAgZHJtL2FtZGdwdTogRml4IHJlZ3Jlc3Npb24gaW4g
YWRqdXN0aW5nIHBvd2VyIHRhYmxlL3Byb2ZpbGUKClBlaWxpbiBZZSAoMSk6CiAgICAgIGRybS9h
bWRncHU6IFByZXZlbnQga2VybmVsLWluZm9sZWFrIGluIGFtZGdwdV9pbmZvX2lvY3RsKCkKCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgICAgICAgICAgIHwgIDMgKy0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jICAgICAgICAgICAgfCAgOSAr
KysrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMg
fCAzNiArKysrKysrKysrKysrKysrKy0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRp
b25zKCspLCAxMiBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
