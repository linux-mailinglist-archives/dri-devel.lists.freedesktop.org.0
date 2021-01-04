Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6162E9B38
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 17:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EABF89EA3;
	Mon,  4 Jan 2021 16:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9464289EA3;
 Mon,  4 Jan 2021 16:42:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5091C22515;
 Mon,  4 Jan 2021 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609778562;
 bh=vHhDGpH+kJ92x/vxH7wSwzQvQEiINTomNv/bf16s8Do=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qtOGaM/5CBVUn7gdlEgK7HwbJptZwiuXnSVPt4YqQ4ytWVDBUtPO/N658vzIu2mGx
 cqXqh6uLt5Es9iUGWjTmfbxhW+7hjDGWO1jBp9N18NUta50HmUY/ut9PxhxyrGMZh/
 pKQJOASODlqV+vjyD0RGs2uxlQ/lZi2A57KmB309Zb1AvUrIUAr58sEaQaMbRqjzbr
 x3iuoXD/WXkNUATLivVMSNWOKT+rNT2F5Tm7hxX6WFWIyLE9+AMkfKAtQyHZ8ITwWr
 XccImhQbUfx8wowOXUlUB10aDpyigwsZOp204JpLURb/+pgZA67HIpSPJim20+zVBi
 mPo5MgC7ieSGg==
Received: by mail-oi1-f172.google.com with SMTP id d203so32797032oia.0;
 Mon, 04 Jan 2021 08:42:42 -0800 (PST)
X-Gm-Message-State: AOAM532RbodvdNBTVZCQ1+K+JMsHulEL4FzfhECp9Kpz15L8Bc9V665/
 3x7rKJfUq38VbQqyU+5iLsXGgolVFlUMg4uiWII=
X-Google-Smtp-Source: ABdhPJy6J7/TTaWq29RIoatM1yZ2xJM42WbqnCRyecqLGwZO8yVCb4U8CMHjwG/ylLWtKtrLV1vr9OWccB79L8zNhUs=
X-Received: by 2002:aca:d98a:: with SMTP id q132mr18702655oig.33.1609778561628; 
 Mon, 04 Jan 2021 08:42:41 -0800 (PST)
MIME-Version: 1.0
References: <20201214175225.38975-1-ardb@kernel.org>
 <CADnq5_M-U5QO_tmQQ8Q+v+kZXvUc7vjXnmKWYFjX1FmOJYk1OQ@mail.gmail.com>
 <CAMj1kXHnPXqBnQsNQh3nJxDePxK=D55KES3BdVeJ0cFvYxAXAg@mail.gmail.com>
 <CAMj1kXE7Z7=YJq4qYaB9NDDwi8nsXsg-KEXQ8V9wQB=uLCsdrw@mail.gmail.com>
 <CADnq5_PKV4Hekm9Dd_1U2e2RAeb3Mhz_uFSCabWgBNk2gCaAYw@mail.gmail.com>
In-Reply-To: <CADnq5_PKV4Hekm9Dd_1U2e2RAeb3Mhz_uFSCabWgBNk2gCaAYw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 4 Jan 2021 17:42:30 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFrCnGLsS-aRgHMss659trfrULH+g_ZjYfa-Sb10W6TiA@mail.gmail.com>
Message-ID: <CAMj1kXFrCnGLsS-aRgHMss659trfrULH+g_ZjYfa-Sb10W6TiA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Revert "add DCN support for aarch64"
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Catalin Marinas <catalin.marinas@arm.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Martin <dave.martin@arm.com>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Kolesa <daniel@octaforge.org>, Alex Deucher <alexander.deucher@amd.com>,
 Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCA0IEphbiAyMDIxIGF0IDE3OjI3LCBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIERlYyAyOSwgMjAyMCBhdCA4OjE3IEFNIEFyZCBC
aWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgMTYgRGVj
IDIwMjAgYXQgMjM6MjYsIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4gPgo+ID4gPiBPbiBXZWQsIDE2IERlYyAyMDIwIGF0IDE5OjAwLCBBbGV4IERldWNoZXIgPGFs
ZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIERlYyAx
NCwgMjAyMCBhdCAxMjo1MyBQTSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3cm90
ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIHJldmVydHMgY29tbWl0IGMzOGQ0NDRlNDRiYWRj
NTU3Y2YyOWZkZmRmYjgyMzYwNDg5MGNjZmEuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2ltcGx5IGRp
c2FibGluZyAtbWdlbmVyYWwtcmVncy1vbmx5IGxlZnQgYW5kIHJpZ2h0IGlzIHJpc2t5LCBnaXZl
biB0aGF0Cj4gPiA+ID4gPiB0aGUgc3RhbmRhcmQgQUFyY2g2NCBBQkkgcGVybWl0cyB0aGUgdXNl
IG9mIEZQL1NJTUQgcmVnaXN0ZXJzIGFueXdoZXJlLAo+ID4gPiA+ID4gYW5kIEdDQyBpcyBrbm93
biB0byB1c2UgU0lNRCByZWdpc3RlcnMgZm9yIHNwaWxsaW5nLCBhbmQgbWF5IGludmVudAo+ID4g
PiA+ID4gb3RoZXIgdXNlcyBvZiB0aGUgRlAvU0lNRCByZWdpc3RlciBmaWxlIHRoYXQgaGF2ZSBu
b3RoaW5nIHRvIGRvIHdpdGggdGhlCj4gPiA+ID4gPiBmbG9hdGluZyBwb2ludCBjb2RlIGluIHF1
ZXN0aW9uLiBOb3RlIHRoYXQgcHV0dGluZyBrZXJuZWxfbmVvbl9iZWdpbigpCj4gPiA+ID4gPiBh
bmQga2VybmVsX25lb25fZW5kKCkgYXJvdW5kIHRoZSBjb2RlIHRoYXQgZG9lcyB1c2UgRlAgaXMg
bm90IHN1ZmZpY2llbnQKPiA+ID4gPiA+IGhlcmUsIHRoZSBwcm9ibGVtIGlzIGluIGFsbCB0aGUg
b3RoZXIgY29kZSB0aGF0IG1heSBiZSBlbWl0dGVkIHdpdGgKPiA+ID4gPiA+IHJlZmVyZW5jZXMg
dG8gU0lNRCByZWdpc3RlcnMgaW4gaXQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU28gdGhlIG9ubHkg
d2F5IHRvIGRvIHRoaXMgcHJvcGVybHkgaXMgdG8gcHV0IGFsbCBmbG9hdGluZyBwb2ludCBjb2Rl
IGluCj4gPiA+ID4gPiBhIHNlcGFyYXRlIGNvbXBpbGF0aW9uIHVuaXQsIGFuZCBvbmx5IGNvbXBp
bGUgdGhhdCB1bml0IHdpdGgKPiA+ID4gPiA+IC1tZ2VuZXJhbC1yZWdzLW9ubHkuIEJ1dCBwZXJo
YXBzIHRoZSB1c2Ugb2YgZmxvYXRpbmcgcG9pbnQgaGVyZSBpcwo+ID4gPiA+ID4gc29tZXRoaW5n
IHRoYXQgc2hvdWxkIGJlIHJlY29uc2lkZXJlZCBlbnRpcmVseS4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBDYzogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiA+ID4gPiA+
IENjOiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPgo+ID4gPiA+ID4gQ2M6IERhdmUgTWFy
dGluIDxkYXZlLm1hcnRpbkBhcm0uY29tPgo+ID4gPiA+ID4gQ2M6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+Cj4gPiA+ID4gPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4g
PiA+ID4gPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+ID4g
PiA+ID4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
ID4gPiA+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gPiA+IENj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiA+ID4gPiBDYzogRGFuaWVsIEtv
bGVzYSA8ZGFuaWVsQG9jdGFmb3JnZS5vcmc+Cj4gPiA+ID4gPiBDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiA+ID4gPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwu
b3JnPgo+ID4gPiA+Cj4gPiA+ID4gQ2FuIHJlYmFzZSB0aGlzIG9uIExpbnVzJyBtYXN0ZXIgYnJh
bmNoPyAgVGhlcmUgd2VyZSBhIG51bWJlciBvZiBuZXcKPiA+ID4gPiBhc2ljcyBhZGRlZCB3aGlj
aCBjb3B5IHBhc3RlZCB0aGUgQVJNNjQgc3VwcG9ydC4KPiA+ID4gPgo+ID4gPgo+ID4gPiBOb3Qg
c3VyZSB3aGF0IHlvdSBhcmUgYXNraW5nIG1lIGhlcmUuIFJldmVydGluZyBjb21taXQgYzM4ZDQ0
NGU0NGJhZGM1Cj4gPiA+IG9uIHRvcCBvZiBtYWlubGluZSBpcyBub3QgZ29pbmcgdG8gZml4IHRo
ZSBvdGhlciBjb2RlIHRoYXQgd2FzIGFkZGVkLgo+ID4gPiBPciBhcmUgeW91IGFza2luZyBtZSB0
byBnbyBhbmQgZmluZCB0aGUgcGF0Y2hlcyAoaG93IG1hbnk/KSB0aGF0IGFkZGVkCj4gPiA+IG5l
dyBBU0lDcyBhbmQgZml4IHRoZW0gZm9yIGFybTY0Pwo+ID4gPgo+ID4gPiBOb3RlIHRoYXQgdGhp
cyBjb2RlIGlzIGNyaXRpY2FsbHkgYnJva2VuLCBhcyBpdCBtYXkgY29ycnVwdCB1c2VyCj4gPiA+
IHByb2Nlc3Mgc3RhdGUgYXJiaXRyYXJpbHkuIFNvIGlmIG5ldyBjb2RlIHdhcyBhZGRlZCB0aGF0
IGNvbnRhaW5zIHRoZQo+ID4gPiBzYW1lIGJ1ZywgaXQgc2hvdWxkIGJlIHJldmVydGVkIHNvIHRo
YXQgdGhlIHJlc3BlY3RpdmUgYXV0aG9ycyBjYW4gZml4Cj4gPiA+IGl0IGFuZCByZXN1Ym1pdC4K
PiA+ID4KPiA+Cj4gPiBJcyB0aGlzIHNpbXBseSBhYm91dCBkcm9wcGluZyB0aGUgbmV3bHkgYWRk
ZWQgcmVmZXJlbmNlcyB0bwo+ID4gJChkbWxfcmNmbGFncykgZnJvbSB0aGUgTWFrZWZpbGU/IEJl
Y2F1c2UgdGhhdCBpcyBxdWl0ZSB0cml2aWFsIC4uLgo+Cj4gWWVzLCBJIHdhcyB0aGlua2luZyBz
b21ldGhpbmcgbGlrZSB0aGUgYXR0YWNoZWQgcGF0Y2guCj4KCkNoZWVycywgdGhhdCBidWlsZHMg
ZmluZSB3aXRoIHY1LjExLXJjMi9kZWZjb25maWcgcGx1cyBDT05GSUdfRFJNX0FNREdQVT1tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
