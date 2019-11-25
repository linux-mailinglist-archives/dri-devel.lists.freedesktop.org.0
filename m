Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A0E10902D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 15:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F45B89BAF;
	Mon, 25 Nov 2019 14:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE28489BAF;
 Mon, 25 Nov 2019 14:39:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 4so15067355wro.7;
 Mon, 25 Nov 2019 06:39:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ecueCuKSr37n+vkm31GM7A+71gfejKdjoOMSUhMBo2o=;
 b=MK0QKswez9OJPdk0axnQjyzxlpMG9pxweSwHMuBtek8/XeNghsFGY73wD/0KDo8dJW
 WEZV9RNt0qTq8gR2s8qqdexPbTnddvSVmV/tjk0zpxCRyFYh5z9iALbMpewdHT1XWT0y
 E+m1/HPmdU3DLCM6YccRmxCPTsaCdHyW4DghxukHpSfek05gf588TRMPDZLxHpIx02OI
 RYxgCYZyEM5wa7w2pawHnYODiN02p0AGyG+ypJmepfEyOlng94T0h7obSduAD3K/Hbb3
 rzOuviVlWfcV+Zobl/DpveNCWRGKCYLDyzHdwDkYxcZ1rc1dWPuNUG2v4CYykPIVRqjm
 USrQ==
X-Gm-Message-State: APjAAAXLzcNB7L7XXP81ovk0JlQ+wTyyp2SNwjG8rJJUTIAPuiHVKWeB
 KAiVXIUFF6Vhk2FgSDhLts8P7KWp77fIrENZCF0=
X-Google-Smtp-Source: APXvYqyjTXu9vQHknVXc4ju7K1dNWI7kc+GqpCB40hEyro6dQNA7puIeMT9WyIgbJMLN5Wo8ImF120mcCzV/rPW+ujc=
X-Received: by 2002:adf:f54c:: with SMTP id j12mr13947842wrp.40.1574692773362; 
 Mon, 25 Nov 2019 06:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20191122230407.109636-1-colin.king@canonical.com>
In-Reply-To: <20191122230407.109636-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Nov 2019 09:39:21 -0500
Message-ID: <CADnq5_PN99cigjruAv38y2KHHdrNY2VAqKhD_K3yUoO01Q4b_w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: remove redundant assignment to
 variables HiSidd and LoSidd
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ecueCuKSr37n+vkm31GM7A+71gfejKdjoOMSUhMBo2o=;
 b=VVrUFOsJGQExRW2rDxIPa6RJmJnRc7IGGJkgd4Ak9GySSwa9AdmDhwCCuTYARJKBcT
 e0zltgd1kPZbnQTSye+EphEnJf2yE6gIXhsm5h9IQ99Hx1qLzOadICfMyHwV1/3MK4Oq
 uWDjDBnrLW6KwgVlhdKnTtpkIfjNI3pJuLOh16qWQ7YH3irQQf3Vo6xbXQwJHlVz+QkH
 meJFoGpfhu07JRlCX7zcMCcgJ3fa9JZPNHbxHPdKPP2XzFx4M/JYawF8QmQXG8OBdJKW
 Vzv/kK4zxK0wDkO5nsIvoC2oH2hJwClBj4fKkhKIT+ErrUc3kNQ5dHi1C5bJqzW2EuD9
 Uc2w==
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgNjowNCBQTSBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdA
Y2Fub25pY2FsLmNvbT4KPgo+IFRoZSB2YXJpYWJsZXMgSGlTaWRkIGFuZCBMb1NpZGQgYXJlIGJl
aW5nIGluaXRpYWxpemVkIHdpdGggdmFsdWVzIHRoYXQKPiBhcmUgbmV2ZXIgcmVhZCBhbmQgYXJl
IGJlaW5nIHVwZGF0ZWQgYSBsaXR0bGUgbGF0ZXIgd2l0aCBhIG5ldyB2YWx1ZS4KPiBUaGUgaW5p
dGlhbGl6YXRpb24gaXMgcmVkdW5kYW50IGFuZCBjYW4gYmUgcmVtb3ZlZC4KPgo+IEFkZHJlc3Nl
cy1Db3Zlcml0eTogKCJVbnVzZWQgdmFsdWUiKQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBL
aW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2NpX3NtdW1nci5j
IHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdy
L2NpX3NtdW1nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2NpX3Nt
dW1nci5jCj4gaW5kZXggMTU1OTBmZDg2ZWY0Li44NjhlMmQ1ZjZlNjIgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2NpX3NtdW1nci5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2NpX3NtdW1nci5jCj4gQEAgLTY1
Myw4ICs2NTMsOCBAQCBzdGF0aWMgaW50IGNpX21pbl9tYXhfdl9nbmJsX3BtX2xpZF9mcm9tX2Jh
cG1fdmRkYyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQo+ICBzdGF0aWMgaW50IGNpX3BvcHVsYXRl
X2JhcG1fdmRkY19iYXNlX2xlYWthZ2Vfc2lkZChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQo+ICB7
Cj4gICAgICAgICBzdHJ1Y3QgY2lfc211bWdyICpzbXVfZGF0YSA9IChzdHJ1Y3QgY2lfc211bWdy
ICopKGh3bWdyLT5zbXVfYmFja2VuZCk7Cj4gLSAgICAgICB1aW50MTZfdCBIaVNpZGQgPSBzbXVf
ZGF0YS0+cG93ZXJfdHVuZV90YWJsZS5CYXBtVmRkQ0Jhc2VMZWFrYWdlSGlTaWRkOwo+IC0gICAg
ICAgdWludDE2X3QgTG9TaWRkID0gc211X2RhdGEtPnBvd2VyX3R1bmVfdGFibGUuQmFwbVZkZENC
YXNlTGVha2FnZUxvU2lkZDsKPiArICAgICAgIHVpbnQxNl90IEhpU2lkZDsKPiArICAgICAgIHVp
bnQxNl90IExvU2lkZDsKPiAgICAgICAgIHN0cnVjdCBwaG1fY2FjX3RkcF90YWJsZSAqY2FjX3Rh
YmxlID0gaHdtZ3ItPmR5bl9zdGF0ZS5jYWNfZHRwX3RhYmxlOwo+Cj4gICAgICAgICBIaVNpZGQg
PSAodWludDE2X3QpKGNhY190YWJsZS0+dXNIaWdoQ0FDTGVha2FnZSAvIDEwMCAqIDI1Nik7Cj4g
LS0KPiAyLjI0LjAKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
