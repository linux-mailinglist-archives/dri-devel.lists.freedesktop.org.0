Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 393FEBFB15
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 23:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D576EE19;
	Thu, 26 Sep 2019 21:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069556EB12;
 Thu, 26 Sep 2019 21:44:30 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id k24so1283057uag.10;
 Thu, 26 Sep 2019 14:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2VtMv+VSNh6HHfIJ2Y/iSuqqoT+LLaE8R1CJELxWo8o=;
 b=TF3SJxnOknAtAFbsu0xResAgjXe4mwff7TYu4ko9MxMX9J36ADHdFF1pBDMaOQBZri
 b5xdpEV5IfMUwOBbw7Rh2CKqirmeL+hc/jBIQW/cYPjHMBvPiy8fCmOfkk1ij3Gn4ZTp
 0MtIM5GHA72JD0Sg7MNjeR1dA0LmVvnw/cpmrUJJv7jJXhFeZd0CMUXFMzH9dkvhWkTk
 mQIy9EZz5id1InQmXuiQB0JbJgx7ASpKFEPfO7Xt6anjofAzQJTcNyKpcYEZfXGFyN1K
 tZMub9P/CZPH6IiIORKfdgXtelzMAKw4/8KsQKPMBziF7Mc8+LvArHkMxIZW0yIkjhyN
 5gZA==
X-Gm-Message-State: APjAAAX5byZyUNHieRk4Ht/uCMegA3YWtO3p25BRB5qvkHrlIVGO/CUN
 YD1zkvGcjd/KsqRYFPVR/xaHxklwYMNtiwYdsIo=
X-Google-Smtp-Source: APXvYqzGEghfwM43/y5s/ikRPGSPPulfUUYMMGkH7TZpvDdxSoEjzgKmUbs0k7wIBLiIYGzF+L10qUOm9z2/mHmbpw8=
X-Received: by 2002:ab0:5514:: with SMTP id t20mr2614206uaa.35.1569534269931; 
 Thu, 26 Sep 2019 14:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <ec6739a5-af3a-0aeb-fdae-dd11d6b2ec1f@gmail.com>
In-Reply-To: <ec6739a5-af3a-0aeb-fdae-dd11d6b2ec1f@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 27 Sep 2019 07:44:19 +1000
Message-ID: <CACAvsv7jwLeY04SyaGjPcRN-ZPaGdVUUY6tC5q33kSsdwJumdg@mail.gmail.com>
Subject: Re: [Nouveau] Is Nouveau really using the io_reserve_lru?
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2VtMv+VSNh6HHfIJ2Y/iSuqqoT+LLaE8R1CJELxWo8o=;
 b=FNKRadrXUEQQpAIWl1l5hQzOQttwn5Vd727spe68lWvkBMK1qt97xboxU60ZWgtK7U
 EvalyEDWH61s/3kmJAZoCSf49ewNaQR2/9q2+jNoO0tzwrffFmqcb7Nh6Idg/ZoblRIN
 533rIS7rB8wtnkp2mAiLPgorT+HzyQayfZD+XOrfVMjYLWVKVos5G5MSvjmYf/7kEVf/
 2J6eWKINeNwFYNP/TD4B0gjya59322xJkVxZNYl1j9j4RUHtWiHUYCB5g2xTrtp+9PmC
 tXwOeqiRep270EHb4Z8BqEObl7j2RyHdxKJtfqg8EQnErsM9OWyA21TDdhmM1qpA2Nsd
 gLlQ==
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
Cc: Dave Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNCBTZXAgMjAxOSBhdCAyMjoxOSwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgZ3V5cywKPgo+IHdoaWxlIHdv
cmtpbmcgdGhyb3VnaCBtb3JlIG9sZCBUVE0gZnVuY3Rpb25hbGl0eSBJIHN0dW1ibGVkIG92ZXIg
dGhlCj4gaW9fcmVzZXJ2ZV9scnUuCj4KPiBCYXNpYyBpZGVhIGlzIHRoYXQgd2hlbiB0aGlzIGZs
YWcgaXMgc2V0IHRoZSBkcml2ZXItPmlvX21lbV9yZXNlcnZlKCkKPiBjYWxsYmFjayBjYW4gcmV0
dXJuIC1FQUdBSU4gcmVzdWx0aW5nIGluIHVubWFwcGluZyBvZiBvdGhlciBCT3MuCj4KPiBCdXQg
Tm91dmVhdSBkb2Vzbid0IHNlZW0gdG8gcmV0dXJuIC1FQUdBSU4gaW4gdGhlIGNhbGwgcGF0aCBv
Zgo+IGlvX21lbV9yZXNlcnZlIGFueXdoZXJlLgpJIGJlbGlldmUgdGhpcyBpcyBhIGJ1ZyBpbiBO
b3V2ZWF1LiAgV2UgKnNob3VsZCogYmUgcmV0dXJuaW5nIC1FQUdBSU4KaWYgd2UgZmFpbCB0byBm
aW5kIHNwYWNlIGluIEJBUjEgdG8gbWFwIHRoZSBCTyBpbnRvLgoKQmVuLgo+Cj4gU28gaXMgdGhp
cyB1bnVzZWQgb3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0
aWFuLgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
Tm91dmVhdSBtYWlsaW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
