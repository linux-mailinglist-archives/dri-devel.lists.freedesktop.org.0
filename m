Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDF548AD8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 19:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697EB892C9;
	Mon, 17 Jun 2019 17:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C2B892B9;
 Mon, 17 Jun 2019 17:55:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x17so10942702wrl.9;
 Mon, 17 Jun 2019 10:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=d21iM6IZmcj5vN9kVwkQXsDefiG+Yy547VR/1vbBBSs=;
 b=fhDGZKroUNark+FFrHy0LRyUoekbQzsLJDJbkuA/rmOfO/S9eyPeIPqzO4xU0d5Clw
 vhRQCEVtsWC9IdAoqVV/bqq+CDZK8QHOviLZjNYMCNqj2MP5tx43e5wrQXj6u8EPzkbw
 NV/i3WrjqwMv8QQvknhIjmBiqr8DVi+QWnlfXx0NRnG+BuuDCPix7OU8YYodLbt84PiD
 jdnDEJee+xgfKEBoWP/ce1BIZrunXHw88lHtK4FmAV7B8G876652625NsoSPMA1Kl4YS
 wOFIhxYd68+YHMvmaHxO1xXg+JXNVlCzCuGd8EHGji8486tvM+O1NB2LYojbxa1oAnbz
 dUeQ==
X-Gm-Message-State: APjAAAXv6sqIZzfHNRWdzA4VsrxEynEctQL5UgDINsVfpQzUB5YPwD01
 7H5ZvDIjy+ta76GOzm0m1g5Yl1r+
X-Google-Smtp-Source: APXvYqwlCw3/N3btPEq4oBNZHGlUHWJ50ViH9bygXnmMFVfOQZCLl9MpYE2GTrqNFb31zTVZ/ZT5FA==
X-Received: by 2002:a5d:4f8e:: with SMTP id d14mr1479265wru.193.1560794124516; 
 Mon, 17 Jun 2019 10:55:24 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id i188sm17967686wma.27.2019.06.17.10.55.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 10:55:22 -0700 (PDT)
Date: Mon, 17 Jun 2019 18:53:21 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 05/59] drm/prime: Make DRIVER_PRIME a no-op
Message-ID: <20190617175321.GD26766@arch-x1c3>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-6-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=d21iM6IZmcj5vN9kVwkQXsDefiG+Yy547VR/1vbBBSs=;
 b=YLREFE9TAevlfNHGJwXqmxpiCh0ZRr1mPj6sT4kn22jY2VkpQ3K9/rMof5D1QGxq3N
 ByLzV8im75V2pBdQILzB3qykZmb6Tk9CL1l8tf7fYHfQnV4lMFdXyGHCFE4/nytZYpC2
 F+6uIvaNAvls9u6gpLKssYUa42b2ijgamJFOBFE0OrWbglhyrL+M4USoslPKFiBcarQo
 FWWhPoJg49Pz2jYeh0AHI4ZAdKt0ZTM402nTSMPeTWtkUsPjhyAilnWSuS02b49lew2f
 0n77sP1XtRcXwBhBQ+alg29buB6fhGdndRD1I54i5Kn1qJS7ktuQ7YHu87655hlin/6m
 IzgA==
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNi8xNCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBEcml2ZXJzIG11c3QgZmlsbCBv
dXQgdGhlIGhhbmRsZV90b19mZCBhbmQgZmRfdG9faGFuZGxlIGhvb2tzIHRvCj4gZW5hYmxlIGV4
cG9ydC9pbXBvcnQgcHJpbWUgZnVuY3Rpb25hbGl0eSBhbHJlYWR5LiBUaGUgYWRkaXRpb25hbAo+
IERSSVZFUl9QUklNRSBmbGFnIGRvZXNuJ3Qgc2VydmUgYW55IHJlYWwgcHVycG9zZSwgc2luY2Ug
dGhlIG92ZXJhbGwKPiBmbGFnIGRvZXNuJ3QgZXZlbiB0ZWxsIHlvdSB3aGV0aGVyIGltcG9ydCBv
ciBleHBvcnQgb3IgbWF5YmUgZXZlbiBib3RoCj4gaXMgc3VwcG9ydGVkLgo+IAo+IERpdGNoIGl0
Lgo+IAo+IFRoaXMgcGF0Y2gganVzdCBtYWtlcyBpdCBkZWZ1bmN0LCBzdWJzZXF1ZW50IHBhdGNo
ZXMgd2lsbCByZW1vdmUgaXQKPiBmcm9tIGFsbCB0aGUgZHJpdmVycy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgOSArLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPiBpbmRl
eCBmMDgxNTlhOGIwM2EuLjc4ZjZmMTBiMjA2MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX3ByaW1lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPiBAQCAt
NDcsOCArNDcsNyBAQAo+ICAgKiBiZXR3ZWVuIGFwcGxpY2F0aW9ucywgdGhleSBjYW4ndCBiZSBn
dWVzc2VkIGxpa2UgdGhlIGdsb2JhbGx5IHVuaXF1ZSBHRU0KPiAgICogbmFtZXMuCj4gICAqCj4g
LSAqIERyaXZlcnMgdGhhdCBzdXBwb3J0IHRoZSBQUklNRSBBUEkgbXVzdCBzZXQgdGhlIERSSVZF
Ul9QUklNRSBiaXQgaW4gdGhlCj4gLSAqICZkcm1fZHJpdmVyLmRyaXZlcl9mZWF0dXJlcyBmaWVs
ZCwgYW5kIGltcGxlbWVudCB0aGUKPiArICogRHJpdmVycyB0aGF0IHN1cHBvcnQgdGhlIFBSSU1F
IEFQSSBpbXBsZW1lbnQgdGhlCj4gICAqICZkcm1fZHJpdmVyLnByaW1lX2hhbmRsZV90b19mZCBh
bmQgJmRybV9kcml2ZXIucHJpbWVfZmRfdG9faGFuZGxlIG9wZXJhdGlvbnMuCj4gICAqIEdFTSBi
YXNlZCBkcml2ZXJzIG11c3QgdXNlIGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkKCkgYW4KPiAg
ICogZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUoKSB0byBpbXBsZW1lbnQgdGhlc2UuIEZvciBH
RU0gYmFzZWQgZHJpdmVycyB0aGUKPiBAQCAtMzYxLDkgKzM2MCw2IEBAIGludCBkcm1fcHJpbWVf
ZmRfdG9faGFuZGxlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4g
IHsKPiAgCXN0cnVjdCBkcm1fcHJpbWVfaGFuZGxlICphcmdzID0gZGF0YTsKPiAgCj4gLQlpZiAo
IWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfUFJJTUUpKQo+IC0JCXJldHVybiAt
RU9QTk9UU1VQUDsKPiAtCj4gIAlpZiAoIWRldi0+ZHJpdmVyLT5wcmltZV9mZF90b19oYW5kbGUp
Cj4gIAkJcmV0dXJuIC1FTk9TWVM7Cj4gIApVc2Vyc3BhY2Ugd2lsbCBzZWUgYSB0cml2aWFsIGNo
YW5nZSBoZXJlIEVPUE5PVFNVUFAgdnMgRU5PU1lTLiBBbHRob3VnaApJIHNlcmlvdXNseSBkb3Vi
dCB0aGV5IGhhZCBzdWNoIGZpbmUtZ3JhaW5lZCBlcnJvciBjaGVja2luZyBhbmQgZmFsbGJhY2sK
cGF0aHMuCgpQbGVhc2UgbWVudGlvbiB0aGUgY2hhbmdlZCByZXR1cm4gdmFsdWUgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlLgoKVGhhbmtzCkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
