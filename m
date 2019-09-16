Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C271B481B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D79C6EB0B;
	Tue, 17 Sep 2019 07:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 530 seconds by postgrey-1.36 at gabe;
 Mon, 16 Sep 2019 12:20:01 UTC
Received: from rosenzweig.io (rosenzweig.io [107.170.207.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080EA8914E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 12:20:01 +0000 (UTC)
Received: by rosenzweig.io (Postfix, from userid 1000)
 id 797095FECD; Mon, 16 Sep 2019 05:11:10 -0700 (PDT)
Date: Mon, 16 Sep 2019 08:11:10 -0400
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 1/2] drm/panfrost: Allow passing extra information about
 BOs used by a job
Message-ID: <20190916121110.GA25942@rosenzweig.io>
References: <20190913111748.21071-1-boris.brezillon@collabora.com>
 <18586dc0-aa00-67e7-ec67-fdcded5a03eb@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18586dc0-aa00-67e7-ec67-fdcded5a03eb@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
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
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+ICsJLyoqCj4gPiArCSAqIFBvaW50ZXIgdG8gYSB1MzIgYXJyYXkgb2YgJmRybV9wYW5mcm9z
dF9zdWJtaXRfYm9fZGVzYyBvYmplY3RzLiBUaGlzCj4gPiArCSAqIGZpZWxkIGlzIG1lYW50IHRv
IHJlcGxhY2UgJmRybV9wYW5mcm9zdF9zdWJtaXQuYm9faGFuZGxlcyB3aGljaCBkaWQKPiA+ICsJ
ICogbm90IHByb3ZpZGUgZW5vdWdoIGluZm9ybWF0aW9uIHRvIHJlbGF4IHN5bmNocm9uaXphdGlv
biBiZXR3ZWVuCj4gPiArCSAqIGpvYnMgdGhhdCBvbmx5IG9ubHkgcmVhZCB0aGUgQk8gdGhleSBz
aGFyZS4gV2hlbiBib3RoCj4gPiArCSAqICZkcm1fcGFuZnJvc3Rfc3VibWl0LmJvX2hhbmRsZXMg
YW5kICZkcm1fcGFuZnJvc3Rfc3VibWl0LmJvX2Rlc2NzCj4gPiArCSAqIGFyZSBwcm92aWRlZCwg
ZHJtX3BhbmZyb3N0X3N1Ym1pdC5ib19oYW5kbGVzIGlzIGlnbm9yZWQuCj4gPiArCSAqLwo+ID4g
KwlfX3U2NCBib19kZXNjczsKPiA+ICsKPiA+ICsJLyoqCj4gPiArCSAqIE51bWJlciBvZiBCTyBk
ZXNjcmlwdG9ycyBwYXNzZWQgaW4gKHNpemUgaXMgdGhhdCB0aW1lcwo+ID4gKwkgKiBzaXplb2Yo
ZHJtX3BhbmZyb3N0X3N1Ym1pdF9ib19kZXNjKSkuCj4gPiArCSAqLwo+ID4gKwlfX3UzMiBib19k
ZXNjX2NvdW50Owo+IAo+IFdlIGRvbid0IHJlYWxseSBuZWVkIGFub3RoZXIgY291bnQgZmllbGQu
IGJvX2hhbmRsZV9jb3VudCBjb3VsZCBiZQo+IHJlLXVzZWQuIEluZGVlZCB0aGlzIGNvdWxkIGV2
ZW4gYmUgaGFuZGxlZCB3aXRoIGp1c3QgYSBmbGFncyBmaWVsZCB3aXRoCj4gYSBuZXcgZmxhZyBz
cGVjaWZ5aW5nIHRoYXQgYm9faGFuZGxlcyBubyBsb25nZXIgcG9pbnRzIHRvIGhhbmRsZXMgYnV0
IHRvCj4gYm9fZGVzYyBvYmplY3RzIGluc3RlYWQuCgpUaGlzIHNlZW1zIGxpa2UgdGhlIGNsZWFu
aWVzdCBhcHByb2FjaCAoYWxzbyBidW1waW5nIHRoZSBBQkkgdmVyc2lvbikuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
