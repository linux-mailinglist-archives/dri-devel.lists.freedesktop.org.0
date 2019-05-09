Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB601957C
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 01:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F076B89CBE;
	Thu,  9 May 2019 23:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B39289CA0;
 Thu,  9 May 2019 23:00:27 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id t1so4481494qtc.12;
 Thu, 09 May 2019 16:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fGQpsjatsnV45ioA3uD3j5YYfhXhY/hEoFkH7ORhbYw=;
 b=tsE7ff0Hv7x6rHk1VybAS66digyMJzeDqfHEEMTqf1s2OGypO2Q1lzn3zDrihxLEEU
 KzH7tt4asKT0U/5YWRBxHzd47PfaqW69fTPdj1Ut2Hxq6d7EvgDPFM4jTnOrBD/ZLwaF
 Tt33TA/vJqKAMHL3hd7f0TahJwCgfxgMePaY9xo2lRi3J5Gf14HuGkLa/iIXRjaQUO2r
 i7jZtPH52flL03xa4uJt+Zqz+Jm8HM80Mkav59Id5RUiV6z4eCZVjE7v0mcbu+9GCvC4
 v/PlWw4l+eBg1KAlm8RaWsZlxkDd6ZuIhBoWhWCMeFgWi1+6q6IDFVwVRKYDVRGWMpM5
 VuLQ==
X-Gm-Message-State: APjAAAVYzBfiVkj3CMuOD0aOHuccwGPjYYb6Ocdiej3VLIy+w/3k4BLx
 GpcsjxV8plgkw8BcaPZJrW4a6T4K
X-Google-Smtp-Source: APXvYqzzdFC6ZSGtl8lcFtZR+KP3E40KLvqIyUnZ+2Fib5xeZO1v+QRrBb4CEZ4uyXq9RPm4r52Xsg==
X-Received: by 2002:aed:2307:: with SMTP id h7mr6281311qtc.87.1557442826223;
 Thu, 09 May 2019 16:00:26 -0700 (PDT)
Received: from localhost.localdomain ([71.219.84.143])
 by smtp.gmail.com with ESMTPSA id j65sm1571601qkc.31.2019.05.09.16.00.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 09 May 2019 16:00:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, radeon drm-next-5.2
