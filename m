Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A136AC0BE4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 21:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0371A6E20C;
	Fri, 27 Sep 2019 19:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6C16E20C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 19:02:49 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id b136so19065466iof.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 12:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LO3JdAOU095h41fjVsuAsU+4Z0wmwAMdPedC2Thw3pg=;
 b=BpXLGc+1IIbx4MSYWaVw/IVyssdcshkpIuIVT1fzLIjTFw6mCn/hJSV753z1kAO0Jt
 Dtuibgempsdl6nO8vPrMJZT6hWh/TM6lvuIunQ86iPM3HpRvfA8jwoOcPTq6hXPlqHTJ
 RrMpuP9R0aXGx6SwCu/trsErFfs4F2kl/kX80wLOYsmKv40AA2gGec8beSnyPJdu7Dbu
 P8zF85Dn53USzZoSYXwdgp+/r3fzyrhnJsGB/JKsAUfgVQG9NrM+caxbgVDkxsmHwG48
 ErD+jicZXK9178xlYjtNJ2KPVcZLGeWiebva/RgzNP3+jpYLPVV1HVmKyaRKA5h+0uSb
 XOwQ==
X-Gm-Message-State: APjAAAWwzGvFCH9p6BcBGwYWiIeu4Ef7q8QsyT+IBJPKUhXF3TGVM1qR
 hJOjWB2nLODvkqq4UD2/OskrxoF0i+Pbre99xhjXiSbVJz8=
X-Google-Smtp-Source: APXvYqwS6ado5j8H/MS9UQpgoe/UkE+sD6PlTwv5ZTRS/6e5bGEdAPsZ4ex2TIbFU5IYmkfVt2tiTgtyAQ59xYbnLxI=
X-Received: by 2002:a02:7810:: with SMTP id p16mr9500549jac.55.1569610967624; 
 Fri, 27 Sep 2019 12:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190925184239.22330-1-aford173@gmail.com>
 <20190925184239.22330-2-aford173@gmail.com>
 <20190927185153.GA982@bogus>
