Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FB92DB92
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281ED6E0C0;
	Wed, 29 May 2019 11:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0296E0C0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 11:19:01 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hVwbj-0005Lr-Fv; Wed, 29 May 2019 13:18:59 +0200
Message-ID: <1559128738.3651.4.camel@pengutronix.de>
Subject: [GIT PULL] drm/imx: fix frame rate regression on non-plus i.MX6Q
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 29 May 2019 13:18:58 +0200
X-Mailer: Evolution 3.22.6-1+deb9u1 
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
aXQgY2Q2Yzg0ZDhmMGNkYzkxMWRmNDM1YmIwNzViYTIyY2UzYzYwNWIwNzoKCiAgTGludXggNS4y
LXJjMiAoMjAxOS0wNS0yNiAxNjo0OToxOSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQucGVuZ3V0cm9uaXguZGUvZ2l0L3B6YS9saW51
eCB0YWdzL2lteC1kcm0tZml4ZXMtMjAxOS0wNS0yOQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIDEzN2NhYTcwMmYyMzA4ZjdlZjAzODc2ZTE2NGIwZDBmMzMwMDcxMmE6CgogIGRybS9p
bXg6IGlwdXYzLXBsYW5lOiBmaXggYXRvbWljIHVwZGF0ZSBzdGF0dXMgcXVlcnkgZm9yIG5vbi1w
bHVzIGkuTVg2USAoMjAxOS0wNS0yNyAxNToxMzo1NyArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtL2lteDog
aXB1djMtcGxhbmU6IGZpeCBmcmFtZSByYXRlIHJlZ3Jlc3Npb24gb24gbm9uLXBsdXMgaS5NWDZR
CgpGaXggYSByZWdyZXNzaW9uIGludHJvZHVjZWQgYnkgNzBlOGEwYzcxZTkgKCJkcm0vaW14OiBp
cHV2My1wbGFuZTogYWRkCmZ1bmN0aW9uIHRvIHF1ZXJ5IGF0b21pYyB1cGRhdGUgc3RhdHVzIikg
dGhhdCBoYWx2ZXMgdGhlIGZyYW1lIHJhdGUgb24Kbm9uLXBsdXMgaS5NWDZRLCBiZWNhdXNlIHRo
ZSBwZW5kaW5nIGNoZWNrIGFsd2F5cyByZXR1cm5zICJwZW5kaW5nIgpldmVuIGlmIGFuIHVwZGF0
ZSBpcyBhY3R1YWxseSBhcHBsaWVkLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQaGlsaXBwIFphYmVsICgxKToKICAgICAg
ZHJtL2lteDogaXB1djMtcGxhbmU6IGZpeCBhdG9taWMgdXBkYXRlIHN0YXR1cyBxdWVyeSBmb3Ig
bm9uLXBsdXMgaS5NWDZRCgogZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5jIHwgMTMg
KysrKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5oIHwgIDEgLQog
MiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
