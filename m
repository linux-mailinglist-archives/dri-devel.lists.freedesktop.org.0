Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5F02C90A5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825BC89798;
	Mon, 30 Nov 2020 22:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30ADA89B18;
 Mon, 30 Nov 2020 22:09:53 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id s18so15983851oih.1;
 Mon, 30 Nov 2020 14:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sPlomFmiOATP5cy+/4gpZg1TKtOtldAuJ6wnb9I5pMM=;
 b=Q4AF5f3/ekxxAWG9G7L7o+NUb6iuhCzY2f7My8hBAiKN2sWZ1MrJNHNFbY4oVba4hz
 7wcRa2wM0kiZwXBVeVP/IMA7+raGMMGzebLNDbcqMj2kWUI6r8ujix+ZRhj/SzLXTUch
 nBX++UpSMkxMT/RAg+F7Pt7phEa8QDc7C75yDs+21p34kYIU7qfkkbQzmn4WheTQim+E
 5zp37rdiQGqvDceGr2V1hrFBJGY9HLBMHVvKtIGN9GHBA3/ZrGUA56eh8Qo25zSPS1fk
 W5B+7T8ATK6lYmMzvy/Z2bVEW31jM1JaYsievwW3I/zAmu/qoCt/rbzbvlutcCdQbIaN
 ggNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sPlomFmiOATP5cy+/4gpZg1TKtOtldAuJ6wnb9I5pMM=;
 b=fu8OOLEALmLWqrq6nfLAm3X0A5jFi+c+6CQwDi753w/hW7W0cbVfae1n4miJ1oHsLK
 pIgJbSqqYSPWaV7aBn26WmWho/GOjEmNC6C8lFodY34ekTNJjaO2OcE3MbsSW20Rwxrj
 BaPM3GlV55ESgnICpMYpOgPe6Ox58ikBj24HQBKZwtU/pvWnCY0+PwmHx9GihdOnP0/H
 6fxnRXtg6iHHD328lJ/5/TOdGlcIRETawlLP/sWJWoJT33tWih0UZtC8u0hXgMx9kYwT
 pSpGHOOGC3jEWEoQIf9+bVbbMlv9OwbYs/M57uyPB9HWBtNlcsbIPVfN9JWJIooR1CRs
 Fglw==
X-Gm-Message-State: AOAM532SWYzVOTKiksoyxtMwq1eEINdHuHQ8tQgy9XEFsAMVFSaU35ax
 XbqlWjox5o0//DNCm6prt7FaIlxUwPTGuoBbHF0=
X-Google-Smtp-Source: ABdhPJyuQtT71IW1/NsolB/Nd/3lQC+Ope96JDXvoJUEYTFh3PY1cr5E/dwfiLtr+UeHOyNabWY1HM+9JcyLGYfJtdM=
X-Received: by 2002:aca:f50e:: with SMTP id t14mr833840oih.123.1606774192588; 
 Mon, 30 Nov 2020 14:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-10-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-10-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:09:41 -0500
