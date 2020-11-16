Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1522B3ABC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 01:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAD389D9B;
	Mon, 16 Nov 2020 00:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D9989D8A;
 Mon, 16 Nov 2020 00:24:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p1so16863230wrf.12;
 Sun, 15 Nov 2020 16:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cNyJaglsofCPPDAMR4S0Dh1T3D7plfuh++VKVtz7Hpo=;
 b=ev8LtwyFSaNKRrRx7pPu2AaTYr+GoEQDc5ypjIypn8d3URLYWYepCKUD4jQ2HAfQyt
 zUJDOZDSr3wPgmUnLQYtMOcAdNkHBFsDtdwmzl2dY5nblyMysxXdjqJRTA3kDiqmpr3N
 R4UcZbeE+SAyVi55CQ8A1HHazqxrHohh1+lEiAOzshqR61OaDMJI3a1kpK4w4pB9k0hF
 GM0J4g5PZfBJWAvBI/p99fhjXNY3NtC8xZqv1zdK+UhFZQD/OzBgUkRUt7qN4SU1KvJn
 1Y79YPdGORcXaOhAbVNSUnAi6MU1pUmaJ3pcYrb7h7jEg9IZ9HphjDCRN1YaoSKgHOOJ
 kTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cNyJaglsofCPPDAMR4S0Dh1T3D7plfuh++VKVtz7Hpo=;
 b=or5GAVvP/bpwokX0si6MTux+OKts6Tlq6BMvD/ddtN8slkjo5DyErOb9so3thHjLFo
 IDRoiwJ4ulghVr1A0DO4MzU6h4q452ftFP79239yt1y6pho85VrG0+OtigzpuInBzMag
 z+/Hh/EIgOfEUhL5f/yZT/HmYbEu+2dfdTrLCKDN2Ai92b764CY/d9haLx75Jeee57tn
 GjbCjFyC76m7tF2IEeejoHuY1c1IbyGGMXw3CwIkBlHZFlBJ//S6cGaak7Opu7jjOimN
 pewJbPmMMO50ZW6jJqqO+Ec7mWPioObhHAmaL7Iu4V4sJ2Oyd3Fc4jxXVMhivH3EF3IX
 NWJw==
X-Gm-Message-State: AOAM530+k6HQdulpj+9Byx9seER5m1lTX+BugtBxvy+eQicFHv8ttzdx
 yL/Gab3J2G+8XexjR1tXOLp/kfWXJ3MT6Ukg9xo=
X-Google-Smtp-Source: ABdhPJzuP/OHR/ocOpMW01DpmGfyfswGucCY7SFqSWa8kgTGj1RtRDpRNA8MsNFvnXArM0aS8ovHypBm4nz5jxkK+L4=
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr15592102wrr.85.1605486296694; 
 Sun, 15 Nov 2020 16:24:56 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-24-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-24-lee.jones@linaro.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 16 Nov 2020 08:24:45 +0800
Message-ID: <CAKGbVbuy2eeQF_AuuoAVDtjPOD1pNsqdegva_hb9U1N2BqNoUw@mail.gmail.com>
Subject: Re: [PATCH 23/40] drm/lima/lima_sched: Remove unused and unnecessary
 variable 'ret'
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LgoKT24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgOTo1MCBQ
TSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBm
b2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2Ry
bS9saW1hL2xpbWFfc2NoZWQuYzogSW4gZnVuY3Rpb24g4oCYbGltYV9zY2hlZF9ydW5fam9i4oCZ
Ogo+ICBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3NjaGVkLmM6MjI3OjIwOiB3YXJuaW5nOiB2
YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KPgo+IENjOiBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT4KPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6ICJD
aHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbWFAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxp
c3RzLmxpbmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3NjaGVkLmMgfCAzICst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jIGIvZHJpdmVycy9n
cHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jCj4gaW5kZXggYTA3MGE4NWY4ZjM2OC4uNjNiNGM1NjQz
ZjljZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3NjaGVkLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3NjaGVkLmMKPiBAQCAtMjI0LDcgKzIyNCw2
IEBAIHN0YXRpYyBzdHJ1Y3QgZG1hX2ZlbmNlICpsaW1hX3NjaGVkX3J1bl9qb2Ioc3RydWN0IGRy
bV9zY2hlZF9qb2IgKmpvYikKPiAgICAgICAgIHN0cnVjdCBsaW1hX3NjaGVkX3BpcGUgKnBpcGUg
PSB0b19saW1hX3BpcGUoam9iLT5zY2hlZCk7Cj4gICAgICAgICBzdHJ1Y3QgbGltYV9kZXZpY2Ug
KmxkZXYgPSBwaXBlLT5sZGV2Owo+ICAgICAgICAgc3RydWN0IGxpbWFfZmVuY2UgKmZlbmNlOwo+
IC0gICAgICAgc3RydWN0IGRtYV9mZW5jZSAqcmV0Owo+ICAgICAgICAgaW50IGksIGVycjsKPgo+
ICAgICAgICAgLyogYWZ0ZXIgR1BVIHJlc2V0ICovCj4gQEAgLTI0Niw3ICsyNDUsNyBAQCBzdGF0
aWMgc3RydWN0IGRtYV9mZW5jZSAqbGltYV9zY2hlZF9ydW5fam9iKHN0cnVjdCBkcm1fc2NoZWRf
am9iICpqb2IpCj4gICAgICAgICAvKiBmb3IgY2FsbGVyIHVzYWdlIG9mIHRoZSBmZW5jZSwgb3Ro
ZXJ3aXNlIGlycSBoYW5kbGVyCj4gICAgICAgICAgKiBtYXkgY29uc3VtZSB0aGUgZmVuY2UgYmVm
b3JlIGNhbGxlciB1c2UgaXQKPiAgICAgICAgICAqLwo+IC0gICAgICAgcmV0ID0gZG1hX2ZlbmNl
X2dldCh0YXNrLT5mZW5jZSk7Cj4gKyAgICAgICBkbWFfZmVuY2VfZ2V0KHRhc2stPmZlbmNlKTsK
Pgo+ICAgICAgICAgcGlwZS0+Y3VycmVudF90YXNrID0gdGFzazsKPgo+IC0tCj4gMi4yNS4xCj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
