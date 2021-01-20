Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1258E2FD68B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 18:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97626E3D8;
	Wed, 20 Jan 2021 17:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7C66E3D8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 17:10:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 0EE6D8015D;
 Wed, 20 Jan 2021 18:00:53 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/3] drm/uapi: Add USB connector type
Date: Wed, 20 Jan 2021 18:00:31 +0100
Message-Id: <20210120170033.38468-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210120170033.38468-1-noralf@tronnes.org>
References: <20210120170033.38468-1-noralf@tronnes.org>
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=LfoSFAXi c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=DG4e56V3FeCVKFaCFEkA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, peter@stuge.se
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgY29ubmVjdG9yIHR5cGUgZm9yIFVTQiBjb25uZWN0ZWQgZGlzcGxheSBwYW5lbHMuCgpT
aWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBp
bmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCBiL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX21vZGUuaAppbmRleCBmZWQ2NmEwM2M3YWUuLjMzMDI0Y2M1ZDI2ZSAx
MDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCisrKyBiL2luY2x1ZGUvdWFw
aS9kcm0vZHJtX21vZGUuaApAQCAtMzY3LDYgKzM2Nyw3IEBAIGVudW0gZHJtX21vZGVfc3ViY29u
bmVjdG9yIHsKICNkZWZpbmUgRFJNX01PREVfQ09OTkVDVE9SX0RQSQkJMTcKICNkZWZpbmUgRFJN
X01PREVfQ09OTkVDVE9SX1dSSVRFQkFDSwkxOAogI2RlZmluZSBEUk1fTU9ERV9DT05ORUNUT1Jf
U1BJCQkxOQorI2RlZmluZSBEUk1fTU9ERV9DT05ORUNUT1JfVVNCCQkyMAogCiAvKioKICAqIHN0
cnVjdCBkcm1fbW9kZV9nZXRfY29ubmVjdG9yIC0gR2V0IGNvbm5lY3RvciBtZXRhZGF0YS4KLS0g
CjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
