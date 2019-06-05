Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC38A35E97
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB6189AC2;
	Wed,  5 Jun 2019 14:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B3389ABA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 14:03:55 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a21so8034346ljh.7
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 07:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RlkJnpaqJj7e9bGueVPVoLBm3Nq0+tt/+qz4OLNB6ko=;
 b=cI2ME3AI90xXeNWJo3DlgTKFHQzxpanltpa2KETKfNZz4PaS3BXTzMxY+DlgjDkkGW
 /oWS0qw+W8COu0FPHVENC1wT7YlF/Xx5C9ozaClkP/8ucMRg0KRUBprBAvpS/ZorDOgh
 bPTfsOmSA39UuyFpyjZHEoKt07GmKV7/crBDdS/eXdbXlKAgJhwncZO8WvHRHUNNHQsY
 qVYpLOgqp5tsOFk3PXmnyWP6aCaGEIA2xGPhtsovlvQ3hjXpHn5EXykkLweAcUaa/Ic7
 P8Pcst0ydnVzMl0M2FpFVmWs3v8FwvnhUpy2DbiPfW4sWYtFMtu8CmxZ7Ppm7lGaPJEk
 JdlA==
X-Gm-Message-State: APjAAAU1g4Pk36rHoq4sDEz9pB55N4IdntVFxcgglGQyQ5z1honN8eMG
 3quxyYP+dxJ9qWz65OQb1b8jka74cd4=
X-Google-Smtp-Source: APXvYqxT3tmOZNDbAbekafSGa7cv2EOl6gCe5bTHfjHe8LDoQvjPsl8KFq/uB2uXGMVFmo7/7sWDIw==
X-Received: by 2002:a2e:8516:: with SMTP id j22mr21693582lji.119.1559743434014; 
 Wed, 05 Jun 2019 07:03:54 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 v2sm4217658lfi.52.2019.06.05.07.03.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 07:03:53 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/2] drm/savage: drop use of drmP.h
Date: Wed,  5 Jun 2019 16:03:14 +0200
Message-Id: <20190605140313.13629-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190605140313.13629-1-sam@ravnborg.org>
References: <20190605140313.13629-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RlkJnpaqJj7e9bGueVPVoLBm3Nq0+tt/+qz4OLNB6ko=;
 b=PKcr+/iDdi+hh82P1kM0hSowT0S9g+CYMCrIKYdQkSionWtF9ZP1vzgVfWa8FbeV7d
 L8g+qwd/FQ4PaTEwFQfHOu9VZiaQDrvC8+1QJi/2e8Ebt/iKkQm6gBhpF6AQvmaln8fk
 gwTpvU/UgTb4VuucFR53H8/xLgxY25KJEQvTJlb8/lAjUVS8CCUGc7m2EKxf8sVzSmVN
 udYRWY1KT88GwUbuLvTV30F68Ium0O/zzDtV6ex2rGQloEteVsa1B5tbXY7AB7906ykE
 BuCgGyBxV2x/bfLLZqVthIgFnhsFnE3sp+qoQ45atKaLJLBoMZccfzFmUHYccAocJMx4
 NgGg==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgpSZXBsYWNlIGl0
