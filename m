Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08032122D8A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 14:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEA86E9E7;
	Tue, 17 Dec 2019 13:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E1B6E9E7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 13:54:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-114-113-nat.elisa-mobile.fi
 [85.76.114.113])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77CCC9C5;
 Tue, 17 Dec 2019 14:54:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576590867;
 bh=a9Znys4PI/NrVQPB6/m8UFFVFKRqUcrKabr7FFz1U2I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MCr/BIYD7JtXnJygA8jtzeEOMAh1Af/VCqhl/qOlcyOdTddo1xKlIjK1P5ic8BwXp
 hGKwm4Hhp7GHmXVV2ojkoRtdoC7mlqULCe4b0ZkW8ENzcievuDi1L4CD90upFUxy02
 UvhdbxA8DYpBn0lAKHVTn6Sf+MknFL2hO3jc7QCc=
Date: Tue, 17 Dec 2019 15:54:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Message-ID: <20191217135414.GA4741@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213171038.GH4860@pendragon.ideasonboard.com>
 <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdUE0O9_8g02f2ABiV8SSMXNJB9S9e89p0OJKnTvx8MO9g@mail.gmail.com>
 <TY1PR01MB17705FC08F72875484DF2208C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdVqHekyeOaHwpFyG5buNZp-XmvGizqZ=Gbg40_=NL+s2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVqHekyeOaHwpFyG5buNZp-XmvGizqZ=Gbg40_=NL+s2A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Simon Horman <horms@verge.net.au>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBUdWUsIERlYyAxNywgMjAxOSBhdCAwMTozODo1MVBNICswMTAwLCBHZWVydCBV
