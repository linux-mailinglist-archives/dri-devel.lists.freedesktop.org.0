Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16B6259C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEE4890BA;
	Mon,  8 Jul 2019 16:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B22890BA;
 Mon,  8 Jul 2019 16:05:23 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id d15so13713959qkl.4;
 Mon, 08 Jul 2019 09:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kh/BqHC53KszKDDOpA1m9G0Zdhod2Cc0oo542rySQuM=;
 b=XJSoMDzpym8cuEVEjW3Gp9uYd0/XX6P4BwwhIHoFwzCwhOcw1w9Fw0rVEF2xqx9l1W
 9SQANgWfDeysP7sNmDSH0A8DfA2yTd/6JYfnjlgUgI7ypg+P5x0r+Avr/DaNIb5HgHUe
 XMOUZYKhQRfAGcBu3Q30BefI4qHx2+FE/U4fZitw1PvKctsgfvmo0oGQF0dyvbc1jw+D
 sd1Kx5NOuL07kkZr1azfN33B7fPPqMybr6OmUGlYoWIGMw5kSJ/j4RmydYS+EjS0WrJt
 U4L4dOL6C03N3oz3oLvvgwCjGpaT5fOMJ389UCSAoDoChu5nfvpqt9O+VaPxurfgUNjo
 l6iw==
X-Gm-Message-State: APjAAAX4RsoM69xuh+8KmnhIGDIbeMZjoGiDQ/jHjOGfOoOPk1eKdcoy
 /ircsXbfqLHDL827UzdrZjEt56YjwwqDgJWy0jc=
X-Google-Smtp-Source: APXvYqwyv3Wsnbd3JvCrgK22inUca15kYBzFQXL7xYy/IZBjNUUDOrMciDAzwaFOOJJ74XiHvWkpVIhSZJrpbV49MPk=
X-Received: by 2002:a37:76c5:: with SMTP id
 r188mr14771430qkc.394.1562601922991; 
 Mon, 08 Jul 2019 09:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190708135725.844960-1-arnd@arndb.de>
 <20190708145430.GC43693@archlinux-epyc>
In-Reply-To: <20190708145430.GC43693@archlinux-epyc>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 8 Jul 2019 18:05:06 +0200
Message-ID: <CAK8P3a0ZVqEYCxoCOcAgJL7oV+su0=eZu_XR6X+9vcXzGDwVSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: work around enum conversion warnings
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
Cc: Gui Chengming <Jack.Gui@amd.com>, David Airlie <airlied@linux.ie>,
 Kevin Wang <kevin1.wang@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCA0OjU0IFBNIE5hdGhhbiBDaGFuY2VsbG9yCjxuYXRlY2hh
bmNlbGxvckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQXJuZCwKPgo+IE9uIE1vbiwgSnVsIDA4
LCAyMDE5IGF0IDAzOjU3OjA2UE0gKzAyMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBBIGNv
dXBsZSBvZiBjYWxscyB0byBzbXVfZ2V0X2N1cnJlbnRfY2xrX2ZyZXEoKSBhbmQgc211X2ZvcmNl
X2Nsa19sZXZlbHMoKQo+ID4gcGFzcyBjb25zdGFudHMgb2YgdGhlIHdyb25nIHR5cGUsIGxlYWRp
bmcgdG8gd2FybmluZ3Mgd2l0aCBjbGFuZy04Ogo+ID4KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL3Bvd2VycGxheS92ZWdhMjBfcHB0LmM6OTk1OjM5OiBlcnJvcjogaW1wbGljaXQg
Y29udmVyc2lvbiBmcm9tIGVudW1lcmF0aW9uIHR5cGUgJ1BQQ0xLX2UnIHRvIGRpZmZlcmVudCBl
bnVtZXJhdGlvbiB0eXBlICdlbnVtIHNtdV9jbGtfdHlwZScgWy1XZXJyb3IsLVdlbnVtLWNvbnZl
cnNpb25dCj4gPiAgICAgICAgICAgICAgICAgcmV0ID0gc211X2dldF9jdXJyZW50X2Nsa19mcmVx
KHNtdSwgUFBDTEtfU09DQ0xLLCAmbm93KTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICB+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaDo3NzU6ODI6
IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ3NtdV9nZXRfY3VycmVudF9jbGtfZnJlcScKPiA+
ICAgICAgICAgKChzbXUpLT5mdW5jcy0+Z2V0X2N1cnJlbnRfY2xrX2ZyZXE/IChzbXUpLT5mdW5j
cy0+Z2V0X2N1cnJlbnRfY2xrX2ZyZXEoKHNtdSksIChjbGtfaWQpLCAodmFsdWUpKSA6IDApCj4g
Pgo+ID4gSSBjb3VsZCBub3QgZmlndXJlIG91dCB3aGF0IHRoZSBwdXJwb3NlIGlzIG9mIG1peGlu
ZyB0aGUgdHlwZXMKPiA+IGxpa2UgdGhpcyBhbmQgaWYgaXQgaXMgd3JpdHRlbiBsaWtlIHRoaXMg
aW50ZW50aW9uYWxseS4KPiA+IEFzc3VtaW5nIHRoaXMgaXMgYWxsIGNvcnJlY3QsIGFkZGluZyBh
biBleHBsaWN0IGNhc2UgaXMgYW4KPiA+IGVhc3kgd2F5IHRvIHNodXQgdXAgdGhlIHdhcm5pbmdz
Lgo+ID4KPiA+IEZpeGVzOiBiYzBmY2ZmZDM2YmEgKCJkcm0vYW1kL3Bvd2VycGxheTogVW5pZnkg
c211IGhhbmRsZSB0YXNrIGZ1bmN0aW9uICh2MikiKQo+ID4gRml4ZXM6IDA5Njc2MTAxNDIyNyAo
ImRybS9hbWQvcG93ZXJwbGF5OiBzdXBwb3J0IHN5c2ZzIHRvIGdldCBzb2NjbGssIGZjbGssIGRj
ZWZjbGsiKQo+ID4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
Pgo+IEkgc2VudCBhIHNlcmllcyBsYXN0IHdlZWsgZm9yIGFsbCBvZiB0aGUgY2xhbmcgd2Fybmlu
Z3MgdGhhdCB3ZXJlIGFkZGVkCj4gaW4gdGhpcyBkcml2ZXIgcmVjZW50bHkuCj4KPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwNzA0MDU1MjE3LjQ1ODYwLTEtbmF0ZWNoYW5jZWxs
b3JAZ21haWwuY29tLwo+Cj4gSSB0aGluayBpdCBpcyBzYWZlIHRvIHVzZSB0aGUgQ0xLIGVudW1z
IGZyb20gdGhlIGV4cGVjdGVkIHR5cGUgKGZyb20KPiB3aGF0IEkgY291bGQgc2VlIGZyb20gZ29p
bmcgZG93biB0aGUgY29kZSBmbG93IHJhYmJpdCBob2xlKS4KPgo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAxOTA3MDQwNTUyMTcuNDU4NjAtNC1uYXRlY2hhbmNlbGxvckBnbWFpbC5j
b20vCj4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwNzA0MDU1MjE3LjQ1ODYw
LTctbmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tLwoKSSB0cmllZCB0aGF0IGF0IGZpcnN0IGJ1dCBj
b25jbHVkZWQgdGhhdCBpdCBjb3VsZCBub3Qgd29yayBiZWNhdXNlIHRoZSBjb25zdGFudHMKYXJl
IGRpZmZlcmVudC4gRWl0aGVyIGl0J3MgY3VycmVudGx5IGJyb2tlbiBhbmQgeW91IHBhdGNoZXMg
Zml4IHRoZSBydW50aW1lCmJlaGF2aW9yLCBvciBpdCdzIGN1cnJlbnRseSBjb3JyZWN0IGFuZCB5
b3VyIHBhdGNoZXMgYnJlYWsgaXQuCgogICAgICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
