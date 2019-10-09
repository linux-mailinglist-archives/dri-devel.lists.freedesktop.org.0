Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB346D2132
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFA489F6F;
	Thu, 10 Oct 2019 06:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A5B6E05D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 21:01:33 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id w6so2979362oie.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 14:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sw03VWEOq6UH59bo7RdQdyl+Hm+LJeIgvFZsAgCAb18=;
 b=M8P28CBhOA3W6wAwGeFTnETqyi7y9UuGWfoY13byfotVNe1oGSQTyZlTUV0dSXp41y
 655NKiqx90oqslnSRUg7SS1ARXksfUQTaiUPrzVrp6v3LawbqoknL4DJoR3sB3R28Jtj
 l7U+n3Jojfiz1p44CI0QoYRnMpUtyeVThC1rRJ7UCnGNV6R9jhe+wvmzdUceOYrBBxc9
 FfjKUW5/QYcOOpOcU8FKSyW5pxPu5Wl03CukQQ5B1RQOXKy+OxETi5N/v5R58dZZqGcr
 /2njUfvdkpL2DqIwnIaVYnMTixs98ViX5VsDOF0/29WA4cBJcOTuwtECtLuj/s6VlSQy
 DiPQ==
X-Gm-Message-State: APjAAAXyOfpLWygyMIUwuhck+ra8W8IOq2sGdW1gdn5c8UoABUCXjPv0
 KCVGLXX3CjEHuSYE/egiQGRrEEY052g=
X-Google-Smtp-Source: APXvYqzu0bwOwrcxAJjRuJ7h6HcP3oHbV+QE5s4Mrq2Z0bdVvNW/eDoCJHH5KZq9uJqmihuv7bOCIA==
X-Received: by 2002:a05:6808:358:: with SMTP id
 j24mr4436207oie.112.1570654892838; 
 Wed, 09 Oct 2019 14:01:32 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id z3sm988421otk.45.2019.10.09.14.01.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2019 14:01:32 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id b136so8557440iof.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 14:01:31 -0700 (PDT)
X-Received: by 2002:a6b:c701:: with SMTP id x1mr5734503iof.162.1570654891445; 
 Wed, 09 Oct 2019 14:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190930224707.14904-1-matthew.d.roper@intel.com>
