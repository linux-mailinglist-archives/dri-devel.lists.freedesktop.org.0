Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82549625CC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5537189F33;
	Mon,  8 Jul 2019 16:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3076C89F2D;
 Mon,  8 Jul 2019 16:08:40 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id r4so13665031qkm.13;
 Mon, 08 Jul 2019 09:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AIRM9fJTuV02DInLnXfPQr/Kf49I2+6ORUwr6RxGn7I=;
 b=f3dhfu4qkIZqFMV6UpjTBONOQEvr9UP6k+iLjVoGFhvtPJzoyO+QXhgOf++4A5xYph
 6kE8j6XYQGR7mkMguNo/fDuutk731a339KKI46FejxHEMheZwSlYkHyjuXQvG/qAB2Dy
 g87+bLJXU0T1E1hlFbxhLuA4dKEYO5uObBxPpKPbD6/U0hGHpo0Gg6f9JWxzOUGnhAX0
 2gjWd7hJbru6Tt5RbBlXPLHsOnrmFd5QUwMNXgVzy8uacvlesvwjZ1Dj7P+W1oEvZGZ7
 eDdP6d9+SkatH0WN+yjahulcEnNyXQTS5fzlxH4r2JLurPEXXFa8Plk0z3+HVm+chOKb
 b+4g==
X-Gm-Message-State: APjAAAUlP+pCD7h1x/Lhlz78suR1hoDSE+C0FgdNxJpt5d6qyK3Mqr5Y
 68WNQaNxtl9F+Ao9e8SJyP5W7sVdgUiDua0bWwU=
X-Google-Smtp-Source: APXvYqxEteI4pKZ99QH7i/UIVpoxSSPej/jTeoSq5Gb18AgTvCR6/QaNyJI3G6p/aYnV/vglL8CaZcuN2VjZYVTutxc=
X-Received: by 2002:a05:620a:b:: with SMTP id
 j11mr11264883qki.352.1562602119294; 
 Mon, 08 Jul 2019 09:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190708144205.2770771-1-arnd@arndb.de>
 <20190708144205.2770771-2-arnd@arndb.de>
 <CADnq5_MFi1cGxo-AGMcGzY4nW8HAuX8SiPfAD=eRrdo0w-aoJQ@mail.gmail.com>
In-Reply-To: <CADnq5_MFi1cGxo-AGMcGzY4nW8HAuX8SiPfAD=eRrdo0w-aoJQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 8 Jul 2019 18:08:21 +0200
Message-ID: <CAK8P3a1m-aDAsiVFYyQcoq0a=Y8rA5R3P5TSuBfmK2Gync-8eQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] amdgpu: make SOC15/navi support conditional
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Yong Zhao <Yong.Zhao@amd.com>, David Airlie <airlied@linux.ie>,
 Feifei Xu <Feifei.Xu@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, Oak Zeng <Oak.Zeng@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Philip Yang <Philip.Yang@amd.com>, Emily Deng <Emily.Deng@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Evan Quan <evan.quan@amd.com>,
 Shaoyun Liu <Shaoyun.Liu@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Amber Lin <Amber.Lin@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 xinhui pan <xinhui.pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCA0OjQ2IFBNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDgsIDIwMTkgYXQgMTA6NDIgQU0gQXJu
ZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4gPgo+ID4gRW5hYmxpbmcgYW1kZ3B1
IGJ1dCBub3QgQ09ORklHX0RSTV9BTURfREMgbGVhZHMgdG8gYSB3YXJuaW5nOgo+ID4KPiA+IGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmM6IEluIGZ1bmN0aW9uICdudl9zZXRfaXBfYmxv
Y2tzJzoKPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmM6NDAwOjM6IGVycm9yOiAj
d2FybmluZyAiRW5hYmxlIENPTkZJR19EUk1fQU1EX0RDIGZvciBkaXNwbGF5IHN1cHBvcnQgb24g
bmF2aS4iIFstV2Vycm9yPWNwcF0KPiA+ICAjIHdhcm5pbmcgIkVuYWJsZSBDT05GSUdfRFJNX0FN
RF9EQyBmb3IgZGlzcGxheSBzdXBwb3J0IG9uIG5hdmkuIgo+ID4gICAgXn5+fn5+fgo+ID4gZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYzogSW4gZnVuY3Rpb24gJ3NvYzE1X3NldF9p
cF9ibG9ja3MnOgo+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYzo2NTM6Mzog
ZXJyb3I6ICN3YXJuaW5nICJFbmFibGUgQ09ORklHX0RSTV9BTURfREMgZm9yIGRpc3BsYXkgc3Vw
cG9ydCBvbiBTT0MxNS4iIFstV2Vycm9yPWNwcF0KPiA+Cj4gPiBIb3dldmVyLCBDT05GSUdfRFJN
X0FNRF9EQyBjYW4gb25seSBiZSBlbmFibGVkIG9uIHg4Niwgc28gd2UKPiA+IGNhbm5vdCBkbyB0
aGF0IHdoZW4gYnVpbGRpbmcgZm9yIG90aGVyIGFyY2hpdGVjdHVyZXMuCj4KPiBEQyBpcyBub3Qg
bGltaXRlZCB0byB4ODYuCgpBaCwgcmlnaHQsIG9ubHkgRFJNX0FNRF9EQ19EQ04xXzAgaXMgeDg2
LW9ubHkuCgo+ICBJIGNhbiBkcm9wIHRoZSB3YXJuaW5nIGlmIHRoYXQgaXMgdGhlIGNvbmNlcm4u
CgpUaGF0IHdvdWxkIGJlIGdyZWF0LCB5ZXMuCgogICAgICBBcm5kCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
