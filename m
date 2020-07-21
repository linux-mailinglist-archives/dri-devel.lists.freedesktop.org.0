Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A20227A5C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990B56E433;
	Tue, 21 Jul 2020 08:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13356E175
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 02:46:49 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y3so2302451wrl.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=GJ2loNa/b2LseAPT1F7ZEHhALzMLY3E2X638XNCfUuw=;
 b=ijxXAdSeHVBZU9hawq1Hem8w8thcNIt+hCxP2OEhbYPQUxo0MR4NdRJY+oy+f2vvc6
 DAGH32YzUaPoXgQEBR+nR1oaIDeY6+oWDEldl4Sz9EBTWY4Fad4ZO8ywJJI7c5HWZJDK
 hoWLj4D0irM/RtkJSlZ98T8v8imrn2Dz3BSw5gIWQBE/ImhD5mF11lsHDRrmSs4XRayS
 G+4hX5e5/WKSvynWOUI71wo0SKrOX6t1erVEpMaqaPZiwzagPTpRyXE2KrQ+s9VmnNSV
 i0HcsXcAILOtqHxOPkIFQYMls0WRVlAd1RAibLwWsXParar/UU26Olals568gMUpR4F8
 iEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GJ2loNa/b2LseAPT1F7ZEHhALzMLY3E2X638XNCfUuw=;
 b=fkB867ra1UEgS/zOu0BNTQ93CTsWsaSzhb11mMOCKnVjfNg+sIqTrsFatXrRTu/+vN
 p2cT/ODkTUV9H/zImQTuJzVLFc9GgOJFNffwm00/wTCyEJoAE38kV3xDscjKo1FaPRZb
 2Gf6m58tLRhusKz/gf1gOPExvHzdcXcSxMhGuczq1/zTcYgwP2mVe+rjpU8MwY2yaNs8
 h1pzXLyxyZegsJ+m9KhyoQ/LkJj2ZNyrxpRmOcB3JKQ47f3UPtAPQezeGUuEQcH2wnbj
 yBOXt23ZrQVeLG4u3JxC+D8jBT109JNBw8dWUOTZ7jRArkTe7s55g7CFWEhUHjodYA6K
 3w7g==
X-Gm-Message-State: AOAM533NY4BxTUxou2xu9A9KZqRvgyHV1aovM2uf2sbKguypx+Wn9/ff
 jzpra1ugkJnLVdUaGynvunqXvQld7Q==
X-Google-Smtp-Source: ABdhPJzxM6HnO5U7IAUr//uuD9OAnbgY6BtrL4lxgY55zxyPqr9uLztqQLlL4Zw1ft47OyC7v7FE5A==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr8893146wrq.210.1595299608116; 
 Mon, 20 Jul 2020 19:46:48 -0700 (PDT)
Received: from [192.168.200.34] (ip5b436a54.dynamic.kabel-deutschland.de.
 [91.67.106.84])
 by smtp.gmail.com with ESMTPSA id v12sm24225356wrs.2.2020.07.20.19.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 19:46:47 -0700 (PDT)
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_2/5=5d_drm=3a_rockchip=3a_add_missing_regi?=
 =?UTF-8?B?c3RlcnMgZm9yIFJLMzE4OOOAkOivt+azqOaEj++8jOmCruS7tueUsWxpbnV4LXJv?=
 =?UTF-8?Q?ckchip-bounces+andy=2eyan=3drock-chips=2ecom=40lists=2einfradead?=
 =?UTF-8?B?Lm9yZ+S7o+WPkeOAkQ==?=
To: Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
References: <20200718200323.3559-1-knaerzche@gmail.com>
 <20200718200323.3559-3-knaerzche@gmail.com>
 <871ce1ac-2d5b-c0a2-60a6-6aba0f296c18@rock-chips.com>
 <12296860-d6ed-5135-7c4e-545362829051@gmail.com>
 <c53a4909-03ff-7477-fb71-1418cf97634b@rock-chips.com>
