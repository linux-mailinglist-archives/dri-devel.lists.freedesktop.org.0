Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8BD6E188
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A3E6E5B9;
	Fri, 19 Jul 2019 07:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415B86E357
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 09:11:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id v19so24863528wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 02:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=cgxFmB7fwKrgILlUIC0ec2qPs5hk2bU+DCN7tu8rZt0=;
 b=WwfBzKunIkruVoHhoVicCq8o2v9akPcvcyG7BLv0IIqNGC+OswaCQWSni8Lq52LzKx
 h5XUnfmgIEFiczO2lL4xmOa0A6bWCSTK8C1PSGy8EHc/1TGibB7oTzpt/NPPB+3JOGDW
 dDsyBsknu19/Go1IBS039+3EnQ6iiWG/ZEOmIl+YOziZShpe+aUmJTv7qzLJ5QkAogMU
 D+hT0lnwknQVZUw7mi7YmA3wIa/Et2zpKKBqTp6aCYE8S1LyzXcEWga864u0QfTAe3KP
 miPINaBEo1Ir9wgaPajKKrqJ1w4kcL9smllnMNmgctb3+kU6OCze1NM8walCej7NcRTr
 mDqw==
X-Gm-Message-State: APjAAAV7G+VBAB5iDcUKV8Lfaud2ZTksuZhNxAU5XTdn3SuDpeMhph5+
 x8D51JBT6aie3I9h9ya+/o0=
X-Google-Smtp-Source: APXvYqznXkQ4/eQRSNMRvw5K+ZRZrrlSWMCWLQKQdT3aylteGmOuFdUf2w3voydXaHw0Fmm2L4Mstg==
X-Received: by 2002:a1c:eb0a:: with SMTP id j10mr43839779wmh.1.1563441062000; 
 Thu, 18 Jul 2019 02:11:02 -0700 (PDT)
Received: from Timur-XPS (catv-80-99-228-232.catv.broadband.hu.
 [80.99.228.232])
 by smtp.gmail.com with ESMTPSA id t13sm32088923wrr.0.2019.07.18.02.11.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 02:11:01 -0700 (PDT)
