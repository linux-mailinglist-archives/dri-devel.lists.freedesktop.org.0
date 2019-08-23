Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDA79ADE7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 13:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835E26EC77;
	Fri, 23 Aug 2019 11:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CD06EC77
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 11:10:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-35-98-nat.elisa-mobile.fi
 [85.76.35.98])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5CE02B2;
 Fri, 23 Aug 2019 13:10:23 +0200 (CEST)
Date: Fri, 23 Aug 2019 14:10:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas.Ferre@microchip.com
Subject: Re: [PATCH 1/2] drm/panel: Add and fill drm_panel type field
Message-ID: <20190823111013.GA5028@pendragon.ideasonboard.com>
References: <20190823014033.2971-1-laurent.pinchart@ideasonboard.com>
 <01887051-7cf7-cf52-65d1-85d60c3dd02c@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01887051-7cf7-cf52-65d1-85d60c3dd02c@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566558624;
 bh=7hFlSu+l2f07SuNrf5SpL/r4UgVJh8iwsTm17b3kSJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BG6D9eMgZ0V9sAyAQdsB5P6VtY43bXtNZdzSkqZHFL1/pM2RC61OIGqtb5G11Lup7
 g/mT1oECMn3SPUwx4lLOf02J/uSur1wliUBo9RT+SbCbH5+sKX95KVv1kZCSWYBchb
 s6ma86kaPVg4t3ES0xf4sPeonhOjYWcDp6lP00/Y=
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
Cc: alexandre.belloni@bootlin.com, narmstrong@baylibre.com, agx@sigxcpu.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 thierry.reding@gmail.com, sam@ravnborg.org, stefan@olimex.com,
 tomi.valkeinen@ti.com, Tudor.Ambarus@microchip.com,
 Ludovic.Desroches@microchip.com, boris.brezillon@collabora.com,
 jagan@amarulasolutions.com, robert.chiras@nxp.com, alexandre.torgue@st.com,
 jonas@kwiboo.se, jsarha@ti.com, vincent.abriou@st.com, jernej.skrabec@siol.net,
 kernel@puri.sm, philippe.cornu@st.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, mcoquelin.stm32@gmail.com,
 Claudiu.Beznea@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmljb2xhcywKCk9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDA3OjMwOjA3QU0gKzAwMDAsIE5p
