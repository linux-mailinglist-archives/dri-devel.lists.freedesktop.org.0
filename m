Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD21D78A3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E866E821;
	Tue, 15 Oct 2019 14:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194DB6E821
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:35:14 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b24so20526413wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7TTUuVeqQTmwB/iV7SR2hwnFBn4VNEazMgjuvXcNtFk=;
 b=hud0fD9cYI/HqoUBaBo1P7UJ5rLYLPc83cJmafNbD+A/Aslkzp7r0k3C2//LnpWHKx
 FeEZG70MlY46vXMhA1pRI05Nkp+EyUjr4DX28bXZrAGQw6pKoAdAf/n7pkXrfMt/YR4C
 o2uK6+ZhyrSLq7lPdng2XFp13aeqXM6C/hFkgLSa76favnrhMEjLr62FWOXWE29x8nOL
 K6vihFWXjSdHnHJYC/Och0kc8ytZK7t6fo1i3sbLzOaproRJHFz/tJMcH7AyXVmSDTRi
 QHeoE+ZWwD5cbnWA/5oNzhPdElkpwli+mUbuF6DMZfMegZfOmPJqmQvJ5j7ax2GJulcd
 0b/A==
X-Gm-Message-State: APjAAAVhbY2aBtumV14OvQYuLhUxfu30WrgwnysifgGjvJhztC6BVR0y
 DiV3okkiIsvSqDRq0iuPDt5+bZYc
X-Google-Smtp-Source: APXvYqzJdRbW2qlNZjgvIzSr+FTQ67KS2byAix9vxFgv1HkHSYvxISN5VdtOEh4jnrTAVKTmxqYOYg==
X-Received: by 2002:a1c:f011:: with SMTP id a17mr19152323wmb.18.1571150112112; 
 Tue, 15 Oct 2019 07:35:12 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id u4sm41965111wmg.41.2019.10.15.07.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:35:10 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/15] drm/dp: Move drm_dp_link helpers to Tegra DRM
Date: Tue, 15 Oct 2019 16:34:54 +0200
Message-Id: <20191015143509.1104985-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7TTUuVeqQTmwB/iV7SR2hwnFBn4VNEazMgjuvXcNtFk=;
 b=jrTVtDtVBw3ZiO7JKkkIxi3DgD1nypGbShRoZgOQoRNj62rWkZe7aJyJZaxeTP2iV7
 u2hZ3FCfurtBDrQzeILWRLBs/KDL8EFVUq8Br5t9odr6OW0FRm5d4f8l8CwTTFhouX3b
 YmlmFiOPnkkTDRcI3bp2FtLNDNYV/PIkp9E0akpRwIWmJnn4l5Iq1QDjRQe2VTebiSj/
 WS+oPTI1vSNWKNg45LwQgKy7KKjiWLUdzK4qOXqNPG1dcwZwFdS7m6H93asueLGWGE39
 DmFS8Iu+DgPzeZvyVRwySCgdzHgMGlfSUse3ApstppU27m4DNIPHiqTYE0IZk+zhjV2/
 Mu2g==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkhpLAoKRm9sbG93aW5n
