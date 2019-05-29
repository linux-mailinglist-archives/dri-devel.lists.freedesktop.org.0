Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16792DEC2
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 15:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC98989FA6;
	Wed, 29 May 2019 13:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E110289FA6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 13:45:14 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g24so3846595eds.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 06:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZTPPI20oUD1qingD6qF7lU+MQrecPB2cQwhMDBXiyAM=;
 b=UlTXwwR7MbwZ/xGIiE1CARvsXgBoz3vBlmvYLkRclNv5ISrzEirV7dLpgFEqiAU64v
 3Km+5KU9olQ6sNHHVLJm8GAUlTM/EUUcJT0Z2CAadM6wYzmILfhijFeMCootsEHvksI+
 RYqiPQ2X9V2VjJf/GA5EkqQMlMiveo45z80Q1sUv3ioCk26LBECOCk9kHHThUURJ7UO2
 EPxm6NSIatJI+Bq0P8+Is3IBsZvAp1VB1ONHLA9XAL5sid6PV8jpDO5pmISoip2Ynf/F
 d19/C5r/5dWTKURqurggNXJ1oLAC6zlJ0Dbg9Oo3aZztDMdZD0IUcevZLWIq0ng18OlO
 w7YQ==
X-Gm-Message-State: APjAAAXf5Sz0g2plxOGS0gtygjdP/kEDU986cmtcc4GkQ8AkGBj72Zp+
 O8v9jNSqwXMr7WZbRjgYmXAUSkFQF+o=
X-Google-Smtp-Source: APXvYqyAjZqrA+ir+zOARhE1ha2g8+/HMrVPFI4b/hNrD/NLtu/0McadyR1Mpukdf+OHP45lZKeytQ==
X-Received: by 2002:aa7:d444:: with SMTP id q4mr32111400edr.302.1559137513562; 
 Wed, 29 May 2019 06:45:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id l43sm5236914eda.70.2019.05.29.06.45.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 May 2019 06:45:12 -0700 (PDT)
Date: Wed, 29 May 2019 15:45:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] Various clean-up patches for GEM VRAM
Message-ID: <20190529134509.GV21222@phenom.ffwll.local>
References: <20190521110831.20200-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521110831.20200-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZTPPI20oUD1qingD6qF7lU+MQrecPB2cQwhMDBXiyAM=;
 b=P8YD3NHagxq+7fD0LJp2S4nnlD6qFBZCC5mwYUKNAD9x7/wEb2LrjgMakNMF/AVI7b
 FXJbM1bKsWtEjtf9AnIilL98FuGK/nS8QD8+jYyoYxRQ3vk1kEgdQiGaKe1Q6XqbyqTU
 ge9e8B6krv2Xkjr+MFI24DXgCNHRkkvntsGoY=
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, ray.huang@amd.com,
 kraxel@redhat.com, sam@ravnborg.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDE6MDg6MjhQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gUmVwbGFjaW5nIGRybV9nZW1fdnJhbV9wdXNoX3RvX3N5c3RlbSgpIG1vdmVz
IHBvbGljeSBmcm9tIGRyaXZlcnMgYmFjawo+IHRvIHRoZSBtZW1vcnkgbWFuYWdlci4gTm93LCB1
bnVzZWQgQk9zIGFyZSBvbmx5IGV2aWN0ZWQgd2hlbiB0aGUgc3BhY2UKPiBpcyByZXF1aXJlZC4K
PiAKPiBUaGUgbG9jay91bmxvY2stcmVuYW1pbmcgcGF0Y2ggYWxpZ25zIHRoZSBpbnRlcmZhY2Ug
d2l0aCBvdGhlciBuYW1lcwo+IGluIERSTS4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGFyZSBkb25l
Lgo+IAo+IEZpbmFsbHksIHRoZXJlJ3Mgbm93IGEgbG9ja2RlcCBhc3NlcnQgdGhhdCBlbnN1cmVz
IHdlIGRvbid0IGNhbGwgdGhlCj4gR0VNIFZSQU0gX2xvY2tlZCgpIGZ1bmN0aW9ucyB3aXRoIGFu
IHVubG9ja2VkIEJPLgo+IAo+IFBhdGNoZXMgYXJlIGFnYWluc3QgYSByZWNlbnQgZHJtLXRpcCBh
bmQgdGVzdGVkIG9uIG1nYWcyMDAgYW5kIGFzdCBIVy4KPiAKPiBUaG9tYXMgWmltbWVybWFubiAo
Myk6Cj4gICBkcm06IFJlcGxhY2UgZHJtX2dlbV92cmFtX3B1c2hfdG9fc3lzdGVtKCkgd2l0aCBr
dW5tYXAgKyB1bnBpbgo+ICAgZHJtOiBSZW5hbWUgcmVzZXJ2ZS91bnJlc2VydmUgdG8gbG9jay91
bmxvY2sgaW4gR0VNIFZSQU0gaGVscGVycwo+ICAgZHJtOiBBc3NlcnQgdGhhdCBCTyBpcyBsb2Nr
ZWQgaW4gZHJtX2dlbV92cmFtX3twaW4sdW5waW59X2xvY2tlZCgpCgokIG1ha2UgaHRtbGRvY3MK
CnJlc3VsdHMgaW4gbmV3IHdhcm5pbmdzOgoKLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFt
X2hlbHBlci5jOjU5NTogd2FybmluZzogY2Fubm90IHVuZGVyc3RhbmQgZnVuY3Rpb24gcHJvdG90
eXBlOiAnY29uc3Qgc3RydWN0IGRybV92cmFtX21tX2Z1bmNzIGRybV9nZW1fdnJhbV9tbV9mdW5j
cyA9ICcKLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jOjU5Njogd2Fybmlu
ZzogY2Fubm90IHVuZGVyc3RhbmQgZnVuY3Rpb24gcHJvdG90eXBlOiAnY29uc3Qgc3RydWN0IGRy
bV92cmFtX21tX2Z1bmNzIGRybV9nZW1fdnJhbV9tbV9mdW5jcyA9ICcKCllvdSBtaWdodCB3YW50
IHRvIHJldmlldyB0aGUgZW50aXJlIG91dHB1dCBhbmQgbWFrZSBzdXJlIGFsbCB0aGUgbGlua3MK
d29yayBhbmQgZXZlcnl0aGluZyBsb29rcyBwcmV0dHkgYW5kIHJlYXNvbmFibGUuCgpUaGFua3Ms
IERhbmllbAo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9mYi5jICAgICAgICAgICAgIHwg
MTEgKystCj4gIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyAgICAgICAgICAgfCAyNiAr
KysrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgICAgfCA4NiAr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV92cmFtX2hlbHBl
cl9jb21tb24uYyB8ICAyIC0KPiAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9jdXJz
b3IuYyB8IDQwICsrKysrLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
ZmIuYyAgICAgfCAxMSArKy0KPiAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2Rl
LmMgICB8IDE1ICsrKy0tCj4gIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAgICAg
ICAgfCAgOSArKy0KPiAgOCBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspLCAxMjAgZGVs
ZXRpb25zKC0pCj4gCj4gLS0KPiAyLjIxLjAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
