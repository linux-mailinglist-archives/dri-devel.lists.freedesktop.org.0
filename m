Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A4374DBE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 14:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996456E72A;
	Thu, 25 Jul 2019 12:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661216E72A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 12:06:36 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w20so49982411edd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 05:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=uuCDMp5SyacmBw0C2eh9sjSgpZ84DDA2KXtfPI5At+4=;
 b=kdmJjB2w6Pa4qxwN6cB9U7e7nB+0I5bc5P3idPel4aYyNgGYC1Rm3T5lx7k/BX7zz/
 5eZqMfTnc9n1AV0cdxPLlFWPlrWSdV0wqm8MYxEheefEGlgdyMBKcjmd68hUBRQIPh6o
 VSXs/TDJRXDcW4JdnWDzgLM1AJLgiDQrSycsdF4nREIuFbPUIXIl0q74Am3zPHoPHtfP
 TQavxVpvbJz9ymb18wr57CPGUO8JQh3yfa+ECGC/jSQCC0jeetdJLg4m5SQ42oo/iBHa
 rHC4EbBUstmmgNduG3m6bcCZibCt4pPf6sp5+9lYgaHu7pIFm15cixeVwjR9nZD6O5xz
 Kh3Q==
X-Gm-Message-State: APjAAAXi0aKC9RcryKGRQdY+3Wv5OVa7wW/Rxm1CFdEIsfSEJDFui/TI
 t0vjsIUpuIvWx3B5iFMUUV4=
X-Google-Smtp-Source: APXvYqzBFpVhTaA1Gi/kZqJD7zrHhbbKZ+6eGw6lcZLEH4aJUKQV0kWVN0v+4z1PNUaysXtrwkIyww==
X-Received: by 2002:a50:ac4a:: with SMTP id w10mr77002115edc.33.1564056394995; 
 Thu, 25 Jul 2019 05:06:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a8sm12865457edt.56.2019.07.25.05.06.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 05:06:34 -0700 (PDT)
