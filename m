Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A643BD2CC0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 16:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1C16EB5F;
	Thu, 10 Oct 2019 14:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFC86EB5F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 14:44:11 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id i185so5097556oif.9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 07:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DD94yuTg5JsjRwMBnc//T+y7gG5eAMcWwvKdLB/33cA=;
 b=jzPiM8085//dJ0uQiHcrDITahKgUtTRhCigO2TG/oJPd7SP1uAcI8eYWkwXs+98jHa
 34PSqWuWWveJZasAmc4xVOrIj0aWyZYtjUqY3j10NjNBYWXBbOOtYRCBWsMWuTSIKAPy
 GORdXMvrIM3znU1QT36g9yN2F3sFccvMe+cYZLGso4EvDraRKF7IwTGEwiRe5Zp1J5X7
 5cj2kDQGxpSLks+dTatQIEA9c5Mmfq9mM1D2mmIeY0lrII2klz/8sioFYDxARjYaRAcQ
 wl3K/HVLVDn89Unrr+6kvkL42AEA2R+Ct/Pp20BiXZ6ybeHdmhVqQ3WcmbrQRExU4H+g
 XvUA==
X-Gm-Message-State: APjAAAX8dBBU2DBv0zW3E3QRSboAVQ7vGhS/Jqcy778KKy7n1cJO2LyI
 EOwWTWrQI1de6IyhYJsz5geBQAYCJBpCoF0/nGSNvQ==
X-Google-Smtp-Source: APXvYqygYMnJX9I2eKyPIkIz5SWdCdlPSwlAQ+w00ICjAIn2l2yN/qNpE4XbrEkw7mP5WO+jB9hcHAhkgyyteOUZyMk=
X-Received: by 2002:aca:1719:: with SMTP id j25mr7450970oii.132.1570718650178; 
 Thu, 10 Oct 2019 07:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191010041713.3412-1-alexander.deucher@amd.com>
 <CAKMK7uHA_ffw=wDrzu76LXsbRCMVZXhmYogaTPb77u0MqzT7fg@mail.gmail.com>
 <CADnq5_O8q7FEG-GyJxK_jK22rAUnzd1KYcWSbXh=DzKeSNHxhA@mail.gmail.com>
 <974fad60-126e-3876-fa6c-f1a9bbbdd59e@amd.com>
