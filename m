Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4E1329D6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E813896B5;
	Mon,  3 Jun 2019 07:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 359 seconds by postgrey-1.36 at gabe;
 Sun, 02 Jun 2019 18:23:26 UTC
Received: from mail.daemonic.se (mail.daemonic.se [IPv6:2607:f740:d:20::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486828933D
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2019 18:23:26 +0000 (UTC)
Received: from cid.daemonic.se (localhost [IPv6:::1])
 by mail.daemonic.se (Postfix) with ESMTP id 45H5y31pSCz3khJ
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2019 18:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at daemonic.se
Received: from mail.daemonic.se ([127.0.0.1]) (using TLS with cipher
 ECDHE-RSA-AES128-GCM-SHA256)
 by cid.daemonic.se (mailscanner.daemonic.se [127.0.0.1]) (amavisd-new,
 port 10587)
 with ESMTPS id 1iilqWAk-7E4; Sun,  2 Jun 2019 18:17:30 +0000 (UTC)
Received: from vivi.daemonic.se.se (vivi.daemonic.se [IPv6:2001:470:dca9:2::4])
 by mail.daemonic.se (Postfix) with ESMTPSA id 45H5y23lM2z3c7V;
 Sun,  2 Jun 2019 18:17:30 +0000 (UTC)
From: Niclas Zeising <zeising@daemonic.se>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 1/2] meson.build: Fix typo
Date: Sun,  2 Jun 2019 20:15:59 +0200
Message-Id: <20190602181600.83963-2-zeising@daemonic.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190602181600.83963-1-zeising@daemonic.se>
References: <20190602181600.83963-1-zeising@daemonic.se>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Jun 2019 07:40:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=daemonic.se; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received; s=20151023; t=1559499450; bh=w6/0yR74q6NF/bF
 xruZViqQJgt0OOixHU5BsnZfyrag=; b=bn1hyByPTOjw48QTh3O9bjRnRO1oEx9
 XthSRTSz/dF9L4KroIzP7MbdfvRDgH2fLb0ZXTSDKcG6jjEgyQx2Nnec7aWKVm4P
 r0Ss/ShmY6OBxEYjx3ThsXmqfqut3OLWlPb15r1iqQpJNz2enIZ2PwKW/xc5FDN5
 mbtyym8w6/BI=
X-Mailman-Original-Authentication-Results: mailscanner.daemonic.se
 (amavisd-new); 
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=daemonic.se
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
Cc: Niclas Zeising <zeising@daemonic.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LS0tCiBtZXNvbi5idWlsZCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKaW5k
ZXggYmU3NjhhZmEuLjY0ZjBkNWIxIDEwMDY0NAotLS0gYS9tZXNvbi5idWlsZAorKysgYi9tZXNv
bi5idWlsZApAQCAtMjQ4LDcgKzI0OCw3IEBAIGlmIHByb2dfeHNsdC5mb3VuZCgpCiBlbmRpZgog
d2l0aF9tYW5fcGFnZXMgPSB3aXRoX21hbl9wYWdlcyAhPSAnZmFsc2UnIGFuZCBwcm9nX3hzbHQu
Zm91bmQoKSBhbmQgcHJvZ19zZWQuZm91bmQoKQogCi0jIFVzZWQgZm9yIHRldHMKKyMgVXNlZCBm
b3IgdGVzdHMKIHByb2dfYmFzaCA9IGZpbmRfcHJvZ3JhbSgnYmFzaCcpCiAKIGNvbmZpZy5zZXQx
MCgnSEFWRV9WSVNJQklMSVRZJywKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
