Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0382FD6DB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 18:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189E96E0CD;
	Wed, 20 Jan 2021 17:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FA56E0CD
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611163620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TPl1EqCE+Ph65q+ltaCvj5GuHrM/b8TtE2bCo8tOTc=;
 b=GIKukrCTpFZMnVt8gHQfhEJawjeHqYM4pFcXbRcSO39OnY57yxISAs1L0Y0HUHXumRsLEM
 KCI9+bMjgcYdoP/M6QbxPFsXZYFsOepHVvr/TrWAAUyDzstQujQodtPw8k/DPTBXr8YJjJ
 dREVh/AmjMV0dYsH2/HUpJfn4/Da4KM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-OBAg-mHJMz6YRghX7Sd28A-1; Wed, 20 Jan 2021 12:26:55 -0500
X-MC-Unique: OBAg-mHJMz6YRghX7Sd28A-1
Received: by mail-qt1-f199.google.com with SMTP id e9so13124438qtq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 09:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=2TPl1EqCE+Ph65q+ltaCvj5GuHrM/b8TtE2bCo8tOTc=;
 b=GWc03Paw0iSPkTRH6NlwJY+RrnEQv/KnfqKi8FiQm+OD0k0E1x68kmVsUk3hSEIzH2
 QDEGrtBayywwizwN9bwUfus6NvyCcRC8QJMbH9I46GmwfHR2ztgvyXVxRy0J2OCCSxi2
 ecofBl11v4EVeucgp2H+KpowlqGlMbF0lnpib6GVzIGhir9XkV9GiGBhs1Wi3pS2InS2
 TB2c8wdRMOBf8RKvzUuxZzy+yB5dxoU4nLlLL2bFZG3meshi+yWuB5C2LYC+VFRrpnOl
 QqHtO3C+Izy+W01E6fy15kYr3PJWZDNeqWhx+9vjAHkRAU9Ltkpjhm0IlP4g6tIRW9ve
 6yKA==
X-Gm-Message-State: AOAM531syIl1xU8LuDwukCH5UqJBuMYe+3008gSbyxmTRSYkKOKa7d58
 STU+bm2o7Goex+F1lIyd5lJrr9NTZ7w8O+Timz4aebjQtkIWdxDtyDrrIYz2w44T07jFVe50rfG
 9unrocYI9s9fjoMdYg6enp+P6ic/N
X-Received: by 2002:a0c:a0e6:: with SMTP id c93mr1307871qva.25.1611163615352; 
 Wed, 20 Jan 2021 09:26:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzP4iE+S+hZs8UgpZVOi5s/Hi0G5VOkabaJTNucWD51CcuUgIbBqItMCHNZ+VaWGqmz/1w2WQ==
X-Received: by 2002:a0c:a0e6:: with SMTP id c93mr1307853qva.25.1611163615136; 
 Wed, 20 Jan 2021 09:26:55 -0800 (PST)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id f17sm1556554qtv.68.2021.01.20.09.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 09:26:53 -0800 (PST)