Date: Thu, 25 Jul 2019 14:06:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 0/3] drm/tinydrm: Rename to drm/tiny
Message-ID: <20190725120632.GC15868@phenom.ffwll.local>
References: <20190725105132.22545-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725105132.22545-1-noralf@tronnes.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=uuCDMp5SyacmBw0C2eh9sjSgpZ84DDA2KXtfPI5At+4=;
 b=XgKTaIWYbDvbKKM2KUXbnrb1c7Gb/0vmDeJEC+urJ4aJBNh891Yu9fgeyLyd03MmZz
 lPWEEZPHnnhZmarO604DZbwptQvIXlTOO7FM3+qRrUXgyjmelC4J8dcaiaQFphAGlXVE
 +JcSgd1oKmXHTyPJCmTE0CBgGjH2bsRexErtM=
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTI6NTE6MjlQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IFRoaXMgaXMgdGhlIGZpbmFsIHBvbGlzaCBvbiB0aW55ZHJtIHR1cm5pbmcgaXQg
aW50byBfdGhlXyBwbGFjZSBmb3IgdGlueQo+IERSTSBkcml2ZXJzLgo+IAo+IE5vcmFsZi4KPiAK
PiBOb3JhbGYgVHLDuG5uZXMgKDMpOgo+ICAgZHJtL3Rpbnlkcm0vS2NvbmZpZzogUmVtb3ZlIG1l
bnVjb25maWcgRFJNX1RJTllEUk0KPiAgIGRybS90aW55ZHJtOiBSZW5hbWUgZm9sZGVyIHRvIHRp
bnkKPiAgIGRybS9nbTEydTMyMDogTW92ZSBkcml2ZXIgdG8gZHJtL3RpbnkKCkkgd29uZGVyIHdo
ZXRoZXIgd2UgY291bGQgcGxhY2UgYSBkb2N1bWVudGF0aW9uIGhpbnQgc29tZXdoZXJlIHRvIHB1
dAp0aW55IGRybSBkcml2ZXJzIChpLmUuIG9uZSBmaWxlIG9ubHksIGFuZCB0aGF0IG9uZSBwcmV0
dHkgc21hbGwpIGludG8KZHJtL3RpbnkuIEJ1dCBJIGNvdWxkbid0IGNvbWUgdXAgd2l0aCBhIGdv
b2QgcGxhY2UuIE1heWJlIHJlLWFkZCB0aW55LnJzdAp3aXRoIGEgc2hvcnQgb3ZlcnZpZXcgcGFy
YWdyYXBoIHRoYXQgcG9pbnRzIGF0IHRoZSBtb3N0IHVzZWZ1bCBoZWxwZXJzIGZvcgp0aW55IGRy
aXZlcnMsIHBsdXMgaG93IHRvIGludGVncmF0ZSB0aGVtPyBLaW5kYSBhcyBhIEZBUSB0byB0aGUg
Ikkgd2FudCB0bwpwb3J0IGFuIGZiZGV2IGRyaXZlciwgaGFscCBwbHM/IiBxdWVzdGlvbi4KCkFu
eXdheSB0aGF0J3MganVzdCBhbiBpZGVhIGFzaWRlLCBvbiB0aGUgc2VyaWVzOgoKQWNrZWQtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IAo+ICBNQUlOVEFJTkVS
UyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxNCArKystLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstCj4gIGRyaXZl
cnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAzICstCj4gIGRyaXZl
cnMvZ3B1L2RybS9nbTEydTMyMC9LY29uZmlnICAgICAgICAgICAgICB8ICA5IC0tLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2dtMTJ1MzIwL01ha2VmaWxlICAgICAgICAgICAgIHwgIDIgLQo+ICBkcml2
ZXJzL2dwdS9kcm0ve3Rpbnlkcm0gPT4gdGlueX0vS2NvbmZpZyAgICAgfCA0MSArKysrKysrKysr
KysrLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS97dGlueWRybSA9PiB0aW55fS9NYWtlZmlsZSAg
ICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3tnbTEydTMyMCA9PiB0aW55fS9nbTEydTMyMC5j
IHwgIDAKPiAgZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L2h4ODM1N2QuYyAgIHwg
IDAKPiAgZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L2lsaTkyMjUuYyAgIHwgIDAK
PiAgZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L2lsaTkzNDEuYyAgIHwgIDAKPiAg
ZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L21pMDI4M3F0LmMgIHwgIDAKPiAgZHJp
dmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L3JlcGFwZXIuYyAgIHwgIDAKPiAgZHJpdmVy
cy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L3N0NzU4Ni5jICAgIHwgIDAKPiAgZHJpdmVycy9n
cHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L3N0NzczNXIuYyAgIHwgIDAKPiAgMTUgZmlsZXMgY2hh
bmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vZ20xMnUzMjAvS2NvbmZpZwo+ICBkZWxldGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL2dtMTJ1MzIwL01ha2VmaWxlCj4gIHJlbmFtZSBkcml2ZXJzL2dw
dS9kcm0ve3Rpbnlkcm0gPT4gdGlueX0vS2NvbmZpZyAoNzMlKQo+ICByZW5hbWUgZHJpdmVycy9n
cHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L01ha2VmaWxlICg4OSUpCj4gIHJlbmFtZSBkcml2ZXJz
L2dwdS9kcm0ve2dtMTJ1MzIwID0+IHRpbnl9L2dtMTJ1MzIwLmMgKDEwMCUpCj4gIHJlbmFtZSBk
cml2ZXJzL2dwdS9kcm0ve3Rpbnlkcm0gPT4gdGlueX0vaHg4MzU3ZC5jICgxMDAlKQo+ICByZW5h
bWUgZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L2lsaTkyMjUuYyAoMTAwJSkKPiAg
cmVuYW1lIGRyaXZlcnMvZ3B1L2RybS97dGlueWRybSA9PiB0aW55fS9pbGk5MzQxLmMgKDEwMCUp
Cj4gIHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0ve3Rpbnlkcm0gPT4gdGlueX0vbWkwMjgzcXQuYyAo
MTAwJSkKPiAgcmVuYW1lIGRyaXZlcnMvZ3B1L2RybS97dGlueWRybSA9PiB0aW55fS9yZXBhcGVy
LmMgKDEwMCUpCj4gIHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0ve3Rpbnlkcm0gPT4gdGlueX0vc3Q3
NTg2LmMgKDEwMCUpCj4gIHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0ve3Rpbnlkcm0gPT4gdGlueX0v
c3Q3NzM1ci5jICgxMDAlKQo+IAo+IC0tIAo+IDIuMjAuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
