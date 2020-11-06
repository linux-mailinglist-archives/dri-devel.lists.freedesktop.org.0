Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C63F2A9F65
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460246EB28;
	Fri,  6 Nov 2020 21:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC476EB26
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:50:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 23so1771628wmg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E44zAySPmawq+qLbsH9q5xt7WGcYQXLEVwBfYO570wQ=;
 b=cVJbpGO0mn9PFOK6wV3RI1ztFhosLDnGLAYO4ev3T9QpIRZ2SSqsEx8FWEUkN+upm/
 HS8YHS57ONCD2IVwBKqTIIoyLLrbNFPelDe5IxCJ8PGsFiXgXqe7cLhkoTUrAoHixgZo
 KDP2patea7yG8pSvObvQ56FR4KjPr651sE8b30YFsZQO1CI2rUBjP+Jg9kQsXCsrIiYl
 kvdHKnkUFuKAF51usqRPb3FB+WAkJ3NKop0XNHNG/HonC/IukIGGjt2gWOzW3Yk3+aB6
 L0qwyZria23XEQBZ4ZV4Z9dI8tXdlsT47zwq42PF50XnSulcKL9WAjNKbSUvqekGHt4W
 z3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E44zAySPmawq+qLbsH9q5xt7WGcYQXLEVwBfYO570wQ=;
 b=KN0FW05AbOlpfLoERBS7fkcI1Iwl5x3PV1wfDH+E06mIebyg/NSMIMRVVsqAcVr9Qd
 WGkFbFW+bNoWgnv4pmI67FlK39FgwDPTZhLFqWZ5hwj7Gjm00o2UC0TlVVYywpuC9N9d
 prFE96VuPaTCe6FJJ45TqkRVrjcLSWV6qLHUe6bXJWhRi8OI+YXAd794wp8kQcVLSq0n
 2hhPz4hHPW0wI1OFLwAHjbuGWBcLphq34WWl9tCTFZEki8ANpRMfny/Dyt2kRSoHykiH
 5j40Yn4h6nStjpPGOBbH5VslvrrlkNLU88Cwhwvqeq/Yueu2sGLOukqvXycHDTi40FDg
 wd0A==
X-Gm-Message-State: AOAM532wtnZqfLCgwI+CZCqMJ6gnENPPnQ2NrNt8d7V36v65Rno96gGv
 8ESaimnQNs18QzfEe72XQ3LNow==
X-Google-Smtp-Source: ABdhPJxfRN1i2cfpOCiFfFc/Pvr9V9HGsIKuzuadSde/yfja7cXq3h8iYKz20Us7PK8EV5XXi1JVGA==
X-Received: by 2002:a1c:ba0b:: with SMTP id k11mr1557572wmf.37.1604699401085; 
 Fri, 06 Nov 2020 13:50:01 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:50:00 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/19] drm/radeon/atom: Move prototype into shared location
Date: Fri,  6 Nov 2020 21:49:36 +0000
Message-Id: <20201106214949.2042120-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
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

Qm90aCBzb3VyY2UgZmlsZXMgaW5jbHVkZSBhdG9tLmgsIHdoaWNoIHNlZW1zIGxpa2UgYSByZWFz
b25hYmxlCmxvY2F0aW9uIHRvIHBsYWNlIGFuIGF0b20gYmFzZWQgZnVuY3Rpb24gaW50by4KCkZp
eGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgoKIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmM6MTc5MTo2OiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmHJhZGVvbl9hdG9tX2dldF90dl90aW1pbmdz4oCZIFstV21p
c3NpbmctcHJvdG90eXBlc10KIDE3OTEgfCBib29sIHJhZGVvbl9hdG9tX2dldF90dl90aW1pbmdz
KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBpbnQgaW5kZXgsCiB8IF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+CgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbS5oICAgICAgICAg
ICAgICB8IDYgKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b21iaW9zX2VuY29kZXJz
LmMgfCA0IC0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbS5oIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9hdG9tLmgKaW5kZXggMWJmMDZjOTFjZDk1OS4uY2I5M2I4MzExNGRi
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tLmgKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9hdG9tLmgKQEAgLTE1NCw2ICsxNTQsMTIgQEAgYm9vbCBhdG9tX3Bh
cnNlX2RhdGFfaGVhZGVyKHN0cnVjdCBhdG9tX2NvbnRleHQgKmN0eCwgaW50IGluZGV4LCB1aW50
MTZfdCAqc2l6ZSwKIGJvb2wgYXRvbV9wYXJzZV9jbWRfaGVhZGVyKHN0cnVjdCBhdG9tX2NvbnRl
eHQgKmN0eCwgaW50IGluZGV4LAogCQkJICAgdWludDhfdCAqZnJldiwgdWludDhfdCAqY3Jldik7
CiBpbnQgYXRvbV9hbGxvY2F0ZV9mYl9zY3JhdGNoKHN0cnVjdCBhdG9tX2NvbnRleHQgKmN0eCk7
CisKK3N0cnVjdCBkcm1fZGlzcGxheV9tb2RlOworc3RydWN0IHJhZGVvbl9kZXZpY2U7Citib29s
IHJhZGVvbl9hdG9tX2dldF90dl90aW1pbmdzKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBp
bnQgaW5kZXgsCisJCQkJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOworCiAjaW5jbHVk
ZSAiYXRvbS10eXBlcy5oIgogI2luY2x1ZGUgImF0b21iaW9zLmgiCiAjaW5jbHVkZSAiT2JqZWN0
SUQuaCIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbWJpb3NfZW5jb2Rl
cnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbWJpb3NfZW5jb2RlcnMuYwppbmRleCBj
YzVlZTFiM2FmODRmLi44NWY5MDNjYWYxMmUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL2F0b21iaW9zX2VuY29kZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9h
dG9tYmlvc19lbmNvZGVycy5jCkBAIC0yOTYsMTAgKzI5Niw2IEBAIHN0YXRpYyB2b2lkIHJhZGVv
bl9hdG9tX2JhY2tsaWdodF9leGl0KHN0cnVjdCByYWRlb25fZW5jb2RlciAqZW5jb2RlcikKIAog
I2VuZGlmCiAKLS8qIGV2aWwgYnV0IGluY2x1ZGluZyBhdG9tYmlvcy5oIGlzIG11Y2ggd29yc2Ug
Ki8KLWJvb2wgcmFkZW9uX2F0b21fZ2V0X3R2X3RpbWluZ3Moc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYsIGludCBpbmRleCwKLQkJCQlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7Ci0K
IHN0YXRpYyBib29sIHJhZGVvbl9hdG9tX21vZGVfZml4dXAoc3RydWN0IGRybV9lbmNvZGVyICpl
bmNvZGVyLAogCQkJCSAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLAogCQkJ
CSAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICphZGp1c3RlZF9tb2RlKQotLSAKMi4yNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
