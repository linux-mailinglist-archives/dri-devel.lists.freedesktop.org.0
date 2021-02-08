Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 218DD313356
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 14:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCAB6E8D2;
	Mon,  8 Feb 2021 13:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E7D6E8CE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 13:32:32 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z22so18013570edb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 05:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hIqmVYEgB0Hsh11EU3kuGQ9q1Now+a7ja68yvrtmd48=;
 b=DXMMBxDs3DZ1idXlEhwPZVuIMrvalGzAofYkpfpnChNTia+A0SGGclugMuSHpt3Sq5
 ds7Y7NPFyB1HtYw17c68EzX5V2eR4WRoZX9CctUgCHIy+r17k78fDq5cyyr8ABeiyaML
 oR2B5RlqX5FR0vPNFBiSOfLCQ77OQInnImutEN8afYSJ9LeNHffeER8HL3Oix+I0ddlG
 n723+1scPvQrRvg6nWc8F2ktUE9fdNiGVjuDqp+w4+LtaHjam1+5je5+crPfdufWAwL/
 QDjQt203hRNcCWMoV3JhHzaLEtWw+b+eE5WBuJgGxbA3MHsBsr0oOQ34hBtdWTqzskeB
 gN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hIqmVYEgB0Hsh11EU3kuGQ9q1Now+a7ja68yvrtmd48=;
 b=baxkmbJwz62pN5JsYS2g4aCuvCtEgGkYj27drYIWU7WtL9vFdeZujf56hasUEYRBIl
 Hof/Sq2KtTwce08wvG6fLYXSTeWhYjJuLCrzI4O00QjNtfiBsS3euH+Wkfz3bwIqeor+
 fCAtjiG7BvPpTkO+sLUcLJ1cBfupjDC7YQFTQngqJxAo2a5+1ljXAip12mmn5/cldpFL
 l0N4pzIfrBgQpb9dM6/GUv9ryf/im8HsZX8c/vSqdfRC5u3K2rDtJvxluQ/vTXWLnyEN
 dJE3B2hCgla3WC/4qN224ti6Jb7YCNzh1gS3FFq1sh40tu84QnyrkNHORVA6zAFpMqiq
 A0/w==
X-Gm-Message-State: AOAM533XEypBar/3ka1FrZCFChuusXibI0dq82pX8gVr3e3ECR0JSJ5s
 CD+TGHNCdd1mWxfFOHFgc7ieyx73ssQ=
X-Google-Smtp-Source: ABdhPJyPz4qloFXH96rnuLI2pWxaTwxGf6mvEoecmNvBHfucYeSb7sazdbvbDEjXezgQjZrRRABcHQ==
X-Received: by 2002:a50:ec06:: with SMTP id g6mr17195544edr.12.1612791151186; 
 Mon, 08 Feb 2021 05:32:31 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:bf9b:351a:7897:6249])
 by smtp.gmail.com with ESMTPSA id bm9sm8677807ejb.14.2021.02.08.05.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:32:30 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/ttm: drop sysfs directory