eXR0ZXJob2V2ZW4gd3JvdGU6Cj4gT24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMTozMSBQTSBGYWJy
aXppbyBDYXN0cm8gd3JvdGU6Cj4gPiBPbiAxNyBEZWNlbWJlciAyMDE5IDEyOjIxLCBHZWVydCBV
eXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPj4gT24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMTI6MDMgUE0g
RmFicml6aW8gQ2FzdHJvIHdyb3RlOgo+ID4+PiBPbiAxMyBEZWNlbWJlciAyMDE5IDE3OjExLCBM
YXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4+Pj4gT24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDM6
NTE6MjVQTSArMDAwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOgo+ID4+Pj4+IEFkZCBzdXBwb3J0
IGZvciB0cmFuc3BhcmVudCBMVkRTIGRlY29kZXJzIGJ5IGFkZGluZyBhIG5ldwo+ID4+Pj4+IGNv
bXBhdGlibGUgc3RyaW5nICgibHZkcy1kZWNvZGVyIikgdG8gdGhlIGRyaXZlci4KPiA+Pj4+PiBU
aGlzIHBhdGNoIGFsc28gYWRkcyBtZW1iZXIgY29ubmVjdG9yX3R5cGUgdG8gc3RydWN0IGx2ZHNf
Y29kZWMsCj4gPj4+Pj4gYW5kIHRoYXQncyBiZWNhdXNlIExWRFMgZGVjb2RlcnMgaGF2ZSBhIGRp
ZmZlcmVudCBjb25uZWN0b3IgdHlwZQo+ID4+Pj4+IGZyb20gTFZEUyBlbmNvZGVycy4gV2UgZmls
bCB0aGlzIG5ldyBtZW1iZXIgdXAgd2l0aCB0aGUgZGF0YQo+ID4+Pj4+IG1hdGNoaW5nIHRoZSBj
b21wYXRpYmxlIHN0cmluZy4KPiA+Pj4+Pgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlv
IENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+ID4+Pj4+Cj4gPj4+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmMKPiA+Pj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYwo+ID4+Pj4+Cj4gPj4+Pj4gQEAgLTY1
LDYgKzY3LDcgQEAgc3RhdGljIGludCBsdmRzX2NvZGVjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gPj4+Pj4gICAgIGlmICghbHZkc19jb2RlYykKPiA+Pj4+PiAgICAgICAg
ICAgICByZXR1cm4gLUVOT01FTTsKPiA+Pj4+Pgo+ID4+Pj4+ICsgICBsdmRzX2NvZGVjLT5jb25u
ZWN0b3JfdHlwZSA9ICh1MzIpb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+
ID4+Pj4KPiA+Pj4+IEknbSBub3cgZ2V0dGluZyBhIGNvbXBpbGF0aW9uIGZhaWx1cmUgaGVyZToK
PiA+Pj4+Cj4gPj4+PiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYzogSW4gZnVu
Y3Rpb24g4oCYbHZkc19jb2RlY19wcm9iZeKAmToKPiA+Pj4+IGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvbHZkcy1jb2RlYy5jOjY4OjMxOiBlcnJvcjogY2FzdCBmcm9tIHBvaW50ZXIgdG8gaW50ZWdl
ciBvZiBkaWZmZXJlbnQgc2l6ZSBbLVdlcnJvcj1wb2ludGVyLXRvLWludC1jYXN0XQo+ID4+Pj4g
ICBsdmRzX2NvZGVjLT5jb25uZWN0b3JfdHlwZSA9ICh1MzIpb2ZfZGV2aWNlX2dldF9tYXRjaF9k
YXRhKCZwZGV2LT5kZXYpOwo+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4K
PiA+Pj4+Cj4gPj4+PiBUaGUgZml4IHNob3VsZCBiZSBzaW1wbGU6Cj4gPj4+Pgo+ID4+Pj4gICAg
ICAgbHZkc19jb2RlYy0+Y29ubmVjdG9yX3R5cGUgPSAodWludHB0cl90KW9mX2RldmljZV9nZXRf
bWF0Y2hfZGF0YShkZXYpOwo+ID4+Pj4KPiA+Pj4+IEknbSBib3RoZXJlZCBieSB0aGUgZmFjdCB0
aGF0IEkndmUgY29tcGlsZWQgdGhpcyBiZWZvcmUgd2l0aG91dCBhbnkKPiA+Pj4+IGlzc3VlLCBz
byB0aGlzIHJlYWxseSBwdXp6bGVzIG1lLiBEbyB5b3UgZ2V0IHRoZSBzYW1lIHdhcm5pbmcgPwo+
ID4+Pgo+ID4+PiBUaGUgd2FybmluZyBhcHBlYXJzIHdoZW4gY29tcGlsaW5nIGZvciBhcm02NCwg
dW5kZXJzdGFuZGFibHkgc28uCj4gPj4+IFdlIG11c3QgaGF2ZSBjb21waWxlZCB0aGlzIGZvciBh
cm0gb25seSB0aGUgZmlyc3QgdGltZSBhcm91bmQuCj4gPj4+Cj4gPj4+IEkgdGhpbmsgdGhlIHJp
Z2h0IHdheSB0byBzb2x2ZSB0aGlzIGlzIHRvIGVpdGhlciBjYXN0IHRvICh1MzIpKHVpbnRwdHJf
dCkgb3IgKHUzMikodW5zaWduZWQgbG9uZykuCj4gPj4KPiA+PiBKdXN0IGNhc3RpbmcgdG8gdWlu
dHB0cl90IHNob3VsZCBiZSBzdWZmaWNpZW50Lgo+ID4KPiA+IEl0IHNob3VsZCBiZSBzdWZmaWNp
ZW50IGZvciB0aGUgY29tcGlsZXIsIGJ1dCBJIGhhdmUgc2VlbiBleGFtcGxlcyB3aGVyZSBwZW9w
bGUKPiA+IHByZWZlcnJlZCB0byBiZSBleHBsaWNpdCwgbGlrZSBpbjoKPiA+IGRyaXZlcnMvbWFp
bGJveC9tdGstY21kcS1tYWlsYm94LmMKPiA+IGRyaXZlcnMvbGVkcy9sZWRzLXBtODA1OC5jCj4g
Pgo+ID4gU2luY2UgdGhlIGtlcm5lbCBpcyBpbmNyZWFzaW5nIGl0cyB0aWdodG5lc3Mgd2l0aCBy
ZXNwZWN0IHRvIHdhcm5pbmdzLCBJIHBlcnNvbmFsbHkgcHJlZmVyCj4gPiAodTMyKSh1aW50cHRy
X3QpLCBldmVuIHRob3VnaCBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5LCBidXQgSSBhbSBmaW5lIHdp
dGggKHVpbnRwdHJfdCkgaWYgeW91Cj4gPiBkb24ndCBsaWtlICh1MzIpKHVpbnRwdHJfdCkuCj4g
Cj4gSXQgZGVwZW5kcy4gSSB0cnkgdG8gaGF2ZSBhcyBmZXcgY2FzdHMgYXMgcG9zc2libGUgKCJj
YXN0cyBhcmUgZXZpbCIpLgo+IAo+IFdoaWxlIGFkZGluZyB0aGUgZXh0cmEgKHUzMikgY2FzdCBt
YWtlcyBpdCBjbGVhcmVyIHRoYXQgdGhlIGludGVuZGVkCj4gcmVzdWx0IGlzIGEgdTMyIChmb3Ig
bm93KSwgaXQgd2lsbCBjYXVzZSBzaWxlbnQgdHJ1bmNhdGlvbiBvbiA2NC1iaXQgaWYKPiBjb25u
ZWN0b3JfdHlwZSBpcyBldmVyIGVubGFyZ2VkIHRvIHVuc2lnbmVkIGxvbmcsIGFuZCBsYXJnZXIg
dmFsdWVzIGFyZQo+IHVzZWQuCj4gCj4gSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgdGhpcyBpcyB1
bmxpa2VseSwgdGhvdWdoLCBhcyB1bnNpZ25lZCBsb25nIHdvdWxkCj4gc3RpbGwgYmUgMzItYml0
IG9uIDMyLWJpdCBwbGF0Zm9ybXMsIHNvIHRoZSBsYXJnZXIgdmFsdWVzIGNhbm5vdCBiZQo+IHVz
ZWQuCgpJIGFsc28gdHJ5IHRvIGFkZCBhcyBmZXcgY2FzdHMgYXMgcG9zc2libGUsIHNvICh1aW50
cHRyX3QpIHdvdWxkIGJlIG15CnByZWZlcmVuY2UuCgpGYWJyaXppbywgY291bGQgeW91IHN1Ym1p
dCBhIG5ldyB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggd2l0aCB0aGUgcHJvYmxlbQpmaXhlZCAoYW5k
IHdpdGggdGhlIGNhc3RzIHlvdSBkZWNpZGUgdG8gdXNlLCBidXQgdXNpbmcgdWludHB0cl90IGlu
c3RlYWQKb2YgdW5zaWduZWQgbG9uZyBpbiBhbnkgY2FzZSkgPwoKLS0gClJlZ2FyZHMsCgpMYXVy
ZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
