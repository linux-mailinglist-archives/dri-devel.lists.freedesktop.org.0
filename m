Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CFC5B19C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 22:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABEB89DF9;
	Sun, 30 Jun 2019 20:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7DC89DF9;
 Sun, 30 Jun 2019 20:47:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47CFD255;
 Sun, 30 Jun 2019 22:47:43 +0200 (CEST)
Date: Sun, 30 Jun 2019 23:47:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 0/4] drm+dt+efi: support devices with multiple possible
 panels
Message-ID: <20190630204723.GH7043@pendragon.ideasonboard.com>
References: <20190630203614.5290-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190630203614.5290-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1561927663;
 bh=dBe3yAq6Q1C4VcXG06Vz7nXaIG0pbndeYddXgCeKg/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JvQhk0CYuLPmvsnXgMfQ54qleQCRDC8h/euYya5WJKEGZT4y8cPE6Qkd/pT7ktb2c
 BNXwwxE1Vl5Rh76y5JDDSQFISCh4/fpR2a+4HdNPKJdBK14JEHP2ycWds3maKAy/UD
 Ef8mWClZdv+sgFXvRnCu62dq9xZKjV4vxoaEy31k=
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 "open list:EXTENSIBLE FIRMWARE INTERFACE \(EFI\)"
 <linux-efi@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-arm-msm@vger.kernel.org,
 Julien Thierry <julien.thierry@arm.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 freedreno@lists.freedesktop.org, Ingo Molnar <mingo@kernel.org>,
 Steve Capper <steve.capper@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTdW4sIEp1biAzMCwgMjAxOSBh
