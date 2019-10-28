Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 111F3E7C44
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 23:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6196E042;
	Mon, 28 Oct 2019 22:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1036E042
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 22:24:08 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id 83so7345373oii.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 15:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r2oZkcbSPejQY7cz80oHS9fpmT93sVGHDU0X3tx1u58=;
 b=NMoldUizJS1KRagAP4qw4N42J4lE0qfp+2ypXxQtQ6/OAkH2fsx/3jyvNhPzmTmP1j
 Qpef1Yyvw6zK1NHLXlzgRKwYXszLoU84PbMd/wVjLNOgkGcLVf2pGVgmpjchfXyvoszY
 J9ZQvdKSC5pzIh2H1ZGv6ZGilbjyWKp9FTVX0nTiNIm7k2dlcMvOQGl/55jyO7aJYOsQ
 saMEGLzPzcs7/j/OuE+9f7wTg64eAPCRDdc8kjblrT6AjzGZU3LfrstO53WUTkrbLf2A
 ObUW8IuvGbcvb7/1V3d4mtlyy9bS1OrFovTQGYdaXCXfaWiQkgBY+xPK8lUMIwQ5zsQC
 E+OQ==
X-Gm-Message-State: APjAAAXAGC6pN6JWJJyXDYP9vnLuHF3bWc9avZ1gMoiEs1EKYM9+qS9I
 tX82KNh2y+KF4WUSqZG2yR1uwiZK61qW3cn8o9gb9w==
X-Google-Smtp-Source: APXvYqwnzz+cE9Sm5n4t9XdS6VL/NqxXZYddSpQ/iGURH0y0OzEDe7qOi50WKmaRadslXLCPhh1klrU3egyz/LefQbQ=
X-Received: by 2002:a05:6808:113:: with SMTP id
 b19mr1232160oie.169.1572301447788; 
 Mon, 28 Oct 2019 15:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191025234834.28214-1-john.stultz@linaro.org>
 <20191025234834.28214-2-john.stultz@linaro.org>
 <20191028074642.GB31867@infradead.org>
 <CALAqxLXqLUpew9XptiXZGodf5M3qyNmD-D1-2CHZ9PRfPTBRRQ@mail.gmail.com>
In-Reply-To: <CALAqxLXqLUpew9XptiXZGodf5M3qyNmD-D1-2CHZ9PRfPTBRRQ@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 28 Oct 2019 15:23:57 -0700
Message-ID: <CALAqxLVW8KQVKwu=AY5Hkv7m9_L6djDy8h0se46MA+t_9_CCgg@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/2] mm: cma: Export cma symbols for cma heap as a
 module
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=r2oZkcbSPejQY7cz80oHS9fpmT93sVGHDU0X3tx1u58=;
 b=drzNa+/Dszlh/bn18l5YMKuFsawU1IqoJickE5gJYg70HnGq1M35FAzxLHS885Xcqh
 a+575bpErnIGrxVE/hbeXohi75WuBFQtWAjN0r+P3LJDQyM7jePUOeu8MGopEUMjjH/t
 DFBj0RF+IXv1eK/hpFNw+oWywiRPpZNF1LLO7SJ71U1QqG0+1is+uXX2da0kENDk4wsq
 Jrl3k7Ia+cYxTUEYQvywZ6SgEN3jAZ78e6z4vj4RbFunhJRg7r6lxkNQ8/L0S/plVXx0
 qzrLqryUAjNcA6vYvOj/NhY3TPBll3NbICSMdNEamTD3RzWWuZ4GCDNvmKvhRwaHu7UO
 HOdg==
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
Cc: Alistair Strachan <astrachan@google.com>,
 Sandeep Patil <sspatil@google.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Chenbo Feng <fengc@google.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Yue Hu <huyue2@yulong.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMTE6MzkgQU0gSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6
QGxpbmFyby5vcmc+IHdyb3RlOgo+IE9uIE1vbiwgT2N0IDI4LCAyMDE5IGF0IDEyOjQ2IEFNIENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJp
LCBPY3QgMjUsIDIwMTkgYXQgMTE6NDg6MzNQTSArMDAwMCwgSm9obiBTdHVsdHogd3JvdGU6Cj4g
PiA+ICBzdHJ1Y3QgY21hICpkbWFfY29udGlndW91c19kZWZhdWx0X2FyZWE7Cj4gPiA+ICtFWFBP
UlRfU1lNQk9MKGRtYV9jb250aWd1b3VzX2RlZmF1bHRfYXJlYSk7Cj4gPgo+ID4gUGxlYXNlIEND
IHRoZSBkbWEgbWFpbnRhaW5lci4gIEFuZCBubywgeW91IGhhdmUgbm8gYnVzaW5lc3MgdXNpbmcg
dGhpcy4KPgo+IFN1cmUgdGhpbmcuIEFuZCBJJ2xsIGxvb2sgYWdhaW4gdG8gc2VlIHdoeSBJIHdh
cyBuZWVkaW5nIHRvIHB1bGwgdGhhdAo+IG9uZSBpbiB0byBnZXQgaXQgdG8gYnVpbGQuCgpBaC4g
U28gbG9va2luZyBhIGJpdCBjbG9zZXIsIEknbSBuZWVkaW5nIHRoaXMgZHVlIHRvIG15IHVzaW5n
CmRldl9nZXRfY21hX2FyZWEoKSAgdG8gZ2V0IHRoZSBkZWZhdWx0IGNtYSBhcmVhIGZvciB0aGUg
ZG1hYnVmCmNtYV9oZWFwLgoKRG8geW91IGhhdmUgYSBzdWdnZXN0aW9uIGZvciBob3cgdG8gZ2V0
IGEgcmVmZXJlbmNlIHRvIHRoZSBkZWZhdWx0IENNQQphcmVhIHdpdGhvdXQgZXhwb3J0aW5nIGRt
YV9jb250aWd1b3VzX2RlZmF1bHRfYXJlYT8gV291bGQgaXQgYmUKcHJlZmVycmVkIHRvIG1vdmUg
ZGV2X2dldF9jbWFfYXJlYSgpIGludG8gdGhlIC5jIGZpbGUgYW5kCkVYUE9SVF9TWU1CT0xfR1BM
IHRoYXQgZnVuY3Rpb24/Cgp0aGFua3MKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
