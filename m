Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ACE64034
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 07:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E428933D;
	Wed, 10 Jul 2019 05:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0101.hostedemail.com
 [216.40.44.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF00F8933C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 05:04:36 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 2D69B181D3403;
 Wed, 10 Jul 2019 05:04:33 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:541:973:982:988:989:1260:1345:1437:1534:1541:1711:1730:1747:1777:1792:1801:2198:2199:2393:2559:2562:2731:3138:3139:3140:3141:3142:3352:3865:3866:3867:3868:4250:4605:5007:6261:6737:10004:10848:11026:11658:11914:12043:12048:12297:12679:12895:13069:13161:13229:13311:13357:14096:14181:14384:14394:14581:14721:21080:21220:21451:21627:30054,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:26,
 LUA_SUMMARY:none
X-HE-Tag: help91_a3a1c1ec484c
X-Filterd-Recvd-Size: 2833
Received: from joe-laptop.perches.com (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Wed, 10 Jul 2019 05:04:30 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-wireless@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 00/12] treewide: Fix GENMASK misuses
Date: Tue,  9 Jul 2019 22:04:13 -0700
Message-Id: <cover.1562734889.git.joe@perches.com>
X-Mailer: git-send-email 2.15.0
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
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org,
 alsa-devel@alsa-project.org, linux-mmc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgR0VOTUFTSyB1c2VzIGFyZSBpbnZlcnRlZCBhcmd1bWVudCBvcmRlciBhbmQgdGhlCmFj
dHVhbCBtYXNrcyBwcm9kdWNlZCBhcmUgaW5jb3JyZWN0LiAgRml4IHRoZW0uCgpBZGQgY2hlY2tw
YXRjaCB0ZXN0cyB0byBoZWxwIGF2b2lkIG1vcmUgbWlzdXNlcyB0b28uCgpKb2UgUGVyY2hlcyAo
MTIpOgogIGNoZWNrcGF0Y2g6IEFkZCBHRU5NQVNLIHRlc3RzCiAgY2xvY2tzb3VyY2UvZHJpdmVy
cy9ucGNtOiBGaXggbWlzdXNlIG9mIEdFTk1BU0sgbWFjcm8KICBkcm06IGFzcGVlZF9nZng6IEZp
eCBtaXN1c2Ugb2YgR0VOTUFTSyBtYWNybwogIGlpbzogYWRjOiBtYXg5NjExOiBGaXggbWlzdXNl
IG9mIEdFTk1BU0sgbWFjcm8KICBpcnFjaGlwL2dpYy12My1pdHM6IEZpeCBtaXN1c2Ugb2YgR0VO
TUFTSyBtYWNybwogIG1tYzogbWVzb24tbXgtc2RpbzogRml4IG1pc3VzZSBvZiBHRU5NQVNLIG1h
Y3JvCiAgbmV0OiBldGhlcm5ldDogbWVkaWF0ZWs6IEZpeCBtaXN1c2VzIG9mIEdFTk1BU0sgbWFj
cm8KICBuZXQ6IHN0bW1hYzogRml4IG1pc3VzZXMgb2YgR0VOTUFTSyBtYWNybwogIHJ0dzg4OiBG
aXggbWlzdXNlIG9mIEdFTk1BU0sgbWFjcm8KICBwaHk6IGFtbG9naWM6IEcxMkE6IEZpeCBtaXN1
c2Ugb2YgR0VOTUFTSyBtYWNybwogIHN0YWdpbmc6IG1lZGlhOiBjZWRydXM6IEZpeCBtaXN1c2Ug
b2YgR0VOTUFTSyBtYWNybwogIEFTb0M6IHdjZDkzMzU6IEZpeCBtaXN1c2Ugb2YgR0VOTUFTSyBt
YWNybwoKIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItbnBjbTd4eC5jICAgICAgICAgICAgICAg
fCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9hc3BlZWRfZ2Z4LmggICAgICAgICAgICAg
ICB8ICAyICstCiBkcml2ZXJzL2lpby9hZGMvbWF4OTYxMS5jICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KIGRyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXYzLWl0cy5jICAgICAgICAgICAg
ICAgICAgfCAgMiArLQogZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1teC1zZGlvLmMgICAgICAgICAg
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3Nv
Yy5oICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19zZ21p
aS5jICAgICAgICAgfCAgMiArLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZGVzY3MuaCAgICAgICB8ICAyICstCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYy1zdW44aS5jIHwgIDQgKystLQogZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9y
dHc4OC9ydHc4ODIyYi5jICAgICB8ICAyICstCiBkcml2ZXJzL3BoeS9hbWxvZ2ljL3BoeS1tZXNv
bi1nMTJhLXVzYjIuYyAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdW54
aS9jZWRydXMvY2VkcnVzX3JlZ3MuaCAgfCAgMiArLQogc2NyaXB0cy9jaGVja3BhdGNoLnBsICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysrKysrKysrKwogc291bmQvc29j
L2NvZGVjcy93Y2QtY2xzaC12Mi5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAxNCBmaWxl
cyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCi0tIAoyLjE1LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