In-Reply-To: <20190927185153.GA982@bogus>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Sep 2019 14:02:35 -0500
Message-ID: <CAHCN7x+V_-PZjhC_1K1kU+fnQYwWM4br1PTPEBd4Kks=sR5K7g@mail.gmail.com>
Subject: Re: [PATCH V3 2/3] dt-bindings: Add Logic PD Type 28 display panel
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LO3JdAOU095h41fjVsuAsU+4Z0wmwAMdPedC2Thw3pg=;
 b=dr01MoRs+YBUsJR2Yajv5Gvk1Uuzl8J/B0xZ7BtPxjvHMRUFzNHi1gn2IjV0wXHCzq
 capi/qDYXysLutGkSjtANV/oT80eN4t3epMkMyFfb1YeeWmHa9B56XasKfDrBaj/UgsO
 MRPgpvasw/M/Lmb03EZJA/kFsbdBVMfYO7psdw+1yHdvq6WIeA5iEWS1/Q21rJENUPAU
 i8sw3SqRACaGNwbNZyxa3PEoYHDcCnP3XqMnzL7dbQwY6dcqx6TULVQxAbxzP5//qpyH
 xtlvQ6qOQVSLV5vls0hohFudnvizuTxuk2TL5CkaybbkRGoPMAZj8BeQzWgp1aJOcIUM
 OX6w==
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
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Adam Ford <adam.ford@logicpd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTo1MSBQTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDAxOjQyOjM3UE0gLTA1MDAs
IEFkYW0gRm9yZCB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggYWRkcyBkb2N1bWVudGF0aW9uIG9mIGRl
dmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgV1ZHQSBwYW5lbAo+ID4gTG9naWMgUEQgVHlwZSAy
OCBkaXNwbGF5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21h
aWwuY29tPgo+ID4gLS0tCj4gPiBWMzogIENvcnJlY3QgYnVpbGQgZXJyb3JzIGZyb20gJ21ha2Ug
ZHRfYmluZGluZ19jaGVjaycKPiA+IFYyOiAgVXNlIFlBTUwgaW5zdGVhZCBvZiBUWFQgZm9yIGJp
bmRpbmcKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvbG9naWNwZCx0eXBlMjgueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xvZ2ljcGQsdHlwZTI4LnlhbWwKPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjc0YmE2NTBlYTdhMAo+
ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvbG9naWNwZCx0eXBlMjgueWFtbAo+ID4gQEAgLTAsMCArMSwzMSBA
QAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBYMTEpCj4KPiAo
R1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgcGxlYXNlLgo+Cj4gWDExIGlzIHByZXR0eSBt
dWNoIG5ldmVyIHJpZ2h0IHVubGVzcyB0aGlzIGlzIGNvcHlyaWdodCBYIENvbnNvcnRpdW0uCj4K
CkkgY29waWVkIHRoZSBleGFtcGxlIGZyb20KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvcm9uYm8scmIwNzBkMzAueWFtbAoKSXMgdGhlcmUgYSBiZXR0ZXIg
ZXhhbXBsZSBJIGNhbiB1c2U/ICBJZiB3aGF0IEkgZGlkIGlzIHdyb25nLCB0aGVuIGl0CnNlZW1z
IGxpa2UgdGhhdCBib2FyZCBpcyB3cm9uZyB0b28uCgo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+
ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9sb2dp
Y3BkLHR5cGUyOC55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRh
LXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBMb2dpYyBQRCBUeXBlIDI4IDQu
MyIgV1FWR0EgVEZUIExDRCBwYW5lbAo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBB
ZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPiA+ICsKPgo+IFlvdSBuZWVkOgo+Cj4gYWxs
T2Y6Cj4gICAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1sIwo+Cj4gPiArcHJvcGVydGllczoKPiA+
ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIGNvbnN0OiBsb2dpY3BkLHR5cGUyOAo+ID4gKwo+Cj4g
PiArICBwb3dlci1zdXBwbHk6Cj4gPiArICAgIGRlc2NyaXB0aW9uOiBSZWd1bGF0b3IgdG8gcHJv
dmlkZSB0aGUgc3VwcGx5IHZvbHRhZ2UKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsg
IGVuYWJsZS1ncGlvczoKPiA+ICsgICAgZGVzY3JpcHRpb246IEdQSU8gcGluIHRvIGVuYWJsZSBv
ciBkaXNhYmxlIHRoZSBwYW5lbAo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAgYmFj
a2xpZ2h0Ogo+ID4gKyAgICBkZXNjcmlwdGlvbjogQmFja2xpZ2h0IHVzZWQgYnkgdGhlIHBhbmVs
Cj4gPiArICAgICRyZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxl
Igo+Cj4gVGhlc2UgMyBhcmUgYWxsIGRlZmluZWQgaW4gdGhlIGNvbW1vbiBzY2hlbWEsIHNvIHlv
dSBqdXN0IG5lZWQgJ3RydWUnCj4gZm9yIHRoZSB2YWx1ZSB0byBpbmRpY2F0ZSB0aGV5IGFwcGx5
IHRvIHRoaXMgcGFuZWwgYW5kIHRvIG1ha2UKPiAnYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNl
JyBoYXBweS4KClNvcnJ5IGZvciBteSBpZ25vcmFuY2UsIGJ1dCBJIGFtIG5vdCBmYW1pbGlhciB3
aXRoIHRoZSBzeW50YXggaGVyZSwKbm9yIGRvIEkgdW5kZXJzdGFuZCB3aGF0IGlzIHJlcXVpcmVk
LiAgU2luY2UgdGhlcmUgYXJlbid0IG1hbnkgZGlzcGxheQpwYW5lbHMgd2l0aCB5YW1sIGRvY3Ms
IEkgZG9uJ3Qga25vdyB3aGF0IGlzIGV4cGVjdGVkIGFuZCBjbGVhcmx5IHRoZQpvbmUgSSB1c2Vk
IGFzIGEgdGVtcGxhdGUgZGlkbid0IGRvIGl0IHJpZ2h0IGVpdGhlci4KCklzIHRoZXJlIGEgYnJh
bmNoICB3aGVyZSB0aGlzIHN0dWZmIGlzIGxvY2F0ZWQ/IEkgYW0ganVzdCB1c2luZyB0aGUKbGF0
ZXN0IGxpbnV4LXN0YWJsZSBicmFuY2guCgo+Cj4gPiArCj4gPiArcmVxdWlyZWQ6Cj4gPiArICAt
IGNvbXBhdGlibGUKPgo+IEFyZSB0aGUgcmVzdCByZWFsbHkgb3B0aW9uYWw/CgpGcm9tIHdoYXQg
SSBjYW4gdGVsbCwgdGhleSBhcmUgb3B0aW9uYWwuICBJIGFtIGp1c3QgYWRkaW5nIHNvbWUgdGlt
aW5nCmluZm8gdG8gYW4gYWxyZWFkeSBleGlzdGluZyBkcml2ZXIuICBJdCdzIG5vdCBteSBkcml2
ZXIuCgoKPgo+ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gLS0KPiA+
IDIuMTcuMQo+ID4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
