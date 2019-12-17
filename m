Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C445122BCE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 13:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108336E9CC;
	Tue, 17 Dec 2019 12:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84646E9CC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 12:39:03 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id k14so13625992otn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 04:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LUh0j8xU1Qr9fXtE+2mw/twXvOy9bjYwMRuWrzxT6eQ=;
 b=lW5RWa+BKVbrOeSL+32PRy8dnewcJkAyI63sInvJWXTpU5T+H+8yKXYXnVhr5lcPV1
 YoB+00m0XZ1ROG5shroTzwNU2DLhng9fHrLphHpsFXILgFH4yPGZUSVxDJ4nrxYUaqlE
 zcan+VcBG79aBE8opj/0TrSTCr/3HzoomeqX1ZNmLjFs8AZH3v6ZpcNjggQRYkWXkg8x
 RQCrnyyFc1PzNMfhQkacK/39Ox+ua2o0MZJMwkGDcGGTP9KBpLKJbvLoMGJOG91hLqK+
 pR57UrOxYGnxw+b89Z2/JJErtnlACPzGZjpg9OF43rdpiWOznso5c63a0U/4kZxWyID3
 qQkg==
X-Gm-Message-State: APjAAAX4fTyrrzDnYfhhsQY4vsTq6b79xoEz8F8P1nT0t5tpHUzf5rT+
 BFUKj70QzgeSTBXg821Iq46wFZvwtUaXPpcalmY=
X-Google-Smtp-Source: APXvYqymQtdXQIA9dI50I0zDHkQvsxWBvf/GOqxNthXzUoE+3dKDkD4aXvjDConIraGDEKG0eShllvgWTqpNdNsUfFU=
X-Received: by 2002:a9d:6c81:: with SMTP id c1mr38348507otr.39.1576586342848; 
 Tue, 17 Dec 2019 04:39:02 -0800 (PST)
MIME-Version: 1.0
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213171038.GH4860@pendragon.ideasonboard.com>
 <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdUE0O9_8g02f2ABiV8SSMXNJB9S9e89p0OJKnTvx8MO9g@mail.gmail.com>
 <TY1PR01MB17705FC08F72875484DF2208C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB17705FC08F72875484DF2208C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2019 13:38:51 +0100
