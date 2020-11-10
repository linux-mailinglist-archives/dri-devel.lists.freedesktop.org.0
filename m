Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601212ADF61
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C781489BE8;
	Tue, 10 Nov 2020 19:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1973389BE8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o15so6164846wru.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=niuclzZLrXXllUvyLIlNhRMSWO6LD3jFvv7VGpxMEl8=;
 b=ZoCAeWqOWnwlTA6KsKAUyspJhNqifj65RCAJ2Bbve89rw9W2XKZNT8qx9vnCUrG+70
 +CFU7uXuG2uDCdH4IBNlSUQYOHyma6KqozSOVJNzx7fLBiC495M1QHG0kXo7/De7OnpV
 ignD954xFpyTo1V0XphVRlSM9fXgFrtktfiGjgPGjjmbnm/3S9aSybfx0jc/kSFQhwP1
 M8jJ9JEPfjZZ8zvDkowuVkWPF6K0LaTkW3Dw+aOje1kLR+21+ODvaMmJT1B9jfNaVC4f
 gukHJ0YC7YiPPKt1NOhnmVXVnDaLevKvD6A1tTGEjelGUVGvJaZjHxf7qmgAI4Q66Thf
 wtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=niuclzZLrXXllUvyLIlNhRMSWO6LD3jFvv7VGpxMEl8=;
 b=C7+fBT1Jjhx2fzPGA4NhBS++HPIstatWylR03Lz0Ziwztig8u49NysJpPnQKSmIpTM
 ye1fHPGJ5xhE67kfJNFbARSRB8Rb0cAXAaT9/0ycak+PnZidLRnwbaWC+yLY+LsLOPxh
 sFueHml9koEOfExK7+e+5r1tiW+4SaEOPH6fexMNTiOhAYjWm6C56DKWOAgexEZSFbYW
 RWlNcujHM2mz5ES8KhZnB/FFVcg9jbYWU0bDWMlh9TlT5KIJVPhWNCccNBlnp12jgAX5
 AaWMlI6oM0lG/9X4HWis8WdfocgzMXY62BMs421yYa5/0UZffUM4uUSCB/TRUzfITJLj
 a3ZA==
X-Gm-Message-State: AOAM533YLNKCQ3TP5ft5aZcaGkBn9eH4EDNpGDd4DETXm2CDkMjOLAl3
 9WSkdRxgGicRSj3Lr/aaCSjbFQ==
X-Google-Smtp-Source: ABdhPJwqsmo6of+IMvyqiw805zCVdsMN3uBXSMYMN1Q/gswxeuYmzYoGVdvtxQld+Ssvh6NkkiAaFA==
X-Received: by 2002:a5d:670f:: with SMTP id o15mr8801086wru.204.1605036687702; 
 Tue, 10 Nov 2020 11:31:27 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:26 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/30] drm/radeon/radeon_vm: Fix some function parameter
 documentation
