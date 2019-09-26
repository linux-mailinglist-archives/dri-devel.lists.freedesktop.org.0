Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEF1BED54
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA296ECA4;
	Thu, 26 Sep 2019 08:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506956ECA4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:25:02 +0000 (UTC)
Received: from localhost (unknown [192.168.167.193])
 by lucky1.263xmail.com (Postfix) with ESMTP id CA3C167F91
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 16:24:57 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P24701T140118476191488S1569486296531843_; 
 Thu, 26 Sep 2019 16:24:57 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <e16a8da382c2f05e8fbe86b2de21b61d>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] Add some yuv 10bit support
Date: Thu, 26 Sep 2019 16:24:46 +0800
Message-Id: <1569486289-152061-1-git-send-email-hjc@rock-chips.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2Ugc2VyaWVzIHBhdGNoZXMgaXMgdG8gYWRkIHNvbWUgbmV3IGZvcm1hdCBzdXBwb3J0ZWQg
Ynkgc29tZSByb2NrY2hpcApzb2NzLCBpbmNsdWRlOgogIFJLMzI4OC9SSzMyMjgvUkszMzI4L1JL
MzM2OC9SSzMzOTkKCnRoZXNlIG5ldyBmb3JtYXQgbGF5b3V0IGFzIGZvbGxvd2luZyBydWxlOgoy
IHBsYW5lIFlDYkNyCiAgaW5kZXggMCA9IFkgcGxhbmUsIFkzOlkyOlkxOlkwIDEwOjEwOjEwOjEw
CiAgaW5kZXggMSA9IENiOkNyIHBsYW5lLCBDYjM6Q3IzOkNiMjpDcjI6Q2IxOkNyMTpDYjA6Q3Iw
IDEwOjEwOjEwOjEwOjEwOjEwOjEwOjEwCiAgb3IKICBpbmRleCAxID0gQ3I6Q2IgcGxhbmUsIENy
MzpDYjM6Q3IyOkNiMjpDcjE6Q2IxOkNyMDpDYjAgMTA6MTA6MTA6MTA6MTA6MTA6MTA6MTAKCnYy
OgogIDEuIGFkZCBkZXNjcmliZSBmb3IgbmV3IGZvcm1hdDsKICAyLiB1c2UgYmxvY2sgZm9ybWF0
cyB0byBkZXNjcmliZSBuZXcgZm9ybWF0OwoKU2FuZHkgSHVhbmcgKDMpOgogIGRybTogQWRkIHNv
bWUgbmV3IGZvcm1hdCBEUk1fRk9STUFUX05WWFhfMTAKICBkcm0vcm9ja2NoaXA6IEFkZCByb2Nr
Y2hpcF92b3BfZ2V0X29mZnNldCB0byBnZXQgb2Zmc2V0CiAgZHJtL3JvY2tjaGlwOiBBZGQgc3Vw
cG9ydCAxMGJpdCB5dXYgZm9ybWF0CgogZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYyAgICAg
ICAgICAgICAgICB8IDE4ICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fdm9wLmMgfCA3NyArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQogZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuaCB8ICAxICsKIGRyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF92b3BfcmVnLmMgfCAgMiArCiBpbmNsdWRlL3VhcGkvZHJtL2Ry
bV9mb3VyY2MuaCAgICAgICAgICAgICAgIHwgMTQgKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDEw
MyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKLS0gCjIuNy40CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
