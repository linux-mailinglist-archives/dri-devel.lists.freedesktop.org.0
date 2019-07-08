Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF862A53
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 22:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9547289DD8;
	Mon,  8 Jul 2019 20:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75D789DD8;
 Mon,  8 Jul 2019 20:24:33 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id m14so14315811qka.10;
 Mon, 08 Jul 2019 13:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pnrita1b0MkM7AyNkc/2C7SSvEndD1B5RxD62T0Ue1c=;
 b=bhxOfyl828GieZZB3sLWdJCLi6RHIIZ0we5Io+U2bU0RUstMx0DfpXY+PGjlSQJFsr
 ZBa8h3CewP5ZqLcd6IumEd72hbtWePshzOHsman7SxMhywHrFNDllA1T+eGjA6E/L2Wr
 D+ODXDji5ftZnlvSpGQnd6ec/g2sFi+KVvWvL/liLegB1RIyOlPyQR/DrsottMJIlNcl
 ua7+cjMXR980ERFURPBzu6Q5fi8Y2PbQ3MFoC1LtNwYdGB9bA10wc4U73tRDGw+Rw/f3
 f4T0BETfEHQF3TY0Ar8s3jPsTWowch7uatoJrvu1HLJGuIWjcf8rQvzqygnQxRUeoGZL
 J9XQ==
X-Gm-Message-State: APjAAAVZAz1RdKLTOtUisD6DKuPvbshnGn3nM7DWsRDZ1IV9Hq0ge/xj
 LFJWgYWNm3Z+Z0AZxGnmgAM+Ee+blPEb+RY8LhQ=
X-Google-Smtp-Source: APXvYqzp2meV/E+aj2azg0GgBkXPsp7U2/Lbp+hd+FV4m9ZLBmCI5eKAOPpe0FiTi+Kmeqqq3XmNzw77aVbgQtu74k4=
X-Received: by 2002:a37:ad12:: with SMTP id f18mr15270829qkm.3.1562617472727; 
 Mon, 08 Jul 2019 13:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190704055217.45860-1-natechancellor@gmail.com>
 <20190704055217.45860-2-natechancellor@gmail.com>
In-Reply-To: <20190704055217.45860-2-natechancellor@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 8 Jul 2019 22:24:14 +0200
Message-ID: <CAK8P3a1thzkjD5V39QcVWb1fQe62g6PLChMKuwodyu_rbWhgBw@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/amdgpu/mes10.1: Fix header guard
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCA3OjUyIEFNIE5hdGhhbiBDaGFuY2VsbG9yCjxuYXRlY2hh
bmNlbGxvckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gY2xhbmcgd2FybnM6Cj4KPiAgSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmM6NTM6Cj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2FtZGdwdS9tZXNfdjEwXzEuaDoyNDo5OiB3YXJuaW5n
Ogo+ICAnX19NRVNfVjEwXzFfSF9fJyBpcyB1c2VkIGFzIGEgaGVhZGVyIGd1YXJkIGhlcmUsIGZv
bGxvd2VkIGJ5ICNkZWZpbmUgb2YKPiAgYSBkaWZmZXJlbnQgbWFjcm8gWy1XaGVhZGVyLWd1YXJk
XQo+ICAjaWZuZGVmIF9fTUVTX1YxMF8xX0hfXwo+ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9hbWRncHUvbWVzX3YxMF8xLmg6MjU6OTog
bm90ZToKPiAgJ19fTUVTX3YxMF8xX0hfXycgaXMgZGVmaW5lZCBoZXJlOyBkaWQgeW91IG1lYW4g
J19fTUVTX1YxMF8xX0hfXyc/Cj4gICNkZWZpbmUgX19NRVNfdjEwXzFfSF9fCj4gICAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+Cj4gICAgICAgICAgX19NRVNfVjEwXzFfSF9fCj4gIDEgd2FybmluZyBn
ZW5lcmF0ZWQuCj4KPiBDYXBpdGFsaXplIHRoZSBWLgo+Cj4gRml4ZXM6IDg4NmY4MmFhN2ExZCAo
ImRybS9hbWRncHUvbWVzMTAuMTogYWRkIGlwIGJsb2NrIG1lczEwLjEgKHYyKSIpCj4gTGluazog
aHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvNTgyCj4gU2ln
bmVkLW9mZi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4K
CkkgcmFuIGludG8gdGhlIHNhbWUgb25lIG5vdywgYW5kIHNhdyB5b3VyIHZlcnNpb24gYmVmb3Jl
IHNlbmRpbmcgYW4KaWRlbnRpY2FsIHBhdGNoLgoKQWNrZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
