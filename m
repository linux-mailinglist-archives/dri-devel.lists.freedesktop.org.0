Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3822471278
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A1189264;
	Tue, 23 Jul 2019 07:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418F188FE2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:04:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 9F97668B20; Mon, 22 Jul 2019 17:04:14 +0200 (CEST)
From: Torsten Duwe <duwe@lst.de>
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 0/7] Add anx6345 DP/eDP bridge for Olimex Teres-I
Message-Id: <20190722150414.9F97668B20@verein.lst.de>
Date: Mon, 22 Jul 2019 17:04:14 +0200 (CEST)
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
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
Cc: devicetree@vger.kernel.org, "Bcc:duwe"@lst.de,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QU5YNjM0NSBMVlRUTC0+ZURQIHZpZGVvIGJyaWRnZSwgZHJpdmVyIHdpdGggZGV2aWNlIHRyZWUg
YmluZGluZ3MuCgpDaGFuZ2VzIGZyb20gdjI6CgoqIHVzZSBTUERYLUlEcyB0aHJvdWdob3V0Cgoq
IHJlbW92ZWQgdGhlIHBhbmVsIG91dHB1dCBhZ2FpbiwgYXMgaXQgd2FzIG5vdCB3aGF0IE1heGlt
ZSBoYWQgaW4gbWluZC4KICBBdCBsZWFzdCB0aGUgVGVyZXMtSSBkb2VzIHZlcnkgd2VsbCB3aXRo
b3V0LiBObyBjb25uZWN0b3Igc3BlYywgbm8gInF1aXJrcyJbMV0sCiAganVzdCBwbGFpbiBFRElE
IGF0IHdvcmsuCgoqIGJpbmRpbmcgY2xhcmlmaWNhdGlvbnMgYW5kIGNvc21ldGljIGNoYW5nZXMg
YXMgc3VnZ2VzdGVkIGJ5IEFuZHJ6ZWoKCkNoYW5nZXMgZnJvbSB2MToKCiogZml4ZWQgdXAgY29w
eXJpZ2h0IGluZm9ybWF0aW9uLiBNb3N0IGNvZGUgY2hhbmdlcyBhcmUgb25seSBtb3ZlcyBhbmQg
dGh1cwogIHJldGFpbiBjb3B5cmlnaHQgYW5kIG1vZHVsZSBvd25lcnNoaXAuIEV2ZW4gdGhlIG5l
dyBhbmFsb2dpeC1hbng2MzQ1LmMgb3JpZ2luYXRlcwogIGZyb20gdGhlIG9sZCAxNDk1LWxpbmUg
YW5hbG9naXgtYW54Nzh4eC5jLCB3aXRoIDMwNiBpbnNlcnRpb25zIGFuZCA5ODcgZGVsZXRpb25z
CiAgKGlnbm9yaW5nIHRoZSB0cml2aWFsIGFueDc4eHggLT4gYW54NjM0NSByZXBsYWNlbWVudHMp
IDMwNiBuZXcgdnMuIDUwOCBvbGQuLi4KCiogZml4ZWQgYWxsIG1pbm9yIGZvcm1hdHRpbmcgaXNz
dWVzIGJyb3VnaHQgdXAKCiogbWVyZ2VkIHByZXZpb3VzbHkgc2VwYXJhdGUgbmV3IGFuYWxvZ2l4
X2RwX2kyYyBtb2R1bGUgaW50byBleGlzdGluZyBhbmFsb2dpeF9kcAoKKiBzcGxpdCBhZGRpdGlv
bmFsIGRlZmluZXMgaW50byBhIHByZXBhcmF0b3J5IHBhdGNoCgoqIHJlbmFtZWQgdGhlIGZhY3Rv
cmVkLW91dCBjb21tb24gZnVuY3Rpb25zIGFueF9hdXhfKiAtPiBhbnhfZHBfYXV4XyosIGJlY2F1
c2UKICBhbnhfLi4uYXV4X3RyYW5zZmVyIHdhcyBleHBvcnRlZCBnbG9iYWxseS4gQmVzaWRlcywg
aXQgaXMgbm93IEdQTC1vbmx5IGV4cG9ydGVkLgoKKiBtb3ZlZCBjaGlwIElEIHJlYWQgaW50byBh
IHNlcGFyYXRlIGZ1bmN0aW9uLgoKKiBrZWVwIHRoZSBjaGlwIHBvd2VyZWQgYWZ0ZXIgYSBzdWNj
ZXNzZnVsIHByb2JlLgogIChUaGVyZSdzIGEgZ29vZCBjaGFuY2UgdGhhdCB0aGlzIGlzIHRoZSBv
bmx5IGRpc3BsYXkgZHVyaW5nIGJvb3QhKQoKKiB1cGRhdGVkIHRoZSBiaW5kaW5nIGRvY3VtZW50
OiBMVlRUTCBpbnB1dCBpcyBub3cgcmVxdWlyZWQsIG9ubHkgdGhlIG91dHB1dCBzaWRlCiAgZGVz
Y3JpcHRpb24gaXMgb3B0aW9uYWwuCgogTGF1cmVudDogSSBoYXZlIGFsc28gbG9va2VkIGludG8g
dGhlIGRybV9wYW5lbF9icmlkZ2UgaW5mcmFzdHJ1Y3R1cmUsCiBidXQgaXQncyBub3QgdGhhdCB0
cml2aWFsIHRvIGNvbnZlcnQgdGhlc2UgZHJpdmVycyB0byBpdC4KCkNoYW5nZXMgZnJvbSB0aGUg
cmVzcGVjdGl2ZSBwcmV2aW91cyB2ZXJzaW9uczoKCiogdGhlIHJlc2V0IHBvbGFyaXR5IGlzIGNv
cnJlY3RlZCBpbiBEVCBhbmQgdGhlIGRyaXZlcjsKICB0aGluZ3Mgc2hvdWxkIGJlIGNsZWFyZXIg
bm93LgoKKiBhcyByZXF1ZXN0ZWQsIGFkZCBhIHBhbmVsICh0aGUga25vd24gaW5ub2x1eCxuMTE2
YmdlKSBhbmQgY29ubmVjdAogIHRoZSBwb3J0cy4KCiogcmVuYW1lZCBkdmRkPz8gdG8gKi1zdXBw
bHkgdG8gbWF0Y2ggdGhlIGVzdGFibGlzaGVkIHNjaGVtZQoKKiB0cml2aWFsIHVwZGF0ZSB0byB0
aGUgI2luY2x1ZGUgbGlzdCwgdG8gbWFrZSBpdCBjb21waWxlIGluIDUuMgoKLS0tLS0tLS0tLS0t
LS0KWzFdIEkgaGVzaXRhdGUgdG8gYXNzb2NpYXRlIGluZm9ybWF0aW9uIGFib3V0IGEgY29ubmVj
dGVkIHBhbmVsIHdpdGggdGhhdCB0ZXJtLgogICAgQnV0IHNob3VsZCBpdCBiZSBuZWNjZXNzYXJ5
IGZvciBtYXhpbXVtIHBvd2VyIHNhdmluZyAoZS5nLiBwaW5lYm9va3MpLAogICAgaXQgd291bGQg
YmUgZ29vZCB0byBoYXZlIHNvbWV0aGluZyBoZXJlLCByZWdhcmRsZXNzIG9mIG5vbWVuY2xhdHVy
ZS4KCglUb3JzdGVuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
