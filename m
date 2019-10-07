Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C9DCEA2B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047896E614;
	Mon,  7 Oct 2019 17:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8B36E61D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:08:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08699E40;
 Mon,  7 Oct 2019 19:08:19 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/panel: tpo-td043mtea1: Fix SPI alias
Date: Mon,  7 Oct 2019 20:08:01 +0300
Message-Id: <20191007170801.27647-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570468102;
 bh=y+5LC6ALwE7C5KN97dMk1v9hgK4eMNd42J/ODWDDExE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cR3aLHfRP23QXhKxLbyz6+JmRWHic0RpAOtP3w4xHfaA6dWqjdqctUp6PQeeDqjey
 NiouJxyCRDIF4zuHMzFxn7RyheLuZdQk8s4T4Cc1EUbMTSazSSENOTIFbI6UAOUcMd
 0rZJENaepJaIUNFKvVWgoXny+jEih3TfcooiZ4M0=
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
Cc: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, thierry.reding@gmail.com,
 letux-kernel@openphoenux.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhbmVsLXRwby10ZDA0M210ZWExIGRyaXZlciBpbmNvcnJlY3RseSBpbmNsdWRlcyB0aGUg
T0YgdmVuZG9yCnByZWZpeCBpbiBpdHMgU1BJIGFsaWFzLiBGaXggaXQsIGFuZCBtb3ZlIHRoZSBt
YW51YWwgYWxpYXMgdG8gYW4gU1BJCm1vZHVsZSBkZXZpY2UgdGFibGUuCgpGaXhlczogZGMyZTFl
NWIyNzk5ICgiZHJtL3BhbmVsOiBBZGQgZHJpdmVyIGZvciB0aGUgVG9wcG9seSBURDA0M01URUEx
IHBhbmVsIikKUmVwb3J0ZWQtYnk6IEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNv
LmNvbT4KU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQw
NDNtdGVhMS5jIHwgOSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
dHBvLXRkMDQzbXRlYTEuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQwNDNt
dGVhMS5jCmluZGV4IDg0MzcwNTYyOTEwZi4uYmExNjNjNzc5MDg0IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDQzbXRlYTEuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDQzbXRlYTEuYwpAQCAtNDkxLDkgKzQ5MSwxNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB0ZDA0M210ZWExX29mX21hdGNoW10gPSB7
CiAKIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHRkMDQzbXRlYTFfb2ZfbWF0Y2gpOwogCitzdGF0
aWMgY29uc3Qgc3RydWN0IHNwaV9kZXZpY2VfaWQgdGQwNDNtdGVhMV9pZHNbXSA9IHsKKwl7ICJ0
ZDA0M210ZWExIiwgMCB9LAorCXsgLyogc2VudGluZWwgKi8gfQorfTsKKworTU9EVUxFX0RFVklD
RV9UQUJMRShzcGksIHRkMDQzbXRlYTFfaWRzKTsKKwogc3RhdGljIHN0cnVjdCBzcGlfZHJpdmVy
IHRkMDQzbXRlYTFfZHJpdmVyID0gewogCS5wcm9iZQkJPSB0ZDA0M210ZWExX3Byb2JlLAogCS5y
ZW1vdmUJCT0gdGQwNDNtdGVhMV9yZW1vdmUsCisJLmlkX3RhYmxlCT0gdGQwNDNtdGVhMV9pZHMs
CiAJLmRyaXZlcgkJPSB7CiAJCS5uYW1lCT0gInBhbmVsLXRwby10ZDA0M210ZWExIiwKIAkJLnBt
CT0gJnRkMDQzbXRlYTFfcG1fb3BzLApAQCAtNTAzLDcgKzUxMSw2IEBAIHN0YXRpYyBzdHJ1Y3Qg
c3BpX2RyaXZlciB0ZDA0M210ZWExX2RyaXZlciA9IHsKIAogbW9kdWxlX3NwaV9kcml2ZXIodGQw
NDNtdGVhMV9kcml2ZXIpOwogCi1NT0RVTEVfQUxJQVMoInNwaTp0cG8sdGQwNDNtdGVhMSIpOwog
TU9EVUxFX0FVVEhPUigiR3Jhxb52eWRhcyBJZ25vdGFzIDxub3Rhc2FzQGdtYWlsLmNvbT4iKTsK
IE1PRFVMRV9ERVNDUklQVElPTigiVFBPIFREMDQzTVRFQTEgUGFuZWwgRHJpdmVyIik7CiBNT0RV
TEVfTElDRU5TRSgiR1BMIik7Ci0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