dCAwMTozNjowNFBNIC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gRnJvbTogUm9iIENsYXJrIDxy
b2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IAo+IE5vdyB0aGF0IHdlIGNhbiBkZWFsIGdyYWNlZnVs
bHkgd2l0aCBib290bG9hZGVyIChmaXJtd2FyZSkgaW5pdGlhbGl6ZWQKPiBkaXNwbGF5IG9uIGFh
cmNoNjQgbGFwdG9wc1sxXSwgdGhlIG5leHQgc3RlcCBpcyB0byBkZWFsIHdpdGggdGhlIGZhY3QK
PiB0aGF0IHRoZSBzYW1lIG1vZGVsIG9mIGxhcHRvcCBjYW4gaGF2ZSBvbmUgb2YgbXVsdGlwbGUg
ZGlmZmVyZW50IHBhbmVscy4KPiAoRm9yIHRoZSB5b2dhIGM2MzAgdGhhdCBJIGhhdmUsIEkga25v
dyBvZiBhdCBsZWFzdCB0d28gcG9zc2libGUgcGFuZWxzLAo+IHRoZXJlIG1pZ2h0IGJlIGEgdGhp
cmQuKQoKSSBoYXZlIHRvIGFzayB0aGUgb2J2aW91cyBxdWVzdGlvbjogd2h5IGRvZXNuJ3QgdGhl
IGJvb3QgbG9hZGVyIGp1c3QKcGFzcyBhIGNvcnJlY3QgRFQgdG8gTGludXggPyBUaGVyZSdzIG5v
IHBvaW50IGluIHBhc3NpbmcgYSBsaXN0IG9mCnBhbmVscyB0aGF0IGFyZSBub3QgdGhlcmUsIHRo
aXMgc2VlbXMgcXVpdGUgYSBiaWcgaGFjayB0byBtZS4gQSBwcm9wZXIKYm9vdCBsb2FkZXIgc2hv
dWxkIGNvbnN0cnVjdCB0aGUgRFQgYmFzZWQgb24gaGFyZHdhcmUgZGV0ZWN0aW9uLgoKPiBUaGlz
IGlzIGFjdHVhbGx5IGEgc2NlbmFyaW8gdGhhdCBjb21lcyB1cCBmcmVxdWVudGx5IGluIHBob25l
cyBhbmQKPiB0YWJsZXRzIGFzIHdlbGwsIHNvIGl0IGlzIHVzZWZ1bCB0byBoYXZlIGFuIHVwc3Ry
ZWFtIHNvbHV0aW9uIGZvciB0aGlzLgo+IAo+IFRoZSBiYXNpYyBpZGVhIGlzIHRvIGFkZCBhICdw
YW5lbC1pZCcgcHJvcGVydHkgaW4gZHQgY2hvc2VuIG5vZGUsIGFuZAo+IHVzZSB0aGF0IHRvIHBp
Y2sgdGhlIGVuZHBvaW50IHdlIGxvb2sgYXQgd2hlbiBsb2FkaW5nIHRoZSBwYW5lbCBkcml2ZXIs
Cj4gZS5nLgo+IAo+IC8gewo+IAljaG9zZW4gewo+IAkJcGFuZWwtaWQgPSA8MHhjND47Cj4gCX07
Cj4gCj4gCWl2b19wYW5lbCB7Cj4gCQljb21wYXRpYmxlID0gIml2byxtMTMzbndmNC1yMCI7Cj4g
CQlwb3dlci1zdXBwbHkgPSA8JnZsY21fM3YzPjsKPiAJCW5vLWhwZDsKPiAKPiAJCXBvcnRzIHsK
PiAJCQlwb3J0IHsKPiAJCQkJaXZvX3BhbmVsX2luX2VkcDogZW5kcG9pbnQgewo+IAkJCQkJcmVt
b3RlLWVuZHBvaW50ID0gPCZzbjY1ZHNpODZfb3V0X2l2bz47Cj4gCQkJCX07Cj4gCQkJfTsKPiAJ
CX07Cj4gCX07Cj4gCj4gCWJvZV9wYW5lbCB7Cj4gCQljb21wYXRpYmxlID0gImJvZSxudjEzM2Zo
bS1uNjEiOwo+IAkJcG93ZXItc3VwcGx5ID0gPCZ2bGNtXzN2Mz47Cj4gCQluby1ocGQ7Cj4gCj4g
CQlwb3J0cyB7Cj4gCQkJcG9ydCB7Cj4gCQkJCWJvZV9wYW5lbF9pbl9lZHA6IGVuZHBvaW50IHsK
PiAJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmc242NWRzaTg2X291dF9ib2U+Owo+IAkJCQl9Owo+
IAkJCX07Cj4gCQl9Owo+IAl9Owo+IAo+IAlzbjY1ZHNpODY6IGJyaWRnZUAyYyB7Cj4gCQljb21w
YXRpYmxlID0gInRpLHNuNjVkc2k4NiI7Cj4gCj4gCQkuLi4KPiAKPiAJCXBvcnRzIHsKPiAJCQkj
YWRkcmVzcy1jZWxscyA9IDwxPjsKPiAJCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiAKPiAJCQkuLi4K
PiAKPiAJCQlwb3J0QDEgewo+IAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiAJCQkJI3NpemUt
Y2VsbHMgPSA8MD47Cj4gCQkJCXJlZyA9IDwxPjsKPiAKPiAJCQkJZW5kcG9pbnRAYzQgewo+IAkJ
CQkJcmVnID0gPDB4YzQ+Owo+IAkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZib2VfcGFuZWxfaW5f
ZWRwPjsKPiAJCQkJfTsKPiAKPiAJCQkJZW5kcG9pbnRAYzUgewo+IAkJCQkJcmVnID0gPDB4YzU+
Owo+IAkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZpdm9fcGFuZWxfaW5fZWRwPjsKPiAJCQkJfTsK
PiAJCQl9Owo+IAkJfTsKPiAJfQo+IH07Cj4gCj4gTm90ZSB0aGF0IHRoZSBwYW5lbC1pZCBpcyBw
b3RlbnRpYWxseSBhIHNwYXJzZS1pbnQuICBUaGUgdmFsdWVzIEkndmUKPiBzZWVuIHNvIGZhciBv
biBhYXJjaDY0IGxhcHRvcHMgYXJlOgo+IAo+ICAgKiAweGMyCj4gICAqIDB4YzMKPiAgICogMHhj
NAo+ICAgKiAweGM1Cj4gICAqIDB4ODAxMQo+ICAgKiAweDgwMTIKPiAgICogMHg4MDU1Cj4gICAq
IDB4ODA1Ngo+IAo+IEF0IGxlYXN0IG9uIHNuYXBkcmFnb24gYWFyY2g2NCBsYXB0b3BzLCB0aGV5
IGNhbiBiZSBhbnkgdTMyIHZhbHVlLgo+IAo+IEhvd2V2ZXIsIG9uIHRoZXNlIGxhcHRvcHMsIHRo
ZSBib290bG9hZGVyL2Zpcm13YXJlIGlzIG5vdCBwb3B1bGF0aW5nIHRoZQo+IGNob3NlbiBub2Rl
LCBidXQgaW5zdGVhZCBwcm92aWRpbmcgYW4gIlVFRklEaXNwbGF5SW5mbyIgdmFyaWFibGUsIHdo
aWNoCj4gY29udGFpbnMgdGhlIHBhbmVsIGlkLiAgVW5mb3J0dW5hdGVseSBFRkkgdmFyaWFibGVz
IGFyZSBvbmx5IGF2YWlsYWJsZQo+IGJlZm9yZSBFeGl0Qm9vdFNlcnZpY2VzLCBzbyB0aGUgc2Vj
b25kIHBhdGNoIGNoZWNrcyBmb3IgdGhpcyB2YXJpYWJsZQo+IGJlZm9yZSBFQlMgYW5kIHBvcHVs
YXRlcyB0aGUgL2Nob3Nlbi9wYW5lbC1pZCB2YXJpYWJsZS4KPiAKPiBbMV0gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MzAwMS8KPiAKPiBSb2IgQ2xhcmsgKDQpOgo+
ICAgZHQtYmluZGluZ3M6IGNob3NlbjogZG9jdW1lbnQgcGFuZWwtaWQgYmluZGluZwo+ICAgZWZp
L2xpYnN0dWI6IGRldGVjdCBwYW5lbC1pZAo+ICAgZHJtOiBhZGQgaGVscGVyIHRvIGxvb2t1cCBw
YW5lbC1pZAo+ICAgZHJtL2JyaWRnZTogdGktc242NWRzaTg2OiB1c2UgaGVscGVyIHRvIGxvb2t1
cCBwYW5lbC1pZAo+IAo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2hvc2Vu
LnR4dCB8IDY5ICsrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZmlybXdhcmUvZWZpL2xp
YnN0dWIvYXJtLXN0dWIuYyAgICAgIHwgNDkgKysrKysrKysrKysrKysKPiAgZHJpdmVycy9maXJt
d2FyZS9lZmkvbGlic3R1Yi9lZmlzdHViLmggICAgICAgfCAgMiArCj4gIGRyaXZlcnMvZmlybXdh
cmUvZWZpL2xpYnN0dWIvZmR0LmMgICAgICAgICAgIHwgIDkgKysrCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGktc242NWRzaTg2LmMgICAgICAgIHwgIDUgKy0KPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9vZi5jICAgICAgICAgICAgICAgICAgICAgfCAyMSArKysrKysKPiAgaW5jbHVkZS9kcm0v
ZHJtX29mLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgNyArKwo+ICA3IGZpbGVzIGNoYW5n
ZWQsIDE2MCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0gClJlZ2FyZHMsCgpMYXVy
ZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
