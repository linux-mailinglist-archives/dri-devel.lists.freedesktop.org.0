Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345ED2E70D5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 14:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1797892DB;
	Tue, 29 Dec 2020 13:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9D8892D8;
 Tue, 29 Dec 2020 13:17:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E9DB21D94;
 Tue, 29 Dec 2020 13:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609247871;
 bh=/F0pVA4fXwFR9+ASZLEn4ZXCoj1TXo6VOfZ8bBDJ4CU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MvFOxqVG0xg1HqXw+Km3C7TeLc5ZL4OH2zRC+4f76ZcxmW6e+IGRNxaOOLWYL1a1F
 2prZ+DzS3QnN2FQ3gIoB7OMHqFYkfBxyJavNe4iUwIBaPQnmXEg75oi3+5eCNTZQFG
 mfxslhszeUpBedEvEzTg8GYxk5HKfl09UjjFGaB7WQcE5jE4F3y0T5p21MEjiYAXjf
 ItYWDAWqW7SWzoc08Cngbb3320oNARD+9UGtRaMPXa56PBjzs+3PcWpB1wrX2pfyGa
 SdOvfc5Ue73U/J/kDDlXszsg1Er11ojvUeSaR8sTvI16XUc7aeIpVr7PIaFVcAEf9G
 Y5zY350JvLinQ==
Received: by mail-oi1-f173.google.com with SMTP id l200so14554583oig.9;
 Tue, 29 Dec 2020 05:17:51 -0800 (PST)
X-Gm-Message-State: AOAM533II94hnOPKk3slPXWKSW3yKAZLeHpTGwodaV9dnmTkBlgkp1y/
 FliZ5zdu+HuokWjk+qKgym6RVN2mFRol++KuYNA=
X-Google-Smtp-Source: ABdhPJxkoRHEdJN7wSqQxlJ23qPIRj71Tyf2zqcnbaEAVMi+hGw4XqZSC29HlinZcC0SViqpm4qk95TMJazFZxsh/2g=
X-Received: by 2002:aca:210f:: with SMTP id 15mr2251767oiz.174.1609247870640; 
 Tue, 29 Dec 2020 05:17:50 -0800 (PST)
MIME-Version: 1.0
References: <20201214175225.38975-1-ardb@kernel.org>
 <CADnq5_M-U5QO_tmQQ8Q+v+kZXvUc7vjXnmKWYFjX1FmOJYk1OQ@mail.gmail.com>
 <CAMj1kXHnPXqBnQsNQh3nJxDePxK=D55KES3BdVeJ0cFvYxAXAg@mail.gmail.com>
In-Reply-To: <CAMj1kXHnPXqBnQsNQh3nJxDePxK=D55KES3BdVeJ0cFvYxAXAg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 29 Dec 2020 14:17:39 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE7Z7=YJq4qYaB9NDDwi8nsXsg-KEXQ8V9wQB=uLCsdrw@mail.gmail.com>
Message-ID: <CAMj1kXE7Z7=YJq4qYaB9NDDwi8nsXsg-KEXQ8V9wQB=uLCsdrw@mail.gmail.com>
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

