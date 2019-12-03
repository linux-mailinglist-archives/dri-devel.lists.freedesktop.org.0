Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91B910FACC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 10:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB02C6E448;
	Tue,  3 Dec 2019 09:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5436E44A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 09:35:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b6so2830159wrq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 01:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XBHa2cwFUTayiOWdV9DU0EAWKQvSz6gqNpO/njCwPxM=;
 b=VMvk1hg6h/x+PkV5yYQD3Cb4YyFl8eEIZsrkb4ECfJIg9Gw3aNp4ZJHYCWWieR0G/Q
 O+fyH2rKuNcgMyxI71tcna6eyd52G2tGxvfG7Je/rgg3Q3qJ1gx0cL9o6/ehroBU3sEz
 yXmOHq7tThMrMUWrwo3Th2n9J5am90ZRozKodlPDkbKx1KQfeV69ORZ2AIItz2Hou2Bt
 dfEwY+DBPsFfasV1m7KCu0k431pE4sgkJKU3EyBq6I5AezweWyotwhN5910DMzveBFUC
 KiBdi1H3BAj5aTmR6h68yZ6eKBmX2UwWygBxdyWk6mGXCfLmoKkFI7uOWvhRV5mbZIu+
 uZNQ==
X-Gm-Message-State: APjAAAVfliWcR3+0ZCiyaV+0UwbEOXeVr4aKbSdCq5oP3HdNy/wM5i5O
 MI0DA16Tz/wyPw6kF4QQU8SSEg==
X-Google-Smtp-Source: APXvYqzSA2sIvaUFQJZYFCxx6JEtk0ULCcUtIHuQPeiBOe4UD9vDoIl391MQeh1lCzLc9Bqki3PQng==
X-Received: by 2002:adf:f28c:: with SMTP id k12mr3956966wro.360.1575365717910; 
 Tue, 03 Dec 2019 01:35:17 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id h17sm2975417wrs.18.2019.12.03.01.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 01:35:17 -0800 (PST)
Date: Tue, 3 Dec 2019 10:35:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm: remove no longer used .master_{create,destroy}
 callbacks
Message-ID: <20191203093515.GC624164@phenom.ffwll.local>
References: <20191202172853.19569-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202172853.19569-1-emil.l.velikov@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XBHa2cwFUTayiOWdV9DU0EAWKQvSz6gqNpO/njCwPxM=;
 b=OwU6O4k16P570BWmN/ccucOvjcaDB8vWgMn9CaPak0lAZrtsxzg+s6Wo4e09RwL6/X
 fDc5hx5Jw88/XsCLo5+MLyChQuaAvsRljNYT6rDk/c0HjRuFiTGAL9Qsz3sK2PS9JXh1
 MUqxQ+FJ6SG3qe2+WpsfTBnMeVv/fAs+5EJaE=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Hellstrom <thellstrom@vmware.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMDU6Mjg6NTNQTSArMDAwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4g
