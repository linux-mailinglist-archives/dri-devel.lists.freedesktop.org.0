Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A711C2A339A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 20:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2A26E52A;
	Mon,  2 Nov 2020 19:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFD66E52A;
 Mon,  2 Nov 2020 19:04:41 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i16so10459584wrv.1;
 Mon, 02 Nov 2020 11:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tf+lyKd6cxKdsDnu3FRIUy9U8nKGczUdtHTnDfNA6uk=;
 b=N88QPtjKr3lnoHDVn2ua8QmK+rTC4K1TDQ/67elgh7OvoyWwbfTLhBzeBR5rTpatH1
 v6v77w7acB2WFkVXtjdS7JXSqvbobWCYDMLW64nI3L2ClZ53hMTzpqxxYznu0S54Pl4r
 2EQWY+jZ4K4eEJ5ibYmRLuFe0EsSbFv8o03orKXY3NogDsoREZumC/abc6mpLHYbTCyy
 K3w7Skdcf/jdS9yl6fyZwp4dwmJyGUoTXRc+gylIzKnTKNaXrPpBHTiiLccZ8XzRwweU
 cRpB2FFk/SetlnTkO501C5ffSMH99MXWZg5ZYC3luCSRrgrlFLJ7+bHtEJ5GOQPmrx2T
 Flww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tf+lyKd6cxKdsDnu3FRIUy9U8nKGczUdtHTnDfNA6uk=;
 b=gGDMBlGO0udPXfgqxwwrMUHK7v0PRSCjGsEuaO7rDLsNPiDje+QtaSyFGPLn0PxIY7
 3LOAhX7ghpU0b+DQMZoG584fWz4VH5g5ASxmZG0nkyPURxmaDG3di7IaCv//I5GKz9TF
 2Uw4r8AGjTAxYRfifR7l53x1jNf4tz4loBPPqNnO3xKC5R0vYv1T6sKkxKy3xdfUUKqs
 crd/1s7XbhGp+tDfsiy2iXyxdkaOnnOvPxIkNfk330psfEGjxn3I5zqmPEBiuVEmz3+b
 sZX26vO7cVVm+Ns5a5oCHqIDYKrs8XYDLihjs3f0iqLJcK2Vorzd2cgOel22Xe8stk/L
 bbyA==
X-Gm-Message-State: AOAM533XP+U6rq2wu8f4FgRL2D303Q+MC5lX0H1rCQemfTIqrOl3Q6bs
 UP0/6dbl3F8oY9v49+9XYA14cyYmNTU0514uFUU=
X-Google-Smtp-Source: ABdhPJwCdf6HK3BRONaxMlEO4sSZeGYlPQnVf6qELCEGG0Uy0dyaWX4udRuSFsUD6PPBSk5N9pJGkL5k6E56Pd6EU24=
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr23289868wrl.124.1604343880677; 
 Mon, 02 Nov 2020 11:04:40 -0800 (PST)
MIME-Version: 1.0
References: <1604318927-11896-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1604318927-11896-1-git-send-email-zou_wei@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Nov 2020 14:04:29 -0500
Message-ID: <CADnq5_OLB62R9NA_n6JW5vJQPANmBXD6DapMvP74i=amevxE1Q@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/pm: remove unused variable
To: Zou Wei <zou_wei@huawei.com>
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
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMiwgMjAyMCBhdCA4OjQ0IEFNIFpvdSBXZWkgPHpvdV93ZWlAaHVhd2VpLmNv
bT4gd3JvdGU6Cj4KPiBGaXggdmFyaWFibGUgc2V0IGJ1dCBub3QgdXNlZCBjb21waWxhdGlvbiB3
YXJuaW5nOgo+Cj4gLi92YW5nb2doX3BwdC5jOjM5Nzo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhy
ZXTigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAgIGlu
dCByZXQgPSAwOwo+ICAgICAgIF5+fgo+CgpNYXliZSB5b3UgaGF2ZSBhbiBvbGRlciB2ZXJzaW9u
IG9mIHRoZSBjb2RlPyAgSXQncyBjdXJyZW50bHkgdXNlZC4KCkFsZXgKCgo+IFJlcG9ydGVkLWJ5
OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBab3UgV2Vp
IDx6b3Vfd2VpQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dz
bXUvc211MTEvdmFuZ29naF9wcHQuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUx
MS92YW5nb2doX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS92YW5n
b2doX3BwdC5jCj4gaW5kZXggNmUyNjAyNS4uMzU1YWRlNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmMKPiBAQCAtMzk0LDggKzM5
NCw2IEBAIHN0YXRpYyBpbnQgdmFuZ29naF9nZXRfY3VycmVudF9hY3Rpdml0eV9wZXJjZW50KHN0
cnVjdCBzbXVfY29udGV4dCAqc211LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqdmFsdWUpCj4gIHsK
PiAtICAgICAgIGludCByZXQgPSAwOwo+IC0KPiAgICAgICAgIGlmICghdmFsdWUpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gLS0KPiAyLjYuMgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
