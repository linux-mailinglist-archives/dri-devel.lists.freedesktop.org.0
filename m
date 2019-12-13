Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 220EE11F23E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486866E3A4;
	Sat, 14 Dec 2019 14:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 580 seconds by postgrey-1.36 at gabe;
 Fri, 13 Dec 2019 18:20:39 UTC
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6125089F92
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 18:20:39 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 6BCF93B289C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 18:11:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id F2189200009;
 Fri, 13 Dec 2019 18:10:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 <linux-rockchip@lists.infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 00/12] Add PX30 LVDS support
Date: Fri, 13 Dec 2019 19:10:39 +0100
Message-Id: <20191213181051.25983-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpUaGlzIHNlcmllcyBhaW1zIGF0IHN1cHBvcnRpbmcgTFZEUyBvbiBQWDMwLgoKQSBm
aXJzdCBjb3VwbGUgb2YgcGF0Y2hlcyB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gd2l0aCB0aGUg
bmV3CmNvbXBhdGlibGUgYW5kIHRoZSBwcmVzZW5jZSBvZiBhIFBIWS4gVGhlbiwgdGhlIGV4aXN0
aW5nIFJvY2tjaGlwCmRyaXZlciBpcyBjbGVhbmVkIGFuZCBleHRlbmRlZCB0byBzdXBwb3J0IFBY
MzAgc3BlY2lmaWNpdGllcy4gRmluYWxseSwKdGhlIFBYMzAgRFRTSSBpcyB1cGRhdGVkIHdpdGgg
Q1JUQyByb3V0ZXMsIHRoZSBEU0kgRFBIWSBhbmQgdGhlIExWRFMKSVAgaXRzZWxmLgoKQ2hlZXJz
LApNaXF1w6hsCgpNaXF1ZWwgUmF5bmFsICgxMik6CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJv
Y2tjaGlwLWx2ZHM6IERlY2xhcmUgUFgzMCBjb21wYXRpYmxlCiAgZHQtYmluZGluZ3M6IGRpc3Bs
YXk6IHJvY2tjaGlwLWx2ZHM6IERvY3VtZW50IFBYMzAgUEhZCiAgZHJtL3JvY2tjaGlwOiBsdmRz
OiBGaXggaW5kZW50YXRpb24gb2YgYSAjZGVmaW5lCiAgZHJtL3JvY2tjaGlwOiBsdmRzOiBIYXJt
b25pemUgZnVuY3Rpb24gbmFtZXMKICBkcm0vcm9ja2NoaXA6IGx2ZHM6IENoYW5nZSBwbGF0Zm9y
bSBkYXRhCiAgZHJtL3JvY2tjaGlwOiBsdmRzOiBDcmVhdGUgYW4gUkszMjg4IHNwZWNpZmljIHBy
b2JlIGZ1bmN0aW9uCiAgZHJtL3JvY2tjaGlwOiBsdmRzOiBIZWxwZXJzIHNob3VsZCByZXR1cm4g
ZGVjZW50IHZhbHVlcwogIGRybS9yb2NrY2hpcDogbHZkczogUGFjayBmdW5jdGlvbnMgdG9nZXRo
ZXIKICBkcm0vcm9ja2NoaXA6IGx2ZHM6IEFkZCBQWDMwIHN1cHBvcnQKICBhcm02NDogZHRzOiBy
b2NrY2hpcDogQWRkIFBYMzAgQ1JUQ3MgZ3JhcGggTFZEUyBlbmRwb2ludHMKICBhcm02NDogZHRz
OiByb2NrY2hpcDogQWRkIFBYMzAgRFNJIERQSFkKICBhcm02NDogZHRzOiByb2NrY2hpcDogQWRk
IFBYMzAgTFZEUwoKIC4uLi9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLWx2ZHMudHh0ICAgICAg
ICB8ICAgNCArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3B4MzAuZHRzaSAgICAgICAg
fCAgNTggKysKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9sdmRzLmMgICAgICB8
IDUxNiArKysrKysrKysrKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9sdmRzLmggICAgICB8ICAxOSArLQogNCBmaWxlcyBjaGFuZ2VkLCA0NDEgaW5zZXJ0aW9ucygr
KSwgMTU2IGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
