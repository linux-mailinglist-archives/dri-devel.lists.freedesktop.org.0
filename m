Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB0E214EE
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26009898F1;
	Fri, 17 May 2019 07:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 30C278951B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 13:21:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2C4F1715;
 Thu, 16 May 2019 06:21:39 -0700 (PDT)
Received: from [10.1.196.69] (e112269-lin.cambridge.arm.com [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 625313F703;
 Thu, 16 May 2019 06:21:37 -0700 (PDT)
Subject: Re: [PATCH v4 0/8] Allwinner H6 Mali GPU support
To: Robin Murphy <robin.murphy@arm.com>, Rob Herring
 <rob.e.herring@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?=
 <peron.clem@gmail.com>
References: <20190512174608.10083-1-peron.clem@gmail.com>
 <20190513151405.GW17751@phenom.ffwll.local>
 <de50a9da-669f-ab25-2ef2-5ffb90f8ee03@baylibre.com>
 <CAJiuCccuEw0BK6MwROR+XUDvu8AJTmZ5tu=pYwZbGAuvO31pgg@mail.gmail.com>
 <CAJiuCccWa5UTML68JDQq6q8SyNZzVWwQWTOL=+84Bh4EMHGC3A@mail.gmail.com>
 <3c2c9094-69d4-bace-d5ee-c02b7f56ac82@arm.com>
 <CAJiuCcd=gCQJ4mxn3wNhHXveOhFLnYSEs+cnOMHcALPvd7bQZw@mail.gmail.com>
 <CAC=3edbn1yXih5vP0SwsDkqRB0j5q0c4FL0jhCq9DQ9Wt2-hAA@mail.gmail.com>
 <e8618889-9b22-7f9f-7451-3c08a80a0f9b@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <fa434575-5576-aff5-8705-1f93eefa209c@arm.com>
Date: Thu, 16 May 2019 14:21:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e8618889-9b22-7f9f-7451-3c08a80a0f9b@arm.com>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYvMDUvMjAxOSAxMjoxOSwgUm9iaW4gTXVycGh5IHdyb3RlOgpbLi4uXQo+IEkgd2FzIGV4
cGVjdGluZyB0byBzZWUgYSBzaW1pbGFyIGJlaGF2aW91ciB0byBteSBUNjIwICh3aGljaCBJIG5v
dwo+IGFzc3VtZSB3YXMgZG93biB0byA2NC1iaXQgam9iIGRlc2NyaXB0b3JzIHNvcnQtb2YtYnV0
LW5vdC1xdWl0ZSB3b3JraW5nKQo+IGJ1dCB0aGlzIGRvZXMgbG9vayBhIGJpdCBtb3JlIGZ1bmRh
bWVudGFsIC0gdGhlIGZhY3QgdGhhdCBpdCdzIGEgbGV2ZWwgMQo+IGZhdWx0IHdpdGggVkEgPT0g
aGVhZCA9PSB0YWlsIHN1Z2dlc3RzIHRvIG1lIHRoYXQgdGhlIE1NVSBjYW4ndCBzZWUgdGhlCj4g
cGFnZSB0YWJsZXMgYXQgYWxsIHRvIHRyYW5zbGF0ZSBhbnl0aGluZy4gSSByZWFsbHkgaG9wZSB0
aGF0IHRoZSBINiBHUFUKPiBpbnRlZ3JhdGlvbiBkb2Vzbid0IHN1ZmZlciBmcm9tIHRoZSBzYW1l
IERNQSBvZmZzZXQgYXMgdGhlIEFsbHdpbm5lcgo+IGRpc3BsYXkgcGlwZWxpbmUgc3R1ZmYsIGJl
Y2F1c2UgdGhhdCB3b3VsZCBiZSBhIHJlYWwgcGFpbiB0byBzdXBwb3J0IGluCj4gaW8tcGd0YWJs
ZS4KCkFzc3VtaW5nIHlvdSBtZWFuIHRoZSBjYXNlIHdoZXJlIHRoZSBwaHlzaWNhbCBhZGRyZXNz
IChhcyBzZWVuIGJ5IHRoZQpDUFUpIGlzIGRpZmZlcmVudCBmcm9tIHRoZSBkbWEgYWRkcmVzcyAo
YXMgc2VlbiBieSB0aGUgR1BVKSwgdGhlbiBJCmhpZ2hseSBkb3VidCBpdCBiZWNhdXNlIG1hbGlf
a2Jhc2UgZG9lc24ndCBzdXBwb3J0IGl0OgoKW2Zyb20ga2Jhc2VfbWVtX3Bvb2xfYWxsb2NfcGFn
ZSgpIGluIG1hbGlfa2Jhc2VfbWVtX3Bvb2wuY106CgoJZG1hX2FkZHIgPSBkbWFfbWFwX3BhZ2Uo
ZGV2LCBwLCAwLCBQQUdFX1NJWkUsIERNQV9CSURJUkVDVElPTkFMKTsKCWlmIChkbWFfbWFwcGlu
Z19lcnJvcihkZXYsIGRtYV9hZGRyKSkgewoJCV9fZnJlZV9wYWdlKHApOwoJCXJldHVybiBOVUxM
OwoJfQoKCVdBUk5fT04oZG1hX2FkZHIgIT0gcGFnZV90b19waHlzKHApKTsKCgpUaGF0IGJlaW5n
IHNhaWQgaXQncyBxdWl0ZSBwb3NzaWJsZSB0aGVyZSBjb3VsZCBiZSBzb21ldGhpbmcgaW4gdGhl
IGJ1cwp3aGljaCBuZWVkcyBjb25maWd1cmluZyB0byBtYWtlIHRoaXMgd29yayAtIGluIHdoaWNo
IGNhc2UgeW91ciBiZXN0IGJldAppcyB0byBsb29rIGF0IHRoZSB2ZW5kb3Iga2VybmVsIGFuZCBz
ZWUgaWYgYW55dGhpbmcgZXh0cmEgaXMgcG9rZWQgd2hlbgp0aGUgTWFsaSBkcml2ZXIgaXMgbG9h
ZGVkLgoKU3RldmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
