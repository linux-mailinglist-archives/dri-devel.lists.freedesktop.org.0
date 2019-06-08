Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E02133A5BA
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF4489322;
	Sun,  9 Jun 2019 12:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AADD891CC
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 04:50:06 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=dragon.dunlab)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hZTIq-0003jj-6K; Sat, 08 Jun 2019 04:50:04 +0000
Subject: Re: [PATCHv16 3/3] ARM:drm ivip Intel FPGA Video and Image Processing
 Suite
To: "Hean-Loong, Ong" <hean.loong.ong@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20190607143022.427-1-hean.loong.ong@intel.com>
 <20190607143022.427-4-hean.loong.ong@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bc42cad0-8c03-4e22-4475-c25f2e824944@infradead.org>
Date: Fri, 7 Jun 2019 21:50:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607143022.427-4-hean.loong.ong@intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gwZHN6g8rrJZZNXc5XgsWcgNpvLcubn0e/88oGuv6nA=; b=Q0wF09O3nya3WaZACBVPt/lVP
 UxWlscZ4Ii2/bdHaA47KI7ySk2JnjiSpsFyrdjtW57qnC7JiYFXDt/0TN4bx04QSZphix1/xhgZPD
 Bnmqo+95y/pkeohfeD/h/QD8SXP9mODnBy8wMSvUAQ7AMCP6TvMfNNyjbPLNqMgCrKBrjWjFZGCQE
 Geql4V7BmpM566hjQcUr2essMDn1Q6thYrsEwhkKtFRCTHOmVogJvb7orUP0+vTiiaTOdy8jXIvV4
 aKXPA03ijb9l4XW8LiogXE6vnA8Uo9mcuIWKML52Z6h0Qz/dm5RJBqe5QTx00IidFPn+ZVDyJUq6L
 tuSAozzXg==;
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
Cc: devicetree@vger.kernel.org, chin.liang.see@intel.com, Ong@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi83LzE5IDc6MzAgQU0sIEhlYW4tTG9vbmcsIE9uZyB3cm90ZToKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2l2aXAvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9pdmlwL0tjb25m
aWcKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMWIyYWY4NWZl
NzU3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pdmlwL0tjb25maWcK
PiBAQCAtMCwwICsxLDE0IEBACj4gK2NvbmZpZyBEUk1fSVZJUAo+ICsgICAgICAgIHRyaXN0YXRl
ICJJbnRlbCBGR1BBIFZpZGVvIGFuZCBJbWFnZSBQcm9jZXNzaW5nIgo+ICsgICAgICAgIGRlcGVu
ZHMgb24gRFJNICYmIE9GCj4gKyAgICAgICAgc2VsZWN0IERSTV9HRU1fQ01BX0hFTFBFUgo+ICsg
ICAgICAgIHNlbGVjdCBEUk1fS01TX0hFTFBFUgo+ICsgICAgICAgIHNlbGVjdCBEUk1fS01TX0ZC
X0hFTFBFUgo+ICsgICAgICAgIHNlbGVjdCBEUk1fS01TX0NNQV9IRUxQRVIKPiArICAgICAgICBo
ZWxwCj4gKwkJQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSBoYXZlIGFuIEludGVsIEZQR0EgQXJy
aWEgMTAgc3lzdGVtCj4gKwkJYW5kIGFib3ZlIHdpdGggYW4gSW50ZWwgRGlzcGxheSBQb3J0IElQ
LiBUaGlzIGRvZXMgbm90IHN1cHBvcnQKPiArCQlsZWdhY3kgSW50ZWwgRlBHQSBDeWNsb25lIFYg
ZGlzcGxheSBwb3J0LiBDdXJyZW50bHkgb25seSBzaW5nbGUKPiArCQlmcmFtZSBidWZmZXIgaXMg
c3VwcG9ydGVkLiBOb3RlIHRoYXQgQUNQSSBhbmQgWF84NiBhcmNoaXRlY3R1cmUKPiArCQlpcyBu
b3Qgc3VwcG9ydGVkIGZvciBBcnJpYTEwLiBJZiBNIGlzIHNlbGVjdGVkIHRoZSBtb2R1bGUgd2ls
bCBiZQo+ICsJCWNhbGxlZCBpdmlwLgoKQWNjb3JkaW5nIHRvIERvY3VtZW50YXRpb24vcHJvY2Vz
cy9jb2Rpbmctc3R5bGUucnN0LCBLY29uZmlnIGhlbHAgdGV4dCBzaG91bGQgYmUKaW5kZW50ZWQg
d2l0aCAxIHRhYiArIDIgc3BhY2VzLCBub3QgMiB0YWJzLgoKLS0gCn5SYW5keQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
