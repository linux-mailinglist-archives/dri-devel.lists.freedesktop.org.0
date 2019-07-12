Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342B8675DD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 22:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7300B6E393;
	Fri, 12 Jul 2019 20:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE026E393;
 Fri, 12 Jul 2019 20:22:21 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id g18so7407422qkl.3;
 Fri, 12 Jul 2019 13:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hAXsy38vfUxAdaLQ2cHfBZxaN3gFCt2GL2KOlavUUwQ=;
 b=i4HoEZY7BKrAH/CmMm/k0FONEz65c6oNG0t6N7jzjEKf/iURU/0hLOW0ZfPgWHNNQX
 A/RJKfBLD4PBWuirp9G5sHVjgY3kHzR4JNw3nwfnqoXSRB9dGrB/H2D2U4AhqZ7Yq776
 40Ut2TzCXhv9jMyOHK4F+m4CkcuVZCgjpwQ07sB2F/+e0D9MbNnKrGgIqGutTs3PTubn
 r873Tr2Qzn5s1+THQBkqSVt29+GCcF/21TMePfu1St3ecNx/8h1eMlsXHO+a1SWnbtZV
 34cAyNwvfC9P0w74aRnipaiM60jEORiLklFYuhRs1w3EFCuIogRWnFgI+svWg8YYtUUA
 zlUQ==
X-Gm-Message-State: APjAAAURsJyb5LCixvfillGRBdkilRnlAyxEj0q0zYIgUnyHPkZaR77k
 Fmp1/TZiP6OFGJ4hZzXOY5LcIQTEh87zx0tbN9k=
X-Google-Smtp-Source: APXvYqwpYZCo9evjKCry92/VPntODrj6skVfA7DxlxAT3xv2z8F8wqoZqjjwl+fqDujGzPERH4MfFGzRBKLf84Qx9vs=
X-Received: by 2002:a05:620a:b:: with SMTP id
 j11mr7976315qki.352.1562962940527; 
 Fri, 12 Jul 2019 13:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190712094118.1559434-1-arnd@arndb.de>
 <CADnq5_McVegix-m87OwHUvk80NdsFZPQ7d0X8qQtUf84h+Fg1A@mail.gmail.com>
In-Reply-To: <CADnq5_McVegix-m87OwHUvk80NdsFZPQ7d0X8qQtUf84h+Fg1A@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 12 Jul 2019 22:22:03 +0200
Message-ID: <CAK8P3a3wqWxPvDDYSQXBTgr335ONZ3beztoANO0hMcnWPFr0Aw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: hide #warning for missing DC config
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, David Airlie <airlied@linux.ie>,
 Kevin Wang <kevin1.wang@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgODowMiBQTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAxMiwgMjAxOSBhdCA1OjQxIEFNIEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+ID4KPiA+IEl0IGlzIGFubm95aW5n
IHRvIGhhdmUgI3dhcm5pbmdzIHRoYXQgdHJpZ2dlciBpbiByYW5kY29uZmlnCj4gPiBidWlsZHMg
bGlrZQo+ID4KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmM6NjUzOjM6IGVy
cm9yOiAiRW5hYmxlIENPTkZJR19EUk1fQU1EX0RDIGZvciBkaXNwbGF5IHN1cHBvcnQgb24gU09D
MTUuIgo+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYzo0MDA6MzogZXJyb3I6ICJF
bmFibGUgQ09ORklHX0RSTV9BTURfREMgZm9yIGRpc3BsYXkgc3VwcG9ydCBvbiBuYXZpLiIKPiA+
Cj4gPiBSZW1vdmUgdGhlc2UgYW5kIHJlbHkgb24gdGhlIHVzZXJzIHRvIHR1cm4gdGhlc2Ugb24u
Cj4KPiBJcyB0aGVyZSBzb21lIHNvcnQgb2YgaW5mb3JtYXRpb25hbCBtZXNzYWdlIHdlIGNvdWxk
IHVzZSBpbnN0ZWFkPwo+IFVubGVzcyB5b3UgYXJlIGEgc2VydmVyIHVzZXIsIG1vc3QgZW5kIHVz
ZXJzIHdhbnQgdGhpcyBvcHRpb24gZW5hYmxlZC4KCkkgZG9uJ3QgdGhpbmsgYW55IGNvbXBpbGUt
dGltZSBvdXRwdXQgaXMgYSBnb29kIGlkZWEgaGVyZSwgYSAnbWFrZSAtcycKYnVpbGQgc2hvdWxk
IHJlYWxseSBoYXZlIG5vIG91dHB1dCB3aGF0c29ldmVyIChhbmQgdXN1YWxseSBkb2VzKS4KCkkg
c2VlIHRoYXQgRFJNX0FNRF9EQyBpcyBhbHJlYWR5ICdkZWZhdWx0IHknLCB3aGljaCBJIHdvdWxk
IGhvcGUKdG8gYmUgc3VmZmljaWVudC4gSWYgeW91IHdhbnQgc29tZXRoaW5nIHN0cm9uZ2VyIHRo
YW4gdGhhdCwgeW91IGNvdWxkCm1ha2UgaGlkZSB0aGUgb3B0aW9uIGFuZCBsZWF2ZSBpdCBhbHdh
eXMtb24gdW5sZXNzIENPTkZJR19FWFBFUlQKaXMgZW5hYmxlZDoKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2NvbmZpZwpiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9LY29uZmlnCmluZGV4IDJjZmJiZjNiODVkZC4uOTg2MmExOTMzNDlhIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvS2NvbmZpZwpAQCAtMyw3ICszLDcgQEAgbWVudSAiRGlzcGxheSBFbmdp
bmUgQ29uZmlndXJhdGlvbiIKICAgICAgICBkZXBlbmRzIG9uIERSTSAmJiBEUk1fQU1ER1BVCgog
Y29uZmlnIERSTV9BTURfREMKLSAgICAgICBib29sICJBTUQgREMgLSBFbmFibGUgbmV3IGRpc3Bs
YXkgZW5naW5lIgorICAgICAgIGJvb2wgIkFNRCBEQyAtIEVuYWJsZSBuZXcgZGlzcGxheSBlbmdp
bmUiIGlmIEVYUEVSVAogICAgICAgIGRlZmF1bHQgeQogICAgICAgIHNlbGVjdCBTTkRfSERBX0NP
TVBPTkVOVCBpZiBTTkRfSERBX0NPUkUKICAgICAgICBzZWxlY3QgRFJNX0FNRF9EQ19EQ04xXzAg
aWYgWDg2ICYmICEoS0NPVl9JTlNUUlVNRU5UX0FMTCAmJgpLQ09WX0VOQUJMRV9DT01QQVJJU09O
UykgJiYgIUNDX0lTX0NMQU5HCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
