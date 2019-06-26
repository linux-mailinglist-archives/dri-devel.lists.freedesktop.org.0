Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7F8568B6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 14:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DD06E3B4;
	Wed, 26 Jun 2019 12:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7286E3B4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 12:24:08 +0000 (UTC)
Received: from localhost (unknown [116.247.127.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15A86204FD;
 Wed, 26 Jun 2019 12:24:06 +0000 (UTC)
Date: Wed, 26 Jun 2019 20:23:17 +0800
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH] Adjust analogix chip driver location
Message-ID: <20190626122317.GC30972@kroah.com>
References: <20190626104430.GA11770@xin-VirtualBox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626104430.GA11770@xin-VirtualBox>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561551847;
 bh=641EHDpmvZqgAGg8LqnSOkw87ehZLVxWtrc67udnISM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iMal2AgtgxKFwMuFlSKUJqywFq4FoohLkt6ztb4Inwva82zP417XBn+4FEtldquLz
 oIC1/KeBCNQ3+JzA2f3x4QdbZG/p7mtmQr3fHp0xqPnpmAPuiTtiKBa01qvYY8KtBs
 U/Rynxi6djAk/SMtgbbTBQdPj2bUpggApoFBl19A=
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
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sjoerd.simons@collabora.co.uk" <sjoerd.simons@collabora.co.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTA6NDQ6MzhBTSArMDAwMCwgWGluIEppIHdyb3RlOgo+
IE1vdmUgYW5hbG9naXggY2hpcCBBTlg3OFhYIGJyaWRnZSBkcml2ZXIgaW50byAiYW5hbG9naXgi
IGRpcmVjdG9yeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBYaW4gSmkgPHhqaUBhbmFsb2dpeHNlbWku
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICB8ICAgMTAgLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICB8ICAgIDMgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dp
eC1hbng3OHh4LmMgICAgICAgICAgfCAxNDg1IC0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5oICAgICAgICAgIHwgIDcxMCAtLS0t
LS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvS2NvbmZpZyAgICAgICAg
ICAgIHwgICAxMCArCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvTWFrZWZpbGUg
ICAgICAgICAgIHwgICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5h
bG9naXgtYW54Nzh4eC5jIHwgMTQ4NSArKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDc4eHguaCB8ICA3MTAgKysrKysrKysr
Kwo+ICA4IGZpbGVzIGNoYW5nZWQsIDIyMDggaW5zZXJ0aW9ucygrKSwgMjIwNyBkZWxldGlvbnMo
LSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgt
YW54Nzh4eC5jCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fu
YWxvZ2l4LWFueDc4eHguaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng3OHh4LmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4eC5oCgonZ2l0IGZv
cm1hdC1wYXRjaCAtTScgaXMgdXN1YWxseSBhIGxvdCBiZXR0ZXIgdG8gdXNlIHdoZW4gbW92aW5n
IGZpbGVzCmFyb3VuZCwgYXMgaXQgc2hvd3MgeW91IG9ubHkgYW55IGNoYW5nZXMgaW4gdGhlIGZp
bGVzLCBub3QgYSBodWdlCmRlbGV0ZS9hZGQgY3ljbGUuCgp0aGFua3MsCgpncmVnIGstaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
