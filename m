Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEFA98D48
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C9D6EA99;
	Thu, 22 Aug 2019 08:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0CC6E986;
 Wed, 21 Aug 2019 19:38:08 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 9F3763E8A5;
 Wed, 21 Aug 2019 19:38:06 +0000 (UTC)
Date: Wed, 21 Aug 2019 15:38:06 -0400
From: Brian Masney <masneyb@onstation.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/7] dt-bindings: display: msm: gmu: add optional
 ocmem property
Message-ID: <20190821193806.GA17476@onstation.org>
References: <20190806002229.8304-1-masneyb@onstation.org>
 <20190806002229.8304-3-masneyb@onstation.org>
 <20190821192602.GA16243@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821192602.GA16243@bogus>
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1566416287;
 bh=LSVMcf7/+Pknk2oK/dA6jgWSlxEz5JclLfuEyMQqBPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AgNS2jBGyjrDVg8BiTYs7QD8K9ZV/zJULU6ZU0wLGrkKstvXZev3WHs+2hCnP7kRS
 UzzmJ0Teje4fLdu0g+FqrkuJw1h/I3Tu3/BNEgcheQY2Sb3FCIn/kg02xgYXuUBUmr
 zV+oUFSs9oXkZS8HdOR/rLSnJnylV6FghyCS0uKI=
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDI6MjY6MDJQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDg6MjI6MjRQTSAtMDQwMCwgQnJpYW4gTWFz
bmV5IHdyb3RlOgo+ID4gU29tZSBBM3h4IGFuZCBBNHh4IEFkcmVubyBHUFVzIGRvIG5vdCBoYXZl
IEdNRU0gaW5zaWRlIHRoZSBHUFUgY29yZSBhbmQKPiA+IG11c3QgdXNlIHRoZSBPbiBDaGlwIE1F
TW9yeSAoT0NNRU0pIGluIG9yZGVyIHRvIGJlIGZ1bmN0aW9uYWwuIEFkZCB0aGUKPiA+IG9wdGlv
bmFsIG9jbWVtIHByb3BlcnR5IHRvIHRoZSBBZHJlbm8gR3JhcGhpY3MgTWFuYWdlbWVudCBVbml0
IGJpbmRpbmdzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJA
b25zdGF0aW9uLm9yZz4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBzaW5jZSB2NDoKPiA+IC0gTm9uZQo+
ID4gCj4gPiBDaGFuZ2VzIHNpbmNlIHYzOgo+ID4gLSBjb3JyZWN0IGxpbmsgdG8gcWNvbSxvY21l
bS55YW1sCj4gPiAKPiA+IENoYW5nZXMgc2luY2UgdjI6Cj4gPiAtIEFkZCBhM3h4IGV4YW1wbGUg
d2l0aCBPQ01FTQo+ID4gCj4gPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4gLSBOb25lCj4gPiAKPiA+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0ICAgfCA1MCArKysr
KysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21zbS9nbXUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbXNtL2dtdS50eHQKPiA+IGluZGV4IDkwYWY1YjBhNTZhOS4uNjcyZDU1N2NhYmE0IDEwMDY0
NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNt
L2dtdS50eHQKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21zbS9nbXUudHh0Cj4gPiBAQCAtMzEsNiArMzEsMTAgQEAgUmVxdWlyZWQgcHJvcGVydGll
czoKPiA+ICAtIGlvbW11czogcGhhbmRsZSB0byB0aGUgYWRyZW5vIGlvbW11Cj4gPiAgLSBvcGVy
YXRpbmctcG9pbnRzLXYyOiBwaGFuZGxlIHRvIHRoZSBPUFAgb3BlcmF0aW5nIHBvaW50cwo+ID4g
IAo+ID4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gPiArLSBvY21lbTogcGhhbmRsZSB0byB0aGUg
T24gQ2hpcCBNZW1vcnkgKE9DTUVNKSB0aGF0J3MgcHJlc2VudCBvbiBzb21lIFNuYXBkcmFnb24K
PiA+ICsgICAgICAgICBTb0NzLiBTZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NyYW0vcWNvbSxvY21lbS55YW1sLgo+IAo+IFNpZ2gsIHRvIHJlcGVhdCBteSBjb21tZW50IG9u
IHYxIGFuZCB2MzoKPiAKPiBXZSBhbHJlYWR5IGhhdmUgYSBjb3VwbGUgb2Ygc2ltaWxhciBwcm9w
ZXJ0aWVzLiBMZXRzIHN0YW5kYXJkaXplIG9uCj4gJ3NyYW0nIGFzIHRoYXQgaXMgd2hhdCBUSSBh
bHJlYWR5IHVzZXMuCgpJIGFsc28gaGFkIHRoZSBwYXRoIHdyb25nIHRoZW4gaW4gdGhvc2Ugb2xk
ZXIgdmVyc2lvbnMuIEl0IHdhcwpwcmV2aW91c2x5IGluIHRoZSBzb2MgbmFtZXNwYWNlIGluc3Rl
YWQgb2YgdGhlIHNyYW0gbmFtZXNwYWNlLiBJIGRpZG4ndApyZWFsaXplIHRoYXQgeW91IGFsc28g
d2FudGVkIHRvIGNoYW5nZSB0aGUgbmFtZSBvZiB0aGUgcHJvcGVydHkgYXMgd2VsbC4KU29ycnkg
YWJvdXQgdGhlIGNvbmZ1c2lvbiBvbiBteSBwYXJ0LgoKQnJpYW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
