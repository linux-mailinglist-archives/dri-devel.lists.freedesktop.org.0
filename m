Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF772C86C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 16:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4261389E1B;
	Tue, 28 May 2019 14:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A3789E1B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 14:13:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi
 [85.76.65.42])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77279FA6;
 Tue, 28 May 2019 16:13:06 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/10] drm: bridge: Add dual_link field to the
 drm_bridge_timings structure
Date: Tue, 28 May 2019 17:12:25 +0300
Message-Id: <20190528141234.15425-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559052788;
 bh=gdwwwY0o+j1PkvsYn2D5j46gEyj2s+UToAhQ0HADWtA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g7pWjWob3wqU74ZUFG5OQLtYmOamO0a4cqtHyelel7teL3MVmIdH7jd0uyngW2cv0
 VgoKjQt/gjkvhWQom+vNrdLQjycW6kP+EMtkSda1z3wl1BJK0l95ncGDgYISCuk77z
 AwWV664/+Ta4HOHnBcRLTozFzubYkmvrgr4sxNTc=
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXh0ZW5kIHRoZSBkcm1fYnJpZGdlX3RpbWluZ3Mgc3RydWN0dXJlIHdpdGggYSBuZXcgZHVhbF9s
aW5rIGZpZWxkIHRvCmluZGljYXRlIHRoYXQgdGhlIGJyaWRnZSdzIGlucHV0IGJ1cyBjYXJyaWVz
IGRhdGEgb24gdHdvIHNlcGFyYXRlCnBoeXNpY2FsIGxpbmtzLiBUaGUgZmlyc3QgdXNlIGNhc2Ug
aXMgTFZEUyBkdWFsLWxpbmsgbW9kZSB3aGVyZSBldmVuLQphbmQgb2RkLW51bWJlcmVkIHBpeGVs
cyBhcmUgdHJhbnNmZXJyZWQgb24gc2VwYXJhdGUgTFZEUyBsaW5rcy4KClNpZ25lZC1vZmYtYnk6
IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQu
Y29tPgpSZXZpZXdlZC1ieTogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNA
aWRlYXNvbmJvYXJkLmNvbT4KVGVzdGVkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2Fz
QGptb25kaS5vcmc+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIHwgOCArKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9icmlkZ2UuaCBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAppbmRleCBkNDQyODkxM2E0
ZTEuLmFlYTFmY2ZkOTJhNyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCisr
KyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaApAQCAtMjY1LDYgKzI2NSwxNCBAQCBzdHJ1Y3Qg
ZHJtX2JyaWRnZV90aW1pbmdzIHsKIAkgKiBpbnB1dCBzaWduYWwgYWZ0ZXIgdGhlIGNsb2NrIGVk
Z2UuCiAJICovCiAJdTMyIGhvbGRfdGltZV9wczsKKwkvKioKKwkgKiBAZHVhbF9saW5rOgorCSAq
CisJICogVHJ1ZSBpZiB0aGUgYnVzIG9wZXJhdGVzIGluIGR1YWwtbGluayBtb2RlLiBUaGUgZXhh
Y3QgbWVhbmluZyBpcworCSAqIGRlcGVuZGVudCBvbiB0aGUgYnVzIHR5cGUuIEZvciBMVkRTIGJ1
c2VzLCB0aGlzIGluZGljYXRlcyB0aGF0IGV2ZW4tCisJICogYW5kIG9kZC1udW1iZXJlZCBwaXhl
bHMgYXJlIHJlY2VpdmVkIG9uIHNlcGFyYXRlIGxpbmtzLgorCSAqLworCWJvb2wgZHVhbF9saW5r
OwogfTsKIAogLyoqCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
