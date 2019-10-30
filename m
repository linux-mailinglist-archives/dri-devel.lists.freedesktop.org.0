Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C4AEAC26
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EC36EDD3;
	Thu, 31 Oct 2019 09:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0EF6ED6F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 22:07:03 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id s4so4390459ljj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 15:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fAg8Bb4wqLwYYzNjGHZzsgtpMfuQhfeM9UI/7lXspCw=;
 b=hO0a+sNslJfseh9WH/rGq7B9tfpuTHyE//Aup0pLzYbgfvhrv++l6PawqtPJU5UuME
 tMSXsOnBoM+dVd2XejQWc6IvHaj2iaGoiHMra6pCRAaTsgCKelGzusSFzFDBJEzRY+ji
 UTcBGABxOC5xnwP4yH48jU0fDUP53T+oGLSjxbtx86mzZe7TYALrHrB1bQhRfPqGx3Ma
 6fukkn/HaiZHXmBpNbDJQ8A+ZQECZP9mOr91PTqjyfmp8SMQ/evN74FQjHi1ymgmvtDT
 Wj94DOlBnqnvSiEaN7PsMbnQN/Qo7G9UC4ChAJJIms9DuIg3C8TWQvjk/KPJIk/kWjvJ
 ouqA==
X-Gm-Message-State: APjAAAUNKuwepRbAt+PEs11tbWTDpM4b24YuMUZXdqBRgHmsyLq0HzXo
 G++04Ny7cmTlmRmHP2h8R4KkZdBEsnn+ng2hywvc
X-Google-Smtp-Source: APXvYqyxYfO/UWwq6wqm7txzrJYuQYrvTZgmLRGyljk9iOkHQ+6rOk4H2tjaXRVXxIsHstXsp9IhMzxcrexmi3fVQxI=
X-Received: by 2002:a05:651c:28a:: with SMTP id
 b10mr1303194ljo.193.1572473221448; 
 Wed, 30 Oct 2019 15:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAKT=dDk0sNAXxz-angd5WvQXXLF8p3sPLEzOt=wVSLhuaP8dkQ@mail.gmail.com>
 <20191028152602.GA5057@redhat.com>
 <CAKT=dDnXwa76_aOVhTaKyE2=2HT2qGHvP9HGqnMzArr-Jt3A+Q@mail.gmail.com>
 <20191029103304.29142c34@eldfell.localdomain>
 <CAKT=dDkrPUOM2qf8RrZsS9cxmiEntZT4K6rAEf2xMyyZe=Usog@mail.gmail.com>
In-Reply-To: <CAKT=dDkrPUOM2qf8RrZsS9cxmiEntZT4K6rAEf2xMyyZe=Usog@mail.gmail.com>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Wed, 30 Oct 2019 15:06:50 -0700
Message-ID: <CAKT=dD=HGe-jep8yNCxozijevE90rHiL=s8viT5r+sO1NU65fQ@mail.gmail.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fAg8Bb4wqLwYYzNjGHZzsgtpMfuQhfeM9UI/7lXspCw=;
 b=kgKImJVgJdyay6pTAohsQJwYmP/jwdZWHN+Ommg9ZNihQbG+m37X7EEz3T3/XtIxNE
 uv0iJJlPXd87BUrgS0yGrq5knAys9cu9ZPHowePxN0zfDGsPLi1JCqE0sNk48nSvi/ix
 2FeembEZMZIGF8eSEolWKzZ8W2mQp8wcYDmBNk2zmQeYY4L0epuiMUh83QXELEF7tXnG
 kRqu+b85oN+PKrswKiMcGOhP91afUaKzPJRkyjiel+oyLAOanX656OVYtB7I+jOaUp/6
 JSUwsPyU4WpvU+TCaYJTYC6ryHnV4IhN9PmSCTK5Le5PIANivah32tzfDxx9gXCyrXK6
 qvbg==
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
Cc: Alistair Delva <adelva@google.com>, Prahlad Kilambi <prahladk@google.com>,
 dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, kraxel@redhat.com,
 Chris Forbes <chrisforbes@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBXaGF0IGFib3V0IGdldHRpbmcgYSBjb2hlcmVudCB2aWV3IG9mIHRoZSB0b3RhbCBHUFUgcHJp
