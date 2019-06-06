Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9172F37889
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 17:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F101889812;
	Thu,  6 Jun 2019 15:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2F089812
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 15:51:22 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id l125so1479564vsl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 08:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dF1UFT5NW95HsEcyCk7i5jyGDEosKyiOAiTL2nXBtWI=;
 b=FXeWq1EnuaGyExjH09AHV7LxXYa6U8X7F7gKoU5is+bkKuDfkwDWKZ1NMikQBUtgrI
 ZviYAW2LcQJ3tME7tkm0HpLVDlVgnBIXqjA8LVXR6dRE15k3UrCyehRl78aIHa9QW5Gv
 dNJRcgFzIyJMQId++WbU8ngg3S5/ugnPcjoqr7NjWufN9GXvDWuaaCwx8afegW5xHzcp
 2m9JD1/9FlY7jcEVCnDeeSeyrFNvL3wy2/BbCSkmCReKldNGoLBOvnw1d9akdCRfK7HX
 NRIpYavTvuK9fF+HXCZ1qLrQ66P7H/jtpXDqVe6yfsFREB2ptundiUJpsKSh6PH03WTR
 g+iw==
X-Gm-Message-State: APjAAAX4ieLke1KzpoMUHAJr9bnERgnqPc5Nt7xPNPcne14SwMLaPQ+m
 gNJnwYVYVEAKaR5PXfYfSy5qmqDfxxjGTxfyq0w=
X-Google-Smtp-Source: APXvYqwvhMZoxz3mM8AXuAeZnYQ0hiSKEmXyJpLbAqyutL7W66tumqnlfY7qpDxqKdNb907f/Nmlh6FDdLZWXSHptNk=
X-Received: by 2002:a67:e918:: with SMTP id c24mr24640997vso.138.1559836281366; 
 Thu, 06 Jun 2019 08:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190603004017.7114-1-imirkin@alum.mit.edu>
 <20190603004017.7114-7-imirkin@alum.mit.edu>
In-Reply-To: <20190603004017.7114-7-imirkin@alum.mit.edu>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 6 Jun 2019 16:49:29 +0100
Message-ID: <CACvgo51bT7Ut+Bh3hi-QUG1YSmtrY-LVwF23Wdv39fEWZuiptQ@mail.gmail.com>
Subject: Re: [PATCH libdrm 06/10] modetest: don't pretend that atomic mode
 includes a format
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dF1UFT5NW95HsEcyCk7i5jyGDEosKyiOAiTL2nXBtWI=;
 b=pOthgSq7UaxiQYFLjceNOtFJmSVvINUYNL29IzIb7R8dw7fy8anScA0hg4Q07ldhUV
 yOeNlrBvDR52UDZpu48Ng1XvYmqqslpuCOu0+Ru0gcdrnGKq2AZyHoyZGWnLBI0aeSDn
 DvIvmL2GEnv4aRCah5B6ESaNdi49EslkZDKqup0Zo7Zd1R+z3HIRkjNxaGSACtMT7x6Q
 qwcqhG+M8dVDsF5t2S7ZQPQnfHk8NwtFxzw7yWMBI/HUtMPQJhB585k3Eo6ci3FPHBmH
 sZh40WzgRUolB5ZSBhRK8wLTC+mJSELRF23FDV9IBzu4Vyt4hiDyuuHMpR3+XXWKuOTi
 gPTg==
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

T24gTW9uLCAzIEp1biAyMDE5IGF0IDAxOjQwLCBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1p
dC5lZHU+IHdyb3RlOgo+Cj4gU2lnbmVkLW9mZi1ieTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1
bS5taXQuZWR1Pgo+IC0tLQo+ICB0ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jIHwgNCArKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYyBiL3Rlc3RzL21vZGV0ZXN0L21vZGV0
ZXN0LmMKPiBpbmRleCA5Yzg1YzA3Yi4uYTFjODFmNmMgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvbW9k
ZXRlc3QvbW9kZXRlc3QuYwo+ICsrKyBiL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMKPiBAQCAt
MTMzNSw4ICsxMzM1LDggQEAgc3RhdGljIHZvaWQgYXRvbWljX3NldF9tb2RlKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IHBpcGVfYXJnICpwaXBlcywgdW5zaWduZWQKPiAgICAgICAgICAgICAg
ICAgaWYgKHBpcGUtPm1vZGUgPT0gTlVMTCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250
aW51ZTsKPgo+IC0gICAgICAgICAgICAgICBwcmludGYoInNldHRpbmcgbW9kZSAlcy0lZEh6QCVz
IG9uIGNvbm5lY3RvcnMgIiwKPiAtICAgICAgICAgICAgICAgICAgICAgIHBpcGUtPm1vZGVfc3Ry
LCBwaXBlLT5tb2RlLT52cmVmcmVzaCwgcGlwZS0+Zm9ybWF0X3N0cik7Cj4gKyAgICAgICAgICAg
ICAgIHByaW50Zigic2V0dGluZyBtb2RlICVzLSVkSHogb24gY29ubmVjdG9ycyAiLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgcGlwZS0+bW9kZV9zdHIsIHBpcGUtPm1vZGUtPnZyZWZyZXNoKTsK
CkFGQUlDVCB3ZSBjYW4gZHJvcCB0aGUgZm9ybWF0IG9uIG1vZGVzZXQgYWxsIHRvZ2V0aGVyLiBJ
IGNhbm5vdCBzZWUKYW55dGhpbmcgdGhhdCB3b3VsZCByZXF1aXJlIGl0IC0gcmVnYXJkbGVzcyBp
ZiB0aGUgbW9kZXNldCBpcyBhdG9taWMKb3Igbm90LgpQbHVzIHdlIGNhbiByZW1vdmUgdGhlIC0t
aGVscCBzdHJpbmcgYW5kIGFyZ3VtZW50IHBhcnNpbmcgY29kZS4KCkNhbiBJIGludGVyZXN0IHlv
dSBpbiBkb2luZyB0aGF0PwoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
