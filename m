Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F2810907D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 15:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488AB89F5B;
	Mon, 25 Nov 2019 14:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8A689E2B;
 Mon, 25 Nov 2019 14:55:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b11so6322322wmj.4;
 Mon, 25 Nov 2019 06:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=17aeOdEACV6GCmSBNGeLhdL7I8VMOLywDStXvLbpbKk=;
 b=lU+Vylum/ycmNZpBkZqqNeEPL/9RhOeq2iE+wgMi/tvKp07jTN6VjloZZMIh2HYRf2
 uw9IIx+QT07ZyW2kx6OsxRh3SKwu1D/8tpnoUXNUTxzAMQnPt28KaBwnmcctwjflJxtb
 8YKnJk7sIsMnZDxncRsAP2qA4P1VWaUAK80zACO4Y88Ud9qoF71evvnLcMzw3SrK6lgy
 g/6RddCvyI+i3bk/TxYXQnY9g4baBAWXCLvTqlNsekkzxUGW4Ie8+lC+1mxk56c9+NFn
 nAFJu3DCUvKR4pXoKVCx/V/AH1Qxmo7Ie2C93gaAb/od4qINMkqekEYeyrBDXjAELiR/
 DKyg==
X-Gm-Message-State: APjAAAXnPWSCSUs7UdmnOY4Z6/26UydST4PKFK2Bz0+Lt91eIDbyXnyI
 3C7wWvI65Jf88HXEAA71+l4toyO1Dggev4sCick=
X-Google-Smtp-Source: APXvYqyJqzPNBd01KuJnFGkGbR9BT5A13oFsJBoVd9HZiHyyG7q0VSD1WrYZcsuWBBJork2bw1Gm9MyvPiwdDVL8C2A=
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr29337295wmi.141.1574693718199; 
 Mon, 25 Nov 2019 06:55:18 -0800 (PST)