Date: Thu,  9 May 2019 18:00:17 -0500
Message-Id: <20190509230017.3566-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fGQpsjatsnV45ioA3uD3j5YYfhXhY/hEoFkH7ORhbYw=;
 b=O/ZakCZ50pcw73oxNmGX9jsj6pSQUXzYEYV9hOsCmsWedVWCaa7rC3UDpwTEeQdork
 KezZmnywEKPKIP1v36dQL4na6R0fM+9+657X5fDCvd30nThXx2L/K7xKhXp2w5QCMMpE
 sqmvpFFZEy9bZAKByQdXNYpLsiPkSDtO+06KmRUOfpPC14yLiG15AUK/j7tklomaaqqU
 YJg6XEmltvd0bY9vuvIwfkqC1+bTCtjgtwxyPc495J2IvZrTcV7g6353gB/hNcyr88yn
 skvltRDkEB6z+tLvBWaWt1vRJ2h+P0b9C+UieTiU8yOK+tpwUJbRHmmb1l21lxK4Zm4Q
 sOjA==
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

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuMjoKLSBGaXggYSBjcmFzaCBvbiBncHUgcmVz
ZXQgYXQgZHJpdmVyIGxvYWQgdGltZQotIEFUUFggaG90cGx1ZyBmaXggZm9yIHdoZW4gdGhlIGRH
UFUgaXMgcG93ZXJlZCBvZmYKLSBQTEwgZml4IGZvciByNXh4IGFzaWNzCi0gU1ItSU9WIGZpeGVz
CgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDQyMjQ0OTIzOGU5ODUzNDU4Mjgz
YmVmZmVkNzc1NjJkNGI0MGEyZmE6CgogIE1lcmdlIGJyYW5jaCAnZHJtLW5leHQtNS4yJyBvZiBn
aXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eCBpbnRvIGRybS1uZXh0ICgy
MDE5LTA1LTAzIDEwOjMxOjA3ICsxMDAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6CgogIGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4IGRy
bS1uZXh0LTUuMgoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDlkNmZlYTU3NDRkNjc5
ODM1M2YzN2FjNDJhOGE2NTNhMjYwN2NhNjk6CgogIGRybS9hbWRncHUvcHNwOiBtb3ZlIHBzcCB2
ZXJzaW9uIHNwZWNpZmljIGZ1bmN0aW9uIHBvaW50ZXJzIHRvIGVhcmx5X2luaXQgKDIwMTktMDUt
MDkgMTc6NDc6MDQgLTA1MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFhcm9uIExpdSAoMSk6CiAgICAgIGRybS9hbWRn
cHU6IHJlbW92ZSBBVFBYX0RHUFVfUkVRX1BPV0VSX0ZPUl9ESVNQTEFZUyBjaGVjayB3aGVuIGhv
dHBsdWctaW4KCkFsZXggRGV1Y2hlciAoMSk6CiAgICAgIGRybS9hbWRncHUvcHNwOiBtb3ZlIHBz
cCB2ZXJzaW9uIHNwZWNpZmljIGZ1bmN0aW9uIHBvaW50ZXJzIHRvIGVhcmx5X2luaXQKCkNocmlz
dGlhbiBLw7ZuaWcgKDEpOgogICAgICBkcm0vcmFkZW9uOiBwcmVmZXIgbG93ZXIgcmVmZXJlbmNl
IGRpdmlkZXJzCgpFdmFuIFF1YW4gKDEpOgogICAgICBkcm0vYW1kL3Bvd2VycGxheTogY2hlY2sg
Zm9yIGludmFsaWQgcHJvZmlsZV9leGl0IHNldHRpbmcKCk5pY2hvbGFzIEthemxhdXNrYXMgKDEp
OgogICAgICBkcm0vYW1kL2Rpc3BsYXk6IFVzZSBsb25nIGZvciBzaWduZWQgZXJyb3IgY29kZSBj
aGVja3MgaW4gY29tbWl0IHBsYW5lcwoKVHJpZ2dlciBIdWFuZyAoNCk6CiAgICAgIGRybS9hbWRn
cHU6IFJlYXJtIElSUSBpbiBWZWdhMTAgU1ItSU9WIGlmIElSUSBsb3N0CiAgICAgIGRybS9hbWRn
cHU6IEZpeCBWTSBjbGVhbiBjaGVjayBtZXRob2QKICAgICAgZHJtL2FtZGdwdTogQWRkIElESF9R
VUVSWV9BTElWRSBldmVudCBmb3IgU1ItSU9WCiAgICAgIGRybS9hbWRncHU6IFVzZSBGVyBhZGRy
IHJldHVybmVkIGJ5IFBTUCBmb3IgVkYgTU0KCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYWNwaS5jICAgICAgICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wbS5jICAgICAgICAgICAgfCAxMCArKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuYyAgICAgICAgICAgfCAxOSArKysrKystLS0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jICAgICAgICAgICAgfCAzNiArKysrKysrKysr
KysrKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV9haS5jICAgICAg
ICAgICAgIHwgIDMgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L214Z3B1X2FpLmggICAg
ICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jICAg
ICAgICAgICAgIHwgMTYgKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNl
X3Y0XzAuYyAgICAgICAgICAgICB8IDE3ICsrKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS92ZWdhMTBfaWguYyAgICAgICAgICAgIHwgMzcgKysrKysrKysrKysrKysrKysrKysr
Ky0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAg
MyArLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jICAgICAgICAgICB8
ICA0ICstLQogMTEgZmlsZXMgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9u
cygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
