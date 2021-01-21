Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202372FEEB4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 16:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0A56E906;
	Thu, 21 Jan 2021 15:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9C16E902
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:30:10 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q7so2129256wre.13
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gwp+mti/6unhnftOwEo6BpxjLR5MA6bqIJ8IUPn3cOs=;
 b=kMtnYpXoQilXJI5sJqSPob2bWQ55p5+duu6yonvEpHwrxCiLYrkz9LoR6T4Y1baDPd
 FGJf2OlyKMX3Z7fL7ZJe2b1Lapkr2531bNnpViLJ08xVV0OHJYCKwI2R9nwqEwb1t3BP
 RqQufrhio3x2IOAlgGI4AkmTTAcJHol406C4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gwp+mti/6unhnftOwEo6BpxjLR5MA6bqIJ8IUPn3cOs=;
 b=bAe+ehdvRKxw3Doc8gYNmQo7jk9XHp+0BGUldFuF4Yj4gCwsNe+nwNh3yyBtLv30sO
 fr+o2GGt5QE9u8oDztEdy9i/aDsWafwOk4keGhbgNUyVmJjU+JBZkM8VdvLzirAbuRFQ
 Ghf3zeVjIjBIt/oOBCKGrj+qtMBG0lX9xIuWxVobf76nRyM6fRygguLRoSYjDdtZb1Vz
 kzQHpVy4D9KD1wTOJpmg1LXcDVofxtAoCOJdU+Aes6NwSFwIIRySsjspStdOmA7ldwPy
 +PR7JzCQwLs7/c0R1eczoWJYRcFU9HvAXG2uAIo2vwYjNRaD3KiVhoBo0swO8sQg6iCu
 fDBg==
X-Gm-Message-State: AOAM5320Rpi8PMcATQb33ZJvT148Pyf2d8UxcT6wAABQCXoUGK2If5DH
 zcIbB+qsOaCsjw+keXAGcm70qwuO76wqi6eU
X-Google-Smtp-Source: ABdhPJy6GorVysk+oFoqONV7oZt+wQ1tAaWUjwMiKJzGDE0nLgBRPSvxY4+1neq9zorcHYOHV6OOMA==
X-Received: by 2002:a5d:440a:: with SMTP id z10mr8270wrq.266.1611243008784;
 Thu, 21 Jan 2021 07:30:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm8269866wre.69.2021.01.21.07.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:30:08 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/11] drm/vblank: Annotate with dma-fence signalling section
Date: Thu, 21 Jan 2021 16:29:51 +0100
Message-Id: <20210121152959.1725404-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyByYXRoZXIgb3ZlcmtpbGwgc2luY2UgY3VycmVudGx5IGFsbCBkcml2ZXJzIGNhbGwg
dGhpcyBmcm9tCmhhcmRpcnEgKG9yIGF0IGxlYXN0IHRpbWVycykuIEJ1dCBtYXliZSBpbiB0aGUg
ZnV0dXJlIHdlJ3JlIGdvaW5nIHRvCmhhdmUgdGhyZWFkIGlycSBoYW5kbGVycyBhbmQgd2hhdCBu
b3QsIGRvZXNuJ3QgaHVydCB0byBiZSBwcmVwYXJlZC4KUGx1cyB0aGlzIGlzIGFuIGVhc3kgc3Rh
cnQgZm9yIHNwcmlua2xpbmcgdGhlc2UgZmVuY2UgYW5ub3RhdGlvbnMgaW50bwpzaGFyZWQgY29k
ZS4KCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlz
dHMubGluYXJvLm9yZwpDYzogbGludXgtcmRtYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IE1hYXJ0ZW4g
TGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fdmJsYW5rLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92Ymxhbmsu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKaW5kZXggMzA5MTJkOGY4MmE1Li5mMmFl
YjliZjMyNWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwpAQCAtMjQsNiArMjQsNyBAQAogICogT1RIRVIg
REVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9kbWEtZmVu
Y2UuaD4KICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KICNpbmNsdWRlIDxsaW51eC9rdGhyZWFk
Lmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlcGFyYW0uaD4KQEAgLTE5MjIsNyArMTkyMyw3IEBA
IGJvb2wgZHJtX2hhbmRsZV92Ymxhbmsoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQg
aW50IHBpcGUpCiB7CiAJc3RydWN0IGRybV92YmxhbmtfY3J0YyAqdmJsYW5rID0gJmRldi0+dmJs
YW5rW3BpcGVdOwogCXVuc2lnbmVkIGxvbmcgaXJxZmxhZ3M7Ci0JYm9vbCBkaXNhYmxlX2lycTsK
Kwlib29sIGRpc2FibGVfaXJxLCBmZW5jZV9jb29raWU7CiAKIAlpZiAoZHJtX1dBUk5fT05fT05D
RShkZXYsICFkcm1fZGV2X2hhc192YmxhbmsoZGV2KSkpCiAJCXJldHVybiBmYWxzZTsKQEAgLTE5
MzAsNiArMTkzMSw4IEBAIGJvb2wgZHJtX2hhbmRsZV92Ymxhbmsoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgdW5zaWduZWQgaW50IHBpcGUpCiAJaWYgKGRybV9XQVJOX09OKGRldiwgcGlwZSA+PSBk
ZXYtPm51bV9jcnRjcykpCiAJCXJldHVybiBmYWxzZTsKIAorCWZlbmNlX2Nvb2tpZSA9IGRtYV9m
ZW5jZV9iZWdpbl9zaWduYWxsaW5nKCk7CisKIAlzcGluX2xvY2tfaXJxc2F2ZSgmZGV2LT5ldmVu
dF9sb2NrLCBpcnFmbGFncyk7CiAKIAkvKiBOZWVkIHRpbWVzdGFtcCBsb2NrIHRvIHByZXZlbnQg
Y29uY3VycmVudCBleGVjdXRpb24gd2l0aApAQCAtMTk0Miw2ICsxOTQ1LDcgQEAgYm9vbCBkcm1f
aGFuZGxlX3ZibGFuayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlwZSkK
IAlpZiAoIXZibGFuay0+ZW5hYmxlZCkgewogCQlzcGluX3VubG9jaygmZGV2LT52YmxhbmtfdGlt
ZV9sb2NrKTsKIAkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGV2LT5ldmVudF9sb2NrLCBpcnFm
bGFncyk7CisJCWRtYV9mZW5jZV9lbmRfc2lnbmFsbGluZyhmZW5jZV9jb29raWUpOwogCQlyZXR1
cm4gZmFsc2U7CiAJfQogCkBAIC0xOTY4LDYgKzE5NzIsOCBAQCBib29sIGRybV9oYW5kbGVfdmJs
YW5rKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQogCWlmIChkaXNh
YmxlX2lycSkKIAkJdmJsYW5rX2Rpc2FibGVfZm4oJnZibGFuay0+ZGlzYWJsZV90aW1lcik7CiAK
KwlkbWFfZmVuY2VfZW5kX3NpZ25hbGxpbmcoZmVuY2VfY29va2llKTsKKwogCXJldHVybiB0cnVl
OwogfQogRVhQT1JUX1NZTUJPTChkcm1faGFuZGxlX3ZibGFuayk7Ci0tIAoyLjMwLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
