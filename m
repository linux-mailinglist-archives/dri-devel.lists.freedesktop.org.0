Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494B72178C9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 22:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C5C6E50D;
	Tue,  7 Jul 2020 20:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8F76E511
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 20:12:49 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 22so478243wmg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=McVPt9fJuC6YkxvBQy2jGA4bv0ebGunC4HyUvWhZjbk=;
 b=NYza4RHRT9Nbd5tiuaDvvt87+k7x8TzYBK9/QEGb9/Is2lgqJSOuJN6F8FSSMmLVNz
 AX9kEZIMyNmgI+JilF+jEH3k9RERK+pVA/s56lFytmeok7MwNFT8h3+RidSiuyF0GL3K
 QytzewPz12OhJLJsGQP0sEMa2ZvTYapQq+Oos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=McVPt9fJuC6YkxvBQy2jGA4bv0ebGunC4HyUvWhZjbk=;
 b=FVNm7wscQMEIthtG288zEsc5GHY4wVL0oqs+Tjdq9+ymNijxZbv7z2RsE3fatFBSRY
 9Bz8nJ0BelJ5e91QJd1nlGEZvERmDX+E++Xh1YoUK2xVqgnslwJe0iZ3rLRAcAAVbUHz
 xJ55gHrvhe9Sd579KMibZxZx+sp2cYC5NgLkCBB/dBD00qwr3ZcjzlgPjkpTQt8J8EvQ
 SMHBXj3VcT45y1qP7zmB676dJCBX3Vu8Z0GF1BwY9g6ah6LyTuaRPPkT3k7edwC+WhtJ
 KVkhRY56+GEIFiOIYpDNIMep2mJ2Xq+vGimiTQYmGJpxJ7KCDmLR6YZbSXssgxKdqaAI
 8wZg==
X-Gm-Message-State: AOAM532SCUe6mApxEyrurkjAtsQ1UhsmWZUTatakjHiwm87bpmS2K0e9
 YQ07IRKhBSl3pxZpJxsIhDpQVTRWmW0=
X-Google-Smtp-Source: ABdhPJxvv8IOS1X24OSEZRVe7u0HCChwY1utohnpU4U1V2xvfRe6hswS0LJw8ponIMP4FVWNOp1Snw==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr5788472wmi.87.1594152767816; 
 Tue, 07 Jul 2020 13:12:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 13:12:47 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/25] drm/vblank: Annotate with dma-fence signalling section
Date: Tue,  7 Jul 2020 22:12:09 +0200
Message-Id: <20200707201229.472834-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
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
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKaW5kZXggNDJhODRlYjRjYzhjLi5kNjgx
YWIwOTk2M2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwpAQCAtMjQsNiArMjQsNyBAQAogICogT1RIRVIg
REVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9kbWEtZmVu
Y2UuaD4KICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGVw
YXJhbS5oPgogCkBAIC0xOTA5LDcgKzE5MTAsNyBAQCBib29sIGRybV9oYW5kbGVfdmJsYW5rKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQogewogCXN0cnVjdCBkcm1f
dmJsYW5rX2NydGMgKnZibGFuayA9ICZkZXYtPnZibGFua1twaXBlXTsKIAl1bnNpZ25lZCBsb25n
IGlycWZsYWdzOwotCWJvb2wgZGlzYWJsZV9pcnE7CisJYm9vbCBkaXNhYmxlX2lycSwgZmVuY2Vf
Y29va2llOwogCiAJaWYgKGRybV9XQVJOX09OX09OQ0UoZGV2LCAhZHJtX2Rldl9oYXNfdmJsYW5r
KGRldikpKQogCQlyZXR1cm4gZmFsc2U7CkBAIC0xOTE3LDYgKzE5MTgsOCBAQCBib29sIGRybV9o
YW5kbGVfdmJsYW5rKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQog
CWlmIChkcm1fV0FSTl9PTihkZXYsIHBpcGUgPj0gZGV2LT5udW1fY3J0Y3MpKQogCQlyZXR1cm4g
ZmFsc2U7CiAKKwlmZW5jZV9jb29raWUgPSBkbWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZygpOwor
CiAJc3Bpbl9sb2NrX2lycXNhdmUoJmRldi0+ZXZlbnRfbG9jaywgaXJxZmxhZ3MpOwogCiAJLyog
TmVlZCB0aW1lc3RhbXAgbG9jayB0byBwcmV2ZW50IGNvbmN1cnJlbnQgZXhlY3V0aW9uIHdpdGgK
QEAgLTE5MjksNiArMTkzMiw3IEBAIGJvb2wgZHJtX2hhbmRsZV92Ymxhbmsoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGUpCiAJaWYgKCF2YmxhbmstPmVuYWJsZWQpIHsK
IAkJc3Bpbl91bmxvY2soJmRldi0+dmJsYW5rX3RpbWVfbG9jayk7CiAJCXNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJmRldi0+ZXZlbnRfbG9jaywgaXJxZmxhZ3MpOworCQlkbWFfZmVuY2VfZW5kX3Np
Z25hbGxpbmcoZmVuY2VfY29va2llKTsKIAkJcmV0dXJuIGZhbHNlOwogCX0KIApAQCAtMTk1NCw2
ICsxOTU4LDggQEAgYm9vbCBkcm1faGFuZGxlX3ZibGFuayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB1bnNpZ25lZCBpbnQgcGlwZSkKIAlpZiAoZGlzYWJsZV9pcnEpCiAJCXZibGFua19kaXNhYmxl
X2ZuKCZ2YmxhbmstPmRpc2FibGVfdGltZXIpOwogCisJZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5n
KGZlbmNlX2Nvb2tpZSk7CisKIAlyZXR1cm4gdHJ1ZTsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2hh
bmRsZV92YmxhbmspOwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
