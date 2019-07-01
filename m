Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886B85B476
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 08:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9476D89C51;
	Mon,  1 Jul 2019 06:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A0D89C51
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 06:05:28 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A9DF180348;
 Mon,  1 Jul 2019 08:05:25 +0200 (CEST)
Date: Mon, 1 Jul 2019 08:05:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v1 02/33] drm/xen: drop use of drmP.h
Message-ID: <20190701060524.GA28256@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-3-sam@ravnborg.org>
 <7c758e43-048b-d094-bced-9d171987538f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c758e43-048b-d094-bced-9d171987538f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=DBfv99YmAAAA:8
 a=aR67VJ1aXLT0C52FwhAA:9 a=CjuIK1q_8ugA:10 a=c73wXdw0ADZYY2z2LwuN:22
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
Cc: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgT2xla3NhbmRyCgo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250
LmgKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5oCj4gPiBAQCAt
MTEsMTMgKzExLDE5IEBACj4gPiAgICNpZm5kZWYgX19YRU5fRFJNX0ZST05UX0hfCj4gPiAgICNk
ZWZpbmUgX19YRU5fRFJNX0ZST05UX0hfCj4gPiAtI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gPiAt
I2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaD4KPiA+IC0KPiA+ICAgI2luY2x1
ZGUgPGxpbnV4L3NjYXR0ZXJsaXN0Lmg+Cj4gPiArI2luY2x1ZGUgPGRybS9kcm1fY29ubmVjdG9y
Lmg+Cj4gPiArI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaD4KPiA+ICsjaW5j
bHVkZSA8ZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5oPgo+IG5vIG5lZWQgdG8gaW5jbHVkZSB0
d2ljZQo+IHdpdGggdGhhdCBmaXhlZDoKPiBBY2tlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgoKVXBzLCB0aGFua3MgZm9yIHNw
b3R0aW5nIHRoaXMuIFdpbGwgcnVuIHRoZSBjaGVja2luY2x1ZGUgc2NyaXB0IHRvIGNoZWNrCmlm
IHRoZXJlIGFyZSBtb3JlIGR1cGxpY2F0ZXMgYWRkZWQgYnkgYWNjaWRlbnQuCgoJU2FtCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