Message-ID: <CADnq5_O7TXO+zB7BG3OhD7gbWQ8t09U0JKwNyJPWZ4hHjZxKMg@mail.gmail.com>
Subject: Re: [PATCH 09/40] drm/amd/amdgpu/vega10_ih: Add descriptions for 'ih'
 and 'entry'
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Zhigang Luo <zhigang.luo@amd.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5jOjM3
Nzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaWgnIG5vdCBkZXNjcmli
ZWQgaW4gJ3ZlZ2ExMF9paF9nZXRfd3B0cicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dmVnYTEwX2loLmM6NDQwOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdp
aCcgbm90IGRlc2NyaWJlZCBpbiAndmVnYTEwX2loX2RlY29kZV9pdicKPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmM6NDQwOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0
ZXIgb3IgbWVtYmVyICdlbnRyeScgbm90IGRlc2NyaWJlZCBpbiAndmVnYTEwX2loX2RlY29kZV9p
dicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmM6NDgwOiB3YXJuaW5n
OiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAndmVn
YTEwX2loX2lycV9yZWFybScKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2lo
LmM6NTEzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRl
c2NyaWJlZCBpbiAndmVnYTEwX2loX3NldF9ycHRyJwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBaaGlnYW5nIEx1byA8
emhpZ2FuZy5sdW9AYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMgfCA1ICsrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMTBfaWguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3ZlZ2ExMF9paC5jCj4gaW5kZXggNDA3YzYwOTNjMmVjMC4uNTc4ZmRlZTViOTc1OCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMTBfaWguYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5jCj4gQEAgLTM2Niw2ICsz
NjYsNyBAQCBzdGF0aWMgdm9pZCB2ZWdhMTBfaWhfaXJxX2Rpc2FibGUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCj4gICAqIHZlZ2ExMF9paF9nZXRfd3B0ciAtIGdldCB0aGUgSUggcmluZyBi
dWZmZXIgd3B0cgo+ICAgKgo+ICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gKyAq
IEBpaDogSUggcmluZyBidWZmZXIgdG8gZmV0Y2ggd3B0cgo+ICAgKgo+ICAgKiBHZXQgdGhlIElI
IHJpbmcgYnVmZmVyIHdwdHIgZnJvbSBlaXRoZXIgdGhlIHJlZ2lzdGVyCj4gICAqIG9yIHRoZSB3
cml0ZWJhY2sgbWVtb3J5IGJ1ZmZlciAoVkVHQTEwKS4gIEFsc28gY2hlY2sgZm9yCj4gQEAgLTQz
MCw2ICs0MzEsOCBAQCBzdGF0aWMgdTMyIHZlZ2ExMF9paF9nZXRfd3B0cihzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwKPiAgICogdmVnYTEwX2loX2RlY29kZV9pdiAtIGRlY29kZSBhbiBpbnRl
cnJ1cHQgdmVjdG9yCj4gICAqCj4gICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiAr
ICogQGloOiBJSCByaW5nIGJ1ZmZlciB0byBkZWNvZGUKPiArICogQGVudHJ5OiBJViBlbnRyeSB0
byBwbGFjZSBkZWNvZGVkIGluZm9ybWF0aW9uIGludG8KPiAgICoKPiAgICogRGVjb2RlcyB0aGUg
aW50ZXJydXB0IHZlY3RvciBhdCB0aGUgY3VycmVudCBycHRyCj4gICAqIHBvc2l0aW9uIGFuZCBh
bHNvIGFkdmFuY2UgdGhlIHBvc2l0aW9uLgo+IEBAIC00NzMsNiArNDc2LDcgQEAgc3RhdGljIHZv
aWQgdmVnYTEwX2loX2RlY29kZV9pdihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICog
dmVnYTEwX2loX2lycV9yZWFybSAtIHJlYXJtIElSUSBpZiBsb3N0Cj4gICAqCj4gICAqIEBhZGV2
OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiArICogQGloOiBJSCByaW5nIHRvIG1hdGNoCj4gICAq
Cj4gICAqLwo+ICBzdGF0aWMgdm9pZCB2ZWdhMTBfaWhfaXJxX3JlYXJtKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LAo+IEBAIC01MDUsNiArNTA5LDcgQEAgc3RhdGljIHZvaWQgdmVnYTEwX2lo
X2lycV9yZWFybShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICogdmVnYTEwX2loX3Nl
dF9ycHRyIC0gc2V0IHRoZSBJSCByaW5nIGJ1ZmZlciBycHRyCj4gICAqCj4gICAqIEBhZGV2OiBh
bWRncHVfZGV2aWNlIHBvaW50ZXIKPiArICogQGloOiBJSCByaW5nIGJ1ZmZlciB0byBzZXQgcnB0
cgo+ICAgKgo+ICAgKiBTZXQgdGhlIElIIHJpbmcgYnVmZmVyIHJwdHIuCj4gICAqLwo+IC0tCj4g
Mi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
