Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815152AC6D6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8444F892FA;
	Mon,  9 Nov 2020 21:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B655A89272
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:19:29 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p22so942915wmg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 13:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hg/I8hWx//QmSj29JDx18mAH+iG9CJqB6Lurd4l5hM4=;
 b=AaQNQ9NIHkRGoTiIRF1aRbT+aRsVQOm3b9utKoz6DPEumCRmo8ulSQC4s6mp+erOM4
 LRXMWkhr0iRHwoQjDKD2CWxMIlFyviTFAewCFYg+m4eNcwLPgs7s7FaXFliAQ1D2LNYV
 KWWf497r8hxqorMREEcQnOEkHSmQ/oOI+acP+sT85BS6Jj9aCQSUZF/n4aBwaS0ouFNB
 dQfab8IsQ1wI4bP4VpeVJXWYH450W4LDxGaHXJSDMkuD5kIIVpdbF/lAMSFhiteMxQTs
 8AaotcYN+NonRvAYcA2ThRjOs5m937qryN9440lKxewZFO8wEihMG2b7zvWDLNIsgBAP
 VvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hg/I8hWx//QmSj29JDx18mAH+iG9CJqB6Lurd4l5hM4=;
 b=cLFe+u0dRGyfVLUuhVFlsewhHiJAU8DpS1KPPXdtnVPV8eA3amDrK8iERzdniZlIAF
 KCLuo1GKGc8RRcx7mZCBrMWhCAhJ+lJ1kv7snqYf9FVhNUYjeK1pzRhesQYBf1UtKZpN
 c4nI/H7KwE/bn9snld8iAp37UISK7JC2JYo9oGmhwYjlt7kwP+BpLl6rIJ08AmDuDexb
 l2uIEW3aWDmVnNXsfoBDV55EsrG/v1NKsrYWY/d2WFMmUkekNnoX0dJwmsNv0rEbpVjP
 7IA4rgi6Q+IUWwXP8fY1So80uHqeNiw/bgisT4ocK1XYYO3m0NtviJzJFUdkoQtHJ0O4
 cKTA==
X-Gm-Message-State: AOAM533ce8Ica0A9mQKTDphw8HbZxtJmYOMoKHrpy8buUI1yyQkJUuBI
 OWjXtM3+oXPyqfuXr9XMsQkeDA==
X-Google-Smtp-Source: ABdhPJzx9i0REzgr6/gPi12sqOoRtBTxOrqVEou0TYRp87r9nmf4qrJshdrBFXvAP62RNBVn0jBZFA==
X-Received: by 2002:a1c:790c:: with SMTP id l12mr1056495wme.47.1604956768392; 
 Mon, 09 Nov 2020 13:19:28 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:19:27 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 10/20] drm/radeon/radeon_ring: Add missing function parameters
 'rdev' and 'data'
Date: Mon,  9 Nov 2020 21:18:45 +0000
Message-Id: <20201109211855.3340030-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcmluZy5jOjIyNjogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAncmRldicgbm90IGRlc2NyaWJlZCBpbiAncmFkZW9uX3JpbmdfdW5s
b2NrX3VuZG8nCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9yaW5nLmM6MjQwOiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdyZGV2JyBub3QgZGVzY3JpYmVkIGlu
ICdyYWRlb25fcmluZ19sb2NrdXBfdXBkYXRlJwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fcmluZy5jOjI4Mzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZGF0
YScgbm90IGRlc2NyaWJlZCBpbiAncmFkZW9uX3JpbmdfYmFja3VwJwoKQ2M6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9yaW5nLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3Jp
bmcuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3JpbmcuYwppbmRleCAzNzA5M2Nl
YTI0YzU5Li5jMzMwNGM5NzdhMGE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9yaW5nLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcmluZy5j
CkBAIC0yMTgsNiArMjE4LDcgQEAgdm9pZCByYWRlb25fcmluZ191bmRvKHN0cnVjdCByYWRlb25f
cmluZyAqcmluZykKIC8qKgogICogcmFkZW9uX3JpbmdfdW5sb2NrX3VuZG8gLSByZXNldCB0aGUg
d3B0ciBhbmQgdW5sb2NrIHRoZSByaW5nCiAgKgorICogQHJkZXY6ICAgICAgIHJhZGVvbiBkZXZp
Y2Ugc3RydWN0dXJlCiAgKiBAcmluZzogcmFkZW9uX3Jpbmcgc3RydWN0dXJlIGhvbGRpbmcgcmlu
ZyBpbmZvcm1hdGlvbgogICoKICAqIENhbGwgcmFkZW9uX3JpbmdfdW5kbygpIHRoZW4gdW5sb2Nr
IHRoZSByaW5nIChhbGwgYXNpY3MpLgpAQCAtMjMxLDYgKzIzMiw3IEBAIHZvaWQgcmFkZW9uX3Jp
bmdfdW5sb2NrX3VuZG8oc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHN0cnVjdCByYWRlb25f
cmluZyAqcmluCiAvKioKICAqIHJhZGVvbl9yaW5nX2xvY2t1cF91cGRhdGUgLSB1cGRhdGUgbG9j
a3VwIHZhcmlhYmxlcwogICoKKyAqIEByZGV2OiAgICAgICByYWRlb24gZGV2aWNlIHN0cnVjdHVy
ZQogICogQHJpbmc6IHJhZGVvbl9yaW5nIHN0cnVjdHVyZSBob2xkaW5nIHJpbmcgaW5mb3JtYXRp
b24KICAqCiAgKiBVcGRhdGUgdGhlIGxhc3QgcnB0ciB2YWx1ZSBhbmQgdGltZXN0YW1wIChhbGwg
YXNpY3MpLgpAQCAtMjc1LDYgKzI3Nyw3IEBAIGJvb2wgcmFkZW9uX3JpbmdfdGVzdF9sb2NrdXAo
c3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHN0cnVjdCByYWRlb25fcmluZyAqcmluCiAgKgog
ICogQHJkZXY6IHJhZGVvbl9kZXZpY2UgcG9pbnRlcgogICogQHJpbmc6IHRoZSByaW5nIHdlIHdh
bnQgdG8gYmFjayB1cAorICogQGRhdGE6IHBsYWNlaG9sZGVyIGZvciByZXR1cm5lZCBjb21taXQg
ZGF0YQogICoKICAqIFNhdmVzIGFsbCB1bnByb2Nlc3NlZCBjb21taXRzIGZyb20gYSByaW5nLCBy
ZXR1cm5zIHRoZSBudW1iZXIgb2YgZHdvcmRzIHNhdmVkLgogICovCi0tIAoyLjI1LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
