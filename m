Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C3F256D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 03:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954E06EE70;
	Thu,  7 Nov 2019 02:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5DB6EE70
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 02:29:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39F532D1;
 Thu,  7 Nov 2019 03:29:38 +0100 (CET)
Date: Thu, 7 Nov 2019 04:29:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/3] dt-bindings: display: renesas: du: Add vendor prefix
 to vsps property
Message-ID: <20191107022929.GK4878@pendragon.ideasonboard.com>
References: <20191105183504.21447-1-geert+renesas@glider.be>
 <20191105183504.21447-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105183504.21447-2-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1573093778;
 bh=10cPkHoiL4VtxxYfO8BfkPKU8pAwjaQbgE/SdPHPfQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vd58pCKjdA2EL4jUIFi6vRgerVlSxLI8b8ge/+SngBcPDCbAyprNVTwSyaWBJQx32
 DBAhLPmZXi2i9p1819pI5XLJeaWlhTrHSm/Bopy43pmwOaFYA2mFu8iAhdZBGnS+gc
 /Db91FIIItFZU+nnIi2FPkrmr7Ve0yhrj8DmzkOo=
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
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFR1ZSwgTm92IDA1LCAyMDE5
IGF0IDA3OjM1OjAyUE0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBUaGUgUmVu
ZXNhcy1zcGVjaWZpYyAidnNwcyIgcHJvcGVydHkgbGFja3MgYSB2ZW5kb3IgcHJlZml4Lgo+IEFk
ZCBhICJyZW5lc2FzLCIgcHJlZml4IHRvIGNvbXBseSB3aXRoIERUIGJlc3QgcHJhY3Rpc2VzLgo+
IAo+IE1vdmUgInJlbmVzYXMsdnNwcyIgYmVsb3cgInJlbmVzYXMsY21tcyIgdG8gcHJlc2VydmUg
YWxwaGFiZXRpY2FsIHNvcnQKPiBvcmRlci4KPiAKPiBGaXhlczogMDY3MTFlNjM4NWE0YWI0YyAo
ImRybTogcmNhci1kdTogRG9jdW1lbnQgdGhlIHZzcHMgcHJvcGVydHkgaW4gdGhlIERUIGJpbmRp
bmdzIikKPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlPgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KCmFuZCB0YWtlbiBpbiBteSB0cmVlLgoKPiAtLS0KPiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dCAgICAgICB8IDEyICsr
KysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9yZW5lc2FzLGR1LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0Cj4gaW5kZXggZjZmZGFhNjdjMjU3YTA0Ni4uZWI0YWU0
MWZlNDFmODNjNyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0Cj4gQEAgLTQxLDE1ICs0MSwxNSBAQCBS
ZXF1aXJlZCBQcm9wZXJ0aWVzOgo+ICAgICAgICBzdXBwbGllZCB0aGV5IG11c3QgYmUgbmFtZWQg
ImRjbGtpbi54IiB3aXRoICJ4IiBiZWluZyB0aGUgaW5wdXQgY2xvY2sKPiAgICAgICAgbnVtZXJp
Y2FsIGluZGV4Lgo+ICAKPiAtICAtIHZzcHM6IEEgbGlzdCBvZiBwaGFuZGxlIGFuZCBjaGFubmVs
IGluZGV4IHR1cGxlcyB0byB0aGUgVlNQcyB0aGF0IGhhbmRsZQo+IC0gICAgdGhlIG1lbW9yeSBp
bnRlcmZhY2VzIGZvciB0aGUgRFUgY2hhbm5lbHMuIFRoZSBwaGFuZGxlIGlkZW50aWZpZXMgdGhl
IFZTUAo+IC0gICAgaW5zdGFuY2UgdGhhdCBzZXJ2ZXMgdGhlIERVIGNoYW5uZWwsIGFuZCB0aGUg
Y2hhbm5lbCBpbmRleCBpZGVudGlmaWVzIHRoZQo+IC0gICAgTElGIGluc3RhbmNlIGluIHRoYXQg
VlNQLgo+IC0KPiAgICAtIHJlbmVzYXMsY21tczogQSBsaXN0IG9mIHBoYW5kbGVzIHRvIHRoZSBD
TU0gaW5zdGFuY2VzIHByZXNlbnQgaW4gdGhlIFNvQywKPiAgICAgIG9uZSBmb3IgZWFjaCBhdmFp
bGFibGUgRFUgY2hhbm5lbC4gVGhlIHByb3BlcnR5IHNoYWxsIG5vdCBiZSBzcGVjaWZpZWQgZm9y
Cj4gICAgICBTb0NzIHRoYXQgZG8gbm90IHByb3ZpZGUgYW55IENNTSAoc3VjaCBhcyBWM00gYW5k
IFYzSCkuCj4gIAo+ICsgIC0gcmVuZXNhcyx2c3BzOiBBIGxpc3Qgb2YgcGhhbmRsZSBhbmQgY2hh
bm5lbCBpbmRleCB0dXBsZXMgdG8gdGhlIFZTUHMgdGhhdAo+ICsgICAgaGFuZGxlIHRoZSBtZW1v
cnkgaW50ZXJmYWNlcyBmb3IgdGhlIERVIGNoYW5uZWxzLiBUaGUgcGhhbmRsZSBpZGVudGlmaWVz
IHRoZQo+ICsgICAgVlNQIGluc3RhbmNlIHRoYXQgc2VydmVzIHRoZSBEVSBjaGFubmVsLCBhbmQg
dGhlIGNoYW5uZWwgaW5kZXggaWRlbnRpZmllcwo+ICsgICAgdGhlIExJRiBpbnN0YW5jZSBpbiB0
aGF0IFZTUC4KPiArCj4gIFJlcXVpcmVkIG5vZGVzOgo+ICAKPiAgVGhlIGNvbm5lY3Rpb25zIHRv
IHRoZSBEVSBvdXRwdXQgdmlkZW8gcG9ydHMgYXJlIG1vZGVsZWQgdXNpbmcgdGhlIE9GIGdyYXBo
Cj4gQEAgLTk2LDggKzk2LDggQEAgRXhhbXBsZTogUjhBNzc5NSAoUi1DYXIgSDMpIEVTMi4wIERV
Cj4gIAkJCSA8JmNwZyBDUEdfTU9EIDcyMj4sCj4gIAkJCSA8JmNwZyBDUEdfTU9EIDcyMT47Cj4g
IAkJY2xvY2stbmFtZXMgPSAiZHUuMCIsICJkdS4xIiwgImR1LjIiLCAiZHUuMyI7Cj4gLQkJdnNw
cyA9IDwmdnNwZDAgMD4sIDwmdnNwZDEgMD4sIDwmdnNwZDIgMD4sIDwmdnNwZDAgMT47Cj4gIAkJ
cmVuZXNhcyxjbW1zID0gPCZjbW0wPiwgPCZjbW0xPiwgPCZjbW0yPiwgPCZjbW0zPjsKPiArCQly
ZW5lc2FzLHZzcHMgPSA8JnZzcGQwIDA+LCA8JnZzcGQxIDA+LCA8JnZzcGQyIDA+LCA8JnZzcGQw
IDE+Owo+ICAKPiAgCQlwb3J0cyB7Cj4gIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoKLS0gClJl
Z2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
