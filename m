Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451131ABAB
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 12:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5119E898C0;
	Sun, 12 May 2019 10:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1A1898C0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 10:16:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CBEB2B6;
 Sun, 12 May 2019 12:16:03 +0200 (CEST)
Date: Sun, 12 May 2019 13:15:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 00/10] R-Car DU: LVDS dual-link mode support
Message-ID: <20190512101547.GA4960@pendragon.ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWqvKXXfjSAk3GRyk8fwa2TS+EwcV_n0YwcEU9d8XohUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWqvKXXfjSAk3GRyk8fwa2TS+EwcV_n0YwcEU9d8XohUA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1557656163;
 bh=Smh8RnsdxUUwrCpSlzhBkPYPaqOf6kzTv3VYY4pns2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n/bb+H7oHP1+Yqk7gyZBwSx62GTmAJK25PN2UuWMYilITsTd7kWfVyRbUm4f3vII8
 JHw6+DIH7Y0G4Wu4V8HR//FxZikXmWHDee0EKPvwqw5Pevx/hfMKrrG7WhguMeF+5L
 G/KCzA+l2LNo5oeErSlYbG8j2QFbqLjZkeqRKu3w=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsCgpPbiBTdW4sIE1heSAxMiwgMjAxOSBhdCAxMDo1NToyMEFNICswMjAwLCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gT24gU2F0LCBNYXkgMTEsIDIwMTkgYXQgMTE6MDcgUE0g
TGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+IE9uIHRoZSByZWNlaXZpbmcgc2lkZSwgdGhlIFRI
QzYzTFZEMTAyNCBMVkRTLXRvLXBhcmFsbGVsIGJyaWRnZSBoYXMgdHdvCj4gPiBMVkRTIGlucHV0
cyBhbmQgdHdvIHBhcmFsbGVsIG91dHB1dHMuIEl0IGNhbiBvcGVyYXRlIGluIGZvdXIgZGlmZmVy
ZW50Cj4gPiBtb2RlczoKPiA+Cj4gPiAtIFNpbmdsZS1pbiwgc2luZ2xlLW91dDogVGhlIGZpcnN0
IExWRFMgaW5wdXQgcmVjZWl2ZXMgdGhlIHZpZGVvIHN0cmVhbSwKPiA+ICAgYW5kIHRoZSBicmlk
Z2Ugb3V0cHV0cyBpdCBvbiB0aGUgZmlyc3QgcGFyYWxsZWwgb3V0cHV0LiBUaGUgc2Vjb25kCj4g
PiAgIExWRFMgaW5wdXQgYW5kIHRoZSBzZWNvbmQgcGFyYWxsZWwgb3V0cHV0IGFyZSBub3QgdXNl
ZC4KPiA+Cj4gPiAtIFNpbmdsZS1pbiwgZHVhbC1vdXQ6IFRoZSBmaXJzdCBMVkRTIGlucHV0IHJl
Y2VpdmVzIHRoZSB2aWRlbyBzdHJlYW0sCj4gPiAgIGFuZCB0aGUgYnJpZGdlIHNwbGl0cyBldmVu
LSBhbmQgb2RkLW51bWJlcmVkIHBpeGVscyBhbmQgb3V0cHV0cyB0aGVtCj4gPiAgIG9uIHRoZSBm
aXJzdCBhbmQgc2Vjb25kIHBhcmFsbGVsIG91dHB1dHMuIFRoZSBzZWNvbmQgTFZEUyBpbnB1dCBp
cyBub3QKPiA+ICAgdXNlZC4KPiA+Cj4gPiAtIER1YWwtaW4sIHNpbmdsZS1vdXQ6IFRoZSB0d28g
TFZEUyBpbnB1dHMgYXJlIHVzZWQgaW4gZHVhbC1saW5rIG1vZGUsCj4gPiAgIGFuZCB0aGUgYnJp
ZGdlIGNvbWJpbmVzIHRoZSBldmVuLSBhbmQgb2RkLW51bWJlcmVkIHBpeGVscyBhbmQgb3V0cHV0
cwo+ID4gICB0aGVtIG9uIHRoZSBmaXJzdCBwYXJhbGxlbCBvdXRwdXQuIFRoZSBzZWNvbmQgcGFy
YWxsZWwgb3V0cHV0IGlzIG5vdAo+ID4gICB1c2VkLgo+ID4KPiA+IC0gRHVhbC1pbiwgZHVhbC1v
dXQ6IFRoZSB0d28gTFZEUyBpbnB1dHMgYXJlIHVzZWQgaW4gZHVhbC1saW5rIG1vZGUsCj4gPiAg
IGFuZCB0aGUgYnJpZGdlIG91dHB1dHMgdGhlIGV2ZW4tIGFuZCBvZGQtbnVtYmVyZWQgcGl4ZWxz
IG9uIHRoZSBmaXJzdAo+ID4gICBwYXJhbGxlbCBvdXRwdXQuCj4gCj4gYW5kIHRoZSBzZWNvbmQ/
CgpJIHNob3VsZCBoYXZlIHJlYWQgIm9uIHRoZSBmaXJzdCBhbmQgc2Vjb25kIHBhcmFsbGVsIG91
dHB1dHMKcmVzcGVjdGl2ZWx5IiBpbmRlZWQuCgo+ID4gVGhlIG9wZXJhdGluZyBtb2RlIGlzIHNl
bGVjdGVkIGJ5IHR3byBpbnB1dCBwaW5zIG9mIHRoZSBicmlkZ2UsIHdoaWNoCj4gPiBhcmUgY29u
bmVjdGVkIHRvIERJUCBzd2l0Y2hlcyBvbiB0aGUgZGV2ZWxvcG1lbnQgYm9hcmRzIEkgdXNlLiBU
aGUgbW9kZQo+ID4gaXMgdGh1cyBmaXhlZCBmcm9tIGEgTGludXggcG9pbnQgb2Ygdmlldy4KPiAK
PiBDYW4gdGhlIHN0YXRlIG9mIHRoZXNlIHN3aXRjaGVzIGJlIHJlYWQgZnJvbSBzb2Z0d2FyZT8K
ClVuZm9ydHVuYXRlbHkgbm90IDotKAoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