IHVwIG9uIHRoZSBkaXNjdXNzaW9uIGFib3V0IHRoZSB1c2VmdWxuZXNzIG9mIHRoZSBkcm1fZHBf
bGluawpoZWxwZXJzLCBoZXJlJ3MgYSBuZXcgc2VyaWVzIHRoYXQgYWRkcyBhIGNvdXBsZSBvZiBu
ZXcgRFBDRCBwYXJzZXIKZnVuY3Rpb25zIGFuZCB0aGVuIHB1c2hlcyB0aGUgZHJtX2RwX2xpbmsg
aGVscGVycyBkb3duIGludG8gZHJpdmVycy4KRm9yIG1vc3QgZHJpdmVycyB0aGlzIHdhcyBwcmV0
dHkgZWFzeSB0byBkbyBzaW5jZSB0aGV5IGRpZG4ndCBoZWF2aWx5CnJlbHkgb24gdGhlIHN0cnVj
dCBkcm1fZHBfbGluay4gSSBkZWNpZGVkIHRvIG1vdmUgdGhlIGRybV9kcF9saW5rCmhlbHBlcnMg
dG8gdGhlIFRlZ3JhIGRyaXZlciBiZWNhdXNlIHRoZXkgYXJlIG1vcmUgaGVhdmlseSB1c2VkIHRo
ZXJlCmFuZCBJIGhhdmUgYSBzdWJzZXF1ZW50IHNlcmllcyB0aGF0IGFkZHMgc3VwcG9ydCBmb3Ig
RGlzcGxheVBvcnQgb24KdmFyaW91cyBUZWdyYSBib2FyZHMgYmFzZWQgb24gdGhvc2UgaGVscGVy
cy4KClRoZSBwbGFuIGlzIHRvIG1lcmdlIHRoaXMgc2VyaWVzIGludG8gZHJtLW1pc2Mgb25jZSBy
ZXZpZXdlZCBzbyB0aGF0IEkKY2FuIHJlYmFzZSBteSBUZWdyYSBEUCBzdXBwb3J0IHBhdGNoZXMg
b24gdGhhdCwgaG9wZWZ1bGx5IGluIHRpbWUgZm9yCnY1LjUuCgpJIGRvbid0IGhhdmUgYWNjZXNz
IHRvIHRoZSBicmlkZ2VzLCBSb2NrY2hpcCBvciBNU00gaGFyZHdhcmUsIHNvIHRob3NlCmRyaXZl
cnMgYXJlIG9ubHkgYnVpbGQtdGVzdGVkLiBTaW5jZSB0aGlzIHNlcmllcyByZWFsbHkgb25seSBy
ZXBsYWNlcwp2YXJpYWJsZXMsIEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhIGhpZ2ggcmlzayBvZiBi
cmVha2luZyBhbnl0aGluZy4KClRoaWVycnkKClRoaWVycnkgUmVkaW5nICgxNSk6CiAgZHJtL2Rw
OiBTb3J0IGluY2x1ZGVzIGFscGhhYmV0aWNhbGx5CiAgZHJtL2RwOiBSZW1vdmUgYSBncmF0dWl0
dW91cyBibGFuayBsaW5lCiAgZHJtL2RwOiBBZGQgZHJtX2RwX2Zhc3RfdHJhaW5pbmdfY2FwKCkg
aGVscGVyCiAgZHJtL2RwOiBBZGQgZHJtX2RwX2NoYW5uZWxfY29kaW5nX3N1cHBvcnRlZCgpIGhl
bHBlcgogIGRybS9kcDogQWRkIGRybV9kcF9hbHRlcm5hdGVfc2NyYW1ibGVyX3Jlc2V0X2NhcCgp
IGhlbHBlcgogIGRybS9kcDogUmVhZCBBVVggcmVhZCBpbnRlcnZhbCBmcm9tIERQQ0QKICBkcm0v
ZHA6IERvIG5vdCBidXN5LWxvb3AgZHVyaW5nIGxpbmsgdHJhaW5pbmcKICBkcm0vZHA6IFVzZSBk
cm1fZHBfYXV4X3JkX2ludGVydmFsKCkKICBkcm0vZHA6IEFkZCBoZWxwZXIgdG8gZ2V0IHBvc3Qt
Y3Vyc29yIGFkanVzdG1lbnRzCiAgZHJtL2JyaWRnZTogYW5hbG9naXgtYW54Nzh4eDogQXZvaWQg
ZHJtX2RwX2xpbmsgaGVscGVycwogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBBdm9pZCBkcm1fZHBf
bGluayBoZWxwZXJzCiAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IFVzZSBEUCBub21lbmNsYXR1cmUK
ICBkcm0vbXNtOiBlZHA6IEF2b2lkIGRybV9kcF9saW5rIGhlbHBlcnMKICBkcm0vcm9ja2NoaXA6
IEF2b2lkIGRybV9kcF9saW5rIGhlbHBlcnMKICBkcm0vdGVncmE6IE1vdmUgZHJtX2RwX2xpbmsg
aGVscGVycyB0byBUZWdyYSBEUk0KCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFu
eDc4eHguYyB8ICA1NyArKysrKystLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5j
ICAgICAgICAgfCAgNjUgKysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5j
ICAgICAgICAgICB8IDE2NyArKystLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL2VkcC9lZHBfY3RybC5jICAgICAgICB8ICA3MCArKysrKystLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9jZG4tZHAtY29yZS5jICAgIHwgIDEyICstCiBkcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvY2RuLWRwLWNvcmUuaCAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L2Nkbi1kcC1yZWcuYyAgICAgfCAgMTkgKystCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvTWFrZWZp
bGUgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYyAgICAgICAg
ICAgICAgICB8IDEzMyArKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Rw
LmggICAgICAgICAgICAgICAgfCAgMjYgKysrKwogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwYXV4
LmMgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jICAgICAg
ICAgICAgICAgfCAgIDEgKwogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICAgICAgICAg
ICAgfCAgODQgKysrKysrKystLS0KIDEzIGZpbGVzIGNoYW5nZWQsIDM5NSBpbnNlcnRpb25zKCsp
LCAyNDQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2RwLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuaAoK
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
