Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A56E3640D7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 13:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033D689DF7;
	Mon, 19 Apr 2021 11:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDEB89DF7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8/WB5h/DCpqWz25sPbtK613PP91ho7sThr7U3NsdLI=;
 b=OEtl5oYZ0J24OGiW5ijqjxbuWwts0PrdNg4U7v0JVJfqSRLgU3vRSLTYnVczKd4vxsOrxB
 YhbdCU3661vXSvGgXqwjROjg41pLL4VOKZROu5SV+Bx+CIYK2SPwZ05xxYkZIKxrPxLAju
 EsncctTIf4A0U80NBZ4ASwMFzZDx8ag=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-9cHB_p0wNnSo43pMelEUVg-1; Mon, 19 Apr 2021 07:49:02 -0400
X-MC-Unique: 9cHB_p0wNnSo43pMelEUVg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c124-20020a1c9a820000b0290136c7a94cf3so380124wme.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 04:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X8/WB5h/DCpqWz25sPbtK613PP91ho7sThr7U3NsdLI=;
 b=Q8dAA+6yz8jgvh83Tl9h/r4NZsCN6RdmGreQLzsPKwyJ3sf3dK1zscND5J+u/jtfw6
 QNQSYqkRNA5lYfSXw3VAyfsMufxLzum2YehVl5zYBRhohUjZwIQHWYkTvT3d3Arwpf6+
 F7eA7AnGPPN62RtamoYkuErKH9GlYKee/DYoGimUf7ieUVFolhuPx7AEICQmwHZPKyCx
 uKcsfaGpEe5sWBNg/M6/SGk/ejPzLbwI0uFton/IEKL/Sps5auWgt34Lct0TaqSDmD2N
 7qxGL+EYhVtcaLvZsR7kOhEto5wEAgxS4+hYtAoktEGAiZ7ZsdaA/Obwlf58KkV30n1F
 YkSw==
X-Gm-Message-State: AOAM533ZgtJ4sBIMMwGD/uW4/y0pOYrRmXqwFBScAPb8OYz8zOSkYFtz
 9+NqpEQPJBC5xLAkGNBZunrqQc+to0nZq+ToJRsSiNS9/1cZ2mAVbnGEx5+qmw8cpBuhM9SWGfc
 Ea620aJJaIre2brxCVm8L4dzgV6/pRtIW2geTNPcx+hfl
X-Received: by 2002:a05:600c:3796:: with SMTP id
 o22mr21036158wmr.139.1618832941558; 
 Mon, 19 Apr 2021 04:49:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqeEo6baFAOSCC5EED8Adjw7elmBbplC1HwyVdu+epP3qNnST1SJ2pLkLV0oLFm79ijqBFSPkWTkiLHj2i6Lo=
X-Received: by 2002:a05:600c:3796:: with SMTP id
 o22mr21036144wmr.139.1618832941419; 
 Mon, 19 Apr 2021 04:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-16-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-16-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:48:50 +0200
Message-ID: <CACO55tvbVFPfjzTxmoKMbxVv1bR9xguX+QCLZawtg2SdSN9qzQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 15/40] drm/nouveau/nouveau_svm: Remove unused
 variable 'ret' from void function
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMTYsIDIwMjEgYXQgNDozOCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmM6IElu
IGZ1bmN0aW9uIOKAmG5vdXZlYXVfcGZuc19tYXDigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfc3ZtLmM6ODEwOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQg
YnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cj4gQ2M6IEJlbiBTa2Vn
Z3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIHwgNSArKy0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCj4gaW5kZXggMWMzZjg5MDM3N2QyYy4uMjZhZjZl
ZTkxNTM2OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2
bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwo+IEBAIC04
MTEsNyArODExLDYgQEAgbm91dmVhdV9wZm5zX21hcChzdHJ1Y3Qgbm91dmVhdV9zdm1tICpzdm1t
LCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
YWRkciwgdTY0ICpwZm5zLCB1bnNpZ25lZCBsb25nIG5wYWdlcykKPiAgewo+ICAgICAgICAgc3Ry
dWN0IG5vdXZlYXVfcGZubWFwX2FyZ3MgKmFyZ3MgPSBub3V2ZWF1X3BmbnNfdG9fYXJncyhwZm5z
KTsKPiAtICAgICAgIGludCByZXQ7Cj4KPiAgICAgICAgIGFyZ3MtPnAuYWRkciA9IGFkZHI7Cj4g
ICAgICAgICBhcmdzLT5wLnNpemUgPSBucGFnZXMgPDwgUEFHRV9TSElGVDsKPiBAQCAtODE5LDgg
KzgxOCw4IEBAIG5vdXZlYXVfcGZuc19tYXAoc3RydWN0IG5vdXZlYXVfc3ZtbSAqc3ZtbSwgc3Ry
dWN0IG1tX3N0cnVjdCAqbW0sCj4gICAgICAgICBtdXRleF9sb2NrKCZzdm1tLT5tdXRleCk7Cj4K
PiAgICAgICAgIHN2bW0tPnZtbS0+dm1tLm9iamVjdC5jbGllbnQtPnN1cGVyID0gdHJ1ZTsKPiAt
ICAgICAgIHJldCA9IG52aWZfb2JqZWN0X2lvY3RsKCZzdm1tLT52bW0tPnZtbS5vYmplY3QsIGFy
Z3MsIHNpemVvZigqYXJncykgKwo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnBh
Z2VzICogc2l6ZW9mKGFyZ3MtPnAucGh5c1swXSksIE5VTEwpOwo+ICsgICAgICAgbnZpZl9vYmpl
Y3RfaW9jdGwoJnN2bW0tPnZtbS0+dm1tLm9iamVjdCwgYXJncywgc2l6ZW9mKCphcmdzKSArCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICBucGFnZXMgKiBzaXplb2YoYXJncy0+cC5waHlzWzBd
KSwgTlVMTCk7Cgp5ZWFoIG1oaC4uIEkgdGhpbmsgdGhpcyBvbmUgaXMgYWN0dWFsbHkgZmluZSwg
YnV0IGl0IG1pZ2h0IG1ha2Ugc2Vuc2UKdG8gc3RpbGwgcmVwb3J0IHNvbWV0aGluZyBiYWNrLCBh
bHRob3VnaCBpbiB1c2Vyc3BhY2Ugd2Ugc3RpbGwgZG9uJ3QKY2FyZSBhcyB0aGUgQ0wgQVBJIGRv
ZXNuJ3QgcmV0dXJuIGFueSBlcnJvci4KCj4gICAgICAgICBzdm1tLT52bW0tPnZtbS5vYmplY3Qu
Y2xpZW50LT5zdXBlciA9IGZhbHNlOwo+Cj4gICAgICAgICBtdXRleF91bmxvY2soJnN2bW0tPm11
dGV4KTsKPiAtLQo+IDIuMjcuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
