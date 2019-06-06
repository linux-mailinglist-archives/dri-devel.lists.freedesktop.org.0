Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DC437911
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 18:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ECE891DA;
	Thu,  6 Jun 2019 16:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB914891DA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 16:04:26 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id l73so546615vkl.8
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 09:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g2aliS02szEeQuthglE8oZKKoF4MRMJxSZ/10husKfU=;
 b=n+2uTXvXlUxtQSpsQDrQozFfCRAZbOLAE/i4jA12UM7hFnBJaDpRLOYNEpXmZtjy/M
 3MTdgTRmjkZdjpEWiVswCeiZ6ZzTrQO1Y2bq12cx13zOM5N9RVpHdW+mKpSLu+Seb1g8
 3T6Pm3l1Nd2heXwD9rx8NLbxdusswnDR8tElSn4ejd7fgmlSra2v4mR/1kR7kTmgPcpu
 mQkJNSao0GzTmRezrNvicrIYcryrTtf7oQOYacaV5OvtXHiFnYpDy0pi3TXFdHlRCOYt
 +/MPeekcu77gZ68+l01jZPNaG9DTdwdZ0zJFuRNTZhl0VHqfvKtmmYC2lUDzZtcBPsVT
 oY7A==
X-Gm-Message-State: APjAAAVA736jYmg1aRteZ6ssD7rCI8OyNbfNVfQli4wepyenAsfWqHE/
 a9UTzxSmTIcfLzbYSu3AhCnSYLgjLFUXYHl7pVUfgw==
X-Google-Smtp-Source: APXvYqwX0ArCxm1YjNno/y4oJeVlZswvB0eEdKXxil23PXA4MiRA0ssMfCr2FZe/ZnDoatEoU/poZQKyCSmhtdpy3vo=
X-Received: by 2002:a1f:14c1:: with SMTP id 184mr18829030vku.69.1559837065728; 
 Thu, 06 Jun 2019 09:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190603004017.7114-1-imirkin@alum.mit.edu>
 <CACvgo52JReikY-Nw_DOsAu6QYf-AaG8d4OKhoD=W68fQR3QSGg@mail.gmail.com>
In-Reply-To: <CACvgo52JReikY-Nw_DOsAu6QYf-AaG8d4OKhoD=W68fQR3QSGg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 6 Jun 2019 17:02:34 +0100
Message-ID: <CACvgo53xU-_9vBWkCWaJHyMhJmAMe1fZQ8qY9r2tD2Ay23KBTA@mail.gmail.com>
Subject: Re: [PATCH libdrm 00/10] Add C8, 30bpp and FP16 support to modetest
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=g2aliS02szEeQuthglE8oZKKoF4MRMJxSZ/10husKfU=;
 b=hB95qoFT7tlU5KImy4F/28n47Ugx8NgV7f9oqHDBLAiYjzvb5vjC69U3WfNfmCLO0E
 t4nGVG9S9WsdbSf16x9vEkFOVVFgdHUKOmjLqckS3Yqa59v6ZXa2lVnHWXUsPj0pIEzL
 N4JDtKDi1pRoAuIQ/afWBtnDHBVfk9ytwXpr37JmYFESZqA3zAvaOz+gDN2WB4TGrHAk
 MpVMY3qVkqHbCp50EceSbuJ8JN4MBvX+wofo8MlE3GgqWkKwJr3bAgc0Y7eckUuD1AME
 PU5pwQnA97ZYBG4JpWfIje64PaV/B01jRY3BAPfj5yhD/ufYbz7aqGQ9wyH+2ng/9nd9
 PP7g==
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

T24gVGh1LCA2IEp1biAyMDE5IGF0IDE2OjU0LCBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDMgSnVuIDIwMTkgYXQgMDE6NDAsIElsaWEg
TWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBzZXJpZXMg
aW1wcm92ZXMgdGhlIHBhdHRlcm4gZ2VuZXJhdGlvbiBsb2dpYyB0byBzdXBwb3J0IGFkZGl0aW9u
YWwKPiA+IGZvcm1hdHMsIGFzIHdlbGwgYXMgYSBuZXcgImdyYWRpZW50IiBwYXR0ZXJuIChzZWUg
cGF0Y2ggY29tbWVudHMgb24gd2h5Cj4gPiBJIGZvdW5kIGl0IHVzZWZ1bCkuCj4gPgo+ID4gRnVy
dGhlcm1vcmUsIHRoZXNlIGZvcm1hdHMgYXJlIHBpcGVkIHRocm91Z2ggdG8gbW9kZXRlc3QsIGlu
Y2x1ZGluZyB0aGUKPiA+IGFiaWxpdHkgdG8gc2V0IGEgZ2FtbWEgdGFibGUsIHdoaWNoIGlzIG5l
Y2Vzc2FyeSBmb3IgdGhlIEM4IGluZGV4ZWQKPiA+IGZvcm1hdC4KPiA+Cj4gPiBUaGlzIHdhcyB0
ZXN0ZWQgb24gbm91dmVhdSwgYW5kIHVzZWQgZm9yIGJyaW5nLXVwIG9mIHRoZSBDOCwgWEIzMCwg
YW5kCj4gPiBGUDE2IGZvcm1hdHMgb24gdGhlIE5WSURJQSBoYXJkd2FyZSB0aGF0IHN1cHBvcnRz
IHRoZXNlLgo+ID4KPiA+IElsaWEgTWlya2luICgxMCk6Cj4gPiAgIHV0aWw6IGFkZCBDOCBmb3Jt
YXQsIHN1cHBvcnQgaXQgd2l0aCBTTVBURSBwYXR0ZXJuCj4gSSBkaWQgbm90IHZlcmlmeSB0aGUg
bnVtYmVycyBpbiB0aGlzIHBhdGNoLCBidXQgaXQgbG9va3MgcmVhc29uYWJsZToKPiBBY2tlZC1i
eTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPgo+ID4gICB1dGls
OiBmaXggTUFLRV9SR0JBIG1hY3JvIGZvciAxMGJwcCBtb2Rlcwo+ID4gICB1dGlsOiBhZGQgZ3Jh
ZGllbnQgcGF0dGVybgo+ID4gICB1dGlsOiBhZGQgZnAxNiBmb3JtYXQgc3VwcG9ydAo+ID4gICB1
dGlsOiBhZGQgY2Fpcm8gZHJhd2luZyBmb3IgMzBicHAgZm9ybWF0cyB3aGVuIGF2YWlsYWJsZQo+
ID4gICBtb2RldGVzdDogZG9uJ3QgcHJldGVuZCB0aGF0IGF0b21pYyBtb2RlIGluY2x1ZGVzIGEg
Zm9ybWF0Cj4gVGhlcmUgYSBzbWFsbCwgd291bGQgYmUgZ3JlYXQgYnV0IG5vdCByZXF1aXJlZCwg
Y29tbWVudCBoZXJlIChwYXJ0IG9mCj4gd2hpY2ggeW91IGFkZHJlc3NlZCB3aXRoIGluIDA4LzEw
KQo+CkdyciBzY3JhdGNoIHRoYXQgcGFydCBhYm91dCAwOC8xMCAtIEkgbWlzcmVhZCB0aGUgZm9y
bWF0X3N0ciBwYXJzaW5nLgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
