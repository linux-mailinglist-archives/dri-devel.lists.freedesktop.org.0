Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D825A314873
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 07:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84BB8966C;
	Tue,  9 Feb 2021 06:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F7D89089
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 06:06:50 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a17so20871528ljq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 22:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bFTwqrQOTlvInkNf0kKdtf4ltTQxpHoLu4FqF5dCdQo=;
 b=rdjuJ2gtSC65AiMzUutBnOi521KBaQqXUXIZ75BtduxsdrzHOoc8/KEGR8b0fL2OTD
 NqoRxhDmDihdffowk+nfprgxDkneP/ClGEH0Rw3QS07+TjhqaIQao7u8SmPkKAlvmF2j
 02STEAAA2wlu5SieMs4bzC2IYvMXYHPHtN40kV9bhdTyzPFI9xd+4a2qI9NJ01NYnsiX
 z3R+bCwu/RAonK7HoH20rp9LOPvI8CGgO+NSkouNuToG000yqFJoVzNWHwRx0OP/UV+0
 SnVOi5NjKPpapwoM7wYFCqr6wp3QXMGwzeqYTX/WNxhpMN7sUabhtsxgREVD7frjlZzX
 HMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bFTwqrQOTlvInkNf0kKdtf4ltTQxpHoLu4FqF5dCdQo=;
 b=ITwQr+J+ujhY6eg4CPcO+9dxYMyXs7bmTFPuyHNicM6VC8Zshbrr/aR3mWDmGyyzxw
 nbp7foX6Z3+Yq3Ghap595HTgncntP0h24BidOBVb39QI4uB7/ZpC/Erxhv3Z00Gbovx6
 VaJZl8ddcBPyW8lzziTXTm2ODUZkJoFc7IYcVS6QcLSugZTTxAKGfiSPJvQxTvf3Pw+C
 3uI8Jw2xp5FEC6+7BH5yc3NBstuTEQucouKxdmTp4mZp9wtbNMx8Tyjzq/B9MrTbxY4F
 5V/1LzfQrWpANLCgFiNr2tCKZpz+0HIXZgrz1LBm3voyiCiTyejB3/LL0nLCNeYQns5B
 faSA==
X-Gm-Message-State: AOAM532zgElf8hGFfRvcphuNzbB6OiZA5r7jmDCIZRu49gWoFWIsLHKu
 RC5E8JU2uzxksAQ2f75+e5sDGEMAYaeiEaWbLbnaxQ==
X-Google-Smtp-Source: ABdhPJyN4XoqzaWGUvPkIR0yrDQgDnrzfxCrV90pQln7s/bGvUOeWk45ZzLS/ufx3d3XNszY+sRsl+X5orkFZeOpMQI=
X-Received: by 2002:a2e:3018:: with SMTP id w24mr13882499ljw.333.1612850808847; 
 Mon, 08 Feb 2021 22:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20210206054748.378300-1-john.stultz@linaro.org>
 <20210206054748.378300-2-john.stultz@linaro.org>
 <YCENrGofdwVg2LMe@phenom.ffwll.local>
 <CALAqxLV2Sikxnr3-k94nqcF5vz+jsekhhUrmXEKkwzwwu4up8g@mail.gmail.com>
 <CAKMK7uECMOO5jx4433uDuMq=MBaBEYaLe6ysrT_pshrr6Bf9dA@mail.gmail.com>
 <CAO_48GGA9FajZ3FE---udupHTGSkafTf7MK01H4h4-NfR1DerA@mail.gmail.com>
In-Reply-To: <CAO_48GGA9FajZ3FE---udupHTGSkafTf7MK01H4h4-NfR1DerA@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 8 Feb 2021 22:06:36 -0800
Message-ID: <CALAqxLXo3-2a5uOnmUd1WGfwtkb=5=2kauzgwi5CQzj=-K9k9Q@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/2] dma-buf: heaps: Fix the name used when exporting
 dmabufs to be the actual heap name
