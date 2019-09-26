Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DA5BFB4A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 00:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9136E046;
	Thu, 26 Sep 2019 22:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CBA6E046
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 22:21:02 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v24so526090ljj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 15:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ge4WC49pngiICthc1WDcavUjVJbMBv50VLzrcwA4/hc=;
 b=LHJ1iPxbmSruCiyZ+1luXorOEzsAuMP70GhdFlL/jrPeJEMojguZpjuwxfvR8Ugvwr
 9y3K/OVrJeMIdGqS1Ic184MPPwEtHgAGVXGzkP9hk4qvq3s2k1XA4sM2vbN+CP6P5IgH
 k64ODJPI303/sgcR2kG9B5dkNUgWPTCIHbBQiDrb438Jqf2qU+Hs4VDaRfeBEMA0cHze
 EA1zYjNVK8k+g34BtKt9IleNb8Hm+6m3B68CQ0ciioyHaT7aGGYi/J9z7FbLRm5K+bP4
 Am+z1LNIBGjkZk7opcP9NpHt2RLN5fKS42edUelECcUc86v9IaNCH0cBFt+zQyJevrqB
 6oIg==
X-Gm-Message-State: APjAAAU5p8+yuNN0v6dw1BCUPw+1K8n+uVD8yZvbPa4G/qvfZj/rnSaP
 91ADTLHylvI6IRZDi70g0580WD6Yhrw=
X-Google-Smtp-Source: APXvYqyecdk/cGSp6Mt91wqXz2CnCvaBhepaVrHCXtGVA59Z1R9sJ6OY/ZnSfwC+U5Gmagmsx+y4dw==
X-Received: by 2002:a2e:7611:: with SMTP id r17mr593551ljc.133.1569536459950; 
 Thu, 26 Sep 2019 15:20:59 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id 207sm106155lfn.0.2019.09.26.15.20.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2019 15:20:58 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id y127so400061lfc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 15:20:58 -0700 (PDT)
X-Received: by 2002:a19:741a:: with SMTP id v26mr487782lfe.79.1569536458354;
 Thu, 26 Sep 2019 15:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
 <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
 <c58cdb3d-4f5e-7bfc-06b3-58c27676d101@shipmail.org>
