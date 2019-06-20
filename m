Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5506E4D04F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 16:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD146E586;
	Thu, 20 Jun 2019 14:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82756E586
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 14:26:41 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hdy1P-00072A-Po; Thu, 20 Jun 2019 16:26:39 +0200
Message-ID: <1561040798.14349.20.camel@pengutronix.de>
Subject: [GIT PULL] drm/imx: ipu-v3 image converter fixes
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 20 Jun 2019 16:26:38 +0200
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKcGxlYXNlIGNvbnNpZGVyIG1lcmdpbmcgdGhlc2UgZml4ZXMgZm9y
IHY1LjIuCgpyZWdhcmRzClBoaWxpcHAKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21t
aXQgZDFmZGI2ZDhmNmE0MTA5YTQyNjMxNzZjODRiODk5MDc2YTVmODAwODoKCiAgTGludXggNS4y
LXJjNCAoMjAxOS0wNi0wOCAyMDoyNDo0NiAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQucGVuZ3V0cm9uaXguZGUvZ2l0L3B6YS9saW51
eC5naXQgdGFncy9pbXgtZHJtLWZpeGVzLTIwMTktMDYtMjAKCmZvciB5b3UgdG8gZmV0Y2ggY2hh
bmdlcyB1cCB0byA5MTJiYmY3ZTljYTQyMjA5OTkzNWRkNjlkM2ZmMGZkNjJkYjI0ODgyOgoKICBn
cHU6IGlwdS12MzogaW1hZ2UtY29udmVydDogRml4IGltYWdlIGRvd25zaXplIGNvZWZmaWNpZW50
cyAoMjAxOS0wNi0xNCAxNDowNjoxNiArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtL2lteDogaXB1LXYzIGlt
YWdlIGNvbnZlcnRlciBmaXhlcwoKVGhpcyBzZXJpZXMgZml4ZXMgaW5wdXQgYnVmZmVyIGFsaWdu
bWVudCBhbmQgZG93bnNpemVyIGNvbmZpZ3VyYXRpb24KdG8gYWRoZXJlIHRvIElQVSBtZW0ybWVt
IENTQy9zY2FsZXIgaGFyZHdhcmUgcmVzdHJpY3Rpb25zIGluIGNlcnRhaW4KZG93bnNjYWxpbmcg
cmF0aW9zLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpTdGV2ZSBMb25nZXJiZWFtICgzKToKICAgICAgZ3B1OiBpcHUtdjM6
IGltYWdlLWNvbnZlcnQ6IEZpeCBpbnB1dCBieXRlc3BlcmxpbmUgd2lkdGgvaGVpZ2h0IGFsaWdu
CiAgICAgIGdwdTogaXB1LXYzOiBpbWFnZS1jb252ZXJ0OiBGaXggaW5wdXQgYnl0ZXNwZXJsaW5l
IGZvciBwYWNrZWQgZm9ybWF0cwogICAgICBncHU6IGlwdS12MzogaW1hZ2UtY29udmVydDogRml4
IGltYWdlIGRvd25zaXplIGNvZWZmaWNpZW50cwoKIGRyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1h
Z2UtY29udmVydC5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
