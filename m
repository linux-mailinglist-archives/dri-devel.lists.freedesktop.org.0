Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9AB10D9B1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 19:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5C16E96E;
	Fri, 29 Nov 2019 18:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0FD6E96E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 18:40:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u8so608160wmu.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 10:40:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O7Owcswy7eKcxhGPcVgVtouWOOhlcFEoTMmqU/iHsvg=;
 b=S5XHh2qhoPvWMTZX/s+CjzJM55T2bJNpqaLy/Hz6fdpoNNsoi1Jz5iI0Up/nwImmnL
 4Wq83a+46cj3uRBFFFevVMU5e/CKZRwac+S7iAGWgz1gEOuhiqM/YOxduvJ7ffh9DoQS
 /kurkMN65HBCchCYsts75v8FmQxGBeTFW7nEOYIFABYBSDCSecySIhF/6zElTmHcaBC4
 Oqe3pNsAbCwa3YnzJgHISrF6dTEL9IaVJdkvhIq8U81e0fMvFA+dUwWr7Rxll9gWfPeL
 AxS2d/A6iuc86YsZ4SsYAy6FWI61sjcbA09eGiSpM4x7ui7GoevrPcb/FCni4sPClvZ0
 hOkg==
X-Gm-Message-State: APjAAAUb9uICuyhOhDVNQht3jD9s8YWPZ9cl+QQ8Vj0K9O37pLq+is6P
 YX+5/JYw2qNwgN0pu1oCAPv27Q==
X-Google-Smtp-Source: APXvYqw6kZM2QFVZmpUxKyWdngRUQUwIDEBnlvc0DRJjyK0Yjem7EX+nvMZ/F5ovn9HlP/Rql2CwCA==
X-Received: by 2002:a1c:106:: with SMTP id 6mr15801582wmb.33.1575052841257;
 Fri, 29 Nov 2019 10:40:41 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id v15sm13900738wmh.24.2019.11.29.10.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 10:40:40 -0800 (PST)
Date: Fri, 29 Nov 2019 19:40:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] drm/panfrost: Document base field location constraint
 in panfrost_gem_object
Message-ID: <20191129184038.GK624164@phenom.ffwll.local>
References: <20191129135614.2439058-1-boris.brezillon@collabora.com>
 <b603bc00-832c-ae0d-8dfa-57a0b791d6f9@arm.com>
 <20191129151936.5fb18d2e@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129151936.5fb18d2e@collabora.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O7Owcswy7eKcxhGPcVgVtouWOOhlcFEoTMmqU/iHsvg=;
 b=PYLKwIca2srzyFIWHnUdDmitCtownzAZ9YgT0CZEq/NlqOF9mSaonwJTgAmlcFq2sW
 lMfe9BgJbtQRmzJDov9EUktz/urhiVWV9E+lFYWV/nqLMddB6z21ndualG8na26VdB0T
 eDqfpURcGLUt5pePiwhqLaw9MYmiRfE2DE66k=
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
Cc: Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDM6MTk6MzZQTSArMDEwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+IE9uIEZyaSwgMjkgTm92IDIwMTkgMTQ6MTM6MzMgKzAwMDAKPiBTdGV2ZW4gUHJp
Y2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPiB3cm90ZToKPiAKPiA+IE9uIDI5LzExLzIwMTkgMTM6
NTYsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+ID4gSSd2ZSBzcGVudCBob3VycyBjaGFzaW5n
IGEgbWVtb3J5IGNvcnJ1cHRpb24gdGhhdCB3YXMgY2F1c2VkIGJ5Cj4gPiA+IGluc2VydGlvbiBv
ZiBhbiBleHRyYSBmaWVsZCBmaWVsZCBiZWZvcmUgLT5iYXNlLiBMZXQncyBkb2N1bWVudCB0aGUK
PiA+ID4gZmFjdCB0aGF0IGJhc2UgaGFzIHRvIGJlIHRoZSBmaXJzdCBmaWVsZCBpbiBwYW5mcm9z
dF9nZW1fb2JqZWN0Lgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9u
IDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gIAo+ID4gCj4gPiBUaGlzIHNlZW1zIHRv
IGJlIGEgbGltaXRhdGlvbiBpbXBvc2VkIGJ5IHRoZSBnZW1fY3JlYXRlX29iamVjdCgpCj4gPiBj
YWxsYmFjayAtIGUuZy4gaXQncyBhc3N1bWVkIHRoYXQga2ZyZWUoKSBjYW4gYmUgZGlyZWN0bHkg
Y2FsbGVkIG9uIHRoZQo+ID4gcmVzdWx0LiBVc2VmdWwgdG8gaGF2ZSB0aGUgZG9jdW1lbnRhdGlv
biB0aG91Z2guCj4gCj4gT2gsIHlvdSdyZSByaWdodCwgSSBkaWRuJ3QgY2F0Y2ggdGhhdCBvbmUu
CgpBcyBhIGdlbmVyYWwgcnVsZSBvZiB0aHVtYiwgbmV2ZXIgaW5zZXJ0IGFueXRoaW5nIGJlZm9y
ZSBhIHN0cnVjdCBtZW1iZXIKY2FsbGVkIGJhc2UuIEV2ZW4gbW9yZSBzbyBpZiBpdCdzIG9mIHRo
ZSBzYW1lIGtpbmQgb2YgJHRoaW5nLCBidXQgbGVzcwpzcGV6aWFsZWQuIFRoaXMgcGF0dGVybiBp
cyBzbyBjb21tb24gaXQncyBmYWlybHkgb2Z0ZW4gbm90IGRvY3VtZW50ZWQKYW55d2hlcmUuCi1E
YW5pZWwKCj4gCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPgo+ID4gCj4gPiBTdGV2ZQo+ID4gCj4gPiA+IC0tLQo+ID4gPiBDaGFuZ2VzIGlu
IHYyOgo+ID4gPiAqIFVzZSB0aGUgcHJvcGVyIHByZWZpeCBpbiB0aGUgc3ViamVjdCBsaW5lCj4g
PiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oIHwg
NCArKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPiA+IAo+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oIGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oCj4gPiA+IGluZGV4IGIzNTE3
ZmY5NjMwYy4uZDQ4MDI2MWZjMTc3IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmgKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2dlbS5oCj4gPiA+IEBAIC0xMCw2ICsxMCwxMCBAQAo+ID4gPiAgc3RydWN0
IHBhbmZyb3N0X21tdTsKPiA+ID4gIAo+ID4gPiAgc3RydWN0IHBhbmZyb3N0X2dlbV9vYmplY3Qg
ewo+ID4gPiArCS8qCj4gPiA+ICsJICogTXVzdCBiZSB0aGUgZmlyc3QgZWxlbWVudCBiZWNhdXNl
IHdlJ3JlIHVzaW5nIHNvbWUgb2YgdGhlCj4gPiA+ICsJICogZHJtX2dlbV9zaG1lbSBoZWxwZXJz
Lgo+ID4gPiArCSAqLwo+ID4gPiAgCXN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCBiYXNlOwo+
ID4gPiAgCXN0cnVjdCBzZ190YWJsZSAqc2d0czsKPiA+ID4gIAo+ID4gPiAgIAo+ID4gCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
