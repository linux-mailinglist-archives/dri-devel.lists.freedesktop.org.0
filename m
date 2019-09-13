Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F535B2848
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 00:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E006F47E;
	Fri, 13 Sep 2019 22:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504AA6F47E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 22:21:48 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C0A89C0BBE3C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 22:21:47 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id h18so33130098qto.18
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 15:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=JP4jP6mpEPQIK7y8sW6Sm0fCYeb5xv15y7wA/cmFkyw=;
 b=e3XWkzE4UDegEuk9Rnygg+V0VnW0w97QUvX2LLSMGbBPfGg8hKMEqsUcDE1JekzHa6
 ViVCFQI+pUj2NGQxMLKKclYFhYar1K2mp+m2e0xP+JJy3j37XiYY2uXIsbLaixFO9SOq
 38g87f4kXbqVvo6j0EsdcpVN6ggwNzQIY9UjG7/tQzcXVjeCPnu9/t4tOpJGtpV4jZ+A
 E+LKoxDB825XErvPOGE2ugP9f0nZY19vXYUt96xOYAbjdc/8CZ03f1X+kU7jF7DJcIrC
 CRTuA//TKR4qjSoKS7goqzxN0lcv2iPn1GzupO1tZwIcmldvT7TXOI+fZ26tcToA6q9e
 KQvw==
X-Gm-Message-State: APjAAAUlPAxSGrwMDpyumhEcAFibKPBS5pBArnt1jcW2+gXcOHJbQE5P
 tOrA9NAbP0ahguk8PB8j7S5YYmLDdmhrc26kshr2vOf3JQi/cAA3ykmdE2g9Ztd6aILYp2c5sHl
 yVF2C2vEq23GjYEvDVw/iAeg0IIwS
X-Received: by 2002:ac8:760e:: with SMTP id t14mr5745154qtq.175.1568413307110; 
 Fri, 13 Sep 2019 15:21:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNcQUL3hq0iC38keGiPsp4lrFZMdU6Rmc/zogZLcerutTN40gUktNk6Sbz0VYRaa1/dEvUsg==
X-Received: by 2002:ac8:760e:: with SMTP id t14mr5745135qtq.175.1568413306922; 
 Fri, 13 Sep 2019 15:21:46 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id 60sm14417517qta.77.2019.09.13.15.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 15:21:46 -0700 (PDT)
Message-ID: <648aabc005e7cffa50060cd60452135a1a4d7818.camel@redhat.com>
Subject: Re: [PATCH 2/4] drm/nouveau: dispnv50: Remove nv50_mstc_best_encoder()
From: Lyude Paul <lyude@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 13 Sep 2019 18:21:44 -0400
In-Reply-To: <CAKb7UvgQE0UDTvvhbq4FgtgOWjvXDDKSZs8RSLA-ECa2YZiFLA@mail.gmail.com>
References: <20190913220355.6883-1-lyude@redhat.com>
 <20190913220355.6883-2-lyude@redhat.com>
 <CAKb7UvgQE0UDTvvhbq4FgtgOWjvXDDKSZs8RSLA-ECa2YZiFLA@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA5LTEzIGF0IDE4OjIwIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiBP
biBGcmksIFNlcCAxMywgMjAxOSBhdCA2OjA1IFBNIEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+IHdyb3RlOgo+ID4gV2hlbiBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcy0+YXRvbWljX2Jl
c3RfZW5jb2RlciBpcyBkZWZpbmVkLAo+ID4gLT5iZXN0X2VuY29kZXIgaXMgaWdub3JlZCBib3Ro
IGJ5IHRoZSBhdG9taWMgbW9kZXNldHRpbmcgaGVscGVycy4gVGhhdAo+IAo+IEJ5IGJvdGggdGhl
IGF0b21pYyBtb2Rlc2V0dGluZyBoZWxwZXJzIGFuZCAuLi4gKHVzdWFsbHkgImJvdGgiIGltcGxp
ZXMgMgo+IHRoaW5ncykKCmdvb2QgY2F0Y2gsIHdpbGwgZml4IGFuZCByZXNwaW4gaW4gYSBtb21l
bnQKPiAKPiA+IGJlaW5nIHNhaWQsIHRoaXMgaG9vayBpcyBjb21wbGV0ZWx5IGJyb2tlbiBhbnl3
YXkgLSBpdCBhbHdheXMgcmV0dXJucwo+ID4gdGhlIGZpcnN0IG1zdG8gZm9yIGEgZ2l2ZW4gbXN0
YywgZGVzcGl0ZSB0aGUgZmFjdCBpdCBtaWdodCBhbHJlYWR5IGJlIGluCj4gPiB1c2UuCj4gPiAK
PiA+IFNvLCBqdXN0IGdldCByaWQgb2YgaXQuIFdlJ2xsIG5lZWQgdGhpcyBpbiBhIG1vbWVudCBh
bnl3YXksIHdoZW4gd2UgbWFrZQo+ID4gbXN0b3MgcGVyLWhlYWQgYXMgb3Bwb3NlZCB0byBwZXIt
Y29ubmVjdG9yLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlz
cC5jIHwgOSAtLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3Au
Ywo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiA+IGluZGV4
IGI0NmJlOGEwOTFlOS4uYTNmMzUwZmRmYThjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiA+IEBAIC05MjAsMTQgKzkyMCw2IEBAIG52NTBfbXN0Y19h
dG9taWNfYmVzdF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yCj4gPiAqY29ubmVjdG9yLAo+
ID4gICAgICAgICByZXR1cm4gJm1zdGMtPm1zdG0tPm1zdG9baGVhZC0+YmFzZS5pbmRleF0tPmVu
Y29kZXI7Cj4gPiAgfQo+ID4gCj4gPiAtc3RhdGljIHN0cnVjdCBkcm1fZW5jb2RlciAqCj4gPiAt
bnY1MF9tc3RjX2Jlc3RfZW5jb2RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+
ID4gLXsKPiA+IC0gICAgICAgc3RydWN0IG52NTBfbXN0YyAqbXN0YyA9IG52NTBfbXN0Yyhjb25u
ZWN0b3IpOwo+ID4gLQo+ID4gLSAgICAgICByZXR1cm4gJm1zdGMtPm1zdG0tPm1zdG9bMF0tPmVu
Y29kZXI7Cj4gPiAtfQo+ID4gLQo+ID4gIHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cwo+ID4g
IG52NTBfbXN0Y19tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4g
PiAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiA+
IEBAIC05OTAsNyArOTgyLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hl
bHBlcl9mdW5jcwo+ID4gIG52NTBfbXN0Y19oZWxwID0gewo+ID4gICAgICAgICAuZ2V0X21vZGVz
ID0gbnY1MF9tc3RjX2dldF9tb2RlcywKPiA+ICAgICAgICAgLm1vZGVfdmFsaWQgPSBudjUwX21z
dGNfbW9kZV92YWxpZCwKPiA+IC0gICAgICAgLmJlc3RfZW5jb2RlciA9IG52NTBfbXN0Y19iZXN0
X2VuY29kZXIsCj4gPiAgICAgICAgIC5hdG9taWNfYmVzdF9lbmNvZGVyID0gbnY1MF9tc3RjX2F0
b21pY19iZXN0X2VuY29kZXIsCj4gPiAgICAgICAgIC5hdG9taWNfY2hlY2sgPSBudjUwX21zdGNf
YXRvbWljX2NoZWNrLAo+ID4gIH07Cj4gPiAtLQo+ID4gMi4yMS4wCj4gPiAKLS0gCkNoZWVycywK
CUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