To: Sumit Semwal <sumit.semwal@linaro.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBGZWIgOCwgMjAyMSBhdCAxMDowMyBQTSBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdh
bEBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEhpIERhbmllbCwKPgo+IE9uIFR1ZSwgOSBGZWIgMjAy
MSBhdCAwMjozNiwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4g
PiBPbiBNb24sIEZlYiA4LCAyMDIxIGF0IDk6NTEgUE0gSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6
QGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gPiBPbiBNb24sIEZlYiA4LCAyMDIxIGF0IDI6MDggQU0g
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+ID4gPiBPbiBTYXQsIEZl
YiAwNiwgMjAyMSBhdCAwNTo0Nzo0OEFNICswMDAwLCBKb2huIFN0dWx0eiB3cm90ZToKPiA+ID4g
PiA+IEJ5IGRlZmF1bHQgZG1hX2J1Zl9leHBvcnQoKSBzZXRzIHRoZSBleHBvcnRlciBuYW1lIHRv
IGJlCj4gPiA+ID4gPiBLQlVJTERfTU9ETkFNRS4gVW5mb3J0dW5hdGVseSB0aGlzIG1heSBub3Qg
YmUgaWRlbnRpY2FsIHRvIHRoZQo+ID4gPiA+ID4gc3RyaW5nIHVzZWQgYXMgdGhlIGhlYXAgbmFt
ZSAoaWU6ICJzeXN0ZW0iIHZzICJzeXN0ZW1faGVhcCIpLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRo
aXMgY2FuIGNhdXNlIHNvbWUgbWlub3IgY29uZnVzaW9uIHdpdGggdG9vbGluZywgYW5kIHRoZXJl
IGlzCj4gPiA+ID4gPiB0aGUgZnV0dXJlIHBvdGVudGlhbCB3aGVyZSBtdWx0aXBsZSBoZWFwIHR5
cGVzIG1heSBiZSBleHBvcnRlZAo+ID4gPiA+ID4gYnkgdGhlIHNhbWUgbW9kdWxlIChidXQgd291
bGQgYWxsIGhhdmUgdGhlIHNhbWUgbmFtZSkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU28gdG8gYXZv
aWQgYWxsIHRoaXMsIHNldCB0aGUgZXhwb3J0ZXIgZXhwX25hbWUgdG8gdGhlIGhlYXAgbmFtZS4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+
ID4gPiA+ID4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gPiA+
ID4gPiBDYzogTGlhbSBNYXJrIDxsbWFya0Bjb2RlYXVyb3JhLm9yZz4KPiA+ID4gPiA+IENjOiBD
aHJpcyBHb2xkc3dvcnRoeSA8Y2dvbGRzd29AY29kZWF1cm9yYS5vcmc+Cj4gPiA+ID4gPiBDYzog
TGF1cmEgQWJib3R0IDxsYWJib3R0QGtlcm5lbC5vcmc+Cj4gPiA+ID4gPiBDYzogQnJpYW4gU3Rh
cmtleSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPgo+ID4gPiA+ID4gQ2M6IEhyaWR5YSBWYWxzYXJh
anUgPGhyaWR5YUBnb29nbGUuY29tPgo+ID4gPiA+ID4gQ2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8
c3VyZW5iQGdvb2dsZS5jb20+Cj4gPiA+ID4gPiBDYzogU2FuZGVlcCBQYXRpbCA8c3NwYXRpbEBn
b29nbGUuY29tPgo+ID4gPiA+ID4gQ2M6IERhbmllbCBNZW50eiA8ZGFuaWVsbWVudHpAZ29vZ2xl
LmNvbT4KPiA+ID4gPiA+IENjOiDDmHJqYW4gRWlkZSA8b3JqYW4uZWlkZUBhcm0uY29tPgo+ID4g
PiA+ID4gQ2M6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4gPiA+ID4gPiBD
YzogRXplcXVpZWwgR2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgo+ID4gPiA+ID4gQ2M6
IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KPiA+ID4gPiA+IENjOiBKYW1lcyBKb25l
cyA8amFqb25lc0BudmlkaWEuY29tPgo+ID4gPiA+ID4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZwo+ID4gPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3Jn
Pgo+ID4gPiA+Cj4gPiA+ID4gTG9va3MgcmVhc29uYWJsZSB0byBtZS4KPiA+ID4gPgo+ID4gPiA+
IEkgZ3Vlc3MgdGhlIG1haW4gd29ycnkgaXMgImRvZXMgdGhpcyBtZWFuIGhlYXAgbmFtZXMgYmVj
b21lIHVhcGkiLCBpbgo+ID4gPiA+IHdoaWNoIGNhc2UgSSdtIG1heWJlIG5vdCBzbyBzdXJlIGFu
eW1vcmUgaG93IHRoaXMgd2lsbCB0aWUgaW50byB0aGUKPiA+ID4gPiBvdmVyYWxsIGdwdSBtZW1v
cnkgYWNjb3VudGluZyBzdG9yeS4KPiA+ID4gPgo+ID4gPiA+IFNpbmNlIGZvciBkbWEtYnVmIGhl
YXBzIG9uZSBuYW1lIHBlciBidWZmZXIgaXMgcGVyZmVjdGx5IGZpbmUsIHNpbmNlCj4gPiA+ID4g
ZG1hLWJ1ZiBoZWFwcyBhcmVuJ3QgdmVyeSBkeW5hbWljLiBCdXQgb24gZGlzY3JldGUgZ3B1IGRy
aXZlcnMgYnVmZmVycwo+ID4gPiA+IG1vdmUsIHNvIGJha2luZyBpbiB0aGUgYXNzdW1wdGlvbiB0
aGF0ICJleHBvcnRlciBuYW1lID0gcmVzb3VyY2UgdXNhZ2UgZm9yCj4gPiA+ID4gdGhpcyBidWZm
ZXIiIGlzIGJyb2tlbi4KPiA+ID4KPiA+ID4gSSBzdXNwZWN0IEknbSBtaXNzaW5nIGEgc3VidGxl
dHkgaW4gd2hhdCB5b3UncmUgZGVzY3JpYmluZy4gTXkgc2Vuc2UKPiA+ID4gb2YgdGhlIGV4cG9y
dGVyIG5hbWUgZG9lc24ndCBhY2NvdW50IGZvciBhIGJ1ZmZlcidzIHVzYWdlLCBpdCBqdXN0Cj4g
PiA+IGRlc2NyaWJlcyB3aGF0IGNvZGUgYWxsb2NhdGVkIGl0IGFuZCBpbXBsaWNpdGx5IHdoaWNo
IGRtYWJ1Zl9vcHMKPiA+ID4gaGFuZGxlcyBpdC4gIE1heWJlIGNvdWxkIHlvdSBnaXZlIGEgbW9y
ZSBzcGVjaWZpYyBleGFtcGxlIG9mIHdoYXQKPiA+ID4geW91J3JlIGhvcGluZyB0byBhdm9pZD8K
PiA+Cj4gPiBKdXN0IHBhcmFub2lhIHJlYWxseSAtIG9uIHRoZSBsaW51eCBzaWRlIHdoZXJlIHdl
IGFsbG9jYXRlIG1vc3QKPiA+IGJ1ZmZlcnMgKGV2ZW4gc2hhcmVkIG9uZXMpIHdpdGggdGhlIGRy
aXZlciwgdGhhdCBhbGxvY2F0b3IgaW5mbyBpc24ndAo+ID4gdGhhdCBtZWFuaW5nZnVsLCBpdCBy
ZWFsbHkganVzdCB0ZWxscyB5b3Ugd2hpY2ggY29kZQo+ID4gYWxsb2NhdGVkL2V4cG9ydGVkIHRo
YXQgZG1hLWJ1Zi4KPiA+Cj4gPiBCdXQgb24gQW5kcm9pZCwgd2hlcmUgYWxsIHNoYXJlZCBidWZm
ZXJzIGNvbWUgZnJvbSBzcGVjaWZpYyBoZWFwcywgaXQKPiA+IGlzIHJhdGhlciBtZWFuaW5nZnVs
IGluZm9ybWF0aW9uLiBTbyBJIHdvbmRlcmVkIHdoZXRoZXIgZS5nLiB0aGUKPiA+IGFuZHJvaWQg
ZG1hYnVmIGRlYnVnIHRvb2wgdXNlcyB0aGF0IHRvIGNvbGxlY3QgcGVyLWhlYXAgc3RhdHMsIGJ1
dAo+ID4gc291bmRzIGxpa2Ugbm8gcmlnaHQgbm93LiBQbHVzIHdpdGggdGhlIGNoYXQgd2UndmUg
aGFkIEkgdGhpbmsgd2UgaGF2ZQo+ID4gYSBsb25nLXRlcm0gcGxhbiBmb3IgaG93IHRvIGV4cG9z
ZSB0aGF0IGluZm9ybWF0aW9uIHByb3Blcmx5Lgo+ID4KPiA+ID4gVG8gbWUgdGhpcyBwYXRjaCBp
cyBtb3N0bHkganVzdCBhIGNvbnNpc3RlbmN5L2xlYXN0LXN1cnByaXNlIHRoaW5nLCBzbwo+ID4g
PiB0aGUgaGVhcHMgZXhwb3J0ZXIgbmFtZSBtYXRjaGVzIHRoZSBzdHJpbmcgdXNlZCBmb3IgdGhl
IGhlYXAncyBjaGFyZGV2Cj4gPiA+IGRldmljZSAodGhlIGludGVyZmFjZSB1c2VkIHRvIGFsbG9j
YXRlIGl0KSBpbiBvdXRwdXQgbGlrZQo+ID4gPiBkZWJ1Z2ZzL2RtYV9idWYvYnVmaW5mby4KPiA+
Cj4gPiBZZWFoIGZvciBkZWJ1ZyB0aGlzIG1ha2VzIHNlbnNlLiBhLWI6IG1lIGlmIHlvdSB3YW50
IHRoYXQgc29tZXdoZXJlIG9uCj4gPiB0aGUgcGF0Y2hlcy4KPgo+IEdyZWF0IHRoYXQgdGhpcyBn
b3Qgc29ydGVkOyBJJ2xsIGFwcGx5IGJvdGggdGhlIHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMKPiB0
byBkcm0tbWlzYy1uZXh0LCB3aXRoIHlvdXIgYS1iLgoKQmVmb3JlIHlvdSBkbywgbGV0IG1lIHNw
aW4gYSB2MiBhcyBJIGdvdCBzb21lIG1pbm9yIHR3ZWFrcyBuZWVkZWQKKHVzaW5nIGNvbnN0IGNo
YXIqKSB0byBmaXggdGhlIGtidWlsZCBib3QgZXJyb3JzLgoKdGhhbmtzCi1qb2huCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
