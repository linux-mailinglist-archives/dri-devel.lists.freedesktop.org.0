Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4657129D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810C26E118;
	Tue, 23 Jul 2019 07:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rosenzweig.io (rosenzweig.io [107.170.207.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BCC896C4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 14:14:34 +0000 (UTC)
Received: by rosenzweig.io (Postfix, from userid 1000)
 id 5E00560104; Mon, 22 Jul 2019 07:07:49 -0700 (PDT)
Date: Mon, 22 Jul 2019 07:07:49 -0700
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 3/5] drm/panfrost: Add a no execute flag for BO allocations
Message-ID: <20190722140749.GB2156@rosenzweig.io>
References: <20190717183352.22519-1-robh@kernel.org>
 <20190717183352.22519-3-robh@kernel.org>
 <ecde43d2-45cc-d00a-9635-cb56a67263d4@arm.com>
 <CAL_JsqLfnMwibCMU8_PqqYj0C895wuW9DNPirFo-LRChxJA-fA@mail.gmail.com>
 <896cada5-580a-7637-2884-f0c616314ea4@arm.com>
 <CAL_Jsq+ygY64WP6GP2LB4WRt2_BCXMMWxQSyhazY=jWfCyOkLg@mail.gmail.com>
 <4b7fc0b4-aa5b-06ba-ad4a-5b959e265e67@arm.com>
 <d52430aa-972e-f730-ee5a-44137f87e066@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d52430aa-972e-f730-ee5a-44137f87e066@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBVc2VyIHNwYWNlIHNob3VsZG4ndCBjYXJlIHRvbyBtdWNoIC0gb3RoZXIgdGhhbiB0aGUgc2l6
ZSBvZiBidWZmZXJzCj4gYWxsb2NhdGVkIGJlaW5nIHJvdW5kZWQgdXAgdG8gdGhlIENQVSdzIHBh
Z2Ugc2l6ZS4gQXQgbGVhc3QgdGhlIFBhbmZyb3N0Cj4gdXNlci9rZXJuZWwgQUJJIGhhcyBzaXpl
cyBpbiBieXRlcyBub3QgcGFnZXMgKHVubGlrZSBrYmFzZSkuCgpXZSd2ZSBiZWVuIHJvdW5kaW5n
IGV2ZXJ5dGhpbmcgdXAgdG8gdGhlIG5lYXJlc3QgNGsgaW4gbWVzYSwgb3V0IG9mIG9sZApoYWJp
dCBmcm9tIGtiYXNlLiBJIGRvbid0IGtub3cgaWYgdGhhdCdzIHN0cmljdGx5IG5lY2Vzc2FyeSAv
IGhlbHBmdWwKYW55bW9yZT8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
