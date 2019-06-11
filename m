Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D17D3D53C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 20:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A1988F61;
	Tue, 11 Jun 2019 18:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C126888F61
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:11:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F070F1030;
 Tue, 11 Jun 2019 20:11:01 +0200 (CEST)
Date: Tue, 11 Jun 2019 21:10:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Drake <michael.drake@codethink.co.uk>
Subject: Re: [PATCH v1 06/11] ti948: Reconfigure in the alive check when
 device returns
Message-ID: <20190611181046.GU5016@pendragon.ideasonboard.com>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
 <20190611140412.32151-7-michael.drake@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611140412.32151-7-michael.drake@codethink.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560276662;
 bh=X5ba4hPanC2AN4ceWEVuMDO4nnB5xvvl9LT4UMu+zYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hcIOtR0SSyWGNef99sUwB28gGA+lFi/F/FphmQuvgI0MTjARriXxO/K1eUH5m6o9/
 LVgI8p+IrMWyqRuwTIE0c1kXCNIGaSpiqrxgCPSkick5B2BaqeMqvBtiXBHLSSvnRZ
 1xi8CWzBevXuv4WcwNseLfRvqjRiubK0dRO9dPyQ=
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
MTkgYXQgMDM6MDQ6MDdQTSArMDEwMCwgTWljaGFlbCBEcmFrZSB3cm90ZToKPiBJZiB0aGUgYWxp
dmUgY2hlY2sgZGV0ZWN0cyBhIHRyYW5zaXRpb24gdG8gdGhlIGFsaXZlIHN0YXRlLAo+IHRoZSBk
ZXZpY2UgY29uZmlndXJhdGlvbiBpcyByZXdyaXR0ZW4uCgpUaGlzIHNlZW1zIGxpa2UgYSBiaWcg
aGFjay4gWW91IHdpbGwgaGF2ZSBhdCB0aGUgdmVyeSBsZWFzdCB0byBleHBsYWluCndoeSB0aGlz
IGlzIG5lZWRlZCwgYW5kIHdoeSB5b3UgY2FuJ3QgY29uZmlndXJlIHRoZSBkZXZpY2UgaW4gcmVz
cG9uc2UKdG8gZHJtX2JyaWRnZSBvcGVyYXRpb24gY2FsbHMuCgo+IFNpZ25lZC1vZmYtYnk6IE1p
Y2hhZWwgRHJha2UgPG1pY2hhZWwuZHJha2VAY29kZXRoaW5rLmNvLnVrPgo+IENjOiBQYXRyaWNr
IEdsYXNlciA8cGdsYXNlckB0ZXNsYS5jb20+Cj4gQ2M6IE5hdGUgQ2FzZSA8bmNhc2VAdGVzbGEu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpOTQ4LmMgfCAxOSArKysrKysr
KysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGk5NDguYyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGk5NDguYwo+IGluZGV4IDg2ZGFhMzcwMWI5MS4uYjVj
NzY2NzExYzRiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGk5NDguYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGk5NDguYwo+IEBAIC0xMzIsNiArMTMyLDgg
QEAgc3RydWN0IHRpOTQ4X3JlZ192YWwgewo+ICAgKiBAcmVnX25hbWVzOiAgIEFycmF5IG9mIHJl
Z3VsYXRvciBuYW1lcywgb3IgTlVMTC4KPiAgICogQHJlZ3M6ICAgICAgICBBcnJheSBvZiByZWd1
bGF0b3JzLCBvciBOVUxMLgo+ICAgKiBAcmVnX2NvdW50OiAgIE51bWJlciBvZiBlbnRyaWVzIGlu
IHJlZ19uYW1lcyBhbmQgcmVncyBhcnJheXMuCj4gKyAqIEBhbGl2ZV9jaGVjazogQ29udGV4dCBm
b3IgdGhlIGFsaXZlIGNoZWNraW5nIHdvcmsgaXRlbS4KPiArICogQGFsaXZlOiAgICAgICBXaGV0
aGVyIHRoZSBkZXZpY2UgaXMgYWxpdmUgb3Igbm90IChhbGl2ZV9jaGVjaykuCj4gICAqLwo+ICBz
dHJ1Y3QgdGk5NDhfY3R4IHsKPiAgCXN0cnVjdCBpMmNfY2xpZW50ICppMmM7Cj4gQEAgLTE0MSw2
ICsxNDMsOCBAQCBzdHJ1Y3QgdGk5NDhfY3R4IHsKPiAgCWNvbnN0IGNoYXIgKipyZWdfbmFtZXM7
Cj4gIAlzdHJ1Y3QgcmVndWxhdG9yICoqcmVnczsKPiAgCXNpemVfdCByZWdfY291bnQ7Cj4gKwlz
dHJ1Y3QgZGVsYXllZF93b3JrIGFsaXZlX2NoZWNrOwo+ICsJYm9vbCBhbGl2ZTsKPiAgfTsKPiAg
Cj4gIHN0YXRpYyBib29sIHRpOTQ4X3JlYWRhYmxlX3JlZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVu
c2lnbmVkIGludCByZWcpCj4gQEAgLTM0Niw2ICszNTAsOCBAQCBzdGF0aWMgaW50IHRpOTQ4X3Bv
d2VyX29uKHN0cnVjdCB0aTk0OF9jdHggKnRpOTQ4KQo+ICAJaWYgKHJldCAhPSAwKQo+ICAJCXJl
dHVybiByZXQ7Cj4gIAo+ICsJdGk5NDgtPmFsaXZlID0gdHJ1ZTsKPiArCj4gIAltc2xlZXAoNTAw
KTsKPiAgCj4gIAlyZXR1cm4gMDsKPiBAQCAtMzU2LDYgKzM2Miw4IEBAIHN0YXRpYyBpbnQgdGk5
NDhfcG93ZXJfb2ZmKHN0cnVjdCB0aTk0OF9jdHggKnRpOTQ4KQo+ICAJaW50IGk7Cj4gIAlpbnQg
cmV0Owo+ICAKPiArCXRpOTQ4LT5hbGl2ZSA9IGZhbHNlOwo+ICsKPiAgCWZvciAoaSA9IHRpOTQ4
LT5yZWdfY291bnQ7IGkgPiAwOyBpLS0pIHsKPiAgCQlkZXZfaW5mbygmdGk5NDgtPmkyYy0+ZGV2
LCAiRGlzYWJsaW5nICVzIHJlZ3VsYXRvclxuIiwKPiAgCQkJCXRpOTQ4LT5yZWdfbmFtZXNbaSAt
IDFdKTsKPiBAQCAtMzg4LDggKzM5NiwxNyBAQCBzdGF0aWMgdm9pZCB0aTk0OF9hbGl2ZV9jaGVj
ayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gIHsKPiAgCXN0cnVjdCBkZWxheWVkX3dvcmsg
KmR3b3JrID0gdG9fZGVsYXllZF93b3JrKHdvcmspOwo+ICAJc3RydWN0IHRpOTQ4X2N0eCAqdGk5
NDggPSBkZWxheWVkX3dvcmtfdG9fdGk5NDhfY3R4KGR3b3JrKTsKPiArCWludCByZXQgPSB0aTk0
OF9kZXZpY2VfY2hlY2sodGk5NDgpOwo+ICAKPiAtCWRldl9pbmZvKCZ0aTk0OC0+aTJjLT5kZXYs
ICIlcyBBbGl2ZSBjaGVjayFcbiIsIF9fZnVuY19fKTsKPiArCWlmICh0aTk0OC0+YWxpdmUgPT0g
ZmFsc2UgJiYgcmV0ID09IDApIHsKPiArCQlkZXZfaW5mbygmdGk5NDgtPmkyYy0+ZGV2LCAiRGV2
aWNlIGhhcyBjb21lIGJhY2sgdG8gbGlmZSFcbiIpOwo+ICsJCXRpOTQ4X3dyaXRlX2NvbmZpZ19z
ZXEodGk5NDgpOwo+ICsJCXRpOTQ4LT5hbGl2ZSA9IHRydWU7Cj4gKwo+ICsJfSBlbHNlIGlmICh0
aTk0OC0+YWxpdmUgPT0gdHJ1ZSAmJiByZXQgIT0gMCkgewo+ICsJCWRldl9pbmZvKCZ0aTk0OC0+
aTJjLT5kZXYsICJEZXZpY2UgaGFzIHN0b3BwZWQgcmVzcG9uZGluZ1xuIik7Cj4gKwkJdGk5NDgt
PmFsaXZlID0gZmFsc2U7Cj4gKwl9Cj4gIAo+ICAJLyogUmVzY2hlZHVsZSBvdXJzZWxmIGZvciB0
aGUgbmV4dCBjaGVjay4gKi8KPiAgCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmdGk5NDgtPmFsaXZl
X2NoZWNrLCBUSTk0OF9BTElWRV9DSEVDS19ERUxBWSk7CgotLSAKUmVnYXJkcywKCkxhdXJlbnQg
UGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
