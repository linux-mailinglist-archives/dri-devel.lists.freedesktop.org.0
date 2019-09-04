Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF11CA9B6A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C021A89E36;
	Thu,  5 Sep 2019 07:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24A988EA3;
 Wed,  4 Sep 2019 20:58:27 +0000 (UTC)
Received: from [2601:1c0:6200:6e8::e2a8]
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i5cME-00010R-Up; Wed, 04 Sep 2019 20:58:27 +0000
Subject: Re: linux-next: Tree for Sep 4 (amd/display/)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20190904233443.3f73c46b@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
Date: Wed, 4 Sep 2019 13:58:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904233443.3f73c46b@canb.auug.org.au>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RySvkA4PqDSjeZsiLdGzYmedvJgqhRvVYcnWJF/ahYY=; b=QO7/P7gHmvX8Mwzs+sfP6cUwP
 F6s3cPMwa8vVNxBwmN+xo48tUORqOS2p2CJ0UixJzBsPvGt35pc5CcP2zOtTX8SlLSnWLVcXJjDfJ
 iusNjIpcM2eN7kWOD52ArqmyDzy5XKpXI+lD3QEbklIp0CdV9cXhtT2DXz5P0ufrzw+6XMKvv9YRG
 j1UKNWosS8ePE6QFjG0BJ+RnOMYmJFNyuUtDn4MZU9tPKS/LbzPH7hjscmzBQte7ymS6pWjp2xfCD
 Iig8s1yLMMYULue2Dq6l0I3I7m0i7zxYg7dCvlaMeK0k/cExT0GW6z42tE6JvnY1cnzNN1+CPYiHu
 e3EfEi7vw==;
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
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS80LzE5IDY6MzQgQU0sIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6Cj4gSGkgYWxsLAo+IAo+
IE5ld3M6IHRoaXMgd2lsbCBiZSB0aGUgbGFzdCBsaW51eC1uZXh0IEkgd2lsbCByZWxlYXNlIHVu
dGlsIFNlcHQgMzAuCj4gCj4gQ2hhbmdlcyBzaW5jZSAyMDE5MDkwMzoKPiAKCm9uIHg4Nl82NDoK
CkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9k
aXNwbGF5L2RjL2RtbC9kY24yMC9kaXNwbGF5X3JxX2RsZ19jYWxjXzIwdjIuYzo3NzowOgouLi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RtbC9kY24yMC8uLi9kbWxf
aW5saW5lX2RlZnMuaDogSW4gZnVuY3Rpb24g4oCYZG1sX21pbuKAmToKLi4vZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kbWwvZGNuMjAvLi4vZG1sX2lubGluZV9kZWZz
Lmg6MzQ6MTogZXJyb3I6IFNTRSByZWdpc3RlciByZXR1cm4gd2l0aCBTU0UgZGlzYWJsZWQKCgot
LSAKflJhbmR5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
