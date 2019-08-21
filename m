Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B6A98643
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 23:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9525D6EA09;
	Wed, 21 Aug 2019 21:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B2A6EA12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 21:08:32 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BFB4E50F63
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 21:08:31 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id g33so4154077qtc.14
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 14:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=xe11DFMVnEWPz8DxWrD0bW+LV8j0GN16/IzkNAGUOhI=;
 b=di7bv1c9ecFQUu1nVhqHBJ9BHVBRu2mZMeEiEERlI8n8kNOnztQ8SRljrFL69AmPxy
 bP7LOYvoJ7HZPv+DJqSlD8dy5qepmfG7pRJydfQ/tXb5nCuBafjUtr1PTDg4I3jRQGxT
 TQ+MwYfYB3pes66p0fXmEkGeBiPIXG+7IUMyVsEkY0hXtO3L87buVl6k7wifdxoluvCt
 A1ElsBNIh1vDqEu8EsWOcprI8b5HN1v/daWYMaTwX5wqgUuBF11eD7gdi9HF9iSmkzhR
 eOCOmETopQ2tKehJnQtsU1C+5E0glUW6aWaoIwiX41JpMCF9FykJd7XsyKQivLROH/eG
 OITQ==
X-Gm-Message-State: APjAAAXzwMkNNwJWe6uFODg71pn/HLK8y96d0WcXca8Cle6TrunOkob5
 aoTSLManc4l1sFlQMo2CdVDrpl4RSIrQVnFugjOzmcTeeQwY6bK2hscDbSyZjPpREkBn6IjfNRa
 DSlifiOAo2t6VkLX5rrtRo+9o38qJ
X-Received: by 2002:a0c:d07a:: with SMTP id d55mr5737670qvh.93.1566421711068; 
 Wed, 21 Aug 2019 14:08:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJDxniE1vKfro8/vVecfn50ILQ9MiKn2tW5cREvzxaObRxK7BuTYJQJQSZ+6h6NHGrOXxnVQ==
X-Received: by 2002:a0c:d07a:: with SMTP id d55mr5737649qvh.93.1566421710781; 
 Wed, 21 Aug 2019 14:08:30 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id z7sm4923990qtu.47.2019.08.21.14.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 14:08:29 -0700 (PDT)
Message-ID: <2c2f36106a33932df40ee96978a49ce1398a3238.camel@redhat.com>
Subject: Re: [PATCH v3 10/16] drm/dp-mst: Add MST support to DP DPCD R/W
 functions
From: Lyude Paul <lyude@redhat.com>
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Wed, 21 Aug 2019 17:08:29 -0400
In-Reply-To: <20190821200129.11575-11-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
 <20190821200129.11575-11-David.Francis@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Cc: Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA4LTIxIGF0IDE2OjAxIC0wNDAwLCBEYXZpZCBGcmFuY2lzIHdyb3RlOgo+
