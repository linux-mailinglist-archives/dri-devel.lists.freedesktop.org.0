Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CF068631
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 11:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EDA89715;
	Mon, 15 Jul 2019 09:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D1C89718;
 Mon, 15 Jul 2019 09:21:06 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id y26so14851048qto.4;
 Mon, 15 Jul 2019 02:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VxKKZuQtCI1ZkIIYkRW9QnKWr4iswbDh01TB7Vwu9Eo=;
 b=UYvhLEeaPUgjnBgmYBznYCrLJzQy99jIhejMylDfe25b7eGJsQYHNwTPk+seDqVKnJ
 Xg32Z5tYOOrush7smnBZDHwcRWjf82WTmyj9i2EVl+c2omCZDI2VwXtTuKtjqOiPPV2r
 jl8JYu+zJ95RjZbGVs+uAiSdOsGU2CsRaxdYuHxtzhAD269qQ4mqmMWuapayZUPKcs+u
 frLyPOwrbNyhGSD2ImDKLhHmshcGaanjDkPnTuJJPSEVmN69OVcvHmZ1c9M09KhIlEPo
 lh5U4XnaYp9zcN01myTkMujkd77T1ORl9H3ZMwK5p3dlEUQXAKYeySHsBn/2KCHhuoVu
 1m3A==
X-Gm-Message-State: APjAAAU+it+XYhxmQssfJvjNmTtBuYM2Utf/Xv7abClAm4Yk/WzLENES
 H/vF15hX+BCuzkxeJh9mmmn1mUzHbCv+P7b+glk=
X-Google-Smtp-Source: APXvYqzbLgU/zk6+aWcCuPJHWM96YBukyXO3Tbp280xuz2YfGvj8YrJR3gNAcwgYOhyCNbbuJuuJq+IUsUHr6xXIiRU=
X-Received: by 2002:ac8:5311:: with SMTP id t17mr16507653qtn.304.1563182465343; 
 Mon, 15 Jul 2019 02:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190708135725.844960-1-arnd@arndb.de>
 <20190708145430.GC43693@archlinux-epyc>
 <CAK8P3a0ZVqEYCxoCOcAgJL7oV+su0=eZu_XR6X+9vcXzGDwVSQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0ZVqEYCxoCOcAgJL7oV+su0=eZu_XR6X+9vcXzGDwVSQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Jul 2019 11:20:48 +0200
