Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7291F8EDDE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542296E9C3;
	Thu, 15 Aug 2019 14:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5041A6E9C3;
 Thu, 15 Aug 2019 14:13:26 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v15so1410458wml.0;
 Thu, 15 Aug 2019 07:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6LsD0cotJQRVH3KXBeeTooaiXDe5fXGu9pm+5lBmGzQ=;
 b=F39dNpBXyrdpmz9bf54v3Qx4cPCrfPuwehu27ztxKpKtstXU/efn7AXPSvN/fmcDek
 M+4/YEesGKMzjGBeXkikd4Hw7W7YTnFdB4/yFtlMb6qgRKbH0n3xh9gKNqrb2GutfC27
 LuHKfLpvdxiQrO7bz2xTpF93o8rYK3URlvoS1o8I+BzRtAPEjRY+IFbthv0Qpl3Yw15/
 FWMBN/usL7Sbl4Yb+2KiXfoXGd44VGt20a7YBljePz1CKMvaFID01CbawdZ409MKte1T
 TG1QqQNPePc4WdyEUDIrY25H2LP3Ndjysm8TB3esVwVVYhK/YvfSyhZxHWWHiGaugFvB
 rpPA==
X-Gm-Message-State: APjAAAWAyz3Bf8oMfDutIFtXSctKBIkW3YnniQVKxC4UiCvSEHox4XHY
 h8vk+JClH/heXPrqMyACm6Y0+S3dIZOCdL1h80k=
X-Google-Smtp-Source: APXvYqw/G8PfGoyelv2lVHeAPP6H4szvVVKdwegaYiNslA64Rm9t+ikVIqap/YP3DfhsRLLW6Sxb51653C5R8aR9RGc=
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr2018910wml.102.1565878404787; 
 Thu, 15 Aug 2019 07:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
