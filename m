Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E25C2C2C7A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF3F6E444;
	Tue, 24 Nov 2020 16:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94ECF6E1F8;
 Tue, 24 Nov 2020 16:14:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a65so3449532wme.1;
 Tue, 24 Nov 2020 08:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fnQXOuxdd9Ha+ttePt7McKRgCzdvenHzP3lYYv4e9C8=;
 b=iQr9hZJarUKN47tSlegz3dfYvVmhXO+wLaLi8i++bYjU3m8ghrvN2H2P5R88XLR5tb
 xXpvtaMnhOTf1ZnfkoXkK5YW3jJsNNYsAFcc8YobH57HGhbiB14Vven5VWkhDDBWDHk9
 y+UzYmbx3P9fUyyt4JWCxm5LZGMqHWEM1DmymOb1di3iEtkxnG4AdRzmhOjSWm9UjHhr
 g+1+8Kqzy1vE4EQDx48Bf1VmH3AGK4+sCbiQe2waRgnLwjk3VMCQwABcgLANjm1xNLl+
 K3NC2grE4LykHLwpyEBfQfJhYypnPFN6jtnn5cMtkOvy82kUYtqMV/tIjOJ2hbggp9zW
 i1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fnQXOuxdd9Ha+ttePt7McKRgCzdvenHzP3lYYv4e9C8=;
 b=neEW0iEo0hmX+V3ZuCjFH3Y+eZiwUYNIPotcp7LhzKSLhxXVmd3cPe0CUBUyc+Vzfp
 U4f+TkK0OSgfInlBlntagfK1M6b4WjEOKZ++EczBQAbhWg64MraTz7dwoLhA4EVF57or
 DEV8pdsp445Eqfpv0hMjqaBMwu7MKS5OXUwwjpBn6338+s285qOSoYqWOw9nuln1neO1
 3eKc2Ze/TmOpp5mJkgUdie/muvy0tWwbN5fWdenV38ngTZMLYN0alNV4GlK85hN+REEn
 sdtbguw//lIDfZfzUJUNrM0RAOiDQyG2Ic3/jG9xx1nhYyC0USIwWzCgEUNsuXmW1P7P
 +oFA==
X-Gm-Message-State: AOAM533h6Ej7zZEByP7xFdEfApTRBeuTL9q2uMqonmN9hzRYSh83OuGG
 VDNezQmD8XyQPxOlqZBRwf9mjqF+93lUXOl5NU8=
X-Google-Smtp-Source: ABdhPJyoL9NCFb0YR56K9kBdE5/l0ByJYqt0ZdToAT+wNNkUCvRJIp2gQxTEuQOFC63surxTV5bT/wYkRBY2Jj/1F5M=
X-Received: by 2002:a1c:2dc8:: with SMTP id t191mr5215330wmt.73.1606234485281; 
 Tue, 24 Nov 2020 08:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-28-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-28-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 11:14:34 -0500
Message-ID: <CADnq5_M7n2PqQq8XUEEHwMbc8H30aYz-sbyhTDiiRDXC_4sFmw@mail.gmail.com>
Subject: Re: [PATCH 27/40] drm/amd/include/navi12_ip_offset: Mark top-level
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
L2FtZGdwdS9uYXZpMTJfcmVnX2luaXQuYzoyNzoKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vaW5jbHVkZS9uYXZpMTJfaXBfb2Zmc2V0Lmg6MTc5OjI5OiB3YXJuaW5nOiDigJhVU0Iw
X0JBU0XigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0K
PiAgMTc5IHwgc3RhdGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIFVTQjBfQkFTRSA9eyB7IHsgeyAw
eDAyNDJBODAwLCAweDA1QjAwMDAwLCAwLCAwLCAwIH0gfSwKPiAgfCBefn5+fn5+fn4KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9uYXZpMTJfaXBfb2Zmc2V0Lmg6MTcy
OjI5OiB3YXJuaW5nOiDigJhVTUNfQkFTReKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVz
ZWQtY29uc3QtdmFyaWFibGU9XQo+ICAxNzIgfCBzdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0Ug
VU1DX0JBU0UgPXsgeyB7IHsgMHgwMDAxNDAwMCwgMHgwMjQyNTgwMCwgMCwgMCwgMCB9IH0sCj4g
IHwgXn5+fn5+fn4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9uYXZp
MTJfaXBfb2Zmc2V0Lmg6MTUxOjI5OiB3YXJuaW5nOiDigJhTRE1BX0JBU0XigJkgZGVmaW5lZCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgMTUxIHwgc3RhdGljIGNv
bnN0IHN0cnVjdCBJUF9CQVNFIFNETUFfQkFTRSA9eyB7IHsgeyAweDAwMDAxMjYwLCAweDAwMDBB
MDAwLCAweDAyNDAyQzAwLCAwLCAwIH0gfSwKPiAgfCBefn5+fn5+fn4KPgo+IE5COiBTbmlwcGVk
IGEgZmV3IG9mIHRoZXNlCj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgK
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9uYXZpMTJfaXBfb2Zmc2V0Lmgg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9uYXZpMTJfaXBfb2Zm
c2V0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvbmF2aTEyX2lwX29mZnNldC5oCj4g
aW5kZXggNmMyY2M2Mjk2YzA2MS4uZDhmYzAwNDc4YjZhMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2luY2x1ZGUvbmF2aTEyX2lwX29mZnNldC5oCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL25hdmkxMl9pcF9vZmZzZXQuaAo+IEBAIC0zMyw3ICszMyw3IEBA
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
