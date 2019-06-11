Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0073D4E4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 20:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7443891E2;
	Tue, 11 Jun 2019 18:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5178C891E2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:03:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28BD32AF;
 Tue, 11 Jun 2019 20:03:31 +0200 (CEST)
Date: Tue, 11 Jun 2019 21:03:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Drake <michael.drake@codethink.co.uk>
Subject: Re: [PATCH v1 01/11] dt-bindings: display/bridge: Add bindings for
 ti948
Message-ID: <20190611180316.GS5016@pendragon.ideasonboard.com>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
 <20190611140412.32151-2-michael.drake@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611140412.32151-2-michael.drake@codethink.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560276211;
 bh=exWMQpzVUcVHbArclfchPQA20MY/zWqw3zj3LWT3EWw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EWcXliNyKKtOO/SjPheM3h6upHk9ZqRoe9SojrbSZElysefFhoOiKK5BZxyrCCuMe
 rQ9suCr4VtdEkkjJ3d5hcTBZ7Z7FZW/rwIo1IzOpdQEjQGbw5HaA60UMBus69bF5gB
 BB9xoqtbaPqC+Naa6cZlwUpaEucDEGxLJRs43PNI=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nate Case <ncase@tesla.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@lists.codethink.co.uk,
 Patrick Glaser <pglaser@tesla.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWljaGFlbCwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVHVlLCBKdW4gMTEsIDIw
MTkgYXQgMDM6MDQ6MDJQTSArMDEwMCwgTWljaGFlbCBEcmFrZSB3cm90ZToKPiBBZGRzIGRldmlj
ZSB0cmVlIGJpbmRpbmdzIGZvcjoKPiAKPiAgIFRJIERTOTBVQjk0OC1RMSAySyBGUEQtTGluayBJ
SUkgdG8gT3BlbkxESSBEZXNlcmlhbGl6ZXIKPiAKPiBUaGUgZGV2aWNlIGhhcyB0aGUgY29tcGF0
aWJsZSBzdHJpbmcgInRpLGRzOTB1Yjk0OCIsIGFuZAo+IGFuZCBhbGxvd3MgYW4gYXJycmF5IG9m
IHN0cmluZ3MgdG8gYmUgcHJvdmlkZWQgYXMgcmVndWxhdG9yCgpzL2FycnJheS9hcnJheS8KCj4g
bmFtZXMgdG8gZW5hYmxlIGZvciBvcGVyYXRpb24gb2YgdGhlIGRldmljZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWVsIERyYWtlIDxtaWNoYWVsLmRyYWtlQGNvZGV0aGluay5jby51az4KPiBD
YzogUGF0cmljayBHbGFzZXIgPHBnbGFzZXJAdGVzbGEuY29tPgo+IENjOiBOYXRlIENhc2UgPG5j
YXNlQHRlc2xhLmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRz
OTB1Yjk0OC50eHQgIHwgMjQgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MjQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTB1Yjk0OC50eHQKPiAKPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L3RpLGRzOTB1Yjk0OC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2UvdGksZHM5MHViOTQ4LnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi5mOWU4NmNiMjI5MDAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTB1Yjk0
OC50eHQKPiBAQCAtMCwwICsxLDI0IEBACj4gK1RJIERTOTBVQjk0OC1RMSAySyBGUEQtTGluayBJ
SUkgdG8gT3BlbkxESSBEZXNlcmlhbGl6ZXIKPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICsKPiArVGhpcyBpcyB0aGUgYmluZGluZyBm
b3IgVGV4YXMgSW5zdHJ1bWVudHMgRFM5MFVCOTQ4LVExIGJyaWRnZSBkZXNlcmlhbGl6ZXIuCj4g
Kwo+ICtUaGlzIGRldmljZSBzdXBwb3J0cyBJMkMgb25seS4KClRoZW4gdGhlIERUIG5vZGUgc2hv
dWxkIGJlIGEgY2hpbGQgb2YgaXRzIEkyQyBjb250cm9sbGVyLCBhbmQgaGF2ZSBhIHJlZwpwcm9w
ZXJ0eS4KCj4gKwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICsKPiArLSBjb21wYXRpYmxlOiAi
dGksZHM5MHViOTQ4Igo+ICsKPiArT3B0aW9uYWwgcHJvcGVydGllczoKPiArCj4gKy0gcmVndWxh
dG9yczogTGlzdCBvZiByZWd1bGF0b3IgbmFtZSBzdHJpbmdzIHRvIGVuYWJsZSBmb3Igb3BlcmF0
aW9uIG9mIGRldmljZS4KClRoZXJlJ3MgYSBzdGFuZGFyZCBiaW5kaW5nIGZvciByZWd1bGF0b3Jz
LCB1c2luZyAqLXN1cHBseSBwcm9wZXJ0aWVzLgpQbGVhc2UgdXNlIHRoZW0uCgpZb3Ugc2hvdWxk
IGFsc28gdXNlIHRoZSBPRiBncmFwaCBEVCBiaW5kaW5ncyB0byBtb2RlbCB0aGUgZGF0YQpjb25u
ZWN0aW9ucy4KCj4gKwo+ICtFeGFtcGxlCj4gKy0tLS0tLS0KPiArCj4gK3RpOTQ4OiBkczkwdWI5
NDhAMCB7Cj4gKwljb21wYXRpYmxlID0gInRpLGRzOTB1Yjk0OCI7Cj4gKwo+ICsJcmVndWxhdG9y
czogInZjYyIsCj4gKwkgICAgICAgICAgICAidmNjX2Rpc3AiOwo+ICt9OwoKLS0gClJlZ2FyZHMs
CgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