In-Reply-To: <c58cdb3d-4f5e-7bfc-06b3-58c27676d101@shipmail.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Sep 2019 15:20:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh_+Co=T8wG8vb5akMP=7H4BN=Qpq6PsKh8rcmT8MCV+Q@mail.gmail.com>
Message-ID: <CAHk-=wh_+Co=T8wG8vb5akMP=7H4BN=Qpq6PsKh8rcmT8MCV+Q@mail.gmail.com>
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ge4WC49pngiICthc1WDcavUjVJbMBv50VLzrcwA4/hc=;
 b=F0LSxC3wcSztazbG0uwCTRtKvGqprF/KA5I/kBqM8nEjAxsHAszHBhkaAnVSswq05I
 IPDhtPkVd/mlH10svz+m4SxGzJUZb8x7FqMDs4M8P0ZJ8e08izgtmsrZi+eLmVZ7fgoV
 8FC65G/EFwknPF5qvRjXEHu47uk9C2Rj8l8IE=
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
Cc: Linux-MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTo1NSBQTSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJl
KQo8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4KPiBXZWxsLCB3ZSdyZSB3b3JraW5n
IG9uIHN1cHBvcnRpbmcgaHVnZSBwdWRzIGFuZCBwbWRzIGluIHRoZSBncmFwaGljcwo+IFZNQXMs
IGFsdGhvdWdoIGluIHRoZSB3cml0ZS1ub3RpZnkgY2FzZXMgd2UncmUgbG9va2luZyBhdCBoZXJl
LCB3ZSB3b3VsZAo+IHByb2JhYmx5IHdhbnQgdG8gc3BsaXQgdGhlbSBkb3duIHRvIFBURSBsZXZl
bC4KCldlbGwsIHRoYXQncyB3aGF0IHRoZSBleGlzdGluZyB3YWxrZXIgY29kZSBkb2VzIGlmIHlv
dSBkb24ndCBoYXZlIHRoYXQKInB1ZF9lbnRyeSgpIiBjYWxsYmFjay4KClRoYXQgc2FpZCwgSSBh
c3N1bWUgeW91IHdvdWxkICpub3QqIHdhbnQgdG8gZG8gdGhhdCBpZiB0aGUgaHVnZQpwdWQvcG1k
IGlzIGFscmVhZHkgY2xlYW4gYW5kIHJlYWQtb25seSwgYnV0IGp1c3QgY29udGludWUuCgpTbyB5
b3UgbWF5IHdhbnQgdG8gaGF2ZSBhIHNwZWNpYWwgcHVkX2VudHJ5KCkgdGhhdCBoYW5kbGVzIHRo
YXQgY2FzZS4KRXZlbnR1YWxseS4gTWF5YmUuIEFsdGhvdWdoIGhvbmVzdGx5LCBpZiB5b3UncmUg
ZG9pbmcgZGlydHkgdHJhY2tpbmcsCkkgZG91YnQgaXQgbWFrZXMgbXVjaCBzZW5zZSB0byB1c2Ug
bGFyZ2VwYWdlcy4KCj4gTG9va2luZyBhdCB6YXBfcHVkX3JhbmdlKCkgd2hpY2ggd2hlbiBjYWxs
ZWQgZnJvbSB1bm1hcF9tYXBwaW5nX3BhZ2VzKCkKPiB1c2VzIGlkZW50aWNhbCBsb2NraW5nIChu
byBtbWFwX3NlbSksIGl0IHNlZW1zIHdlIHNob3VsZCBiZSBhYmxlIHRvIGdldAo+IGF3YXkgd2l0
aCBpX21tYXBfbG9jaygpLCBtYWtpbmcgc3VyZSB0aGUgd2hvbGUgcGFnZSB0YWJsZSBkb2Vzbid0
Cj4gZGlzYXBwZWFyIHVuZGVyIHVzLiBTbyBpdCdzIG5vdCBjbGVhciB0byBtZSB3aHkgdGhlIG1t
YXBfc2VtIGlzIHN0cmljdGx5Cj4gbmVlZGVkIGhlcmUuIEJldHRlciB0byBzb3J0IHRob3NlIHJl
c3RyaWN0aW9ucyBvdXQgbm93IHJhdGhlciB0aGFuIHdoZW4KPiBodWdlIGVudHJpZXMgc3RhcnQg
YXBwZWFyaW5nLgoKemFwX3B1ZF9yYW5nZSgpYWN0dWFsbHkgZG9lcyBoYXZlIHRoYXQKCiAgICAg
ICAgICAgICAgIFZNX0JVR19PTl9WTUEoIXJ3c2VtX2lzX2xvY2tlZCgmdGxiLT5tbS0+bW1hcF9z
ZW0pLCB2bWEpOwoKZXhhY3RseSBmb3IgdGhlIGNhc2Ugd2hlcmUgaXQgbWlnaHQgaGF2ZSB0byBz
cGxpdCB0aGUgcHVkIGVudHJ5LgoKWmFwcGluZyB0aGUgd2hvbGUgdGhpbmcgaXQgZG9lcyBkbyB3
aXRob3V0IHRoZSBhc3NlcnQuCgpJJ20gbm90IGdvaW5nIHRvIHN3ZWFyIHRoZSBtbWFwX3NlbSBp
cyBhYnNvbHV0ZWx5IHJlcXVpcmVkLCBzaW5jZSBhCnNoYXJlZCB2bWEgc2hvdWxkIGJlIHN0YWJs
ZSBkdWUgdG8gdGhlIGlfbW1hcF9sb2NrLCBidXQgc3BsaXR0aW5nIHRoZQpodWdlcGFnZSByZWFs
bHkgaXMgYSBmYWlybHkgYmlnIGRlYWwuCgpJdCBjYW4ndCBoYXBwZW4gaWYgeW91IHphcCB0aGUg
Kndob2xlKiBtYXBwaW5nLCBidXQgaXQgY2FuIGhhcHBlbiBpZgp5b3UgaGF2ZSBhIHN0YXJ0L2Vu
ZCByYW5nZS4gTGlrZSB5b3UgZG8uCgpBbHNvLCBpbiBnZW5lcmFsIGl0J3MgcHJvYmFibHkgbm90
IGEgZ3JlYXQgaWRlYSB0byBsb29rIGF0CnphcF9wYWdlX3JhbmdlKCkgKGFuZCBjb3B5X3BhZ2Vf
cmFuZ2UoKSkgZm9yIGlkZWFzLgoKVGhleSBhcmUga2luZCBvZiBzcGVjaWFsLCBzaW5jZSB0aGV5
IHRlbmQgdG8gYmUgdXNlZCBmb3IgZnVuZGFtZW50YWwKd2hvbGUtYWRkcmVzcy1zcGFjZSBvcGVy
YXRpb25zIChpZSBmb3JrL2V4aXQpIGFuZCBzbyBhcyBhIHJlc3VsdCB0aGV5CmdldCB0byBkbyBz
cGVjaWFsIHRoaW5ncyB0aGF0IGEgbm9ybWFsIHBhZ2Ugd2Fsa2VyIGdlbmVyYWxseSBzaG91bGRu
J3QKZG8uCgpJdCdzIHdoeSB0aGV5J3ZlIG5ldmVyIGdvdHRlbiB0cmFuc2xhdGVkIHRvIHVzZSB0
aGUgZ2VuZXJpYyB3YWxrZXIgY29kZS4KCiAgICAgICAgICAgTGludXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
