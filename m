Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579C535256
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 23:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED3C89C97;
	Tue,  4 Jun 2019 21:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE3889C97
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 21:54:30 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 018CD803F1;
 Tue,  4 Jun 2019 23:54:25 +0200 (CEST)
Date: Tue, 4 Jun 2019 23:54:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Claudiu.Beznea@microchip.com
Subject: Re: [RESEND][PATCH v3 0/6] add LCD support for SAM9X60
Message-ID: <20190604215424.GA1959@ravnborg.org>
References: <1556195748-11106-1-git-send-email-claudiu.beznea@microchip.com>
 <20190507182713.GA16862@ravnborg.org>
 <c361b013-2d98-76e3-d30f-cec83000933c@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c361b013-2d98-76e3-d30f-cec83000933c@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=XYAwZIGsAAAA:8
 a=toYhtMco48c0QF2qMRYA:9 a=CjuIK1q_8ugA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
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
Cc: linux-pwm@vger.kernel.org, alexandre.belloni@bootlin.com,
 bbrezillon@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ludovic.Desroches@microchip.com,
 thierry.reding@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2xhdWRpdS4KCk9uIFR1ZSwgSnVuIDA0LCAyMDE5IGF0IDA0OjE4OjMzUE0gKzAwMDAsIENs
YXVkaXUuQmV6bmVhQG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gSGkgU2FtLAo+IAo+IE9uIDA3LjA1
LjIwMTkgMjE6MjcsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+IEV4dGVybmFsIEUtTWFpbAo+ID4g
Cj4gPiAKPiA+IEhpIFRoaWVycnkuCj4gPiAKPiA+PiAgIHB3bTogYXRtZWwtaGxjZGM6IGFkZCBj
b21wYXRpYmxlIGZvciBTQU05WDYwIEhMQ0RDJ3MgUFdNCj4gPiBPSyB0byBhZGQgdGhlICJwd206
IGF0bWVsLWhsY2RjOiBhZGQgY29tcGF0aWJsZSBmb3IgU0FNOVg2MCBITENEQydzIFBXTSIKPiA+
IHBhdGNoIHZpYSBkcm0tbWlzYz8KPiA+IFRoZW4gd2UgY2FuIGFkZCBhbGwgNiBwYXRjaGVzIGlu
IG9uZSBnby4KPiAKPiBTaW5jZSB3ZSBkb24ndCBoYXZlIGFuIGFuc3dlciBmcm9tIFRoaWVycnkg
dGlsbCBub3csIGRvIHlvdSB0aGluayBpdCBjb3VsZAo+IGJlIGZlYXNpYmxlIHRvIHRha2UgdGhl
IHJlc3Qgb2YgdGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXM/IEFmdGVyIHRoYXQgSQo+IHdpbGwg
cmUtc2VuZCB0aGUgUFdNIHBhdGNoIHRvIFBXTSBsaXN0LgoKVGhhbmtzIGZvciB0aGUgcmVtaW5k
ZXIuCgpQYXRjaGVzIDEsMiBhbmQgNCw1LDYgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LgoKUmV3
b3JkZWQgY2hhbmdlbG9nIGEgYml0IGluIHBhdGNoIDYuCgoJU2FtCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