Message-ID: <CAMuHMdVqHekyeOaHwpFyG5buNZp-XmvGizqZ=Gbg40_=NL+s2A@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Simon Horman <horms@verge.net.au>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpPbiBUdWUsIERlYyAxNywgMjAxOSBhdCAxOjMxIFBNIEZhYnJpemlvIENh
c3Rybwo8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToKPiA+IEZyb206IGxp
bnV4LXJlbmVzYXMtc29jLW93bmVyQHZnZXIua2VybmVsLm9yZyA8bGludXgtcmVuZXNhcy1zb2Mt
b3duZXJAdmdlci5rZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgR2VlcnQgVXl0dGVyaG9ldmVuCj4g
PiBTZW50OiAxNyBEZWNlbWJlciAyMDE5IDEyOjIxCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0
IDA2LzEzXSBkcm0vYnJpZGdlOiBsdmRzLWNvZGVjOiBBZGQgImx2ZHMtZGVjb2RlciIgc3VwcG9y
dAo+ID4KPiA+IE9uIFR1ZSwgRGVjIDE3LCAyMDE5IGF0IDEyOjAzIFBNIEZhYnJpemlvIENhc3Ry
bwo+ID4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6Cj4gPiA+ID4gRnJv
bTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+
ID4gPiA+IFNlbnQ6IDEzIERlY2VtYmVyIDIwMTkgMTc6MTEKPiA+ID4gPiBTdWJqZWN0OiBSZTog
W1BBVENIIHY0IDA2LzEzXSBkcm0vYnJpZGdlOiBsdmRzLWNvZGVjOiBBZGQgImx2ZHMtZGVjb2Rl
ciIgc3VwcG9ydAo+ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDM6NTE6
MjVQTSArMDAwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOgo+ID4gPiA+ID4gQWRkIHN1cHBvcnQg
Zm9yIHRyYW5zcGFyZW50IExWRFMgZGVjb2RlcnMgYnkgYWRkaW5nIGEgbmV3Cj4gPiA+ID4gPiBj
b21wYXRpYmxlIHN0cmluZyAoImx2ZHMtZGVjb2RlciIpIHRvIHRoZSBkcml2ZXIuCj4gPiA+ID4g
PiBUaGlzIHBhdGNoIGFsc28gYWRkcyBtZW1iZXIgY29ubmVjdG9yX3R5cGUgdG8gc3RydWN0IGx2
ZHNfY29kZWMsCj4gPiA+ID4gPiBhbmQgdGhhdCdzIGJlY2F1c2UgTFZEUyBkZWNvZGVycyBoYXZl
IGEgZGlmZmVyZW50IGNvbm5lY3RvciB0eXBlCj4gPiA+ID4gPiBmcm9tIExWRFMgZW5jb2RlcnMu
IFdlIGZpbGwgdGhpcyBuZXcgbWVtYmVyIHVwIHdpdGggdGhlIGRhdGEKPiA+ID4gPiA+IG1hdGNo
aW5nIHRoZSBjb21wYXRpYmxlIHN0cmluZy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KCj4g
PiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYwo+ID4gPiA+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmMKCj4gPiA+ID4gPiBA
QCAtNjUsNiArNjcsNyBAQCBzdGF0aWMgaW50IGx2ZHNfY29kZWNfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiA+ID4gPiA+ICAgICBpZiAoIWx2ZHNfY29kZWMpCj4gPiA+ID4g
PiAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiArICAgbHZk
c19jb2RlYy0+Y29ubmVjdG9yX3R5cGUgPSAodTMyKW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgm
cGRldi0+ZGV2KTsKPiA+ID4gPgo+ID4gPiA+IEknbSBub3cgZ2V0dGluZyBhIGNvbXBpbGF0aW9u
IGZhaWx1cmUgaGVyZToKPiA+ID4gPgo+ID4gPiA+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZk
cy1jb2RlYy5jOiBJbiBmdW5jdGlvbiDigJhsdmRzX2NvZGVjX3Byb2Jl4oCZOgo+ID4gPiA+IGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jOjY4OjMxOiBlcnJvcjogY2FzdCBmcm9t
IHBvaW50ZXIgdG8gaW50ZWdlciBvZiBkaWZmZXJlbnQgc2l6ZSBbLVdlcnJvcj1wb2ludGVyLXRv
LWludC1jYXN0XQo+ID4gPiA+ICAgbHZkc19jb2RlYy0+Y29ubmVjdG9yX3R5cGUgPSAodTMyKW9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsKPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXgo+ID4gPiA+Cj4gPiA+ID4gVGhlIGZpeCBzaG91bGQgYmUgc2lt
cGxlOgo+ID4gPiA+Cj4gPiA+ID4gICAgICAgbHZkc19jb2RlYy0+Y29ubmVjdG9yX3R5cGUgPSAo
dWludHB0cl90KW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwo+ID4gPiA+Cj4gPiA+ID4g
SSdtIGJvdGhlcmVkIGJ5IHRoZSBmYWN0IHRoYXQgSSd2ZSBjb21waWxlZCB0aGlzIGJlZm9yZSB3
aXRob3V0IGFueQo+ID4gPiA+IGlzc3VlLCBzbyB0aGlzIHJlYWxseSBwdXp6bGVzIG1lLiBEbyB5
b3UgZ2V0IHRoZSBzYW1lIHdhcm5pbmcgPwo+ID4gPgo+ID4gPiBUaGUgd2FybmluZyBhcHBlYXJz
IHdoZW4gY29tcGlsaW5nIGZvciBhcm02NCwgdW5kZXJzdGFuZGFibHkgc28uCj4gPiA+IFdlIG11
c3QgaGF2ZSBjb21waWxlZCB0aGlzIGZvciBhcm0gb25seSB0aGUgZmlyc3QgdGltZSBhcm91bmQu
Cj4gPiA+Cj4gPiA+IEkgdGhpbmsgdGhlIHJpZ2h0IHdheSB0byBzb2x2ZSB0aGlzIGlzIHRvIGVp
dGhlciBjYXN0IHRvICh1MzIpKHVpbnRwdHJfdCkgb3IgKHUzMikodW5zaWduZWQgbG9uZykuCj4g
Pgo+ID4gSnVzdCBjYXN0aW5nIHRvIHVpbnRwdHJfdCBzaG91bGQgYmUgc3VmZmljaWVudC4KPgo+
IEl0IHNob3VsZCBiZSBzdWZmaWNpZW50IGZvciB0aGUgY29tcGlsZXIsIGJ1dCBJIGhhdmUgc2Vl
biBleGFtcGxlcyB3aGVyZSBwZW9wbGUKPiBwcmVmZXJyZWQgdG8gYmUgZXhwbGljaXQsIGxpa2Ug
aW46Cj4gZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYwo+IGRyaXZlcnMvbGVkcy9s
ZWRzLXBtODA1OC5jCj4KPiBTaW5jZSB0aGUga2VybmVsIGlzIGluY3JlYXNpbmcgaXRzIHRpZ2h0
bmVzcyB3aXRoIHJlc3BlY3QgdG8gd2FybmluZ3MsIEkgcGVyc29uYWxseSBwcmVmZXIKPiAodTMy
KSh1aW50cHRyX3QpLCBldmVuIHRob3VnaCBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5LCBidXQgSSBh
bSBmaW5lIHdpdGggKHVpbnRwdHJfdCkgaWYgeW91Cj4gZG9uJ3QgbGlrZSAodTMyKSh1aW50cHRy
X3QpLgoKSXQgZGVwZW5kcy4gSSB0cnkgdG8gaGF2ZSBhcyBmZXcgY2FzdHMgYXMgcG9zc2libGUg
KCJjYXN0cyBhcmUgZXZpbCIpLgoKV2hpbGUgYWRkaW5nIHRoZSBleHRyYSAodTMyKSBjYXN0IG1h
a2VzIGl0IGNsZWFyZXIgdGhhdCB0aGUgaW50ZW5kZWQKcmVzdWx0IGlzIGEgdTMyIChmb3Igbm93
KSwgaXQgd2lsbCBjYXVzZSBzaWxlbnQgdHJ1bmNhdGlvbiBvbiA2NC1iaXQgaWYKY29ubmVjdG9y
X3R5cGUgaXMgZXZlciBlbmxhcmdlZCB0byB1bnNpZ25lZCBsb25nLCBhbmQgbGFyZ2VyIHZhbHVl
cyBhcmUKdXNlZC4KCkluIHRoaXMgcGFydGljdWxhciBjYXNlIHRoaXMgaXMgdW5saWtlbHksIHRo
b3VnaCwgYXMgdW5zaWduZWQgbG9uZyB3b3VsZApzdGlsbCBiZSAzMi1iaXQgb24gMzItYml0IHBs
YXRmb3Jtcywgc28gdGhlIGxhcmdlciB2YWx1ZXMgY2Fubm90IGJlCnVzZWQuCgpHcntvZXRqZSxl
ZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
