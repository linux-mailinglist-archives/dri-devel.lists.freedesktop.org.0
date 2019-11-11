Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE890F7044
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B462F6E1B3;
	Mon, 11 Nov 2019 09:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EEB6E1B3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:16:30 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D10C34BB;
 Mon, 11 Nov 2019 04:16:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 11 Nov 2019 04:16:29 -0500
X-ME-Sender: <xms:6ybJXeu0x1QJJObgsILvHQe3sOcXCVOvVrYyrT1UytIqV59h2uVRsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvjedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledrud
 dtjeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecu
 vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6ybJXZfJyvDt3neyds_yxO2il2OqimVf6hPU5EQM6QAV3J2PtmykCA>
 <xmx:6ybJXXZ18rQyPBzQhbADNALFi019tBRuNUERxXgmFmzdQVC9g2o3Ww>
 <xmx:6ybJXUVQZqXp4-UBlASkwi0BVT8d-IaH2XgMqMnhdOezzcBG0xRdbg>
 <xmx:7CbJXe0xMG9EQdfRsehkw-9hE_MmqmKB8aUY2nxGKil6KH1KfHK83w>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0FF8F3060060;
 Mon, 11 Nov 2019 04:16:26 -0500 (EST)
Date: Mon, 11 Nov 2019 10:16:24 +0100
From: Greg KH <greg@kroah.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [BACKPORT 4.14.y 04/18] usb: dwc3: Allow disabling of
 metastability workaround