In-Reply-To: <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Aug 2019 10:13:13 -0400
Message-ID: <CADnq5_NUox3vvg6Mt3i9erA+AL2MfotpNBZQnWWknn4j+j-F=Q@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Karol Herbst <kherbst@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6LsD0cotJQRVH3KXBeeTooaiXDe5fXGu9pm+5lBmGzQ=;
 b=VcclW5+yueqMZ52VTgBNw8ujSJcLWgKTS4KbcD3vybcbwWwOa5qB0kDuDEXjxQxrl5
 +7yRIreDuJaWOegEvx0YdK9aj2kBzCb4BV5IEILADL2gzCHsmEIkmYUqcLvLNoUsATFu
 YpuxHOW4EDSolvdTW6zLqpdLbI1vq+kgjiJUggXm2PZ9lLFPRM7t7BuD0nc7fOn7kWQw
 cnkvVHcBXV/CHyOphs9aYVNeNtaOdC1h8MwCczn8IYbawAcIdTP1h7bfhTM3on2SN8w+
 mnXyVSpLQTFZJzC3Vph0eGo7/2ie+sWrMnDggSO/d7ZSCoLJhkGMLy6MenZxPTmTDnO9
 S6xw==
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
Cc: Mario.Limonciello@dell.com, nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6MDQgQU0gS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMzo1NiBQTSA8TWFy
aW8uTGltb25jaWVsbG9AZGVsbC5jb20+IHdyb3RlOgo+ID4KPiA+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPiA+ID4gRnJvbTogbGludXgtYWNwaS1vd25lckB2Z2VyLmtlcm5lbC5vcmcg
PGxpbnV4LWFjcGktb3duZXJAdmdlci5rZXJuZWwub3JnPiBPbgo+ID4gPiBCZWhhbGYgT2YgRGF2
ZSBBaXJsaWUKPiA+ID4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMTQsIDIwMTkgNTo0OCBQTQo+
ID4gPiBUbzogS2Fyb2wgSGVyYnN0Cj4gPiA+IENjOiBMS01MOyBMaW51eCBBQ1BJOyBkcmktZGV2
ZWw7IG5vdXZlYXU7IFJhZmFlbCBKIC4gV3lzb2NraTsgQWxleCBIdW5nOyBCZW4KPiA+ID4gU2tl
Z2dzOyBEYXZlIEFpcmxpZQo+ID4gPiBTdWJqZWN0OiBSZTogW05vdXZlYXVdIFtQQVRDSCAxLzdd
IFJldmVydCAiQUNQSSAvIE9TSTogQWRkIE9FTSBfT1NJIHN0cmluZyB0bwo+ID4gPiBlbmFibGUg
ZEdQVSBkaXJlY3Qgb3V0cHV0Igo+ID4gPgo+ID4gPiBPbiBUaHUsIDE1IEF1ZyAyMDE5IGF0IDA3
OjMxLCBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+
ID4gPiBUaGlzIHJldmVydHMgY29tbWl0IDI4NTg2YTUxZWVhNjY2ZDU1MzFiY2FlZjJmNjhlNGFi
YmQ4NzI0MmMuCj4gPiA+ID4KPiA+ID4gPiBUaGUgb3JpZ2luYWwgY29tbWl0IG1lc3NhZ2UgZGlk
bid0IGV2ZW4gbWFrZSBzZW5zZS4gQU1EIF9kb2VzXyBzdXBwb3J0IGl0IGFuZAo+ID4gPiA+IGl0
IHdvcmtzIHdpdGggTm91dmVhdSBhcyB3ZWxsLgo+ID4gPiA+Cj4gPiA+ID4gQWxzbyB3aGF0IHdh
cyB0aGUgaXNzdWUgYmVpbmcgc29sdmVkIGhlcmU/IE5vIHJlZmVyZW5jZXMgdG8gYW55IGJ1Z3Mg
YW5kIG5vdAo+ID4gPiA+IGV2ZW4gZXhwbGFpbmluZyBhbnkgaXNzdWUgYXQgYWxsIGlzbid0IHRo
ZSB3YXkgd2UgZG8gdGhpbmdzLgo+ID4gPiA+Cj4gPiA+ID4gQW5kIGV2ZW4gaWYgaXQgbWVhbnMg
YSBtdXhlZCBkZXNpZ24sIHRoZW4gdGhlIGZpeCBpcyB0byBtYWtlIGl0IHdvcmsgaW5zaWRlIHRo
ZQo+ID4gPiA+IGRyaXZlciwgbm90IGFkZGluZyBzb21lIGhhY2t5IHdvcmthcm91bmQgdGhyb3Vn
aCBBQ1BJIHRyaWNrcy4KPiA+ID4gPgo+ID4gPiA+IEFuZCB3aGF0IG91dCBvZiB0cmVlIGRyaXZl
cnMgZG8gb3IgZG8gbm90IHN1cHBvcnQgd2UgZG9uJ3QgY2FyZSBvbmUgYml0IGFueXdheS4KPiA+
ID4gPgo+ID4gPgo+ID4gPiBJIHRoaW5rIHRoZSByZXZlcnRzIHNob3VsZCBiZSBtZXJnZWQgdmlh
IFJhZmFlbCdzIHRyZWUgYXMgdGhlIG9yaWdpbmFsCj4gPiA+IHBhdGNoZXMgd2VudCBpbiB2aWEg
dGhlcmUsIGFuZCB3ZSBzaG91bGQgZ2V0IHRoZW0gaW4gYXNhcC4KPiA+ID4KPiA+ID4gQWNrZWQt
Ynk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4gPiA+IERhdmUuCj4gPgo+ID4g
VGhlcmUgYXJlIGRlZmluaXRlbHkgZ29pbmcgdG8gYmUgcmVncmVzc2lvbnMgb24gbWFjaGluZXMg
aW4gdGhlIGZpZWxkIHdpdGggdGhlCj4gPiBpbiB0cmVlIGRyaXZlcnMgYnkgcmV2ZXJ0aW5nIHRo
aXMuICBJIHRoaW5rIHdlIHNob3VsZCBoYXZlIGFuIGFuc3dlciBmb3IgYWxsIG9mIHRob3NlCj4g
PiBiZWZvcmUgdGhpcyByZXZlcnQgaXMgYWNjZXB0ZWQuCj4gPgo+ID4gUmVnYXJkaW5nIHN5c3Rl
bXMgd2l0aCBJbnRlbCtOVklESUEsIHdlJ2xsIGhhdmUgdG8gd29yayB3aXRoIHBhcnRuZXJzIHRv
IGNvbGxlY3QKPiA+IHNvbWUgaW5mb3JtYXRpb24gb24gdGhlIGltcGFjdCBvZiByZXZlcnRpbmcg
dGhpcy4KPiA+Cj4gPiBXaGVuIHRoaXMgaXMgdXNlZCBvbiBhIHN5c3RlbSB3aXRoIEludGVsK0FN
RCB0aGUgQVNMIGNvbmZpZ3VyZXMgQU1EIEdQVSB0byB1c2UKPiA+ICJIeWJyaWQgR3JhcGhpY3Mi
IHdoZW4gb24gV2luZG93cyBhbmQgIlBvd2VyIEV4cHJlc3MiIGFuZCAiU3dpdGNoYWJsZSBHcmFw
aGljcyIKPiA+IHdoZW4gb24gTGludXguCj4KPiBhbmQgd2hhdCdzIGV4YWN0bHkgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aG9zZT8gQW5kIHdoYXQncyB0aGUgYWN0dWFsCj4gaXNzdWUgaGVyZT8K
Ckh5YnJpZCBHcmFwaGljcyBpcyB0aGUgbmV3ICJzdGFuZGFyZCIgd2F5IG9mIGhhbmRsaW5nIHRo
ZXNlIGxhcHRvcHMuCkl0IHVzZXMgdGhlIHN0YW5kYXJkIF9QUjMgQVBDSSBtZXRob2QgdG8gaGFu
ZGxlIGRHUFUgcG93ZXIuICBTdXBwb3J0CmZvciB0aGlzIHdhcyBhZGRlZCB0byBMaW51eCByZWxh
dGl2ZWx5IGxhdGVyIGNvbXBhcmVkIHRvIHdoZW4gdGhlCmxhcHRvcHMgd2VyZSBsYXVuY2hlZC4g
ICJQb3dlciBFeHByZXNzIiB1c2VkIHRoZSBvdGhlciBBTUQgc3BlY2lmaWMKQVRQWCBBQ1BJIG1l
dGhvZCB0byBoYW5kbGUgZEdQVSBwb3dlci4gIFRoZSBkcml2ZXIgc3VwcG9ydHMgYm90aCBzbwpl
aXRoZXIgbWV0aG9kIHdpbGwgd29yay4KCkFsZXgKCj4KPiBXZSBhbHJlYWR5IGhhdmUgdGhlIFBS
SU1FIG9mZmxvYWRpbmcgaW4gcGxhY2UgYW5kIGlmIHRoYXQncyBub3QKPiBlbm91Z2gsIHdlIHNo
b3VsZCB3b3JrIG9uIGV4dGVuZGluZyBpdCwgbm90IGFkZGluZyBzb21lIEFDUEkgYmFzZWQKPiB3
b3JrYXJvdW5kcywgYmVjYXVzZSB0aGF0J3MgZXhhY3RseSBob3cgdGhhdCBsb29rcyBsaWtlLgo+
Cj4gQWxzbywgd2FzIHRoaXMgZGlzY3Vzc2VkIHdpdGggYW55Ym9keSBpbnZvbHZlZCBpbiB0aGUg
ZHJtIHN1YnN5c3RlbT8KPgo+ID4KPiA+IEkgZmVlbCB3ZSBuZWVkIGEga25vYiBhbmQvb3IgRE1J
IGRldGVjdGlvbiB0byBhZmZlY3QgdGhlIGNoYW5nZXMgdGhhdCB0aGUgQVNMCj4gPiBub3JtYWxs
eSBwZXJmb3Jtcy4KPgo+IFdoeSBkbyB3ZSBoYXZlIHRvIGRvIHRoYXQgb24gYSBmaXJtd2FyZSBs
ZXZlbCBhdCBhbGw/Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
