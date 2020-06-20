Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9AE2024C5
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jun 2020 17:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF416E2EA;
	Sat, 20 Jun 2020 15:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4141F6E2E8
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 15:30:16 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7CF968053D;
 Sat, 20 Jun 2020 17:30:13 +0200 (CEST)
Date: Sat, 20 Jun 2020 17:30:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 7/7] drm/panel-simple: Add missing connector type for
 some panels
Message-ID: <20200620153012.GA22743@ravnborg.org>
References: <20200617222703.17080-1-digetx@gmail.com>
 <20200617222703.17080-8-digetx@gmail.com>
 <20200620112132.GB16901@ravnborg.org>
 <20200620114934.GB5829@pendragon.ideasonboard.com>
 <ea421084-a91c-bc03-5997-1723075b7cae@gmail.com>
 <20200620143114.GA22329@ravnborg.org>
 <e77a34c1-3e0b-7f30-25d0-a955ec8d8c86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e77a34c1-3e0b-7f30-25d0-a955ec8d8c86@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=I1XKC5YfttuoCrzH9m8A:9 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5Ck9uIFNhdCwgSnVuIDIwLCAyMDIwIGF0IDA2OjA1OjM3UE0gKzAzMDAsIERtaXRy
eSBPc2lwZW5rbyB3cm90ZToKPiAyMC4wNi4yMDIwIDE3OjMxLCBTYW0gUmF2bmJvcmcg0L/QuNGI
0LXRgjoKPiA+IEhpIERtaXRyeQo+ID4gCj4gPj4KPiA+PiBPb3BzISBHb29kIGNhdGNoIQo+ID4g
WWVwLCB0aGFua3MgTGF1cmVudC4gU2hvdWxkIGhhdmUgdGFrZW4gYSBiZXR0ZXIgbG9vayBiZWZv
cmUgYXBwbHlpbmcuCj4gPiAKPiA+PiBJbmRlZWQsIEkgYmxpbmRseSBzZXQgdGhlIExWRFMgdHlw
ZSB0byBhbGwgdGhlc2UKPiA+PiBwYW5lbHMuIFBsZWFzZSByZXZlcnQgdGhpcyBwYXRjaCwgSSds
bCBkb3VibGUgY2hlY2sgZWFjaCBwYW5lbCBhbmQKPiA+PiBwcmVwYXJlIGFuIHVwZGF0ZWQgdmVy
c2lvbiBvZiB0aGlzIHBhdGNoLiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUKPiA+PiByZXZp
ZXchCj4gPiAKPiA+IElmIHlvdSBjYW4gcHJlcGFyZSBhIGZpeCB3aXRoaW4gYSBmZXcgZGF5cyB0
aGVuIGxldHMgd2FpdCBmb3IgdGhhdC4KPiA+IEkgd2lsbCBkbyBhIGJldHRlciByZXZpZXcgbmV4
dCB0aW1lLgo+IAo+IEhlbGxvIFNhbSwKPiAKPiBJIHNob3VsZCBiZSBhYmxlIHRvIG1ha2UgaXQg
bGF0ZXIgdG9kYXkgb3IgdG9tb3Jyb3cuIENvdWxkIHlvdSBwbGVhc2UKPiBjbGFyaWZ5IHdoYXQg
ZG8geW91IG1lYW4gYnkgdGhlIGZpeCwgZG8geW91IHdoYXQgaXQgdG8gYmUgYXMgYW4KPiBhZGRp
dGlvbmFsIHBhdGNoIG9uIHRvcCBvZiB0aGUgYXBwbGllZCBvbmUgb3IgYSBuZXcgdmVyc2lvbiBv
ZiB0aGUgcGF0Y2g/CkFuIGFkZGl0aW9uYWwgcGF0Y2ggb24gdG9wIG9mIHRoZSBvbmUgYXBwbGll
ZC4KSXQgc2hhbGwgY2FycnkgYSBwcm9wZXIgZml4ZXM6IHRhZyBsaWtlIHRoaXM6CgpGaXhlczog
OTRmMDc5MTdlYmU4ICgiZHJtL3BhbmVsLXNpbXBsZTogQWRkIG1pc3NpbmcgY29ubmVjdG9yIHR5
cGUgZm9yIHNvbWUgcGFuZWxzIikKQ2M6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNv
bT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFRoaWVycnkgUmVkaW5n
IDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
