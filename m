Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2037A2409F
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 20:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7E8890AD;
	Mon, 20 May 2019 18:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB959890AD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 18:45:30 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id b8so25290804edm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 11:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=MaLZKXc1tpL4JrOFOrJL6Q3e7fbF3Y6J4Fda4m6p998=;
 b=mTI3gyuduQZp84Z3LB7NOvxnPbfAbv+n6CDzeUh/TnyFdMFhdOxdzpVxJoTAvTGWIq
 T1GYNyoum+hMV6suwoztDG1vdCBmncaANkPHx2rv7LoAm8s6+CTPSJuHkiFA4veSVKKZ
 nvykDMLfU40uGitoO07aKQ0Wv9XEoumGPJWUoTlUTyI3cTHGmoceK/zTXepEef4WOTGn
 gqPFgjKZ0Hue1WQalGE+FJ18z8NkLbJhCAnr/a8uLIAzAlg9tH6rRRiVCJDAiIrWGna4
 ViKGSyRXmlRRlftxpxgmv1vO+9dggLlfUHb5d+ckDeU6N5ZO29MUr30sVShXWQJ9rkbW
 gdfg==
X-Gm-Message-State: APjAAAUUpku9uO6PLLj3fYaQ7zGmxcJz9AR8draXS8Sa1vKzzCXmqkxY
 SJA7PN9i2PqlBrUmCGAOVQMebQ==
X-Google-Smtp-Source: APXvYqxDjSPC+oUwd1C3YqvIN5KhQbPWEPSbyN+nCE/P9Yt4pi9nDnPAKUDPq56mlwzs0alfEnnDXQ==
X-Received: by 2002:a17:906:6a8e:: with SMTP id
 p14mr59722956ejr.295.1558377929417; 
 Mon, 20 May 2019 11:45:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a40sm5721281edd.1.2019.05.20.11.45.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 11:45:28 -0700 (PDT)
Date: Mon, 20 May 2019 20:45:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 0/6] drm: make headers self-contained
Message-ID: <20190520184526.GH21222@phenom.ffwll.local>
References: <20190519142036.22861-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190519142036.22861-1-sam@ravnborg.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MaLZKXc1tpL4JrOFOrJL6Q3e7fbF3Y6J4Fda4m6p998=;
 b=PlQayICsFe+mhCqsR3JjsURCW+2uApJUPZNVb8D3vkRnz+2Xu5hwJxW0IORoIGpCFP
 1jV72L7HDBYX0MWUqiwtQsUrtUmnjE7CunIQ0jKs5pjzqDVUvxycmhmWXqkDZ18v1UBW
 Krt033EESGgYu3kqSe8MdhJlOLuPgQcVMi+aU=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgMTksIDIwMTkgYXQgMDQ6MjA6MzBQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IFdoaWxlIHJlbW92aW5nIHVzZSBvZiBkcm1QLmggZnJvbSBmaWxlcyBpbiBkcm0vKiBJ