In-Reply-To: <20190930224707.14904-1-matthew.d.roper@intel.com>
From: Daniele Castagna <dcastagna@chromium.org>
Date: Wed, 9 Oct 2019 17:01:20 -0400
X-Gmail-Original-Message-ID: <CAMmCXFG--UVDJjZ49rPRWs064dxKgCk1O3U0SStNx4tfoxkiSQ@mail.gmail.com>
Message-ID: <CAMmCXFG--UVDJjZ49rPRWs064dxKgCk1O3U0SStNx4tfoxkiSQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 0/3] CRTC background color
To: Matt Roper <matthew.d.roper@intel.com>
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=sw03VWEOq6UH59bo7RdQdyl+Hm+LJeIgvFZsAgCAb18=;
 b=CKG9c+v7V2Kg7uIGr9YX98rBncJpPYhkTlQIEYcQrmLROqwvTdz2aYan0w4skeDjyb
 5sha29Z60eSQDc+RBhDVZwoLCWDkWef5hMS5JAd5QcNEB+/GtVvV5emVxxY+2sEwhip2
 RkaoSQB7Bt1ZZdSU8H98X8qkURpZaVpkCyDQA=
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgOSwgMjAxOSBhdCAxOjM0IFBNIE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3Bl
ckBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gVGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhpcyBzZXJp
ZXMgd2FzIHBvc3RlZCBpbiBGZWJydWFyeSBoZXJlOgo+ICAgICAgICAgaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktRmVicnVhcnkvMjA4MDY4Lmh0
bWwKPgo+IFJpZ2h0IGJlZm9yZSB3ZSBtZXJnZWQgdGhpcyBpbiBGZWJydWFyeSBNYWFydGVuIG5v
dGljZWQgdGhhdCB3ZSBzaG91bGQKPiBiZSBzZXR0aW5nIHVwIHRoZSBpbml0aWFsIHByb3BlcnR5
IHN0YXRlIGluIGEgQ1JUQyByZXNldCBmdW5jdGlvbiAod2hpY2gKPiBkaWRuJ3QgZXhpc3QgeWV0
KSBpbnN0ZWFkIG9mIHdoZW4gdGhlIHByb3BlcnR5IHdhcyBhdHRhY2hlZC4gIE1hYXJ0ZW4KPiBs
YW5kZWQgdGhlIENSVEMgcmVzZXQgZnVuY3Rpb25hbGl0eSBhIHdlZWsgb3IgdHdvIGxhdGVyLCBi
dXQgSSB3YXMgYnVzeQo+IHdpdGggdHJhdmVsIGFuZCBvdGhlciB3b3JrIGF0IHRoZSB0aW1lLCBz
byByZXZpc2l0aW5nIGFuZCByZWJhc2luZyB0aGlzCj4gYmFja2dyb3VuZCBjb2xvciBzZXJpZXMg
ZmVsbCB0aHJvdWdoIHRoZSBjcmFja3MgYW5kIEknbSBqdXN0IGdldHRpbmcKPiBiYWNrIHRvIGl0
IG5vdy4KPgo+IFVzZXJzcGFjZSBjb25zdW1lciBpcyBjaHJvbWVvczsgdGhlc2UgYXJlIHRoZSBs
aW5rcyB0aGUgQ2hyb21lT1MgZm9sa3MKPiBnYXZlIG1lIGJhY2sgaW4gRmVicnVhcnk6Cj4gICBo
dHRwczovL2Nocm9taXVtLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2MvY2hyb21pdW0vc3JjLysv
MTI3ODg1OAo+ICAgaHR0cHM6Ly9jaHJvbWl1bS1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2No
cm9taXVtb3MvcGxhdGZvcm0vZHJtLXRlc3RzLysvMTI0MTQzNgoKUGxlYXNlIG5vdGUgdGhhdCB0
aGUgY3VycmVudCBzdGF0ZSBvZiB0aGUgYmFja2dyb3VuZCBjb2xvciBvbiBDaHJvbWUKT1Mgc2lk
ZSBpcyB0aGF0IHdoaWxlIHRoZSBwcm9wZXJ0eSBwbHVtYmluZyBsYW5kZWQsIHRoZSBwcm9wZXJ0
eSBpcwpjdXJyZW50bHkgbm90IHVzZWQgYnkgdGhlIGNvbXBvc2l0b3IgYW5kIG5vIG9uZSBpcyB3
b3JraW5nIG9uIG1ha2luZwp0aGF0IGhhcHBlbi4KVGhlIGtlcm5lbCBwYXRjaGVzIGhhdmUgbm90
IGxhbmRlZCBvbiB0aGUgQ2hyb21lT1Mga2VybmVsIGVpdGhlci4KCgo+Cj4KPiBJR1QgaXMgc3Rp
bGwgdGhlIHNhbWUgYXMgcG9zdGVkIGluIEZlYnJ1YXJ5Ogo+ICAgaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvYXJjaGl2ZXMvaWd0LWRldi8yMDE5LUZlYnJ1YXJ5LzAwOTYzNy5odG1sCj4K
PiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KPgo+IE1hdHQgUm9wZXIgKDMpOgo+ICAgZHJtOiBBZGQgQ1JUQyBiYWNrZ3JvdW5kIGNvbG9y
IHByb3BlcnR5Cj4gICBkcm0vaTkxNS9nZW45KzogQWRkIHN1cHBvcnQgZm9yIHBpcGUgYmFja2dy
b3VuZCBjb2xvcgo+ICAgZHJtL2k5MTU6IEFkZCBiYWNrZ3JvdW5kIGNvbG9yIGhhcmR3YXJlIHJl
YWRvdXQgYW5kIHN0YXRlIGNoZWNrCj4KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3Rh
dGVfaGVscGVyLmMgICAgfCAgNCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBp
LmMgICAgICAgICAgICB8ICA0ICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYmxlbmQuYyAgICAg
ICAgICAgICAgICAgIHwgMzUgKysrKysrKysrKysrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
bW9kZV9jb25maWcuYyAgICAgICAgICAgIHwgIDYgKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfY29sb3IuYyAgIHwgMTEgKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCA0NSArKysrKysrKysrKysrKysrKysrKwo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMuYyAgICAgICAgICB8ICA5ICsrKysKPiAg
aW5jbHVkZS9kcm0vZHJtX2JsZW5kLmggICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIGlu
Y2x1ZGUvZHJtL2RybV9jcnRjLmggICAgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrKysrCj4g
IGluY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oICAgICAgICAgICAgICAgIHwgIDUgKysrCj4g
IGluY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCAgICAgICAgICAgICAgICAgIHwgMjggKysrKysr
KysrKysrCj4gIDExIGZpbGVzIGNoYW5nZWQsIDE1MyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQo+Cj4gLS0KPiAyLjIxLjAKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdAo+IEludGVsLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
