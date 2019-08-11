Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF96A891CC
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 15:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB2E8862C;
	Sun, 11 Aug 2019 13:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AA98862C
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 13:19:20 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61739
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hwnkk-00051y-MF; Sun, 11 Aug 2019 15:19:18 +0200
Subject: Re: [PATCH v2 4/9] drm/panel: Add driver for the LG Philips LB035Q02
 panel
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
References: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
 <20190810231048.1921-5-laurent.pinchart@ideasonboard.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <6a2a22b2-3db5-2d7b-d19b-4f3857351134@tronnes.org>
Date: Sun, 11 Aug 2019 15:19:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190810231048.1921-5-laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=hZ3rB5PeAc+ZkW47AIEMRxPdreyQnA+ewjFBcT5u2i4=; 
 b=kJLpfempm+fxjt3GjjktLdQ9qqHcu+E3ajZnofsF5zm6C6VcSH5Sf73R0xHtcpGRdSZq1rMttUmRAfVURFhcrBA1G/6uCHCMHT5/pcRfHTP5BFit0xY1AFH+l32mtYUuwZWcf2EjLz0/0040xjvWfUn6fyP6dLWkDmS5E5J2NbMqSFMGQjPwwvtpFx36SexO/YoY2clqUKbX2/D//ZbeMEZk+Kzohev+NLZaPwtBpMmQ5zDz3uLA3gwynw254NEAc1pHgB7QBqgIfG4QsGBTMwXUAaCLBWsf8lcgHjp9ZVXQjsQ3yO4ICWb0QZOKE+Y69XbY3IvwrZUB9p63F+gBLg==;
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
Cc: Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2FtLAoKRGVuIDExLjA4LjIwMTkgMDEuMTAsIHNrcmV2IExhdXJlbnQgUGluY2hhcnQ6Cj4gVGhp
cyBwYW5lbCBpcyB1c2VkIG9uIHRoZSBHdW1zdGl4IE92ZXJvIFBhbG8zNS4KPiAKPiBUaGUgY29k
ZSBpcyBiYXNlZCBvbiB0aGUgb21hcGRybS1zcGVjaWZpYyBwYW5lbC1sZ3BoaWxpcHMtbGIwMzVx
MDIKPiBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcg
PHNhbUByYXZuYm9yZy5vcmc+Cj4gLS0tCgo8c25pcD4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1sZy1sYjAzNXEwMi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWxnLWxiMDM1cTAyLmMKCjxzbmlwPgoKPiArc3RhdGljIGludCBsYjAzNXEwMl93cml0
ZShzdHJ1Y3QgbGIwMzVxMDJfZGV2aWNlICpsY2QsIHUxNiByZWcsIHUxNiB2YWwpCj4gK3sKPiAr
CXN0cnVjdCBzcGlfbWVzc2FnZSBtc2c7Cj4gKwlzdHJ1Y3Qgc3BpX3RyYW5zZmVyIGluZGV4X3hm
ZXIgPSB7Cj4gKwkJLmxlbgkJPSAzLAo+ICsJCS5jc19jaGFuZ2UJPSAxLAo+ICsJfTsKPiArCXN0
cnVjdCBzcGlfdHJhbnNmZXIgdmFsdWVfeGZlciA9IHsKPiArCQkubGVuCQk9IDMsCj4gKwl9Owo+
ICsJdTgJYnVmZmVyWzE2XTsKPiArCj4gKwlzcGlfbWVzc2FnZV9pbml0KCZtc2cpOwo+ICsKPiAr
CS8qIHJlZ2lzdGVyIGluZGV4ICovCj4gKwlidWZmZXJbMF0gPSAweDcwOwo+ICsJYnVmZmVyWzFd
ID0gMHgwMDsKPiArCWJ1ZmZlclsyXSA9IHJlZyAmIDB4N2Y7Cj4gKwlpbmRleF94ZmVyLnR4X2J1
ZiA9IGJ1ZmZlcjsKPiArCXNwaV9tZXNzYWdlX2FkZF90YWlsKCZpbmRleF94ZmVyLCAmbXNnKTsK
PiArCj4gKwkvKiByZWdpc3RlciB2YWx1ZSAqLwo+ICsJYnVmZmVyWzRdID0gMHg3MjsKPiArCWJ1
ZmZlcls1XSA9IHZhbCA+PiA4Owo+ICsJYnVmZmVyWzZdID0gdmFsOwo+ICsJdmFsdWVfeGZlci50
eF9idWYgPSBidWZmZXIgKyA0Owo+ICsJc3BpX21lc3NhZ2VfYWRkX3RhaWwoJnZhbHVlX3hmZXIs
ICZtc2cpOwo+ICsKPiArCXJldHVybiBzcGlfc3luYyhsY2QtPnNwaSwgJm1zZyk7Cj4gK30KCkp1
c3QgYSBub3RlIHRvIFNhbToKVGhpcyBpcyB0aGUgc2FtZSBzcGkgcHJvdG9jb2wgdGhhdCB0aGUg
aWxpOTMyNSBjb250cm9sbGVyIG9uIHRoZSBoeTI4YgpwYW5lbCB1c2VzLgoKSSByZW1lbWJlcmVk
IHRoYXQgSSBoYXZlIGV4cGVyaW1lbnRlZCB3aXRoIGEgcmVnbWFwIGltcGxlbWVudGF0aW9uOgpo
dHRwczovL2dpdGh1Yi5jb20vbm90cm8vdGlueWRybS9ibG9iL21hc3Rlci90aW55ZHJtLWlsaTkz
MjUuYyNMMTkxCgpOb3JhbGYuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
