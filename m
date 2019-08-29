Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58008A3277
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43916E2BD;
	Fri, 30 Aug 2019 08:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4ED6E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 18:15:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b16so4380326wrq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QZXSfBTA6DXgFpG6bFg2QroybpYdFLrdUsHrLSMPXbU=;
 b=aofqlvLvyILR2z1SUDsDHjATYoa6qjEGAA+2hPi4NBn//1OeVFylMUA8GDRBlKiu68
 LFPXtPnFBa7ADhuEYd8FTcob6i9cKCqklOumfHvK096NOindNfoEreWKKa8W5/yR+wit
 QA+x3AVHzansc817nFXX2A4Nf3YuyDG+GwOdTMZwl/ctKFJcX3yn5AWNprTOTh2veKko
 LaXwdJUAjE/yQtemyTCz++G3HEBYB+LGNU9wOD6owm+TPYI9yYSh8m6yPtk4aIj9NIzv
 R76t28pOoT/qHdjDXy4NsVj/zK9daPs9/7dJsxwZM94AYRJQvmBxXXj7ncIoJfpVKxS/
 gieQ==
X-Gm-Message-State: APjAAAXB10zOyigHHx2xWEV2K38FgMCWdI/uyhALr8Ku41r72/gyojnl
 SdHZA9bx/4I0B3QeblO17h8=
X-Google-Smtp-Source: APXvYqwCXHxPJUdiv8aicTmLvl6VqfsTX9RsYvMusbP+DhkeKqIIw3JeiLBPrHuPyGathVbX0LXlxw==
X-Received: by 2002:a5d:4f01:: with SMTP id c1mr13401389wru.43.1567102554374; 
 Thu, 29 Aug 2019 11:15:54 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net.
 [86.58.59.25])
 by smtp.gmail.com with ESMTPSA id j18sm3539021wrr.20.2019.08.29.11.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 11:15:53 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 3/4] drm/modes: Introduce a whitelist for the named modes