T24gV2VkLCAxNiBEZWMgMjAyMCBhdCAyMzoyNiwgQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIDE2IERlYyAyMDIwIGF0IDE5OjAwLCBBbGV4IERldWNo
ZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBEZWMgMTQs
IDIwMjAgYXQgMTI6NTMgUE0gQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgYzM4ZDQ0NGU0NGJhZGM1NTdjZjI5ZmRm
ZGZiODIzNjA0ODkwY2NmYS4KPiA+ID4KPiA+ID4gU2ltcGx5IGRpc2FibGluZyAtbWdlbmVyYWwt
cmVncy1vbmx5IGxlZnQgYW5kIHJpZ2h0IGlzIHJpc2t5LCBnaXZlbiB0aGF0Cj4gPiA+IHRoZSBz
dGFuZGFyZCBBQXJjaDY0IEFCSSBwZXJtaXRzIHRoZSB1c2Ugb2YgRlAvU0lNRCByZWdpc3RlcnMg
YW55d2hlcmUsCj4gPiA+IGFuZCBHQ0MgaXMga25vd24gdG8gdXNlIFNJTUQgcmVnaXN0ZXJzIGZv
ciBzcGlsbGluZywgYW5kIG1heSBpbnZlbnQKPiA+ID4gb3RoZXIgdXNlcyBvZiB0aGUgRlAvU0lN
RCByZWdpc3RlciBmaWxlIHRoYXQgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlCj4gPiA+IGZs
b2F0aW5nIHBvaW50IGNvZGUgaW4gcXVlc3Rpb24uIE5vdGUgdGhhdCBwdXR0aW5nIGtlcm5lbF9u
ZW9uX2JlZ2luKCkKPiA+ID4gYW5kIGtlcm5lbF9uZW9uX2VuZCgpIGFyb3VuZCB0aGUgY29kZSB0
aGF0IGRvZXMgdXNlIEZQIGlzIG5vdCBzdWZmaWNpZW50Cj4gPiA+IGhlcmUsIHRoZSBwcm9ibGVt
IGlzIGluIGFsbCB0aGUgb3RoZXIgY29kZSB0aGF0IG1heSBiZSBlbWl0dGVkIHdpdGgKPiA+ID4g
cmVmZXJlbmNlcyB0byBTSU1EIHJlZ2lzdGVycyBpbiBpdC4KPiA+ID4KPiA+ID4gU28gdGhlIG9u
bHkgd2F5IHRvIGRvIHRoaXMgcHJvcGVybHkgaXMgdG8gcHV0IGFsbCBmbG9hdGluZyBwb2ludCBj
b2RlIGluCj4gPiA+IGEgc2VwYXJhdGUgY29tcGlsYXRpb24gdW5pdCwgYW5kIG9ubHkgY29tcGls
ZSB0aGF0IHVuaXQgd2l0aAo+ID4gPiAtbWdlbmVyYWwtcmVncy1vbmx5LiBCdXQgcGVyaGFwcyB0
aGUgdXNlIG9mIGZsb2F0aW5nIHBvaW50IGhlcmUgaXMKPiA+ID4gc29tZXRoaW5nIHRoYXQgc2hv
dWxkIGJlIHJlY29uc2lkZXJlZCBlbnRpcmVseS4KPiA+ID4KPiA+ID4gQ2M6IENhdGFsaW4gTWFy
aW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+Cj4gPiA+IENjOiBXaWxsIERlYWNvbiA8d2ls
bEBrZXJuZWwub3JnPgo+ID4gPiBDYzogRGF2ZSBNYXJ0aW4gPGRhdmUubWFydGluQGFybS5jb20+
Cj4gPiA+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gPiBDYzogTGVvIExp
IDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4gPiA+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Cj4gPiA+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiA+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+ID4gQ2M6IERhbmll
bCBLb2xlc2EgPGRhbmllbEBvY3RhZm9yZ2Uub3JnPgo+ID4gPiBDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiA+ID4gU2lnbmVkLW9mZi1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KPiA+
Cj4gPiBDYW4gcmViYXNlIHRoaXMgb24gTGludXMnIG1hc3RlciBicmFuY2g/ICBUaGVyZSB3ZXJl
IGEgbnVtYmVyIG9mIG5ldwo+ID4gYXNpY3MgYWRkZWQgd2hpY2ggY29weSBwYXN0ZWQgdGhlIEFS
TTY0IHN1cHBvcnQuCj4gPgo+Cj4gTm90IHN1cmUgd2hhdCB5b3UgYXJlIGFza2luZyBtZSBoZXJl
LiBSZXZlcnRpbmcgY29tbWl0IGMzOGQ0NDRlNDRiYWRjNQo+IG9uIHRvcCBvZiBtYWlubGluZSBp
cyBub3QgZ29pbmcgdG8gZml4IHRoZSBvdGhlciBjb2RlIHRoYXQgd2FzIGFkZGVkLgo+IE9yIGFy
ZSB5b3UgYXNraW5nIG1lIHRvIGdvIGFuZCBmaW5kIHRoZSBwYXRjaGVzIChob3cgbWFueT8pIHRo
YXQgYWRkZWQKPiBuZXcgQVNJQ3MgYW5kIGZpeCB0aGVtIGZvciBhcm02ND8KPgo+IE5vdGUgdGhh
dCB0aGlzIGNvZGUgaXMgY3JpdGljYWxseSBicm9rZW4sIGFzIGl0IG1heSBjb3JydXB0IHVzZXIK
PiBwcm9jZXNzIHN0YXRlIGFyYml0cmFyaWx5LiBTbyBpZiBuZXcgY29kZSB3YXMgYWRkZWQgdGhh
dCBjb250YWlucyB0aGUKPiBzYW1lIGJ1ZywgaXQgc2hvdWxkIGJlIHJldmVydGVkIHNvIHRoYXQg
dGhlIHJlc3BlY3RpdmUgYXV0aG9ycyBjYW4gZml4Cj4gaXQgYW5kIHJlc3VibWl0Lgo+CgpJcyB0
aGlzIHNpbXBseSBhYm91dCBkcm9wcGluZyB0aGUgbmV3bHkgYWRkZWQgcmVmZXJlbmNlcyB0bwok
KGRtbF9yY2ZsYWdzKSBmcm9tIHRoZSBNYWtlZmlsZT8gQmVjYXVzZSB0aGF0IGlzIHF1aXRlIHRy
aXZpYWwgLi4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
