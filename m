Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2685C329D0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C96F89346;
	Mon,  3 Jun 2019 07:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 358 seconds by postgrey-1.36 at gabe;
 Sun, 02 Jun 2019 18:23:26 UTC
Received: from mail.daemonic.se (mail.daemonic.se [176.58.89.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5A88982E
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2019 18:23:26 +0000 (UTC)
Received: from cid.daemonic.se (localhost [IPv6:::1])
 by mail.daemonic.se (Postfix) with ESMTP id 45H5xx19pRz3khK
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2019 18:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at daemonic.se
Received: from mail.daemonic.se ([IPv6:::1]) (using TLS with cipher
 ECDHE-RSA-AES128-GCM-SHA256)
 by cid.daemonic.se (mailscanner.daemonic.se [IPv6:::1]) (amavisd-new,
 port 10587)
 with ESMTPS id zyQBlMsYiR-2; Sun,  2 Jun 2019 18:17:23 +0000 (UTC)
Received: from vivi.daemonic.se.se (vivi.daemonic.se [IPv6:2001:470:dca9:2::4])
 by mail.daemonic.se (Postfix) with ESMTPSA id 45H5xv24Vnz3c7V;
 Sun,  2 Jun 2019 18:17:23 +0000 (UTC)
From: Niclas Zeising <zeising@daemonic.se>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 0/2] Fix meson.build on FreeBSD
Date: Sun,  2 Jun 2019 20:15:58 +0200
Message-Id: <20190602181600.83963-1-zeising@daemonic.se>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Jun 2019 07:40:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=daemonic.se; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from:received:received; s=20151023;
 t=1559499443; bh=L1h7T9qtx+af6Ew7ylVhFubEiOMzpLFwa+2+sZ++fPk=; b=
 d9+aLVIGBYdxQv32sX7ZFjB0QsYguxqOc7efj1rgGg1fuwrFZFSusA0m1/iwxF2e
 ncNYmAStfvBH8gq2dh9g+YY1vQ2kmPLdrEoKaefG5Bpyw1vbycYcLLwiHxIKANG8
 InVH1nYJ/X5x44FykCBMMnAQKfn5vJrGKucyCEzEQaU=
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

VGhlcmUgYXJlIGEgZmV3IHNtYWxsIG5pdHMgbmVlZGVkIHRvIG1ha2UgdGhlIG1lc29uIGJ1aWxk
IHNjcmlwdCB3b3JrCnByb3Blcmx5IG9uIEZyZWVCU0QuIEluIHNob3J0OiBzeXMvc3lzY3RsLmgg
bmVlZHMgc3lzL3R5cGVzLmggVXNlIHNoCmlmIGJhc2ggaXNuJ3QgYXJvdW5kLgoKQWxzbyBmaXgg
YSB0eXBvIHdoaWxlIEknbSBoZXJlLgoKWyBwbGVhc2UgQ0MgbWUsIEknbSBub3Qgc3Vic2NyaWJl
ZCB0byBkcmktZGV2ZWxAIF0KCk5pY2xhcyBaZWlzaW5nICgyKToKICBtZXNvbi5idWlsZDogRml4
IHR5cG8KICBtZXNvbi5idWlsZDogRml4IG1lc29uIHNjcmlwdCBvbiBGcmVlQlNECgogbWVzb24u
YnVpbGQgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
