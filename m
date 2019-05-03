Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0582F12EA0
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 15:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34222890D8;
	Fri,  3 May 2019 13:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DE3890D8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 13:00:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B26AD31E;
 Fri,  3 May 2019 15:00:46 +0200 (CEST)
Date: Fri, 3 May 2019 16:00:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 16/22] drm/bridge: tc358767: remove check for video
 mode in link enable
Message-ID: <20190503130033.GH4912@pendragon.ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-17-tomi.valkeinen@ti.com>
 <20190420221450.GS4964@pendragon.ideasonboard.com>
 <e022f4ae-0c62-3d4e-f793-c3e53d60109b@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e022f4ae-0c62-3d4e-f793-c3e53d60109b@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1556888446;
 bh=3W/6c9wdumV/7YFqzLrpOn521/IGJc2qUYEUsLR8OvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=citPL9uwlNOS2EDpnr5Z2X5JYuaq/FI2WbRjwcTyqfcIUvWte+jykljhWmKS/s8Lq
 WNYDZETR6XnTUWLrUgm8G1rnasdQtDhVdh4Ll/m+1gGRiLhhNFezw3rde2VM/0oaDI
 6wyYSPEjl44IQT1IJxJ+bo8Co2CDukUiQ85OpPvk=
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIEZyaSwgTWF5IDAzLCAyMDE5IGF0IDExOjEwOjU0QU0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDIxLzA0LzIwMTkgMDE6MTQsIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBPbiBUdWUsIE1hciAyNiwgMjAxOSBhdCAxMjozMTo0MFBNICswMjAwLCBUb21p
IFZhbGtlaW5lbiB3cm90ZToKPiA+PiB0Y19tYWluX2xpbmtfZW5hYmxlKCkgY2hlY2tzIGlmIHZp
ZGVvbW9kZSBoYXMgYmVlbiBzZXQsIGFuZCBmYWlscyBpZgo+ID4+IHRoZXJlJ3Mgbm8gdmlkZW9t
b2RlLiBBcyB0Y19tYWluX2xpbmtfZW5hYmxlKCkgbm8gbG9uZ2VyIGRlcGVuZHMgb24gdGhlCj4g
Pj4gdmlkZW9tb2RlLCB3ZSBjYW4gZHJvcCB0aGUgY2hlY2suCj4gPiAKPiA+IFNob3VsZG4ndCB5
b3UgbW92ZSB0aGUgY2hlY2sgdG8gdGhlIHN0cmVhbSBlbmFibGUgZnVuY3Rpb24gPyBPciBpZiBp
dCdzCj4gPiBub3QgbmVlZGVkIHRoZXJlLCBleHBsYWluIHdoeSBpbiB0aGUgY29tbWl0IG1lc3Nh
Z2UgPwo+IAo+IFRydWUuIEkgYmVsaWV2ZSBpdCBpcyBub3QgbmVlZGVkLiBJIGRvbid0IHRoaW5r
IGJyaWRnZV9lbmFibGUgc2hvdWxkIGJlCj4gY2FsbGVkIGF0IGFsbCwgaWYgdGhlcmUgaGFzIG5v
dCBiZWVuIGEgbW9kZSBzZXQgYmVmb3JlIGl0LiBJZiB0aGVyZSdzIG5vCj4gbW9kZSwgYnJpZGdl
IGVuYWJsZSBwcmVzdW1hYmx5IHdvdWxkIGZhaWwgZm9yIGFueSBicmlkZ2UuLi4KClRoYXQncyBt
eSB1bmRlcnN0YW5kaW5nIHRvby4gQSBxdWljayBjaGVjayBpbiB0aGUgY29yZSBjb3VsZCBiZSB1
c2VmdWwsCmFuZCBtZW50aW9uaW5nIHRoaXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHRvby4gSWRl
YWxseSB0aGUgZG9jdW1lbnRhdGlvbgpvZiB0aGUgYnJpZGdlIG9wZXJhdGlvbnMgc2hvdWxkIGJl
IHVwZGF0ZWQgdG8gbWFrZSB0aGlzIGNsZWFyIDotKQoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBp
bmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
