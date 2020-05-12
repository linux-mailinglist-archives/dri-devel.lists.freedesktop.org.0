Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6511CEFF6
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F2D6E8A4;
	Tue, 12 May 2020 09:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B296E8B1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:00:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h17so5458879wrc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 02:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k3OodW5bIt6jtahEoyPvdqvd8L7bfSaZtDSgdgQ0KSE=;
 b=Tba/CBQcoFuTPwNcOK0uHe+q5z5Fq6i1EP5lEPO6yQnGb0xZi3OTwd+ZAJUMrRox80
 JQxMbr1Hy5zgQtio1imHYMaQf8uOuY/D0v6qpXbtodzS2aPiBGDFHO2m+fo/NUnJQtIa
 9QatpvOy7g08efja4D6G7OF9WYNAibebHkhiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k3OodW5bIt6jtahEoyPvdqvd8L7bfSaZtDSgdgQ0KSE=;
 b=RM4AsSz7I0+X8CZEAeXqvaIhKx8r8y/nK7E6lVCnnRhnMxOOVj9UL1wkDQWMtEmrgF
 7OXKUrqD3qd+R9myzhIRQ9jfORu0ylkD15SDihqu0XTJC0C6DEnrn9is+aEj3Owee+f/
 DZaJW09lhgUTpiovHRhxxygVHcNS0ziU/77y/m+uwROZ5fskWuhjus7Fxm3DX60r06uF
 d/6opYBtMkkmYt9sY2780NWq+b5h5ruIVMo0P5fEv0bo7n13PjgOu0WSSjl4e72W2zzz
 o6lHBA5dUdbz2jIRq7wNCdDhOIygGmGKrcuywy4Hwj8m2HQxCUTCRh7TrHm71I6hAtUU
 DNGw==
X-Gm-Message-State: AGi0PuYqviKV5E86rU6rQyS9C2oIgiLEXObv9nPuFF2t71czBbcroQaq
 b7shxOBhOCMIXZdf+kWKfVNxe3ICkyc=
X-Google-Smtp-Source: APiQypLIE0/1kWTahFNGDnQcsBGsaNy02ojJZXXlJ0KfLdzMgemSxmLWkBaf5jP2NOQfTl/RTuSVRw==
X-Received: by 2002:adf:ca0e:: with SMTP id o14mr25265512wrh.254.1589274001957; 
 Tue, 12 May 2020 02:00:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.02.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 02:00:01 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [RFC 05/17] drm/vblank: Annotate with dma-fence signalling section
Date: Tue, 12 May 2020 10:59:32 +0200
Message-Id: <20200512085944.222637-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
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
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
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
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKaW5kZXggNzU4YmY3NGUxY2FiLi4xMjVl
ZjBjMGY5YTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwpAQCAtMjQsNiArMjQsNyBAQAogICogT1RIRVIg
REVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9kbWEtZmVu
Y2UuaD4KICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGVw
YXJhbS5oPgogCkBAIC0xODk1LDcgKzE4OTYsNyBAQCBib29sIGRybV9oYW5kbGVfdmJsYW5rKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQogewogCXN0cnVjdCBkcm1f
dmJsYW5rX2NydGMgKnZibGFuayA9ICZkZXYtPnZibGFua1twaXBlXTsKIAl1bnNpZ25lZCBsb25n
IGlycWZsYWdzOwotCWJvb2wgZGlzYWJsZV9pcnE7CisJYm9vbCBkaXNhYmxlX2lycSwgZmVuY2Vf
Y29va2llOwogCiAJaWYgKFdBUk5fT05fT05DRSghZGV2LT5udW1fY3J0Y3MpKQogCQlyZXR1cm4g
ZmFsc2U7CkBAIC0xOTAzLDYgKzE5MDQsOCBAQCBib29sIGRybV9oYW5kbGVfdmJsYW5rKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQogCWlmIChXQVJOX09OKHBpcGUg
Pj0gZGV2LT5udW1fY3J0Y3MpKQogCQlyZXR1cm4gZmFsc2U7CiAKKwlmZW5jZV9jb29raWUgPSBk
bWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZygpOworCiAJc3Bpbl9sb2NrX2lycXNhdmUoJmRldi0+
ZXZlbnRfbG9jaywgaXJxZmxhZ3MpOwogCiAJLyogTmVlZCB0aW1lc3RhbXAgbG9jayB0byBwcmV2
ZW50IGNvbmN1cnJlbnQgZXhlY3V0aW9uIHdpdGgKQEAgLTE5MTUsNiArMTkxOCw3IEBAIGJvb2wg
ZHJtX2hhbmRsZV92Ymxhbmsoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBp
cGUpCiAJaWYgKCF2YmxhbmstPmVuYWJsZWQpIHsKIAkJc3Bpbl91bmxvY2soJmRldi0+dmJsYW5r
X3RpbWVfbG9jayk7CiAJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRldi0+ZXZlbnRfbG9jaywg
aXJxZmxhZ3MpOworCQlkbWFfZmVuY2VfZW5kX3NpZ25hbGxpbmcoZmVuY2VfY29va2llKTsKIAkJ
cmV0dXJuIGZhbHNlOwogCX0KIApAQCAtMTk0MCw2ICsxOTQ0LDggQEAgYm9vbCBkcm1faGFuZGxl
X3ZibGFuayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlwZSkKIAlpZiAo
ZGlzYWJsZV9pcnEpCiAJCXZibGFua19kaXNhYmxlX2ZuKCZ2YmxhbmstPmRpc2FibGVfdGltZXIp
OwogCisJZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKGZlbmNlX2Nvb2tpZSk7CisKIAlyZXR1cm4g
dHJ1ZTsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2hhbmRsZV92YmxhbmspOwotLSAKMi4yNi4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
