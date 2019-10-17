Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3BBDA3A8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 04:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645DB6E9EC;
	Thu, 17 Oct 2019 02:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7C26E9EC;
 Thu, 17 Oct 2019 02:24:54 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id h126so462567qke.10;
 Wed, 16 Oct 2019 19:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xBIjpj4kqgeffzBcV8eBaM6uqhBGNTPe+wplgBgWgCw=;
 b=Dqw5vhtiOyz+nCavVPzb7TzELC32n/EYIPwmihhSMrAerv82WhvQlIZxKHkaYwvSQC
 75GChUqqx1dFHiMe0IxfxkgOIBlXV9Gg7WkLv7CHyea0CWupgBWlzZdpvOWHgP9ZukDZ
 1gbfd4zLIs5nWiNDUsOw/CiZaBqCdjUCahz8wnlK5uyzfmw+0YjQln8BP3xCJu/9+GcJ
 4M7kyJRxNr2Jz+ZVSpM3hPolpID1Bgc0SfIFftMFmJzHh6MMxm61qBAcIOlq8Kh5KLkd
 jiRwvkAtk4YmgfwUZe4UyWK4XSHbZ4fl5iFofKp2i+43l1XDdn1BLKkpDT56u8d8oe2o
 xSJQ==
X-Gm-Message-State: APjAAAUNwblsI9iudhCGlpmCws8OOzLFT3inYPeXTMeQ4dS0uz72na+A
 khlbvMNnWvhwSdOB3m04p2TQPwWp
X-Google-Smtp-Source: APXvYqy/EOsmkDHk9nnG7yMFsGXxRSx3Zkw8tK0kn+NLFMV0FBDsMODkDX+TiVdrJhzZ42RelRFzlA==
X-Received: by 2002:a37:82c1:: with SMTP id e184mr1099912qkd.424.1571279093086; 
 Wed, 16 Oct 2019 19:24:53 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id b130sm325975qkc.100.2019.10.16.19.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 19:24:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, radeon drm-fixes-5.4
Date: Wed, 16 Oct 2019 22:24:43 -0400
Message-Id: <20191017022443.3853-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xBIjpj4kqgeffzBcV8eBaM6uqhBGNTPe+wplgBgWgCw=;
 b=Ir9OFYbhzqRNak4pDH35jWwXz2voygXwhF85fnxDIL2WQf8Xw6LZDzbfQcIiU3XEuC
 lQi7lqhzOnmkE+pKLzTUtUiFjvsynRX17E5SJ1PXgCFOAJ+ZCYGOPVfOE4RjCkx7f9FV
 1jEhIoOqt568bZL7AHkfpdXOUnjyOH1kFfv+YsFgdT3ilK7Rsnd8p+pPfPzFnkE1eZu0
 fQB5+F83DI5vimJIvGnU/x+Gfsi1Mutmb0FWJhOJ8TYc8b22JrsTc76zYLPg3AOBxHqo
 Xkujr8AF4uvp7C7mH4HssMm8K+mxkGBu3R/iiPtWCAw4xafFYIyEZtTwDa5GiDjW4C/Z
 EfPA==
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

SGkgRGF2ZSwgRGFuaWVsLAoKQSBmZXcgZml4ZXMgZm9yIDUuNC4gIE5vdGhpbmcgdG9vIG1ham9y
LgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAwODMxNjRkYmRiMTdjNWVhNGFk
OTJjMTc4MmI1OWM5ZDc1NTY3NzkwOgoKICBkcm0vYW1kZ3B1OiBmaXggbWVtb3J5IGxlYWsgKDIw
MTktMTAtMDkgMTE6NDU6NTkgLTA1MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKCiAgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXggdGFn
cy9kcm0tZml4ZXMtNS40LTIwMTktMTAtMTYKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byBkMTJjNTA4NTdjNmVkYzFkMThhYTdhNjBjNWE0ZDZkOTQzMTM3YmMwOgoKICBkcm0vYW1kZ3B1
L3NkbWE1OiBmaXggbWFzayB2YWx1ZSBvZiBQT0xMX1JFR01FTSBwYWNrZXQgZm9yIHBpcGUgc3lu
YyAoMjAxOS0xMC0xMSAyMTozMjowNiAtMDUwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtLWZpeGVzLTUuNC0yMDE5
LTEwLTE2OgoKYW1kZ3B1OgotIFBvd2VycGxheSBmaXggZm9yIFNNVTcgcGFydHMKLSBCYWlsIGVh
cmxpZXIgd2hlbiBjaWsvc2kgc3VwcG9ydCBpcyBub3Qgc2V0IHRvIDEKLSBGaXggYW4gU0RNQSBp
c3N1ZSBvbiBuYXZpCgpyYWRlb246Ci0gcmV2ZXJ0IGEgUFBDIGZpeCB3aGljaCBicm9rZW4geDg2
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCkFsZXggRGV1Y2hlciAoMik6CiAgICAgIGRybS9hbWRncHUvcG93ZXJwbGF5OiBm
aXggdHlwbyBpbiBtdmRkIHRhYmxlIHNldHVwCiAgICAgIFJldmVydCAiZHJtL3JhZGVvbjogRml4
IEVFSCBkdXJpbmcga2V4ZWMiCgpIYW5zIGRlIEdvZWRlICgxKToKICAgICAgZHJtL2FtZGdwdTog
QmFpbCBlYXJsaWVyIHdoZW4gYW1kZ3B1LmNpa18vc2lfc3VwcG9ydCBpcyBub3Qgc2V0IHRvIDEK
ClhpYW9qaWUgWXVhbiAoMSk6CiAgICAgIGRybS9hbWRncHUvc2RtYTU6IGZpeCBtYXNrIHZhbHVl
IG9mIFBPTExfUkVHTUVNIHBhY2tldCBmb3IgcGlwZSBzeW5jCgogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgICAgICAgICAgfCAzNSArKysrKysrKysrKysrKysrKysr
KysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgICAgICAgICAgICB8
IDM1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nk
bWFfdjVfMC5jICAgICAgICAgICAgIHwgIDIgKy0KIC4uLi9kcm0vYW1kL3Bvd2VycGxheS9zbXVt
Z3IvcG9sYXJpczEwX3NtdW1nci5jICAgIHwgIDIgKy0KIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Rydi5jICAgICAgICAgICAgICAgIHwgIDggLS0tLS0KIDYgZmlsZXMgY2hhbmdl
ZCwgMzggaW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
