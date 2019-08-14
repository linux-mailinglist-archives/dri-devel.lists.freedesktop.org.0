Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D4C8DB8F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A071D6E799;
	Wed, 14 Aug 2019 17:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD9D6E799
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:26:24 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f22so7738516edt.4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=KH4w0oKwUZo6WnJTZai7ekWKA/CJXDos3wfcS4r+T+o=;
 b=O1STUvNspLKJqn1SviwQ3bh6zVMzcxdPtDvN2xp++Scd4o0u05x/kEwcKcrWucfo7Q
 S2vns55wkLhW1+DW7Fn6tJR1VQBkpMLaASJpkFrKwfG96PockNupJIHKRL0bKEmloasI
 2VuBit2dcjFEqWjHaUggUaHyil+3sMy3/3GkMq1wc09NS9H2i62se9zeFpzD+tLP0H9A
 YXHoqmfNh8yLRAbMwW1uqzt9vEjh4WDBKIbbWER5S5RVsJdj6cIuQCD3sVwpYBGlfFhS
 /oMGURJim3Ib3Ksp5Pfc0tRYGtppIysjTU6+1Df6t1gdjzl+NeKeBzHJhNlO1IyJLlBz
 xDug==
X-Gm-Message-State: APjAAAWbfHtcbG5RhWZ7qh5zv8dD1GaCaTPgLgSVTu1TbLUcu0gU+1Zx
 s/1Wk2xGY4rMaEMpc/8nIj/yLA==
X-Google-Smtp-Source: APXvYqwr5gJ5RO1f3Je9Fpb0lIcmjnzJrRicW+lM3nEHrC54WpVw+JLDCNpQs7d5n6gcXlpD09jMxg==
X-Received: by 2002:a50:a5dd:: with SMTP id b29mr868361edc.34.1565803583538;
 Wed, 14 Aug 2019 10:26:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id l9sm69555eds.96.2019.08.14.10.26.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:26:22 -0700 (PDT)
Date: Wed, 14 Aug 2019 19:26:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [Xen-devel] [PATCH] drm/xen-front: Make structure fb_funcs
 constant
Message-ID: <20190814172620.GO7444@phenom.ffwll.local>
References: <20190813062712.24993-1-nishkadg.linux@gmail.com>
 <f370930a-6c1c-ef4f-9fc1-0848985b9765@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f370930a-6c1c-ef4f-9fc1-0848985b9765@gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KH4w0oKwUZo6WnJTZai7ekWKA/CJXDos3wfcS4r+T+o=;
 b=FwWRjE6OsxzLbp7eYh90Rna5x9DD6d1S7llQJ4qjoqRHG6mCWqvn6br1A+VtRTrHJl
 uon3iS0lEX0A/0h2Q6UdfNUYjtNRpJi8ofWt91U06wa7NI2J92B2z9h0NiTuRc9G/kje
 veMCuws6t86u7TVcyJX4rutDUinKxB+SjAmsA=
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>,
 oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTA6MzI6MDBBTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gCj4gT24gOC8xMy8xOSA5OjI3IEFNLCBOaXNoa2EgRGFzZ3VwdGEg
d3JvdGU6Cj4gPiBTdGF0aWMgc3RydWN0dXJlIGZiX2Z1bmNzLCBvZiB0eXBlIGRybV9mcmFtZWJ1
ZmZlcl9mdW5jcywgaXMgdXNlZCBvbmx5Cj4gPiB3aGVuIGl0IGlzIHBhc3NlZCB0byBkcm1fZ2Vt
X2ZiX2NyZWF0ZV93aXRoX2Z1bmNzKCkgYXMgaXRzIGxhc3QKPiA+IGFyZ3VtZW50LiBkcm1fZ2Vt
X2ZiX2NyZWF0ZV93aXRoX2Z1bmNzIGRvZXMgbm90IG1vZGlmeSBpdHMgbHN0IGFyZ3VtZW50Cj4g
PiAoZmJfZnVuY3MpIGFuZCBoZW5jZSBmYl9mdW5jcyBpcyBuZXZlciBtb2RpZmllZC4gVGhlcmVm
b3JlIG1ha2UgZmJfZnVuY3MKPiA+IGNvbnN0YW50IHRvIHByb3RlY3QgaXQgZnJvbSBmdXJ0aGVy
IG1vZGlmaWNhdGlvbi4KPiA+IElzc3VlIGZvdW5kIHdpdGggQ29jY2luZWxsZS4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogTmlzaGthIERhc2d1cHRhIDxuaXNoa2FkZy5saW51eEBnbWFpbC5jb20+
Cj4gUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVz
aGNoZW5rb0BlcGFtLmNvbT4KCkknbSBhc3N1bWluZyB5b3UnbGwgYXBwbHkgdGhpcyB0byBkcm0t
bWlzYy1uZXh0IHRvbz8gR29vZCB0byBzdGF0ZSB0aGF0LAp0byBhdm9pZCBjb25mdXNpb24gYW5k
IGNvb3JkaW5hdGlvbiBpc3N1ZXMuCi1EYW5pZWwKCj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jIHwgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4v
eGVuX2RybV9mcm9udF9rbXMuYwo+ID4gaW5kZXggYzI5NTVkMzc1Mzk0Li40YTk4NGY0NTU1NWUg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMK
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYwo+ID4gQEAg
LTQ1LDcgKzQ1LDcgQEAgc3RhdGljIHZvaWQgZmJfZGVzdHJveShzdHJ1Y3QgZHJtX2ZyYW1lYnVm
ZmVyICpmYikKPiA+ICAgCWRybV9nZW1fZmJfZGVzdHJveShmYik7Cj4gPiAgIH0KPiA+IC1zdGF0
aWMgc3RydWN0IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyBmYl9mdW5jcyA9IHsKPiA+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyBmYl9mdW5jcyA9IHsKPiA+ICAgCS5k
ZXN0cm95ID0gZmJfZGVzdHJveSwKPiA+ICAgfTsKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
