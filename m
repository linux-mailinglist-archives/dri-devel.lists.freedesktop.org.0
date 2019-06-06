Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5236537A13
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 18:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02049892F6;
	Thu,  6 Jun 2019 16:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B78892F6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 16:52:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [109.132.30.162])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EE7033B;
 Thu,  6 Jun 2019 18:52:20 +0200 (CEST)
Date: Thu, 6 Jun 2019 19:52:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 01/20] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
Message-ID: <20190606165206.GI12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-2-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559839940;
 bh=4mgK5rlkC0Kg4xqsp46YeuIphWIE4WWfImrJeArJBQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bKlQSfkhFOtrbVAQU8MUF0RcPAgnXc92KmqC4bk2Qmmr4qVnwO9rrGX6Bhm+XSWIG
 HQRBQAruWLH7dlCZsnK7AMcZamw/ReQKKmTFtBL7fQybco5o5k5OyuYIq1+h7R4Pgs
 BMh4WJXTY/3OTCipIi8YA8HET2AamsmE4UK0e9NE=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUaHUsIEp1biAwNiwgMjAx
OSBhdCAwNDoyMjowMVBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIGRldmljZSB0
cmVlIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBSZW5lc2FzIFItQ2FyIERpc3BsYXkK
PiBVbml0IENvbG9yIE1hbmFnZW1lbnQgTW9kdWxlLgo+IAo+IENNTSBpcyB0aGUgaW1hZ2UgZW5o
YW5jZW1lbnQgbW9kdWxlIGF2YWlsYWJsZSBvbiBlYWNoIFItQ2FyIERVIHZpZGVvCj4gY2hhbm5l
bCBvbiBHZW4yIGFuZCBHZW4zIFNvQ3MgKFYzSCBhbmQgVjNNIGV4Y2x1ZGVkKS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CgpSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgoKPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0udHh0ICAgICAg
ICAgIHwgMjUgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0
aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0udHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsY21tLnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsY21tLnR4dAo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kOGQzY2Y5Y2UyY2UKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcmVuZXNhcyxjbW0udHh0Cj4gQEAgLTAsMCArMSwyNSBAQAo+ICsqIFJlbmVzYXMgUi1D
YXIgQ29sb3IgTWFuYWdlbWVudCBNb2R1bGUgKENNTSkKPiArCj4gK1JlbmVzYXMgUi1DYXIgaW1h
Z2UgZW5oYW5jZW1lbnQgbW9kdWxlIGNvbm5lY3RlZCB0byBSLUNhciBEVSB2aWRlbyBjaGFubmVs
cy4KPiArCj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gKyAtIGNvbXBhdGlibGU6IHNoYWxsIGJl
IG9uZSBvZjoKPiArICAgLSAicmVuZXNhcyxjbW0tZ2VuMyIKPiArICAgLSAicmVuZXNhcyxjbW0t
Z2VuMiIKPiArCj4gKyAtIHJlZzogdGhlIGFkZHJlc3MgYmFzZSBhbmQgbGVuZ3RoIG9mIHRoZSBt
ZW1vcnkgYXJlYSB3aGVyZSBDTU0gY29udHJvbAo+ICsgICByZWdpc3RlcnMgYXJlIG1hcHBlZCB0
by4KPiArCj4gKyAtIGNsb2NrczogcGhhbmRsZSBhbmQgY2xvY2stc3BlY2lmaWVyIHBhaXIgdG8g
dGhlIENNTSBmdW5jdGlvbmFsIGNsb2NrCj4gKyAgIHN1cHBsaWVyLgo+ICsKPiArRXhhbXBsZToK
PiArLS0tLS0tLS0KPiArCj4gKwljbW0wOiBjbW1AZmVhNDAwMDAgewo+ICsJCWNvbXBhdGlibGUg
PSAicmVuZXNhcyxjbW0iOwo+ICsJCXJlZyA9IDwwIDB4ZmVhNDAwMDAgMCAweDEwMDA+Owo+ICsJ
CXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5Nl9QRF9BTFdBWVNfT04+Owo+ICsJCWNsb2Nr
cyA9IDwmY3BnIENQR19NT0QgNzExPjsKPiArCQlyZXNldHMgPSA8JmNwZyA3MTE+Owo+ICsJfTsK
Ci0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