MIME-Version: 1.0
References: <20191123192336.11678-1-natechancellor@gmail.com>
In-Reply-To: <20191123192336.11678-1-natechancellor@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Nov 2019 09:55:06 -0500
Message-ID: <CADnq5_OGD5q44nEhHp2+RU3syhO9cUhqfnH34BRJhJrC-b+rLw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Ensure ret is always initialized when using
 SOC15_WAIT_ON_RREG
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=17aeOdEACV6GCmSBNGeLhdL7I8VMOLywDStXvLbpbKk=;
 b=IP1XcgI3FysrVnSEq8NB1nv49cr+e9Hb9dyhbhW70lnBxvM/OZgDc7OXAcrdnmF4Pb
 H2gZWJLH2T5+0Tc3UDrIQ3vfI54Ci1QgwXUwGvlYyZEbSdTo5yuIuVUKZi7un7oFA9gv
 92gzSz4kmdpAtptFarF2mq+KGXEVTxauk3Nj9eLW9s/uRnzhIbriu7XqjWZLgCtWPEGX
 CKIF5KUlDC46PrOX93AYhEs6jBSmVrpXf/Syk4n8HRAthBNuq7qAAq4AYiRsPtLMAvg7
 2xMM1JO0iAsLDvC4r6cxagSfMtyYYWZ5Upmccwec+s6MeHzJf+HxW9GFU+cPldLVplE+
 jyDg==
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMzowNyBBTSBOYXRoYW4gQ2hhbmNlbGxvcgo8bmF0ZWNo
YW5jZWxsb3JAZ21haWwuY29tPiB3cm90ZToKPgo+IENvbW1pdCBiMGYzY2QzMTkxY2QgKCJkcm0v
YW1kZ3B1OiByZW1vdmUgdW5uZWNlc3NhcnkgSlBFRzIuMCBjb2RlIGZyb20KPiBWQ04yLjAiKSBp
bnRyb2R1Y2VkIGEgbmV3IGNsYW5nIHdhcm5pbmcgaW4gdGhlIHZjbl92Ml8wX3N0b3AgZnVuY3Rp
b246Cj4KPiAuLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jOjEwODI6Mjog
d2FybmluZzogdmFyaWFibGUgJ3InCj4gaXMgdXNlZCB1bmluaXRpYWxpemVkIHdoZW5ldmVyICd3
aGlsZScgbG9vcCBleGl0cyBiZWNhdXNlIGl0cyBjb25kaXRpb24KPiBpcyBmYWxzZSBbLVdzb21l
dGltZXMtdW5pbml0aWFsaXplZF0KPiAgICAgICAgIFNPQzE1X1dBSVRfT05fUlJFRyhWQ04sIDAs
IG1tVVZEX1NUQVRVUywgVVZEX1NUQVRVU19fSURMRSwgMHg3LCByKTsKPiAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgo+IC4uL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2FtZGdwdS9zb2MxNV9jb21t
b24uaDo1NToxMDogbm90ZToKPiBleHBhbmRlZCBmcm9tIG1hY3JvICdTT0MxNV9XQUlUX09OX1JS
RUcnCj4gICAgICAgICAgICAgICAgIHdoaWxlICgodG1wXyAmIChtYXNrKSkgIT0gKGV4cGVjdGVk
X3ZhbHVlKSkgeyAgIFwKPiAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+Cj4gLi4vZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Yy
XzAuYzoxMDgzOjY6IG5vdGU6IHVuaW5pdGlhbGl6ZWQgdXNlCj4gb2NjdXJzIGhlcmUKPiAgICAg
ICAgIGlmIChyKQo+ICAgICAgICAgICAgIF4KPiAuLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS92Y25fdjJfMC5jOjEwODI6Mjogbm90ZTogcmVtb3ZlIHRoZQo+IGNvbmRpdGlvbiBpZiBpdCBp
cyBhbHdheXMgdHJ1ZQo+ICAgICAgICAgU09DMTVfV0FJVF9PTl9SUkVHKFZDTiwgMCwgbW1VVkRf
U1RBVFVTLCBVVkRfU1RBVFVTX19JRExFLCAweDcsIHIpOwo+ICAgICAgICAgXgo+IC4uL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2FtZGdwdS9zb2MxNV9jb21tb24uaDo1NToxMDogbm90
ZToKPiBleHBhbmRlZCBmcm9tIG1hY3JvICdTT0MxNV9XQUlUX09OX1JSRUcnCj4gICAgICAgICAg
ICAgICAgIHdoaWxlICgodG1wXyAmIChtYXNrKSkgIT0gKGV4cGVjdGVkX3ZhbHVlKSkgeyAgIFwK
PiAgICAgICAgICAgICAgICAgICAgICAgIF4KPiAuLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS92Y25fdjJfMC5jOjEwNzI6Nzogbm90ZTogaW5pdGlhbGl6ZSB0aGUKPiB2YXJpYWJsZSAncicg
dG8gc2lsZW5jZSB0aGlzIHdhcm5pbmcKPiAgICAgICAgIGludCByOwo+ICAgICAgICAgICAgICBe
Cj4gICAgICAgICAgICAgICA9IDAKPiAxIHdhcm5pbmcgZ2VuZXJhdGVkLgo+Cj4gVG8gcHJldmVu
dCB3YXJuaW5ncyBsaWtlIHRoaXMgZnJvbSBoYXBwZW5pbmcgaW4gdGhlIGZ1dHVyZSwgbWFrZSB0
aGUKPiBTT0MxNV9XQUlUX09OX1JSRUcgbWFjcm8gaW5pdGlhbGl6ZSBpdHMgcmV0IHZhcmlhYmxl
IGJlZm9yZSB0aGUgd2hpbGUKPiBsb29wIHRoYXQgY2FuIHRpbWUgb3V0LiBUaGlzIG1hY3JvJ3Mg
cmV0dXJuIHZhbHVlIGlzIGFsd2F5cyBjaGVja2VkIHNvCj4gaXQgc2hvdWxkIHNldCByZXQgaW4g
Ym90aCB0aGUgc3VjY2VzcyBhbmQgZmFpbCBwYXRoLgo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIu
Y29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvNzc2Cj4gU2lnbmVkLW9mZi1ieTogTmF0
aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4KCkFwcGxpZWQuICBUaGFu
a3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNV9jb21t
b24uaCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNV9jb21tb24uaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1X2NvbW1vbi5oCj4gaW5kZXggODM5ZjE4NmUxMTgyLi4x
OWU4NzBjNzk4OTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29j
MTVfY29tbW9uLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNV9jb21t
b24uaAo+IEBAIC01Miw2ICs1Miw3IEBACj4gICAgICAgICAgICAgICAgIHVpbnQzMl90IG9sZF8g
PSAwOyAgICAgIFwKPiAgICAgICAgICAgICAgICAgdWludDMyX3QgdG1wXyA9IFJSRUczMihhZGV2
LT5yZWdfb2Zmc2V0W2lwIyNfSFdJUF1baW5zdF1bcmVnIyNfQkFTRV9JRFhdICsgcmVnKTsgXAo+
ICAgICAgICAgICAgICAgICB1aW50MzJfdCBsb29wID0gYWRldi0+dXNlY190aW1lb3V0OyAgICAg
ICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIHJldCA9IDA7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgd2hpbGUgKCh0bXBfICYgKG1h
c2spKSAhPSAoZXhwZWN0ZWRfdmFsdWUpKSB7ICAgXAo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGlmIChvbGRfICE9IHRtcF8pIHsgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBsb29wID0gYWRldi0+dXNlY190aW1lb3V0OyAgICAgIFwKPiAt
LQo+IDIuMjQuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
