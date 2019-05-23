Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B412B445
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DB189CD7;
	Mon, 27 May 2019 12:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E632E89C88
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 06:50:40 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 2719D68B05; Thu, 23 May 2019 08:50:13 +0200 (CEST)
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
Subject: [PATCH 0/6] Add anx6345 DP/eDP bridge for Olimex Teres-I
Message-Id: <20190523065013.2719D68B05@newverein.lst.de>
Date: Thu, 23 May 2019 08:50:13 +0200 (CEST)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKbGVmdCBvdmVyIGZyb20gbXkgcHJldmlvdXMgVGVyZXMtSSBkZXZpY2UgdHJlZSBz
ZXJpZXMsIGhlcmUgY29tZXMKdGhlIHJldmlzZWQgYW54NjM0NSBub2RlIGZvciB0aGUgVGVyZXMt
SSwgYWxvbmcgd2l0aCB0aGUgZHJpdmVyLgpUaGUgaW5ub2x1eCBwYW5lbCBhdHRhY2hlZCB0byBp
dCBpcyBhbHJlYWR5IGtub3duOyBwaW5lYm9va3MgY2FuIGJlCmVuYWJsZWQgb24gdG9wIG9mIHRo
aXMgc2VyaWVzLCBvbmNlIHRoZWlyIHBhbmVscyBhcmUgaW50cm9kdWNlZC4KCkNoYW5nZXMgZnJv
bSB0aGUgcmVzcGVjdGl2ZSBwcmV2aW91cyB2ZXJzaW9uczoKCiogdGhlIHJlc2V0IHBvbGFyaXR5
IGlzIGNvcnJlY3RlZCBpbiBEVCBhbmQgdGhlIGRyaXZlcjsKICB0aGluZ3Mgc2hvdWxkIGJlIGNs
ZWFyZXIgbm93LgoKKiBhcyByZXF1ZXN0ZWQsIGFkZCBhIHBhbmVsICh0aGUga25vd24gaW5ub2x1
eCxuMTE2YmdlKSBhbmQgY29ubmVjdAogIHRoZSBwb3J0cy4KCiogcmVuYW1lZCBkdmRkPz8gdG8g
Ki1zdXBwbHkgdG8gbWF0Y2ggdGhlIGVzdGFibGlzaGVkIHNjaGVtZQoKKiB0cml2aWFsIHVwZGF0
ZSB0byB0aGUgI2luY2x1ZGUgbGlzdCwgdG8gbWFrZSBpdCBjb21waWxlIGluIDUuMgoKCVRvcnN0
ZW4KICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
