Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8561E34A57
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479DB88344;
	Tue,  4 Jun 2019 14:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31975897E3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 12:22:19 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 29D6468B05; Tue,  4 Jun 2019 14:21:50 +0200 (CEST)
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
Message-Id: <20190604122150.29D6468B05@newverein.lst.de>
Date: Tue,  4 Jun 2019 14:21:50 +0200 (CEST)
X-Mailman-Approved-At: Tue, 04 Jun 2019 14:26:35 +0000
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

CkFOWDYzNDUgTFZUVEwtPmVEUCB2aWRlbyBicmlkZ2UsIGRyaXZlciB3aXRoIGRldmljZSB0cmVl
IGJpbmRpbmdzLgoKCkNoYW5nZXMgZnJvbSB2MToKCiogZml4ZWQgdXAgY29weXJpZ2h0IGluZm9y
bWF0aW9uLiBNb3N0IGNvZGUgY2hhbmdlcyBhcmUgb25seSBtb3ZlcyBhbmQgdGh1cwogIHJldGFp
biBjb3B5cmlnaHQgYW5kIG1vZHVsZSBvd25lcnNoaXAuIEV2ZW4gdGhlIG5ldyBhbmFsb2dpeC1h
bng2MzQ1LmMgb3JpZ2luYXRlcwogIGZyb20gdGhlIG9sZCAxNDk1LWxpbmUgYW5hbG9naXgtYW54
Nzh4eC5jLCB3aXRoIDMwNiBpbnNlcnRpb25zIGFuZCA5ODcgZGVsZXRpb25zCiAgKGlnbm9yaW5n
IHRoZSB0cml2aWFsIGFueDc4eHggLT4gYW54NjM0NSByZXBsYWNlbWVudHMpIDMwNiBuZXcgdnMu
IDUwOCBvbGQuLi4KCiogZml4ZWQgYWxsIG1pbm9yIGZvcm1hdHRpbmcgaXNzdWVzIGJyb3VnaHQg
dXAKCiogbWVyZ2VkIHByZXZpb3VzbHkgc2VwYXJhdGUgbmV3IGFuYWxvZ2l4X2RwX2kyYyBtb2R1
bGUgaW50byBleGlzdGluZyBhbmFsb2dpeF9kcAoKKiBzcGxpdCBhZGRpdGlvbmFsIGRlZmluZXMg
aW50byBhIHByZXBhcmF0b3J5IHBhdGNoCgoqIHJlbmFtZWQgdGhlIGZhY3RvcmVkLW91dCBjb21t
b24gZnVuY3Rpb25zIGFueF9hdXhfKiAtPiBhbnhfZHBfYXV4XyosIGJlY2F1c2UKICBhbnhfLi4u
YXV4X3RyYW5zZmVyIHdhcyBleHBvcnRlZCBnbG9iYWxseS4gQmVzaWRlcywgaXQgaXMgbm93IEdQ
TC1vbmx5IGV4cG9ydGVkLgoKKiBtb3ZlZCBjaGlwIElEIHJlYWQgaW50byBhIHNlcGFyYXRlIGZ1
bmN0aW9uLgoKKiBrZWVwIHRoZSBjaGlwIHBvd2VyZWQgYWZ0ZXIgYSBzdWNjZXNzZnVsIHByb2Jl
LgogIChUaGVyZSdzIGEgZ29vZCBjaGFuY2UgdGhhdCB0aGlzIGlzIHRoZSBvbmx5IGRpc3BsYXkg
ZHVyaW5nIGJvb3QhKQoKKiB1cGRhdGVkIHRoZSBiaW5kaW5nIGRvY3VtZW50OiBMVlRUTCBpbnB1
dCBpcyBub3cgcmVxdWlyZWQsIG9ubHkgdGhlIG91dHB1dCBzaWRlCiAgZGVzY3JpcHRpb24gaXMg
b3B0aW9uYWwuCgogTGF1cmVudDogSSBoYXZlIGFsc28gbG9va2VkIGludG8gdGhlIGRybV9wYW5l
bF9icmlkZ2UgaW5mcmFzdHJ1Y3R1cmUsCiBidXQgaXQncyBub3QgdGhhdCB0cml2aWFsIHRvIGNv
bnZlcnQgdGhlc2UgZHJpdmVycyB0byBpdC4KCkNoYW5nZXMgZnJvbSB0aGUgcmVzcGVjdGl2ZSBw
cmV2aW91cyB2ZXJzaW9uczoKCiogdGhlIHJlc2V0IHBvbGFyaXR5IGlzIGNvcnJlY3RlZCBpbiBE
VCBhbmQgdGhlIGRyaXZlcjsKICB0aGluZ3Mgc2hvdWxkIGJlIGNsZWFyZXIgbm93LgoKKiBhcyBy
ZXF1ZXN0ZWQsIGFkZCBhIHBhbmVsICh0aGUga25vd24gaW5ub2x1eCxuMTE2YmdlKSBhbmQgY29u
bmVjdAogIHRoZSBwb3J0cy4KCiogcmVuYW1lZCBkdmRkPz8gdG8gKi1zdXBwbHkgdG8gbWF0Y2gg
dGhlIGVzdGFibGlzaGVkIHNjaGVtZQoKKiB0cml2aWFsIHVwZGF0ZSB0byB0aGUgI2luY2x1ZGUg
bGlzdCwgdG8gbWFrZSBpdCBjb21waWxlIGluIDUuMgoKCVRvcnN0ZW4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
