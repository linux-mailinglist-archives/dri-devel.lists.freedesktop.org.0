Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B5270AE6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B14E89E36;
	Mon, 22 Jul 2019 20:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1353 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jul 2019 20:56:34 UTC
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com
 [192.185.146.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D741589E36
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:56:34 +0000 (UTC)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id E1E6A46B3C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:33:59 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id pf0RhzbEF4FKppf0RhAipg; Mon, 22 Jul 2019 15:33:59 -0500
X-Authority-Reason: nr=8
Received: from cablelink149-185.telefonia.intercable.net
 ([201.172.149.185]:48474 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hpf0R-003M3r-00; Mon, 22 Jul 2019 15:33:59 -0500
Date: Mon, 22 Jul 2019 15:33:58 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: pvr2fb: remove unnecessary comparison of
 unsigned integer with < 0
Message-ID: <20190722203358.GA29111@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.149.185
X-Source-L: No
X-Exim-ID: 1hpf0R-003M3r-00
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink149-185.telefonia.intercable.net (embeddedor)
 [201.172.149.185]:48474
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgbm8gbmVlZCB0byBjb21wYXJlICp2YXItPnhvZmZzZXQqIG9yICp2YXItPnlvZmZz
ZXQqIHdpdGggPCAwCmJlY2F1c2Ugc3VjaCB2YXJpYWJsZXMgYXJlIG9mIHR5cGUgdW5zaWduZWQs
IG1ha2luZyBpdCBpbXBvc3NpYmxlIHRvCmhvbGQgYSBuZWdhdGl2ZSB2YWx1ZS4KCkZpeCB0aGlz
IGJ5IHJlbW92aW5nIHN1Y2ggY29tcGFyaXNvbnMuCgpBZGRyZXNzZXMtQ292ZXJpdHktSUQ6IDE0
NTE5NjQgKCJVbnNpZ25lZCBjb21wYXJlZCBhZ2FpbnN0IDAiKQpTaWduZWQtb2ZmLWJ5OiBHdXN0
YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgotLS0KIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvcHZyMmZiLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B2
cjJmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIuYwppbmRleCA3ZmY0YjZiODQyODIu
LjBhM2IyYjdjNzg5MSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIuYwor
KysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B2cjJmYi5jCkBAIC00NTgsMTMgKzQ1OCwxMSBAQCBz
dGF0aWMgaW50IHB2cjJmYl9jaGVja192YXIoc3RydWN0IGZiX3Zhcl9zY3JlZW5pbmZvICp2YXIs
IHN0cnVjdCBmYl9pbmZvICppbmZvKQogCXNldF9jb2xvcl9iaXRmaWVsZHModmFyKTsKIAogCWlm
ICh2YXItPnZtb2RlICYgRkJfVk1PREVfWVdSQVApIHsKLQkJaWYgKHZhci0+eG9mZnNldCB8fCB2
YXItPnlvZmZzZXQgPCAwIHx8Ci0JCSAgICB2YXItPnlvZmZzZXQgPj0gdmFyLT55cmVzX3ZpcnR1
YWwpIHsKKwkJaWYgKHZhci0+eG9mZnNldCB8fCB2YXItPnlvZmZzZXQgPj0gdmFyLT55cmVzX3Zp
cnR1YWwpIHsKIAkJCXZhci0+eG9mZnNldCA9IHZhci0+eW9mZnNldCA9IDA7CiAJCX0gZWxzZSB7
CiAJCQlpZiAodmFyLT54b2Zmc2V0ID4gdmFyLT54cmVzX3ZpcnR1YWwgLSB2YXItPnhyZXMgfHwK
LQkJCSAgICB2YXItPnlvZmZzZXQgPiB2YXItPnlyZXNfdmlydHVhbCAtIHZhci0+eXJlcyB8fAot
CQkJICAgIHZhci0+eG9mZnNldCA8IDAgfHwgdmFyLT55b2Zmc2V0IDwgMCkKKwkJCSAgICB2YXIt
PnlvZmZzZXQgPiB2YXItPnlyZXNfdmlydHVhbCAtIHZhci0+eXJlcykKIAkJCQl2YXItPnhvZmZz
ZXQgPSB2YXItPnlvZmZzZXQgPSAwOwogCQl9CiAJfSBlbHNlIHsKLS0gCjIuMjIuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
