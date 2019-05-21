Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4021124F06
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 14:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC708929C;
	Tue, 21 May 2019 12:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E6D8926E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 12:40:27 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id j12so29184607eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 05:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=fGu5CXmHLkv0zpYEja+s5Xi9Hrq4uUYtDpcXgSTaYsk=;
 b=Blk2LldieMFiMXycy3HOCaldBjC1mNO+YROK9Aw3jcctxqMfhjWVJmVkarZXV5RHkK
 8SpDTFIBHG9FBteQiKjx9pdnxm4rJo1z3BijOORXs/rpNF/as1c6yyqiw33CcwnCUASr
 M5VSjV8vwyzqj9xZtlC9LzFcZmQVJ3lDOC5c8NwN1VjumgklwQHMRf76MjG7VFmPNrpj
 LiMFH2SF0aIXZYuQ5xzhawYwa4T4jO2vP5R8TFG97OKsGBn8Cy0WJUmArFizWqOuMJQc
 jESobb3tKdmBhZ5lfmwFZK9gO5NIrWp0Oay3aXPwwEzD58K+HgjOr7oqphc+fFnkraXz
 BeGg==
X-Gm-Message-State: APjAAAX2/+MIyh3iJCZdtpbCHjUu1orC/T6bYe0NjnTHygLK34tpp3Dy
 ScTdLzBVz4jrJKk2zBs2LYmUXg==
X-Google-Smtp-Source: APXvYqz7ovKwHci2iM7r5j3Fb4doVi53i5FE6MjozytgrpYPQBpV8aOx0iJfxkBepLbOJx0w7TT9rA==
X-Received: by 2002:a17:906:63c1:: with SMTP id
 u1mr3117703ejk.173.1558442425919; 
 Tue, 21 May 2019 05:40:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y42sm6223834edb.95.2019.05.21.05.40.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 05:40:24 -0700 (PDT)
Date: Tue, 21 May 2019 14:40:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] Various clean-up patches for GEM VRAM
Message-ID: <20190521124022.GL21222@phenom.ffwll.local>
References: <20190521110831.20200-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521110831.20200-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fGu5CXmHLkv0zpYEja+s5Xi9Hrq4uUYtDpcXgSTaYsk=;
 b=ILYDV/uLQjixXHR5KEUA2/yvzSg6/BjeNMDaUfVunhMg3pBKvOIAWaiDatVHP1MyJL
 p5lmsFKlLKxooGyws4EVINOUtgvTWMJ73NdY041/K92J8ctFpPqNVAD81zTS0HDcMlRT
 f0qmv5CC3JO0GvyKqVZLLBWo5iX2rt7IWyRSk=
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, ray.huang@amd.com,
 kraxel@redhat.com, sam@ravnborg.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDE6MDg6MjhQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gUmVwbGFjaW5nIGRybV9nZW1fdnJhbV9wdXNoX3RvX3N5c3RlbSgpIG1vdmVz
IHBvbGljeSBmcm9tIGRyaXZlcnMgYmFjawo+IHRvIHRoZSBtZW1vcnkgbWFuYWdlci4gTm93LCB1
bnVzZWQgQk9zIGFyZSBvbmx5IGV2aWN0ZWQgd2hlbiB0aGUgc3BhY2UKPiBpcyByZXF1aXJlZC4K
PiAKPiBUaGUgbG9jay91bmxvY2stcmVuYW1pbmcgcGF0Y2ggYWxpZ25zIHRoZSBpbnRlcmZhY2Ug
d2l0aCBvdGhlciBuYW1lcwo+IGluIERSTS4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGFyZSBkb25l
Lgo+IAo+IEZpbmFsbHksIHRoZXJlJ3Mgbm93IGEgbG9ja2RlcCBhc3NlcnQgdGhhdCBlbnN1cmVz
IHdlIGRvbid0IGNhbGwgdGhlCj4gR0VNIFZSQU0gX2xvY2tlZCgpIGZ1bmN0aW9ucyB3aXRoIGFu
IHVubG9ja2VkIEJPLgo+IAo+IFBhdGNoZXMgYXJlIGFnYWluc3QgYSByZWNlbnQgZHJtLXRpcCBh
bmQgdGVzdGVkIG9uIG1nYWcyMDAgYW5kIGFzdCBIVy4KPiAKPiBUaG9tYXMgWmltbWVybWFubiAo
Myk6Cj4gICBkcm06IFJlcGxhY2UgZHJtX2dlbV92cmFtX3B1c2hfdG9fc3lzdGVtKCkgd2l0aCBr
dW5tYXAgKyB1bnBpbgo+ICAgZHJtOiBSZW5hbWUgcmVzZXJ2ZS91bnJlc2VydmUgdG8gbG9jay91
bmxvY2sgaW4gR0VNIFZSQU0gaGVscGVycwo+ICAgZHJtOiBBc3NlcnQgdGhhdCBCTyBpcyBsb2Nr
ZWQgaW4gZHJtX2dlbV92cmFtX3twaW4sdW5waW59X2xvY2tlZCgpCgpBd2Vzb21lLCB0aGFua3Mg
YSBsb3QgZm9yIHF1aWNrbHkgd29ya2luZyBvbiB0aGlzLiBPbiB0aGUgc2VyaWVzOgoKQWNrZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CgpCdXQgZGVmaW5pdGVs
eSBnZXQgc29tZW9uZSB3aXRoIG1vcmUga25vd2xlZGdlIG9mIHRoZSBkZXRhaWxzIHRvIGNoZWNr
CnRoaXMgYWxsIGFnYWluLgoKQXNpZGU6IERvIHlvdSBwbGFuIHRvIGNvbnRpbnVlIHdvcmtpbmcg
b24gZHJtIGRyaXZlcnMsIGkuZS4gYW55IG5lZWQgZm9yCmRybS1taXNjIGNvbW1pdCByaWdodHM/
CgpDaGVlcnMsIERhbmllbAoKPiAKPiAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZmIuYyAgICAg
ICAgICAgICB8IDExICsrLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgICAgICAg
ICAgIHwgMjYgKysrKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5j
ICAgIHwgODYgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
dnJhbV9oZWxwZXJfY29tbW9uLmMgfCAgMiAtCj4gIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21n
YWcyMDBfY3Vyc29yLmMgfCA0MCArKysrKy0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIw
MC9tZ2FnMjAwX2ZiLmMgICAgIHwgMTEgKystCj4gIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21n
YWcyMDBfbW9kZS5jICAgfCAxNSArKystLQo+ICBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmggICAgICAgIHwgIDkgKystCj4gIDggZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygr
KSwgMTIwIGRlbGV0aW9ucygtKQo+IAo+IC0tCj4gMi4yMS4wCj4gCgotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
