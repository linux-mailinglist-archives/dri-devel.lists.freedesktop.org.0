Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0C12C939D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EDC89D89;
	Tue,  1 Dec 2020 00:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F9189D67;
 Tue,  1 Dec 2020 00:05:22 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t143so16236403oif.10;
 Mon, 30 Nov 2020 16:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7BTne8SIxbBFHAj//gRT0I7jmTcVfU7zja0kcb89Maw=;
 b=XwFwFP5VKQvAjlOlCnUb9C0k+8u7IQBdEwENOiKjGpYUhhJ2ARUNhURKaKtQxncV8G
 q/XKFGS2/hlRVXidDfvt1MzIYWF5Hix2RSQUw0gG9kHVmHh6KW1wF40+RzC/IYDcbxxw
 fNAZE4lwbLIhYEPU/BpAOX6i2h93EFQZPoMe6tD8EiHQZmglaKiw04gez3McFgLYPwEs
 QDcc2tLuuwQlWIRHSTp8Sj1P2GtzB5OJAafErrvH+yIGAXKej14XyU35vhlzl/iWDdIF
 uHcIwq5suzy5Zh7NR+XQxoKctJ4lnz9n6eAUO6s/UZhydqTP0QTELXtwkdrJp5qM/ciS
 BdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7BTne8SIxbBFHAj//gRT0I7jmTcVfU7zja0kcb89Maw=;
 b=pg1LzOnieA4doClGUMrJWuMhiXMxxF7SKNtlJC8SEX7K77pK+3QVsVPvZfuZCjtAlH
 b+ve24y4wwWut7H4NtXEABevt6PetU7G9y4AO6aAO5JHfUF5D/bv8GlLdxJt8hyXR2hV
 BeeiuLiDmKYe5wxScG1tZ75EI3JAFtliPfoIWzamvoCYzYub+8kAa/lGV4ps1mpOH7i8
 L3SxEBJ4Mkl6mkAPyVaKGjqOLMpOJPePR2XTHXb8t7Yk31s14DRsWcCY0+zavgeJPR8I
 esSBIUc/HYoZ2saVT+FIy9iHGyUXP35qe/bDTI7EIZa3ADMVisnCoTSpd6SBsLclkSOS
 VVTw==
X-Gm-Message-State: AOAM533Xm3FkRFtXGKSC/4HEIpVj2Sd8byLZeaPjlWoq73KTsOh/0eZf
 pBxV9PYhLH9yb+1WCqVrr58gdr226eRwRtX+YrA=
X-Google-Smtp-Source: ABdhPJxVHgdB7XwPl5ai+49mqjjJlX1RpCRFPnKeMadWF7tL8axXfV/9Pz5hvPub5yxk7sXGVF7zHrhDmiNr5sXYJE4=
X-Received: by 2002:aca:f50e:: with SMTP id t14mr30258oih.123.1606781121640;
 Mon, 30 Nov 2020 16:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-38-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-38-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 19:05:10 -0500
Message-ID: <CADnq5_NBWdiQm32886bsGCqSpJFYe5R+Cm7pgLTXyNYBwxNAGA@mail.gmail.com>
Subject: Re: [PATCH 37/40] drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu: Remove
 unused function 'pp_nv_set_pme_wa_enable()'
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

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0NCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYzo2NjQ6MjA6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHBy
b3RvdHlwZSBmb3Ig4oCYcHBfbnZfc2V0X3BtZV93YV9lbmFibGXigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+
IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBT
aWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4g
IFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIC4uLi9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9wcF9zbXUuYyB8IDE2IC0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDE2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMKPiBpbmRleCBhYzBhMDUzOTg1NGVm
Li42MDdlYzA5OTk0NDU2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMKPiBAQCAtNjYxLDIyICs2NjEs
NiBAQCBzdGF0aWMgZW51bSBwcF9zbXVfc3RhdHVzIHBwX252X3NldF93bV9yYW5nZXMoc3RydWN0
IHBwX3NtdSAqcHAsCj4gICAgICAgICByZXR1cm4gUFBfU01VX1JFU1VMVF9PSzsKPiAgfQo+Cj4g
LXN0YXRpYyBlbnVtIHBwX3NtdV9zdGF0dXMgcHBfbnZfc2V0X3BtZV93YV9lbmFibGUoc3RydWN0
IHBwX3NtdSAqcHApCj4gLXsKPiAtICAgICAgIGNvbnN0IHN0cnVjdCBkY19jb250ZXh0ICpjdHgg
PSBwcC0+ZG07Cj4gLSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGN0eC0+ZHJp
dmVyX2NvbnRleHQ7Cj4gLSAgICAgICBzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSA9ICZhZGV2LT5z
bXU7Cj4gLQo+IC0gICAgICAgaWYgKCFzbXUtPnBwdF9mdW5jcykKPiAtICAgICAgICAgICAgICAg
cmV0dXJuIFBQX1NNVV9SRVNVTFRfVU5TVVBQT1JURUQ7Cj4gLQo+IC0gICAgICAgLyogMDogc3Vj
Y2Vzc2Z1bCBvciBzbXUucHB0X2Z1bmNzLT5zZXRfYXphbGlhX2QzX3BtZSA9IE5VTEw7ICAxOiBm
YWlsICovCj4gLSAgICAgICBpZiAoc211X3NldF9hemFsaWFfZDNfcG1lKHNtdSkpCj4gLSAgICAg
ICAgICAgICAgIHJldHVybiBQUF9TTVVfUkVTVUxUX0ZBSUw7Cj4gLQo+IC0gICAgICAgcmV0dXJu
IFBQX1NNVV9SRVNVTFRfT0s7Cj4gLX0KPiAtCj4gIHN0YXRpYyBlbnVtIHBwX3NtdV9zdGF0dXMg
cHBfbnZfc2V0X2Rpc3BsYXlfY291bnQoc3RydWN0IHBwX3NtdSAqcHAsIGludCBjb3VudCkKPiAg
ewo+ICAgICAgICAgY29uc3Qgc3RydWN0IGRjX2NvbnRleHQgKmN0eCA9IHBwLT5kbTsKPiAtLQo+
IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