Date: Mon,  8 Feb 2021 14:32:26 +0100
Message-Id: <20210208133226.36955-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208133226.36955-1-christian.koenig@amd.com>
References: <20210208133226.36955-1-christian.koenig@amd.com>
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
Cc: linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IHVzZWQgYW55IG1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21vZHVsZS5jIHwg
NTAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX21vZHVsZS5oIHwgIDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgNTIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbW9kdWxlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9tb2R1bGUuYwppbmRleCBmNjU2NjYwM2E2MGYuLjU2YjBlZmRiYTFhOSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbW9kdWxlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fbW9kdWxlLmMKQEAgLTM3LDY2ICszNywxNiBAQAogCiAjaW5jbHVk
ZSAidHRtX21vZHVsZS5oIgogCi1zdGF0aWMgREVDTEFSRV9XQUlUX1FVRVVFX0hFQUQoZXhpdF9x
KTsKLXN0YXRpYyBhdG9taWNfdCBkZXZpY2VfcmVsZWFzZWQ7CiBzdHJ1Y3QgZGVudHJ5ICp0dG1f
ZGVidWdmc19yb290OwogCi1zdGF0aWMgc3RydWN0IGRldmljZV90eXBlIHR0bV9kcm1fY2xhc3Nf
dHlwZSA9IHsKLQkubmFtZSA9ICJ0dG0iLAotCS8qKgotCSAqIEFkZCBwbSBvcHMgaGVyZS4KLQkg
Ki8KLX07Ci0KLXN0YXRpYyB2b2lkIHR0bV9kcm1fY2xhc3NfZGV2aWNlX3JlbGVhc2Uoc3RydWN0
IGRldmljZSAqZGV2KQotewotCWF0b21pY19zZXQoJmRldmljZV9yZWxlYXNlZCwgMSk7Ci0Jd2Fr
ZV91cF9hbGwoJmV4aXRfcSk7Ci19Ci0KLXN0YXRpYyBzdHJ1Y3QgZGV2aWNlIHR0bV9kcm1fY2xh
c3NfZGV2aWNlID0gewotCS50eXBlID0gJnR0bV9kcm1fY2xhc3NfdHlwZSwKLQkucmVsZWFzZSA9
ICZ0dG1fZHJtX2NsYXNzX2RldmljZV9yZWxlYXNlCi19OwotCi1zdHJ1Y3Qga29iamVjdCAqdHRt
X2dldF9rb2JqKHZvaWQpCi17Ci0Jc3RydWN0IGtvYmplY3QgKmtvYmogPSAmdHRtX2RybV9jbGFz
c19kZXZpY2Uua29iajsKLQlCVUdfT04oa29iaiA9PSBOVUxMKTsKLQlyZXR1cm4ga29iajsKLX0K
LQogc3RhdGljIGludCBfX2luaXQgdHRtX2luaXQodm9pZCkKIHsKLQlpbnQgcmV0OwotCi0JcmV0
ID0gZGV2X3NldF9uYW1lKCZ0dG1fZHJtX2NsYXNzX2RldmljZSwgInR0bSIpOwotCWlmICh1bmxp
a2VseShyZXQgIT0gMCkpCi0JCXJldHVybiByZXQ7Ci0KLQlhdG9taWNfc2V0KCZkZXZpY2VfcmVs
ZWFzZWQsIDApOwotCXJldCA9IGRybV9jbGFzc19kZXZpY2VfcmVnaXN0ZXIoJnR0bV9kcm1fY2xh
c3NfZGV2aWNlKTsKLQlpZiAodW5saWtlbHkocmV0ICE9IDApKQotCQlnb3RvIG91dF9ub19kZXZf
cmVnOwotCiAJdHRtX2RlYnVnZnNfcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2RpcigidHRtIiwgTlVM
TCk7CiAJcmV0dXJuIDA7Ci1vdXRfbm9fZGV2X3JlZzoKLQlhdG9taWNfc2V0KCZkZXZpY2VfcmVs
ZWFzZWQsIDEpOwotCXdha2VfdXBfYWxsKCZleGl0X3EpOwotCXJldHVybiByZXQ7CiB9CiAKIHN0
YXRpYyB2b2lkIF9fZXhpdCB0dG1fZXhpdCh2b2lkKQogewotCWRybV9jbGFzc19kZXZpY2VfdW5y
ZWdpc3RlcigmdHRtX2RybV9jbGFzc19kZXZpY2UpOwotCi0JLyoqCi0JICogUmVmdXNlIHRvIHVu
bG9hZCB1bnRpbCB0aGUgVFRNIGRldmljZSBpcyByZWxlYXNlZC4KLQkgKiBOb3Qgc3VyZSB0aGlz
IGlzIDEwMCUgbmVlZGVkLgotCSAqLwotCi0Jd2FpdF9ldmVudChleGl0X3EsIGF0b21pY19yZWFk
KCZkZXZpY2VfcmVsZWFzZWQpID09IDEpOwogCWRlYnVnZnNfcmVtb3ZlKHR0bV9kZWJ1Z2ZzX3Jv
b3QpOwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuaCBi
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21vZHVsZS5oCmluZGV4IDJmMDNjMmZjZjU3MC4uZDdj
YWM1ZDRiODM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuaApAQCAtMzMsMTAgKzMzLDggQEAK
IAogI2RlZmluZSBUVE1fUEZYICJbVFRNXSAiCiAKLXN0cnVjdCBrb2JqZWN0Owogc3RydWN0IGRl
bnRyeTsKIAotZXh0ZXJuIHN0cnVjdCBrb2JqZWN0ICp0dG1fZ2V0X2tvYmoodm9pZCk7CiBleHRl
cm4gc3RydWN0IGRlbnRyeSAqdHRtX2RlYnVnZnNfcm9vdDsKIAogI2VuZGlmIC8qIF9UVE1fTU9E
VUxFX0hfICovCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