Y29sYXMuRmVycmVAbWljcm9jaGlwLmNvbSB3cm90ZToKPiBPbiAyMy8wOC8yMDE5IGF0IDAzOjQw
LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gQWRkIGEgdHlwZSBmaWVsZCB0byB0aGUgZHJt
X3BhbmVsIHN0cnVjdHVyZSB0byByZXBvcnQgdGhlIHBhbmVsIHR5cGUsCj4gPiB1c2luZyBEUk1f
TU9ERV9DT05ORUNUT1JfKiBtYWNyb3MgKHRoZSB2YWx1ZXMgdGhhdCBtYWtlIHNlbnNlIGFyZSBM
VkRTLAo+ID4gZURQLCBEU0kgYW5kIERQSSkuIFRoaXMgd2lsbCBiZSB1c2VkIHRvIGluaXRpYWxp
c2UgdGhlIGNvcnJlc3BvbmRpbmcKPiA+IGNvbm5lY3RvciB0eXBlLgo+IAo+IFdpdGggTWljcm9j
aGlwL0F0bWVsIGRyaXZlciwgd2UgbWFpbmx5IChvbmx5KSB1c2UgdGhlICJVbmtub3duIiB0eXBl
IG9mIAo+IGNvbm5lY3RvciBiZWNhdXNlIG91ciBoYXJkd2FyZSBzaW1wbHkgdXNlcyBSR0Igd2ly
ZXMgaW4gcGFyYWxsZWwuCgpUaGF0J3MgY2FsbGVkIERQSSAoRGlzcGxheSBQaXhlbCBJbnRlcmZh
Y2UsIHNvbWV0aW1lcyBhbHNvIHJlZmVycmVkIHRvCmFzIERpc3BsYXkgUGFyYWxsZWwgSW50ZXJm
YWNlKSA6LSkKCj4gU2hvdWxkIHdlIG1vdmUgdG8gYW5vdGhlciBjb25uZWN0b3IgdHlwZSAobWF5
YmUgbm93IHRoYXQgaXQncyBjcmVhdGVkIAo+IGFuZCBpdCB3YXMgbm90LCBiYWNrIHdoZW4gd2Ug
Y2hvc2UgdGhlICJVbmtub3duIiBvbmUpPwoKSSB0aGluayBEUk1fTU9ERV9DT05ORUNUT1JfRFBJ
IHdvdWxkIGJlIGJlc3QsIHllcy4KCj4gV2hhdCB3b3VsZCBiZSB0aGUgY29uc2VxdWVuY2VzIGlm
IHdlIG1vdmUgKHNpbGVudGx5PykgdG8gYW5vdGhlciB0eXBlIAo+IGFuZCBwYXJ0aWN1bGFybHkg
b24gdGhlIGNvbW1hbmQgbGluZSBhcmd1bWVudCBsaWtlIHRoZSBvbmVzIHdlIGN1cnJlbnRseSAK
PiB1c2U6ICJVbmtub3duLTE6ODAweDQ4MC0xNiI/CgpUaGF0IHdpbGwgYmUgbmFzdHkgdG8gaGFu
ZGxlIDotKCBBcyBtdWNoIGFzIEknZCBsb3ZlIHRvIGlnbm9yZSB0aGF0Cmlzc3VlLCBJIGRvbid0
IHRoaW5rIHdlIGNhbi4gQXQgdGhlIHNhbWUgdGltZSBpdCBzaG91bGRuJ3QgcHJldmVudCB1cwpm
cm9tIG1vdmluZyBmb3J3YXJkIGFuZCBleHBvc2luZyB0aGUgcmVhbCBjb25uZWN0b3IgdHlwZS4g
T25lIG9wdGlvbgpjb3VsZCBiZSB0byBrZWVwIHRoZSBleHRyYSB0eXBlIGFyZ3VtZW50IHRvIGRy
bV9wYW5lbF9icmlkZ2VfYWRkKCkgdG8KZm9yY2UgdGhlIGNvbm5lY3RvciB0eXBlLCBhbmQgYWRk
IGFub3RoZXIgdmFyaWFudCBvZiB0aGUgZnVuY3Rpb24gdGhhdAp3b3VsZCBkZXJpdmUgaXQgYXV0
b21hdGljYWxseSBmcm9tIHRoZSBwYW5lbCB0eXBlLiBEcml2ZXJzIGNvdWxkIHRoZW4KZGVjaWRl
IHRvIHN3aXRjaCB0byB0aGUgbmV3IHZhcmlhbnQgb24gYSBjYXNlLWJ5LWNhc2UgYmFzaXMuIFN0
aWxsLCB0aGF0Cndvbid0IHNvbHZlIHlvdXIgaXNzdWUsIGFzIEknbSBub3Qgc3VyZSBob3cgeW91
IHdvdWxkIGJlIGFibGUgdG8gZGVjaWRlCndoaWNoIHZhcmlhbnQgdG8gY2FsbCBpZiB3ZSB3YW50
IG5ld2VyIHN5c3RlbXMgdG8gZXhwb3NlIHRoZSByaWdodCBwYW5lbAp0eXBlIHdoaWxlIGtlZXBp
bmcgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4KCkFub3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGhh
Y2sgdGhlIGNvbW1hbmQgbGluZSBhcmd1bWVudCBwYXJzaW5nIHRvCmNvbnZlcnQgVW5rbm93bi0q
IHRvIGEgcGFuZWwgdHlwZSB3aGVuIHRoZXJlJ3Mgbm8gY29ubmVjdG9yIHdpdGggYW4KdW5rbm93
biB0eXBlLCBidXQgdGhhdCBzZWVtcyBmcmFnaWxlLgoKQW55IG90aGVyIHByb3Bvc2FsID8gOi0p
Cgo+ID4gVXBkYXRlIGFsbCBwYW5lbCBkcml2ZXJzIHRvIGZpbGwgdGhlIG5ldyBmaWVsZC4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
