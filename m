Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D707695AA2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 11:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA846E28E;
	Tue, 20 Aug 2019 09:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16F66E28C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 09:06:32 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p28so5458712edi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 02:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=l7fNgk0ldBW4Q+AG0qbJN0jZoQuW4S+VZobr8oLUu28=;
 b=h6NaWMJfYjjpcfO2mWhsMGeVorXANpC96FdCcRHTUATj2BdYClO/qYTspCp00Xo9jS
 gVda7pl3pSEplFL3VgdytbOyltH8GamLHpYkEsA7ToQcar3Fk8Nh8uPqiSsy/pO5G9lx
 hrFCf6W98yamxmwRDB6QQLnLBxjr7H9pW8l5AqTe7iDwGV7pmvsBguzreiKU80B3WTX/
 666E004MesO29v9dpkO29XJsIdQzNn8pN+HOfDxXtflQ5Bi6A1gJgSGccp1p9uGgGy3K
 1m1FdZCfY6CIXORIsuXcyxHrHMDQtopVi11tTwLZqbFwwRb2vvmr8bxra8pTG/6zEp6e
 JmPQ==
X-Gm-Message-State: APjAAAXvTFAPP9rCJlv/cADZd+p5f3tHZmoyLaSQ5ZGWSsrCiMnOlFLg
 vK2kE/YmRR8tJ0MFwU7rRR4upQ==
X-Google-Smtp-Source: APXvYqwi3259Oa+93gf+fKuEnszCKN6hmqx+NHUdxTsSUVha8iwaDSxHZ1i2IFvsrHErdld8W6+xQg==
X-Received: by 2002:a50:8f81:: with SMTP id y1mr29578719edy.181.1566291991613; 
 Tue, 20 Aug 2019 02:06:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y37sm3325782edb.42.2019.08.20.02.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 02:06:30 -0700 (PDT)
Date: Tue, 20 Aug 2019 11:06:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] dma-buf: Use %zu for printing sizeof
Message-ID: <20190820090629.GF11147@phenom.ffwll.local>
References: <20190819195740.27608-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190819195740.27608-1-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=l7fNgk0ldBW4Q+AG0qbJN0jZoQuW4S+VZobr8oLUu28=;
 b=LDLHDcwuTvvzuGqb2OEkdO7mcnrFSERR4dQNuNqt7q71oibrXIHwh6/1hxaEUJj7sc
 hTpIGI9ggtqYp/ma1BRdXhmzHjQ82Z0rXxcPlnTm80xHF2Ucj/9NXNE7Cge5iNOhO8Xw
 DHnmrYLfIIb9mgViU3Cn/Jl0QsbYy83k14hV0=
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
Cc: kbuild-all@01.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMDg6NTc6NDBQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFVzZSB0aGUgJXp1IGZvcm1hdCBzcGVjaWZpZXIgZm9yIGEgc2l6ZV90IHJldHVybmVk
IGJ5IHNpemVvLgo+IAo+IFJlcG9ydGVkLWJ5OiBrYnVpbGQtYWxsQDAxLm9yZwo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgoKUmV2aWV3ZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2
ZXJzL2RtYS1idWYvc3QtZG1hLWZlbmNlLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1i
dWYvc3QtZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvc3QtZG1hLWZlbmNlLmMKPiBpbmRl
eCAzZDY5NDA1OTUyYWEuLjZmYmFlNmJmNjU3NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1i
dWYvc3QtZG1hLWZlbmNlLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvc3QtZG1hLWZlbmNlLmMK
PiBAQCAtNTU3LDcgKzU1Nyw3IEBAIGludCBkbWFfZmVuY2Uodm9pZCkKPiAgCX07Cj4gIAlpbnQg
cmV0Owo+ICAKPiAtCXByX2luZm8oInNpemVvZihkbWFfZmVuY2UpPSVsdVxuIiwgc2l6ZW9mKHN0
cnVjdCBkbWFfZmVuY2UpKTsKPiArCXByX2luZm8oInNpemVvZihkbWFfZmVuY2UpPSV6dVxuIiwg
c2l6ZW9mKHN0cnVjdCBkbWFfZmVuY2UpKTsKPiAgCj4gIAlzbGFiX2ZlbmNlcyA9IEtNRU1fQ0FD
SEUobW9ja19mZW5jZSwKPiAgCQkJCSBTTEFCX1RZUEVTQUZFX0JZX1JDVSB8Cj4gLS0gCj4gMi4y
My4wLnJjMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
