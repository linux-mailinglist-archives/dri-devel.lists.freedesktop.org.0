Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7E2C0AC6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 20:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769466E1B3;
	Fri, 27 Sep 2019 18:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8246E1B2;
 Fri, 27 Sep 2019 18:07:14 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id u31so2239241uah.0;
 Fri, 27 Sep 2019 11:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tUxU35/P3XzZIkL1RZg5lWTKdNoVDKtyixg3YVklCK4=;
 b=Vpxesn9TVt4aMtuvTjAE9Vsa4pi4Eh0gKdAQ5ypI6syb8n4KO9ZbMr1Llj4YAGPK5g
 rihcS8ZX5nN4GkjBdK3RdkuqI+aTEZfDUMUwsD21X05wqqDPBmngDnR2q5w8xPWb2zZH
 iWBn63y8lKoTgCvoVpdNzSavaWeMp68YW3mldqu6hYLQn2dLJc3d1as/f1oInUTZXiTK
 gOxqvvhY+8y8pm/XRHKtUNsKizTuo5em+Av3xcQqARxIEa7WX29JBox6TFvJ1m9MqrIM
 s+v6Htfc0KDF5VZq874WXBKQpd85B75XQXpT60MDbayDC728ePAh9QEUFFzeWrL4TFgf
 Y7Jw==
X-Gm-Message-State: APjAAAVH3tR8v0MyGF1FtaDSkuEzXkhZ6Y9VP5C6vAiVoXDuFQkkpTfB
 PL2ISigPDDatXc71k2eoSiYFtz+aLDh8+NI0LDE=
X-Google-Smtp-Source: APXvYqwrLDZZE200r2C+elUMzmOCVxO8hyx3A20LHhwyDoaM6wZrEkxOV2oyAXdmX+YKNvhM5HjYqhgjYlm1PwSd70Q=
X-Received: by 2002:a9f:21f6:: with SMTP id 109mr2613378uac.109.1569607633260; 
 Fri, 27 Sep 2019 11:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <ec6739a5-af3a-0aeb-fdae-dd11d6b2ec1f@gmail.com>
 <CACAvsv7jwLeY04SyaGjPcRN-ZPaGdVUUY6tC5q33kSsdwJumdg@mail.gmail.com>
In-Reply-To: <CACAvsv7jwLeY04SyaGjPcRN-ZPaGdVUUY6tC5q33kSsdwJumdg@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 27 Sep 2019 14:07:01 -0400
Message-ID: <CAKb7UvjK4rKO10FxRAG_zTp_JanivLR2YjngAErn0zyVdrJXUw@mail.gmail.com>
Subject: Re: [Nouveau] Is Nouveau really using the io_reserve_lru?
To: Ben Skeggs <skeggsb@gmail.com>
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgNTo0NCBQTSBCZW4gU2tlZ2dzIDxza2VnZ3NiQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDI0IFNlcCAyMDE5IGF0IDIyOjE5LCBDaHJpc3RpYW4g
S8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4g
PiBIaSBndXlzLAo+ID4KPiA+IHdoaWxlIHdvcmtpbmcgdGhyb3VnaCBtb3JlIG9sZCBUVE0gZnVu
Y3Rpb25hbGl0eSBJIHN0dW1ibGVkIG92ZXIgdGhlCj4gPiBpb19yZXNlcnZlX2xydS4KPiA+Cj4g
PiBCYXNpYyBpZGVhIGlzIHRoYXQgd2hlbiB0aGlzIGZsYWcgaXMgc2V0IHRoZSBkcml2ZXItPmlv
X21lbV9yZXNlcnZlKCkKPiA+IGNhbGxiYWNrIGNhbiByZXR1cm4gLUVBR0FJTiByZXN1bHRpbmcg
aW4gdW5tYXBwaW5nIG9mIG90aGVyIEJPcy4KPiA+Cj4gPiBCdXQgTm91dmVhdSBkb2Vzbid0IHNl
ZW0gdG8gcmV0dXJuIC1FQUdBSU4gaW4gdGhlIGNhbGwgcGF0aCBvZgo+ID4gaW9fbWVtX3Jlc2Vy
dmUgYW55d2hlcmUuCj4gSSBiZWxpZXZlIHRoaXMgaXMgYSBidWcgaW4gTm91dmVhdS4gIFdlICpz
aG91bGQqIGJlIHJldHVybmluZyAtRUFHQUlOCj4gaWYgd2UgZmFpbCB0byBmaW5kIHNwYWNlIGlu
IEJBUjEgdG8gbWFwIHRoZSBCTyBpbnRvLgoKQ291bGQgdGhpcyBsZWFkIHRvIFNJR0JVUyBpbiB1
c2Vyc3BhY2UsIGVzcCByZWxhdGVkIHRvIHJlc3VtZSBhbmQKc2ltaWxhciBzaXR1YXRpb25zPyBB
IHVzZXIgaGFzIGJlZW4gZXhwZXJpZW5jaW5nIHRoaXMgaW4gYQp0cmlja3ktdG8tcmVwcm9kdWNl
IHNjZW5hcmlvIHdpdGggYSB0b24gb2YgdnJhbSBkZWRpY2F0ZWQgdG8KZnJhbWVidWZmZXJzIGFu
ZCBzbyBvbiAoM3ggNEspLCBhbmQgdGhlIG5vdXZlYXUgZGR4IGZhbGxzIGJhY2sgdG8KbWVtY3B5
IGluIGNlcnRhaW4gY2FzZXMuCgogIC1pbGlhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
