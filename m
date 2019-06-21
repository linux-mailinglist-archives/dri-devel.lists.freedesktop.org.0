Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780E24E130
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8CD6E847;
	Fri, 21 Jun 2019 07:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B476E7EF;
 Fri, 21 Jun 2019 02:14:46 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id D81933E9C9;
 Fri, 21 Jun 2019 02:14:44 +0000 (UTC)
Date: Thu, 20 Jun 2019 22:14:44 -0400
From: Brian Masney <masneyb@onstation.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: display: msm: gmu: add optional ocmem
 property
Message-ID: <20190621021444.GA13972@onstation.org>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-3-masneyb@onstation.org>
 <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
 <CAF6AEGs6By9-LGRBAPw2OwR9tRKJtEiZVgS2WVWRXmOK1VxNLA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGs6By9-LGRBAPw2OwR9tRKJtEiZVgS2WVWRXmOK1VxNLA@mail.gmail.com>
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1561083285;
 bh=UMl+xDCel/ZpC8ltYDruApT4MS7N+u7XvaUpzvn6c5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WN5tpYUjwkiOYyVBf/SFE9Yc8fRGfKwU9KMrtjMpDvNAyMVxoiSe9KN1sCvlD5UCk
 YtMlsZQhOuPzLda11cqC2TZBgsbNFWFDHaEozfq1XpxBcDofSE6ok5X730teBjDO71
 ahj3CZcZLeSD1T0q1kPeCTuqSizp4EJwFFlxtipc=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Andy Gross <agross@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDE6MjE6MjBQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDE6MTcgUE0gUm9iIEhlcnJpbmcgPHJvYmgrZHRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgNzoyOSBB
TSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IFNvbWUgQTN4eCBhbmQgQTR4eCBBZHJlbm8gR1BVcyBkbyBub3QgaGF2ZSBHTUVNIGluc2lkZSB0
aGUgR1BVIGNvcmUgYW5kCj4gPiA+IG11c3QgdXNlIHRoZSBPbiBDaGlwIE1FTW9yeSAoT0NNRU0p
IGluIG9yZGVyIHRvIGJlIGZ1bmN0aW9uYWwuIEFkZCB0aGUKPiA+ID4gb3B0aW9uYWwgb2NtZW0g
cHJvcGVydHkgdG8gdGhlIEFkcmVubyBHcmFwaGljcyBNYW5hZ2VtZW50IFVuaXQgYmluZGluZ3Mu
Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRp
b24ub3JnPgo+ID4gPiAtLS0KPiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21zbS9nbXUudHh0IHwgNCArKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0Cj4gPiA+IGluZGV4IDkwYWY1YjBhNTZh
OS4uYzc0NmI5NWU5NWQ0IDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dAo+ID4gPiBAQCAtMzEsNiAr
MzEsMTAgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKPiA+ID4gIC0gaW9tbXVzOiBwaGFuZGxlIHRv
IHRoZSBhZHJlbm8gaW9tbXUKPiA+ID4gIC0gb3BlcmF0aW5nLXBvaW50cy12MjogcGhhbmRsZSB0
byB0aGUgT1BQIG9wZXJhdGluZyBwb2ludHMKPiA+ID4KPiA+ID4gK09wdGlvbmFsIHByb3BlcnRp
ZXM6Cj4gPiA+ICstIG9jbWVtOiBwaGFuZGxlIHRvIHRoZSBPbiBDaGlwIE1lbW9yeSAoT0NNRU0p
IHRoYXQncyBwcmVzZW50IG9uIHNvbWUgU25hcGRyYWdvbgo+ID4gPiArICAgICAgICAgU29Dcy4g
U2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9jbWVt
LnlhbWwuCj4gPgo+ID4gV2UgYWxyZWFkeSBoYXZlIGEgY291cGxlIG9mIHNpbWlsYXIgcHJvcGVy
dGllcy4gTGV0cyBzdGFuZGFyZGl6ZSBvbgo+ID4gJ3NyYW0nIGFzIHRoYXQgaXMgd2hhdCBUSSBh
bHJlYWR5IHVzZXMuCj4gPgo+ID4gQWxzbywgaXMgdGhlIHdob2xlIE9DTUVNIGFsbG9jYXRlZCB0
byB0aGUgR01VPyBJZiBub3QgeW91IHNob3VsZCBoYXZlCj4gPiBjaGlsZCBub2RlcyB0byBzdWJk
aXZpZGUgdGhlIG1lbW9yeS4KPiA+Cj4gCj4gaWlyYywgZG93bnN0cmVhbSBhIGxhcmdlIGNodW5r
IG9mIE9DTUVNIGlzIHN0YXRpY2FsbHkgYWxsb2NhdGVkIGZvcgo+IEdQVS4uIHRoZSByZW1haW5k
ZXIgaXMgZHluYW1pY2FsbHkgYWxsb2NhdGVkIGZvciBkaWZmZXJlbnQgdXNlLWNhc2VzLgo+IFRo
ZSB1cHN0cmVhbSBkcml2ZXIgQnJpYW4gaXMgcHJvcG9zaW5nIG9ubHkgaGFuZGxlcyB0aGUgc3Rh
dGljCj4gYWxsb2NhdGlvbiBjYXNlCgpJdCBhcHBlYXJzIHRoYXQgdGhlIEdQVSBleHBlY3RzIHRv
IHVzZSBhIHNwZWNpZmljIHJlZ2lvbiBvZiBvY21lbSwKc3BlY2lmaWNhbGx5IHN0YXJ0aW5nIGF0
IDAuIFRoZSBmcmVlZHJlbm8gZHJpdmVyIGFsbG9jYXRlcyAxTUIgb2YKb2NtZW0gb24gdGhlIE5l
eHVzIDUgc3RhcnRpbmcgYXQgb2NtZW0gYWRkcmVzcyAwLiBBcyBhIHRlc3QsIEkKY2hhbmdlZCB0
aGUgc3RhcnRpbmcgYWRkcmVzcyB0byAwLjVNQiBhbmQga21zY3ViZSBzaG93cyBvbmx5IGhhbGYg
dGhlCmN1YmUsIGFuZCBmb3VyIHdpZGUgYmxhY2sgYmFycyBhY3Jvc3MgdGhlIHNjcmVlbjoKCmh0
dHBzOi8vd3d3LmZsaWNrci5jb20vcGhvdG9zL21hc25leWIvNDgxMDA1MzQzODEvCgo+IChhbmQg
SSBkb24ndCB0aGluayB3ZSBoYXZlIHVwc3RyZWFtIHN1cHBvcnQgZm9yIHRoZSB2YXJpb3VzIGF1
ZGlvIGFuZAo+IHZpZGVvIHVzZS1jYXNlcyB0aGF0IHVzZWQgZHluYW1pYyBPQ01FTSBhbGxvY2F0
aW9uIGRvd25zdHJlYW0pCgpUaGF0J3MgbXkgdW5kZXJzdGFuZGluZyBhcyB3ZWxsLgoKPiBBbHRo
b3VnaCBtYXliZSB3ZSBzaG91bGQgc3RpbGwgaGF2ZSBhIGNoaWxkIG5vZGUgdG8gc2VwYXJhdGUg
dGhlCj4gc3RhdGljYWxseSBhbmQgZHluYW1pY2FsbHkgYWxsb2NhdGVkIHBhcnRzPyAgSSdtIG5v
dCBzdXJlIHdoYXQgd291bGQKPiBtYWtlIHRoZSBtb3N0IHNlbnNlLi4KCkdpdmVuIHRoYXQgdGhl
IEdQVSBpcyBleHBlY3RpbmcgYSBmaXhlZCBhZGRyZXNzIGluIG9jbWVtLCBwZXJoYXBzIGl0Cm1h
a2VzIHNlbnNlIHRvIGhhdmUgdGhlIGNoaWxkIG5vZGUuIEhvdyBhYm91dCB0aGlzIGJhc2VkIG9u
IHRoZQpzcmFtL3NyYW0udHh0IGJpbmRpbmdzPwoKICBvY21lbTogb2NtZW1AZmRkMDAwMDAgewog
ICAgY29tcGF0aWJsZSA9ICJxY29tLG1zbTg5NzQtb2NtZW0iOwoKICAgIHJlZyA9IDwweGZkZDAw
MDAwIDB4MjAwMD4sIDwweGZlYzAwMDAwIDB4MTgwMDAwPjsKICAgIHJlZy1uYW1lcyA9ICJjdHJs
IiwgIm1lbSI7CgogICAgY2xvY2tzID0gPCZycG1jYyBSUE1fU01EX09DTUVNR1hfQ0xLPiwgPCZt
bWNjIE9DTUVNQ1hfT0NNRU1OT0NfQ0xLPjsKICAgIGNsb2NrLW5hbWVzID0gImNvcmUiLCAiaWZh
Y2UiOwoKICAgIGdtdS1zcmFtQDAgewogICAgICByZWcgPSA8MHgwIDB4MTAwMDAwPjsKICAgICAg
cG9vbDsKICAgIH07CgogICAgbWlzYy1zcmFtQDAgewogICAgICByZWcgPSA8MHgxMDAwMDAgMHgw
ODAwMDA+OwogICAgICBleHBvcnQ7CiAgICB9OwogIH07CgpJIG1hcmtlZCB0aGUgbWlzYyBwb29s
IGFzIGV4cG9ydCBzaW5jZSBJJ3ZlIHNlZW4gaW4gdGhlIGRvd25zdHJlYW0gb2NtZW0Kc291cmNl
cyBhIHJlZmVyZW5jZSB0byB0aGVpciBjbG9zZWQgbGlic2Vuc29ycyB0aGF0IHJ1bnMgaW4gdXNl
cnNwYWNlLgoKTG9va2luZyBhdCB0aGUgc3JhbSBiaW5kaW5ncyBsZWQgbWUgdG8gdGhlIGdlbmFs
bG9jIEFQSQooRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9nZW5hbGxvYy5yc3QpLiBJIHdvbmRlciBp
ZiB0aGlzIGlzIHRoZSB3YXkgdGhhdAp0aGlzIHNob3VsZCBiZSBkb25lPwoKQnJpYW4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
