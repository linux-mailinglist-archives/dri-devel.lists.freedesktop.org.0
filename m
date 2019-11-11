Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85710F77E6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 16:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FCE6E92F;
	Mon, 11 Nov 2019 15:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77166E92F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 15:40:39 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0953E222BD;
 Mon, 11 Nov 2019 15:40:38 +0000 (UTC)
Date: Mon, 11 Nov 2019 16:40:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH] staging: fbtft: Remove set but not used variable 'ret'
Message-ID: <20191111154037.GA816982@kroah.com>
References: <20191110105707.136956-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191110105707.136956-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573486839;
 bh=2iS64xZOYjvYvoLUUfe8qlTRll7p5DjvBX1t3/+GG/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mwq5EAHecQ97ip678b/pa0+doG30SMQbMzhZcL4fA9B4Gno/cnf5Xc2gj2oPjp7jS
 4YRxMqyutLmGGMZN4oOoBAR6lBSu4tdiHevigMtIyOX++pc2Paj4S9BdN14/XEWqlC
 v1/yTPNwgdYr898kjIE8z2XkEbQQHyyLU5vUbzZg=
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
Cc: Hulk Robot <hulkci@huawei.com>, davem@davemloft.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMTAsIDIwMTkgYXQgMDY6NTc6MDdQTSArMDgwMCwgWmhlbmcgWW9uZ2p1biB3
cm90ZToKPiBGaXhlcyBnY2MgJy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4g
Cj4gZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZiX2lsaTkzMjAuYzogSW4gZnVuY3Rpb24gcmVhZF9k
ZXZpY2Vjb2RlOgo+IGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYl9pbGk5MzIwLmM6MjU6Njogd2Fy
bmluZzogdmFyaWFibGUgcmV0IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGVdCj4gCj4gcmV0IGlzIG5ldmVyIHVzZWQsIHNvIHJlbW92ZSBpdC4KPiAKPiBSZXBvcnRl
ZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWmhl
bmcgWW9uZ2p1biA8emhlbmd5b25nanVuM0BodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3N0
YWdpbmcvZmJ0ZnQvZmJfaWxpOTMyMC5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdp
bmcvZmJ0ZnQvZmJfaWxpOTMyMC5jIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZiX2lsaTkzMjAu
Ywo+IGluZGV4IGYyZTcyZDE0NDMxZC4uZjBlYmM0MDg1N2IzIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvc3RhZ2luZy9mYnRmdC9mYl9pbGk5MzIwLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0
ZnQvZmJfaWxpOTMyMC5jCj4gQEAgLTIyLDExICsyMiwxMCBAQAo+ICAKPiAgc3RhdGljIHVuc2ln
bmVkIGludCByZWFkX2RldmljZWNvZGUoc3RydWN0IGZidGZ0X3BhciAqcGFyKQo+ICB7Cj4gLQlp
bnQgcmV0Owo+ICAJdTggcnhidWZbOF0gPSB7MCwgfTsKPiAgCj4gIAl3cml0ZV9yZWcocGFyLCAw
eDAwMDApOwo+IC0JcmV0ID0gcGFyLT5mYnRmdG9wcy5yZWFkKHBhciwgcnhidWYsIDQpOwo+ICsJ
cGFyLT5mYnRmdG9wcy5yZWFkKHBhciwgcnhidWYsIDQpOwo+ICAJcmV0dXJuIChyeGJ1ZlsyXSA8
PCA4KSB8IHJ4YnVmWzNdOwo+ICB9Cj4gIAoKSWYgdGhlIHJlYWQgY2FsbCBjYW4gZmFpbCwgc2hv
dWxkbid0IHlvdSBiZSBwYXNzaW5nIGJhY2sgdGhlIGVycm9yCnZhbHVlIGluc3RlYWQ/Cgp0aGFu
a3MsCgpncmVnIGstaAoKPiAtLSAKPiAyLjIzLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
