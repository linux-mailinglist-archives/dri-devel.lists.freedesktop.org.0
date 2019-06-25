Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5385642C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D836E2E0;
	Wed, 26 Jun 2019 08:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7762D6E0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:48:58 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id k20so784113ios.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 06:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0GZB7vPzRz7lX9qbxkSEpP1KLhPlWAT4/FgiLzGhH+s=;
 b=RCui7Mwp61vQr2G85op04QD5xMDTKAjbjKln7dNzd4ilxUZojW6GDyeeL9eq9PuvQB
 LCVaaQ2WPK57zjpo1oFAs0mBDzJyQwsA8FK4rsf00cCvIIXg6r1pIOf7fxvteqogg6lm
 OPBAz0oBsYO7JS3Jq5zoHbB6Di2/T7J/l3VktAvaNmOrHA6b5YnQSzRF6ttaj538GJRX
 QYBTZHyAcRYa4jUUTWArLUP7LQNQ9g1tSQxiNhovJ026w2VzRiTWdVCVQF+Iy9fjkLPV
 NTF++FzJgDL9ED5nJG1Ec4FCSGz2sgybWpTs5Zn6wgLJ27et6SBXKAlTYj9cO1daBT0d
 KYfQ==
X-Gm-Message-State: APjAAAWn7PIo4c6d4t5KTFVJUEof8UKkPD7Bm9zfEu1LN8KhZZ98FItH
 WaHeu1L7BjBcoLszT/9pXDePOuKt2Pyvf2hs6S+Jcg==
X-Google-Smtp-Source: APXvYqxZXtosOMgMyOjQCcCtq+V7ie85OCZKFxgrYamt76zeQqFJw1tOsZ7F8w3e+47pEtLQnoEgW2aOruUNwGm/lSM=
X-Received: by 2002:a02:554a:: with SMTP id e71mr31810557jab.144.1561470537559; 
 Tue, 25 Jun 2019 06:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
 <20190624160330.38048-4-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190624160330.38048-4-hverkuil-cisco@xs4all.nl>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Tue, 25 Jun 2019 15:48:46 +0200
