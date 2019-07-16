Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1C16A3DC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 10:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B60E89F73;
	Tue, 16 Jul 2019 08:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED2089F73
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 08:30:44 +0000 (UTC)
X-Originating-IP: 91.163.65.175
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 18E6AC001A;
 Tue, 16 Jul 2019 08:30:40 +0000 (UTC)
Date: Tue, 16 Jul 2019 10:28:51 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 05/19] drm/sun4i: drop use of drmP.h
Message-ID: <20190716082851.josovj4mtyjqdw36@flea>
References: <20190716064220.18157-1-sam@ravnborg.org>
 <20190716064220.18157-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190716064220.18157-6-sam@ravnborg.org>
User-Agent: NeoMutt/20180716
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDg6NDI6MDZBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IERyb3AgdXNlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIgZmlsZS4KPgo+
IFdoaWxlIHRvdWNoaW5nIHRoZSBsaXN0IG9mIGluY2x1ZGUgZmlsZSwgdXNlIHRoZSB0eXBpY2Fs
IG9yZGVyIG9mIHRoZQo+IGJsb2NrczoKPiBcI2luY2x1ZGUgPGxpbnV4Lyo+Cj4KPiBcI2luY2x1
ZGUgPHZpZGVvLyo+Cj4KPiBcI2luY2x1ZGUgPGRybS8qPgo+Cj4gXCNpbmNsdWRlICIiCj4KPiBX
aXRoaW4gZWFjaCBibG9jaywgc29ydCB0aGUgZmlsZXMuCj4gSW5jbHVkZSBuZWNlc3NhcnkgZmls
ZXMgdG8gZml4IGJ1aWxkIGFmdGVyIHRoZSBkcm1QLmggcmVtb3ZhbC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBBY2tlZC1ieTogRW1pbCBWZWxp
a292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4
aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IENoZW4tWXUg
VHNhaSA8d2Vuc0Bjc2llLm9yZz4KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCgpBY2tlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNv
bT4KCk1heGltZQoKLS0KTWF4aW1lIFJpcGFyZCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
