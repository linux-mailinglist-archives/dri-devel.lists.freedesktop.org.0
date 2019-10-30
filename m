Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 692DEEAC28
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51BD6EDD6;
	Thu, 31 Oct 2019 09:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A236EB40
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 21:03:56 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id f4so2699413lfk.7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 14:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ainixGGMMXrzxnBCL9AKbqiDOHm4ZT1Z0YhRLTh19XE=;
 b=KoQWYLnCL7jMK6RYWVS4f/GaPZJUNdNgM1s++9DK2mTSnMg4miluUtXKxfMkA88/n2
 JadNhi4hzbCN4bjTnZN+dKXxur25P3fr/pOYeVuJVEFOAAI5cQT4euE1YP+lp2nmx01l
 1FmxXxGqVV1kyMccWnLuvhpy4etTLB7GetMgbFj7u7lgtrQnheCuFkJkPt/n4H+lZy2L
 MB/bkR/aB0KuDrzwzJpXy25cfva2omhBRwkMrKNvS9gAn2BmSSm0dZ9yvuTkVGjldDJr
 Y/gOWOPuR71NHK6dz/ZU6NoaXHIptN4xAmKUwxA00v1P1coHQVhDKNl4p5Yzq7yAmQDn
 GmjA==
X-Gm-Message-State: APjAAAUeaiYwpu+/lLFMasDpDUsvirAN1+4Y16Ltqkj1rOhZlEt+Dpfy
 yFMkN6tBPoMLRHQXvUyk33ZPOIFJ5toB3FAW6wmx
X-Google-Smtp-Source: APXvYqxjQ5Q70SZjv0Tk42QMb559rXSX3lSLPfqHhH0aCARN6tX5AOpxGCSURX5tdQydc6yBIMLV3kBKuSQw2k5/kQw=
X-Received: by 2002:a19:98e:: with SMTP id 136mr161332lfj.27.1572469434850;
 Wed, 30 Oct 2019 14:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAKT=dDk0sNAXxz-angd5WvQXXLF8p3sPLEzOt=wVSLhuaP8dkQ@mail.gmail.com>
 <20191028152602.GA5057@redhat.com>
 <CAKT=dDnXwa76_aOVhTaKyE2=2HT2qGHvP9HGqnMzArr-Jt3A+Q@mail.gmail.com>
 <20191029103304.29142c34@eldfell.localdomain>
In-Reply-To: <20191029103304.29142c34@eldfell.localdomain>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Wed, 30 Oct 2019 14:03:43 -0700
Message-ID: <CAKT=dDkrPUOM2qf8RrZsS9cxmiEntZT4K6rAEf2xMyyZe=Usog@mail.gmail.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ainixGGMMXrzxnBCL9AKbqiDOHm4ZT1Z0YhRLTh19XE=;
 b=FYARAzb8TIehkRCpJYNaPwXCpBJPAdcaSBZVZVbXR8NXw6yqlHfS5LnVEReLQbrbcq
 hwgKDDhcq4SGdJScJxiZs5xEgEwZrGZNAZwnatV7ybH7b4D0AFSTMyiW6DCMsrzuvRvr
 Rk+8Y8JP0j1DGFqggd7p/BBxSPS1PddpqZwzxZI+yer4bN9hkQlMP8tJVE+b3UQe22iS
 L+rTrdWEks/IV5l7KZ5bNEDKs1ZHlyhrrMkK9hZE+JnW+GfiMq7xrIg712i2D+IaYpVB
 HK2Sl7ASSEsttlY0mLx7dgclhC0qo+ErhdTG2dgL2gI/KipIvOFzqR7A0S8T2WUpbLoc
 Ondw==
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

SGkgZm9sa3MsCgpEaWRuJ3QgcmVhbGl6ZSBnbWFpbCBoYXMgYSBwbGFpbiB0ZXh0IG1vZGUgOyAp
Cgo+IEluIG15IG9waW5pb24gdHJhY2tpbmcgcGVyIHByb2Nlc3MgaXMgZ29vZCwgYnV0IHlvdSBj
YW5ub3Qgc2lkZXN0ZXAgdGhlCj4gcXVlc3Rpb24gb2YgdHJhY2tpbmcgcGVyZm9ybWFuY2UgYnkg
c2F5aW5nIHRoYXQgdGhlcmUgaXMgb25seSBmZXcKPiBwcm9jZXNzZXMgdXNpbmcgdGhlIEdQVS4K
QWdyZWVkLCBJIHNob3VsZG4ndCBtYWtlIHRoYXQgc3RhdGVtZW50LiBUaGFua3MgZm9yIHRoZSBp
bmZvIGFzIHdlbGwhCgo+IFdoYXQgaXMgYW4gImFjdGl2ZSIgR1BVIHByaXZhdGUgYWxsb2NhdGlv
bj8gVGhpcyBpbXBsaWVzIHRoYXQgdGhlcmUgYXJlCj4gYWxzbyBpbmFjdGl2ZSBhbGxvY2F0aW9u
cywgd2hhdCBhcmUgdGhvc2U/CiJhY3RpdmUiIGlzIHVzZWQgdG8gY2xhaW0gdGhhdCB3ZSBkb24n
dCB0cmFjayB0aGUgYWxsb2NhdGlvbiBoaXN0b3J5LiBXZSBqdXN0CndhbnQgdGhlIGN1cnJlbnRs
eSBhbGxvY2F0ZWQgbWVtb3J5LgoKPiBXaGF0IGFib3V0IGdldHRpbmcgYSBjb2hlcmVudCB2aWV3
IG9mIHRoZSB0b3RhbCBHUFUgcHJpdmF0ZSBtZW1vcnkKPiBjb25zdW1wdGlvbiBvZiBhIHNpbmds
ZSBwcm9jZXNzPyBJIHRoaW5rIHRoZSBzYW1lIGNhdmVhdCBhbmQgc29sdXRpb24KPiB3b3VsZCBh
cHBseS4KUmVhbGlzdGljYWxseSBJIGFzc3VtZSBkcml2ZXJzIHdvbid0IGNoYW5nZSB0aGUgdmFs
dWVzIGR1cmluZyBhIHNuYXBzaG90CmNhbGw/IEJ1dCBhZGRpbmcgb25lIG1vcmUgbm9kZSBwZXIg
cHJvY2VzcyBmb3IgdG90YWwgR1BVIHByaXZhdGUgbWVtb3J5CmFsbG9jYXRlZCB3b3VsZCBiZSBn
b29kIGZvciB0ZXN0IGVuZm9yY2VtZW50IGZvciB0aGUgY29oZXJlbmN5IGFzIHdlbGwuIEknZApz
dWdnZXN0IGFuIGFkZGl0aW9uYWwgIi9zeXMvZGV2aWNlcy88c29tZSBUQkQgcm9vdD4vPHBpZD4v
Z3B1X21lbS90b3RhbCIKbm9kZS4KCkJlc3QsCllpd2VpCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
