Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9AFB0783
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AF26EB67;
	Thu, 12 Sep 2019 04:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D9F6E0D9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 18:47:43 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD66A33A;
 Wed, 11 Sep 2019 20:47:40 +0200 (CEST)
Subject: Re: [PATCH v4 7/9] drm: rcar-du: crtc: Register GAMMA_LUT properties
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com, geert@linux-m68k.org, horms@verge.net.au,
 uli+renesas@fpond.eu, VenkataRajesh.Kalakodima@in.bosch.com
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-8-jacopo+renesas@jmondi.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <26faa0ef-c32b-df4c-a68b-ed4994aff1b0@ideasonboard.com>
Date: Wed, 11 Sep 2019 19:47:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906135436.10622-8-jacopo+renesas@jmondi.org>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568227661;
 bh=KGr+ltcxu64n49g8h9L3ywBI+jkxl+RQR7VhdlE4cJE=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JpETj/iKwnMtritZEVl5flVUOI3mJVXYKqbR87HUBNQegHcJKpabd5dhVeIs4JsbL
 2q+VZaiFex4VZHsfkXm2Nxf1fh9u+AX1StMUpAkSCbt6NTcwGu0Uw1zJsb7aIjVgKL
 7qyTD7sfZhAv7WwxN6w0sWqsCSofX3/jeu/ii4YY=
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: muroya@ksk.co.jp, airlied@linux.ie, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gMDYvMDkvMjAxOSAxNDo1NCwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+IEVu
YWJsZSB0aGUgR0FNTUFfTFVUIEtNUyBwcm9wZXJ0eSB1c2luZyB0aGUgZnJhbWV3b3JrIGhlbHBl
cnMgdG8KPiByZWdpc3RlciB0aGUgcHJvcGVydHkgYW5kIHNldCB0aGUgYXNzb2NpYXRlZCBnYW1t
YSB0YWJsZSBtYXhpbXVtIHNpemUuCj4gCj4gUmV2aWV3ZWQtYnk6IFVscmljaCBIZWNodCA8dWxp
K3JlbmVzYXNAZnBvbmQuZXU+Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogS2llcmFu
IEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KCj4gU2ln
bmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYyB8IDQgKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
cmNhcl9kdV9jcnRjLmMKPiBpbmRleCAzZGFjNjA1YzNhNjcuLmRjNTllZWVjOTkwYyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jCj4gQEAgLTEwODIsNiArMTA4Miw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2NydGNfZnVuY3MgY3J0Y19mdW5jc19nZW4zID0g
ewo+ICAJLnNldF9jcmNfc291cmNlID0gcmNhcl9kdV9jcnRjX3NldF9jcmNfc291cmNlLAo+ICAJ
LnZlcmlmeV9jcmNfc291cmNlID0gcmNhcl9kdV9jcnRjX3ZlcmlmeV9jcmNfc291cmNlLAo+ICAJ
LmdldF9jcmNfc291cmNlcyA9IHJjYXJfZHVfY3J0Y19nZXRfY3JjX3NvdXJjZXMsCj4gKwkuZ2Ft
bWFfc2V0ID0gZHJtX2F0b21pY19oZWxwZXJfbGVnYWN5X2dhbW1hX3NldCwKPiAgfTsKPiAgCj4g
IC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gQEAgLTEyMDUsNiArMTIwNiw5IEBAIGludCByY2Fy
X2R1X2NydGNfY3JlYXRlKHN0cnVjdCByY2FyX2R1X2dyb3VwICpyZ3JwLCB1bnNpZ25lZCBpbnQg
c3dpbmRleCwKPiAgCWlmIChyY2R1LT5jbW1zW3N3aW5kZXhdKSB7Cj4gIAkJcmNydGMtPmNtbSA9
IHJjZHUtPmNtbXNbc3dpbmRleF07Cj4gIAkJcmdycC0+Y21tc19tYXNrIHw9IEJJVChod2luZGV4
ICUgMik7Cj4gKwo+ICsJCWRybV9tb2RlX2NydGNfc2V0X2dhbW1hX3NpemUoY3J0YywgQ00yX0xV
VF9TSVpFKTsKPiArCQlkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChjcnRjLCAwLCBmYWxzZSwg
Q00yX0xVVF9TSVpFKTsKPiAgCX0KPiAgCj4gIAlkcm1fY3J0Y19oZWxwZXJfYWRkKGNydGMsICZj
cnRjX2hlbHBlcl9mdW5jcyk7Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
