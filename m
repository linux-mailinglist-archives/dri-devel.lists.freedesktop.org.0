Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B98BAE23
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625C46E126;
	Mon, 23 Sep 2019 06:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF576FE0C;
 Fri, 20 Sep 2019 22:35:57 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::9a1f]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBRVN-0006oZ-64; Fri, 20 Sep 2019 22:35:57 +0000
Subject: Re: linux-next: Tree for Sep 20 (amdgpu-2)
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20190920163637.GI3822@sirena.co.uk>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <797e0870-bab3-2716-119c-c06735354506@infradead.org>
Date: Fri, 20 Sep 2019 15:35:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920163637.GI3822@sirena.co.uk>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NEWIc8p+eWJkSfR001CCsjTaw+6M+U0tYPGR2ne+fs8=; b=i4MeTf2PIAgQ6Z9wsFYf9fV5k
 +ZW1Eu0jsyTawHiq6IKagwWIfayV6BexWAyl/56kFc1t1qGpRmvO/NWGPYI+wy8V5wrBGwX8ZhEDB
 F90JzjdMWQGP2w4o1jwbI6RB6Ry/42DoF9nBx4u+pPibs7mGrO5AlAEhSSGoosfW4Vlv0uuVHKord
 yUhJi5gTvkUWSLZpDzE9pAIlkXf03I0c1EcdbjNsc4cPe74vXd9hQihKUa9XAmrAOoc0bJGlC/Oz1
 C1CwNIXakCfkp4wyTivAX/OEBsrPSIPX30BX7trMtIOGMDfdtXu/xu92R1ZLr9WtpW70kR4xQqmTb
 hUw+uXNYg==;
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8yMC8xOSA5OjM2IEFNLCBNYXJrIEJyb3duIHdyb3RlOgo+IEhpIGFsbCwKPiAKPiBOZXdz
OiBUaGVyZSB3aWxsIGxpa2VseSBiZSBubyBtb3JlIC1uZXh0IGJ1aWxkcyB1bnRpbCBTdGVwaGVu
IHJldHVybnMgb24KPiB0aGUgMzB0aCwgSSAqbWF5KiBkbyBzb21lIG5leHQgd2VlayBidXQgaXQn
cyBtb3JlIGxpa2VseSB0aGF0IEkgd29uJ3QKPiBhbmQgaXQgY2VydGFpbmx5IHdvbid0IGJlIGV2
ZXJ5IGRheS4KPiAKPiBDaGFuZ2VzIHNpbmNlIDIwMTkwOTE5Ogo+IAoKb24geDg2XzY0OgoKKDEp
IHdoZXJlIGlzIGZ1bmN0aW9uIGdldF93bV91cmdlbnQoKSBkZWZpbmVkPyAgSSBjYW5ub3QgZmlu
ZCBpdCAoaS5lLiwKZ3JlcCBjYW5ub3QgZmluZCBpdCkuCgouLi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmM6IEluIGZ1bmN0aW9u
IOKAmGNhbGN1bGF0ZV93bV9zZXRfZm9yX3ZsZXZlbOKAmToKLi4vZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jOjk2NDoyMjogZXJy
b3I6IFNTRSByZWdpc3RlciByZXR1cm4gd2l0aCBTU0UgZGlzYWJsZWQKICB3bV9zZXQtPnVyZ2Vu
dF9ucyA9IGdldF93bV91cmdlbnQoZG1sLCBwaXBlcywgcGlwZV9jbnQpICogMTAwMDsKICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgooMikg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNv
dXJjZS5jIG5lZWRzCiNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CmZvciB0aGUga3phbGxvYygpIGFu
ZCBrZnJlZSgpIGZ1bmN0aW9uIGNhbGxzLgoKClRoYW5rcy4KLS0gCn5SYW5keQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