Cj4gbm90aWNlZCB0aGF0IEkgaGFkIHRvIGFkZCB0aGUgc2FtZSBpbmNsdWRlIGZpbGVzIGR1ZSB0
bwo+IGJ1aWxkIGVycm9ycyBpbiB0aGUgaGVhZGVyIGZpbGVzLgo+IAo+IEl0IGlzIGJldHRlciB0
byBsZXQgdGhlIGhlYWRlciBmaWxlcyBpbmNsdWRlIHdoYXQgaXMgbmVjZXNzYXJ5Cj4gYW5kIGxl
dCB0aGUgdXNlcnMgcHVsbCBpbiBvbmx5IHRoZSBhZGRpdGlvbmFsIGhlYWRlcnMgZmlsZXMgcmVx
dWlyZWQuCj4gU28gSSB3ZW50IGFoZWFkIGFuZCBtYWRlIHRoZSBoZWFkZXIgZmlsZXMgc2VsZi1j
b25hdGluZWQuCj4gKEkgZGlkIG5vdCBjaGVjayBpZiB0aGlzIG1hZGUgYW55IGluY2x1ZGVzIHJl
ZHVuZGFudCBpbiBzb21lIGZpbGVzLAo+IEkgZG8gbm90IGhhdmUgdG9vbGluZyBpbiBwbGFjZSB0
byBkbyBzbykuCgpJIHRoaW5rIGl0J2QgYmUgZ3JlYXQgdG8gbWFrZSBzdXJlIHRoaXMga2VlcHMg
YmVpbmcgdGhlIGNhc2UuIEphbmkgTmlrdWxhCmp1c3QgcG9pbnRlZCBtZSBhdCBzb21lIG5lYXQg
c3R1ZmYgaW4gZHJtL2k5MTUvTWFrZWZpbGUuaGVhZGVyLXRlc3QuCgpJIHRoaW5rIGl0J2QgYmUg
bmljZSB0byBoYXZlIHNvbWV0aGluZyBzaW1pbGFyIGZvciBkcm0gaGVhZGVycyBpbgpkcml2ZXJz
L2dwdS9kcm0sIGJlaGluZCBhIEtjb25maWcgb3B0aW9uIHBlcmhhcHMgc28gdGhhdCBpdCBkb2Vz
bid0IHVwc2V0CnBlb3BsZSwgYnV0IDBkYXkgd2lsbCBzdGlsbCBzcG90IGlzc3Vlcy4gVGhhdCB3
b3VsZCBhbHNvIG1ha2UgdGhlIHNlcmllcwplYXNpZXIgdG8gcmV2aWV3LCBzaW5jZSBlYWNoIHBh
dGNoIHdvdWxkIGFkZCB0aGUgaGVhZGVyIGl0IGZpeGVzIHRvIHRoYXQKYnVpbGQgdGFyZ2V0Lgog
Cj4gVGhlc2UgcGF0Y2hlcyBhcmUgcHJlcGFyYXRpb24gZm9yIHJlbW92aW5nIHVzZSBvZiBkcm1Q
LmggaW4gYWxsCj4gdGhlIGZpbGVzIGluIGRybS8qCj4gCj4gSSBoYXZlIHRoZSBwYXRjaHNldCBy
ZWFkeSAtIG9uZSBwYXRjaCBwZXIgZmlsZS4KPiBJdCBpcyBhIGxvdCBvZiBzbWFsbCBwYXRjaGVz
ICg1OSkgYW5kIG1heWJlIGl0IGlzIGJldHRlciB0bwo+IHNxdWFzaCB0aGVtIGFsbCBpbnRvIG9u
ZSBiaWcgcGF0Y2guIEFueSBvcGluaW9ucyBvbiB0aGlzPwoKSW1vIGZpbmUgdG8gaGF2ZSBhIGh1
Z2UgcGF0Y2ggcGlsZSBmb3IgdGhpcy4KCj4gSSB3aWxsIGF3YWl0IGZlZWRiYWNrIG9uIHRoaXMg
cGF0Y2hzZXQgYmVmb3JlIHNlbmRpbmcgdGhlCj4gcGF0Y2goZXMpIHRvIHJlbW92ZSBkcm1QLmgg
aW4gZHJtLyoKClNvdW5kcyBnb29kLgoKQ2hlZXJzLCBEYW5pZWwKCj4gCj4gCVNhbQo+IAo+IFNh
bSBSYXZuYm9yZyAoNik6Cj4gICAgICAgZHJtOiBtYWtlIGRybV9hdXRoLmggc2VsZiBjb250YWlu
ZWQKPiAgICAgICBkcm06IG1ha2UgZHJtX2xlZ2FjeS5oIHNlbGYtY29udGFpbmVkCj4gICAgICAg
ZHJtOiBtYWtlIGRybV9jcnRjX2ludGVybmFsLmggc2VsZi1jb250YWluZWQKPiAgICAgICBkcm06
IG1ha2UgZHJtX2ludGVybmFsLmggc2VsZi1jb250YWluZWQKPiAgICAgICBkcm06IG1ha2UgZHJt
X2xlZ2FjeS5oIHNlbGYtY29udGFpbmVkCj4gICAgICAgZHJtOiBtYWtlIGRybV90cmFjZS5oIHNl
bGYtY29udGFpbmVkCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Y19pbnRlcm5hbC5oIHwg
MjQgKysrKysrKysrKysrKysrKysrKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1faW50ZXJu
YWwuaCAgICAgIHwgMTAgKysrKysrKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2xlZ2FjeS5o
ICAgICAgICB8ICA0ICsrKysKPiAgZHJpdmVycy9ncHUvZHJtL2RybV90cmFjZS5oICAgICAgICAg
fCAgMiArKwo+ICBpbmNsdWRlL2RybS9kcm1fYXV0aC5oICAgICAgICAgICAgICB8ICA3ICsrKysr
KysKPiAgaW5jbHVkZS9kcm0vZHJtX2xlZ2FjeS5oICAgICAgICAgICAgfCAgMiArKwo+ICA2IGZp
bGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCgotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
