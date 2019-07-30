Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 315807AA3C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C335C6E52F;
	Tue, 30 Jul 2019 13:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4AD6E52D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:55:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (ae138143.dynamic.ppp.asahi-net.or.jp [14.3.138.143])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 353A4CC;
 Tue, 30 Jul 2019 15:54:58 +0200 (CEST)
Date: Tue, 30 Jul 2019 16:54:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH v2] drm/bridge: lvds-encoder: Fix build error while
 CONFIG_DRM_KMS_HELPER=m
Message-ID: <20190730135455.GB4806@pendragon.ideasonboard.com>
References: <20190729065344.9680-1-yuehaibing@huawei.com>
 <20190729071216.27488-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729071216.27488-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564494900;
 bh=XpIPjfe/F3FQ+H5+8txaijGuPyeYSuXcxTVBGDeoaSw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GkDRK5OGcQwkOY6aSOLLY9pfaLrd8cqoicWK6CuCSE5NHAox4osG5mZHElhGRr7ln
 wr92dUagk49vEuU8Gxd/KncXEHOJTDXAtFWEg2ugKgpAIuqzBTsvYYaO2sTgb6GeiQ
 6PI0qQB828wC6m6ODIJjj4xKQNLqhzlVzgdecrTk=
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWXVlLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBNb24sIEp1bCAyOSwgMjAxOSBh
dCAwMzoxMjoxNlBNICswODAwLCBZdWVIYWliaW5nIHdyb3RlOgo+IElmIERSTV9MVkRTX0VOQ09E
RVI9eSBidXQgQ09ORklHX0RSTV9LTVNfSEVMUEVSPW0sCj4gYnVpbGQgZmFpbHM6Cj4gCj4gZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWVuY29kZXIubzogSW4gZnVuY3Rpb24gYGx2ZHNfZW5j
b2Rlcl9wcm9iZSc6Cj4gbHZkcy1lbmNvZGVyLmM6KC50ZXh0KzB4MTU1KTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgZGV2bV9kcm1fcGFuZWxfYnJpZGdlX2FkZCcKPiAKPiBSZXBvcnRlZC1ieTog
SHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gRml4ZXM6IGRiYjU4YmZkOWFlNiAoImRy
bS9icmlkZ2U6IEZpeCBsdmRzLWVuY29kZXIgc2luY2UgdGhlIHBhbmVsX2JyaWRnZSByZXdvcmsu
IikKPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+CgpS
ZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgoKPiAtLS0KPiB2MjogcmVtb3ZlIHRjMzU4NzY0IGxvZyBpbiBjb21taXQgbG9nLCBh
bHNvIGZpeCBGaXhlcyB0YWcKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmln
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L0tjb25maWcKPiBpbmRleCBhNmVlYzkwLi43N2U0Yjk1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2Nv
bmZpZwo+IEBAIC00OCw2ICs0OCw3IEBAIGNvbmZpZyBEUk1fRFVNQl9WR0FfREFDCj4gIGNvbmZp
ZyBEUk1fTFZEU19FTkNPREVSCj4gIAl0cmlzdGF0ZSAiVHJhbnNwYXJlbnQgcGFyYWxsZWwgdG8g
TFZEUyBlbmNvZGVyIHN1cHBvcnQiCj4gIAlkZXBlbmRzIG9uIE9GCj4gKwlzZWxlY3QgRFJNX0tN
U19IRUxQRVIKPiAgCXNlbGVjdCBEUk1fUEFORUxfQlJJREdFCj4gIAloZWxwCj4gIAkgIFN1cHBv
cnQgZm9yIHRyYW5zcGFyZW50IHBhcmFsbGVsIHRvIExWRFMgZW5jb2RlcnMgdGhhdCBkb24ndCBy
ZXF1aXJlCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
