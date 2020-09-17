Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F22726DFC4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 17:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8433889A74;
	Thu, 17 Sep 2020 15:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A1489306;
 Thu, 17 Sep 2020 15:35:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m6so2592215wrn.0;
 Thu, 17 Sep 2020 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=++KjjTeArkQUc6wTWp+OUexd5LFyCKXsX9i3O0Psxsg=;
 b=vdIO7GRao1HIL7dDL5HmL7RgluYPLILqZijreSW8tI3heqpGROlE+g6JUvU8DgkyI9
 6TRbJxmXdMuRcFA82d8pXd3KqM5j7x2k4VF0otEj9YS8sStZ7NYi+9Zhc46FRaWdD2gP
 llkuK1ntu1GYTTlMyHPBP+HH4EzCrXnUtvklzb/PDqkmGQK4RyS4zghJkgC3we2Ld0xW
 jUaxfCxYoyvRH/QdaHFxPor/58NzsYJaCw+Sm/AAhgw5/45wT+GtzNqM9qHorCwBDDTd
 X+9CHr8U+PSeNMkaTn818RIsLuEevjd+mUn/9eGfmspJogTLkgloJG3WI9TZB94qfhGC
 B+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=++KjjTeArkQUc6wTWp+OUexd5LFyCKXsX9i3O0Psxsg=;
 b=AQ1MHdaaw41bKRcgb7r8OWCWwwW/YCxLGcUhxRfAU8JUQrRT+X6iHAHIgh2khQUMhR
 XMFZirzg12uBZifVlEad+/KaxxPf5trIF21fC+yhHnK05DSxnBNFAjJ/GivsIiVXvCNB
 q6ngDsQuZssx3fYChvL5QYrW4o1zQJcQ+SAnoRU6JEz3gdkByF2KqZsZKLo8D+tFz5Nh
 QHni610pUe20rhAm8f0zJYPLm9bC31jekmLL8kujOimNfCy8SAPN2PkwnCbNQmt4JoUM
 hFtV5BKGk1xTGsQGGRAjT86AT5vfDZi3XAtU/8vZnYg/W/sLOqiRvokhzAwiZ9UtqdZz
 pUTg==
X-Gm-Message-State: AOAM533gNdxJ4kMLxU4ha7pWW7csk0Ui+YbpIvhwmllMa9JwxsmsFOyP
 SH8e7NUbA4IywBitpQZG4mTe60JBKWv3kiDdB/o=
X-Google-Smtp-Source: ABdhPJx+y5u32oEgAaxgCr4+qkhtdjMNEjLzBX2Y42T5/J7OajS6cvRPu2WGqZQFekeAyY44eKuWJ6ETVkhNYfMPRQs=
X-Received: by 2002:adf:dd82:: with SMTP id x2mr34902393wrl.419.1600356954497; 
 Thu, 17 Sep 2020 08:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200917034610.21703-1-dawning.pang@gmail.com>
 <e4ac75c6-ce1f-7d4e-9402-82f499392521@amd.com>
In-Reply-To: <e4ac75c6-ce1f-7d4e-9402-82f499392521@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Sep 2020 11:35:43 -0400
Message-ID: <CADnq5_N4S9gOGPcgUzdkyF2svD3_4bxMyB=k9Px_ddyT-q3RTA@mail.gmail.com>
Subject: Re: [PATCH v1] powerplay:hwmgr - modify the return value
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: pelle@vangils.xyz, Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 zhengbin <zhengbin13@huawei.com>, Xiaoliang Pang <dawning.pang@gmail.com>,
 Eric Huang <JinHuiEric.Huang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTcsIDIwMjAgYXQgNDoyOCBBTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMTcuMDkuMjAgdW0gMDU6NDYgc2Nocmll
