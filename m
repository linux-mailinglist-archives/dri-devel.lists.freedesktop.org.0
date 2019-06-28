Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A3F59005
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 03:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C906E878;
	Fri, 28 Jun 2019 01:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6676E879;
 Fri, 28 Jun 2019 01:56:06 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id p15so4684405qtl.3;
 Thu, 27 Jun 2019 18:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X5fz14e6gLUYx3w8ZM3lOWbjuZJIOI8HVhn8thMJfM4=;
 b=nbST9VrvZHpdMbl9tWzwNPuCQ64003P1tphoRgBmh8x7EMUx9F53RvDlE0ybAyu6YE
 BDgP/zYY6y+q6HILAtjf/VF93d84rsJZGk7H2MQ+HmGVFXlPUpn6OCoLZkv19VV/RKQZ
 JnWY7Cg1qdulp+Pn1Sx5G4iL96VSJQQqIDpRomsaIbNdxwVGe9IB1ouPYj7uYs6LHNwR
 vTxj5TE5XtkCSzwYEMfKkSLam710yBnHN5aNUh9ufFY06yZkPdABamqGIeiZWRafsyOD
 ctacf8YJFAEkg5ZQWGPIP5Lc7SGgEZ28KaGKszt9p6kORYl/iiNIlY/ZjjRY2XAQKzl7
 s7Bg==
X-Gm-Message-State: APjAAAUbc//dnkPUBb+zgbDWeiGBw1orYzsfbfc3wsN0Qe4U2QcmKmzX
 B4mnDUgeu9W8vc0q7dLxkqUM33fpsZ0=
X-Google-Smtp-Source: APXvYqxYIjfQXqizdm3LCMwEd9E3/2zdIec4IL8HQ0bzj3450NMtncC9uv+yQDGgDXJM4yzxElTrmQ==
X-Received: by 2002:a0c:b4ab:: with SMTP id c43mr5798224qve.157.1561686965036; 
 Thu, 27 Jun 2019 18:56:05 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id y16sm351225qkf.93.2019.06.27.18.56.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 18:56:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, ttm drm-next-5.3
Date: Thu, 27 Jun 2019 20:55:55 -0500
Message-Id: <20190628015555.3384-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X5fz14e6gLUYx3w8ZM3lOWbjuZJIOI8HVhn8thMJfM4=;
 b=BgeD1VALsnrF9HGyVY+7VxvorfrSUwwyjSEbjMFpyu6gHXCBhAle4P58WwsZyUvtJK
 xpdR50UIgXq5/HvjomAiVORAMxbpUsPdNl7w2PjyKMBnLy625/krdldBBwimDzyR7Zav
 KSHXSruWJQTeqvfq15WC5KyCGDegitc2G3vQeKfWsUiXYBaGIHdj77ijASChyeEsJzuo
 cc/mNC+UfRjJfZZZsPl+BdgSTSz1xiJktJ6Rg62shSlRyoR22vQlilzc3jgPNjFl0Fun
 KSHMvr/teL0GvmyfhY+6qAhb7mcve44s3D1aATnweuTsNBPj4hQQmoqtERAmwvXZNSRR
 6j1A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKQXJtIGZpeCBhcyByZXF1ZXN0ZWQgYnkgRGF2ZSwgcGx1cyBhIGZl
dyBuYXZpIGZpeGVzLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAxNDgwOGEx
MmJkYmRjMjExNDNlYmE3MGVhMDc4MzAxOTdiM2EwNGZmOgoKICBNZXJnZSB0YWcgJ2RybS1uZXh0
LTUuMy0yMDE5LTA2LTI1JyBvZiBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9s
aW51eCBpbnRvIGRybS1uZXh0ICgyMDE5LTA2LTI3IDEyOjMzOjU3ICsxMDAwKQoKYXJlIGF2YWls
YWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL3Blb3BsZS5mcmVlZGVza3Rv
cC5vcmcvfmFnZDVmL2xpbnV4IHRhZ3MvZHJtLW5leHQtNS4zLTIwMTktMDYtMjcKCmZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA0NDBlODBjZTAyY2RlN2I4MTBlNGViNTU1NzY4YzJkNzdl
N2EyN2M4OgoKICBkcm0vYW1kL2Rpc3BsYXk6IGZpeCBhIGNvdXBsZSBvZiBzcGVsbGluZyBtaXN0
YWtlcyAoMjAxOS0wNi0yNyAxMToyMjo1NyAtMDUwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtLW5leHQtNS4zLTIw
MTktMDYtMjc6CgphbWRncHU6Ci0gRml4IHdhcm5pbmcgb24gMzIgYml0IEFSTQotIEZpeCBjb21w
aWxhdGlvbiBvbiBiaWcgZW5kaWFuCi0gTWlzYyBidWcgZml4ZXMKCnR0bToKLSBMaXZlIGxvY2sg
Zml4CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCkFsZXggRGV1Y2hlciAoMik6CiAgICAgIGRybS9hbWRncHU6IGZpeCB3YXJu
aW5nIG9uIDMyIGJpdAogICAgICBkcm0vYW1kZ3B1OiBkcm9wIGNvcHkvcGFzdGUgbGVmdG92ZXIg
dG8gZml4IGJpZyBlbmRpYW4KCkNvbGluIElhbiBLaW5nICgxKToKICAgICAgZHJtL2FtZC9kaXNw
bGF5OiBmaXggYSBjb3VwbGUgb2Ygc3BlbGxpbmcgbWlzdGFrZXMKCkV2YW4gUXVhbiAoNCk6CiAg
ICAgIGRybS9hbWQvcG93ZXJwbGF5OiBjaGVjayBwcmVyZXF1aXNpdGUgZm9yIFZDTiBwb3dlciBn
YXRpbmcKICAgICAgZHJtL2FtZC9wb3dlcnBsYXk6IHN1cHBvcnQgcnVudGltZSBwcGZlYXR1cmVz
IHNldHRpbmcgb24gTmF2aTEwCiAgICAgIGRybS9hbWQvcG93ZXJwbGF5OiBhZGQgbWlzc2luZyBz
bXVfZ2V0X2Nsa19pbmZvX2Zyb21fdmJpb3MoKSBjYWxsCiAgICAgIGRybS9hbWQvcG93ZXJwbGF5
OiBubyBtZW1vcnkgYWN0aXZpdHkgc3VwcG9ydCBvbiBWZWdhMTAKCkZlbGl4IEt1ZWhsaW5nICgx
KToKICAgICAgZHJtL3R0bTogcmV0dXJuIC1FQlVTWSBpZiB3YWl0aW5nIGZvciBidXN5IEJPIGZh
aWxzCgpPYWsgWmVuZyAoMSk6CiAgICAgIGRybS9hbWRncHU6IFNldCBxdWV1ZV9wcmVlbXB0aW9u
X3RpbWVvdXRfbXMgZGVmYXVsdCB2YWx1ZQoKc2hhb3l1bmwgKDEpOgogICAgICBkcm0vYW1ka2Zk
OiByZW1vdmUgdW5uZWNlc3Nhcnkgd2FybmluZyBtZXNzYWdlIG9uIGdwdSByZXNldAoKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgICAgICAgICB8ICAgMiArLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgICAgICAgICAgIHwgICA2ICstCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyAgICAgICAgICAgfCAgIDMgLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYyAgICAgICAgICAgIHwgICA0ICst
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgICAgICAgICAgfCAgIDEg
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jIHwgICAy
ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5jICAgICAgfCAg
IDggKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyAgICAgICB8
ICAgNCArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgICAgICAg
fCAxODEgKysrKysrKysrKysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogMTAgZmlsZXMgY2hhbmdlZCwgMTkyIGlu
c2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
