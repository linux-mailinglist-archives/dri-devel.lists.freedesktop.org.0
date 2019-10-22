Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59BBE0920
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 18:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38276E88B;
	Tue, 22 Oct 2019 16:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EEF6E88B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 16:37:25 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n15so8026390wrw.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 09:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MnD0eVGqgcVZzhVjkazJpc/PGpCcIYR+vhJEEqF0E2I=;
 b=K7ngWDMNfgENA+PjIGXs3BIEbePnYPT0t9WShs8/z3nuCTYbmjiV0V9BQGqOqyZdOU
 5GHziQluBRumos68xHXIzzafqZINmLcZqcG3sYCO8DhQrGPVys4Ts4USF5hPNFE3e7E8
 Z989TUrxAOiuSrrqWZLEgJQgbvpRCm73GNfxytO7k2PPKxZeIEjLAElVsEXok4GlmvPL
 aEd22NBT0ZPulcCErzUqIH5tlQye0B9KIhTNCEJpwHyZDX3ucez5XD+qkJUcUkL5UYxZ
 gfaLHpAIBk8jRyxivkkePC2zfcMrOb2sTStgJxHFutLfhH6NfTvzvwr/l1uSOF5mBlBT
 o2gA==
X-Gm-Message-State: APjAAAUipKk+nEzyXhHriymcdSYeQ4HNDbJUnrv4rcs4+rseoeBNWPWy
 jmKjkebITBmxd37mNOQE5PqLThVB73g=
X-Google-Smtp-Source: APXvYqx0uAwYlN1RJbX+HoNDA37zePaQqSBGxNiVNqPjmEywW6Bv25E7ngyLetkwmTo6bj2BkKutQw==
X-Received: by 2002:adf:c402:: with SMTP id v2mr4596366wrf.323.1571762243560; 
 Tue, 22 Oct 2019 09:37:23 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id l14sm3268104wrr.37.2019.10.22.09.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 09:37:22 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc: Drop misleading comment on drm_mode_config_cleanup
Date: Tue, 22 Oct 2019 18:37:17 +0200
Message-Id: <20191022163717.1064-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MnD0eVGqgcVZzhVjkazJpc/PGpCcIYR+vhJEEqF0E2I=;
 b=FFAuPUq/QvYTQjaJZrRJajh4OYrZZsy6z6L2tb2+QbOCMZ6atJ2SQkoa20jC6ygjse
 RwEQR7YeHoaA5576Bm3YFdbEH2YPvnnDjnk5t3IoFunbslmjJvf9k2LFRCW3PtzhdzUq
 GsG2FEj9yQgCoHzramT7Amdxy8HF6ykZxUPgw=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBub3Qgc29tZXRoaW5nIHdlJ2xsIGZpeCwgYmVjYXVzZSBmYWlsaW5nIHRvIGNsZWFu
IHVwIHN0dWZmIChvcgpkb2luZyBpdCBpbiB0aGUgd3Jvbmcgb3JkZXIpIGlzIGEgZHJpdmVyIGJ1
Zy4gVGhlIG9mZmVuZGluZyBGSVhNRSBnb2VzCmFsbCB0aGUgd2F5IGJhY2sgdG8gdGhlIG9yaWdp
bmFsIG1vZGVzZXQgbWVyZ2UuCgpXZSd2ZSBhZGRlZCBhIFdBUk5fT04gaW4KCmNvbW1pdCAyYjY3
N2U4YzA4ZWVkMTFlNGViZTY2YTdjMzM0ZjAzZTM4OWExOWEzCkF1dGhvcjogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KRGF0ZTogICBNb24gRGVjIDEwIDIxOjE2OjA1IDIw
MTIgKzAxMDAKCiAgICBkcm06IHJlZmVyZW5jZSBmcmFtZWJ1ZmZlcnMgd2hpY2ggYXJlIG9uIHRo
ZSBpZHIKCmluY2x1ZGluZyBhIGNvbW1lbnQgYmxhbWluZyBkcml2ZXJzIG9uIHRoaXMuIFJpZ2h0
IHRoaW5nIHRvIGRvIGlzIG1vc3QKbGlrZWx5IGRybV9hdG9taWNfaGVscGVyX3NodXRkb3duIHBs
dXMgbWFraW5nIHN1cmUgdGhhdApkcm1fbW9kZV9jb25maWdfY2xlYW51cCBpcyBub3QgY2FsbGVk
IHRvbyBlYXJseSAoaS5lLiBub3QgaW4gZHJpdmVyCnVubG9hZCwgYnV0IG9ubHkgaW4gdGhlIGZp
bmFsIGRybV9kZXZpY2UgcmVsZWFzZSBjYWxsYmFjaykuCgpDYzogTWloYWlsIEF0YW5hc3NvdiA8
TWloYWlsLkF0YW5hc3NvdkBhcm0uY29tPgpSZXBvcnRlZC1ieTogTWloYWlsIEF0YW5hc3NvdiA8
TWloYWlsLkF0YW5hc3NvdkBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29u
ZmlnLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29uZmlnLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X21vZGVfY29uZmlnLmMKaW5kZXggN2JjMDNjM2MxNTRmLi4zYjU3MGE0MDQ5MzMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX21vZGVfY29uZmlnLmMKQEAgLTQyOCw4ICs0MjgsNiBAQCBFWFBPUlRfU1lNQk9MKGRy
bV9tb2RlX2NvbmZpZ19pbml0KTsKICAqIE5vdGUgdGhhdCBzaW5jZSB0aGlzIC9zaG91bGQvIGhh
cHBlbiBzaW5nbGUtdGhyZWFkZWQgYXQgZHJpdmVyL2RldmljZQogICogdGVhcmRvd24gdGltZSwg
bm8gbG9ja2luZyBpcyByZXF1aXJlZC4gSXQncyB0aGUgZHJpdmVyJ3Mgam9iIHRvIGVuc3VyZSB0
aGF0CiAgKiB0aGlzIGd1YXJhbnRlZSBhY3R1YWxseSBob2xkcyB0cnVlLgotICoKLSAqIEZJWE1F
OiBjbGVhbnVwIGFueSBkYW5nbGluZyB1c2VyIGJ1ZmZlciBvYmplY3RzIHRvbwogICovCiB2b2lk
IGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB7Ci0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
