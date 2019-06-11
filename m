Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 721E63D54E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 20:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F28C8921B;
	Tue, 11 Jun 2019 18:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D433B8921B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:14:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 348E7112D;
 Tue, 11 Jun 2019 20:14:20 +0200 (CEST)
Date: Tue, 11 Jun 2019 21:13:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Drake <michael.drake@codethink.co.uk>
Subject: Re: [PATCH v1 08/11] dt-bindings: display/bridge: Add bindings for
 ti949
Message-ID: <20190611181351.GW5016@pendragon.ideasonboard.com>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
 <20190611140412.32151-9-michael.drake@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611140412.32151-9-michael.drake@codethink.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560276860;
 bh=Qaii2hzx2ceSMkoNdcuS2j/nQYnyPQB92jJfokvbcLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q34tb1BDgS18AJaIrFPJ2tcd64cyCIwuV4A4W3PyXhpXz31a4Th5P20rSoYdzMC3g
 V9E+fEOf4HX5zAMW8TV6E2A7BNf+tpRMQfe/QaorFlgsi0J/Q6L5jDhk/fqgJSukIg
 dkrp4eI4mc5guCJlPg0Uf+naGxkJtYTOfp+gx7mw=
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
MTkgYXQgMDM6MDQ6MDlQTSArMDEwMCwgTWljaGFlbCBEcmFrZSB3cm90ZToKPiBBZGRzIGRldmlj
ZSB0cmVlIGJpbmRpbmdzIGZvcjoKPiAKPiAgIFRJIERTOTBVQjk0OS1RMSAxMDgwcCBIRE1JIHRv
IEZQRC1MaW5rIElJSSBicmlkZ2Ugc2VyaWFsaXplcgo+IAo+IEl0IHN1cHBvcnRzIGluc3RhbnRp
YXRpb24gdmlhIGRldmljZSB0cmVlIC8gQUNQSSB0YWJsZS4KPiAKPiBUaGUgZGV2aWNlIGhhcyB0
aGUgY29tcGF0aWJsZSBzdHJpbmcgInRpLGRzOTB1Yjk0OSIsIGFuZAo+IGFuZCBhbGxvd3MgYW4g
YXJycmF5IG9mIHN0cmluZ3MgdG8gYmUgcHJvdmlkZWQgYXMgcmVndWxhdG9yCj4gbmFtZXMgdG8g
ZW5hYmxlIGZvciBvcGVyYXRpb24gb2YgdGhlIGRldmljZS4KCkFsbCB0aGUgY29tbWVudHMgSSBt
YWRlIHJlZ2FyZGluZyB0aGUgZHM5MHViOTQ4IERUIGJpbmRpbmdzIGFwcGx5IGhlcmUKdG9vLiBT
YW1lIGZvciB0aGUgY29tbWVudHMgcmVsYXRlZCB0byB0aGUgZHJpdmVyLCB0aGV5IGFwcGx5IHRv
IHRoZQpzdWJzZXF1ZW50IHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMuCgo+IFNpZ25lZC1vZmYtYnk6
IE1pY2hhZWwgRHJha2UgPG1pY2hhZWwuZHJha2VAY29kZXRoaW5rLmNvLnVrPgo+IENjOiBQYXRy
aWNrIEdsYXNlciA8cGdsYXNlckB0ZXNsYS5jb20+Cj4gQ2M6IE5hdGUgQ2FzZSA8bmNhc2VAdGVz
bGEuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGksZHM5MHViOTQ5
LnR4dCAgfCAyNCArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNl
cnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGksZHM5MHViOTQ5LnR4dAo+IAo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGksZHM5
MHViOTQ5LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS90aSxkczkwdWI5NDkudHh0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjNiYTM4OTdkNWU4MQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGksZHM5MHViOTQ5LnR4dAo+
IEBAIC0wLDAgKzEsMjQgQEAKPiArVEkgRFM5MFVCOTQ5LVExIDEwODBwIEhETUkgdG8gRlBELUxp
bmsgSUlJIGJyaWRnZSBzZXJpYWxpemVyCj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICsKPiArVGhpcyBpcyB0aGUgYmluZGlu
ZyBmb3IgVGV4YXMgSW5zdHJ1bWVudHMgRFM5MFVCOTQ5LVExIGJyaWRnZSBzZXJpYWxpemVyLgo+
ICsKPiArVGhpcyBkZXZpY2Ugc3VwcG9ydHMgSTJDIG9ubHkuCj4gKwo+ICtSZXF1aXJlZCBwcm9w
ZXJ0aWVzOgo+ICsKPiArLSBjb21wYXRpYmxlOiAidGksZHM5MHViOTQ5Igo+ICsKPiArT3B0aW9u
YWwgcHJvcGVydGllczoKPiArCj4gKy0gcmVndWxhdG9yczogTGlzdCBvZiByZWd1bGF0b3IgbmFt
ZSBzdHJpbmdzIHRvIGVuYWJsZSBmb3Igb3BlcmF0aW9uIG9mIGRldmljZS4KPiArCj4gK0V4YW1w
bGUKPiArLS0tLS0tLQo+ICsKPiArdGk5NDk6IGRzOTB1Yjk0OUAwIHsKPiArCWNvbXBhdGlibGUg
PSAidGksZHM5MHViOTQ5IjsKPiArCj4gKwlyZWd1bGF0b3JzOiAidmNjIiwKPiArCSAgICAgICAg
ICAgICJ2Y2NfaGRtaSI7Cj4gK307CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