Date: Thu, 29 Aug 2019 20:15:47 +0200
Message-ID: <5597537.Wd4mHnyQvH@jernej-laptop>
In-Reply-To: <20190827115850.25731-3-mripard@kernel.org>
References: <20190827115850.25731-1-mripard@kernel.org>
 <20190827115850.25731-3-mripard@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QZXSfBTA6DXgFpG6bFg2QroybpYdFLrdUsHrLSMPXbU=;
 b=NTZm/5UFvDMgDVGim+adeIGhNMW7BJMNYGbgfCzRc7deT/yQzm/A5QTDmL3iYe55SX
 rrh2nlDrVcsqfqqhhb8O5lDb7YeJcO4d7sB2Xd6CT73DjgYxBn0sIJeN4+N/yemXJlWk
 1VLdebtcv/rb9G0P9DwQeHjYWg3vXjiOPiN51tDQLSNj0IMYcGjo6TqF208TRTRZVDww
 Dqbfu4IwqjsaX7aHULLIbu0ttj+keZwzBIqqNWtOzV80H0mN1jycl3aPiUCOI7yorEoo
 /gHd0Sd51aNCMXDxtpSp7Lidxjl4v6s2jXPnfmSnHO4m88tRFzp4zd93dfsPyWxHvtKk
 tVUw==
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
Cc: thomas.graichen@googlemail.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpEbmUgdG9yZWssIDI3LiBhdmd1c3QgMjAxOSBvYiAxMzo1ODo0OSBDRVNUIGplIE1heGlt
ZSBSaXBhcmQgbmFwaXNhbChhKToKPiBGcm9tOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJk
QGJvb3RsaW4uY29tPgo+IAo+IFRoZSBuYW1lZCBtb2RlcyBzdXBwb3J0IGhhcyBpbnRyb2R1Y2Vk
IGEgbnVtYmVyIG9mIGdsaXRjaGVzIHRoYXQgd2VyZSBpbgo+IHBhcnQgZHVlIHRvIHRoZSBmYWN0
IHRoYXQgdGhlIHBhcnNlciB3aWxsIHRha2UgYW55IHN0cmluZyBhcyBhIG5hbWVkIG1vZGUuCj4g
Cj4gU2luY2Ugd2Ugc2hvdWxkbid0IGhhdmUgYSBsb3Qgb2Ygb3B0aW9ucyB0aGVyZSAoYW5kIHRo
ZXkgc2hvdWxkIGJlIHByZXR0eQo+IHN0YW5kYXJkKSwgbGV0J3MgaW50cm9kdWNlIGEgd2hpdGVs
aXN0IG9mIHRoZSBhdmFpbGFibGUgbmFtZWQgbW9kZXMgc28gdGhhdAo+IHRoZSBrZXJuZWwgY2Fu
IGRpZmZlcmVudGlhdGUgYmV0d2VlbiBhIHBvb3JseSBmb3JtZWQgY29tbWFuZCBsaW5lIGFuZCBh
Cj4gbmFtZWQgbW9kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUu
cmlwYXJkQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMg
fCAyMCArKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKPiBpbmRleCBlYTdlNmM4YzgzMTguLjk4ODc5N2Q4MDgw
YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKPiBAQCAtMTY3Nyw2ICsxNjc3LDIyIEBAIHN0YXRpYyBp
bnQgZHJtX21vZGVfcGFyc2VfY21kbGluZV9vcHRpb25zKGNoYXIgKnN0ciwKPiBzaXplX3QgbGVu
LCByZXR1cm4gMDsKPiAgfQo+IAo+ICtjb25zdCBjaGFyICpkcm1fbmFtZWRfbW9kZXNfd2hpdGVs
aXN0W10gPSB7Cj4gKwkiTlRTQyIsCj4gKwkiUEFMIiwKPiArfTsKClRoYXQgYXJyYXkgc2hvdWxk
IGJlIHN0YXRpYy4gV2l0aCB0aGF0IGZpeGVkOgoKUmV2aWV3ZWQtYnk6IEplcm5laiBTa3JhYmVj
IDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgo+ICsKPiAr
c3RhdGljIGJvb2wgZHJtX25hbWVkX21vZGVfaXNfaW5fd2hpdGVsaXN0KGNvbnN0IGNoYXIgKm1v
ZGUsIHVuc2lnbmVkIGludAo+IHNpemUpICt7Cj4gKwlpbnQgaTsKPiArCj4gKwlmb3IgKGkgPSAw
OyBpIDwgQVJSQVlfU0laRShkcm1fbmFtZWRfbW9kZXNfd2hpdGVsaXN0KTsgaSsrKQo+ICsJCWlm
ICghc3RybmNtcChtb2RlLCBkcm1fbmFtZWRfbW9kZXNfd2hpdGVsaXN0W2ldLCBzaXplKSkKPiAr
CQkJcmV0dXJuIHRydWU7Cj4gKwo+ICsJcmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICAvKioKPiAg
ICogZHJtX21vZGVfcGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IgLSBwYXJzZSBjb21t
YW5kIGxpbmUgbW9kZWxpbmUKPiBmb3IgY29ubmVjdG9yICogQG1vZGVfb3B0aW9uOiBvcHRpb25h
bCBwZXIgY29ubmVjdG9yIG1vZGUgb3B0aW9uCj4gQEAgLTE3OTQsNiArMTgxMCwxMCBAQCBib29s
IGRybV9tb2RlX3BhcnNlX2NvbW1hbmRfbGluZV9mb3JfY29ubmVjdG9yKGNvbnN0Cj4gY2hhciAq
bW9kZV9vcHRpb24sIGlmIChuYW1lZF9tb2RlKSB7Cj4gIAkJaWYgKG1vZGVfZW5kICsgMSA+IERS
TV9ESVNQTEFZX01PREVfTEVOKQo+ICAJCQlyZXR1cm4gZmFsc2U7Cj4gKwo+ICsJCWlmICghZHJt
X25hbWVkX21vZGVfaXNfaW5fd2hpdGVsaXN0KG5hbWUsIG1vZGVfZW5kKSkKPiArCQkJcmV0dXJu
IGZhbHNlOwo+ICsKPiAgCQlzdHJzY3B5KG1vZGUtPm5hbWUsIG5hbWUsIG1vZGVfZW5kICsgMSk7
Cj4gIAl9IGVsc2Ugewo+ICAJCXJldCA9IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfcmVzX21vZGUo
bmFtZSwgbW9kZV9lbmQsCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
