Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD12F800BC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 21:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF6E6EF54;
	Fri,  2 Aug 2019 19:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com
 [192.185.146.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE4E6EF54
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 19:15:45 +0000 (UTC)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id D3D10147E5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 14:15:44 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id td1khieG9iQertd1kh6zME; Fri, 02 Aug 2019 14:15:44 -0500
X-Authority-Reason: nr=8
Received: from [187.192.11.120] (port=33024 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1htd1j-002zj8-JL; Fri, 02 Aug 2019 14:15:43 -0500
Date: Fri, 2 Aug 2019 14:15:42 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: omapfb_main: Mark expected switch fall-throughs
Message-ID: <20190802191542.GA32751@embeddedor>
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
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1htd1j-002zj8-JL
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:33024
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oc4AOSiWl2lCiQnPdkuEFM9SDJW1XSDtDJ29fXEPlhM=; b=XDEIu4eu/j9WOOXkZ01OOBh6hM
 aTPH9Y69Pjb/5SEGg9xCm0PFJs1pnlEiy9UQOwgqbaLQbL3W14G83xmdN/GxM3enfu+/kPWguQ4V+
 JB2k6IyHnydpveoNrSXMzNYhboBwdflY3x3ZdVPvOUH3n0kA1enCOuTpPiuwugAG8imKN0k6VGrYP
 R7Ku0eMHPbQProwP7aLhOEetU4ucRuqc0OYF/Yg5ijLFu4OMMN2jfKPxWOYpKKblV5b4s3/WbM87J
 7z6+H6qUr5CnauHlYua5HqEqbWfD6BodqRsHzRk27/r+2jDXWnrbXHVrd1HI/BFVVOdGTIHSApkbv
 P9kSmEiw==;
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
Cc: linux-fbdev@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFyayBzd2l0Y2ggY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2gu
CgpUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZyAoQnVpbGRpbmc6IG9tYXAx
X2RlZmNvbmZpZyBhcm0pOgoKZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmM6
NDQ5OjIzOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxp
Y2l0LWZhbGx0aHJvdWdoPV0KZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmM6
MTU0OTo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxp
Y2l0LWZhbGx0aHJvdWdoPV0KZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmM6
MTU0NzozOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxp
Y2l0LWZhbGx0aHJvdWdoPV0KZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmM6
MTU0NTozOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxp
Y2l0LWZhbGx0aHJvdWdoPV0KZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmM6
MTU0MzozOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxp
Y2l0LWZhbGx0aHJvdWdoPV0KZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmM6
MTU0MDo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxp
Y2l0LWZhbGx0aHJvdWdoPV0KZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmM6
MTUzODozOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxp
Y2l0LWZhbGx0aHJvdWdoPV0KZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmM6
MTUzNTozOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxp
Y2l0LWZhbGx0aHJvdWdoPV0KClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1
c3Rhdm9AZW1iZWRkZWRvci5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBm
Yl9tYWluLmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmMgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L29tYXAvb21hcGZiX21haW4uYwppbmRleCA5MGVjYTY0ZTMxNDQuLjcw
MmNjYTU5YmRhMSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9t
YWluLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmMKQEAgLTQ0
Nyw2ICs0NDcsNyBAQCBzdGF0aWMgaW50IHNldF9jb2xvcl9tb2RlKHN0cnVjdCBvbWFwZmJfcGxh
bmVfc3RydWN0ICpwbGFuZSwKIAkJcmV0dXJuIDA7CiAJY2FzZSAxMjoKIAkJdmFyLT5iaXRzX3Bl
cl9waXhlbCA9IDE2OworCQkvKiBmYWxsIHRocm91Z2ggKi8KIAljYXNlIDE2OgogCQlpZiAocGxh
bmUtPmZiZGV2LT5wYW5lbC0+YnBwID09IDEyKQogCQkJcGxhbmUtPmNvbG9yX21vZGUgPSBPTUFQ
RkJfQ09MT1JfUkdCNDQ0OwpAQCAtMTUzNCwyMCArMTUzNSwyNyBAQCBzdGF0aWMgdm9pZCBvbWFw
ZmJfZnJlZV9yZXNvdXJjZXMoc3RydWN0IG9tYXBmYl9kZXZpY2UgKmZiZGV2LCBpbnQgc3RhdGUp
CiAJY2FzZSBPTUFQRkJfQUNUSVZFOgogCQlmb3IgKGkgPSAwOyBpIDwgZmJkZXYtPm1lbV9kZXNj
LnJlZ2lvbl9jbnQ7IGkrKykKIAkJCXVucmVnaXN0ZXJfZnJhbWVidWZmZXIoZmJkZXYtPmZiX2lu
Zm9baV0pOworCQkvKiBmYWxsIHRocm91Z2ggKi8KIAljYXNlIDc6CiAJCW9tYXBmYl91bnJlZ2lz
dGVyX3N5c2ZzKGZiZGV2KTsKKwkJLyogZmFsbCB0aHJvdWdoICovCiAJY2FzZSA2OgogCQlpZiAo
ZmJkZXYtPnBhbmVsLT5kaXNhYmxlKQogCQkJZmJkZXYtPnBhbmVsLT5kaXNhYmxlKGZiZGV2LT5w
YW5lbCk7CisJCS8qIGZhbGwgdGhyb3VnaCAqLwogCWNhc2UgNToKIAkJb21hcGZiX3NldF91cGRh
dGVfbW9kZShmYmRldiwgT01BUEZCX1VQREFURV9ESVNBQkxFRCk7CisJCS8qIGZhbGwgdGhyb3Vn
aCAqLwogCWNhc2UgNDoKIAkJcGxhbmVzX2NsZWFudXAoZmJkZXYpOworCQkvKiBmYWxsIHRocm91
Z2ggKi8KIAljYXNlIDM6CiAJCWN0cmxfY2xlYW51cChmYmRldik7CisJCS8qIGZhbGwgdGhyb3Vn
aCAqLwogCWNhc2UgMjoKIAkJaWYgKGZiZGV2LT5wYW5lbC0+Y2xlYW51cCkKIAkJCWZiZGV2LT5w
YW5lbC0+Y2xlYW51cChmYmRldi0+cGFuZWwpOworCQkvKiBmYWxsIHRocm91Z2ggKi8KIAljYXNl
IDE6CiAJCWRldl9zZXRfZHJ2ZGF0YShmYmRldi0+ZGV2LCBOVUxMKTsKIAkJa2ZyZWUoZmJkZXYp
OwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
