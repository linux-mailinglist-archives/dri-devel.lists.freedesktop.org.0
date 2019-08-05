Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1DE822A3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC456E500;
	Mon,  5 Aug 2019 16:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105276E4EA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 16:41:50 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k8so79314403edr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 09:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=hf8FvBTAOyggpm2dvd4BtwrryCtsii7uz4O8VRrML7E=;
 b=ejBj2W1DcSR7zNXhxelSkBG2Q6MF+ZqSpWoEAXhfXYbpTzoNje5mjlLiYZ8103ygRd
 0xztx0hG4J8OM/n6yngIfzKTvL88eVxa8DhVCFO+xCOwbK9mwV/pxgzHNvJMxN2q5v8u
 pO++c6++Bsu2pgssXDYLJxoql5aTSCJ4MtgNCVvrnX/OB0d/5WOlbIvzWoCdgHfUbPvP
 3FcIjvdFsBcBxxfMVtkL9DWoSCjR7+KRzt69o2QZlXFOeRCN7iXXHhKsITnIN1jmyPHz
 ig5tFnWXU1FXoRA+8a8T9DlCmp6FC+37jjWI0onZiHsB9otYL7gL/cEFNzbWlVnY5ZZD
 2z9g==
X-Gm-Message-State: APjAAAVNj3JlZ5Q4lctykeHbqIVb3r8akx97ZnzoxGNotl5baTVKVbVE
 zmOU0UWVFPuJCZq62qro2h0=
X-Google-Smtp-Source: APXvYqzB+kkvE6XHVSaOiar91jcBLzv+PjeK8RERQ/cfP8IvIxj7oGLsBKvncel8k1kqD4HhJ2fKEQ==
X-Received: by 2002:a17:906:c459:: with SMTP id
 ck25mr116923991ejb.32.1565023308629; 
 Mon, 05 Aug 2019 09:41:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b15sm7448204ejj.5.2019.08.05.09.41.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 09:41:47 -0700 (PDT)
Date: Mon, 5 Aug 2019 18:41:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 5/5] dma-buf: nuke reservation_object seq
 number
Message-ID: <20190805164145.GW7444@phenom.ffwll.local>
References: <20190805154554.3476-1-christian.koenig@amd.com>
 <20190805154554.3476-5-christian.koenig@amd.com>
 <156502126144.28464.11399426968315988701@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156502126144.28464.11399426968315988701@skylake-alporthouse-com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=hf8FvBTAOyggpm2dvd4BtwrryCtsii7uz4O8VRrML7E=;
 b=Cyr53hdwUMN5whYeNI4sQtK4949Kf9XdSQAuLtcirO+KLENd/SqV8BIzUQ4PQxBGHZ
 jup80kW0eVZVml7QSMebZq7lVMVPh6I0FPLCTkSHYGUcvdOkng8Adf2FTUMEdIT3cyhb
 nPSKmvUnMUU2+CSRzh1KtfXMBeTKvZCpraqzQ=
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
Cc: linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDU6MDc6NDFQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgQ2hyaXN0aWFuIEvDtm5pZyAoMjAxOS0wOC0wNSAxNjo0NTo1NCkKPiA+
IEBAIC0yMTQsMTYgKzIxNCwxNiBAQCBzdGF0aWMgX19wb2xsX3QgZG1hX2J1Zl9wb2xsKHN0cnVj
dCBmaWxlICpmaWxlLCBwb2xsX3RhYmxlICpwb2xsKQo+ID4gICAgICAgICAgICAgICAgIHJldHVy
biAwOwo+ID4gIAo+ID4gIHJldHJ5Ogo+ID4gLSAgICAgICBzZXEgPSByZWFkX3NlcWNvdW50X2Jl
Z2luKCZyZXN2LT5zZXEpOwo+ID4gICAgICAgICByY3VfcmVhZF9sb2NrKCk7Cj4gPiAgCj4gPiAr
ICAgICAgIGZlbmNlX2V4Y2wgPSByY3VfZGVyZWZlcmVuY2UocmVzdi0+ZmVuY2VfZXhjbCk7Cj4g
PiAgICAgICAgIGZvYmogPSByY3VfZGVyZWZlcmVuY2UocmVzdi0+ZmVuY2UpOwo+ID4gICAgICAg
ICBpZiAoZm9iaikKPiA+ICAgICAgICAgICAgICAgICBzaGFyZWRfY291bnQgPSBmb2JqLT5zaGFy
ZWRfY291bnQ7Cj4gPiAgICAgICAgIGVsc2UKPiA+ICAgICAgICAgICAgICAgICBzaGFyZWRfY291
bnQgPSAwOwo+ID4gLSAgICAgICBmZW5jZV9leGNsID0gcmN1X2RlcmVmZXJlbmNlKHJlc3YtPmZl
bmNlX2V4Y2wpOwo+ID4gLSAgICAgICBpZiAocmVhZF9zZXFjb3VudF9yZXRyeSgmcmVzdi0+c2Vx
LCBzZXEpKSB7Cj4gPiArCj4gPiArICAgICAgIGlmIChyY3VfZGVyZWZlcmVuY2UocmVzdi0+ZmVu
Y2VfZXhjbCkgIT0gZmVuY2VfZXhjbCkgewo+IAo+IElmIEkgcmVtZW1iZXIgbXkgcnVsZXMgY29y
cmVjdGx5LCByY3VfZGVyZWZlcmVuY2UgaXMgYQo+IHJlYWQtZGF0YS1kZXBlbmRzLCB3aGljaCBv
bmx5IG1lYW5zIHRoYXQgYSByZWFkIHRocm91Z2ggdGhlIHBvaW50ZXIKPiByZXR1cm5lZCBieSBy
Y3VfZGVyZWZlcmVuY2UoKSBpcyBhZnRlciB0aGUgcmV0cmlldmFsIG9mIHRoYXQgcG9pbnRlci4K
PiBOb3RoaW5nIG9yZGVycyB0aGUgcmV0cmlldmFsIG9mIGZlbmNlX2V4Y2wgdnMgc2hhcmVkX2Nv
dW50IChkaWZmZXJlbnQKPiBwb2ludGVycyksIHNvIEkgdGhpbmsgdGhlIGxhc3QgbGluZSBzaG91
bGQgYmU6Cj4gCj4gc21wX3JtYigpOwo+IGlmIChyY3VfYWNjZXNzX3BvaW50ZXIocmVzdi0+ZmVu
Y2VfZXhjbCkgIT0gZmVuY2VfZXhjbCkKCkFsc28sIGJhcnJpZXJzIG11c3QgaGF2ZSBhIGNvbW1l
bnQsIHRoZSBjb21tZW50IG11c3QgYmUgb24gYm90aCBiYXJyaWVycwooaWYgeW91IGRvbid0IGhh
dmUgdHdvLCB5b3UncmUgZG9pbmcgaXQgd3JvbmcpLCBhbmQgZWFjaCBiYXJyaWVyIGNvbW1lbnQK
bXVzdCByZWZlcmVuY2UgaXRzIGNvdW50ZXJwYXJ0LgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
