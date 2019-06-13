Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D6A45600
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBDD898CE;
	Fri, 14 Jun 2019 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E9089B03
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:04:45 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35452 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRG4-0003lU-BJ; Thu, 13 Jun 2019 16:03:20 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFy-000093-UZ; Thu, 13 Jun 2019 16:03:15 +0100
In-Reply-To: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
References: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 18/18] drm/armada: no need to check parent of remote
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbRFy-000093-UZ@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 16:03:14 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ta/6q8vbVvmUuueQYgqLC/p+c/Ny9q8WzZOpMvtf6x0=; b=UFtM/fJ2jjodY3nbXfa8dt35yZ
 HOnwKFQgTEz9HnBtVYPKGTGrjT6bYBeLV67dgR1J29UWYexI8kKE2J9dFna8S0vQ4h6lkDKJYVtuq
 N03WCAe7XqEwkvk4zNlhhOhF59/SJp19CIbXz6LoG7xKW3gdKBoXp3kShqaSOGR4g2rX9zBM2R5/E
 62EUWL/qRAqbvJtk+T1lFMIApEbIYCqOLLQ1ou/cK7RhjRoRLS1xutynO1vYFv2iMJyyRWo+qNF5O
 3d7iaphi/Dh1mY6wpol2S5Ezti7GC8HUTYxXV5Ao8nEOYUzUlbjCiQDOUL14802uR7xFVDC50ZHHz
 MN34NITg==;
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyBubyBuZWVkIHRvIGNoZWNrIHRoZSBwYXJlbnQgb2YgdGhlIHJlbW90ZSBkZXZpY2Ug
dG8gY2hlY2sKd2hldGhlciBpdCBpcyBhdmFpbGFibGUgb3Igbm90LCB0aGUgcmVtb3RlIGlzIHRo
ZSBkZXZpY2UgaXRzZWxmLgoKU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIDxybWsra2VybmVs
QGFybWxpbnV4Lm9yZy51az4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9kcnYu
YyB8IDE0ICsrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
MSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFk
YV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2Rydi5jCmluZGV4IDFjZmFi
Y2Q2YTYyOS4uZjE3MjkzOThiMWJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRh
L2FybWFkYV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9kcnYuYwpA
QCAtMjEwLDE3ICsyMTAsOSBAQCBzdGF0aWMgdm9pZCBhcm1hZGFfYWRkX2VuZHBvaW50cyhzdHJ1
Y3QgZGV2aWNlICpkZXYsCiAKIAlmb3JfZWFjaF9lbmRwb2ludF9vZl9ub2RlKGRldl9ub2RlLCBl
cCkgewogCQlyZW1vdGUgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50KGVwKTsKLQkJ
aWYgKCFyZW1vdGUgfHwgIW9mX2RldmljZV9pc19hdmFpbGFibGUocmVtb3RlKSkgewotCQkJb2Zf
bm9kZV9wdXQocmVtb3RlKTsKLQkJCWNvbnRpbnVlOwotCQl9IGVsc2UgaWYgKCFvZl9kZXZpY2Vf
aXNfYXZhaWxhYmxlKHJlbW90ZS0+cGFyZW50KSkgewotCQkJZGV2X3dhcm4oZGV2LCAicGFyZW50
IGRldmljZSBvZiAlcE9GIGlzIG5vdCBhdmFpbGFibGVcbiIsCi0JCQkJIHJlbW90ZSk7Ci0JCQlv
Zl9ub2RlX3B1dChyZW1vdGUpOwotCQkJY29udGludWU7Ci0JCX0KLQotCQlkcm1fb2ZfY29tcG9u
ZW50X21hdGNoX2FkZChkZXYsIG1hdGNoLCBjb21wYXJlX29mLCByZW1vdGUpOworCQlpZiAocmVt
b3RlICYmIG9mX2RldmljZV9pc19hdmFpbGFibGUocmVtb3RlKSkKKwkJCWRybV9vZl9jb21wb25l
bnRfbWF0Y2hfYWRkKGRldiwgbWF0Y2gsIGNvbXBhcmVfb2YsCisJCQkJCQkgICByZW1vdGUpOwog
CQlvZl9ub2RlX3B1dChyZW1vdGUpOwogCX0KIH0KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
