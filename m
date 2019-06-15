Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E96474F0
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5A489228;
	Sun, 16 Jun 2019 14:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs32.siol.net [185.57.226.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24172892B1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 09:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id 12758521FCA;
 Sat, 15 Jun 2019 11:17:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id yyLb-_JfXJHX; Sat, 15 Jun 2019 11:17:14 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 2C731521FCD;
 Sat, 15 Jun 2019 11:17:14 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-52-202.static.triera.net
 [86.58.52.202]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id 00F3E521FCA;
 Sat, 15 Jun 2019 11:17:10 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Use automatic CTS generation mode
 when using non-AHB audio
Date: Sat, 15 Jun 2019 11:17:10 +0200
Message-ID: <1804909.ykhh25WWxx@jernej-laptop>
In-Reply-To: <20190612085147.26971-1-narmstrong@baylibre.com>
References: <20190612085147.26971-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG5lIHNyZWRhLCAxMi4ganVuaWogMjAxOSBvYiAxMDo1MTo0NyBDRVNUIGplIE5laWwgQXJtc3Ry
b25nIG5hcGlzYWwoYSk6Cj4gV2hlbiB1c2luZyBhbiBJMlMgc291cmNlIHVzaW5nIGEgZGlmZmVy
ZW50IGNsb2NrIHNvdXJjZSAodXN1YWxseSB0aGUgSTJTCj4gYXVkaW8gSFcgdXNlcyBkZWRpY2F0
ZWQgUExMcywgZGlmZmVyZW50IGZyb20gdGhlIEhETUkgUEhZIFBMTCksIGZpeGVkCj4gQ1RTIHZh
bHVlcyB3aWxsIGNhdXNlIHNvbWUgZnJlcXVlbnQgYXVkaW8gZHJvcC1vdXQgYW5kIGdsaXRjaGVz
IGFzCj4gcmVwb3J0ZWQgb24gQW1sb2dpYywgQWxsd2lubmVyIGFuZCBSb2NrY2hpcCBTb0NzIHNl
dHVwcy4KPiAKPiBTZXR0aW5nIHRoZSBDVFMgaW4gYXV0b21hdGljIG1vZGUgd2lsbCBsZXQgdGhl
IEhETUkgY29udHJvbGxlciBnZW5lcmF0ZQo+IGF1dG9tYXRpY2FsbHkgdGhlIENUUyB2YWx1ZSB0
byBtYXRjaCB0aGUgaW5wdXQgYXVkaW8gY2xvY2suCj4gCj4gVGhlIERlc2lnbldhcmUgRFctSERN
SSBVc2VyIEd1aWRlIGV4cGxhaW5zOgo+ICAgRm9yIEF1dG9tYXRpYyBDVFMgZ2VuZXJhdGlvbgo+
ICAgV3JpdGUgIjAiIG9uIHRoZSBiaXQgZmllbGQgIkNUU19tYW51YWwiLCBSZWdpc3RlciAweDMy
MDU6IEFVRF9DVFMzCj4gCj4gVGhlIERlc2lnbldhcmUgRFctSERNSSBEYXRhYm9vayBleHBsYWlu
cyA6Cj4gICBJZiAiQ1RTX21hbnVhbCIgYml0IGVxdWFscyAwYiB0aGlzIHJlZ2lzdGVycyBjb250
YWlucyAiYXVkQ1RTWzE5OjBdIgo+ICAgZ2VuZXJhdGVkIGJ5IHRoZSBDeWNsZSB0aW1lIGNvdW50
ZXIgYWNjb3JkaW5nIHRvIHNwZWNpZmllZCB0aW1pbmcuCj4gCj4gQ2M6IEplcm5laiBTa3JhYmVj
IDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4KPiBDYzogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgo+
IENjOiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+IENjOiBKZXJvbWUgQnJ1bmV0
IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8
bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CgpUZXN0ZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJu
ZWouc2tyYWJlY0BzaW9sLm5ldD4KUmV2aWV3ZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWou
c2tyYWJlY0BzaW9sLm5ldD4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
