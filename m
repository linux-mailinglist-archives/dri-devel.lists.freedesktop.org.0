Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D06712B442
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E58E89CF5;
	Mon, 27 May 2019 12:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCB289F6E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 20:08:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id A11B62804FB
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv6 1/4] drm/omap: use DRM_DEBUG_DRIVER instead of CORE
Date: Thu, 23 May 2019 22:07:53 +0200
Message-Id: <20190523200756.25314-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523200756.25314-1-sebastian.reichel@collabora.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtYWNybyBpcyBvbmx5IHVzZWQgYnkgb21hcGRybSwgd2hpY2ggc2hvdWxkIHByaW50CmRl
YnVnIG1lc3NhZ2VzIHVzaW5nIHRoZSBEUklWRVIgY2F0ZWdvcnkgaW5zdGVhZCBvZiB0aGUKZGVm
YXVsdCBDT1JFIGNhdGVnb3J5LgoKQWNrZWQtYnk6IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6
PgpUZXN0ZWQtYnk6IFRvbnkgTGluZGdyZW4gPHRvbnlAYXRvbWlkZS5jb20+ClRlc3RlZC1ieTog
UGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+ClNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBSZWlj
aGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL29tYXBfZHJ2LmggfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vb21hcF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmgKaW5kZXgg
M2NjYTQ1Y2IyNWYzLi44OTZhYTEyZjA5YjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL29tYXBfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYu
aApAQCAtMzcsOCArMzcsOCBAQAogI2luY2x1ZGUgIm9tYXBfaXJxLmgiCiAjaW5jbHVkZSAib21h
cF9wbGFuZS5oIgogCi0jZGVmaW5lIERCRyhmbXQsIC4uLikgRFJNX0RFQlVHKGZtdCJcbiIsICMj
X19WQV9BUkdTX18pCi0jZGVmaW5lIFZFUkIoZm10LCAuLi4pIGlmICgwKSBEUk1fREVCVUcoZm10
LCAjI19fVkFfQVJHU19fKSAvKiB2ZXJib3NlIGRlYnVnICovCisjZGVmaW5lIERCRyhmbXQsIC4u
LikgRFJNX0RFQlVHX0RSSVZFUihmbXQiXG4iLCAjI19fVkFfQVJHU19fKQorI2RlZmluZSBWRVJC
KGZtdCwgLi4uKSBpZiAoMCkgRFJNX0RFQlVHX0RSSVZFUihmbXQsICMjX19WQV9BUkdTX18pIC8q
IHZlcmJvc2UgZGVidWcgKi8KIAogI2RlZmluZSBNT0RVTEVfTkFNRSAgICAgIm9tYXBkcm0iCiAK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
