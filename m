Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0237575195
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 16:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E8E6E70D;
	Thu, 25 Jul 2019 14:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E456E70D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:44:01 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 31B6C3AA9BD
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:40:30 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4E0F860012;
 Thu, 25 Jul 2019 14:40:06 +0000 (UTC)
Date: Thu, 25 Jul 2019 13:32:37 +0200
From: "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [PATCH 0/1] This patch fixes connection detection for monitors
 w/o DDC.
Message-ID: <20190725113237.d2dwxzientte4j3n@flea>
References: <20190725110520.26848-1-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725110520.26848-1-oleksandr.suvorov@toradex.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Igor Opaniuk <igor.opaniuk@toradex.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NjU7NTYwMzsxYwpPbiBUaHUsIEp1bCAyNSwgMjAxOSBhdCAxMTowNToyM0FNICswMDAwLCBPbGVr
c2FuZHIgU3V2b3JvdiB3cm90ZToKPgo+IEV2ZW4gaW4gc291cmNlIGNvZGUgb2YgdGhpcyBkcml2
ZXIgdGhlcmUgaXMgYW4gYXV0aG9yJ3MgZGVzY3JpcHRpb246Cj4gICAgIC8qCj4gICAgICAqIEV2
ZW4gaWYgd2UgaGF2ZSBhbiBJMkMgYnVzLCB3ZSBjYW4ndCBhc3N1bWUgdGhhdCB0aGUgY2FibGUK
PiAgICAgICogaXMgZGlzY29ubmVjdGVkIGlmIGRybV9wcm9iZV9kZGMgZmFpbHMuIFNvbWUgY2Fi
bGVzIGRvbid0Cj4gICAgICAqIHdpcmUgdGhlIEREQyBwaW5zLCBvciB0aGUgSTJDIGJ1cyBtaWdo
dCBub3QgYmUgd29ya2luZyBhdAo+ICAgICAgKiBhbGwuCj4gICAgICAqLwo+Cj4gVGhhdCdzIHRy
dWUuIEREQyBhbmQgVkdBIGNoYW5uZWxzIGFyZSBpbmRlcGVuZGVudCwgYW5kIHRoZXJlZm9yZQo+
IHdlIGNhbm5vdCBkZWNpZGUgd2hldGhlciB0aGUgbW9uaXRvciBpcyBjb25uZWN0ZWQgb3Igbm90
LAo+IGRlcGVuZGluZyBvbiB0aGUgaW5mb3JtYXRpb24gZnJvbSB0aGUgRERDLgo+Cj4gU28gdGhl
IG1vbml0b3Igc2hvdWxkIGFsd2F5cyBiZSBjb25zaWRlcmVkIGNvbm5lY3RlZC4KCldlbGwsIG5v
LiBMaWtlIHlvdSBzYWlkLCB3ZSBjYW5ub3QgZGVjaWRlZCB3aGV0aGVyIGlzIGNvbm5lY3RlZCBv
cgpub3QuCgo+IFRodXMgdGhlcmUgaXMgbm8gcmVhc29uIHRvIHVzZSBjb25uZWN0b3IgZGV0ZWN0
IGNhbGxiYWNrIGZvciB0aGlzCj4gZHJpdmVyOiBEUk0gc3ViLXN5c3RlbSBjb25zaWRlcnMgbW9u
aXRvciBhbHdheXMgY29ubmVjdGVkIGlmIHRoZXJlCj4gaXMgbm8gZGV0ZWN0KCkgY2FsbGJhY2sg
cmVnaXN0ZXJlZCB3aXRoIGRybV9jb25uZWN0b3JfaW5pdCgpLgo+Cj4gSG93IHRvIHJlcHJvZHVj
ZSB0aGUgYnVnOgo+ICogc2V0dXA6IGkuTVg4UVhQLCBMQ0RJRiB2aWRlbyBtb2R1bGUgKyBncHUv
ZHJtL214c2ZiIGRyaXZlciwKPiAgIGFkdjcxMnggVkdBIERBQyArIGR1bWItdmdhLWRhYyBkcml2
ZXIsIFZHQS1jb25uZWN0b3Igdy9vIEREQzsKPiAqIHRyeSB0byB1c2UgZHJpdmVycyBjaGFpbiBt
eHNmYi1kcm0gKyBkdW1iLXZnYS1kYWM7Cj4gKiBhbnkgRFJNIGFwcGxpY2F0aW9ucyBjb25zaWRl
ciB0aGUgbW9uaXRvciBpcyBub3QgY29ubmVjdGVkOgo+ICAgPT09PT09PT09PT0KPiAgICQgd2Vz
dG9uLXN0YXJ0Cj4gICAkIGNhdCAvdmFyL2xvZy93ZXN0b24ubG9nCj4gICAgICAgLi4uCj4gICAg
ICAgRFJNOiBoZWFkICdWR0EtMScgZm91bmQsIGNvbm5lY3RvciAzMiBpcyBkaXNjb25uZWN0ZWQu
Cj4gICAgICAgLi4uCj4gICAkIGNhdCAvc3lzL2RldmljZXMvcGxhdGZvcm0vNWExODAwMDAubGNk
aWYvZHJtL2NhcmQwL2NhcmQwLVZHQS0xL3N0YXR1cwo+ICAgdW5rbm93bgoKQW5kIHRoYXQncyBl
eGFjdGx5IHdoYXQncyBiZWluZyByZXBvcnRlZCBoZXJlOiB3ZSBjYW5ub3QgZGVjaWRlIGlmIGl0
CmlzIGNvbm5lY3RlZCBvciBub3QsIHNvIGl0J3MgdW5rbm93bi4KCklmIHdlc3RvbiBjaG9vc2Vz
IHRvIGlnbm9yZSBjb25uZWN0b3JzIHRoYXQgYXJlIGluIGFuIHVua25vd24gc3RhdGUsCkknZCBz
YXkgaXQncyB3ZXN0b24ncyBwcm9ibGVtLCBzaW5jZSBpdCdzIG11Y2ggYnJvYWRlciB0aGFuIHRo
aXMKcGFydGljdWxhciBkZXZpY2UuCgpNYXhpbWUKCi0tCk1heGltZSBSaXBhcmQsIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
