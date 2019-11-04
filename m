Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E21AEDA2F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 08:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402626E15F;
	Mon,  4 Nov 2019 07:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4192C6E124
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 01:40:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C183AB233;
 Mon,  4 Nov 2019 01:40:27 +0000 (UTC)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: linux-realtek-soc@lists.infradead.org
Subject: [RFC 6/7] dt-bindings: gpu: mali-utgard: Add Realtek RTD1395
Date: Mon,  4 Nov 2019 02:39:31 +0100
Message-Id: <20191104013932.22505-7-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191104013932.22505-1-afaerber@suse.de>
References: <20191104013932.22505-1-afaerber@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2019 07:54:21 +0000
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVmaW5lIGNvbXBhdGlibGUgc3RyaW5ncyBmb3IgTWFsaS00NzAgYW5kIFJlYWx0ZWsgUlREMTM5
NSBTb0MgZmFtaWx5LgoKU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBz
dXNlLmRlPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1h
bGktdXRnYXJkLnlhbWwgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxt
YWxpLXV0Z2FyZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9h
cm0sbWFsaS11dGdhcmQueWFtbAppbmRleCBiMDFiOTVjZjVjZGYuLjYyZDVkMzYwM2M1ZCAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS11
dGdhcmQueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2Fy
bSxtYWxpLXV0Z2FyZC55YW1sCkBAIC00NCw2ICs0NCwxMCBAQCBwcm9wZXJ0aWVzOgogICAgICAg
ICAgICAgICAtIGhpc2lsaWNvbixoaTYyMjAtbWFsaQogICAgICAgICAgICAgICAtIHJvY2tjaGlw
LHJrMzMyOC1tYWxpCiAgICAgICAgICAgLSBjb25zdDogYXJtLG1hbGktNDUwCisgICAgICAtIGl0
ZW1zOgorICAgICAgICAgIC0gZW51bToKKyAgICAgICAgICAgICAgLSByZWFsdGVrLHJ0ZDEzOTUt
bWFsaQorICAgICAgICAgIC0gY29uc3Q6IGFybSxtYWxpLTQ3MAogCiAgICAgICAjICJhcm0sbWFs
aS0zMDAiCiAKLS0gCjIuMTYuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
