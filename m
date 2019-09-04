Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E1EA86F8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 19:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5668951E;
	Wed,  4 Sep 2019 17:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A278951E;
 Wed,  4 Sep 2019 17:25:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 92912221CF;
 Wed,  4 Sep 2019 13:25:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 04 Sep 2019 13:25:51 -0400
X-ME-Sender: <xms:nvNvXVuX4lOaTn0ykdGjS5BNX_b3eAcilqGme9epzllWCdQQEo2KKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejhedguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgv
 ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinhepfhhrvggvug
 gvshhkthhophdrohhrghenucfkphepkeefrdekiedrkeelrddutdejnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucevlhhushhtvghrufhiii
 gvpedt
X-ME-Proxy: <xmx:nvNvXY_bFWiVwWUbWOg9H7tGZvI05AgpFNIRd-TaW34fRAHPgnrYdw>
 <xmx:nvNvXVuTiqTH9CM2BVSWqklUfbR7R3Cg4IcbWdQjC5pe3C9O7Ga6Qw>
 <xmx:nvNvXe5GtWxvLqsk6iXj8X2QdeDvYLdo0RZmgb9MaZjvfgEMt-RC0Q>
 <xmx:n_NvXR5JnQ_I-InaallQbf1ILZOP-cYAduxbU3wtYs5_uUyBcjLPCw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8743DD60062;
 Wed,  4 Sep 2019 13:25:50 -0400 (EDT)
Date: Wed, 4 Sep 2019 19:25:48 +0200
From: Greg KH <greg@kroah.com>
To: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [BACKPORT 4.14.y 1/8] drm/i915/fbdev: Actually configure untiled
 displays
Message-ID: <20190904172548.GA10973@kroah.com>
References: <cover.1567492316.git.baolin.wang@linaro.org>
 <5723d9006de706582fb46f9e1e3eb8ce168c2126.1567492316.git.baolin.wang@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5723d9006de706582fb46f9e1e3eb8ce168c2126.1567492316.git.baolin.wang@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=u9bMn1zukKv1Hh6yTnH9HI+sDfv
 YF98vUBzUJo2wB3U=; b=OgrPG8MDdFNrrodczUrZS8zdRqTMSRDXMA/LeV9IjsS
 vGLBbsQQHixUXCoH9o6dNnOconyEVqNWy3uYbMshtbUdNjHj5JDh8Yp+tWLWruDr
 kxdzoC2I/R/nGxpZLc8STD1cKOK1XaFwDXyslPLbopWmla56G0K7SMIkdFxprgyj
 9+CX0wurTn2Pb/Ys3CSZdoOVQL/3pjbL3Je9chtKwt/OYrsvs0XH62aOdj5j7btm
 QyFEvtYErJ8o62LOaVCYATcWBl2uFJ/Mv+XjTKLrTmeE6zg8iRc3v2L2YA3J9HMA
 aAOQ9wnsMW4NsRxF+UkcpUgL9qoErjJJVhGx3iV39Ug==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=u9bMn1
 zukKv1Hh6yTnH9HI+sDfvYF98vUBzUJo2wB3U=; b=XRl6AQgyIoguGW9YejvZ84
 4ofofym1GgUD5vuItjO3XO1uuRiJD0Gvyq4oNerr+XJRFsO/hbDC4E1dt0Pq/WsI
 ykAjpKths+74DadELoLM3gLd/YUo2ShgfPCexk+oVirhhD2vTyd8U6x9HsXvW33b
 XfVv7QHhQNlAwRtisMF5YW7kJndzd9XIEuoPJujGNPNZr1bYQ/KQWqdC6yCq5Yf/
 m9MGQtUDeMPS1NUcDABhznWZI/dCDmHiLAl6gcWWzCo0nk9/IDR/kNGmy+WTTUU3
 h9Rxb3ZHrVmntOGVscoihUJapZFEoEoe1RlXdsjHuV0PbRmNmzQRdJHsBIXYwS1g
 ==
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
Cc: vincent.guittot@linaro.org, arnd@arndb.de, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org, orsonzhai@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDI6NTU6MjZQTSArMDgwMCwgQmFvbGluIFdhbmcgd3Jv
dGU6Cj4gRnJvbTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gCj4g
SWYgd2Ugc2tpcHBlZCBhbGwgdGhlIGNvbm5lY3RvcnMgdGhhdCB3ZXJlIG5vdCBwYXJ0IG9mIGEg
dGlsZSwgd2Ugd291bGQKPiBsZWF2ZSBjb25uX3NlcT0wIGFuZCBjb25uX2NvbmZpZ3VyZWQ9MCwg
Y29udmluY2luZyBvdXJzZWx2ZXMgdGhhdCB3ZQo+IGhhZCBzdGFnbmF0ZWQgaW4gb3VyIGNvbmZp
Z3VyYXRpb24gYXR0ZW1wdHMuIEF2b2lkIHRoaXMgc2l0dWF0aW9uIGJ5Cj4gc3RhcnRpbmcgY29u
bl9zZXE9QUxMX0NPTk5FQ1RPUlMsIGFuZCByZXBlYXRpbmcgdW50aWwgd2UgZmluZCBubyBtb3Jl
Cj4gY29ubmVjdG9ycyB0byBjb25maWd1cmUuCj4gCj4gRml4ZXM6IDc1NGE3NjU5MWIxMiAoImRy
bS9pOTE1L2ZiZGV2OiBTdG9wIHJlcGVhdGluZyB0aWxlIGNvbmZpZ3VyYXRpb24gb24gc3RhZ25h
dGlvbiIpCj4gUmVwb3J0ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0Bj
aHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gTGluazogaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwMjE1MTIzMDE5LjMyMjgzLTEtY2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHYz
LjE5Kwo+IFNpZ25lZC1vZmYtYnk6IEJhb2xpbiBXYW5nIDxiYW9saW4ud2FuZ0BsaW5hcm8ub3Jn
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9mYmRldi5jIHwgICAxMiArKysr
KysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKCldoYXQgaXMgdGhlIGdpdCBjb21taXQgaWQgb2YgdGhpcyBwYXRjaCBpbiBMaW51cydzIHRy
ZWU/CgpDYW4geW91IHBsZWFzZSBhZGQgdGhhdCBhcyB0aGUgZmlyc3QgbGluZSBvZiB0aGUgY2hh
bmdlbG9nIGxpa2UgaXMgZG9uZQp3aXRoIGFsbCBvdGhlciBzdGFibGUgcGF0Y2hlcz8gIFRoYXQg
d2F5IEkgY2FuIHZlcmlmeSB0aGF0IHdoYXQgeW91CnBvc3RlZCBoZXJlIGlzIHRoZSBjb3JyZWN0
IG9uZS4KClBsZWFzZSBmaXggdGhlIHVwIGZvciBhbGwgb2YgdGhlc2UgYW5kIHJlc2VuZC4KCnRo
YW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
