Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67F22AFFF
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 10:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8FE899FF;
	Mon, 27 May 2019 08:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCF68999E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 08:19:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f10so7752466wmb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 01:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bGo+wmfdMFNtr1n5PzMjqu4298v/kiu+NsJd7STGsfY=;
 b=XMx7C2dnltk5ljq3qCcdQ8ZxvATcqb+QuQAKci4b+HCmPnEqlKTKPLwqt8v00yQaFV
 oBSj5CLc3CnbQNH1TZCkAsivJ3lu+FgraiwQK/JKp8kssAGdHgaKyAHVr2vMr0PdBZrm
 bQ07ijuIXCMBC8HRu6AYRXxN7C+kaKJmrNrGfk6IQFkwPf4cmgMkgVXfESalkFWNGwI+
 +7bzwhuYYqhaa0eLjG3N1MOlgnaB0UmWF+kWgVTtNJLV/fFV3cIXnbtjEWjQ9T2MfS0N
 rAtEkWtrf1GK2rqMsJKSwBDLTMU5d/e4muuV1P76tTEBnXqO65ND7cqKCDMglqwaBTPm
 fT5A==
X-Gm-Message-State: APjAAAXyu4LYL1AsN++JhYKyFZK+/Ec69BQQHy3N82fhks8zeinHcUrf
 OwHGvYIp9FVhUG8QXe0DcDvbcg3/
X-Google-Smtp-Source: APXvYqyZVD1u2Fprbi2Z46JCYije7AL8+ij7toiPDQdPSpMZTCv+CcxCCjDpsyk8zbY545OC02G0Vg==
X-Received: by 2002:a05:600c:114f:: with SMTP id
 z15mr9265708wmz.104.1558945165520; 
 Mon, 27 May 2019 01:19:25 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id a124sm7511876wmh.3.2019.05.27.01.19.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 01:19:25 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/13] drm/virtio: drop DRM_AUTH usage from the driver
Date: Mon, 27 May 2019 09:17:40 +0100
Message-Id: <20190527081741.14235-12-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527081741.14235-1-emil.l.velikov@gmail.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bGo+wmfdMFNtr1n5PzMjqu4298v/kiu+NsJd7STGsfY=;
 b=DEgdxNrKgBZYo//4TQnq9pRScePESu2k3EUK0vCL8OX9uFkHxxyLMmFWVrm5bp+dMw
 O1id/TRhkXrvWY9eieCmsrcQkuIuxx5KtNLxBUb4Efgm9x1UJPxxg1eldOHI/FD862L/
 x5fnlCAsHz67w8TCF7oh/AL0cTIrGSTkvu/yuOJwoHQC0wfaiSTQ1vgGOFXt5/DJTaoD
 C+p5teDn921KesiinoYqauVHXG3ehpt6KyMDd6vAU6LzXM9Hot1nNAGq6lgdyBEPSPbn
 par945U0E6VLbpvKpdDSmg4HckQbpRd+ailTV0zvlVSkVTPqk5aN2rGz0zKrg5VNPfbs
 BZYA==
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
 Gerd Hoffmann <kraxel@redhat.com>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClRoZSBhdXRo
