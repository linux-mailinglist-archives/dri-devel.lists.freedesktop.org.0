Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949CC2C6D73
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 23:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40746EE74;
	Fri, 27 Nov 2020 22:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 426EE6EE74
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 22:58:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79E7B31B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 14:58:30 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5889E3F71F;
 Fri, 27 Nov 2020 14:58:30 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 1427E683244; Fri, 27 Nov 2020 22:58:29 +0000 (GMT)
Date: Fri, 27 Nov 2020 22:58:28 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: carsten.haitzler@foss.arm.com
Subject: Re: [PATCH] drm/komeda: Handle NULL pointer access code path in
 error case
Message-ID: <20201127225828.GL1008493@e110455-lin.cambridge.arm.com>
References: <20201127110054.133686-1-carsten.haitzler@foss.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127110054.133686-1-carsten.haitzler@foss.arm.com>
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
Cc: Carsten Haitzler <carsten.haitzler@arm.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjcsIDIwMjAgYXQgMTE6MDA6NTRBTSArMDAwMCwgY2Fyc3Rlbi5oYWl0emxl
ckBmb3NzLmFybS5jb20gd3JvdGU6Cj4gRnJvbTogQ2Fyc3RlbiBIYWl0emxlciA8Y2Fyc3Rlbi5o
YWl0emxlckBhcm0uY29tPgo+IAo+IGtvbWVkYV9jb21wb25lbnRfZ2V0X29sZF9zdGF0ZSgpIHRl
Y2huaWNhbGx5IGNhbiByZXR1cm4gYSBOVUxMCj4gcG9pbnRlci4ga29tZWRhX2NvbXBpel9zZXRf
aW5wdXQoKSBldmVuIHdhcm5zIHdoZW4gdGhpcyBoYXBwZW5zLCBidXQKPiB0aGVuIHByb2NlZWVk
cyB0byB1c2UgdGhhdCBOVUxMIHBvaW50ZXIgdG9jb21wYXJlIG1lbW9yeSBjb250ZW50IHRoZXJl
Cj4gYWdhaW5zIHRoZSBuZXcgc2F0ZSB0byBzZWUgaWYgaXQgY2hhbmdlZC4gSW4gdGhpcyBjYXNl
LCBpdCdzIGJldHRlciB0bwoKcy9zYXRlL3N0YXRlLwoKPiBhc3N1bWUgdGhhdCB0aGUgaW5wdXQg
Y2hhbmdlZCBhcyB0aGVyZSBpcyBubyBvbGQgc3RhdGUgdG8gY29tcGFyZQo+IGFnYWluc3QgYW5k
IHRodXMgYXNzdW1lIHRoZSBjaGFuZ2VzIGhhcHBlbiBhbnl3YXkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQ2Fyc3RlbiBIYWl0emxlciA8Y2Fyc3Rlbi5oYWl0emxlckBhcm0uY29tPgoKQWNrZWQtYnk6
IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgoKSSBjYW4gbWFrZSB0aGUgc21hbGwg
Zml4IHdoZW4gcHVsbGluZyB0aGUgcGF0Y2ggZm9yIG1lcmdlIGludG8gZHJtLW1pc2MtbmV4dC1m
aXhlcy4KCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgfCAzICsrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9z
dGF0ZS5jCj4gaW5kZXggOGYzMmFlN2MyNWQwLi5lOGIxZTE1MzEyZDggMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVs
aW5lX3N0YXRlLmMKPiBAQCAtNzA3LDcgKzcwNyw4IEBAIGtvbWVkYV9jb21waXpfc2V0X2lucHV0
KHN0cnVjdCBrb21lZGFfY29tcGl6ICpjb21waXosCj4gIAlXQVJOX09OKCFvbGRfc3QpOwo+ICAK
PiAgCS8qIGNvbXBhcmUgd2l0aCBvbGQgdG8gY2hlY2sgaWYgdGhpcyBpbnB1dCBoYXMgYmVlbiBj
aGFuZ2VkICovCj4gLQlpZiAobWVtY21wKCYodG9fY29tcGl6X3N0KG9sZF9zdCktPmNpbnNbaWR4
XSksIGNpbiwgc2l6ZW9mKCpjaW4pKSkKPiArCWlmICghb2xkX3N0IHx8Cj4gKwkgICAgbWVtY21w
KCYodG9fY29tcGl6X3N0KG9sZF9zdCktPmNpbnNbaWR4XSksIGNpbiwgc2l6ZW9mKCpjaW4pKSkK
PiAgCQljX3N0LT5jaGFuZ2VkX2FjdGl2ZV9pbnB1dHMgfD0gQklUKGlkeCk7Cj4gIAo+ICAJa29t
ZWRhX2NvbXBvbmVudF9hZGRfaW5wdXQoY19zdCwgJmRmbG93LT5pbnB1dCwgaWR4KTsKPiAtLSAK
PiAyLjI5LjIKPiAKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8
CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUg
ICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/C
rwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
