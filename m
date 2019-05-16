Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3E420F91
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 22:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2CE897D7;
	Thu, 16 May 2019 20:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E14897D4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 20:23:21 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id g190so3117857qkf.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 13:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=uxykAAzQRsmMaS6DXPCCDwV3sMvf0BaFhOqskBdVja8=;
 b=NKBzDPAC0D4VqR2mnakGpyPPg5qKSdnf1X6262T0zzELY0+tKBm/BXpgU5T5SxsNmA
 41lgqyOnH4xJVJZWtetQFBQiXbeyOPhvWAYTawSPnaKpzrWA6uoXkIMg1FjiTcUQSWEF
 el69y2aEP2N1sm0f3wf75rArv2I79WBWBMBAlzB1QqXrmDzhxeKvvOX3oe7SZk/DHs1f
 Ix5PkUKj5xbhVW40UeuCNFEL28NA2rW5ZWzzodiKZF8DDAHQx+LCFwp8zhDIamuuMGyh
 aMwfBiHWrRlWBh3byYLLgO9/FiC84u5P0gm7Lg9i61oqGZoDCda+Tn8DdR2ixBsfv2r3
 52uA==
X-Gm-Message-State: APjAAAUGPFRcSloJPxuSNisI5NPt5Lh8lNxafd+40AAEqHB3edB36xwS
 +XTy1NMv5EB+/MApyhs7LtLAEA==
X-Google-Smtp-Source: APXvYqxMksDRHnFZAAQpXN4QQrZLv1US1+olP6pVlQdynYnNTAq2VvAFJrnqS5zX19frBd0Lu2ZX1w==
X-Received: by 2002:a37:a28c:: with SMTP id l134mr38026973qke.43.1558038200549; 
 Thu, 16 May 2019 13:23:20 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id v13sm3125502qkj.3.2019.05.16.13.23.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 16 May 2019 13:23:19 -0700 (PDT)
Message-ID: <f6ad38b6c714c24cfce32f2c51969ee651bd7699.camel@redhat.com>
Subject: Re: [PATCH 3/7] drm/dp-mst: Use connector kdev as aux device parent
From: Lyude Paul <lyude@redhat.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 16 May 2019 16:23:18 -0400
In-Reply-To: <1558019883-12397-4-git-send-email-sunpeng.li@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
 <1558019883-12397-4-git-send-email-sunpeng.li@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA1LTE2IGF0IDExOjE3IC0wNDAwLCBzdW5wZW5nLmxpQGFtZC5jb20gd3Jv
dGU6Cj4gRnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4gCj4gUGxhY2luZyB0aGUg
TVNUIGF1eCBkZXZpY2UgYXMgYSBjaGlsZCBvZiB0aGUgY29ubmVjdG9yIGdpdmVzIHVkZXYgdGhl
Cj4gYWJpbGl0eSB0byBhY2Nlc3MgdGhlIGNvbm5lY3RvciBkZXZpY2UncyBhdHRyaWJ1dGVzLiBU
aGlzIHdpbGwgY29tZSBpbgo+IGhhbmR5IHdoZW4gd3JpdGluZyB1ZGV2IHJ1bGVzIHRvIGNyZWF0
ZSBtb3JlIGRlc2NyaXB0aXZlIHN5bWxpbmtzIHRvIHRoZQo+IE1TVCBhdXggZGV2aWNlcy4KPiAK
PiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBD
YzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMZW8gTGkg
PHN1bnBlbmcubGlAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGluZGV4IDU0ZGE2OGUuLmNk
MmYzYzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBAQCAtMTI2
OSw2ICsxMjY5LDkgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2FkZF9wb3J0KHN0cnVjdCBkcm1fZHBf
bXN0X2JyYW5jaAo+ICptc3RiLAo+ICAJCX0KPiAgCQkoKm1zdGItPm1nci0+Y2JzLT5yZWdpc3Rl
cl9jb25uZWN0b3IpKHBvcnQtPmNvbm5lY3Rvcik7Cj4gIAo+ICsJCWlmIChwb3J0LT5jb25uZWN0
b3ItPnJlZ2lzdHJhdGlvbl9zdGF0ZSA9PQo+IERSTV9DT05ORUNUT1JfUkVHSVNURVJFRCkKPiAr
CQkJcG9ydC0+YXV4LmRldiA9IHBvcnQtPmNvbm5lY3Rvci0+a2RldjsKPiArCgpMaW5lIHdyYXBw
aW5nIHBsZWFzZSEgUHJvYmFibHkgd29ydGggcnVubmluZyBjaGVja3BhdGNoIG9uIGFsbCBvZiB0
aGVzZQpwYXRjaGVzIGFzIHdlbGwuCgpXaXRoIHRoYXQgbml0cGljayBhZGRyZXNzZWQ6CgpSZXZp
ZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCj4gIAkJZHJtX2RwX2F1eF9y
ZWdpc3Rlcl9kZXZub2RlKCZwb3J0LT5hdXgpOwo+ICAJfQo+ICAKLS0gCkNoZWVycywKCUx5dWRl
IFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
