Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FA5BD981
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 10:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C16389BF0;
	Wed, 25 Sep 2019 08:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8896589BF0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 08:06:57 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.42])
 by regular1.263xmail.com (Postfix) with ESMTP id 3BD3A24E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 16:06:53 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P2645T139744972404480S1569398812082049_; 
 Wed, 25 Sep 2019 16:06:53 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <b0789af6682fc1d75052c3e8dc338cef>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Add some yuv 10bit support
Date: Wed, 25 Sep 2019 16:06:37 +0800
Message-Id: <1569398801-92201-1-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Ayan.Halder@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2Ugc2VyaWVzIHBhdGNoZXMgaXMgdG8gYWRkIHNvbWUgbmV3IGZvcm1hdCBzdXBwb3J0ZWQg
Ynkgc29tZSByb2NrY2hpcApzb2NzLCBpbmNsdWRlOgogICAgUkszMjg4L1JLMzIyOC9SSzMzMjgv
UkszMzY4L1JLMzM5OQoKdGhlc2UgbmV3IGZvcm1hdCBsYXlvdXQgYXMgZm9sbG93aW5nIHJ1bGU6
CiAgICAyIHBsYW5lIFlDYkNyIDEwYml0CiAgICBpbmRleCAwID0gWSBwbGFuZSwgWzk6MF0gWQog
ICAgaW5kZXggMSA9IENyOkNiIHBsYW5lLCBbMTk6MF0KICAgIG9yCiAgICBpbmRleCAxID0gQ2I6
Q3IgcGxhbmUsIFsxOTowXQoKU2FuZHkgSHVhbmcgKDMpOgogIGRybTogQWRkIHNvbWUgbmV3IGZv
cm1hdCBEUk1fRk9STUFUX05WWFhfMTAKICBkcm0vcm9ja2NoaXA6IEFkZCB2b3BfZm9ybWF0X2dl
dF9icHAgdG8gZ2V0IGZvcm1hdCBicHAKICBkcm0vcm9ja2NoaXA6IEFkZCBzdXBwb3J0IDEwYml0
IHl1diBmb3JtYXQKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jICAgICAgICAgICAgICAg
IHwgMTggKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV92b3AuYyB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCiBkcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5oIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX3ZvcF9yZWcuYyB8ICAyICsrCiBpbmNsdWRlL3VhcGkvZHJtL2RybV9m
b3VyY2MuaCAgICAgICAgICAgICAgIHwgMTQgKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA3
NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKLS0gCjIuNy40CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
