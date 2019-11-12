Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0F5F979B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 18:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10A86E35F;
	Tue, 12 Nov 2019 17:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A23A6E219
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 17:50:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a15so19508066wrf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 09:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mK7LpsPSwHW0C4HoNBRAGGDb7SQ/BbZtQ1R8Y4OPjJU=;
 b=MCiaj3/ayKPqlZNAaV9l7IHk/Pa1P6UWROgTlF8cHx4JeoSDC5qs+u+TGk9wUPgn4G
 L5sQTwrLpPLAHxCZjtD7Ue2RUBQpeYclVdi42GpvmXMQuxKGdz3g/pFDsmgHQOY+7i/z
 Cu7dxW1RHTZL5rYgiEwMplGO8cxC8SvYsYCCm5L9RvpcJYWdfDDa4TnSonvL9rAsu58s
 teA0loG+Bh//oggtGwAXbJdlvz6XrMWq6HGM5crqmjTEAgeQsYWqEYXucd2SXSuwrhMJ
 QmDwQi7X/oOlP/8ZjvwpGfC41veFYZyd/Hjq5eS4FMtjEP5IENwJwinbZU8iM8JJl0Ql
 j3hg==
X-Gm-Message-State: APjAAAWQJ5zu1r8oJ2KyPMlvg5ynKKFTMXpcHkYzRbdFIsbKdW4TnekS
 sQYBLX/taseuPmJg/Q4bPT1UWDhk0jg=
X-Google-Smtp-Source: APXvYqyo/BZdMs3Ccf9GQAnz5RUWkZmduT62+91UMaxqSra+Bzky02r/zJ7djct6Sc02/R45uPMmJQ==
X-Received: by 2002:a5d:6b51:: with SMTP id x17mr3829512wrw.148.1573581054478; 
 Tue, 12 Nov 2019 09:50:54 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id d198sm5747051wmd.2.2019.11.12.09.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 09:50:53 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/fb-helper: unexpoert drm_fb_helper_generic_probe
Date: Tue, 12 Nov 2019 18:50:47 +0100
Message-Id: <20191112175048.1581-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mK7LpsPSwHW0C4HoNBRAGGDb7SQ/BbZtQ1R8Y4OPjJU=;
 b=N/PI3EHCOtjJqsQ5GpRMK5p01Lgps1CEF61Pei52TNyGDde5+R3s8NbrhiR8b2uggM
 stiR72COFVZJQjCAQ6ODPwOLLum/fXrxjEJqVZyxByVUhC+zwx/357en3EAxAuC1YfIv
 NPOjSZJEG5uBUlTs4QfJ9dTNGeyc+utXwqe0M=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IHN1cmUgd2UgZG9uJ3QgeWV0IGhhdmUgdGhpcyBhcyBhIHBhdGNoIHNvbWV3aGVyZSAuLi4K
