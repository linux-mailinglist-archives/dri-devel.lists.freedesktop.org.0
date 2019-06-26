Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2A656972
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 14:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C936E406;
	Wed, 26 Jun 2019 12:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4266A6E3F7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 12:41:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 875BA20042;
 Wed, 26 Jun 2019 14:41:02 +0200 (CEST)
Date: Wed, 26 Jun 2019 14:41:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v6 0/2] Add DSI panel driver for Raydium RM67191
Message-ID: <20190626124100.GA7337@ravnborg.org>
References: <1561550907-9733-1-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561550907-9733-1-git-send-email-robert.chiras@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=scLJrMPQxwMJoNrha8MA:9 a=CjuIK1q_8ugA:10
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
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDM6MDg6MjVQTSArMDMwMCwgUm9iZXJ0IENoaXJhcyB3
cm90ZToKPiBUaGlzIHBhdGNoLXNldCBjb250YWlucyB0aGUgRFJNIHBhbmVsIGRyaXZlciBhbmQg
ZHQtYmluZGluZ3MgZG9jdW1lbnRhdGlvbgo+IGZvciB0aGUgRFNJIGRyaXZlbiBwYW5lbDogUmF5
ZGl1bSBSTTY3MTkxLgo+IAo+IHY2Ogo+IC0gQ29sbGVjdGVkIFJldmlld2VkLWJ5IGZyb20gRmFi
aW8KPiAtIFJlbW92ZWQgdW51c2VkIHZhcmlhYmxlcyAoc2FtKQo+IAo+IHY1Ogo+IC0gUmVtb3Zl
ZCB1bm5lY2Vzc2FyeSBkZWJ1ZyBtZXNzYWdlcyAoZmFiaW8pCj4gLSBIYW5kbGVkIGVycm9yIGNh
c2UgZm9yIGdwaW8gcGluIChmYWJpbykKPiAKPiB2NDoKPiAtIENoYW5nZWQgZGVmYXVsdF90aW1p
bmcgc3RydWN0dXJlIHR5cGUgZnJvbSAnc3RydWN0IGRpc3BsYXlfdGltaW5nJyB0bwo+ICAgJ3N0
cnVjdCBkcm1fZGlzcGxheV9tb2RlJyAoZmFiaW8pCj4gLSBSZXBsYWNlZCBkZXZtX2dwaW9kX2dl
dCB3aXRoIGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsIChmYWJpbykKPiAtIEFkZGVkIHBvd2VyIHJl
Z3VsYXRvcnMgKGZhYmlvKQo+IC0gUmVtb3ZlZCBwbV9vcHMgKGZhYmlvKQo+IAo+IHYzOgo+IC0g
QWRkZWQgbXlzZWxmIHRvIE1BSU5UQUlORVJTIGZvciB0aGlzIGRyaXZlciAoc2FtKQo+IC0gUmVt
b3ZlZCBkaXNwbGF5LXRpbWluZ3MgcHJvcGVydHkgKGZhYmlvKQo+IC0gRml4ZWQgZHQgZGVzY3Jp
cHRpb24gKHNhbSkKPiAtIFJlLWFycmFuZ2VkIGNhbGxzIGluc2lkZSBnZXRfbW9kZXMgZnVuY3Rp
b24gKHNhbSkKPiAtIENoYW5nZWQgaWZkZWZzIHdpdGggX21heWJlX3VudXNlZCBmb3Igc3VzcGVu
ZC9yZXN1bWUgZnVuY3Rpb25zIChzYW0pCj4gLSBDb2xsZWN0ZWQgUmV2aWV3ZWQtYnkgZnJvbSBT
YW0KPiAKPiB2MjoKPiAtIEZpeGVkICdyZXNldC1ncGlvJyB0byAncmVzZXQtZ3Bpb3MnIHByb3Bl
cnR5IG5hbWluZyAoZmFiaW8pCj4gLSBDaGFuZ2VkIHRoZSBzdGF0ZSBvZiB0aGUgcmVzZXQgZ3Bp
byB0byBhY3RpdmUgbG93IGFuZCBmaXhlZCBob3cgaXQgaXMKPiAgIGhhbmRsZWQgaW4gZHJpdmVy
IChmYWJpbykKPiAtIEZpeGVkIGNvcHlyaWdodCBzdGF0ZW1lbnQgKGRhbmllbCkKPiAtIFJlb3Jk
ZXJlZCBpbmNsdWRlcyAoc2FtKQo+IC0gQWRkZWQgZGVmaW5lcyBmb3IgcGFuZWwgc3BlY2lmaWMg
Y29sb3IgZm9ybWF0cyAoZmFiaW8pCj4gLSBSZW1vdmVkIHVubmVjZXNzYXJ5IHRlc3RzIGluIGVu
YWJsZSBhbmQgdW5wcmVwYXJlIChzYW0pCj4gLSBSZW1vdmVkIHRoZSB1bm5lY2Vzc2FyeSBiYWNr
bGlnaHQgd3JpdGUgaW4gZW5hYmxlIChzYW0pCj4gKioqIFNVQkpFQ1QgSEVSRSAqKioKPiAKPiAq
KiogQkxVUkIgSEVSRSAqKioKPiAKPiBSb2JlcnQgQ2hpcmFzICgyKToKPiAgIGR0LWJpbmRpbmdz
OiBkaXNwbGF5OiBwYW5lbDogQWRkIHN1cHBvcnQgZm9yIFJheWRpdW0gUk02NzE5MSBwYW5lbAo+
ICAgZHJtL3BhbmVsOiBBZGQgc3VwcG9ydCBmb3IgUmF5ZGl1bSBSTTY3MTkxIHBhbmVsIGRyaXZl
cgoKVGhhbmtzLCBwYXRjaGVzIGFyZSBhcHBsaWVkIHRvIGRybS1taXNjLW5leHQgYW5kIHB1c2hl
ZCBvdXQuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
