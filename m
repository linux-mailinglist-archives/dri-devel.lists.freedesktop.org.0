Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0186C7A485
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 11:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B64F6E472;
	Tue, 30 Jul 2019 09:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55226E472
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 09:36:35 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p15so61913843eds.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 02:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=0QmT1gYb1PiOP1tMdK5PmxSWWAa2neZvxO84AYWTg38=;
 b=nhqdap5JN5dKUen6ZxsXoVM8LkEK2Dc5mZvE8xcxp0c5/7quV/0tdZ/gbjzOlk3hxo
 Wt+yeSm0Oaz03es3+2KkyyFf2C8IvmbPNpoiYnXHEFN+3kLnJzzezc5pyV+gVg3k0Azk
 hmE5xCaoTqbzmi3eiTmy2aS1NsnN0gMfZU05sJUXnV7tMBhBO6HHY/2wPC5KiMFfOfcI
 l1Q0HRr1h0Hf39UBCtgP9bZZB55wvEq93aO7hnAs7sQH46s7J2njUTgu/t/YSiMgMeFn
 NatTA6vwoUaXZpYhYZJzWWee79wbqp0HXxASLyxYhx0ws+Wslq25F9ym2rHW+UPtMrs0
 qXFA==
X-Gm-Message-State: APjAAAWG6y9kbwa2oiAUNqDFcROst1hFyBxzmZ1P9sRy/EGhlQptn1RN
 +HcmnT4SJiK1sBHehHtinpQ=
X-Google-Smtp-Source: APXvYqx1CO+nsWVaeovBaQ+nwWIdMuZL1wl2KOnCHzYOgTu2UA8wlc5VY3bTiM0AX5aAje7dgZlE9g==
X-Received: by 2002:a50:9167:: with SMTP id
 f36mr100638432eda.297.1564479394449; 
 Tue, 30 Jul 2019 02:36:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id i4sm11982979ejs.39.2019.07.30.02.36.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 02:36:33 -0700 (PDT)
Date: Tue, 30 Jul 2019 11:36:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: zhoucm1 <zhoucm1@amd.com>
Subject: Re: [PATCH] drm/syncobj: remove boring message
Message-ID: <20190730093631.GO15868@phenom.ffwll.local>
References: <20190729082039.23837-1-david1.zhou@amd.com>
 <20190730092728.GM15868@phenom.ffwll.local>
 <43e4a527-8895-c958-5717-b1f7530571d7@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43e4a527-8895-c958-5717-b1f7530571d7@amd.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=0QmT1gYb1PiOP1tMdK5PmxSWWAa2neZvxO84AYWTg38=;
 b=V3uWv69vkLD0ru4xET1u9pVpbNAWjXDqUk4xa8q1PbEsQyufnfcLidY4Kyb+ulQIhE
 AVijkEYHuADIHwzSA09enZFsO+kA5LLwKXuNcrqsv/HCnJfVTaJxzXTCn/B3G4txpGh+
 uAzy3bpGOhPCb0xJngEcl/vxXhNpiLbaMrm5A=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDU6MzE6MjZQTSArMDgwMCwgemhvdWNtMSB3cm90ZToK
PiAKPiAKPiBPbiAyMDE55bm0MDfmnIgzMOaXpSAxNzoyNywgRGFuaWVsIFZldHRlciB3cm90ZToK
PiA+IE9uIE1vbiwgSnVsIDI5LCAyMDE5IGF0IDA0OjIwOjM5UE0gKzA4MDAsIENodW5taW5nIFpo
b3Ugd3JvdGU6Cj4gPiA+IEl0IGlzIG5vcm1hbCB0aGF0IGJpbmFyeSBzeW5jb2JqIHJlcGxhY2Vz
IHRoZSB1bmRlcmx5aW5nIGZlbmNlLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bm1p
bmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KPiA+IERvIHdlIGhpdCB0aGlzIHdpdGggb25l
IG9mIHRoZSBzeW5jb2JqIGlndHM/Cj4gVW5mb3J0dXJuYXRlbHksIE5vLCBJdCdzIG9ubHkgaGl0
IGluIEFNREdQVSBwYXRoLCB3aGljaCBjb21iaW5lcyB0aW1lbGluZQo+IGFuZCBiaW5hcnkgdG8g
c2FtZSBwYXRoIHdoZW4gdGltZWxpbmUgaXMgZW5hYmxlZC4KCkxvb2tzIGxpa2UgbGlvbmVsIGhh
cyBzb21ldGhpbmcsIG1heWJlIGhlbHAgcmV2aWV3IHRoYXQ/Ci1EYW5pZWwKCj4gCj4gLURhdmlk
Cj4gPiAtRGFuaWVsCj4gPiAKPiA+ID4gLS0tCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9z
eW5jb2JqLmMgfCAzIC0tLQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+
ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPiA+ID4gaW5kZXggOTI5ZjdjNjRmOWEyLi5i
YzdlYzE2NzllNGQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29i
ai5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCj4gPiA+IEBAIC0x
NTEsOSArMTUxLDYgQEAgdm9pZCBkcm1fc3luY29ial9hZGRfcG9pbnQoc3RydWN0IGRybV9zeW5j
b2JqICpzeW5jb2JqLAo+ID4gPiAgIAlzcGluX2xvY2soJnN5bmNvYmotPmxvY2spOwo+ID4gPiAg
IAlwcmV2ID0gZHJtX3N5bmNvYmpfZmVuY2VfZ2V0KHN5bmNvYmopOwo+ID4gPiAtCS8qIFlvdSBh
cmUgYWRkaW5nIGFuIHVub3JkZXIgcG9pbnQgdG8gdGltZWxpbmUsIHdoaWNoIGNvdWxkIGNhdXNl
IHBheWxvYWQgcmV0dXJuZWQgZnJvbSBxdWVyeV9pb2N0bCBpcyAwISAqLwo+ID4gPiAtCWlmIChw
cmV2ICYmIHByZXYtPnNlcW5vID49IHBvaW50KQo+ID4gPiAtCQlEUk1fRVJST1IoIllvdSBhcmUg
YWRkaW5nIGFuIHVub3JkZXIgcG9pbnQgdG8gdGltZWxpbmUhXG4iKTsKPiA+ID4gICAJZG1hX2Zl
bmNlX2NoYWluX2luaXQoY2hhaW4sIHByZXYsIGZlbmNlLCBwb2ludCk7Cj4gPiA+ICAgCXJjdV9h
c3NpZ25fcG9pbnRlcihzeW5jb2JqLT5mZW5jZSwgJmNoYWluLT5iYXNlKTsKPiA+ID4gLS0gCj4g
PiA+IDIuMTcuMQo+ID4gPiAKPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiA+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
