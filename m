Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45297AB02
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 16:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676446E575;
	Tue, 30 Jul 2019 14:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D326E575
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 14:30:28 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:63462
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hsT90-0006uj-DV; Tue, 30 Jul 2019 16:30:26 +0200
Subject: Re: [RFC 4/4] drm/panel/ili9341: Support mi0283qt
To: dri-devel@lists.freedesktop.org
References: <20190729195526.13337-1-noralf@tronnes.org>
 <20190729195526.13337-5-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <ae0a000f-df7e-6c08-9a50-a5ed22a2845e@tronnes.org>
Date: Tue, 30 Jul 2019 16:30:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729195526.13337-5-noralf@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=EVs1UQ1hhFQRFHkJh+Hwv6WzL8q9zeq8EQYdpLsKTk0=; 
 b=k5KJyTOZ0Xh5j0leOek4N22gbDXNY96f9zJQBPXudFMXrD6UuN7LcsSc1CFzMYL/J9HnSNpyubwASbsJJKQddCkzYBahB17xB8/XeRxACH+G5RydXeKslzS2D2uaDh+dL7xHvk1XuiVXsNwabWjY8dUelxcH+xJ6j5uw+GxAlHIivPmhFyhQ+v4JK7ejembbDVSRjtC2AOrYU7NGNbGZseC41Wrq75ZRZLCc3GXH7HIUFK8ZHy7dZH7MwssbH2ejWcwEpfVX7pEfjWPZ4XV/gcIggW0xVJ8Jhee+yOpw0q7hQjorAg6W8fSXrKz9D9acB+QF+J+0fL6me9cE0CVhwQ==;
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
Cc: daniel.vetter@ffwll.ch, josef@lusticky.cz, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjkuMDcuMjAxOSAyMS41NSwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IFNpZ25lZC1v
ZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTkzNDEuYyB8IDE3OSArKysrKysrKysr
KysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNzAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKPiAKCkkgaGF2ZSByZWFsaXNlZCB0aGF0IHRoaXMgd2lsbCBjaGFuZ2UgdGhlIERSTSBk
cml2ZXIgbmFtZSBmcm9tIG1pMDI4M3F0CnRvIGRybV9taXBpX2RiaS4gVGhpcyBtZWFucyB0aGF0
IHRoaXMgcGFuZWwgd2lsbCBsb29zZSBpdHMgTUVTQSBrbXNyb1sxXQpzdXBwb3J0LiBJIGhhdmVu
J3QgdHJpZWQgaXQsIGJ1dCB0aGlzIGlzIHRoZSBmaXJzdCB0aGluZyB0aGF0IGdpdmVzIHRoaXMK
ZHJpdmVyIGFueSByZWFsIGFkdmFudGFnZSBvdmVyIGl0cyBmYmRldiBjb3VudGVycGFydCBpbgpk
cml2ZXJzL3N0YWdpbmcvZmJ0ZnQsIHNvIEkgZG9uJ3Qgd2FudCB0byBsb29zZSB0aGF0LgpTbyBl
dmVuIGlmIE1JUEkgREJJIHBhbmVsIHN1cHBvcnQgaXMgaW1wbGVtZW50ZWQgaW4gc29tZSBmb3Jt
LCBJIHdpbGwKd2FpdCB3aXRoIGNvbnZlcnRpbmcgbWkwMjgzcXQgdW50aWwgc29tZW9uZSBoYXMg
dXBkYXRlZCB0aGUga21zcm8gZHJpdmVyLgoKTm9yYWxmLgoKWzFdCmh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvdHJlZS9tYXN0ZXIvc3JjL2dhbGxpdW0vd2luc3lzL2tt
c3JvL2RybQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhL2Jsb2IvbWFz
dGVyL3NyYy9nYWxsaXVtL3RhcmdldHMvZHJpL3RhcmdldC5jCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
