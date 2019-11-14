Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05639FD089
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 22:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D29A6EF35;
	Thu, 14 Nov 2019 21:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DF36EF34;
 Thu, 14 Nov 2019 21:47:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i12so8523341wro.5;
 Thu, 14 Nov 2019 13:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vggJhlJsQPYOuIddaFToYLu/+ThV761jMo0sh09MUiY=;
 b=L9VSOXSE3dwDAoQ5udVQjcsqKaSAJvdyr+ESqOiCQFk7qRPVMq+wrPwUPAuUxEO37a
 PPg3m0yf7I+BaUEiaEi+rszZNoDEXeMR53YWMP6D1i/xRO9CTTka/6sDrFRsp9TzD39x
 Br+asqjPTeqY9kFZ7RTmioUTmcITJsnh/uiT2ev5J9DBbUjmHxMJWZXOUmhSaEJej0Ls
 rI/127zfW/RttwdV67hGbPCG4JSTvbgKTSM7rpUlkbfU0b+4U2KEJ3q18q6fgyOTlYdF
 mwAw/cl+P/TckuQmDc7eIJqp3Mt/1n1DaUBV+YgMZTyjV5t6vp9HTrgD/UcFz+nwtQKh
 GqYA==
X-Gm-Message-State: APjAAAWJvuKwlBQPaM5vAHVx5aNL6f/FKpRYBVF7HDJ0LX/jmD7E35fy
 TawBI7A9weA1sZoMloeXcM7U1NGn9dNCCRIi7fj/JA==
X-Google-Smtp-Source: APXvYqz0AMNSWWth1fWIIoLzPrOEismMZW1h3BdGQ3AGn6d5tJnUnKEMq1cfaHyjWcx8xsRnAtB/i3PNC/B62GekEmE=
X-Received: by 2002:adf:f010:: with SMTP id j16mr11526282wro.206.1573768076188; 
 Thu, 14 Nov 2019 13:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20191114204413.457504-1-chris@chris-wilson.co.uk>
 <129b52ff-6931-bd27-c2e0-6e17767d8fdd@amd.com>
In-Reply-To: <129b52ff-6931-bd27-c2e0-6e17767d8fdd@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Nov 2019 16:47:44 -0500
Message-ID: <CADnq5_OVorCwRewJkFdUy36i9dGHh2QPStbNH-5hUbff9eZ+6A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/dm: Do not throw an error for a display with
 no audio
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=vggJhlJsQPYOuIddaFToYLu/+ThV761jMo0sh09MUiY=;
 b=o/bqG9Zy/eHWBUp7ECMMxcGI/DwiTBd4slPf2kT98JRgUTn1EW2aImvMcCSCjHiL21
 l3zWYRDLqC6AGI4HdxqDkKhMTTRiiyd0x4Pf+aBLoN+6Kwhh1hyFrDmDaIXPUQZYCkVf
 uN7so/stxnyh2LCRHiVEInhSbg6Umdcaz4UqYsMSN5fCEfyNy+6xWe6A1cyl+FizAhwF
 JHlt05YHua3ijANoiSwewlBkWqyzxdl7z2/KejCpshW9TvQKWA782xugYAI8ROVxnsft
 9cHClrhRkpgb+qUDH8DviiF+rlafdOYxqep17ngPrSYC6w1OnAJUrSoYIgqEZYnyKw4k
 bh7A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jean Delvare <jdelvare@suse.de>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgNDoyMyBQTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTExLTE0IDM6NDQgcC5tLiwgQ2hyaXMgV2lsc29u
IHdyb3RlOgo+ID4gQW4gb2xkIGRpc3BsYXkgd2l0aCBubyBhdWRpbyBtYXkgbm90IGhhdmUgYW4g
RURJRCB3aXRoIGEgQ0VBIGJsb2NrLCBvcgo+ID4gaXQgbWF5IHNpbXBseSBiZSB0b28gb2xkIHRv
IHN1cHBvcnQgYXVkaW8uIFRoaXMgaXMgbm90IGEgZHJpdmVyIGVycm9yLAo+ID4gc28gZG9uJ3Qg
ZmxhZyBpdCBhcyBzdWNoLgo+ID4KPiA+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0
b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTIxNDAKPiA+IFJlZmVyZW5jZXM6IGFlMmEzNDk1OTcz
ZSAoImRybS9hbWQ6IGJlIHF1aWV0IHdoZW4gbm8gU0FEIGJsb2NrIGlzIGZvdW5kIikKPiA+IFNp
Z25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+Cj4g
UmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+CgpB
cHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiBIYXJyeQo+Cj4gPiBDYzogSGFycnkgV2VudGxhbmQg
PGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gPiBDYzogSmVhbiBEZWx2YXJlIDxqZGVsdmFyZUBz
dXNlLmRlPgo+ID4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX2hlbHBlcnMuYyB8IDIgLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG1faGVscGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1faGVscGVycy5jCj4gPiBpbmRleCAxMWU1Nzg0YWE2MmEuLjA0ODA4ZGJl
Y2FiMyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCj4gPiBAQCAtOTcsOCArOTcsNiBAQCBl
bnVtIGRjX2VkaWRfc3RhdHVzIGRtX2hlbHBlcnNfcGFyc2VfZWRpZF9jYXBzKAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIChzdHJ1Y3QgZWRpZCAqKSBlZGlkLT5yYXdfZWRpZCk7Cj4gPgo+ID4g
ICAgICAgc2FkX2NvdW50ID0gZHJtX2VkaWRfdG9fc2FkKChzdHJ1Y3QgZWRpZCAqKSBlZGlkLT5y
YXdfZWRpZCwgJnNhZHMpOwo+ID4gLSAgICAgaWYgKHNhZF9jb3VudCA8IDApCj4gPiAtICAgICAg
ICAgICAgIERSTV9FUlJPUigiQ291bGRuJ3QgcmVhZCBTQURzOiAlZFxuIiwgc2FkX2NvdW50KTsK
PiA+ICAgICAgIGlmIChzYWRfY291bnQgPD0gMCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJl
c3VsdDsKPiA+Cj4gPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
