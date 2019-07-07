Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DB7615E3
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81AA89B03;
	Sun,  7 Jul 2019 18:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CE489B03
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:25:24 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7CB9CC;
 Sun,  7 Jul 2019 20:24:57 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/60] dt-bindings: Add vendor prefix for LG Display
Date: Sun,  7 Jul 2019 21:18:53 +0300
Message-Id: <20190707181937.6250-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562523923;
 bh=uh3oBzGSdr7HxrPeRizjQCfwuS3kpqGzJKVQUCnRDM0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SQIkCbDcHlhm/Or5Rm8uC2xCvshSfHPq5Vd0HOjcQr794cHLkC7QIYYS+wul2HkKn
 oOv4JA5E9dDlN4rZ6ZL7TA/gdxApYGXcXJ+nfoqtC8EyZ73/Awb0nOFObPRqtg/GIL
 ed9yRyJcNWnTGYMFlZE+5taVz+58QYgLKUiKqhdE=
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

TEcgRGlzcGxheSBpcyBhbiBMQ0QgZGlzcGxheSBtYW51ZmFjdHVyZXIuIE9yaWdpbmFsbHkgZm9y
bWVkIGFzIGEgam9pbnQKdmVudHVyZSBieSBMRyBFbGVjdHJvbmljcyBhbmQgUGhpbGlwcyBFbGVj
dHJvbmljcywgaXQgd2FzIGZvcm1lcmx5IGtub3duCmFzIExHLlBoaWxpcHMgTENELCBoZW5jZSB0
aGUgRFQgdmVuZG9yIHByZWZpeCBsZ3BoaWxpcHMgKHdoaWNoIGlzCmFscmVhZHkgaW4gYWN0aXZl
IHVzZSBpbiB0aGUga2VybmVsKS4KCk1vcmUgaW5mb3JtYXRpb24gaXMgYXZhaWxhYmxlIGF0Cmh0
dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0xHX0Rpc3BsYXkuCgpTaWduZWQtb2ZmLWJ5OiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQog
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIHwg
MiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAppbmRleCBm
MGJjZmYwMzNlY2MuLjI1MTQ0NjNmMmM2MyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbApAQCAtNDcxLDYgKzQ3MSw4
IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAgIGRlc2NyaXB0aW9uOiBMZW5vdm8gR3JvdXAgTHRk
LgogICAiXmxnLC4qIjoKICAgICBkZXNjcmlwdGlvbjogTEcgQ29ycG9yYXRpb24KKyAgIl5sZ3Bo
aWxpcHMsLioiOgorICAgIGRlc2NyaXB0aW9uOiBMRyBEaXNwbGF5CiAgICJebGlicmV0ZWNoLC4q
IjoKICAgICBkZXNjcmlwdGlvbjogU2hlbnpoZW4gTGlicmUgVGVjaG5vbG9neSBDby4sIEx0ZAog
ICAiXmxpY2hlZXBpLC4qIjoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