IHdpdGggdGhlIG5lY2Vzc2FyeSBpbmNsdWRlcyBvZiBvdGhlciBoZWFkZXJzLgoKU2lnbmVkLW9m
Zi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdlX2JjaS5jICAgfCA4ICsrKysrKystCiBkcml2
ZXJzL2dwdS9kcm0vc2F2YWdlL3NhdmFnZV9kcnYuYyAgIHwgOSArKysrKy0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9zYXZhZ2Uvc2F2YWdlX2Rydi5oICAgfCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9z
YXZhZ2Uvc2F2YWdlX3N0YXRlLmMgfCA5ICsrKysrKysrLQogNCBmaWxlcyBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9zYXZhZ2Uvc2F2YWdlX2JjaS5jIGIvZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZhZ2VfYmNp
LmMKaW5kZXggYWEwMGNmMTE3NDMzLi42ODg5ZDY1MzRlYmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9zYXZhZ2Uvc2F2YWdlX2JjaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uv
c2F2YWdlX2JjaS5jCkBAIC0yNCw5ICsyNCwxNSBAQAogICovCiAKICNpbmNsdWRlIDxsaW51eC9k
ZWxheS5oPgorI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4K
KyNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+CiAKLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgorI2lu
Y2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9maWxlLmg+CisjaW5j
bHVkZSA8ZHJtL2RybV9wcmludC5oPgogI2luY2x1ZGUgPGRybS9zYXZhZ2VfZHJtLmg+CisKICNp
bmNsdWRlICJzYXZhZ2VfZHJ2LmgiCiAKIC8qIE5lZWQgYSBsb25nIHRpbWVvdXQgZm9yIHNoYWRv
dyBzdGF0dXMgdXBkYXRlcyBjYW4gdGFrZSBhIHdoaWxlCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vc2F2YWdlL3NhdmFnZV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdl
X2Rydi5jCmluZGV4IDJiZGRlYjhiZjQ1Ny4uMjk2NmZjZmQ5NTQ4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vc2F2YWdlL3NhdmFnZV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc2F2
YWdlL3NhdmFnZV9kcnYuYwpAQCAtMjUsMTIgKzI1LDEzIEBACiAKICNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Ci0jaW5jbHVkZSA8ZHJtL3NhdmFnZV9k
cm0uaD4KLSNpbmNsdWRlICJzYXZhZ2VfZHJ2LmgiCi0KKyNpbmNsdWRlIDxkcm0vZHJtX2Rydi5o
PgorI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgorI2luY2x1ZGUgPGRybS9kcm1fcGNpLmg+CiAj
aW5jbHVkZSA8ZHJtL2RybV9wY2lpZHMuaD4KIAorI2luY2x1ZGUgInNhdmFnZV9kcnYuaCIKKwog
c3RhdGljIHN0cnVjdCBwY2lfZGV2aWNlX2lkIHBjaWlkbGlzdFtdID0gewogCXNhdmFnZV9QQ0lf
SURTCiB9OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZhZ2VfZHJ2Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vc2F2YWdlL3NhdmFnZV9kcnYuaAppbmRleCAzOGFhYjYyNWYxMmUu
LmIwMDgxYmI2NDc3NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZhZ2Vf
ZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZhZ2VfZHJ2LmgKQEAgLTI2LDcg
KzI2LDExIEBACiAjaWZuZGVmIF9fU0FWQUdFX0RSVl9IX18KICNkZWZpbmUgX19TQVZBR0VfRFJW
X0hfXwogCisjaW5jbHVkZSA8bGludXgvaW8uaD4KKworI2luY2x1ZGUgPGRybS9kcm1faW9jdGwu
aD4KICNpbmNsdWRlIDxkcm0vZHJtX2xlZ2FjeS5oPgorI2luY2x1ZGUgPGRybS9zYXZhZ2VfZHJt
Lmg+CiAKICNkZWZpbmUgRFJJVkVSX0FVVEhPUgkiRmVsaXggS3VlaGxpbmciCiAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdlX3N0YXRlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vc2F2YWdlL3NhdmFnZV9zdGF0ZS5jCmluZGV4IGViYjhiN2QzMmIzMy4uYTJhYzI1YzExYzkw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2F2YWdlL3NhdmFnZV9zdGF0ZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdlX3N0YXRlLmMKQEAgLTIyLDggKzIyLDE1IEBA
CiAgKiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9S
IElOIENPTk5FQ1RJT04KICAqIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIg
REVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgogICovCi0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KKwor
I2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKyNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+CisKKyNp
bmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgorI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgorI2lu
Y2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KICNpbmNsdWRlIDxkcm0vc2F2YWdlX2RybS5oPgorCiAj
aW5jbHVkZSAic2F2YWdlX2Rydi5oIgogCiB2b2lkIHNhdmFnZV9lbWl0X2NsaXBfcmVjdF9zM2Qo
ZHJtX3NhdmFnZV9wcml2YXRlX3QgKiBkZXZfcHJpdiwKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
