Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C870E789E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 19:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA8B6E9B7;
	Mon, 28 Oct 2019 18:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DA06E9B7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 18:39:14 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id c7so7538507otm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 11:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/gAhBlJb+sh0KhEN82c+Z4PpNrmxIydwqif6hZnM8oQ=;
 b=RZ7X0lV1AydpOwqxrrELzuBvxvJgTUw/xIANt/tvGVZu6tMnomYzmJFn4Q0gTrEzZt
 LyyMh7BVk3/+K7C4+/2PG50KwF5zsaLtv4PG28F8IO4I/XmR/rNFxMSwQupHQyZjtxob
 aoi5BsaqZJSQpobwveO2GgpSv0D1EynIg9hhmruHlUCafgddejtKkazVbzEe9U15cYvx
 2ZI7psPLMf6+XlcgUvLbyxk/YAnCJzZ7RMJnoj0a251imhCQ8iLpNr4yrtEKmTcDvtS9
 NpS1F/uwpS5PmeUH4oPl4hzlIV9ek27mlD2GBkYuVxchpknUpCi/5k8L9KsUvbQRbUBs
 F1vA==
X-Gm-Message-State: APjAAAX3nLDB325dIlBbfYP8AqicrCc40Jwmd0Kl9jvm6qp9skDHg/O/
 9LeeBFrlQ52AXl1MRsqtQBwqvfQQmjs04NJLY37QJQ==
X-Google-Smtp-Source: APXvYqyKEfwJb0l2DG8kqTlFCipDkABRVU0HfqUzj9xcr2+jKGtaVuiLUsrnqfOOo9Jq/Rny/0uW2EQPeSc+7gts5vI=
X-Received: by 2002:a9d:5a0b:: with SMTP id v11mr15027479oth.102.1572287953644; 
 Mon, 28 Oct 2019 11:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191025234834.28214-1-john.stultz@linaro.org>
 <20191025234834.28214-2-john.stultz@linaro.org>
 <20191028074642.GB31867@infradead.org>
In-Reply-To: <20191028074642.GB31867@infradead.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 28 Oct 2019 11:39:03 -0700
Message-ID: <CALAqxLXqLUpew9XptiXZGodf5M3qyNmD-D1-2CHZ9PRfPTBRRQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/2] mm: cma: Export cma symbols for cma heap as a
 module
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/gAhBlJb+sh0KhEN82c+Z4PpNrmxIydwqif6hZnM8oQ=;
 b=W9XRu8s6F/9TsFLHTcSQDb0Nv6pnIBlAVPHEIvO+0sRufsrPexDNntaTTDpMZkYUFo
 HPcrYBHpRf+ThMx5LF2vxZRrxrnvJBpc4Sqnihoe1cxFGg+lLl92BzCZvB5gPmy64oYx
 C1JVb5DYpmh6hT5M6smONPWDfCNxR+oiqBdKNQHXRCbonDeA8mQAlBm+G5c0IvbXpuED
 fhS+aVBYsHYn5SNgUF7cgHJNxZpIvtVB/Y6vQ+MwZhPqdFpje6OesPLagLI4Ug6Q/VKZ
 St6ztLOs3ojRqUZcTMIsSv2G7wbLOqTEMiKQ8LS2IyugyXUoJaGkFPbT/4mu9lCwKV9t
 3T4w==
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

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMTI6NDYgQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgT2N0IDI1LCAyMDE5IGF0IDExOjQ4OjMz
UE0gKzAwMDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gIHN0cnVjdCBjbWEgKmRtYV9jb250aWd1
b3VzX2RlZmF1bHRfYXJlYTsKPiA+ICtFWFBPUlRfU1lNQk9MKGRtYV9jb250aWd1b3VzX2RlZmF1
bHRfYXJlYSk7Cj4KPiBQbGVhc2UgQ0MgdGhlIGRtYSBtYWludGFpbmVyLiAgQW5kIG5vLCB5b3Ug
aGF2ZSBubyBidXNpbmVzcyB1c2luZyB0aGlzLgoKU3VyZSB0aGluZy4gQW5kIEknbGwgbG9vayBh
Z2FpbiB0byBzZWUgd2h5IEkgd2FzIG5lZWRpbmcgdG8gcHVsbCB0aGF0Cm9uZSBpbiB0byBnZXQg
aXQgdG8gYnVpbGQuCgo+IEV2ZW4gaWYgeW91IGRpZCwgaW50ZXJuYWxzIGxpa2UgdGhpcyBzaG91
bGQgYWx3YXlzIGJlIEVYUE9SVF9TWU1CT0xfR1BMLgoKQ2VydGFpbmx5ISBNeSBtaXN0YWtlIGhl
cmUhCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjayEKLWpvaG4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