Date: Tue, 10 Nov 2020 19:30:51 +0000
Message-Id: <20201110193112.988999-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdm0uYzoxMzE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBtZW1iZXIgJ3JkZXYnIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl92bV9nZXRfYm9z
JwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdm0uYzo2NDM6IHdhcm5pbmc6IEV4Y2Vz
cyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ3N0YXJ0JyBkZXNjcmlwdGlvbiBpbiAncmFkZW9uX3ZtX3Vw
ZGF0ZV9wYWdlX2RpcmVjdG9yeScKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ZtLmM6
NjQzOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdlbmQnIGRlc2NyaXB0aW9u
IGluICdyYWRlb25fdm1fdXBkYXRlX3BhZ2VfZGlyZWN0b3J5JwogZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fdm0uYzo4MTk6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1i
ZXIgJ2liJyBub3QgZGVzY3JpYmVkIGluICdyYWRlb25fdm1fdXBkYXRlX3B0ZXMnCiBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl92bS5jOjkxNTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1l
dGVyIG9yIG1lbWJlciAnYm9fdmEnIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl92bV9ib191cGRh
dGUnCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl92bS5jOjkxNTogd2FybmluZzogRXhj
ZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAndm0nIGRlc2NyaXB0aW9uIGluICdyYWRlb25fdm1fYm9f
dXBkYXRlJwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdm0uYzo5MTU6IHdhcm5pbmc6
IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2JvJyBkZXNjcmlwdGlvbiBpbiAncmFkZW9uX3Zt
X2JvX3VwZGF0ZScKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ZtLmM6MTE1NTogd2Fy
bmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAndm0nIGRlc2NyaXB0aW9uIGluICdyYWRl
b25fdm1fYm9faW52YWxpZGF0ZScKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
dm0uYyB8IDggKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdm0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ZtLmMKaW5kZXggMjdiMTRlZmY1MzJj
Yi4uNzFmMmVkY2FjNmVhMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl92bS5jCkBAIC0xMTks
NiArMTE5LDcgQEAgdm9pZCByYWRlb25fdm1fbWFuYWdlcl9maW5pKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KQogLyoqCiAgKiByYWRlb25fdm1fZ2V0X2JvcyAtIGFkZCB0aGUgdm0gQk9zIHRv
IGEgdmFsaWRhdGlvbiBsaXN0CiAgKgorICogQHJkZXY6IHJhZGVvbl9kZXZpY2UgcG9pbnRlcgog
ICogQHZtOiB2bSBwcm92aWRpbmcgdGhlIEJPcwogICogQGhlYWQ6IGhlYWQgb2YgdmFsaWRhdGlv
biBsaXN0CiAgKgpAQCAtNjI5LDggKzYzMCw2IEBAIHN0YXRpYyB1aW50MzJfdCByYWRlb25fdm1f
cGFnZV9mbGFncyh1aW50MzJfdCBmbGFncykKICAqCiAgKiBAcmRldjogcmFkZW9uX2RldmljZSBw
b2ludGVyCiAgKiBAdm06IHJlcXVlc3RlZCB2bQotICogQHN0YXJ0OiBzdGFydCBvZiBHUFUgYWRk
cmVzcyByYW5nZQotICogQGVuZDogZW5kIG9mIEdQVSBhZGRyZXNzIHJhbmdlCiAgKgogICogQWxs
b2NhdGVzIG5ldyBwYWdlIHRhYmxlcyBpZiBuZWNlc3NhcnkKICAqIGFuZCB1cGRhdGVzIHRoZSBw
YWdlIGRpcmVjdG9yeSAoY2F5bWFuKykuCkBAIC04MDIsNiArODAxLDcgQEAgc3RhdGljIHZvaWQg
cmFkZW9uX3ZtX2ZyYWdfcHRlcyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKICAqCiAgKiBA
cmRldjogcmFkZW9uX2RldmljZSBwb2ludGVyCiAgKiBAdm06IHJlcXVlc3RlZCB2bQorICogQGli
OiBpbmRpcmVjdCBidWZmZXIgdG8gdXNlIGZvciB0aGUgdXBkYXRlCiAgKiBAc3RhcnQ6IHN0YXJ0
IG9mIEdQVSBhZGRyZXNzIHJhbmdlCiAgKiBAZW5kOiBlbmQgb2YgR1BVIGFkZHJlc3MgcmFuZ2UK
ICAqIEBkc3Q6IGRlc3RpbmF0aW9uIGFkZHJlc3MgdG8gbWFwIHRvCkBAIC05MDAsOCArOTAwLDcg
QEAgc3RhdGljIHZvaWQgcmFkZW9uX3ZtX2ZlbmNlX3B0cyhzdHJ1Y3QgcmFkZW9uX3ZtICp2bSwK
ICAqIHJhZGVvbl92bV9ib191cGRhdGUgLSBtYXAgYSBibyBpbnRvIHRoZSB2bSBwYWdlIHRhYmxl
CiAgKgogICogQHJkZXY6IHJhZGVvbl9kZXZpY2UgcG9pbnRlcgotICogQHZtOiByZXF1ZXN0ZWQg
dm0KLSAqIEBibzogcmFkZW9uIGJ1ZmZlciBvYmplY3QKKyAqIEBib192YTogcmFkZW9uIGJ1ZmZl
ciBvYmplY3QKICAqIEBtZW06IHR0bSBtZW0KICAqCiAgKiBGaWxsIGluIHRoZSBwYWdlIHRhYmxl
IGVudHJpZXMgZm9yIEBibyAoY2F5bWFuKykuCkBAIC0xMTQ1LDcgKzExNDQsNiBAQCB2b2lkIHJh
ZGVvbl92bV9ib19ybXYoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCiAgKiByYWRlb25fdm1f
Ym9faW52YWxpZGF0ZSAtIG1hcmsgdGhlIGJvIGFzIGludmFsaWQKICAqCiAgKiBAcmRldjogcmFk
ZW9uX2RldmljZSBwb2ludGVyCi0gKiBAdm06IHJlcXVlc3RlZCB2bQogICogQGJvOiByYWRlb24g
YnVmZmVyIG9iamVjdAogICoKICAqIE1hcmsgQGJvIGFzIGludmFsaWQgKGNheW1hbispLgotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