dmF0ZSBtZW1vcnkKPiBjb25zdW1wdGlvbiBvZiBhIHNpbmdsZSBwcm9jZXNzPyBJIHRoaW5rIHRo
ZSBzYW1lIGNhdmVhdCBhbmQgc29sdXRpb24KPiB3b3VsZCBhcHBseS4KRm9yIHRoZSBjb2hlcmVu
Y3kgaXNzdWUsIG5vdyBJIHVuZGVyc3RhbmQgeW91ciBjb25jZXJucy4gTGV0IG1lIHJlLXRoaW5r
CmFuZCBjb21lIGJhY2suIEEgdG90YWwgdmFsdWUgcGVyIHByb2Nlc3MgaXMgYW4gb3B0aW9uIGlm
IHdlJ2QgbGlrZSBwcmVjaXNlCnRvdGFsIEdQVSBwcml2YXRlIG1lbW9yeSBwZXIgcHJvY2Vzcy4g
V2UnbGwgY2hlY2sgaWYgdGhlcmUncmUgb3RoZXIgb3B0aW9ucwphcyB3ZWxsLiBUaGFua3MgZm9y
IHBvaW50aW5nIHRoaXMgb3V0IQoKT24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMjowMyBQTSBZaXdl
aSBaaGFuZyA8enp5aXdlaUBnb29nbGUuY29tPiB3cm90ZToKPgo+IEhpIGZvbGtzLAo+Cj4gRGlk
bid0IHJlYWxpemUgZ21haWwgaGFzIGEgcGxhaW4gdGV4dCBtb2RlIDsgKQo+Cj4gPiBJbiBteSBv
cGluaW9uIHRyYWNraW5nIHBlciBwcm9jZXNzIGlzIGdvb2QsIGJ1dCB5b3UgY2Fubm90IHNpZGVz
dGVwIHRoZQo+ID4gcXVlc3Rpb24gb2YgdHJhY2tpbmcgcGVyZm9ybWFuY2UgYnkgc2F5aW5nIHRo
YXQgdGhlcmUgaXMgb25seSBmZXcKPiA+IHByb2Nlc3NlcyB1c2luZyB0aGUgR1BVLgo+IEFncmVl
ZCwgSSBzaG91bGRuJ3QgbWFrZSB0aGF0IHN0YXRlbWVudC4gVGhhbmtzIGZvciB0aGUgaW5mbyBh
cyB3ZWxsIQo+Cj4gPiBXaGF0IGlzIGFuICJhY3RpdmUiIEdQVSBwcml2YXRlIGFsbG9jYXRpb24/
IFRoaXMgaW1wbGllcyB0aGF0IHRoZXJlIGFyZQo+ID4gYWxzbyBpbmFjdGl2ZSBhbGxvY2F0aW9u
cywgd2hhdCBhcmUgdGhvc2U/Cj4gImFjdGl2ZSIgaXMgdXNlZCB0byBjbGFpbSB0aGF0IHdlIGRv
bid0IHRyYWNrIHRoZSBhbGxvY2F0aW9uIGhpc3RvcnkuIFdlIGp1c3QKPiB3YW50IHRoZSBjdXJy
ZW50bHkgYWxsb2NhdGVkIG1lbW9yeS4KPgo+ID4gV2hhdCBhYm91dCBnZXR0aW5nIGEgY29oZXJl
bnQgdmlldyBvZiB0aGUgdG90YWwgR1BVIHByaXZhdGUgbWVtb3J5Cj4gPiBjb25zdW1wdGlvbiBv
ZiBhIHNpbmdsZSBwcm9jZXNzPyBJIHRoaW5rIHRoZSBzYW1lIGNhdmVhdCBhbmQgc29sdXRpb24K
PiA+IHdvdWxkIGFwcGx5Lgo+IFJlYWxpc3RpY2FsbHkgSSBhc3N1bWUgZHJpdmVycyB3b24ndCBj
aGFuZ2UgdGhlIHZhbHVlcyBkdXJpbmcgYSBzbmFwc2hvdAo+IGNhbGw/IEJ1dCBhZGRpbmcgb25l
IG1vcmUgbm9kZSBwZXIgcHJvY2VzcyBmb3IgdG90YWwgR1BVIHByaXZhdGUgbWVtb3J5Cj4gYWxs
b2NhdGVkIHdvdWxkIGJlIGdvb2QgZm9yIHRlc3QgZW5mb3JjZW1lbnQgZm9yIHRoZSBjb2hlcmVu
Y3kgYXMgd2VsbC4gSSdkCj4gc3VnZ2VzdCBhbiBhZGRpdGlvbmFsICIvc3lzL2RldmljZXMvPHNv
bWUgVEJEIHJvb3Q+LzxwaWQ+L2dwdV9tZW0vdG90YWwiCj4gbm9kZS4KPgo+IEJlc3QsCj4gWWl3
ZWkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
