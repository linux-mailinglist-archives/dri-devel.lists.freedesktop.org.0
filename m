Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 417271A98A
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 23:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E96189A34;
	Sat, 11 May 2019 21:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3A989A32
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 21:07:33 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CA112DF;
 Sat, 11 May 2019 23:07:31 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/10] drm: bridge: Add dual_link field to the
 drm_bridge_timings structure
Date: Sun, 12 May 2019 00:06:53 +0300
Message-Id: <20190511210702.18394-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1557608851;
 bh=dkxdefBzSC6dBOdXnPobIJWH8GAnrhNGaIKdvoVB834=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gyTPGgVCEjZDYk4y2a7u2c4Nn0exlVyz9DiQhl7ZTbKMydQK1pu/UVzkpTF9rKa4O
 18qSxovGQUlOoFC5sbMgHJuWPsda8gwCIoSQe5PZwQ8Qup9be5xkK50EYI4jaGpXcq
 8Zch2SN9jykuB9/NpRgkJ/Pyu2X3Pdt70NmvsI7Q=
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
aWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggfCA4ICsrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vZHJtX2JyaWRnZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCmluZGV4IGQ0NDI4
OTEzYTRlMS4uYWVhMWZjZmQ5MmE3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdl
LmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCkBAIC0yNjUsNiArMjY1LDE0IEBAIHN0
cnVjdCBkcm1fYnJpZGdlX3RpbWluZ3MgewogCSAqIGlucHV0IHNpZ25hbCBhZnRlciB0aGUgY2xv
Y2sgZWRnZS4KIAkgKi8KIAl1MzIgaG9sZF90aW1lX3BzOworCS8qKgorCSAqIEBkdWFsX2xpbms6
CisJICoKKwkgKiBUcnVlIGlmIHRoZSBidXMgb3BlcmF0ZXMgaW4gZHVhbC1saW5rIG1vZGUuIFRo
ZSBleGFjdCBtZWFuaW5nIGlzCisJICogZGVwZW5kZW50IG9uIHRoZSBidXMgdHlwZS4gRm9yIExW
RFMgYnVzZXMsIHRoaXMgaW5kaWNhdGVzIHRoYXQgZXZlbi0KKwkgKiBhbmQgb2RkLW51bWJlcmVk
IHBpeGVscyBhcmUgcmVjZWl2ZWQgb24gc2VwYXJhdGUgbGlua3MuCisJICovCisJYm9vbCBkdWFs
X2xpbms7CiB9OwogCiAvKioKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
