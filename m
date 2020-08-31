Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9090A257641
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5046D89E3F;
	Mon, 31 Aug 2020 09:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F09889E15
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 04:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=hk9MKuYTLLrbYPyororI+1P9k/AQL7zML5WUOPd+C6c=; b=PMGr1dUjzsSLLZezD3HIALlL8q
 HqT6THcAJCmcjDT59RzuD2Of87nr/15+1XH4pvm/KedAGJNyHMlcfeoEdih24melWClTbOPxhFKF7
 Az17djVhyAk0DWJZQU2oIT6Hld0Tyg+ElHrhba4u5eWYUL5I6hI6hJ2EbLdS1oxHLBS5nvJfkG6rn
 yRSJ98sR65k3RQ8vxe8g36o2A8oDyzU8hQ1Hl1QalwZpY2Urgc1XUzJCZLCcT62uKrWpz7WMt4TSQ
 IpD6mmFTYqGhZw05LuBWG/dIOmqCWBNn3seu0lN8NHs7fWa2cSzMZpfJTKlMtDHXhpYxIvlVB3LMB
 aXLFxgCQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCbFt-000648-LC; Mon, 31 Aug 2020 04:17:18 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: fix kernel-doc warning in dma-fence.c
Date: Sun, 30 Aug 2020 21:17:13 -0700
Message-Id: <20200831041713.12571-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:12:28 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Gustavo Padovan <gustavo@padovan.org>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIEBjb29raWUgdG8gZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKCkgdG8gcHJldmVudCBrZXJu
ZWwtZG9jCndhcm5pbmcgaW4gZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jOgoKLi4vZHJpdmVy
cy9kbWEtYnVmL2RtYS1mZW5jZS5jOjI5MTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9y
IG1lbWJlciAnY29va2llJyBub3QgZGVzY3JpYmVkIGluICdkbWFfZmVuY2VfZW5kX3NpZ25hbGxp
bmcnCgpTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4K
Q2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBHdXN0YXZvIFBh
ZG92YW4gPGd1c3Rhdm9AcGFkb3Zhbi5vcmc+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKLS0tCiBkcml2ZXJzL2RtYS1idWYvZG1hLWZl
bmNlLmMgfCAgICAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKLS0tIGxueC01
OS1yYzMub3JpZy9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKKysrIGxueC01OS1yYzMvZHJp
dmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jCkBAIC0yODMsNiArMjgzLDcgQEAgRVhQT1JUX1NZTUJP
TChkbWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZwogCiAvKioKICAqIGRtYV9mZW5jZV9lbmRfc2ln
bmFsbGluZyAtIGVuZCBhIGNyaXRpY2FsIERNQSBmZW5jZSBzaWduYWxsaW5nIHNlY3Rpb24KKyAq
IEBjb29raWU6IG9wYXF1ZSBjb29raWUgZnJvbSBkbWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZygp
CiAgKgogICogQ2xvc2VzIGEgY3JpdGljYWwgc2VjdGlvbiBhbm5vdGF0aW9uIG9wZW5lZCBieSBk
bWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZygpLgogICovCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
