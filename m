Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9A5CB567
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E5B6EAF8;
	Fri,  4 Oct 2019 07:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89346E15C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 21:14:41 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t10so417240plr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 14:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iHYXT2MapQxKdVQ7MnzMSwJjofrDGs/mMoboG0lEVTY=;
 b=fP6RY+Y5HTesSphkEibSMhf/1fpTB5tBEWSoF4WdXPWz7n9RpqGkvyS8bgqxFCk5m4
 9Zma1XWDn/ilFuQdbkz/zIYfuPrNgbzcmOPgEMgyJNiO0h7qoiFbKqD4+eL+5y86EtOF
 RUhFKQ/CU0AubZN2cE2nodXtpmPdtmYkAemKHHcisRG97pUXOrtl9hvpqD8pEUKXgG/O
 Nx2xnqRRfhOZuO7ZX4iRBa+VttpSfo6DQMsOFZsdsdbYn8itM9lyOCKU3Gw4lIOJotGe
 BmYzTI7yK/QKxBLkH5Yf2yjccF9Zty67gjz9fngEpUHQ8gFrZMwdkMMXTOPvdCjli6tZ
 1Qyw==
X-Gm-Message-State: APjAAAWFOdURiDJF1okgITB/RLtGrv3gedK/H3qMvkvphEbbvtmq+vuL
 tO6WJjbPn2Ky2enzwEt3y3N5nWUnXkuFDWE6js4eSA==
X-Google-Smtp-Source: APXvYqxscMTSRx/XiSzosNRZGgs61rijzLWHJd6F0wCfXuLQb53BowxR8X4US85qSpRvMEwBdGgmXlVN1rxd4bJrnCY=
X-Received: by 2002:a17:902:7c08:: with SMTP id
 x8mr5677826pll.119.1570050880892; 
 Wed, 02 Oct 2019 14:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120136.1777161-1-arnd@arndb.de>
 <20191002120136.1777161-5-arnd@arndb.de>
