Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7304234A3B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561A5896ED;
	Tue,  4 Jun 2019 14:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id D78AF896ED
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 14:21:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCFD2341;
 Tue,  4 Jun 2019 07:21:29 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DC983F690;
 Tue,  4 Jun 2019 07:21:29 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id ED44168256F; Tue,  4 Jun 2019 15:21:27 +0100 (BST)
Date: Tue, 4 Jun 2019 15:21:27 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/2] drm/arm/hdlcd: Allow a bit of clock tolerance
Message-ID: <20190604142127.GN15316@e110455-lin.cambridge.arm.com>
References: <9db0bac184d9fa69c4f65bf954ab59b53d431e15.1558111042.git.robin.murphy@arm.com>
 <47fb141ddbf4cf256951758d2e7f90afb6507ded.1558111042.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47fb141ddbf4cf256951758d2e7f90afb6507ded.1558111042.git.robin.murphy@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDU6Mzc6MjJQTSArMDEwMCwgUm9iaW4gTXVycGh5IHdy
b3RlOgo+IE9uIHRoZSBBcm0gSnVubyBwbGF0Zm9ybSwgdGhlIEhETENEIHBpeGVsIGNsb2NrIGlz
IGNvbnN0cmFpbmVkIHRvIDI1MEtIego+IHJlc29sdXRpb24gaW4gb3JkZXIgdG8gYXZvaWQgdGhl
IHRpbnkgU3lzdGVtIENvbnRyb2wgUHJvY2Vzc29yIHNwZW5kaW5nCj4gYWVvbnMgdHJ5aW5nIHRv
IGNhbGN1bGF0ZSBleGFjdCBQTEwgY29lZmZpY2llbnRzLiBUaGlzIG1lYW5zIHRoYXQgbW9kZXMK
PiBsaWtlIG15IG9kZGJhbGwgMTYwMHgxMjAwIHdpdGggMTMwLjg5TUh6IGNsb2NrIGdldCByZWpl
Y3RlZCBzaW5jZSB0aGUKPiByYXRlIGNhbm5vdCBiZSBtYXRjaGVkIGV4YWN0bHkuIEluIHByYWN0
aWNlLCB0aG91Z2gsIHRoaXMgbW9kZSB3b3Jrcwo+IHF1aXRlIGhhcHBpbHkgd2l0aCB0aGUgY2xv
Y2sgYXQgMTMxTUh6LCBzbyBsZXQncyByZWxheCB0aGUgY2hlY2sgdG8KPiBhbGxvdyBhIGxpdHRs
ZSBiaXQgb2Ygc2xvcC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11
cnBoeUBhcm0uY29tPgoKQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29t
PgoKSSd2ZSBwdWxsIHRoZSB0d28gcGF0Y2hlcyBpbnRvIG15IG1hbGlkcC1maXhlcyBicmFuY2gg
YW5kIEkgd2lsbCBzZW5kIGEgcHVsbApyZXF1ZXN0IHRvZGF5LgoKQmVzdCByZWdhcmRzLApMaXZp
dQoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9jcnRjLmMgfCAzICsrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9oZGxjZF9jcnRjLmMKPiBpbmRleCBlY2FjNmZlMGIyMTMuLmEzZWZhMjg0MzZlYSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2NydGMuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vaGRsY2RfY3J0Yy5jCj4gQEAgLTE5Myw3ICsxOTMsOCBAQCBzdGF0aWMg
ZW51bSBkcm1fbW9kZV9zdGF0dXMgaGRsY2RfY3J0Y19tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywKPiAgCWxvbmcgcmF0ZSwgY2xrX3JhdGUgPSBtb2RlLT5jbG9jayAqIDEwMDA7Cj4g
IAo+ICAJcmF0ZSA9IGNsa19yb3VuZF9yYXRlKGhkbGNkLT5jbGssIGNsa19yYXRlKTsKPiAtCWlm
IChyYXRlICE9IGNsa19yYXRlKSB7Cj4gKwkvKiAwLjElIHNlZW1zIGEgY2xvc2UgZW5vdWdoIHRv
bGVyYW5jZSBmb3IgdGhlIFREQTE5OTg4IG9uIEp1bm8gKi8KPiArCWlmIChhYnMocmF0ZSAtIGNs
a19yYXRlKSAqIDEwMDAgPiBjbGtfcmF0ZSkgewo+ICAJCS8qIGNsb2NrIHJlcXVpcmVkIGJ5IG1v
ZGUgbm90IHN1cHBvcnRlZCBieSBoYXJkd2FyZSAqLwo+ICAJCXJldHVybiBNT0RFX05PQ0xPQ0s7
Cj4gIAl9Cj4gLS0gCj4gMi4yMS4wLmRpcnR5Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJ
IHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwK
fCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0K
ICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
