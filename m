Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B4C35EF27
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 10:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC99B6E8F4;
	Wed, 14 Apr 2021 08:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C056E8F4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 08:16:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D6C06F2;
 Wed, 14 Apr 2021 10:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1618388180;
 bh=p7bKNnORnvXq4gKs9g820nMSsU73O8OexxbaO+c4jHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q6iXPhBQn7IxK3Fi8sR64LIAnS2hqZJ1oL11Z8JHO2gZTBKXx4246tQHYMLZHEbMp
 UCloyzrfntmWffCg1fQaKUVeYgdJshEODVYFlXBWJdyj04q96MRpyNAIjnki5kvIvc
 7h+/M2vpOjFmW8jfuiqMZxBw7a1nIxOJmFU1oYC4=
Date: Wed, 14 Apr 2021 11:16:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 2/3] drm: bridge: add it66121 driver
Message-ID: <YHak0zr0o0thq/fu@pendragon.ideasonboard.com>
References: <20210412154648.3719153-1-narmstrong@baylibre.com>
 <20210412154648.3719153-3-narmstrong@baylibre.com>
 <CAG3jFysFb+y6ymXsBQatuwtPEYRTBnWTku0EpmNyR2gR5a=Y2w@mail.gmail.com>
 <3266977b-9d19-c81d-6fd7-b6fa0714b1ef@baylibre.com>
 <CAG3jFysp+3__TfEyvKSf47q3nYsdRSbkb9LxX2pcJr356yAgKw@mail.gmail.com>
 <911c73a8-47e8-0bae-2bdd-9eb217b25094@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <911c73a8-47e8-0bae-2bdd-9eb217b25094@baylibre.com>
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
Cc: Phong LE <ple@baylibre.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, paul@crapouillou.net,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbCwKCk9uIFdlZCwgQXByIDE0LCAyMDIxIGF0IDEwOjA4OjQ2QU0gKzAyMDAsIE5laWwg
QXJtc3Ryb25nIHdyb3RlOgo+IE9uIDE0LzA0LzIwMjEgMTA6MDYsIFJvYmVydCBGb3NzIHdyb3Rl
Ogo+ID4gT24gV2VkLCAxNCBBcHIgMjAyMSBhdCAwODoxMywgTmVpbCBBcm1zdHJvbmcgPG5hcm1z
dHJvbmdAYmF5bGlicmUuY29tPiB3cm90ZToKPiA+PiBMZSAxMy8wNC8yMDIxIMOgIDIyOjIxLCBS
b2JlcnQgRm9zcyBhIMOpY3JpdCA6Cj4gPj4+IEhleSBOZWlsICYgUGhvbmcsCj4gPj4+Cj4gPj4+
IFRoYW5rcyBmb3Igc3VibWl0dGluZyB0aGlzIHNlcmllcyEKPiA+Pj4KPiA+Pj4+ICsKPiA+Pj4+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgaXQ2NjEyMV9icmlkZ2VfZnVu
Y3MgPSB7Cj4gPj4+PiArICAgICAgIC5hdHRhY2ggPSBpdDY2MTIxX2JyaWRnZV9hdHRhY2gsCj4g
Pj4+PiArICAgICAgIC5lbmFibGUgPSBpdDY2MTIxX2JyaWRnZV9lbmFibGUsCj4gPj4+PiArICAg
ICAgIC5kaXNhYmxlID0gaXQ2NjEyMV9icmlkZ2VfZGlzYWJsZSwKPiA+Pj4+ICsgICAgICAgLm1v
ZGVfc2V0ID0gaXQ2NjEyMV9icmlkZ2VfbW9kZV9zZXQsCj4gPj4+PiArICAgICAgIC5tb2RlX3Zh
bGlkID0gaXQ2NjEyMV9icmlkZ2VfbW9kZV92YWxpZCwKPiA+Pj4+ICsgICAgICAgLmRldGVjdCA9
IGl0NjYxMjFfYnJpZGdlX2RldGVjdCwKPiA+Pj4+ICsgICAgICAgLmdldF9lZGlkID0gaXQ2NjEy
MV9icmlkZ2VfZ2V0X2VkaWQsCj4gPj4+PiArICAgICAgIC5hdG9taWNfZ2V0X291dHB1dF9idXNf
Zm10cyA9IGl0NjYxMjFfYnJpZGdlX2F0b21pY19nZXRfb3V0cHV0X2J1c19mbXRzLAo+ID4+Pj4g
KyAgICAgICAuYXRvbWljX2dldF9pbnB1dF9idXNfZm10cyA9IGl0NjYxMjFfYnJpZGdlX2F0b21p
Y19nZXRfaW5wdXRfYnVzX2ZtdHMsCj4gPj4+PiArfTsKPiA+Pj4KPiA+Pj4gSSB3b3VsZCBsaWtl
IHRvIHNlZSBhbiBpbXBsZW1lbnRhdGlvbiBvZiBIUEQsIHNpbmNlIGl0IGlzIHN1cHBvcnRlZCBi
eQo+ID4+PiB0aGUgaGFyZHdhcmVbMV0gKGFuZCByZXF1aXJlZCBieSB0aGUgZG9jdW1lbnRhdGlv
bikuIElSUSBzdGF0dXMgYml0IDAKPiA+Pj4gc2VlbXMgdG8gYmUgdGhlIHJlc3BvbnNpYmxlIGZv
ciBub3RpZnlpbmcgdXMgYWJvdXQgaG90IHBsdWcgZGV0ZWN0aW9uCj4gPj4+IGV2ZW50cy4KPiA+
Pgo+ID4+IEl0J3MgaW1wbGVtZW50ZWQgaW4gdGhlIElSUSBoYW5kbGVyIHdpdGggdGhlIElUNjYx
MjFfSU5UX1NUQVRVUzFfSFBEX1NUQVRVUyBldmVudC4KPiA+IAo+ID4gSSBkaWRuJ3QgZXZlbiBn
ZXQgdGhhdCBmYXIgOikKPiA+IAo+ID4gRWl0aGVyIHdheSwgdGhlIEhQRCBzdXBwb3J0IHNob3Vs
ZCBiZSBleHBvc2VkIGluIGRybV9icmlkZ2VfZnVuY3MKPiA+ICguaHBkX2VuYWJsZSwgLmhwZF9k
aXNhYmxlIChhbmQgcG9zc2libHkgLmhwZF9ub3RpZnkpKSBhbmQKPiA+IGRybV9icmlkZ2Uub3Bz
IChEUk1fQlJJREdFX09QX0hQRCkuCj4gCj4gSW5kZWVkIEkgZm9yZ290IHRoZXNlIGNhbGxzIGlu
IHRoZSBOT19DT05ORUNUT1IgaW1wbGVtZW50YXRpb24uLi4KCkZvciBuZXcgYnJpZGdlcywgeW91
IHNob3VsZCBubyBpbXBsZW1lbnQgY29ubmVjdG9yIGNyZWF0aW9uLCBvbmx5IHRoZQpEUk1fQlJJ
REdFX0FUVEFDSF9OT19DT05ORUNUT1IgY2FzZSBzaG91bGQgYmUgc3VwcG9ydGVkLgoKLS0gClJl
Z2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
