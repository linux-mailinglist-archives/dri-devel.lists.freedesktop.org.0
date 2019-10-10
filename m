Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C2CD318B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 21:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC656E3DB;
	Thu, 10 Oct 2019 19:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144D96E3DB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 19:44:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id DB451286280
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/3] RK3288 Gamma LUT
Date: Thu, 10 Oct 2019 16:43:48 -0300
Message-Id: <20191010194351.17940-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmV3IGl0ZXJhdGlvbiwgc2VlbXMgdGhhdCB3ZSBhcmUgZmluYWxseSBjb252ZXJnaW5nLgoKRm9y
IHRoaXMgdjUsIHdlIGFyZSBvbmx5IGRvaW5nIHNvbWUgY2hhbmdlcyBvbgp0aGUgZ2FtbWFfc2V0
IGltcGxlbWVudGF0aW9uLiBBcyBhIHJlc3VsdCwgdGhlIGNvZGUKaXMgbW9yZSByZWFkYWJsZS4g
U2VlIHRoZSBjaGFuZ2Vsb2cgaW4gcGF0Y2ggMiBmb3IgbW9yZQppbmZvcm1hdGlvbi4KClRoYW5r
cyEKCkV6ZXF1aWVsIEdhcmNpYSAoMyk6CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJvY2tjaGlw
OiBkb2N1bWVudCBWT1AgZ2FtbWEgTFVUIGFkZHJlc3MKICBkcm0vcm9ja2NoaXA6IEFkZCBvcHRp
b25hbCBzdXBwb3J0IGZvciBDUlRDIGdhbW1hIExVVAogIEFSTTogZHRzOiByb2NrY2hpcDogQWRk
IFJLMzI4OCBWT1AgZ2FtbWEgTFVUIGFkZHJlc3MKCiAuLi4vZGlzcGxheS9yb2NrY2hpcC9yb2Nr
Y2hpcC12b3AudHh0ICAgICAgICAgfCAgIDYgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC5k
dHNpICAgICAgICAgICAgICAgICB8ICAgNCArLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jv
Y2tjaGlwX2RybV92b3AuYyAgIHwgMTIwICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuaCAgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF92b3BfcmVnLmMgICB8ICAgMiArCiA1IGZpbGVzIGNoYW5nZWQs
IDEzMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKLS0gCjIuMjIuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