In-Reply-To: <20191002120136.1777161-5-arnd@arndb.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Oct 2019 14:14:29 -0700
Message-ID: <CAKwvOdmjM80XP7VH83iLn=8mz6W1+SbXST2FChEnH0LSRRm4pA@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/amd/display: fix dcn21 Makefile for clang
To: Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iHYXT2MapQxKdVQ7MnzMSwJjofrDGs/mMoboG0lEVTY=;
 b=q9BbE0GObEk4vG/jJQ0YhLUz1bCBYIbTLNZetkjn6SHRgl3kt8KZJrGK1Tsh2z6ny3
 rvHM0yq5mK/VsmL5dflFyowjNdGsZLa3DqmZurfCRLnoFFe9PLQFznn2ekPcO1ZQ7h4/
 LT2HcpG8jJCe3Qz0l/FHM95jgQSltvUcOmtvBNFNJFU4E+e4Bzh/5pm7ylzLg8Wjl4H0
 f+qkN1H/r8SXX07bGvr+mIDfaUG7pZ62TyLGVWu7gva2uU8wXztk/EI4fmdyTi5jufU7
 xItUvO0XmbH9ob6UK2tvmz4vHwQ1KmB61cN//NqcoJgAFvtlE3ZHuok5RFNzlVOHEXNy
 2Iyw==
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
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCA1OjAzIEFNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+IHdyb3RlOgo+Cj4gSnVzdCBsaWtlIGFsbCB0aGUgb3RoZXIgdmFyaWFudHMsIHRoaXMgb25l
IHBhc3NlcyBpbnZhbGlkCj4gY29tcGlsZS10aW1lIG9wdGlvbnMgd2l0aCBjbGFuZyBhZnRlciB0
aGUgbmV3IGNvZGUgZ290Cj4gbWVyZ2VkOgo+Cj4gY2xhbmc6IGVycm9yOiB1bmtub3duIGFyZ3Vt
ZW50OiAnLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9NCcKPiBzY3JpcHRzL01ha2VmaWxlLmJ1
aWxkOjI2NTogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UubycgZmFpbGVkCj4KPiBVc2UgdGhlIHNh
bWUgdmFyaWFudCB0aGF0IHdlIGhhdmUgZm9yIGRjbjIwIHRvIGZpeCBjb21waWxhdGlvbi4KPgo+
IEZpeGVzOiBlY2VkNTFmOWJhYmIgKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBodWJwIGJsb2NrIGZv
ciBSZW5vaXIgKHYyKSIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4KClRoYW5rcyBmb3IgdGhlIHBhdGNoIQpSZXZpZXdlZC1ieTogTmljayBEZXNhdWxuaWVy
cyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+ClRlc3RlZC1ieTogTmljayBEZXNhdWxuaWVycyA8
bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+CihUaG91Z2ggSSB0aGluayBpdCdzIGFscmVhZHkgYmVl
biBtZXJnZWQpCgpBbGV4LCBkbyB5b3Uga25vdyB3aHkgdGhlIEFNREdQVSBkcml2ZXIgdXNlcyBh
IGRpZmZlcmVudCBzdGFjawphbGlnbm1lbnQgKDE2QikgdGhhbiB0aGUgcmVzdCBvZiB0aGUgeDg2
IGtlcm5lbD8gIChzZWUKYXJjaC94ODYvTWFrZWZpbGUgd2hpY2ggdXNlcyA4QiBzdGFjayBhbGln
bm1lbnQpLgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL01h
a2VmaWxlIHwgMTIgKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIxL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIxL01ha2VmaWxlCj4gaW5kZXggOGNkOWRlOGIxYTdhLi5lZjY3M2JmZmMyNDEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL01ha2VmaWxlCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL01ha2VmaWxlCj4gQEAg
LTMsNyArMywxNyBAQAo+Cj4gIERDTjIxID0gZGNuMjFfaHVicC5vIGRjbjIxX2h1YmJ1Yi5vIGRj
bjIxX3Jlc291cmNlLm8KPgo+IC1DRkxBR1NfJChBTUREQUxQQVRIKS9kYy9kY24yMS9kY24yMV9y
ZXNvdXJjZS5vIDo9IC1taGFyZC1mbG9hdCAtbXNzZSAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFy
eT00Cj4gK2lmbmVxICgkKGNhbGwgY2Mtb3B0aW9uLCAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFy
eT00KSwpCj4gKyAgICAgICBjY19zdGFja19hbGlnbiA6PSAtbXByZWZlcnJlZC1zdGFjay1ib3Vu
ZGFyeT00Cj4gK2Vsc2UgaWZuZXEgKCQoY2FsbCBjYy1vcHRpb24sIC1tc3RhY2stYWxpZ25tZW50
PTE2KSwpCj4gKyAgICAgICBjY19zdGFja19hbGlnbiA6PSAtbXN0YWNrLWFsaWdubWVudD0xNgo+
ICtlbmRpZgo+ICsKPiArQ0ZMQUdTXyQoQU1EREFMUEFUSCkvZGMvZGNuMjEvZGNuMjFfcmVzb3Vy
Y2UubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgJChjY19zdGFja19hbGlnbikKPiArCj4gK2lmZGVm
IENPTkZJR19DQ19JU19DTEFORwo+ICtDRkxBR1NfJChBTUREQUxQQVRIKS9kYy9kY24yMS9kY24y
MV9yZXNvdXJjZS5vICs9IC1tc3NlMgo+ICtlbmRpZgo+Cj4gIEFNRF9EQUxfRENOMjEgPSAkKGFk
ZHByZWZpeCAkKEFNRERBTFBBVEgpL2RjL2RjbjIxLywkKERDTjIxKSkKPgo+IC0tCj4gMi4yMC4w
Cj4KPiAtLQo+IFlvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNj
cmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMgIkNsYW5nIEJ1aWx0IExpbnV4IiBncm91cC4KPiBU
byB1bnN1YnNjcmliZSBmcm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3AgcmVjZWl2aW5nIGVtYWlscyBm
cm9tIGl0LCBzZW5kIGFuIGVtYWlsIHRvIGNsYW5nLWJ1aWx0LWxpbnV4K3Vuc3Vic2NyaWJlQGdv
b2dsZWdyb3Vwcy5jb20uCj4gVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24gdGhlIHdlYiB2aXNp
dCBodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvY2xhbmctYnVpbHQtbGludXgvMjAx
OTEwMDIxMjAxMzYuMTc3NzE2MS01LWFybmQlNDBhcm5kYi5kZS4KCgoKLS0gClRoYW5rcywKfk5p
Y2sgRGVzYXVsbmllcnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
