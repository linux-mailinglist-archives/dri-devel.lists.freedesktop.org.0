Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0C2F3C1F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC39089872;
	Tue, 12 Jan 2021 22:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC9689861;
 Tue, 12 Jan 2021 22:06:28 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id n42so3806629ota.12;
 Tue, 12 Jan 2021 14:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v2IK/NFjofvH2Ou69izMNHCTAVddaeni/Whrm41uViw=;
 b=YO6eD2IUoUgFIpbB/zPQCGazEd3RveHhEhQcr7AdqNpI4vqwLyv3TmTyiWg9GY73dp
 HDrNWSHPB3QjJqrAaforMFJpWYbyv+dzceBZdsiwQL/SJFLHBpfFlkSNhAIsyYqZfJDQ
 J0m5KVJpTz85YHMG67Fkl3/GS+MAmCLOqJGGpKweG+xn+vWYe82x4UtX9QvWLdLniS7m
 NZD+sw7QSzgtLCnuJZrHwsc2ADvEODMHFuAJLTtPY9Qc+F7t+mwZHkwgj8iP1YU5SuSQ
 LZIgVK+RDcHVvz3lU0Ge5iZX+2ZGZlRngJpn1BoUE4UMkQGZEkHEjDoZWypBP+sCdr45
 hJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v2IK/NFjofvH2Ou69izMNHCTAVddaeni/Whrm41uViw=;
 b=BWmyxucbsFtL433SELeMEOnQT1yBr5kucx+xyhjwZp9mmjEJ8AUey1Y76/6DNI/cmM
 7OC2538dbjfQgQSYMY1ETPnBjenyeSzrcrUi1yge3UWQmgA98+8y9D5ou2nmqPqY+FhB
 kEgeHsd+OLEgtu0ySiqfRC1uEP3+zQ8/34WwaarCNVoCnlydcu87Qo/fcBGmu6ShFDqs
 tOudIQTE/2nHNVHxeGrZ+XxDhLG7lUUaASleuD9gXc2jI1IIfQrqVV8BjEqr9hVesiV3
 ecxxzz2lzCZxRsxFE3kJWVyhIu26BLkmTrF+SRiQd+MGpHRxYKgYWIGzBDHZIZOaw1+K
 rNOQ==
X-Gm-Message-State: AOAM531JKNDukcZR03GRyJcr9PM1VkyBSryqJ+p/F8nfus1sVKiHfEJ3
 xQa5lbv6DEntopuS8nS29IrwQg/gr4O/Hhrsf78=
X-Google-Smtp-Source: ABdhPJytTKIB/gdnU7OV+wKOCYl0AHKhhm3eKvGBPp/te0fMVPwCgYqzSE9geOrWFVaPw0pJm8BS43a1Eo/lN3GnUvg=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr994925otl.311.1610489187690; 
 Tue, 12 Jan 2021 14:06:27 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-11-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-11-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:06:16 -0500
Message-ID: <CADnq5_N40DL6=VKXA89kbTH-h=AoZ3HTJm3L2yqa0=V8v05eiA@mail.gmail.com>
Subject: Re: [PATCH 10/40] drm/amd/display/dc/dce120/dce120_hw_sequencer:
 Encompass defines in same clause as their use
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoxOSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IElkZWFsbHkgc29tZW9uZSBzaG91bGQgc3RyaXAtb3V0IGFsbCB0
aGVzZSBnYXJiYWdlICdpZiAwJ3MuCj4KPiBUZW1wdGVkIHRvIGNhcnJ5IG91dCB0aGUgd29yayBt
eXNlbGYgb24gcHJpbmNpcGxlIQo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1
aWxkIHdhcm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxh
eS9kYy9kY2UxMjAvZGNlMTIwX2h3X3NlcXVlbmNlci5jOjUzOjQ3OiB3YXJuaW5nOiDigJhyZWdf
b2Zmc2V0c+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9
XQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5r
cyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAv
ZGNlMTIwX2h3X3NlcXVlbmNlci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX2h3X3NlcXVlbmNlci5jCj4gaW5kZXggNjZh
MTNhYTM5Yzk1MS4uZDRhZmU2YzgyNGQyYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9od19zZXF1ZW5jZXIuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX2h3X3NlcXVlbmNlci5jCj4g
QEAgLTUwLDYgKzUwLDcgQEAgc3RydWN0IGRjZTEyMF9od19zZXFfcmVnX29mZnNldHMgewo+ICAg
ICAgICAgdWludDMyX3QgY3J0YzsKPiAgfTsKPgo+ICsjaWYgMAo+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRjZTEyMF9od19zZXFfcmVnX29mZnNldHMgcmVnX29mZnNldHNbXSA9IHsKPiAgewo+ICAg
ICAgICAgLmNydGMgPSAobW1DUlRDMF9DUlRDX0dTTF9DT05UUk9MIC0gbW1DUlRDMF9DUlRDX0dT
TF9DT05UUk9MKSwKPiBAQCAtNzksNyArODAsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRjZTEy
MF9od19zZXFfcmVnX29mZnNldHMgcmVnX29mZnNldHNbXSA9IHsKPiAgLyoqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioKPiAgICogUHJpdmF0ZSBkZWZpbml0aW9ucwo+ICAgKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqLwo+IC0jaWYgMAo+ICBzdGF0aWMgdm9pZCBkY2UxMjBfaW5pdF9wdGUoc3RydWN0IGRjX2Nv
bnRleHQgKmN0eCwgdWludDhfdCBjb250cm9sbGVyX2lkKQo+ICB7Cj4gICAgICAgICB1aW50MzJf
dCBhZGRyOwo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
