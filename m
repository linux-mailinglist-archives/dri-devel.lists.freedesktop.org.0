Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7113792B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 18:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872DF892BB;
	Thu,  6 Jun 2019 16:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF80892BB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 16:07:39 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id r7so1062033ual.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 09:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yxn+YHpXxxVnUyVjMzaOkmFzvbEZQtQe2Uti2zw7PgA=;
 b=B4C99wOwHPYl/t4liTjmeZ94GI6F6/MngIM1rTf2pr+pgjOqe6bNHesG/z/jOIYqhZ
 8koYs0X7vyoTAqpDiE0SnNKadhnCz2uS6yxIYJl+I/mMFv12wd/Slu5BNEltK/tie5oK
 etK3Rq8s+FgXmN7W/D4z3OSJN92FUWoebuQjD5A+0/D+CN+mPk0XWJSWO6NGyIH7/Bdh
 nszCqy7NLKDBQeR2zFut1/2D7y+iNTlbcTN75/2Fnmsx/rrsJ8pXEOP58Cencs2ar3OO
 x/R8SPjXJsgTD0EvBgsPcUsjIBjfUghVtEoPtdJlKiG3vcsxRyOmzmq3191nfjMZb7YQ
 iZdw==
X-Gm-Message-State: APjAAAXONrD7EoxRJ4SPasy4jUQBijYxLPmmJdKHWoQ6AloABhrOIHC9
 GS7hm8PA63C7oZgxLofDE7/7IqeyZduEkNo9pXI=
X-Google-Smtp-Source: APXvYqx5UD3/g8pOBCRvL2EuY7coBQ1FuY7TEd7U7TEUs6X/jemMiGK9vl7RE/Z9Iuzmv8ffXaxLzDhQXsGdXILxTA4=
X-Received: by 2002:ab0:644d:: with SMTP id j13mr23445697uap.98.1559836709318; 
 Thu, 06 Jun 2019 08:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190603004017.7114-1-imirkin@alum.mit.edu>
 <20190603004017.7114-7-imirkin@alum.mit.edu>
 <CACvgo51bT7Ut+Bh3hi-QUG1YSmtrY-LVwF23Wdv39fEWZuiptQ@mail.gmail.com>
In-Reply-To: <CACvgo51bT7Ut+Bh3hi-QUG1YSmtrY-LVwF23Wdv39fEWZuiptQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 6 Jun 2019 11:58:18 -0400
Message-ID: <CAKb7UvggsQ4mT-Rs6+BJNUgcGBmi7MXuPeDedgG4Dro0VMFLLg@mail.gmail.com>
Subject: Re: [PATCH libdrm 06/10] modetest: don't pretend that atomic mode
 includes a format
To: Emil Velikov <emil.l.velikov@gmail.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCAxMTo1MSBBTSBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxp
a292QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDMgSnVuIDIwMTkgYXQgMDE6NDAsIEls
aWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4gd3JvdGU6Cj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1Pgo+ID4gLS0tCj4gPiAgdGVz
dHMvbW9kZXRlc3QvbW9kZXRlc3QuYyB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL21v
ZGV0ZXN0L21vZGV0ZXN0LmMgYi90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCj4gPiBpbmRleCA5
Yzg1YzA3Yi4uYTFjODFmNmMgMTAwNjQ0Cj4gPiAtLS0gYS90ZXN0cy9tb2RldGVzdC9tb2RldGVz
dC5jCj4gPiArKysgYi90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCj4gPiBAQCAtMTMzNSw4ICsx
MzM1LDggQEAgc3RhdGljIHZvaWQgYXRvbWljX3NldF9tb2RlKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IHBpcGVfYXJnICpwaXBlcywgdW5zaWduZWQKPiA+ICAgICAgICAgICAgICAgICBpZiAo
cGlwZS0+bW9kZSA9PSBOVUxMKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7
Cj4gPgo+ID4gLSAgICAgICAgICAgICAgIHByaW50Zigic2V0dGluZyBtb2RlICVzLSVkSHpAJXMg
b24gY29ubmVjdG9ycyAiLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICBwaXBlLT5tb2RlX3N0
ciwgcGlwZS0+bW9kZS0+dnJlZnJlc2gsIHBpcGUtPmZvcm1hdF9zdHIpOwo+ID4gKyAgICAgICAg
ICAgICAgIHByaW50Zigic2V0dGluZyBtb2RlICVzLSVkSHogb24gY29ubmVjdG9ycyAiLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICBwaXBlLT5tb2RlX3N0ciwgcGlwZS0+bW9kZS0+dnJlZnJl
c2gpOwo+Cj4gQUZBSUNUIHdlIGNhbiBkcm9wIHRoZSBmb3JtYXQgb24gbW9kZXNldCBhbGwgdG9n
ZXRoZXIuIEkgY2Fubm90IHNlZQo+IGFueXRoaW5nIHRoYXQgd291bGQgcmVxdWlyZSBpdCAtIHJl
Z2FyZGxlc3MgaWYgdGhlIG1vZGVzZXQgaXMgYXRvbWljCj4gb3Igbm90Lgo+IFBsdXMgd2UgY2Fu
IHJlbW92ZSB0aGUgLS1oZWxwIHN0cmluZyBhbmQgYXJndW1lbnQgcGFyc2luZyBjb2RlLgo+Cj4g
Q2FuIEkgaW50ZXJlc3QgeW91IGluIGRvaW5nIHRoYXQ/CgpUaGUgZm9ybWF0IHBsYXlzIHdpdGgg
YSBub24tYXRvbWljIG1vZGVzZXQuIEl0J3MgdXNlZCBmb3IgdGhlIGZiIHRoYXQKZ2V0cyBhZGRl
ZC4KCiAgLWlsaWEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