IEluc3RlYWQgb2YgaGF2aW5nIGRybV9kcF9kcGNkX3JlYWQvd3JpdGUgYW5kCj4gZHJtX2RwX21z
dF9kcGNkX3JlYWQvd3JpdGUgYXMgZW50cnkgcG9pbnRzIGludG8gdGhlCj4gYXV4IGNvZGUsIGhh
dmUgZHJtX2RwX2RwY2RfcmVhZC93cml0ZSBoYW5kbGUgYm90aC4KPiAKPiBUaGlzIG1lYW5zIHRo
YXQgRFJNIGRyaXZlcnMgY2FuIG1ha2UgTVNUIERQQ0QgcmVhZC93cml0ZXMuCj4gCj4gQ2M6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMgfCAxMiArKy0tLS0t
LS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyAgfCAxMCArKysrKysrKy0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jCj4gYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYwo+IGluZGV4IDAwNjEwYmQ4ZDZjMS4uMDc4MGZj
MzU4Mzg5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMKPiBAQCAtMTYyLDExICsxNjIs
NyBAQCBzdGF0aWMgc3NpemVfdCBhdXhkZXZfcmVhZF9pdGVyKHN0cnVjdCBraW9jYiAqaW9jYiwK
PiBzdHJ1Y3QgaW92X2l0ZXIgKnRvKQo+ICAJCQlicmVhazsKPiAgCQl9Cj4gIAo+IC0JCWlmIChh
dXhfZGV2LT5hdXgtPmlzX3JlbW90ZSkKPiAtCQkJcmVzID0gZHJtX2RwX21zdF9kcGNkX3JlYWQo
YXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwKPiAtCQkJCQkJICAgdG9kbyk7Cj4gLQkJZWxzZQo+IC0J
CQlyZXMgPSBkcm1fZHBfZHBjZF9yZWFkKGF1eF9kZXYtPmF1eCwgcG9zLCBidWYsIHRvZG8pOwo+
ICsJCXJlcyA9IGRybV9kcF9kcGNkX3JlYWQoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7
Cj4gIAo+ICAJCWlmIChyZXMgPD0gMCkKPiAgCQkJYnJlYWs7Cj4gQEAgLTIxNCwxMSArMjEwLDcg
QEAgc3RhdGljIHNzaXplX3QgYXV4ZGV2X3dyaXRlX2l0ZXIoc3RydWN0IGtpb2NiICppb2NiLAo+
IHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKPiAgCQkJYnJlYWs7Cj4gIAkJfQo+ICAKPiAtCQlpZiAo
YXV4X2Rldi0+YXV4LT5pc19yZW1vdGUpCj4gLQkJCXJlcyA9IGRybV9kcF9tc3RfZHBjZF93cml0
ZShhdXhfZGV2LT5hdXgsIHBvcywgYnVmLAo+IC0JCQkJCQkgICAgdG9kbyk7Cj4gLQkJZWxzZQo+
IC0JCQlyZXMgPSBkcm1fZHBfZHBjZF93cml0ZShhdXhfZGV2LT5hdXgsIHBvcywgYnVmLCB0b2Rv
KTsKPiArCQlyZXMgPSBkcm1fZHBfbXN0X2RwY2Rfd3JpdGUoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1
ZiwgdG9kbyk7Cj4gIAo+ICAJCWlmIChyZXMgPD0gMCkKPiAgCQkJYnJlYWs7Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfaGVscGVyLmMKPiBpbmRleCA1NGE2NDE0YzVkOTYuLjlmOTc2YjkwYzUzYSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+IEBAIC0yOSw2ICsyOSw3IEBACj4gICNpbmNsdWRlIDxs
aW51eC9pMmMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+Cj4gICNpbmNsdWRlIDxk
cm0vZHJtX2RwX2hlbHBlci5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg+
Cj4gICNpbmNsdWRlIDxkcm0vZHJtUC5oPgo+ICAKPiAgI2luY2x1ZGUgImRybV9jcnRjX2hlbHBl
cl9pbnRlcm5hbC5oIgo+IEBAIC0yNzIsNyArMjczLDcgQEAgc3RhdGljIGludCBkcm1fZHBfZHBj
ZF9hY2Nlc3Moc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdTgKPiByZXF1ZXN0LAo+ICAKPiAgLyoq
Cj4gICAqIGRybV9kcF9kcGNkX3JlYWQoKSAtIHJlYWQgYSBzZXJpZXMgb2YgYnl0ZXMgZnJvbSB0
aGUgRFBDRAo+IC0gKiBAYXV4OiBEaXNwbGF5UG9ydCBBVVggY2hhbm5lbAo+ICsgKiBAYXV4OiBE
aXNwbGF5UG9ydCBBVVggY2hhbm5lbCAoU1NUIG9yIE1TVCkKPiAgICogQG9mZnNldDogYWRkcmVz
cyBvZiB0aGUgKGZpcnN0KSByZWdpc3RlciB0byByZWFkCj4gICAqIEBidWZmZXI6IGJ1ZmZlciB0
byBzdG9yZSB0aGUgcmVnaXN0ZXIgdmFsdWVzCj4gICAqIEBzaXplOiBudW1iZXIgb2YgYnl0ZXMg
aW4gQGJ1ZmZlcgo+IEBAIC0yODksNiArMjkwLDggQEAgc3NpemVfdCBkcm1fZHBfZHBjZF9yZWFk
KHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCj4gdW5zaWduZWQgaW50IG9mZnNldCwKPiAgewo+ICAJ
aW50IHJldDsKPiAgCj4gKyAgICAgICAgaWYgKGF1eC0+aXNfcmVtb3RlKQo+ICsgICAgICAgICAg
ICAgICAgcmV0dXJuIGRybV9kcF9tc3RfZHBjZF9yZWFkKGF1eCwgb2Zmc2V0LCBidWZmZXIsIHNp
emUpOwoKUGxlYXNlIGZvbGxvdyB0aGUga2VybmVsIHN0eWxlIGd1aWRlbGluZXMuIFdlIGluZGVu
dCB3aXRoIHRhYnMgZmlyc3QsIG5vdApzcGFjZXMuCgo+ICAJLyoKPiAgCSAqIEhQIFpSMjR3IGNv
cnJ1cHRzIHRoZSBmaXJzdCBEUENEIGFjY2VzcyBhZnRlciBlbnRlcmluZyBwb3dlciBzYXZlCj4g
IAkgKiBtb2RlLiBFZy4gb24gYSByZWFkLCB0aGUgZW50aXJlIGJ1ZmZlciB3aWxsIGJlIGZpbGxl
ZCB3aXRoIHRoZSBzYW1lCj4gQEAgLTMxNyw3ICszMjAsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9k
cF9kcGNkX3JlYWQpOwo+ICAKPiAgLyoqCj4gICAqIGRybV9kcF9kcGNkX3dyaXRlKCkgLSB3cml0
ZSBhIHNlcmllcyBvZiBieXRlcyB0byB0aGUgRFBDRAo+IC0gKiBAYXV4OiBEaXNwbGF5UG9ydCBB
VVggY2hhbm5lbAo+ICsgKiBAYXV4OiBEaXNwbGF5UG9ydCBBVVggY2hhbm5lbCAoU1NUIG9yIE1T
VCkKPiAgICogQG9mZnNldDogYWRkcmVzcyBvZiB0aGUgKGZpcnN0KSByZWdpc3RlciB0byB3cml0
ZQo+ICAgKiBAYnVmZmVyOiBidWZmZXIgY29udGFpbmluZyB0aGUgdmFsdWVzIHRvIHdyaXRlCj4g
ICAqIEBzaXplOiBudW1iZXIgb2YgYnl0ZXMgaW4gQGJ1ZmZlcgo+IEBAIC0zMzQsNiArMzM3LDkg
QEAgc3NpemVfdCBkcm1fZHBfZHBjZF93cml0ZShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAo+IHVu
c2lnbmVkIGludCBvZmZzZXQsCj4gIHsKPiAgCWludCByZXQ7Cj4gIAo+ICsgICAgICAgIGlmIChh
dXgtPmlzX3JlbW90ZSkKPiArICAgICAgICAgICAgICAgIHJldHVybiBkcm1fZHBfbXN0X2RwY2Rf
d3JpdGUoYXV4LCBvZmZzZXQsIGJ1ZmZlciwgc2l6ZSk7Cj4gKwpTYW1lIGhlcmUKCj4gIAlyZXQg
PSBkcm1fZHBfZHBjZF9hY2Nlc3MoYXV4LCBEUF9BVVhfTkFUSVZFX1dSSVRFLCBvZmZzZXQsIGJ1
ZmZlciwKPiAgCQkJCSBzaXplKTsKPiAgCWRybV9kcF9kdW1wX2FjY2VzcyhhdXgsIERQX0FVWF9O
QVRJVkVfV1JJVEUsIG9mZnNldCwgYnVmZmVyLCByZXQpOwotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