ZW50aWNhdGlvbiBjYW4gYmUgY2lyY3VtdmVudGVkLCBieSBkZXNpZ24sIGJ5IHVzaW5nIHRoZSBy
ZW5kZXIKbm9kZS4KCkZyb20gdGhlIGRyaXZlciBQT1YgdGhlcmUgaXMgbm8gZGlzdGluY3Rpb24g
YmV0d2VlbiBwcmltYXJ5IGFuZCByZW5kZXIKbm9kZXMsIHRodXMgd2UgY2FuIGRyb3AgdGhlIHRv
a2VuLgoKQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzogdmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9m
Zi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyB8IDE4ICsrKysrKysrKy0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyBiL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCmluZGV4IDk0OWEyNjQ5ODVmYy4uZTcyNjI2
ZmFiYTUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYwpAQCAtNTUzLDM0
ICs1NTMsMzQgQEAgc3RhdGljIGludCB2aXJ0aW9fZ3B1X2dldF9jYXBzX2lvY3RsKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCiAKIHN0cnVjdCBkcm1faW9jdGxfZGVzYyB2aXJ0aW9fZ3B1X2lvY3Rs
c1tEUk1fVklSVElPX05VTV9JT0NUTFNdID0gewogCURSTV9JT0NUTF9ERUZfRFJWKFZJUlRHUFVf
TUFQLCB2aXJ0aW9fZ3B1X21hcF9pb2N0bCwKLQkJCSAgRFJNX0FVVEggfCBEUk1fVU5MT0NLRUQg
fCBEUk1fUkVOREVSX0FMTE9XKSwKKwkJCSAgRFJNX1VOTE9DS0VEIHwgRFJNX1JFTkRFUl9BTExP
VyksCiAKIAlEUk1fSU9DVExfREVGX0RSVihWSVJUR1BVX0VYRUNCVUZGRVIsIHZpcnRpb19ncHVf
ZXhlY2J1ZmZlcl9pb2N0bCwKLQkJCSAgRFJNX0FVVEggfCBEUk1fVU5MT0NLRUQgfCBEUk1fUkVO
REVSX0FMTE9XKSwKKwkJCSAgRFJNX1VOTE9DS0VEIHwgRFJNX1JFTkRFUl9BTExPVyksCiAKIAlE
Uk1fSU9DVExfREVGX0RSVihWSVJUR1BVX0dFVFBBUkFNLCB2aXJ0aW9fZ3B1X2dldHBhcmFtX2lv
Y3RsLAotCQkJICBEUk1fQVVUSCB8IERSTV9VTkxPQ0tFRCB8IERSTV9SRU5ERVJfQUxMT1cpLAor
CQkJICBEUk1fVU5MT0NLRUQgfCBEUk1fUkVOREVSX0FMTE9XKSwKIAogCURSTV9JT0NUTF9ERUZf
RFJWKFZJUlRHUFVfUkVTT1VSQ0VfQ1JFQVRFLAogCQkJICB2aXJ0aW9fZ3B1X3Jlc291cmNlX2Ny
ZWF0ZV9pb2N0bCwKLQkJCSAgRFJNX0FVVEggfCBEUk1fVU5MT0NLRUQgfCBEUk1fUkVOREVSX0FM
TE9XKSwKKwkJCSAgRFJNX1VOTE9DS0VEIHwgRFJNX1JFTkRFUl9BTExPVyksCiAKIAlEUk1fSU9D
VExfREVGX0RSVihWSVJUR1BVX1JFU09VUkNFX0lORk8sIHZpcnRpb19ncHVfcmVzb3VyY2VfaW5m
b19pb2N0bCwKLQkJCSAgRFJNX0FVVEggfCBEUk1fVU5MT0NLRUQgfCBEUk1fUkVOREVSX0FMTE9X
KSwKKwkJCSAgRFJNX1VOTE9DS0VEIHwgRFJNX1JFTkRFUl9BTExPVyksCiAKIAkvKiBtYWtlIHRy
YW5zZmVyIGFzeW5jIHRvIHRoZSBtYWluIHJpbmc/IC0gbm8gc3VyZSwgY2FuIHdlCiAJICogdGhy
ZWFkIHRoZXNlIGluIHRoZSB1bmRlcmx5aW5nIEdMCiAJICovCiAJRFJNX0lPQ1RMX0RFRl9EUlYo
VklSVEdQVV9UUkFOU0ZFUl9GUk9NX0hPU1QsCiAJCQkgIHZpcnRpb19ncHVfdHJhbnNmZXJfZnJv
bV9ob3N0X2lvY3RsLAotCQkJICBEUk1fQVVUSCB8IERSTV9VTkxPQ0tFRCB8IERSTV9SRU5ERVJf
QUxMT1cpLAorCQkJICBEUk1fVU5MT0NLRUQgfCBEUk1fUkVOREVSX0FMTE9XKSwKIAlEUk1fSU9D
VExfREVGX0RSVihWSVJUR1BVX1RSQU5TRkVSX1RPX0hPU1QsCiAJCQkgIHZpcnRpb19ncHVfdHJh
bnNmZXJfdG9faG9zdF9pb2N0bCwKLQkJCSAgRFJNX0FVVEggfCBEUk1fVU5MT0NLRUQgfCBEUk1f
UkVOREVSX0FMTE9XKSwKKwkJCSAgRFJNX1VOTE9DS0VEIHwgRFJNX1JFTkRFUl9BTExPVyksCiAK
IAlEUk1fSU9DVExfREVGX0RSVihWSVJUR1BVX1dBSVQsIHZpcnRpb19ncHVfd2FpdF9pb2N0bCwK
LQkJCSAgRFJNX0FVVEggfCBEUk1fVU5MT0NLRUQgfCBEUk1fUkVOREVSX0FMTE9XKSwKKwkJCSAg
RFJNX1VOTE9DS0VEIHwgRFJNX1JFTkRFUl9BTExPVyksCiAKIAlEUk1fSU9DVExfREVGX0RSVihW
SVJUR1BVX0dFVF9DQVBTLCB2aXJ0aW9fZ3B1X2dldF9jYXBzX2lvY3RsLAotCQkJICBEUk1fQVVU
SCB8IERSTV9VTkxPQ0tFRCB8IERSTV9SRU5ERVJfQUxMT1cpLAorCQkJICBEUk1fVU5MT0NLRUQg
fCBEUk1fUkVOREVSX0FMTE9XKSwKIH07Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
