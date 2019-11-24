Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BE010814B
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2019 01:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68126E0E8;
	Sun, 24 Nov 2019 00:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A946E0E8
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 00:46:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id EA44728D210
Message-ID: <947ed9253bf501636e035698336c80c8af0743e0.camel@collabora.com>
Subject: Re: [PATCH v3 00/21] drm: Add support for bus-format negotiation
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 dri-devel@lists.freedesktop.org
Date: Sun, 24 Nov 2019 09:46:41 +0900
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
Organization: Collabora
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9yaXMsIE5laWwsCgpPbiBXZWQsIDIwMTktMTAtMjMgYXQgMTc6NDQgKzAyMDAsIEJvcmlz
IEJyZXppbGxvbiB3cm90ZToKPiBUaGlzIHBhdGNoIHNlcmllcyBhaW1zIGF0IGFkZGluZyBzdXBw
b3J0IGZvciBydW50aW1lIGJ1cy1mb3JtYXQKPiBuZWdvdGlhdGlvbiBiZXR3ZWVuIGFsbCBlbGVt
ZW50cyBvZiB0aGUKPiAnZW5jb2RlciAtPiBicmlkZ2VzIC0+IGNvbm5lY3Rvci9kaXNwbGF5JyBz
ZWN0aW9uIG9mIHRoZSBwaXBlbGluZS4KPiAKPiBJbiBvcmRlciB0byBzdXBwb3J0IHRoYXQsIHdl
IG5lZWQgZHJtIGJyaWRnZXMgdG8gZnVsbHkgdGFrZSBwYXJ0IGluIHRoZQo+IGF0b21pYyBzdGF0
ZSB2YWxpZGF0aW9uIHByb2Nlc3MsIHdoaWNoIHJlcXVpcmVzIGFkZGluZyBhCj4gZHJtX2JyaWRn
ZV9zdGF0ZSBhbmQgYSBuZXcgZHJtX2JyaWRnZV9mdW5jcy5hdG9taWNfY2hlY2soKSBob29rLgo+
IE9uY2UgdGhvc2UgYmFzaWMgYnVpbGRpbmcgYmxvY2tzIGFyZSBpbiBwbGFjZSwgd2UgY2FuIGFk
ZCBuZXcgaG9va3MgdG8KPiBhbGxvdyBidXMgZm9ybWF0IG5lZ290aWF0aW9uICh0aG9zZSBhcmUg
Y2FsbGVkIGp1c3QgYmVmb3JlCj4gLT5hdG9taWNfY2hlY2soKSkuIFRoZSBidXMgZm9ybWF0IHNl
bGVjdGlvbiBpcyBkb25lIGF0IHJ1bnRpbWUgYnkKPiB0ZXN0aW5nIGFsbCBwb3NzaWJsZSBjb21i
aW5hdGlvbnMgYWNyb3NzIHRoZSB3aG9sZSBicmlkZ2UgY2hhaW4gdW50aWwKPiBvbmUgaXMgcmVw
b3J0ZWQgdG8gd29yay4KPiAKPiBNYWpvciBjaGFuZ2VzIHNpbmNlIHYyOgo+ICogR2V0IHJpZCBv
ZiB0aGUgZHVtbXkgYnJpZGdlIGVtYmVkZGVkIGluIGRybV9lbmNvZGVyIGFuZCBsZXQgZW5jb2Rl
cgo+ICAgZHJpdmVycyBwcm92aWRlIHRoZWlyIG93biBicmlkZ2UgZWxlbWVudAo+ICogQ2xhcmlm
eSBBUElzIGFuZCBpbXByb3ZlIHRoZSBkb2MKPiAqIFByb3BhZ2F0ZSBidXMgZmxhZ3MgYnkgZGVm
YXVsdAo+IAo+IE1ham9yIGNoYW5nZXMgc2luY2UgdGhlIFJGQzoKPiAKPiAqIEFkZCBhIGR1bW15
IGJyaWRnZSB0byB0aGUgZHJtX2VuY29kZXIgb2JqZWN0IHNvIHRoYXQgdmM0IGFuZCBleHlub3MK
PiAgIERTSSBkcml2ZXJzIGNhbiBpbXBsZW1lbnQgdGhlIHByZV9lbmFibGUvcG9zdF9kaXNhYmxl
IGhvb2tzIGluc3RlYWQKPiAgIG9mIG1hbnVhbGx5IHNldHRpbmcgZW5jb2Rlci0+YnJpZGdlIHRv
IE5VTEwgdG8gY29udHJvbCB0aGUKPiAgIGVuYWJsZS9kaXNhYmxlIHNlcXVlbmNlLiBUaGlzIGNo
YW5nZSBpcyBhbHNvIGEgZmlyc3Qgc3RlcCB0b3dhcmRzCj4gICBkcm1fYnJpZGdlL2RybV9lbmNv
ZGVyIHVuaWZpY2F0aW9uLiBOZXcgZW5jb2RlciBkcml2ZXJzIHNob3VsZAo+ICAgc3RvcCBpbXBs
ZW1lbnRpbmcgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzIGFuZCBzd2l0Y2ggdG8KPiAgIGRybV9i
cmlkZ2VfZnVuY3MuIEV4aXN0aW5nIGRyaXZlcnMgY2FuIGJlIGNvbnZlcnRlZCBwcm9ncmVzc2l2
ZWx5Cj4gICAoYWxyZWFkeSBoYXZlIGEgYnJhbmNoIHdoZXJlIEkgc3RhcnRlZCBjb252ZXJ0aW5n
IHNvbWUgb2YgdGhlbSBbMV0pCj4gKiByZXdvcmsgdGhlIGJ1cyBmb3JtYXQgbmVnb3RpYXRpb24g
dG8gZ2l2ZSBtb3JlIGNvbnRyb2wgdG8gYnJpZGdlCj4gICBkcml2ZXJzIGluIHRoZSBzZWxlY3Rp
b24gcHJvY2VzcyAoZHJpdmVyIGNhbiBzZWxlY3QgYXQgcnVudGltZSB3aGljaAo+ICAgaW5wdXQg
YnVzIGZvcm1hdCB0aGV5IHN1cHBvcnQgZm9yIGEgc3BlY2lmaWMgb3V0cHV0IGJ1cyBmb3JtYXQg
YmFzZWQKPiAgIG9uIGFueSBpbmZvcm1hdGlvbiBhdmFpbGFibGUgaW4gdGhlIGNvbm5lY3Rvciwg
Y3J0YyBhbmQgYnJpZGdlIHN0YXRlLgo+IAo+IEEgbW9yZSBkZXRhaWxlZCBjaGFuZ2Vsb2cgaXMg
cHJvdmlkZWQgaW4gZWFjaCBwYXRjaC4KPiAKPiBUaGlzIHBhdGNoIHNlcmllcyBpcyBhbHNvIGF2
YWlsYWJsZSBoZXJlIFsyXS4KPiAKPiBUaGFua3MsCj4gCj4gQm9yaXMKPiAKPiBbMV1odHRwczov
L2dpdGh1Yi5jb20vYmJyZXppbGxvbi9saW51eC0wZGF5L2NvbW1pdHMvZHJtLWVuY29kZXItYnJp
ZGdlCj4gWzJdaHR0cHM6Ly9naXRodWIuY29tL2JicmV6aWxsb24vbGludXgtMGRheS9jb21taXRz
L2RybS1icmlkZ2UtYnVzZm10LXYzCj4gCj4gKioqIEJMVVJCIEhFUkUgKioqCj4gCj4gQm9yaXMg
QnJlemlsbG9uICgyMSk6Cj4gICBkcm0vdmM0OiBEZWNsYXJlIHRoZSBEU0kgZW5jb2RlciBhcyBh
IGJyaWRnZSBlbGVtZW50Cj4gICBkcm0vZXh5bm9zOiBEb24ndCByZXNldCBicmlkZ2UtPm5leHQK
PiAgIGRybS9leHlub3M6IERlY2xhcmUgdGhlIERTSSBlbmNvZGVyIGFzIGEgYnJpZGdlIGVsZW1l
bnQKPiAgIGRybS9icmlkZ2U6IFJlbmFtZSBicmlkZ2UgaGVscGVycyB0YXJnZXRpbmcgYSBicmlk
Z2UgY2hhaW4KPiAgIGRybS9icmlkZ2U6IEludHJvZHVjZSBkcm1fYnJpZGdlX2NoYWluX2dldF9u
ZXh0X2JyaWRnZSgpCj4gICBkcm06IFN0b3AgYWNjZXNzaW5nIGVuY29kZXItPmJyaWRnZSBkaXJl
Y3RseQoKUGF0Y2hlcyAxIHRvIDYgc2VlbSB0byBiZSByZXZpZXdlZCwgYW5kIGFwcGVhciBhcyBh
IGdvb2QKc3RlcCBmb3J3YXJkLgoKUGVyaGFwcyB3ZSBjYW4gY29uc2lkZXIgbWVyZ2luZyB0aGVz
ZSBmaXJzdD8gVGhhdCB3YXksCndlIGNhbiByZWR1Y2UgdGhlIHBhdGNoZXMgbmVlZGVkIHRvIHJl
YmFzZSBhbmQgc3VibWl0Cm9uIGVhY2ggaXRlcmF0aW9uLgoKUmVnYXJkcywKRXplcXVpZWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