Message-ID: <CAK8P3a0FyzThq_8dO27OxP7nXVORGf5jQQnfUnnG0u272ChRtQ@mail.gmail.com>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
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

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCA2OjA1IFBNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+IHdyb3RlOgo+IE9uIE1vbiwgSnVsIDgsIDIwMTkgYXQgNDo1NCBQTSBOYXRoYW4gQ2hhbmNl
bGxvcgo+IDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+IHdyb3RlOgoKPiA+IE9uIE1vbiwgSnVs
IDA4LCAyMDE5IGF0IDAzOjU3OjA2UE0gKzAyMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiA+
IEEgY291cGxlIG9mIGNhbGxzIHRvIHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcSgpIGFuZCBzbXVf
Zm9yY2VfY2xrX2xldmVscygpCj4gPiA+IHBhc3MgY29uc3RhbnRzIG9mIHRoZSB3cm9uZyB0eXBl
LCBsZWFkaW5nIHRvIHdhcm5pbmdzIHdpdGggY2xhbmctODoKPiA+ID4KPiA+ID4gZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYzo5OTU6Mzk6IGVycm9y
OiBpbXBsaWNpdCBjb252ZXJzaW9uIGZyb20gZW51bWVyYXRpb24gdHlwZSAnUFBDTEtfZScgdG8g
ZGlmZmVyZW50IGVudW1lcmF0aW9uIHR5cGUgJ2VudW0gc211X2Nsa190eXBlJyBbLVdlcnJvciwt
V2VudW0tY29udmVyc2lvbl0KPiA+ID4gICAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRfY3Vy
cmVudF9jbGtfZnJlcShzbXUsIFBQQ0xLX1NPQ0NMSywgJm5vdyk7Cj4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5efn5+fn5+fn5+fn5+fn5+
fn5+Cj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS9pbmMvYW1k
Z3B1X3NtdS5oOjc3NTo4Mjogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAnc211X2dldF9jdXJy
ZW50X2Nsa19mcmVxJwo+ID4gPiAgICAgICAgICgoc211KS0+ZnVuY3MtPmdldF9jdXJyZW50X2Ns
a19mcmVxPyAoc211KS0+ZnVuY3MtPmdldF9jdXJyZW50X2Nsa19mcmVxKChzbXUpLCAoY2xrX2lk
KSwgKHZhbHVlKSkgOiAwKQo+ID4gPgo+ID4gPiBJIGNvdWxkIG5vdCBmaWd1cmUgb3V0IHdoYXQg
dGhlIHB1cnBvc2UgaXMgb2YgbWl4aW5nIHRoZSB0eXBlcwo+ID4gPiBsaWtlIHRoaXMgYW5kIGlm
IGl0IGlzIHdyaXR0ZW4gbGlrZSB0aGlzIGludGVudGlvbmFsbHkuCj4gPiA+IEFzc3VtaW5nIHRo
aXMgaXMgYWxsIGNvcnJlY3QsIGFkZGluZyBhbiBleHBsaWN0IGNhc2UgaXMgYW4KPiA+ID4gZWFz
eSB3YXkgdG8gc2h1dCB1cCB0aGUgd2FybmluZ3MuCj4gPiA+Cj4gPiA+IEZpeGVzOiBiYzBmY2Zm
ZDM2YmEgKCJkcm0vYW1kL3Bvd2VycGxheTogVW5pZnkgc211IGhhbmRsZSB0YXNrIGZ1bmN0aW9u
ICh2MikiKQo+ID4gPiBGaXhlczogMDk2NzYxMDE0MjI3ICgiZHJtL2FtZC9wb3dlcnBsYXk6IHN1
cHBvcnQgc3lzZnMgdG8gZ2V0IHNvY2NsaywgZmNsaywgZGNlZmNsayIpCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPgo+ID4gSSBzZW50IGEgc2Vy
aWVzIGxhc3Qgd2VlayBmb3IgYWxsIG9mIHRoZSBjbGFuZyB3YXJuaW5ncyB0aGF0IHdlcmUgYWRk
ZWQKPiA+IGluIHRoaXMgZHJpdmVyIHJlY2VudGx5Lgo+ID4KPiA+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAxOTA3MDQwNTUyMTcuNDU4NjAtMS1uYXRlY2hhbmNlbGxvckBnbWFpbC5j
b20vCj4gPgo+ID4gSSB0aGluayBpdCBpcyBzYWZlIHRvIHVzZSB0aGUgQ0xLIGVudW1zIGZyb20g
dGhlIGV4cGVjdGVkIHR5cGUgKGZyb20KPiA+IHdoYXQgSSBjb3VsZCBzZWUgZnJvbSBnb2luZyBk
b3duIHRoZSBjb2RlIGZsb3cgcmFiYml0IGhvbGUpLgo+ID4KPiA+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAxOTA3MDQwNTUyMTcuNDU4NjAtNC1uYXRlY2hhbmNlbGxvckBnbWFpbC5j
b20vCj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDcwNDA1NTIxNy40
NTg2MC03LW5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbS8KPgo+IEkgdHJpZWQgdGhhdCBhdCBmaXJz
dCBidXQgY29uY2x1ZGVkIHRoYXQgaXQgY291bGQgbm90IHdvcmsgYmVjYXVzZSB0aGUgY29uc3Rh
bnRzCj4gYXJlIGRpZmZlcmVudC4gRWl0aGVyIGl0J3MgY3VycmVudGx5IGJyb2tlbiBhbmQgeW91
IHBhdGNoZXMgZml4IHRoZSBydW50aW1lCj4gYmVoYXZpb3IsIG9yIGl0J3MgY3VycmVudGx5IGNv
cnJlY3QgYW5kIHlvdXIgcGF0Y2hlcyBicmVhayBpdC4KCmQzNjg5MzM2MmQyMiAoImRybS9hbWQv
cG93ZXJwbGF5OiBmaXggc211IGNsb2NrIHR5cGUgY2hhbmdlIG1pc3MgZXJyb3IiKQp3YXMgbm93
IGFwcGxpZWQgYW5kIGNvbnRhaW5zIHRoZSBzYW1lIGNoYW5nZSBhcyB5b3VyIGZpcnN0IHBhdGNo
LgoKSSBhc3N1bWUgdGhlIG90aGVyIG9uZSBpcyBzdGlsbCBuZWVkZWQgdGhvdWdoLgoKICAgICAg
IEFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
