Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9158AC06F8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 16:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51EE6E89E;
	Fri, 27 Sep 2019 14:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67746E89E;
 Fri, 27 Sep 2019 14:06:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o18so2854211wrv.13;
 Fri, 27 Sep 2019 07:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZyHHXgc6Q6QHdwP79gBuKFm4KM2rxomgIQZLm0ILgc=;
 b=oJhwJ8/gvygWBqmcTKwG/52VpSOJjZ0riI7q6B/bf196TMxlUmYqxEVnxWg1JIWjb7
 3uHOWzv4VLy4aQPM1T2P+lBH9ihNnhWzDXdi4jMIRFXwI/DF4rV6WQFUUAggL1MVqIqo
 4ZGQicVsybjBX1W3N0KJJYN+sSaPC39ijMyKQUapRZW4vukIMW4lZ7mdKC9FVjU8g8DK
 TZ6WQ3PEp7U62iM96HI/7g3XQS2NYehSl3o2iSr23V4zYukAxJCEqTdmxmSBc5CgiowR
 2vx4nx6GCcMA1Cg5NQJ2hGCzGCb4EFKYz+59JUy/Zg+bwuZ2vWkw50P9pt66hiAyggYI
 YJVw==
X-Gm-Message-State: APjAAAWe3eZ5k63oMZInPvjbJRBr0ScGtEkSzMQGB8qedEqEAYgw68D+
 aajH1XY1MNpkWqyvUV0tpp+R4XDWHhzoWH8lQhI=
X-Google-Smtp-Source: APXvYqxJDP+iWcLEunOVY11ZWBahFwsMraAVwibBnMf2OV10K3FY/tT4n0B0a3116No7g1Rg36LAk8AdRxg+iTTh3yI=
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr3146924wrn.40.1569593205209;
 Fri, 27 Sep 2019 07:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190926225122.31455-1-lyude@redhat.com>
 <20190926225122.31455-4-lyude@redhat.com>
In-Reply-To: <20190926225122.31455-4-lyude@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 27 Sep 2019 10:06:33 -0400
Message-ID: <CADnq5_NUkJxcdc4PFW6MNiDaVD7WR+_JtztOxFqWkkXaR2Br=A@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/amdgpu/dm/mst: Use ->atomic_best_encoder
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NZyHHXgc6Q6QHdwP79gBuKFm4KM2rxomgIQZLm0ILgc=;
 b=BTLnsP7dW8o4gwHZC4JoyArRZUQGEtx1FGV9PwHc3LuTfw1k2sbcRFk2KSXi23XVZr
 +RiZ+LdgyQO6DM+uiEwR+lBCfCDatjQgvjElYjbAj4qeCpq0rrn/zeehaEQ1tAf/Epav
 vrML0LRv82+mPY4f2XP+aaZf3y9jRCZqBb5UxxUUvnDwUyErgbC1X1wpmece42AXyKyk
 UM2v7Bc7NFkGS1qO0qdl4VhR67DrJ8vg9hKUj44sRToNMRmKF1QZZUV3GKF6dmhCToAw
 MahDlccmDua4sa2+UP+2ybRgTqmxN/OEftpRRhIJHEuueJyOnISJpstcrRNmSuRqy3ci
 VY+g==
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
Cc: Thomas Lim <Thomas.Lim@amd.com>, Leo Li <sunpeng.li@amd.com>,
 David Francis <David.Francis@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgNjo1MiBQTSBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPiB3cm90ZToKPgo+IFdlIGFyZSBzdXBwb3NlZCB0byBiZSBhdG9taWMgYWZ0ZXIgYWxsLiBX
ZSdsbCBuZWVkIHRoaXMgaW4gYSBtb21lbnQgZm9yCj4gdGhlIG5leHQgY29tbWl0Lgo+Cj4gU2ln
bmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCkFja2VkLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cgo+IC0tLQo+ICAuLi4vZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgICAgfCAxMCArKysrKy0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1fbXN0X3R5cGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbV9tc3RfdHlwZXMuYwo+IGluZGV4IGEzOThkZGQxZjMwNi4uZDkxMTNjZTBiZTA5
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtX21zdF90eXBlcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKPiBAQCAtMjQzLDE3ICsyNDMsMTcgQEAgc3Rh
dGljIGludCBkbV9kcF9tc3RfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpCj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiAtc3RhdGljIHN0cnVjdCBkcm1fZW5j
b2RlciAqZG1fbXN0X2Jlc3RfZW5jb2RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
KQo+ICtzdGF0aWMgc3RydWN0IGRybV9lbmNvZGVyICoKPiArZG1fbXN0X2F0b21pY19iZXN0X2Vu
Y29kZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubmVjdG9yX3N0YXRlKQo+
ICB7Cj4gLSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYW1kZ3B1X2RtX2Nvbm5l
Y3RvciA9IHRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsKPiAtCj4gLSAgICAgICBy
ZXR1cm4gJmFtZGdwdV9kbV9jb25uZWN0b3ItPm1zdF9lbmNvZGVyLT5iYXNlOwo+ICsgICAgICAg
cmV0dXJuICZ0b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3RvciktPm1zdF9lbmNvZGVyLT5i
YXNlOwo+ICB9Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBlcl9m
dW5jcyBkbV9kcF9tc3RfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyA9IHsKPiAgICAgICAgIC5nZXRf
bW9kZXMgPSBkbV9kcF9tc3RfZ2V0X21vZGVzLAo+ICAgICAgICAgLm1vZGVfdmFsaWQgPSBhbWRn
cHVfZG1fY29ubmVjdG9yX21vZGVfdmFsaWQsCj4gLSAgICAgICAuYmVzdF9lbmNvZGVyID0gZG1f
bXN0X2Jlc3RfZW5jb2RlciwKPiArICAgICAgIC5hdG9taWNfYmVzdF9lbmNvZGVyID0gZG1fbXN0
X2F0b21pY19iZXN0X2VuY29kZXIsCj4gIH07Cj4KPiAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2Vu
Y29kZXJfZGVzdHJveShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4gLS0KPiAyLjIxLjAK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1k
LWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