In-Reply-To: <974fad60-126e-3876-fa6c-f1a9bbbdd59e@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 10 Oct 2019 16:43:58 +0200
Message-ID: <CAKMK7uF3GOS9mkLfdrh6GE9ORLfz=a+zR1GJ+VQGHGP9dyQ1FQ@mail.gmail.com>
Subject: Re: [pull] amdgpu/kfd, radeon, ttm drm-next-5.5
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DD94yuTg5JsjRwMBnc//T+y7gG5eAMcWwvKdLB/33cA=;
 b=PmRH9c+2DwABzvNHhZvaW8zMF+BXvmSPE70wyouLWIo5uyzKbbv48txj9TJyI0CXpw
 xGlTZy1MKU6mWCXJoFNLibzC1zfi/a0AQZrfxFeD5Ps5DHPq7LdUxw5sXETMSb7Hpj4U
 O6Kr4iwZqc2V8Wt3qiOSet6+BrlyEiCPC2Khk=
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
Cc: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgNDozNyBQTSBLb2VuaWcsIENocmlzdGlhbgo8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiBBbSAxMC4xMC4xOSB1bSAxNjozNCBzY2hyaWVi
IEFsZXggRGV1Y2hlcjoKPiA+IEFPbiBUaHUsIE9jdCAxMCwgMjAxOSBhdCA1OjU0IEFNIERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+ID4+IE9uIFRodSwgT2N0
IDEwLCAyMDE5IGF0IDY6MTcgQU0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+
IHdyb3RlOgo+ID4+PiBbU05JUF0KPiA+Pj4gQ2hyaXN0aWFuIEvDtm5pZyAoMjIpOgo+ID4+PiAg
ICAgICAgZHJtL2FtZGdwdTogdXNlIG1vdmluZyBmZW5jZSBpbnN0ZWFkIG9mIGV4Y2x1c2l2ZSBm
b3IgVk0gdXBkYXRlcwo+ID4+PiAgICAgICAgZHJtL2FtZGdwdTogcmVzZXJ2ZSBhdCBsZWFzdCA0
TUIgb2YgVlJBTSBmb3IgcGFnZSB0YWJsZXMgdjIKPiA+Pj4gICAgICAgIGRybS9hbWRncHU6IHJl
bW92ZSBhbWRncHVfY3NfdHJ5X2V2aWN0Cj4gPj4gUGF0Y2ggbm8gaGFuZHkgZm9yIGEgZGlyZWN0
IHJlcGx5LCBzbyBhc2tpbmcgaGVyZSAoYnV0IHRoaXMgaXMgdG90YWxseQo+ID4+IHVucmVsYXRl
ZCB0byB0aGUgcHVsbCk6Cj4gPj4KPiA+PiBEbyB5b3UgaGF2ZSBvdGhlciBzdHVmZiB0aGFuIHNj
YW5vdXQgYW5kIHBhZ2V0YWJsZXMgdGhhdCBuZWVkIHRvIGJlIGluCj4gPj4gdnJhbT8gSSB3YXMg
a2luZGEgYXNzdW1lIHRoaXMgaXMgbmVlZGVkIGZvciBiaWcgdnJhbS1vbmx5IG9iamVjdHMgdG8K
PiA+PiBmaXQsIG1ha2luZyBzcGFjZSBieSB0aHJvd2luZyBzdHVmZiBvdXQgdGhhdCBjb3VsZCBh
bHNvIGJlIHB1dCBpbnRvCj4gPj4gc3lzdGVtIG1lbW9yeS4gQnV0IHNvdW5kcyBsaWtlIGl0IHdh
cyBvbmx5IGZvciBtYWtpbmcgcGFnZXRhYmxlcyBmaXQuCj4gPiBZZXMsIGJhc2ljYWxseSBtYWtp
bmcgcGFnZSB0YWJsZXMgZml0LiAgSWYgeW91IHB1c2ggYSBidW5jaCBvZiBzdHVmZgo+ID4gdG8g
c3lzdGVtIHJhbSwgeW91ciBwYWdlIHRhYmxlIHJlcXVpcmVtZW50cyBnbyB1cCB0b28uICBTZWUg
dGhlCj4gPiBkaXNjdXNzaW9uIGhlcmU6Cj4gPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0
cy9hbWQtZ2Z4L21zZzM4NjQwLmh0bWwKClllYWggcmVhZCB0aGF0LCB0aGF0J3Mgd2h5IEkgYXNr
ZWQgd2hldGhlciBwYWdldGFibGVzIHdhcyB0aGUgb25seSBiaWcgdGhpbmcuCgo+IFllYWgsIHR5
cGljYWwgY2hpY2tlbiBhbmQgZWdnIHByb2JsZW0uCj4KPiBXaGVuIHlvdSBldmljdCB0aGluZ3Mg
dG8gc3lzdGVtIG1lbW9yeSBiZWNhdXNlIHlvdSBkb24ndCBoYXZlIGVub3VnaAo+IFZSQU0geW91
IG5lZWQgbW9yZSBWUkFNIGZvciBwYWdlIHRhYmxlcyBzbyB5b3UgbmVlZCB0byBldmljdCBldmVu
IG1vcmUKPiB0aGluZ3MgdG8gc3lzdGVtIG1lbW9yeS4uLi4KPgo+IEFkZGl0aW9uYWwgdG8gdGhh
dCB3ZSBoYXZlIGEgZmV3IG90aGVyIGNhc2VzIHdoZXJlIHdlIHJlYWxseSBuZWVkIFZSQU0KPiBm
b3IgY29ycmVjdCBvcGVyYXRpb24gKGZpcm13YXJlLCBvbGQgTU0gZW5naW5lcyBldGMuLi4pLCBi
dXQgbm90aGluZwo+IG1ham9yIGxpa2UgcGFnZSB0YWJsZXMuCgpZZWFoIG1ha2VzIHNlbnNlLiBB
ZmFpdWkgd2UnbGwgaGF2ZSBhIGZldyBtb3JlIGJpZyB0aGluZ3MgaW4gdnJhbQpvbmx5LCBzbyBJ
IHRoaW5rIHdlJ2xsIHN0ZWFsIHRoaXMgaWRlYSBmb3IgaTkxNS4KLURhbmllbAotLQpEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2
NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
