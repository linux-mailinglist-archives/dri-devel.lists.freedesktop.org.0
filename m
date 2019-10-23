Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96120E1FD3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BA16EB28;
	Wed, 23 Oct 2019 15:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF7A8959D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:45:33 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DD2A328F977;
 Wed, 23 Oct 2019 16:45:31 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 17/21] dt-bindings: display: bridge: lvds-transmitter: Add
 new props
Date: Wed, 23 Oct 2019 17:45:08 +0200
Message-Id: <20191023154512.9762-18-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
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
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBkYXRhLW1hcHBpbmcgcHJvcGVydHkgdG8gZGVzY3JpYmUgdGhlIG91dHB1dCBidXMg
Zm9ybWF0IGFuZAp0aGUgYnVzLXdpZHRoIHByb3BlcnR5IHRvIGRlc2NyaWJlIHRoZSBpbnB1dCBi
dXMgZm9ybWF0LgoKU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AY29sbGFib3JhLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjM6CiogTmV3IHBhdGNoCi0tLQogLi4u
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIudHh0ICAgIHwgMTMgKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10
cmFuc21pdHRlci50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50eHQKaW5kZXggNjAwOTFkYjVkZmE1Li43YjQzYjZm
MjAyNzkgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50eHQKQEAgLTM2
LDYgKzM2LDE5IEBAIGdyYXBoIGJpbmRpbmdzIHNwZWNpZmllZCBpbiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZ3JhcGgudHh0LgogLSBWaWRlbyBwb3J0IDAgZm9yIHBhcmFsbGVs
IGlucHV0CiAtIFZpZGVvIHBvcnQgMSBmb3IgTFZEUyBvdXRwdXQKIAorT3B0aW9uYWwgcG9ydCAw
IG5vZGUgcHJvcGVydGllczoKKworLSBidXMtd2lkdGg6IG51bWJlciBvZiBkYXRhIGxpbmVzIHVz
ZSB0byB0cmFuc21pdCB0aGUgUkdCIGRhdGEuCisJICAgICBDYW4gYmUgMTggb3IgMjQuCisKK09w
dGlvbmFsIHBvcnQgMSBub2RlIHByb3BlcnRpZXM6CisKKy0gZGF0YS1tYXBwaW5nOiBzZWUgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbHZkcy55YW1sCisJ
CWZvciBtb3JlIGRldGFpbHMgYWJvdXQgdGhpcyBMVkRTIGRhdGEtbWFwcGluZyBwcm9wZXJ0eS4K
KwkJU3VwcG9ydGVkIHZhbHVlczoKKwkJImplaWRhLTE4IgorCQkiamVpZGEtMjQiCisJCSJ2ZXNh
LTI0IgogCiBFeGFtcGxlCiAtLS0tLS0tCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
