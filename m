Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3A8116A09
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680F46E362;
	Mon,  9 Dec 2019 09:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199106E20F
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 19:08:11 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 47Vf6m28xTzFc;
 Sat,  7 Dec 2019 20:05:36 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date: Sat, 7 Dec 2019 20:08:03 +0100
From: =?iso-8859-2?B?TWljaGGzoE1pcm9zs2F3?= <mirq-linux@rere.qmqm.pl>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 01/25] drm/drm_panel: no error when no callback
Message-ID: <20191207190803.GA19924@qmqm.qmqm.pl>
References: <20191207140353.23967-1-sam@ravnborg.org>
 <20191207140353.23967-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191207140353.23967-2-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=rere.qmqm.pl; s=1; 
 t=1575745537; bh=xD00hihA2+BPD32r+k6HGUlmfLpnCXJCediTFaWIcjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U3hYEgXqij0yMU9Y0ZdvA5yqMTRVAJu/Kqp9NxhA8zpkgZ3bwo70rPqi/Y8K4db6r
 TwjepyHqy9vc+ITnPh8pVOoF3M9uyUBcygB0742V8Vt+jBrwBBbtojfks1lBMF0JhL
 SbDtyuaY6zzKAscKGHMYmuHJ6au9knjZPQBEUrm4oFemieAaC8wSw7iQA3oJPQSLMv
 n5c0MIMFwe/SMmPCwE3JZVruqEFq7S/H1NMWp2/zpKBTqqTk6QI03h9/PTjgxWTK1a
 7UR0Kgald5X7pvGFRhtJb0omKs859i6cK6GBlwlCA5oPuncysV6EZBr44QerjUi6IT
 rHGG+OC70siRg==
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBEZWMgMDcsIDIwMTkgYXQgMDM6MDM6MjlQTSArMDEwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IFRoZSBjYWxsYmFja3MgaW4gZHJtX3BhbmVsX2Z1bmNzIGFyZSBvcHRpb25hbCwgc28g
ZG8gbm90Cj4gcmV0dXJuIGFuIGVycm9yIGp1c3QgYmVjYXVzZSBubyBjYWxsYmFjayBpcyBhc3Np
Z25lZC4KWy4uLl0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gaW5kZXggZWQ3OTg1YzA1MzVhLi40YWI3MjI5
ZmIyMmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jClsuLi5dICAKPiBAQCAtMjI4LDEwICsyNDAsMTMg
QEAgRVhQT1JUX1NZTUJPTChkcm1fcGFuZWxfZGlzYWJsZSk7Cj4gICAqLwo+ICBpbnQgZHJtX3Bh
bmVsX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKPiAgewo+IC0JaWYgKHBhbmVs
ICYmIHBhbmVsLT5mdW5jcyAmJiBwYW5lbC0+ZnVuY3MtPmdldF9tb2RlcykKPiArCWlmICghcGFu
ZWwpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJaWYgKHBhbmVsLT5mdW5jcyAmJiBwYW5l
bC0+ZnVuY3MtPmdldF9tb2RlcykKPiAgCQlyZXR1cm4gcGFuZWwtPmZ1bmNzLT5nZXRfbW9kZXMo
cGFuZWwpOwo+ICAKPiAtCXJldHVybiBwYW5lbCA/IC1FTk9TWVMgOiAtRUlOVkFMOwo+ICsJcmV0
dXJuIC1FT1BOT1RTVVBQOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX2dldF9tb2Rl
cyk7Cj4gIAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaCBiL2luY2x1ZGUv
ZHJtL2RybV9wYW5lbC5oCj4gaW5kZXggY2U4ZGE2NDAyMmI0Li5kNzE2NTViMjYzNGMgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1f
cGFuZWwuaGEKWy4uLl0KPiAgCS8qKgo+ICAJICogQGdldF9tb2RlczoKPiAgCSAqCj4gLQkgKiBB
ZGQgbW9kZXMgdG8gdGhlIGNvbm5lY3RvciB0aGF0IHRoZSBwYW5lbCBpcyBhdHRhY2hlZCB0byBh
bmQKPiAtCSAqIHJldHVybiB0aGUgbnVtYmVyIG9mIG1vZGVzIGFkZGVkLgo+ICsJICogQWRkIG1v
ZGVzIHRvIHRoZSBjb25uZWN0b3IgdGhhdCB0aGUgcGFuZWwgaXMgYXR0YWNoZWQgdG8uCj4gKwkg
Kgo+ICsJICogVGhpcyBmdW5jdGlvbiBpcyBtYW5kYXRvcnkuCj4gKwkgKgo+ICsJICogUmV0dXJu
cyB0aGUgbnVtYmVyIG9mIG1vZGVzIGFkZGVkLCAtRU9QTk9UU1VQUCBpZiBjYWxsYmFjawo+ICsJ
ICogaXMgbWlzc2luZywgLUVJTlZBTCBpZiBwYW5lbCBpcyBOVUxMLgo+ICAJICovCj4gIAlpbnQg
KCpnZXRfbW9kZXMpKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKTsKPiAgCgpIaSEKCklmIC5nZXRf
bW9kZXMgaXMgbWFuZGF0b3J5LCB0aGVuIHBhbmVsLT5mdW5jICE9IE5VTEwgY2hlY2tzIGNhbiBi
ZSByZW1vdmVkCmlmIHBhbmVsLT5mdW5jIGFuZCAuZ2V0X21vZGVzIHByZXNlbmNlIGdldHMgY2hl
Y2tlZCBhdCBwYW5lbCBwcm9iZSB0aW1lLgoKQmVzdCBSZWdhcmRzLApNaWNoYcWCIE1pcm9zxYJh
dwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
