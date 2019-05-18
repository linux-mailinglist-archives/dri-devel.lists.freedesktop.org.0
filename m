Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ADA22433
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 19:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D64895D7;
	Sat, 18 May 2019 17:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1DE895D7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2019 17:11:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33A34D5;
 Sat, 18 May 2019 19:11:54 +0200 (CEST)
Date: Sat, 18 May 2019 20:11:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] drm: rcar-du: writeback: include interface header
Message-ID: <20190518171129.GA4995@pendragon.ideasonboard.com>
References: <20190517212050.3561-1-kieran.bingham+renesas@ideasonboard.com>
 <a61ab53c-4e05-991c-f74f-802bd6222d8a@cogentembedded.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a61ab53c-4e05-991c-f74f-802bd6222d8a@cogentembedded.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1558199514;
 bh=YASLlYaoRZMlOBjxaNZY8+vdFHleDHp1QavyehIFddc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rB9siV/LwO7KQBvZQrmGQG76KsI44UZMSHe2yXJvwm226TqVaxHY8dIhFPL1uQWiB
 VcWPmV21XVCHT97OlCTGiHZuMllZWY8nKf17AU647T7sqsjPmnvyzYvj89iCZuM88u
 FVT5PT2TiuAGB0w94X11QT7lxOw4YKwNzDgOjrb0=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2VyZ2VpLAoKT24gU2F0LCBNYXkgMTgsIDIwMTkgYXQgMTE6NDI6MjhBTSArMDMwMCwgU2Vy
Z2VpIFNodHlseW92IHdyb3RlOgo+IEhlbGxvIQo+IAo+IE9uIDE4LjA1LjIwMTkgMDoyMCwgS2ll
cmFuIEJpbmdoYW0gd3JvdGU6Cj4gCj4gPiBUaGUgbmV3IHdyaXRlYmFjayBmZWF0dXJlIGlzIGV4
cG9ydHMgZnVuY3Rpb25zIHNvIHRoYXQgdGhleSBjYW4KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5eIG5vdCBuZWVkZWQ/CgpHb29kIGNhdGNoLiBJJ2xsIGZpeCBpdCBpbiBteSBicmFu
Y2guCgo+ID4gaW50ZWdyYXRlIGludG8gdGhlIHJjYXJfZHVfa21zIG1vZHVsZS4KPiA+IAo+ID4g
VGhlIGludGVyZmFjZSBmdW5jdGlvbnMgYXJlIGRlZmluZWQgaW4gdGhlIHJjYXJfZHVfd3JpdGVi
YWNrIGhlYWRlciwgYnV0Cj4gPiBpdCBpcyBub3QgaW5jbHVkZWQgaW4gdGhlIG9iamVjdCBmaWxl
IGl0c2VsZiBsZWFkaW5nIHRvIGNvbXBpbGVyCj4gPiB3YXJuaW5ncyBmb3IgbWlzc2luZyBwcm90
b3R5cGVzLgo+ID4gCj4gPiBJbmNsdWRlIHRoZSBoZWFkZXIgYXMgYXBwcm9wcmlhdGUuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2Fz
QGlkZWFzb25ib2FyZC5jb20+Cj4gWy4uLl0KPiAKPiBNQlIsIFNlcmdlaQoKLS0gClJlZ2FyZHMs
CgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
