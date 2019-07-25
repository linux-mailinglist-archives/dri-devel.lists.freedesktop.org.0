Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDA175932
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 22:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898AD6E830;
	Thu, 25 Jul 2019 20:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0876E82F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 20:57:33 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m14so11835256qka.10
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 13:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=oyyVDLtSZBteJgiJ5qanNs/rGWAtE71AHxgVyXgi7a8=;
 b=egLl3x+f8GgzFERqfJF+KcOssf/pDV/VjOEbwmEk+ZhbnUpXC7yA2NCaMJXkhHvw1v
 5mFOubMmR+3L1MB3igQXY4JLIoXlNvyPGHa45RmLs/xCFjHOeXHeZWSn6JEH24P997Hr
 JWc80gQozi1GQ+2JAZw5VjhenYxrofGkWrRqN8CuYHBLv7jePdH16u40QeeEcHyXp713
 5dqkvp1wkiwmWrTzY1LPSoOIPtFX/IQkjmcBqG4f23zb030+olenKzw59Y+JwTCr7cUO
 NZdHVOYBbp0apmd550LK7n6JelUMuxtG3prqhNu6x4IGT2AA8NegiUGrn5sU6LUskKTU
 8XVA==
X-Gm-Message-State: APjAAAXlHoVwoSJXLiYwgKqfTa8Vuz3PAJkIh4olK9Gob+KfikMof3Hz
 0pA9Wj46EGbDdgrkZP+TZvhHLw==
X-Google-Smtp-Source: APXvYqxioKJamfyzYpmUAZdaVZXNEh/ZwitsRWtifNj2lm2pKxdG9q2ec5jqAB2M8cDVH94aNOEbSA==
X-Received: by 2002:a05:620a:16d6:: with SMTP id
 a22mr60439956qkn.414.1564088252333; 
 Thu, 25 Jul 2019 13:57:32 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id j66sm22038385qkf.86.2019.07.25.13.57.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 13:57:31 -0700 (PDT)
Message-ID: <02841854e062924edf875b0c43e4c89513a13e74.camel@redhat.com>
Subject: Re: [PATCH 7/9] drm/nouveau/kms/nv50: Implement MST Aux device
 registration
From: Lyude Paul <lyude@redhat.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 25 Jul 2019 16:57:30 -0400
In-Reply-To: <20190723232808.28128-8-sunpeng.li@amd.com>
References: <20190723232808.28128-1-sunpeng.li@amd.com>
 <20190723232808.28128-8-sunpeng.li@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
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
Cc: nicholas.kazlauskas@amd.com, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V29ya3MgcGVyZmVjdGx5IGhlcmUsIGFuZCBubyB3YXJuaW5ncyAoYXQgbGVhc3Qgbm90IGFueSB0
aGF0IGFyZSByZWxldmFudCB0bwp0aGlzIHBhdGNoIHNlcmllcyA6KSB3aGVuIHJlbG9hZGluZyBu
b3V2ZWF1LgoKUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBU
dWUsIDIwMTktMDctMjMgYXQgMTk6MjggLTA0MDAsIHN1bnBlbmcubGlAYW1kLmNvbSB3cm90ZToK
PiBGcm9tOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiAKPiBJbXBsZW1lbnQgbGF0ZV9y
ZWdpc3RlciBhbmQgZWFybHlfdW5yZWdpc3RlciBob29rcyBmb3IgTVNUIGNvbm5lY3RvcnMuCj4g
Q2FsbCBkcm0gaGVscGVycyBmb3IgTVNUIGNvbm5lY3RvciByZWdpc3RyYXRpb24sIHdoaWNoIHJl
Z2lzdGVycyB0aGUKPiBBVVggZGV2aWNlcy4KPiAKPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0By
ZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCAyMCArKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwo+IGluZGV4IDg0OTc3Njhm
MWI0MS4uMGQ2ZTkzNTBiYTQ0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2Rpc3AuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUw
L2Rpc3AuYwo+IEBAIC0xMDI0LDYgKzEwMjQsMjQgQEAgbnY1MF9tc3RjX2Rlc3Ryb3koc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAgCWtmcmVlKG1zdGMpOwo+ICB9Cj4gIAo+ICtz
dGF0aWMgaW50Cj4gK252NTBfbXN0Y19sYXRlX3JlZ2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IpCj4gK3sKPiArCXN0cnVjdCBudjUwX21zdGMgKm1zdGMgPSBudjUwX21zdGMo
Y29ubmVjdG9yKTsKPiArCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQgPSBtc3RjLT5wb3J0
Owo+ICsKPiArCXJldHVybiBkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKGNvbm5l
Y3RvciwgcG9ydCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkCj4gK252NTBfbXN0Y19lYXJseV91
bnJlZ2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gK3sKPiArCXN0cnVj
dCBudjUwX21zdGMgKm1zdGMgPSBudjUwX21zdGMoY29ubmVjdG9yKTsKPiArCXN0cnVjdCBkcm1f
ZHBfbXN0X3BvcnQgKnBvcnQgPSBtc3RjLT5wb3J0Owo+ICsKPiArCWRybV9kcF9tc3RfY29ubmVj
dG9yX2Vhcmx5X3VucmVnaXN0ZXIoY29ubmVjdG9yLCBwb3J0KTsKPiArfQo+ICsKPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzCj4gIG52NTBfbXN0YyA9IHsKPiAgCS5y
ZXNldCA9IG5vdXZlYXVfY29ubl9yZXNldCwKPiBAQCAtMTAzNCw2ICsxMDUyLDggQEAgbnY1MF9t
c3RjID0gewo+ICAJLmF0b21pY19kZXN0cm95X3N0YXRlID0gbm91dmVhdV9jb25uX2F0b21pY19k
ZXN0cm95X3N0YXRlLAo+ICAJLmF0b21pY19zZXRfcHJvcGVydHkgPSBub3V2ZWF1X2Nvbm5fYXRv
bWljX3NldF9wcm9wZXJ0eSwKPiAgCS5hdG9taWNfZ2V0X3Byb3BlcnR5ID0gbm91dmVhdV9jb25u
X2F0b21pY19nZXRfcHJvcGVydHksCj4gKwkubGF0ZV9yZWdpc3RlciA9IG52NTBfbXN0Y19sYXRl
X3JlZ2lzdGVyLAo+ICsJLmVhcmx5X3VucmVnaXN0ZXIgPSBudjUwX21zdGNfZWFybHlfdW5yZWdp
c3RlciwKPiAgfTsKPiAgCj4gIHN0YXRpYyBpbnQKLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