From: Alex Bee <knaerzche@gmail.com>
Message-ID: <3a8f02db-93f3-1414-fea9-007dee55ec54@gmail.com>
Date: Tue, 21 Jul 2020 04:46:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c53a4909-03ff-7477-fb71-1418cf97634b@rock-chips.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5keSwKCkFtIDIxLjA3LjIwIHVtIDAzOjE3IHNjaHJpZWIgQW5keSBZYW46Cj4gSGkgQWxl
eDoKPgo+IE9uIDcvMjAvMjAgMTA6NDYgUE0sIEFsZXggQmVlIHdyb3RlOgo+PiBIaSBBbmR5LAo+
Pgo+PiBBbSAyMC4wNy4yMCB1bSAxMDoyMiBzY2hyaWViIEFuZHkgWWFuOgo+Pj4gSGkgQWxleDoK
Pj4+Cj4+PiBPbiA3LzE5LzIwIDQ6MDMgQU0sIEFsZXggQmVlIHdyb3RlOgo+Pj4+IFRoaXMgcGF0
Y2ggYWRkcyBkaXRoZXJfdXAsIGRzcF9sdXRfZW4sIGRhdGFfYmxhbmsgYW5kIGRzcF9kYXRhX3N3
YXAKPj4+PiByZWdpc3RlcnMgdG8gZW5hYmxlIHRoZWlyIHJlc3BlY3RpdmUgZnVuY3Rpb25hbGl0
eSBmb3IgUkszMTg4J3MgVk9QLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZWUgPGtu
YWVyemNoZUBnbWFpbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX3ZvcF9yZWcuYyB8IDQgKysrKwo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvcm9ja2NoaXBfdm9wX3JlZy5jIAo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JvY2tjaGlwX3ZvcF9yZWcuYwo+Pj4+IGluZGV4IGIwNDY5MTAxMjlmYi4uOTcxYTZiZGE3NDU4
IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3Bf
cmVnLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfdm9wX3Jl
Zy5jCj4+Pj4gQEAgLTUxMiw2ICs1MTIsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2b3BfY29t
bW9uIHJrMzE4OF9jb21tb24gPSB7Cj4+Pj4gwqDCoMKgwqDCoCAuZGl0aGVyX2Rvd25fZW4gPSBW
T1BfUkVHKFJLMzE4OF9EU1BfQ1RSTDAsIDB4MSwgMTEpLAo+Pj4+IMKgwqDCoMKgwqAgLmRpdGhl
cl9kb3duX21vZGUgPSBWT1BfUkVHKFJLMzE4OF9EU1BfQ1RSTDAsIDB4MSwgMTApLAo+Pj4+IMKg
wqDCoMKgwqAgLmRzcF9ibGFuayA9IFZPUF9SRUcoUkszMTg4X0RTUF9DVFJMMSwgMHgzLCAyNCks
Cj4+Pj4gK8KgwqDCoCAuZGl0aGVyX3VwID0gVk9QX1JFRyhSSzMxODhfRFNQX0NUUkwwLCAweDEs
IDkpLAo+Pj4+ICvCoMKgwqAgLmRzcF9sdXRfZW4gPSBWT1BfUkVHKFJLMzE4OF9TWVNfQ1RSTCwg
MHgxLCAyOCksCj4+Pj4gK8KgwqDCoCAuZGF0YV9ibGFuayA9IFZPUF9SRUcoUkszMTg4X0RTUF9D
VFJMMSwgMHgxLCAyNSksCj4+Pj4gK8KgwqDCoCAuZHNwX2RhdGFfc3dhcCA9IFZPUF9SRUcoUksz
MTg4X0RTUF9DVFJMMSwgMHgxZiwgMjYpLAo+Pj4KPj4+Cj4+Pgo+Pj4gSSBjYW4ndCBmaW5kIHRo
ZSBkZWZpbml0aW9uIG9mIGRzcF9kYXRhX3N3YXAsIG9yIEkgbWlzc2VkIHNvbWV0aGluZz8KPj4+
Cj4+IE5vdGUgdGhhdCAuZHNwX2RhdGFfc3dhcCBpcyBub3QgZGVmaW5lZCB3aXRoIHRoYXQgbmFt
ZSBpbiBUUk0gKGFzIGl0IAo+PiBpcyBub3QgaW4gUkszMjg4L1JLMzMyOCksIHNpbmNlIHBvdGVu
dGlhbGx5IG1vcmUgdGhlIG9uZSBiaXQgd291bGQgCj4+IGhhdmUgdG8gYmUgc2V0IGZvciB0aGlz
IChjdXJyZW50bHkgb25seSBSQl9TV0FQICgweDIpIGlzIGltcGxlbWVudGVkIAo+PiBpbiB0aGUg
Vk9QIGRyaXZlcikuCj4+Cj4KPiBJIG1lYW4gSSBkaWRuJ3QgZmluZCB0aGUgZGVmaW5pdGlvbiBv
ZiBkc3BfZGF0YV9zd2FwwqAgaW4gc3RydWN0IAo+IHZvcF9jb21tLCBJIGV2ZW4gc2VhcmNoIGRy
bS1taXNjLW5leHQgdHJlZS4KPgpTb3JyeSwgbWlzdW5kZXJzdGFuZGluZy4gWW91J3JlIHJpZ2h0
OiBJIGhhZCBzb21ldGhpbmcgd2hpY2ggaXNuJ3QgCnVwc3RyZWFtZWQvbWVyZ2VkIHlldCBpbiBt
eSB0cmVlLiBJJ2xsIHJlbW92ZSB0aGlzIHJlZyBpbiBWMi4KPgo+PiBUbyBiZSBzb21lIGtpbmQg
b2YgZnV0dXJlIHByb29mIChpZiBCR19TV0FQLCBSR19TV0FQLCBERUxUQV9TV0FQIG9yIAo+PiBE
VU1NWV9TV0FQIGV2ZXIgZ2V0IGltcGxlbWVudGVkKSBpdCBzaG91bGQgYmUgYWxpZ25lZCB3aXRo
IHdoYXQgaXMgCj4+IGRlZmluZWQgZm9yIFJLMzI4OC9SSzMzMjggbm93IHRvIGF1dG9tYXRpY2Fs
bHkgYmVuZWZpdCBmcm9tIHRoYXQgCj4+IGFkZGl0aW9ucy4gQW5kIGl0IHdvdWxkLCBzaW5jZSBS
SzMyODhfRFNQX0NUUkwwIEJJVDEyLCBCSVQxMywgQklUMTQsIAo+PiBCSVQxNSwgQklUMTYgZXhh
Y3RseSBtYXRjaGVzIHdpdGggUkszMTg4X0RTUF9DVFJMMSBCSVQyNiwgQklUMjcsIAo+PiBCSVQy
OCwgQklUMjksIEJJVDMwLgo+Pgo+PiBDdXJyZW50IGltcGxlbWVudGF0aW9uIHNldHMgQklUMTMg
Zm9yIFJLMzI4OCBhbmQgd2l0aCB0aGlzIHBhdGNoIAo+PiBCSVQyNyBmb3IgUkszMTg4IHRvIGVu
YWJsZSBSQl9TV0FQLgo+Pgo+Pj4KPj4+Cj4+Pj4gwqAgfTsKPj4+PiDCoCDCoCBzdGF0aWMgY29u
c3Qgc3RydWN0IHZvcF93aW5fZGF0YSByazMxODhfdm9wX3dpbl9kYXRhW10gPSB7Cj4+Pgo+Pj4K
Pj4gUmVnYXJkcywKPj4KPj4gQWxleAo+Pgo+Pgo+Pgo+Cj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
