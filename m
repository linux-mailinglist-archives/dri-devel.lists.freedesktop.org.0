Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9B7615E5
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A8989B0D;
	Sun,  7 Jul 2019 18:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477C689B05
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:25:55 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81C09CC;
 Sun,  7 Jul 2019 20:25:28 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/60] dt-bindings: Add legacy 'toppoly' vendor prefix
Date: Sun,  7 Jul 2019 21:18:54 +0300
Message-Id: <20190707181937.6250-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562523954;
 bh=zAOes8FySHTQv7tmZmjdSQN4VB42lZkYdDrm3pzmyro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y+ZUBSH4QFMso2TLZ32w5QaIXXQUwNRuDqDMwWHe1hh4Uwi7nCBiLFYFH5Vs6O937
 vGotevZBJZGiZEhAwgWMFACxko1rOymjrdeTWjWy10ttcCDqrL3lAqPXgXk4OyTXm5
 Vh+07NqEakBkHRsMNEjaaCg5da2C886e+OcRct1A=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICd0b3Bwb2x5JyB2ZW5kb3IgcHJlZml4IGlzIGluIHVzZSBhbmQgcmVmZXJzIHRvIFRQTywg
d2hvc2UgRFQgdmVuZG9yCnByZWZpeCBpcyBhbHJlYWR5IGRlZmluZWQgYXMgJ3RwbycuIEFkZCAn
dG9wcG9seScgYXMgYW4gYWx0ZXJuYXRpdmUgYW5kCmRvY3VtZW50IGl0IGFzIGxlZ2FjeS4KClNp
Z25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXBy
ZWZpeGVzLnlhbWwgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhl
cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhl
cy55YW1sCmluZGV4IDI1MTQ0NjNmMmM2My4uZDc4NTI3ZWI4MjU0IDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCkBA
IC04NjcsNiArODY3LDggQEAgcGF0dGVyblByb3BlcnRpZXM6CiAgICAgZGVzY3JpcHRpb246IFRl
Y29uIE1pY3JvcHJvY2Vzc29yIFRlY2hub2xvZ2llcywgTExDLgogICAiXnRvcGVldCwuKiI6CiAg
ICAgZGVzY3JpcHRpb246IFRvcGVldAorICAiXnRvcHBvbHksLioiOgorICAgIGRlc2NyaXB0aW9u
OiBUUE8gKGxlZ2FjeSBwcmVmaXgsIHNlZSAndHBvJykKICAgIl50b3JhZGV4LC4qIjoKICAgICBk
ZXNjcmlwdGlvbjogVG9yYWRleCBBRwogICAiXnRvc2hpYmEsLioiOgotLSAKUmVnYXJkcywKCkxh
dXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
