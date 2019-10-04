Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BC5CCB39
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C64D6E39C;
	Sat,  5 Oct 2019 16:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C616EC1D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 19:09:50 +0000 (UTC)
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82tdd3x2KJk="
X-RZG-CLASS-ID: mo00
Received: from groucho.site by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
 with ESMTPSA id i07086v94J9CcdX
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Fri, 4 Oct 2019 21:09:12 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 jitao.shi@mediatek.com
Subject: [PATCH v19 0/2] PS8640 MIPI-to-eDP bridge
Date: Fri,  4 Oct 2019 21:09:06 +0200
Message-Id: <1570216148-22802-1-git-send-email-uli@fpond.eu>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1570216188; 
 s=strato-dkim-0002; d=fpond.eu;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=SjiSGCIWBrQ4el6i3TeHk1y7oyyLScjPosF/2NTani8=;
 b=q4Y6oxnu40iqOJYCpUw+gCnFk/h6TDWhs9D4DCWMBOW8HlsPFfdY16jjY5XII2lBrt
 aYu6xHl7rap2MaN9vciDpIRzwPM4I0AY31wDnbKlwW30zG9/4IW9uj48mC0cZPyFQLuM
 7YxA6Ow7/uGiT9QQjj++hNX+VK+6d+t/elMuuP2E+KlKkOTADmtcR4rTgQsDclEMAqc/
 dl6QbFcQEroF18QI1HSNR7D4A4Zt9AVUMVtd/z6sIyN7SJpJWwGY98/V4YnAMzKFezAh
 JFFWv+wkveow2S2BOqDZZPiYxGByctGgTE38CSONNuz4jn7tV6IyxbbTZic7RoPAtojC
 k9qQ==
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
Cc: mark.rutland@arm.com, Ulrich Hecht <uli@fpond.eu>, stonea168@163.com,
 ajaykumar.rs@samsung.com, architt@codeaurora.org, vpalatin@chromium.org,
 cawa.cheng@mediatek.com, yingjoe.chen@mediatek.com, devicetree@vger.kernel.org,
 pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org,
 seanpaul@chromium.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com,
 rahul.sharma@samsung.com, kernel@pengutronix.de, galak@codeaurora.org,
 enric.balletbo@collabora.com, andy.yan@rock-chips.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpUaGlzIGRyaXZlciBzZWVtcyB0byBoYXZlIGZhbGxlbiBieSB0aGUgd2F5c2lkZSBiZWNh
dXNlLCB3aGlsZSBvdGhlcndpc2UKZmluZSwgaXQgaGFzIGEgZmlybXdhcmUgdXBkYXRlIGZlYXR1
cmUgdGhhdCByZXF1aXJlcyBhIGJsb2IgdGhhdCBpcyBub3QgaW4KdGhlIGxpbnV4LWZpcm13YXJl
IHJlcG8uWzFdCgpXaGF0ZXZlciB0aGUgY2F1c2UgZm9yIHRoYXQgbWF5IGJlLCB0aGUgdXBkYXRl
IGNvZGUgaXMgZW50aXJlbHkgb3B0aW9uYWwKKG15IGNoaXAgd29ya3MgZmluZSB3aXRoIHdoYXRl
dmVyIGZpcm13YXJlIGlzIGN1cnJlbnRseSBpbnN0YWxsZWQpLCBzbyBJCmhhdmUgcmVtb3ZlZCBp
dCBpbiBvcmRlciB0byBnZXQgdGhpcyBtZXJnZWQgYWZ0ZXIgYWxsLiBJIGhhdmUgYWxzbwpmb2xs
b3dlZCB2YXJpb3VzIHRyaXZpYWwgQVBJIGNoYW5nZXMgdGhhdCBoYXZlIHBpbGVkIHVwIHNpbmNl
IDIwMTY7IHNlZQp0aGUgaW5kaXZpZHVhbCBwYXRjaGVzIGZvciBkZXRhaWxzLgoKSSdtIHVzaW5n
IHRoaXMgZHJpdmVyIG9uIGFuIEFjZXIgQ2hyb21lYm9vayBSMTMgKCJFbG0iKTsgc2VlCmh0dHBz
Oi8vZ2l0aHViLmNvbS91bGkva2VybmVsL3RyZWUvZWxtLXdvcmtpbmctNS40LgoKQ1UKVWxpCgpb
MV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85NDI3NTQzLwoKSml0YW8gU2hp
ICgyKToKICBEb2N1bWVudGF0aW9uOiBicmlkZ2U6IEFkZCBkb2N1bWVudGF0aW9uIGZvciBwczg2
NDAgRFQgcHJvcGVydGllcwogIGRybS9icmlkZ2U6IEFkZCBJMkMgYmFzZWQgZHJpdmVyIGZvciBw
czg2NDAgYnJpZGdlCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcHM4
NjQwLnR4dCAgfCAgNDQgKysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgIHwgIDEyICsKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFyYWRlLXBz
ODY0MC5jICAgICAgICAgICAgIHwgNjcyICsrKysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBj
aGFuZ2VkLCA3MjkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9wczg2NDAudHh0CiBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYXJhZGUtcHM4NjQwLmMKCi0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