Message-ID: <1061c44a462961e3d67b075b81a14eb6155a12fd.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <michel@daenzer.net>
Date: Thu, 18 Jul 2019 11:11:00 +0200
In-Reply-To: <CADnq5_PHyGcjeOygwnuXgR_DpS4_c2G=KgykRaBHj6PZcEmP7g@mail.gmail.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
 <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
 <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
 <f986d6687e2b1f1fc8a93f86cbc8fd1ab971663a.camel@gmail.com>
 <d1dfe289-8501-8848-6324-c43d6e66a77f@daenzer.net>
 <4ee5439cb01e355436d618f5d6f2e109410dc35e.camel@gmail.com>
 <eee4eea0-ad27-9d05-192d-c1207da5d0bc@daenzer.net>
 <CADnq5_PHyGcjeOygwnuXgR_DpS4_c2G=KgykRaBHj6PZcEmP7g@mail.gmail.com>
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:16:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=cgxFmB7fwKrgILlUIC0ec2qPs5hk2bU+DCN7tu8rZt0=;
 b=NB7LWU3D6FJi3dg3vlxxTzffC0uFf0uHEhJ9jma19bW9n4vnSeAlUN0VShBMVeQ5AE
 2Lb5oHSQQnDMLNDhzT9qOyB71lzblAXQoA6lgZ1zai9MAz0PC0v9Hxw+FrWVldqihnwo
 VcXd30BrLyp48Hdwc4ZtMpJvtl0UKpzbk42zmz9i+ErQFQym2tA6a05qDSUTeU7UkwTT
 ihqlTjfKZS3Uj/Cn7EpwOiAaCWMWsBLxa5Kn8uWyl5Jwu7vDpBjbosF6ki2RyiE72XoH
 E0aTmZcYAESS/wdwAxmC8JuIrn91yg7ZCmZSwNATcIY9LouNJ4qtiZBGB1f1GiJCHWk3
 mkKQ==
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA3LTA1IGF0IDA5OjM2IC0wNDAwLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4g
T24gVGh1LCBKdWwgNCwgMjAxOSBhdCA2OjU1IEFNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFl
bnplci5uZXQ+Cj4gd3JvdGU6Cj4gPiBPbiAyMDE5LTA3LTAzIDE6MDQgcC5tLiwgVGltdXIgS3Jp
c3TDs2Ygd3JvdGU6Cj4gPiA+ID4gPiBUaGVyZSBtYXkgYmUgb3RoZXIgZmFjdG9ycywgeWVzLiBJ
IGNhbid0IG9mZmVyIGEgZ29vZAo+ID4gPiA+ID4gZXhwbGFuYXRpb24KPiA+ID4gPiA+IG9uCj4g
PiA+ID4gPiB3aGF0IGV4YWN0bHkgaXMgaGFwcGVuaW5nLCBidXQgaXQncyBwcmV0dHkgY2xlYXIg
dGhhdCBhbWRncHUKPiA+ID4gPiA+IGNhbid0Cj4gPiA+ID4gPiB0YWtlCj4gPiA+ID4gPiBmdWxs
IGFkdmFudGFnZSBvZiB0aGUgVEIzIGxpbmssIHNvIGl0IHNlZW1lZCBsaWtlIGEgZ29vZCBpZGVh
Cj4gPiA+ID4gPiB0bwo+ID4gPiA+ID4gc3RhcnQKPiA+ID4gPiA+IGludmVzdGlnYXRpbmcgdGhp
cyBmaXJzdC4KPiA+ID4gPiAKPiA+ID4gPiBZZWFoLCBhY3R1YWxseSBpdCB3b3VsZCBiZSBjb25z
aXN0ZW50IHdpdGggfjE2LTMyIEtCCj4gPiA+ID4gZ3JhbnVsYXJpdHkKPiA+ID4gPiB0cmFuc2Zl
cnMgYmFzZWQgb24geW91ciBtZWFzdXJlbWVudHMgYWJvdmUsIHdoaWNoIGlzIHBsYXVzaWJsZS4K
PiA+ID4gPiBTbwo+ID4gPiA+IG1ha2luZyBzdXJlIHRoYXQgdGhlIGRyaXZlciBkb2Vzbid0IGFy
dGlmaWNpYWxseSBsaW1pdCB0aGUgUENJZQo+ID4gPiA+IGJhbmR3aWR0aCBtaWdodCBpbmRlZWQg
aGVscC4KPiA+ID4gCj4gPiA+IENhbiB5b3UgcG9pbnQgbWUgdG8gdGhlIHBsYWNlIHdoZXJlIGFt
ZGdwdSBkZWNpZGVzIHRoZSBQQ0llIGxpbmsKPiA+ID4gc3BlZWQ/Cj4gPiA+IEknZCBsaWtlIHRv
IHRyeSB0byB0d2VhayBpdCBhIGxpdHRsZSBiaXQgdG8gc2VlIGlmIHRoYXQgaGVscHMgYXQKPiA+
ID4gYWxsLgo+ID4gCj4gPiBJJ20gbm90IHN1cmUgb2ZmaGFuZCwgQWxleCBvciBhbnlvbmU/Cj4g
Cj4gYW1kZ3B1X2RldmljZV9nZXRfcGNpZV9pbmZvKCkgaW4gYW1kZ3B1X2RldmljZS5jLgoKCkhp
IEFsZXgsCgpJIHRvb2sgYSBsb29rIGF0IGFtZGdwdV9kZXZpY2VfZ2V0X3BjaWVfaW5mbygpIGFu
ZCBmb3VuZCB0aGF0IGl0IHVzZXMKcGNpZV9iYW5kd2lkdGhfYXZhaWxhYmxlIHRvIGRldGVybWlu
ZSB0aGUgY2FwYWJpbGl0aWVzIG9mIHRoZSBQQ0llCnBvcnQuIEhvd2V2ZXIsIHBjaWVfYmFuZHdp
ZHRoX2F2YWlsYWJsZSBnaXZlcyB5b3Ugb25seSB0aGUgY3VycmVudApiYW5kd2lkdGggYXMgc2V0
IGJ5IHRoZSBQQ0llIGxpbmsgc3RhdHVzIHJlZ2lzdGVyLCBub3QgdGhlIG1heGltdW0KY2FwYWJp
bGl0eS4KCkkgdGhpbmsgc29tZXRoaW5nIGFsb25nIHRoZXNlIGxpbmVzIHdvdWxkIGZpeCBpdDoK
aHR0cHM6Ly9wYXN0ZWJpbi5jb20vTHNjRU1LTWMKCkl0IHNlZW1zIHRvIG1lIHRoYXQgdGhlIFBD
SWUgY2FwYWJpbGl0aWVzIGFyZSBvbmx5IHVzZWQgaW4gYSBmZXcgcGxhY2VzCmluIHRoZSBjb2Rl
LCBzbyB0aGlzIHBhdGNoIGZpeGVzIHBwX2RwbV9wY2llLiBIb3dldmVyIGl0IGRvZXNuJ3QgYWZm
ZWN0CnRoZSBhY3R1YWwgcGVyZm9ybWFuY2UuCgpXaGF0IGRvIHlvdSB0aGluaz8KCkJlc3QgcmVn
YXJkcywKVGltCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
