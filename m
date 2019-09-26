Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D1FBED3D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE72C6EE57;
	Thu, 26 Sep 2019 08:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E916EE5F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:17:39 +0000 (UTC)
Received: from localhost (unknown [192.168.167.110])
 by lucky1.263xmail.com (Postfix) with ESMTP id 6D07A4409B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 16:17:33 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P17590T140626737747712S1569485851176425_; 
 Thu, 26 Sep 2019 16:17:32 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <e874c4183dbd5347332a24fc9ab23b59>
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
Date: Thu, 26 Sep 2019 16:17:25 +0800
Message-Id: <1569485848-151295-1-git-send-email-hjc@rock-chips.com>
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
bWUgbmV3IGZvcm1hdCBEUk1fRk9STUFUX05WWFhfMTAKICBkcm0vcm9ja2NoaXA6IEFkZCB2b3Bf
Zm9ybWF0X2dldF9icHAgdG8gZ2V0IGZvcm1hdCBicHAKICBkcm0vcm9ja2NoaXA6IEFkZCBzdXBw
b3J0IDEwYml0IHl1diBmb3JtYXQKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jICAgICAg
ICAgICAgICAgIHwgMTggKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlw
X2RybV92b3AuYyB8IDc3ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tCiBkcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5oIHwgIDEgKwogZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX3ZvcF9yZWcuYyB8ICAyICsKIGluY2x1ZGUvdWFwaS9kcm0vZHJt
X2ZvdXJjYy5oICAgICAgICAgICAgICAgfCAxNCArKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMTAz
IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