Message-ID: <20191111091624.GA4139389@kroah.com>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
 <20190905161759.28036-5-mathieu.poirier@linaro.org>
 <20190910143601.GD3362@kroah.com>
 <CANLsYkwkq2fLWsGXHxr2tSBLHdfe4JXgu8ehuD1FOEQeDAPNnA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANLsYkwkq2fLWsGXHxr2tSBLHdfe4JXgu8ehuD1FOEQeDAPNnA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=767pSBRJ5shuYMbgPGJ/NNfiJLw
 uGxahyROFUAPFCyc=; b=QL7E7y/EkKZiIaXtSdO5xlErh7sWmESOBvYArr7CVfp
 eQzc3UERDa9ID9hdy2lFIlSKG6qxAErTf3njeANYlVShDy6UuKgA7ijVOvSazPcr
 g3wjoXv9ZEYeqkbXvf0xTRSWRhXoa1JYrOQt2QjNXGY0UjKrpaPoCwunhc7kKjpb
 /frGGcTi8OBPNTf8rvHE3WO9zkj3pDCRuchNBLsC22DpVKVMK6qSAL+QAJF0ZvId
 utlEu3dYSA+MdZeJj/OfIlrYwLTu+kHwKlBxe0T/sjFJirwbVVtvZg9tz2skBtgb
 uIRhrA1vAjindtTZDdMuPzbNunRo9atznS0r8/pQOhQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=767pSB
 RJ5shuYMbgPGJ/NNfiJLwuGxahyROFUAPFCyc=; b=bDztKrrAvA8V+7wLK3MLVe
 m8W/bcOJD8KxIyKB8OkXlQb0Y3RFA6OsgJx61wa5oIIG5+hDfQVPgsl7LWhb0p/+
 CT+mslvrBRj7y02GVeqDbQxbQquw6kAu7SXKQrHIr36J5XLqTphRRnaHX2zJKrLw
 3Du7MBVCEO7FZh58iviSUnQ9aA2j/QYYn9KDTo4a3JdK/+Z3yrKKPdciuyhU5crQ
 3LWP5KfWvJZ4dxW4zBxAXjNSxkKfjlqolNIGNH/8oH88a1nWMsEoD8yWATMpcd8X
 A+gaQo3VAbFQXhxOkPn9ubd42Yyj/3VBXnDOW/SoYSsYkQGIgiRVKAFeL6ey8jVw
 ==
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 "# 4 . 7" <stable@vger.kernel.org>, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDg6MDE6NDBBTSAtMDYwMCwgTWF0aGlldSBQb2lyaWVy
IHdyb3RlOgo+IE9uIFR1ZSwgMTAgU2VwIDIwMTkgYXQgMDg6MzYsIEdyZWcgS0ggPGdyZWdAa3Jv
YWguY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIFNlcCAwNSwgMjAxOSBhdCAxMDoxNzo0NUFN
IC0wNjAwLCBNYXRoaWV1IFBvaXJpZXIgd3JvdGU6Cj4gPiA+IEZyb206IFJvZ2VyIFF1YWRyb3Mg
PHJvZ2VycUB0aS5jb20+Cj4gPiA+Cj4gPiA+IGNvbW1pdCA0MmJmMDJlYzZlNDIwZTU0MWFmOWE0
NzQzN2QwYmRmOTYxY2EyOTcyIHVwc3RyZWFtCj4gPiA+Cj4gPiA+IFNvbWUgcGxhdGZvcm1zIChl
LmcuIFRJJ3MgRFJBNyBVU0IyIGluc3RhbmNlKSBoYXZlIG1vcmUgdHJvdWJsZQo+ID4gPiB3aXRo
IHRoZSBtZXRhc3RhYmlsaXR5IHdvcmthcm91bmQgYXMgaXQgc3VwcG9ydHMgb25seQo+ID4gPiBh
IEhpZ2gtU3BlZWQgUEhZIGFuZCB0aGUgUEhZIGNhbiBlbnRlciBpbnRvIGFuIEVycmF0aWMgc3Rh
dGUgWzFdCj4gPiA+IHdoZW4gdGhlIGNvbnRyb2xsZXIgaXMgc2V0IGluIFN1cGVyU3BlZWQgbW9k
ZSBhcyBwYXJ0IG9mCj4gPiA+IHRoZSBtZXRhc3RhYmlsaXR5IHdvcmthcm91bmQuCj4gPiA+Cj4g
PiA+IFRoaXMgY2F1c2VzIHVwdG8gMiBzZWNvbmRzIGRlbGF5IGluIGVudW1lcmF0aW9uIG9uIERS
QTcncyBVU0IyCj4gPiA+IGluc3RhbmNlIGluIGdhZGdldCBtb2RlLgo+ID4gPgo+ID4gPiBJZiB0
aGVzZSBwbGF0Zm9ybXMgY2FuIGJlIGJldHRlciBvZmYgd2l0aG91dCB0aGUgd29ya2Fyb3VuZCwK
PiA+ID4gcHJvdmlkZSBhIGRldmljZSB0cmVlIHByb3BlcnR5IHRvIHN1Z2dlc3QgdGhhdCBzbyB0
aGUgd29ya2Fyb3VuZAo+ID4gPiBpcyBhdm9pZGVkLgo+ID4gPgo+ID4gPiBbMV0gRGV2aWNlIG1v
ZGUgZW51bWVyYXRpb24gdHJhY2Ugc2hvd2luZyBQSFkgRXJyYXRpYyBFcnJvci4KPiA+ID4gICAg
ICBpcnEvOTAtZHdjMy05NjkgICBbMDAwXSBkLi4uICAgIDUyLjMyMzE0NTogZHdjM19ldmVudDog
ZXZlbnQgKDAwMDAwOTAxKTogRXJyYXRpYyBFcnJvciBbVTBdCj4gPiA+ICAgICAgaXJxLzkwLWR3
YzMtOTY5ICAgWzAwMF0gZC4uLiAgICA1Mi41NjA2NDY6IGR3YzNfZXZlbnQ6IGV2ZW50ICgwMDAw
MDkwMSk6IEVycmF0aWMgRXJyb3IgW1UwXQo+ID4gPiAgICAgIGlycS85MC1kd2MzLTk2OSAgIFsw
MDBdIGQuLi4gICAgNTIuNzk4MTQ0OiBkd2MzX2V2ZW50OiBldmVudCAoMDAwMDA5MDEpOiBFcnJh
dGljIEVycm9yIFtVMF0KPiA+Cj4gPiBEb2VzIHRoZSBEVCBhbHNvIG5lZWQgdG8gZ2V0IHVwZGF0
ZWQgd2l0aCB0aGlzIG5ldyBpZCBmb3IgdGhpcz8gIElzIHRoYXQKPiA+IGEgc2VwYXJhdGUgcGF0
Y2ggc29tZXdoZXJlPwo+IAo+IFRoZSB1cHN0cmVhbSBjb21taXQgaXM6Cj4gCj4gYjhjOWM2ZmEy
MDAyIEFSTTogZHRzOiBkcmE3OiBEaXNhYmxlIFVTQiBtZXRhc3RhYmlsaXR5IHdvcmthcm91bmQg
Zm9yIFVTQjIKPiAKPiBTaG91bGQgSSBqdXN0IHNlbmQgdGhlIGxhdHRlciBvciB5b3UgcHJlZmVy
IGEgcmVzZW5kIHdpdGggYm90aCBwYXRjaGVzPwoKSSd2ZSBxdWV1ZWQgdGhpcyB1cCBub3csIGFs
b25nIHdpdGggdGhlIHJlc3Qgb2YgdGhpcyBzZXJpZXMsIHRoYW5rcy4KCmdyZWcgay1oCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
