Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23CC203E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 13:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6A66E073;
	Mon, 30 Sep 2019 11:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
 [209.85.221.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4D96E073
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 11:56:26 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id v78so2592193vke.4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 04:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XK+Pj//CAf98OmvrIc+Zkz8mL+/Q71gw+jEEwWOAJHE=;
 b=iTR8CqEGDQgFq6eu8kLTJ8I+8qV/MIrhwjeuzQ13sBn+pgCFRpFnBipNtQTU70ZyAO
 NWjOd4SSbqqg6F1PRr78P0IwWrguKviOd77JNN/4PrlW+d5a2yselwTBZxMPui1lMUds
 e6PHaodVhQRZ1OPdpbVhR8TJr6woz/A465rwMi4N1nCy+SBIjkdqQkiLjjX9sqU175Tv
 I+EJ/CSYGHhVopZCF9e6Y1DPLpQleoK4222HtjjZQNYLP3vlt/h7Dpv2Ug1SHBhMOM1g
 AW7wI4BPnRASWv0vE3YI4sUy1ysjkkkk7n5KXI4O3MkzwkWfC9lQXut3PfxeenUiLfMJ
 qjrg==
X-Gm-Message-State: APjAAAVE/0aPDzaShs3Jcqm4Ec2tS9WnERU953gLcan29ShHbNsbY2gG
 Pn/elAiqQXg9bcKzEK4myqmjqOz8iI9dDpdgW9I=
X-Google-Smtp-Source: APXvYqyp3oqLhmTa6dfK6tao5pcqoru4TZ3YQ6anF9MveP7plK/oRqyonurgvgfZ4sQelX1+qjAQP5Ngs9QvGZXbQT0=
X-Received: by 2002:a1f:e387:: with SMTP id a129mr11405vkh.14.1569844585010;
 Mon, 30 Sep 2019 04:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190930045408.8053-1-james.qian.wang@arm.com>
 <20190930045408.8053-3-james.qian.wang@arm.com>
 <20190930110438.6w7jtw2e5s2ykwnd@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190930110438.6w7jtw2e5s2ykwnd@DESKTOP-E1NTVVP.localdomain>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 30 Sep 2019 07:56:13 -0400
Message-ID: <CAKb7UviDMLLJWZYV_aW2odJBfmSA8pH7TVuU7T9qpuy1713-EA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/komeda: Add drm_ctm_to_coeffs()
To: Brian Starkey <Brian.Starkey@arm.com>
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
Cc: nd <nd@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, "sean@poorly.run" <sean@poorly.run>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgNzowNSBBTSBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFy
a2V5QGFybS5jb20+IHdyb3RlOgo+Cj4gSGkgSmFtZXMsCj4KPiBPbiBNb24sIFNlcCAzMCwgMjAx
OSBhdCAwNDo1NDo0MUFNICswMDAwLCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENo
aW5hKSB3cm90ZToKPiA+IFRoaXMgZnVuY3Rpb24gaXMgdXNlZCB0byBjb252ZXJ0IGRybV9jb2xv
cl9jdG0gUzMxLjMyIHNpZ24tbWFnbml0dWRlCj4gPiB2YWx1ZSB0byBrb21lZGEgcmVxdWlyZWQg
UTIuMTIgMidzIGNvbXBsZW1lbnQKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBqYW1lcyBxaWFuIHdh
bmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gPiAt
LS0KPiA+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgICAgfCAy
NyArKysrKysrKysrKysrKysrKysrCj4gPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
Y29sb3JfbWdtdC5oICAgIHwgIDEgKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9u
cygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKPiA+IGluZGV4IGMxODBjZTcwYzI2Yy4uYzkyYzgyZWVi
ZGRiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfY29sb3JfbWdtdC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKPiA+IEBAIC0xMTcsMyArMTE3LDMwIEBAIHZvaWQg
ZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Js
b2IsIHUzMiAqY29lZmZzKQo+ID4gIHsKPiA+ICAgICAgIGRybV9sdXRfdG9fY29lZmZzKGx1dF9i
bG9iLCBjb2VmZnMsIHNlY3Rvcl90YmwsIEFSUkFZX1NJWkUoc2VjdG9yX3RibCkpOwo+ID4gIH0K
PiA+ICsKPiA+ICsvKiBDb252ZXJ0IGZyb20gUzMxLjMyIHNpZ24tbWFnbml0dWRlIHRvIEhXIFEy
LjEyIDIncyBjb21wbGVtZW50ICovCj4gPiArc3RhdGljIHMzMiBkcm1fY3RtX3MzMV8zMl90b19x
Ml8xMih1NjQgaW5wdXQpCj4gPiArewo+ID4gKyAgICAgdTY0IG1hZyA9IChpbnB1dCAmIH5CSVRf
VUxMKDYzKSkgPj4gMjA7Cj4gPiArICAgICBib29sIG5lZ2F0aXZlID0gISEoaW5wdXQgJiBCSVRf
VUxMKDYzKSk7Cj4gPiArICAgICB1MzIgdmFsOwo+ID4gKwo+ID4gKyAgICAgLyogdGhlIHJhbmdl
IG9mIHNpZ25lZCAycyBjb21wbGVtZW50IGlzIFstMl5uLCAyXm4gLSAxXSAqLwo+ID4gKyAgICAg
dmFsID0gY2xhbXBfdmFsKG1hZywgMCwgbmVnYXRpdmUgPyBCSVQoMTQpIDogQklUKDE0KSAtIDEp
Owo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIG5lZ2F0aXZlID8gMCAtIHZhbCA6IHZhbDsKPiA+ICt9
Cj4KPiBUaGlzIGZ1bmN0aW9uIGxvb2tzIGdlbmVyYWxseSB1c2VmdWwuIFNob3VsZCBpdCBiZSBp
biBEUk0gY29yZQo+IChhc3N1bWluZyB0aGVyZSBpc24ndCBhbHJlYWR5IG9uZSB0aGVyZSk/Cj4K
PiBZb3UgY2FuIHVzZSBhIHBhcmFtZXRlciB0byBkZXRlcm1pbmUgdGhlIG51bWJlciBvZiBiaXRz
IGRlc2lyZWQgaW4gdGhlCj4gb3V0cHV0LgoKSSBzdXNwZWN0IGV2ZXJ5IGRyaXZlciBuZWVkcyB0
byBkbyBzb21ldGhpbmcgc2ltaWxhci4gWW91IGNhbiBzZWUgd2hhdApJIGRpZCBmb3Igbm91dmVh
dSBoZXJlOgoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9ODhiNzAzNTI3YmE3MDY1OTM2NWQ5ODlmMjk1
NzlmMTI5MmViZjljMwoKKGxvb2sgZm9yIGNzY19kcm1fdG9fYmFzZSkKCldvdWxkIGJlIGdyZWF0
IHRvIGhhdmUgYSBjb21tb24gaGVscGVyIHdoaWNoIGNvcnJlY3RseSBhY2NvdW50cyBmb3IKYWxs
IHRoZSB2YXJpYWJpbGl0eS4KCkNoZWVycywKCiAgLWlsaWEKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
