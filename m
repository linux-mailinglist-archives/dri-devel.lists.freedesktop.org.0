Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD412C2C77
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7056E488;
	Tue, 24 Nov 2020 16:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEF46E483;
 Tue, 24 Nov 2020 16:14:05 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x22so2884167wmc.5;
 Tue, 24 Nov 2020 08:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8rBvHUrzCCm9gVWrU3I91+G5vSuJBwgXqyyisSK9ieo=;
 b=l6Lu+RcjXtavu4WmmL4nvGSMU4O10Lw8NUXO7J9V4wy3PuzN3MjeK+AHvjZGff1cJg
 Q5jBUmLOaoqfWCgcQi3TvtNb2ie+Vj75VjHOEoaaMT6ShtTx55XAVII0gn38CUUsVpRU
 MVFBP5+wkoiDND3/oTWXgfg9bahD8HYmooJTA83IzieEGcm/CkKDggkv3ISb3EWQ2uZa
 YY/EpeqHAcbaAcFv5hdK9teyXjRgIsICEaw49GJyUN5pD9YL5EXLxHX/5PRDfAHPdiS2
 JniwIlhIy/LNS0DcinQelv0hdz7zSN45Slj69MhAVP88A4t7W7gRcRYkC9NvXcJyNqkQ
 kqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8rBvHUrzCCm9gVWrU3I91+G5vSuJBwgXqyyisSK9ieo=;
 b=hMEABCIZHJUFaJa3wUBhCm4oKbMe93X2JKRrOeQsaIzpIize1kt76lNIQfWAHUynV1
 /COFqdDSeh1UA/Z1xTn5kz9U4Z69KA6qk6D6TWAjQs3vuZvZyEi9hChZGczz9KvBgI0F
 mhdVbOkuOyc1WBukdmfNHkYWMPwblLBXY0cj7r+TmuLtxCwJz/8WpJG5YyczuOkFs+c0
 IdTTGnU3ffyen8aXlx8VS6+Ota3HMTvC+duyPqGt2xcZo3NIkywEpnRDaEhYVKrDc7xr
 Q/j+1MXCzKnj7P1FhXH15VckOUhnSWYZJCj1X1vnh9GIaLCPUyDLDmhMH4eQe2DwTRRu
 lJSA==
X-Gm-Message-State: AOAM530m6Z5V4e7IjyU8D6jE4nrstjsYXwmQyNo8cqgALxn6YRYmMtc+
 muHa7cqXuRHY5Cwpux4M/9Z39vVVQ/fBOk/1TtPYXOpD
X-Google-Smtp-Source: ABdhPJz0NioSPJlepfSlftukQu1yVMNbUcj2AKbQONE/GCi452Qv8YPxbyRcMRRCtBBkFWafFLNIucH0pvFJguWYECY=
X-Received: by 2002:a7b:c015:: with SMTP id c21mr5292166wmb.79.1606234443764; 
 Tue, 24 Nov 2020 08:14:03 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-27-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-27-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 11:13:52 -0500
Message-ID: <CADnq5_NNhyyDvbp5oULdEVwa8bAKqkFGrvujmmyZT7S088GfCg@mail.gmail.com>
Subject: Re: [PATCH 26/40] drm/amd/include/navi14_ip_offset: Mark top-level
 IP_BASE as __maybe_unused
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoyMCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9uYXZpMTRfcmVnX2luaXQuYzoyNzoKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vaW5jbHVkZS9uYXZpMTRfaXBfb2Zmc2V0Lmg6MTc5OjI5OiB3YXJuaW5nOiDigJhVU0Iw
X0JBU0XigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0K
PiAgMTc5IHwgc3RhdGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIFVTQjBfQkFTRSA9eyB7IHsgeyAw
eDAyNDJBODAwLCAweDA1QjAwMDAwLCAwLCAwLCAwIH0gfSwKPiAgfCBefn5+fn5+fn4KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9uYXZpMTRfaXBfb2Zmc2V0Lmg6MTcy
OjI5OiB3YXJuaW5nOiDigJhVTUNfQkFTReKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVz
ZWQtY29uc3QtdmFyaWFibGU9XQo+ICAxNzIgfCBzdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0Ug
VU1DX0JBU0UgPXsgeyB7IHsgMHgwMDAxNDAwMCwgMHgwMjQyNTgwMCwgMCwgMCwgMCB9IH0sCj4g
IHwgXn5+fn5+fn4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9uYXZp
MTRfaXBfb2Zmc2V0Lmg6MTUxOjI5OiB3YXJuaW5nOiDigJhTRE1BX0JBU0XigJkgZGVmaW5lZCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgMTUxIHwgc3RhdGljIGNv
bnN0IHN0cnVjdCBJUF9CQVNFIFNETUFfQkFTRSA9eyB7IHsgeyAweDAwMDAxMjYwLCAweDAwMDBB
MDAwLCAweDAyNDAyQzAwLCAwLCAwIH0gfSwKPiAgfCBefn5+fn5+fn4KPgo+IE5COiBTbmlwcGVk
IGEgZmV3IG9mIHRoZXNlCj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgK
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9uYXZpMTRfaXBfb2Zmc2V0Lmgg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9uYXZpMTRfaXBfb2Zm
c2V0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvbmF2aTE0X2lwX29mZnNldC5oCj4g
aW5kZXggZWNkZDllYWJlMGRjOC4uYzM5ZWY2NTFhZGM2ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2luY2x1ZGUvbmF2aTE0X2lwX29mZnNldC5oCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL25hdmkxNF9pcF9vZmZzZXQuaAo+IEBAIC0zMyw3ICszMyw3IEBA
IHN0cnVjdCBJUF9CQVNFX0lOU1RBTkNFCj4gIHN0cnVjdCBJUF9CQVNFCj4gIHsKPiAgICAgIHN0
cnVjdCBJUF9CQVNFX0lOU1RBTkNFIGluc3RhbmNlW01BWF9JTlNUQU5DRV07Cj4gLX07Cj4gK30g
X19tYXliZV91bnVzZWQ7Cj4KPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgQVRIVUJf
QkFTRSA9eyB7IHsgeyAweDAwMDAwQzAwLCAweDAyNDA4QzAwLCAwLCAwLCAwIH0gfSwKPiAtLQo+
IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