Ck1vdGl2YXRpb24gaXMgdGhhdCB0aGUgYXV0b21hdGljIGxpZmV0aW1lIG1hbmFnZW1lbnQgb2Yg
dGhlIGdlbmVyaWMgZmJkZXYKY29kZSBpcyBxdWl0ZSB0cmlja3ksIGFuZCBpdCdsbCBnZXQgZXZl
biBtb3JlIHRyaWNreS4gQWxsb3dpbmcgZHJpdmVycwp0byBqdXN0IHVzZSB0aGUgZmJfcHJvYmUg
bG9va3MgbGlrZSBhIHJlY2lwZSBmb3IgZGlzYXN0ZXIuCgpDYzogR2VyZCBIb2ZmbWFubiA8a3Jh
eGVsQHJlZGhhdC5jb20+CkNjOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4K
Q2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZmJfaGVscGVyLmMgfCAxNCArKystLS0tLS0tLS0tLQogaW5jbHVkZS9kcm0vZHJt
X2ZiX2hlbHBlci5oICAgICB8ICA5IC0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCmluZGV4IDEw
MzhhMmYwNjM5ZS4uMGVjOThlMDQ2YjU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKQEAgLTIw
MzUsMjEgKzIwMzUsMTQgQEAgc3RhdGljIHN0cnVjdCBmYl9kZWZlcnJlZF9pbyBkcm1fZmJkZXZf
ZGVmaW8gPSB7CiAJLmRlZmVycmVkX2lvCT0gZHJtX2ZiX2hlbHBlcl9kZWZlcnJlZF9pbywKIH07
CiAKLS8qKgotICogZHJtX2ZiX2hlbHBlcl9nZW5lcmljX3Byb2JlIC0gR2VuZXJpYyBmYmRldiBl
bXVsYXRpb24gcHJvYmUgaGVscGVyCi0gKiBAZmJfaGVscGVyOiBmYmRldiBoZWxwZXIgc3RydWN0
dXJlCi0gKiBAc2l6ZXM6IGRlc2NyaWJlcyBmYmRldiBzaXplIGFuZCBzY2Fub3V0IHN1cmZhY2Ug
c2l6ZQotICoKKy8qCiAgKiBUaGlzIGZ1bmN0aW9uIHVzZXMgdGhlIGNsaWVudCBBUEkgdG8gY3Jl
YXRlIGEgZnJhbWVidWZmZXIgYmFja2VkIGJ5IGEgZHVtYiBidWZmZXIuCiAgKgogICogVGhlIF9z
eXNfIHZlcnNpb25zIGFyZSB1c2VkIGZvciAmZmJfb3BzLmZiX3JlYWQsIGZiX3dyaXRlLCBmYl9m
aWxscmVjdCwKICAqIGZiX2NvcHlhcmVhLCBmYl9pbWFnZWJsaXQuCi0gKgotICogUmV0dXJuczoK
LSAqIFplcm8gb24gc3VjY2VzcyBvciBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCiAg
Ki8KLWludCBkcm1fZmJfaGVscGVyX2dlbmVyaWNfcHJvYmUoc3RydWN0IGRybV9mYl9oZWxwZXIg
KmZiX2hlbHBlciwKLQkJCQlzdHJ1Y3QgZHJtX2ZiX2hlbHBlcl9zdXJmYWNlX3NpemUgKnNpemVz
KQorc3RhdGljIGludCBkcm1fZmJfaGVscGVyX2dlbmVyaWNfcHJvYmUoc3RydWN0IGRybV9mYl9o
ZWxwZXIgKmZiX2hlbHBlciwKKwkJCQkgICAgICAgc3RydWN0IGRybV9mYl9oZWxwZXJfc3VyZmFj
ZV9zaXplICpzaXplcykKIHsKIAlzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCA9ICZmYl9o
ZWxwZXItPmNsaWVudDsKIAlzdHJ1Y3QgZHJtX2NsaWVudF9idWZmZXIgKmJ1ZmZlcjsKQEAgLTIx
MjEsNyArMjExNCw2IEBAIGludCBkcm1fZmJfaGVscGVyX2dlbmVyaWNfcHJvYmUoc3RydWN0IGRy
bV9mYl9oZWxwZXIgKmZiX2hlbHBlciwKIAogCXJldHVybiAwOwogfQotRVhQT1JUX1NZTUJPTChk
cm1fZmJfaGVscGVyX2dlbmVyaWNfcHJvYmUpOwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9m
Yl9oZWxwZXJfZnVuY3MgZHJtX2ZiX2hlbHBlcl9nZW5lcmljX2Z1bmNzID0gewogCS5mYl9wcm9i
ZSA9IGRybV9mYl9oZWxwZXJfZ2VuZXJpY19wcm9iZSwKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9mYl9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaAppbmRleCBlM2E3
NWZmMDczOTAuLmRjZmZjYTczY2Q1MiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2ZiX2hl
bHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaApAQCAtMjcyLDggKzI3Miw2
IEBAIGludCBkcm1fZmJfaGVscGVyX2RlYnVnX2xlYXZlKHN0cnVjdCBmYl9pbmZvICppbmZvKTsK
IHZvaWQgZHJtX2ZiX2hlbHBlcl9sYXN0Y2xvc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldik7CiB2
b2lkIGRybV9mYl9oZWxwZXJfb3V0cHV0X3BvbGxfY2hhbmdlZChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2KTsKIAotaW50IGRybV9mYl9oZWxwZXJfZ2VuZXJpY19wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hl
bHBlciAqZmJfaGVscGVyLAotCQkJCXN0cnVjdCBkcm1fZmJfaGVscGVyX3N1cmZhY2Vfc2l6ZSAq
c2l6ZXMpOwogaW50IGRybV9mYmRldl9nZW5lcmljX3NldHVwKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHVuc2lnbmVkIGludCBwcmVmZXJyZWRfYnBwKTsKICNlbHNlCiBzdGF0aWMgaW5saW5lIHZv
aWQgZHJtX2ZiX2hlbHBlcl9wcmVwYXJlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCkBAIC00NTMs
MTMgKzQ1MSw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkcm1fZmJfaGVscGVyX291dHB1dF9wb2xs
X2NoYW5nZWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIHsKIH0KIAotc3RhdGljIGlubGluZSBp
bnQKLWRybV9mYl9oZWxwZXJfZ2VuZXJpY19wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJf
aGVscGVyLAotCQkJICAgIHN0cnVjdCBkcm1fZmJfaGVscGVyX3N1cmZhY2Vfc2l6ZSAqc2l6ZXMp
Ci17Ci0JcmV0dXJuIDA7Ci19Ci0KIHN0YXRpYyBpbmxpbmUgaW50CiBkcm1fZmJkZXZfZ2VuZXJp
Y19zZXR1cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcHJlZmVycmVkX2Jw
cCkKIHsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
