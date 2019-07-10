Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E371B64035
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 07:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1742789415;
	Wed, 10 Jul 2019 05:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0099.hostedemail.com
 [216.40.44.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBA689415
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 05:04:40 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 25A6A18224D98;
 Wed, 10 Jul 2019 05:04:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::::::,
 RULES_HIT:41:355:379:541:800:960:973:988:989:1260:1345:1359:1437:1534:1539:1568:1711:1714:1730:1747:1777:1792:2198:2199:2393:2559:2562:3138:3139:3140:3141:3142:3867:4321:5007:6261:6642:10004:10848:11026:11473:11657:11658:11914:12043:12296:12297:12438:12555:12895:12986:13069:13311:13357:14096:14181:14384:14394:14721:21080:21451:21627:30054,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:23,
 LUA_SUMMARY:none
X-HE-Tag: low85_b4e0cac78b5d
X-Filterd-Recvd-Size: 1713
Received: from joe-laptop.perches.com (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Wed, 10 Jul 2019 05:04:37 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 03/12] drm: aspeed_gfx: Fix misuse of GENMASK macro
Date: Tue,  9 Jul 2019 22:04:16 -0700
Message-Id: <cddd7ad7e9f81dec1e86c106f04229d21fc21920.1562734889.git.joe@perches.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1562734889.git.joe@perches.com>
References: <cover.1562734889.git.joe@perches.com>
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXJndW1lbnRzIGFyZSBzdXBwb3NlZCB0byBiZSBvcmRlcmVkIGhpZ2ggdGhlbiBsb3cuCgpTaWdu
ZWQtb2ZmLWJ5OiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hc3BlZWQvYXNwZWVkX2dmeC5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzcGVl
ZC9hc3BlZWRfZ2Z4LmggYi9kcml2ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnguaAppbmRl
eCBhMTAzNThiYjYxZWMuLjA5NWVhMDNlNTgzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FzcGVlZC9hc3BlZWRfZ2Z4LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9hc3BlZWRf
Z2Z4LmgKQEAgLTc0LDcgKzc0LDcgQEAgaW50IGFzcGVlZF9nZnhfY3JlYXRlX291dHB1dChzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtKTsKIC8qIENUUkwyICovCiAjZGVmaW5lIENSVF9DVFJMX0RBQ19F
TgkJCUJJVCgwKQogI2RlZmluZSBDUlRfQ1RSTF9WQkxBTktfTElORSh4KQkJKCgoeCkgPDwgMjAp
ICYgQ1JUX0NUUkxfVkJMQU5LX0xJTkVfTUFTSykKLSNkZWZpbmUgQ1JUX0NUUkxfVkJMQU5LX0xJ
TkVfTUFTSwlHRU5NQVNLKDIwLCAzMSkKKyNkZWZpbmUgQ1JUX0NUUkxfVkJMQU5LX0xJTkVfTUFT
SwlHRU5NQVNLKDMxLCAyMCkKIAogLyogQ1JUX0hPUklaMCAqLwogI2RlZmluZSBDUlRfSF9UT1RB
TCh4KQkJCSh4KQotLSAKMi4xNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