Message-ID: <CALFZZQGDAxTMk1uVVNwXZRVqsgLULmrCQF_BznpYL1MdSGgu6g@mail.gmail.com>
Subject: Re: [PATCHv8 03/13] cec: add new notifier functions
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0GZB7vPzRz7lX9qbxkSEpP1KLhPlWAT4/FgiLzGhH+s=;
 b=r1rdcjeXi4MAwAvMD46wul0KccgFY0EgllO1e9xUMldteC7SW/pHDO3uvCrEiKmgGm
 aeFrfHq7saV5CRGC8Mz5umOUNpPmMbZXsMLqBS7ucu1YSLhevwBnGhM2FGo1ozCAQWR6
 1wnuRW3oW2HVeeVkRJXe3Y4aumn+LpEdPss5UyvBVSp3Q8TL/nislh28U3UKaH3uscsh
 7j4FlrKstl88AlccywZ5TdgX2fLFN7WMgqbGU5+7VAKnIYwNW7hrROX+njb6Cq8hz31c
 9++qX0i7JwQZB+cQp2yjIREQSQWyeGIyt/d9qm83GBBsgYTMzx/dtL0FED0FW4cjbL5U
 poXA==
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
Cc: Cheng-yi Chiang <cychiang@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8uCgpTb21lIHNtYWxsIGNvbW1lbnRzL3F1ZXN0aW9ucy4KCk9uIE1vbiwgSnVuIDI0LCAy
MDE5IGF0IDY6MDMgUE0gSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+IHdy
b3RlOgo+Ci4uLgo+IEBAIC0yMiw5ICsyMiwxMSBAQCBzdHJ1Y3QgY2VjX25vdGlmaWVyIHsKPiAg
ICAgICAgIHN0cnVjdCBsaXN0X2hlYWQgaGVhZDsKPiAgICAgICAgIHN0cnVjdCBrcmVmIGtyZWY7
Cj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlICpoZG1pX2RldjsKPiArICAgICAgIHN0cnVjdCBjZWNf
Y29ubmVjdG9yX2luZm8gY29ubl9pbmZvOwo+ICAgICAgICAgY29uc3QgY2hhciAqY29ubl9uYW1l
Owo+ICAgICAgICAgc3RydWN0IGNlY19hZGFwdGVyICpjZWNfYWRhcDsKPiAgICAgICAgIHZvaWQg
KCpjYWxsYmFjaykoc3RydWN0IGNlY19hZGFwdGVyICphZGFwLCB1MTYgcGEpOwo+ICsgICAgICAg
Ym9vbCBjYWxsZWRfY2VjX25vdGlmaWVyX3JlZ2lzdGVyOwpJZiBJIHJlYWQgaGlzIGNvcnJlY3Rs
eSBjYWxsYmFjayBpcyBzZXQgb25seSBieSBjZWNfbm90aWZpZXJfcmVnaXN0ZXIKKGFuZCBub3Qg
YnkgdGhlIGNlY19ub3RpZmllcl9jZWNfYWRhcF9yZWdpc3Rlcikgc28gbWF5YmUgdGhhdCBib29s
ZWFuCmlzIG5vdCBuZWVkZWQgYW5kIGp1c3QgY2hlY2tpbmcgaWYgdGhlIGNhbGxiYWNrIGlzIHNl
dCBpcyBlbm91Z2ggdG8KdGVsbCB0aG9zZSAyIGNhc2VzIGFwYXJ0PwoKLi4uCj4gK3N0cnVjdCBj
ZWNfbm90aWZpZXIgKgo+ICtjZWNfbm90aWZpZXJfY2VjX2FkYXBfcmVnaXN0ZXIoc3RydWN0IGRl
dmljZSAqaGRtaV9kZXYsIGNvbnN0IGNoYXIgKmNvbm5fbmFtZSwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGNlY19hZGFwdGVyICphZGFwKQo+ICt7Cj4gKyAgICAgICBz
dHJ1Y3QgY2VjX25vdGlmaWVyICpuOwo+ICsKPiArICAgICAgIGlmIChXQVJOX09OKCFhZGFwKSkK
PiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKwo+ICsgICAgICAgbiA9IGNlY19ub3Rp
Zmllcl9nZXRfY29ubihoZG1pX2RldiwgY29ubl9uYW1lKTsKPiArICAgICAgIGlmICghbikKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIG47Cj4gKwo+ICsgICAgICAgbXV0ZXhfbG9jaygmbi0+bG9j
ayk7Cj4gKyAgICAgICBuLT5jZWNfYWRhcCA9IGFkYXA7Cj4gKyAgICAgICBhZGFwLT5jb25uX2lu
Zm8gPSBuLT5jb25uX2luZm87CldvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gdXNlIGNlY19zX2Nvbm5f
aW5mbz8gVGhlcmUgaXMgYSBjZXJ0YWluCmFzeW1tZXRyeSBoZXJlICAtIGNlY19zX3BoeXNfYWRk
ciBpcyB1c2VkIHRvIGNvbmZpZ3VyZSBwaHlzaWNhbAphZGRyZXNzLCB3aGljaCBhbHNvIHRha2Vz
IHRoZSBhZGFwdGVyJ3MgbG9jayB3aGlsZSBzZXR0aW5nIHRoZQpwaHlzaWNhbCBhZGRyZXNzLiBU
aGF0IGxvY2sgaXMgbm90IHRha2VuIHdoaWxlIHRoZSBjb25uZWN0b3IgaW5mbyBpcwpiZWluZyBz
ZXQgKG5vdCBzdXJlIGlmIHRoYXQgcmVhbGx5IG1hdHRlcnMgZm9yIHRoZSBjb2RlIHBhdGhzIHRo
YXQKd291bGQgY2FsbCBpbnRvIHRoaXMgZnVuY3Rpb24pLgoKPiArICAgICAgIGFkYXAtPm5vdGlm
aWVyID0gbjsKPiArICAgICAgIGNlY19zX3BoeXNfYWRkcihhZGFwLCBuLT5waHlzX2FkZHIsIGZh
bHNlKTsKPiArICAgICAgIG11dGV4X3VubG9jaygmbi0+bG9jayk7Cj4gKyAgICAgICByZXR1cm4g
bjsKPiArfQo+ICtFWFBPUlRfU1lNQk9MX0dQTChjZWNfbm90aWZpZXJfY2VjX2FkYXBfcmVnaXN0
ZXIpOwo+ICsKPiArdm9pZCBjZWNfbm90aWZpZXJfY2VjX2FkYXBfdW5yZWdpc3RlcihzdHJ1Y3Qg
Y2VjX25vdGlmaWVyICpuKQo+ICt7Cj4gKyAgICAgICBpZiAoIW4pCj4gKyAgICAgICAgICAgICAg
IHJldHVybjsKPiArCj4gKyAgICAgICBtdXRleF9sb2NrKCZuLT5sb2NrKTsKPiArICAgICAgIG1l
bXNldCgmbi0+Y2VjX2FkYXAtPmNvbm5faW5mbywgMCwgc2l6ZW9mKG4tPmNlY19hZGFwLT5jb25u
X2luZm8pKTsKQ291bGQgY2VjX3NfY29ubl9pbmZvIGJlIHVzZWQgdG8gcmVzZXQgdGhlIGNvbm5l
Y3RvciBpbmZvPwpBbHNvLCB3ZSBleHBsaWNpdGx5IGNsZWFyIGNvbm5lY3RvciBpbmZvIGhlcmUu
IFNpbmNlIHRoZSBub3RpZmllcgpwcm92aWRlcyBib3RoIGNvbm5lY3RvciBpbmZvIGFuZCBwaHlz
aWNhbCBhZGRyZXNzLCBtYXliZSBpdCB3b3VsZCBtYWtlCnNlbnNlIHRvIGNsZWFyIHBoeXNpY2Fs
IGFkZHJlc3MgYXMgd2VsbD8KCgouLi4KPiAgdm9pZCBjZWNfbm90aWZpZXJfdW5yZWdpc3Rlcihz
dHJ1Y3QgY2VjX25vdGlmaWVyICpuKQo+ICB7Cj4gKyAgICAgICAvKiBEbyBub3RoaW5nIHVubGVz
cyBjZWNfbm90aWZpZXJfcmVnaXN0ZXIgd2FzIGNhbGxlZCBmaXJzdCAqLwo+ICsgICAgICAgaWYg
KCFuLT5jYWxsZWRfY2VjX25vdGlmaWVyX3JlZ2lzdGVyKQpDb3VsZCB0aGlzIGNoZWNrIGJlIG1h
ZGUgd2l0aCBuLT5sb2NrIGhlbGQ/IGNlY19ub3RpZmllcl9yZWdpc3RlciBzZXRzCnRoaXMgdmFs
dWUgd2hpbGUgaG9sZGluZyB0aGF0IGxvY2suCi4uLgoKClRoYW5rIHlvdS4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
