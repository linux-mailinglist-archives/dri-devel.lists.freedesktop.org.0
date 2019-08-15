Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1B88EAEE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 14:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18116E8B8;
	Thu, 15 Aug 2019 12:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8FF6E8B8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 12:00:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 336662AF;
 Thu, 15 Aug 2019 14:00:17 +0200 (CEST)
Date: Thu, 15 Aug 2019 15:00:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v2 4/9] drm/timings: Add link flags
Message-ID: <20190815120014.GK5011@pendragon.ideasonboard.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565867073-24746-5-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565870417;
 bh=A0ss3R3Sk7I88U0odL2MqAjBB4gXoIuYHegStKY3AHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XoChd+oXcLPj9rbrHCc/1MOquMvsYcM438HTcgWHOl6bUra8+85htemNo9adOKA7T
 wzc1syp1AeBbmbfL8qjKKpB799GZgVqgINMX8b6lKRe8Fa9gd69vRpGtbrwohseQoW
 gIJpoH/Ec687kqEuukEhalpDysx9QgQa8v7eUQEk=
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFRodSwgQXVnIDE1LCAy
MDE5IGF0IDEyOjA0OjI4UE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBXZSBuZWVk
IG1vcmUgaW5mb3JtYXRpb24gdG8gZGVzY3JpYmUgZHVhbC1MVkRTIGxpbmtzLCB0aGVyZWZvcmUK
PiBpbnRyb2R1Y2UgbGlua19mbGFncy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0
cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KPiAKPiAtLS0KPiB2MS0+djI6Cj4g
KiBuZXcgcGF0Y2gKPiAKPiAgaW5jbHVkZS9kcm0vZHJtX3RpbWluZ3MuaCB8IDI2ICsrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV90aW1pbmdzLmggYi9pbmNsdWRlL2RybS9k
cm1fdGltaW5ncy5oCj4gaW5kZXggNGFmODgxNC4uNThmYmYxYiAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL2RybS9kcm1fdGltaW5ncy5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3RpbWluZ3MuaAo+
IEBAIC0xLDQgKzEsNiBAQAo+ICAvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTkgUmVuZXNhcyBF
bGVjdHJvbmljcyBDb3Jwb3JhdGlvbgo+ICsgKgo+ICAgKiBQZXJtaXNzaW9uIHRvIHVzZSwgY29w
eSwgbW9kaWZ5LCBkaXN0cmlidXRlLCBhbmQgc2VsbCB0aGlzIHNvZnR3YXJlIGFuZCBpdHMKPiAg
ICogZG9jdW1lbnRhdGlvbiBmb3IgYW55IHB1cnBvc2UgaXMgaGVyZWJ5IGdyYW50ZWQgd2l0aG91
dCBmZWUsIHByb3ZpZGVkIHRoYXQKPiAgICogdGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYXBw
ZWFyIGluIGFsbCBjb3BpZXMgYW5kIHRoYXQgYm90aCB0aGF0IGNvcHlyaWdodAo+IEBAIC0yMSw2
ICsyMywyNCBAQAo+ICAjaWZuZGVmIF9fRFJNX1RJTUlOR1NfSF9fCj4gICNkZWZpbmUgX19EUk1f
VElNSU5HU19IX18KPiAgCj4gKyNpbmNsdWRlIDxsaW51eC9iaXRzLmg+Cj4gKwo+ICsvKioKPiAr
ICogZW51bSBkcm1fbGlua19mbGFncyAtIGxpbmtfZmxhZ3MgZm9yICZkcm1fdGltaW5ncwo+ICsg
Kgo+ICsgKiBUaGlzIGVudW0gZGVmaW5lcyB0aGUgZGV0YWlscyBvZiB0aGUgbGluay4KPiArICoK
PiArICogQERSTV9MSU5LX0RVQUxfTFZEU19PRERfRVZFTjoJRHVhbC1MVkRTIGxpbmssIHdpdGgg
b2RkIHBpeGVscyAoMSwzLDUsCj4gKyAqCQkJCQlldGMuKSBjb21pbmcgdGhyb3VnaCB0aGUgZmly
c3QgcG9ydCwgYW5kCj4gKyAqCQkJCQlldmVuIHBpeGVscyAoMCwyLDQsZXRjLikgY29taW5nIHRo
cm91Z2gKPiArICoJCQkJCXRoZSBzZWNvbmQgcG9ydC4gSWYgbm90IHNwZWNpZmllZCBmb3IgYQo+
ICsgKgkJCQkJZHVhbC1MVkRTIHBhbmVsLCBpdCBpcyBhc3N1bWVkIHRoYXQgZXZlbgo+ICsgKgkJ
CQkJcGl4ZWxzIGFyZSBjb21pbmcgdGhyb3VnaCB0aGUgZmlyc3QgcG9ydAo+ICsgKi8KPiArZW51
bSBkcm1fbGlua19mbGFncyB7CgpUaGUgdGV4dCB3aWxsIGJlIGVhc2llciB0byByZWFkIGlmIHlv
dSBpbmxpbmUgaXQgaGVyZS4KCgkvKioKCSAqIEBEUk1fTElOS19EVUFMX0xWRFNfT0REX0VWRU46
IER1YWwtTFZEUyBsaW5rLCB3aXRoIG9kZCBwaXhlbHMgKDEsMyw1LAoJICogZXRjLikgY29taW5n
IHRocm91Z2ggdGhlIGZpcnN0IHBvcnQsIGFuZCAgZXZlbiBwaXhlbHMgKDAsMiw0LGV0Yy4pCgkg
Li4uCgo+ICsJRFJNX0xJTktfRFVBTF9MVkRTX09ERF9FVkVOID0gQklUKDApLAoKSSB3b3VsZCBy
ZW1vdmUgdGhlIGR1YWxfbGluayBmaWVsZCBhbmQgYWRkIGEgRFJNX0xJTktfRFVBTF9MVkRTIChv
cgphbHRlcm5hdGl2ZWx5IHR3byBmbGFncywgZHVhbCBsdmRzIG9kZC1ldmVuIGFuZCBkdWFsIGx2
ZHMgZXZlbi1vZGQpLgoKPiArfTsKPiArCj4gIC8qKgo+ICAgKiBzdHJ1Y3QgZHJtX3RpbWluZ3Mg
LSB0aW1pbmcgaW5mb3JtYXRpb24KPiAgICovCj4gQEAgLTU1LDYgKzc1LDEyIEBAIHN0cnVjdCBk
cm1fdGltaW5ncyB7Cj4gIAkgKiBhbmQgb2RkLW51bWJlcmVkIHBpeGVscyBhcmUgcmVjZWl2ZWQg
b24gc2VwYXJhdGUgbGlua3MuCj4gIAkgKi8KPiAgCWJvb2wgZHVhbF9saW5rOwo+ICsJLyoqCj4g
KwkgKiBAbGlua19mbGFncwo+ICsJICoKPiArCSAqIFByb3ZpZGVzIGRldGFpbGVkIGluZm9ybWF0
aW9uIGFib3V0IHRoZSBsaW5rLgoKSSB0aGluayB0aGlzIGNhbGxzIGZvciBhIGJpdCBtb3JlIGlu
Zm9ybWF0aW9uIHRoYW4gImRldGFpbGVkCmluZm9ybWF0aW9uIi4gV2hhdCBpbmZvcm1hdGlvbiBk
byB5b3Ugd2FudCB0byBzdG9yZSBpbiB0aGlzIGZpZWxkID8KCj4gKwkgKi8KPiArCWVudW0gZHJt
X2xpbmtfZmxhZ3MgbGlua19mbGFnczsKPiAgfTsKPiAgCj4gICNlbmRpZiAvKiBfX0RSTV9USU1J
TkdTX0hfXyAqLwo+IC0tIAo+IDIuNy40Cj4gCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hh
cnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
