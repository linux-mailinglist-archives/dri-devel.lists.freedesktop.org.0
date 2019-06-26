Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4346573A0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 23:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E0F6E516;
	Wed, 26 Jun 2019 21:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76466E516
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 21:28:21 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e3so5010547edr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 14:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=QAdvpJHLN7Unxs7qni5tlbmzWqzQwJ0h6BJZieXT1iY=;
 b=rpOR/qoVOh84hAHI1eH3y8KVJFSKBrZpS7ELKCJ/42i3BnVQLV7MH2oScGQ+Sts8SO
 /iBBlcBciY2lzLI2hNVPA38ME2scKVNb8MIGgToIvOxyJCrsq8Rr7NdMGNDm0hzzFtF1
 12MhYFrgyydK1f/Vvx0y8YJQlmU/lIRe/jNwGoVfk3i/pMNe4qatf1dbMYjEJuGpJV00
 1TxusJ3t153GuD+pKH9r0xPPwVx+F9Rdps2UywHapLP5DyH1qJZMoigRrh/zWO0p/Zqh
 NOIOllf9tVED8+z1dBAi1idySH7XAHTBf2caDqz1AdnyP4M2429rkc8Ep8ZbRDps5Bni
 AJuw==
X-Gm-Message-State: APjAAAW7pddPR808U/qHngkovUkdHnnvIE++zqLxhRSrfAEIACAeKXo1
 H5Ea2ZnpxMWL6XIIwmO2uoiEDg==
X-Google-Smtp-Source: APXvYqzOWYdVWXQhYfOBhgPOvKe7YOpd9OgDuTImGsKJwYzo9M/s/zYTMOXK9jQ14aNXH9lcATnCvA==
X-Received: by 2002:a50:9413:: with SMTP id p19mr8008933eda.224.1561584500647; 
 Wed, 26 Jun 2019 14:28:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id j12sm39532ejd.30.2019.06.26.14.28.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 14:28:19 -0700 (PDT)
Date: Wed, 26 Jun 2019 23:28:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm: Allow range of 0 for drm_mm_insert_node_in_range()
Message-ID: <20190626212817.GZ12905@phenom.ffwll.local>
References: <20190626094330.3556-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626094330.3556-1-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QAdvpJHLN7Unxs7qni5tlbmzWqzQwJ0h6BJZieXT1iY=;
 b=NmG6ZxT+2AJrTQr4EzGrwTzWC5hDTxYLV/7MaO8fKfOpkbRCV2px4jMRo1YOGcsxPD
 /E6Rn3/q12czXGagq7rI4C7QSRqdG/lCZd6Oc9AStgH1FlytsDE1RUXhvrKli36ziHqD
 /spn8abP5fpr3x+NiWe4GFQ6szd1vXVIzeo5I=
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTA6NDM6MzBBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFdlIGdyYWNlZnVsbHkgaGFuZGxlIHRoZSBjYWxsZXIgc3BlY2lmeWluZyBhIHplcm8g
cmFuZ2UsIHNvIGRvbid0IGZvcmNlCj4gdGhlbSB0byBzcGVjaWFsIGNhc2UgdGhhdCBjb25kaXRp
b24gaWYgaXQgbmF0dXJhbGx5IGZhbGxzIG91dCBvZiB0aGVpcgo+IHNldHVwLiBXaGF0IHdlIGRv
bid0IGNoZWNrIGlzIGlmIHRoZSBlbmQgPCBzdGFydCwgc28ga2VlcCB0aGF0IGFzIGFuCj4gYXNz
ZXJ0IGZvciBhbiBpbGxlZ2FsIGNhbGwuCgpNYXliZSBzcGVuZCBhIGZldyB3b3JkcyBvbiB3aHkg
YSBkcm1fbW0gdXNlciBtaWdodCB3YW50IHRvIGRvIHRoYXQuIFNvdW5kcwp2ZXJ5IGZ1bmt5IC4u
LgotRGFuaWVsCgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgo+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51
eC5pbnRlbC5jb20+Cj4gQ2M6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9s
b3NwdXJpb0BpbnRlbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2g+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYwo+IGlu
ZGV4IDlhNTk4NjVjZTU3NC4uNDU4MWM1Mzg3MzcyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbW0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYwo+IEBAIC00NzIs
NyArNDcyLDcgQEAgaW50IGRybV9tbV9pbnNlcnRfbm9kZV9pbl9yYW5nZShzdHJ1Y3QgZHJtX21t
ICogY29uc3QgbW0sCj4gIAl1NjQgcmVtYWluZGVyX21hc2s7Cj4gIAlib29sIG9uY2U7Cj4gIAo+
IC0JRFJNX01NX0JVR19PTihyYW5nZV9zdGFydCA+PSByYW5nZV9lbmQpOwo+ICsJRFJNX01NX0JV
R19PTihyYW5nZV9zdGFydCA+IHJhbmdlX2VuZCk7Cj4gIAo+ICAJaWYgKHVubGlrZWx5KHNpemUg
PT0gMCB8fCByYW5nZV9lbmQgLSByYW5nZV9zdGFydCA8IHNpemUpKQo+ICAJCXJldHVybiAtRU5P
U1BDOwo+IC0tIAo+IDIuMjAuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5l
ZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