Message-ID: <92f48ffdfa30c3941e0fd22337217f0b10d75ec8.camel@redhat.com>
Subject: Re: [PATCH] drm/msm/dp: fix build after dp quirk helper change
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Date: Wed, 20 Jan 2021 12:26:52 -0500
In-Reply-To: <20210120110708.32131-1-jani.nikula@intel.com>
References: <20210120110708.32131-1-jani.nikula@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBXZWQsIDIwMjEt
MDEtMjAgYXQgMTM6MDcgKzAyMDAsIEphbmkgTmlrdWxhIHdyb3RlOgo+IENvbW1pdCA3YzU1M2Y4
YjVhN2QgKCJkcm0vZHA6IFJldmVydCAiZHJtL2RwOiBJbnRyb2R1Y2UgRURJRC1iYXNlZAo+IHF1
aXJrcyIiKSByZW1vdmVkIGRybV9kcF9nZXRfZWRpZF9xdWlya3MoKSBhbmQgY2hhbmdlZCB0aGUg
c2lnbmF0dXJlIG9mCj4gZHJtX2RwX2hhc19xdWlyaygpIHdoaWxlIHRoZXkgd2VyZSBzdGlsbCBi
ZWluZyB1c2VkIGluIG1zbS4gRml4IHRoZQo+IGJyZWFrYWdlLiBGdW5jdGlvbmFsbHksIHJlbW92
aW5nIHRoZSBFRElELWJhc2VkIHF1aXJrcyBoYXMgbm8gaW1wYWN0IG9uCj4gbXNtLgo+IAo+IFtU
aGUgYWJvdmUgY29tbWl0IHdhcyBtZXJnZWQgdG8gZHJtLWludGVsLW5leHQ7IG1ha2UgdHdvIHdy
b25ncyBhIHJpZ2h0Cj4gYnkgbWVyZ2luZyB0aGlzIGZpeCB0aHJvdWdoIGRybS1pbnRlbC1uZXh0
IGFzIHdlbGwuXQo+IAo+IFJlcG9ydGVkLWJ5OiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5h
dXVnLm9yZy5hdT4KPiBSZWZlcmVuY2VzOgo+IGh0dHA6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIx
MDEyMDEwNTcxNS40MzkxZGQ5NUBjYW5iLmF1dWcub3JnLmF1Cj4gRml4ZXM6IDdjNTUzZjhiNWE3
ZCAoImRybS9kcDogUmV2ZXJ0ICJkcm0vZHA6IEludHJvZHVjZSBFRElELWJhc2VkIHF1aXJrcyIi
KQo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IEFja2VkLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFy
a0BnbWFpbC5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IENjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEg
PGphbmkubmlrdWxhQGludGVsLmNvbT4KPiAKPiAtLS0KPiAKPiBOb3RlOiBJIGFkbWl0IHRvIG5v
dCBldmVuIGJ1aWxkIHRlc3RpbmcgdGhpcyBvbmUuIEknZCBuZWVkIGEgY29uZmlnLAo+IHBvc3Np
Ymx5IGFsc28gYSB0b29sY2hhaW4gc2V0dXAgZm9yIHRoYXQuCj4gLS0tCj4gwqBkcml2ZXJzL2dw
dS9kcm0vbXNtL2RwL2RwX2N0cmwuYyB8IDYgKystLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2RwL2RwX2N0cmwuYwo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9jdHJs
LmMKPiBpbmRleCBlMzQ2MmY1ZDk2ZDcuLjM2YjM5YzM4MWIzZiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2N0cmwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHAvZHBfY3RybC5jCj4gQEAgLTE0MjAsMTYgKzE0MjAsMTQgQEAgdm9pZCBkcF9jdHJsX2hvc3Rf
ZGVpbml0KHN0cnVjdCBkcF9jdHJsICpkcF9jdHJsKQo+IMKgc3RhdGljIGJvb2wgZHBfY3RybF91
c2VfZml4ZWRfbnZpZChzdHJ1Y3QgZHBfY3RybF9wcml2YXRlICpjdHJsKQo+IMKgewo+IMKgwqDC
oMKgwqDCoMKgwqB1OCAqZHBjZCA9IGN0cmwtPnBhbmVsLT5kcGNkOwo+IC3CoMKgwqDCoMKgwqDC
oHUzMiBlZGlkX3F1aXJrcyA9IDA7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBlZGlkX3F1aXJrcyA9
IGRybV9kcF9nZXRfZWRpZF9xdWlya3MoY3RybC0+cGFuZWwtPmVkaWQpOwo+IMKgwqDCoMKgwqDC
oMKgwqAvKgo+IMKgwqDCoMKgwqDCoMKgwqAgKiBGb3IgYmV0dGVyIGludGVyb3AgZXhwZXJpZW5j
ZSwgdXNlZCBhIGZpeGVkIE5WSUQ9MHg4MDAwCj4gwqDCoMKgwqDCoMKgwqDCoCAqIHdoZW5ldmVy
IGNvbm5lY3RlZCB0byBhIFZHQSBkb25nbGUgZG93bnN0cmVhbS4KPiDCoMKgwqDCoMKgwqDCoMKg
ICovCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChkcm1fZHBfaXNfYnJhbmNoKGRwY2QpKQo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gKGRybV9kcF9oYXNfcXVpcmsoJmN0cmwt
PnBhbmVsLT5kZXNjLCBlZGlkX3F1aXJrcywKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBEUF9EUENEX1FVSVJLX0NPTlNUQU5U
X04pKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIChkcm1fZHBfaGFz
X3F1aXJrKCZjdHJsLT5wYW5lbC0+ZGVzYywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERQX0RQ
Q0RfUVVJUktfQ09OU1RBTlRfTikpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxz
ZTsKPiDCoH0KCi0tIApDaGVlcnMsCiBMeXVkZSBQYXVsIChzaGUvaGVyKQogU29mdHdhcmUgRW5n
aW5lZXIgYXQgUmVkIEhhdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
