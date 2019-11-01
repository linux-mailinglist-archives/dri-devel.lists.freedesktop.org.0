Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28642EBEC1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 08:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204A76F733;
	Fri,  1 Nov 2019 07:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244AD6F733
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 07:57:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [109.190.253.13])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5624D2D1;
 Fri,  1 Nov 2019 08:57:35 +0100 (CET)
Date: Fri, 1 Nov 2019 09:57:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH V5 1/3] drm/panel: simple: Add Logic PD Type 28 display
 support
Message-ID: <20191101075726.GB6209@pendragon.ideasonboard.com>
References: <20191016135147.7743-1-aford173@gmail.com>
 <CAHCN7xJ-1b_OHXy_u8TvA5i4PuWGbci6YN3x1hUY_UaLxzu+QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCN7xJ-1b_OHXy_u8TvA5i4PuWGbci6YN3x1hUY_UaLxzu+QQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1572595055;
 bh=DKSEd/4zmCFtM4D8ZLoAyFUzhEtzYdFH9A2SAZ6Kmsg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WA+ly02RQE1bXxx9ReIa6usD0bl1d0D1w+iCYgmRRvvUZpa3hkog3EbmOq8v5Ui1q
 4JG9vZOadNUP3DwmdCtRMOUpIxAQP2R5HeFwf8vlq7xD+LeH/8tP9M/zIr/dWbcszb
 Pcd5Hz3IdhJhK6K4Ce+Cwr2E/vBruD5SNpzPX5SE=
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
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDk6NDQ6MjBBTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3Rl
Ogo+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDg6NTIgQU0gQWRhbSBGb3JkIDxhZm9yZDE3M0Bn
bWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IFByZXZpb3VzbHksIHRoZXJlIHdhcyBhbiBvbWFwIHBh
bmVsLWRwaSBkcml2ZXIgdGhhdCB3b3VsZAo+ID4gcmVhZCBnZW5lcmljIHRpbWluZ3MgZnJvbSB0
aGUgZGV2aWNlIHRyZWUgYW5kIHNldCB0aGUgZGlzcGxheQo+ID4gdGltaW5nIGFjY29yZGluZ2x5
LiAgVGhpcyBkcml2ZXIgd2FzIHJlbW92ZWQgc28gdGhlIHNjcmVlbgo+ID4gbm8gbG9uZ2VyIGZ1
bmN0aW9ucy4gIFRoaXMgcGF0Y2ggbW9kaWZpZXMgdGhlIHBhbmVsLXNpbXBsZQo+ID4gZmlsZSB0
byBzZXR1cCB0aGUgdGltaW5ncyB0byB0aGUgc2FtZSB2YWx1ZXMgcHJldmlvdXNseSB1c2VkLgo+
ID4KPiA+IEZpeGVzOiA4YmY0YjE2MjExNzggKCJkcm0vb21hcDogUmVtb3ZlIHBhbmVsLWRwaSBk
cml2ZXIiKQo+IAo+IFdpbGwgdGhpcyBiZSBhYmxlIHRvIG1ha2UgaXQgaW50byBsaW51eC1uZXh0
IGZvciB0aGUgNS41IG1lcmdlIHdpbmRvdz8KPiBJIGJlbGlldmUgVG9ueSBoYXMgcGlja2VkIHVw
IHRoZSBkZXZpY2UgdHJlZSBwb3J0aW9uIGluIGhpcyBvbWFwCj4gdHJlZSwgYnV0IEkgaGF2ZW4n
dCBzZWVuIGFueSBub3RpZmljYXRpb25zIG9uIHRoaXMgc2VyaWVzIG9uIHdoZXRoZXIKPiBvciBu
b3QgaXQncyBiZWluZyBhcHBsaWVkLiAgSSBhbHNvIGRvbid0IGtub3cgd2hpY2ggdHJlZSBJIG5l
ZWQgdG8KPiBsb29rIGlmIGl0J3MgYWxyZWFkeSBiZWVuIGFwcGxpZWQuCj4gCj4gVGhpcyBmaXhl
cyBhIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCBhIHdoaWxlIGFnbyB3aGVyZSB0aGUgZHJpdmVyIEkg
d2FzCj4gdXNpbmcgZm9yIHRoZSBkaXNwbGF5IHdhcyByZW1vdmVkLgoKU2FtLCB3b3VsZCB5b3Ug
YmUgYWJsZSB0byBwaWNrIHRoaXMgdXAgPwoKPiA+IFNpZ25lZC1vZmYtYnk6IEFkYW0gRm9yZCA8
YWZvcmQxNzNAZ21haWwuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KPiA+IC0tLQo+ID4gVjU6ICBObyBDaGFuZ2UKPiA+IFY0OiAgTm8gQ2hhbmdl
Cj4gPiBWMzogIE5vIENoYW5nZQo+ID4gVjI6ICBObyBDaGFuZ2UKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gPiBpbmRleCA1ZDQ4NzY4NmQyNWMuLjcyZjY5NzA5ZjM0
OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gPiBAQCAtMjA2
MSw2ICsyMDYxLDQwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBtaXRz
dWJpc2hpX2FhMDcwbWMwMV9tb2RlID0gewo+ID4gICAgICAgICAuZmxhZ3MgPSBEUk1fTU9ERV9G
TEFHX05IU1lOQyB8IERSTV9NT0RFX0ZMQUdfTlZTWU5DLAo+ID4gIH07Cj4gPgo+ID4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBsb2dpY3BkX3R5cGVfMjhfbW9kZSA9IHsK
PiA+ICsgICAgICAgLmNsb2NrID0gOTAwMCwKPiA+ICsgICAgICAgLmhkaXNwbGF5ID0gNDgwLAo+
ID4gKyAgICAgICAuaHN5bmNfc3RhcnQgPSA0ODAgKyAzLAo+ID4gKyAgICAgICAuaHN5bmNfZW5k
ID0gNDgwICsgMyArIDQyLAo+ID4gKyAgICAgICAuaHRvdGFsID0gNDgwICsgMyArIDQyICsgMiwK
PiA+ICsKPiA+ICsgICAgICAgLnZkaXNwbGF5ID0gMjcyLAo+ID4gKyAgICAgICAudnN5bmNfc3Rh
cnQgPSAyNzIgKyAyLAo+ID4gKyAgICAgICAudnN5bmNfZW5kID0gMjcyICsgMiArIDExLAo+ID4g
KyAgICAgICAudnRvdGFsID0gMjcyICsgMiArIDExICsgMywKPiA+ICsgICAgICAgLnZyZWZyZXNo
ID0gNjAsCj4gPiArICAgICAgIC5mbGFncyA9IERSTV9NT0RFX0ZMQUdfUEhTWU5DIHwgRFJNX01P
REVfRkxBR19QVlNZTkMsCj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBh
bmVsX2Rlc2MgbG9naWNwZF90eXBlXzI4ID0gewo+ID4gKyAgICAgICAubW9kZXMgPSAmbG9naWNw
ZF90eXBlXzI4X21vZGUsCj4gPiArICAgICAgIC5udW1fbW9kZXMgPSAxLAo+ID4gKyAgICAgICAu
YnBjID0gOCwKPiA+ICsgICAgICAgLnNpemUgPSB7Cj4gPiArICAgICAgICAgICAgICAgLndpZHRo
ID0gMTA1LAo+ID4gKyAgICAgICAgICAgICAgIC5oZWlnaHQgPSA2NywKPiA+ICsgICAgICAgfSwK
PiA+ICsgICAgICAgLmRlbGF5ID0gewo+ID4gKyAgICAgICAgICAgICAgIC5wcmVwYXJlID0gMjAw
LAo+ID4gKyAgICAgICAgICAgICAgIC5lbmFibGUgPSAyMDAsCj4gPiArICAgICAgICAgICAgICAg
LnVucHJlcGFyZSA9IDIwMCwKPiA+ICsgICAgICAgICAgICAgICAuZGlzYWJsZSA9IDIwMCwKPiA+
ICsgICAgICAgfSwKPiA+ICsgICAgICAgLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4
OF8xWDI0LAo+ID4gKyAgICAgICAuYnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX0RFX0hJR0ggfCBE
Uk1fQlVTX0ZMQUdfUElYREFUQV9EUklWRV9QT1NFREdFIHwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgIERSTV9CVVNfRkxBR19TWU5DX0RSSVZFX05FR0VER0UsCj4gPiArfTsKPiA+ICsKPiA+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgbWl0c3ViaXNoaV9hYTA3MG1jMDEgPSB7Cj4g
PiAgICAgICAgIC5tb2RlcyA9ICZtaXRzdWJpc2hpX2FhMDcwbWMwMV9tb2RlLAo+ID4gICAgICAg
ICAubnVtX21vZGVzID0gMSwKPiA+IEBAIC0zMjg3LDYgKzMzMjEsOSBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gewo+ID4gICAgICAgICB9
LCB7Cj4gPiAgICAgICAgICAgICAgICAgLmNvbXBhdGlibGUgPSAibGcsbHAxMjlxZSIsCj4gPiAg
ICAgICAgICAgICAgICAgLmRhdGEgPSAmbGdfbHAxMjlxZSwKPiA+ICsgICAgICAgfSwgewo+ID4g
KyAgICAgICAgICAgICAgIC5jb21wYXRpYmxlID0gImxvZ2ljcGQsdHlwZTI4IiwKPiA+ICsgICAg
ICAgICAgICAgICAuZGF0YSA9ICZsb2dpY3BkX3R5cGVfMjgsCj4gPiAgICAgICAgIH0sIHsKPiA+
ICAgICAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJtaXRzdWJpc2hpLGFhMDcwbWMwMS1jYTEi
LAo+ID4gICAgICAgICAgICAgICAgIC5kYXRhID0gJm1pdHN1YmlzaGlfYWEwNzBtYzAxLAoKLS0g
ClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