YiBYaWFvbGlhbmcgUGFuZzoKPiA+IG1vZGlmeSB0aGUgcmV0dXJuIHZhbHVlIGlzIC1FSU5WQUwK
Pgo+IE1heWJlIGJldHRlciB3cml0ZSBzb21ldGhpbmcgbGlrZSAiVGhlIGNvcnJlY3QgcmV0dXJu
IHZhbHVlIHNob3VsZCBiZQo+IC1FSU5WQUwuIiBXaXRoIHRoYXQgZG9uZSBmZWVsIGZyZWUgdG8g
YWRkIG15IGFja2VkLWJ5LgoKQXBwbGllZCB3aXRoIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UuCgpU
aGFua3MhCgpBbGV4CgoKPgo+IENocmlzdGlhbi4KPgo+ID4KPiA+IEZpeGVzOiBmODNhOTk5MTY0
OGJiKCJkcm0vYW1kL3Bvd2VycGxheTogYWRkIFZlZ2ExMCBwb3dlcnBsYXkgc3VwcG9ydCAodjUp
IikKPiA+IEZpeGVzOiAyY2FjMDVkZWU2ZTMwKCJkcm0vYW1kL3Bvd2VycGxheTogYWRkIHRoZSBo
dyBtYW5hZ2VyIGZvciB2ZWdhMTIgKHY0KSIpCj4gPiBDYzogRXJpYyBIdWFuZyA8SmluSHVpRXJp
Yy5IdWFuZ0BhbWQuY29tPgo+ID4gQ2M6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBYaWFvbGlhbmcgUGFuZyA8ZGF3bmluZy5wYW5nQGdtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBf
aHdtZ3IuYyB8IDIgKy0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
dmVnYTEyX2h3bWdyLmMgfCAyICstCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jCj4gPiBpbmRleCBjMzc4YTAwMGM5MzQuLjdl
YWRhMzA5OGZmYyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL3ZlZ2ExMF9od21nci5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMTBfaHdtZ3IuYwo+ID4gQEAgLTQ2NTksNyArNDY1OSw3IEBAIHN0YXRp
YyBpbnQgdmVnYTEwX2Rpc3BsYXlfY29uZmlndXJhdGlvbl9jaGFuZ2VkX3Rhc2soc3RydWN0IHBw
X2h3bWdyICpod21ncikKPiA+ICAgICAgIGlmICgoZGF0YS0+d2F0ZXJfbWFya3NfYml0bWFwICYg
V2F0ZXJNYXJrc0V4aXN0KSAmJgo+ID4gICAgICAgICAgICAgICAgICAgICAgICEoZGF0YS0+d2F0
ZXJfbWFya3NfYml0bWFwICYgV2F0ZXJNYXJrc0xvYWRlZCkpIHsKPiA+ICAgICAgICAgICAgICAg
cmVzdWx0ID0gc211bV9zbWNfdGFibGVfbWFuYWdlcihod21nciwgKHVpbnQ4X3QgKil3bV90YWJs
ZSwgV01UQUJMRSwgZmFsc2UpOwo+ID4gLSAgICAgICAgICAgICBQUF9BU1NFUlRfV0lUSF9DT0RF
KHJlc3VsdCwgIkZhaWxlZCB0byB1cGRhdGUgV01UQUJMRSEiLCByZXR1cm4gRUlOVkFMKTsKPiA+
ICsgICAgICAgICAgICAgUFBfQVNTRVJUX1dJVEhfQ09ERShyZXN1bHQsICJGYWlsZWQgdG8gdXBk
YXRlIFdNVEFCTEUhIiwgcmV0dXJuIC1FSU5WQUwpOwo+ID4gICAgICAgICAgICAgICBkYXRhLT53
YXRlcl9tYXJrc19iaXRtYXAgfD0gV2F0ZXJNYXJrc0xvYWRlZDsKPiA+ICAgICAgIH0KPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEy
X2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdt
Z3IuYwo+ID4gaW5kZXggYTY3OGE2N2YxYzBkLi4wNGRhNTJjZWE4MjQgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYwo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEyX2h3bWdyLmMK
PiA+IEBAIC0yMzkwLDcgKzIzOTAsNyBAQCBzdGF0aWMgaW50IHZlZ2ExMl9kaXNwbGF5X2NvbmZp
Z3VyYXRpb25fY2hhbmdlZF90YXNrKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgIShkYXRhLT53YXRlcl9tYXJrc19iaXRtYXAgJiBXYXRlck1hcmtzTG9h
ZGVkKSkgewo+ID4gICAgICAgICAgICAgICByZXN1bHQgPSBzbXVtX3NtY190YWJsZV9tYW5hZ2Vy
KGh3bWdyLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICh1aW50OF90ICopd21fdGFibGUsIFRBQkxFX1dBVEVSTUFSS1MsIGZhbHNlKTsKPiA+IC0gICAg
ICAgICAgICAgUFBfQVNTRVJUX1dJVEhfQ09ERShyZXN1bHQsICJGYWlsZWQgdG8gdXBkYXRlIFdN
VEFCTEUhIiwgcmV0dXJuIEVJTlZBTCk7Cj4gPiArICAgICAgICAgICAgIFBQX0FTU0VSVF9XSVRI
X0NPREUocmVzdWx0LCAiRmFpbGVkIHRvIHVwZGF0ZSBXTVRBQkxFISIsIHJldHVybiAtRUlOVkFM
KTsKPiA+ICAgICAgICAgICAgICAgZGF0YS0+d2F0ZXJfbWFya3NfYml0bWFwIHw9IFdhdGVyTWFy
a3NMb2FkZWQ7Cj4gPiAgICAgICB9Cj4gPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