Cj4gVXAtdG8gcmVjZW50bHkgdGhlIG9ubHkgZHJpdmVyIHdoaWNoIHJlcXVpcmVkIHRoZXNlIHdh
cyB2bXdnZnguCj4gCj4gV2l0aCBjb21taXQgOWM4NGFlYmE2N2NjICgiZHJtL3Ztd2dmeDogS2ls
bCB1bm5lZWRlZCBsZWdhY3kgc2VjdXJpdHkKPiBmZWF0dXJlcyIpIHRoZSBkcml2ZXIgbm8gbG9u
Z2VyIHNldHMgdGhlbSwgc28gd2UgY2FuIGRyb3AgdGhlIHVudXNlZAo+IGluZnJhLgo+IAo+IENj
OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxp
a292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCk9oIG5pY2UsIEkgdG90YWxseSBtaXNz
ZWQgdGhpcyBoYXBwZW5pbmcsIHRoaXMgaXMgc29tZSByZWFsbHkgbmVhdAp1bmlmaWNhdGlvbiBp
biBob3cgc3R1ZmYgd29ya3MhCgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXV0aC5jIHwgIDgg
LS0tLS0tLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2Rydi5oICAgICAgfCAxNCAtLS0tLS0tLS0tLS0t
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2F1dGguYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXV0aC5jCj4g
aW5kZXggY2M5YWNkOTg2YzY4Li41MzFiODc2ZDBlZDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9hdXRoLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F1dGguYwo+IEBA
IC0xNTMsMTEgKzE1Myw2IEBAIHN0YXRpYyBpbnQgZHJtX25ld19zZXRfbWFzdGVyKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZnByaXYpCj4gIAkJcmV0dXJuIC1FTk9N
RU07Cj4gIAl9Cj4gIAo+IC0JaWYgKGRldi0+ZHJpdmVyLT5tYXN0ZXJfY3JlYXRlKSB7Cj4gLQkJ
cmV0ID0gZGV2LT5kcml2ZXItPm1hc3Rlcl9jcmVhdGUoZGV2LCBmcHJpdi0+bWFzdGVyKTsKPiAt
CQlpZiAocmV0KQo+IC0JCQlnb3RvIG91dF9lcnI7Cj4gLQl9Cj4gIAlmcHJpdi0+aXNfbWFzdGVy
ID0gMTsKPiAgCWZwcml2LT5hdXRoZW50aWNhdGVkID0gMTsKPiAgCj4gQEAgLTMzMiw5ICszMjcs
NiBAQCBzdGF0aWMgdm9pZCBkcm1fbWFzdGVyX2Rlc3Ryb3koc3RydWN0IGtyZWYgKmtyZWYpCj4g
IAlpZiAoZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9NT0RFU0VUKSkKPiAgCQlk
cm1fbGVhc2VfZGVzdHJveShtYXN0ZXIpOwo+ICAKPiAtCWlmIChkZXYtPmRyaXZlci0+bWFzdGVy
X2Rlc3Ryb3kpCj4gLQkJZGV2LT5kcml2ZXItPm1hc3Rlcl9kZXN0cm95KGRldiwgbWFzdGVyKTsK
PiAtCj4gIAlkcm1fbGVnYWN5X21hc3Rlcl9ybW1hcHMoZGV2LCBtYXN0ZXIpOwo+ICAKPiAgCWlk
cl9kZXN0cm95KCZtYXN0ZXItPm1hZ2ljX21hcCk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9kcnYuaCBiL2luY2x1ZGUvZHJtL2RybV9kcnYuaAo+IGluZGV4IGNmMTM0NzA4MTBhNS4u
NDMwMGU4NWRiNDU3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaAo+ICsrKyBi
L2luY2x1ZGUvZHJtL2RybV9kcnYuaAo+IEBAIC00NTcsMjAgKzQ1Nyw2IEBAIHN0cnVjdCBkcm1f
ZHJpdmVyIHsKPiAgCSAqLwo+ICAJdm9pZCAoKmlycV91bmluc3RhbGwpIChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2KTsKPiAgCj4gLQkvKioKPiAtCSAqIEBtYXN0ZXJfY3JlYXRlOgo+IC0JICoKPiAt
CSAqIENhbGxlZCB3aGVuZXZlciBhIG5ldyBtYXN0ZXIgaXMgY3JlYXRlZC4gT25seSB1c2VkIGJ5
IHZtd2dmeC4KPiAtCSAqLwo+IC0JaW50ICgqbWFzdGVyX2NyZWF0ZSkoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgc3RydWN0IGRybV9tYXN0ZXIgKm1hc3Rlcik7Cj4gLQo+IC0JLyoqCj4gLQkgKiBA
bWFzdGVyX2Rlc3Ryb3k6Cj4gLQkgKgo+IC0JICogQ2FsbGVkIHdoZW5ldmVyIGEgbWFzdGVyIGlz
IGRlc3Ryb3llZC4gT25seSB1c2VkIGJ5IHZtd2dmeC4KPiAtCSAqLwo+IC0Jdm9pZCAoKm1hc3Rl
cl9kZXN0cm95KShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX21hc3RlciAqbWFz
dGVyKTsKPiAtCj4gIAkvKioKPiAgCSAqIEBtYXN0ZXJfc2V0Ogo+ICAJICoKPiAtLSAKPiAyLjIz
LjAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
