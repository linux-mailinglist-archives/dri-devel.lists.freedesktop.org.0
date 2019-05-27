Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B6E2B28B
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 12:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6065189872;
	Mon, 27 May 2019 10:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AEE89864;
 Mon, 27 May 2019 10:54:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9FD2D2001F;
 Mon, 27 May 2019 12:54:53 +0200 (CEST)
Date: Mon, 27 May 2019 12:54:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/panel: drop drmP.h usage
Message-ID: <20190527105452.GA13058@ravnborg.org>
References: <20190526180532.1641-1-sam@ravnborg.org>
 <20190526180532.1641-3-sam@ravnborg.org>
 <CACRpkdYtuR4zGFUfQ0rGbxUjgDtGRwvogtyBjMbf31-ZjRonLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYtuR4zGFUfQ0rGbxUjgDtGRwvogtyBjMbf31-ZjRonLQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=TrLAQggYAAAA:8 a=yeKzkmglZQDLP3BYtvEA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=cvBusfyB2V15izCimMoJ:22
 a=QoK_kFSlXyMruhzWCCVu:22
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
Cc: David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stefan Mavrodiev <stefan@olimex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMTE6MTE6MThBTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBTdW4sIE1heSAyNiwgMjAxOSBhdCA4OjA1IFBNIFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4gd3JvdGU6Cj4gCj4gPiBEcm9wIHVzZSBvZiB0aGUgZGVwcmVjYXRlZCBk
cm1QLmggaGVhZGVyIGZpbGUuCj4gPgo+ID4gV2hpbGUgdG91Y2hpbmcgdGhlIGxpc3Qgb2YgaW5j
bHVkZSBmaWxlczoKPiA+IC0gRGl2aWRlIGluY2x1ZGUgZmlsZXMgaW4gYmxvY2tzIG9mIGxpbnV4
LyogdmlkZW8vKiBkcm0vKiBldGMuCj4gPiAgIEJlIGNvbnNpc3RlbnQgaW4gdGhlIG9yZGVyIG9m
IHRoZSBibG9ja3MKPiA+IC0gU29ydCBpbmRpdmlkdWFsIGJsb2NrcyBvZiBpbmNsdWRlIGZpbGVz
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+
ID4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gPiBDYzog
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+ID4gQ2M6IFN0ZWZhbiBN
YXZyb2RpZXYgPHN0ZWZhbkBvbGltZXguY29tPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gCj4g
UmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KVGhh
bmtzLCBjYW4gSSBnZXQgeW91IHRvIHJldmlldyBwYXRjaCAxLzIgdG9vPwoKCVNhbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
