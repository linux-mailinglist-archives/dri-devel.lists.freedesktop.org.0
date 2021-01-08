Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D847E2EFA6D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 22:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D785E6E8CB;
	Fri,  8 Jan 2021 21:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FAF89449;
 Fri,  8 Jan 2021 21:27:25 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id j20so11084947otq.5;
 Fri, 08 Jan 2021 13:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NYkErQ4AHdUR0Vvl84qd6HPOGv2R/JnhTegOcomXRBs=;
 b=q0qMGkjOefruAmuAbGs/pbxXilmN+s+QHQlgp3mq2OlofJyziZF3piioz+tFZJqBMA
 w2GxCvkSCaG9DRaXbEjIpLs1jgXF7JZEMNYfAq2haqUHexroxrmpFAaREN4BPO7EEP2D
 cYoRmvql5j299T0G8XxqxYvVaxbKGSdt6n4dZwU20sTxdSqX/ygqqrEG/4ZOJL5h4IXY
 fzYYSLcoeDVALgIWu/PPSODNbYtMA8ecQqv6WMFDnAYgVrxbNJfvQYsMZ3TfjK/V2+g0
 Gvkx96Ar247Mwemi7K2/LsyS7+UR4KkFwBrSf3eMlQ/PWtzYtbG/yx831l9/w/Uu9+gR
 KXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NYkErQ4AHdUR0Vvl84qd6HPOGv2R/JnhTegOcomXRBs=;
 b=pn0YzoVlW+k8mvpT8e391hNk+HbI/Zp+gQ2ac2tXKq0Ddc3OLVUwV+R7R8eB92x8Sc
 Bne4xZ3p19hay+yJDXUwRu2/wyU13RoMz9ez48nEUDgDkvBotlAlqZkYrKzjV/KU0yuD
 lVc1lklvegnimRPIv17onk0yJ81HlGTqEVFCi0/WK25CMTpMwQx7QdWX/LKJbd84oFH3
 1rGdLh8p/xzGZ8ZPfKVq1Wizh2bm3x4mvRvYZNMpU+wB2EQN1r1K0GjYrR904FNzeSm6
 qGwg8FHmoDn0uork7txcBBqDjwXTk2J0h4QRqVX+MIvLPik64ql7RPxYeAtk8RZ+foXz
 LnwQ==
X-Gm-Message-State: AOAM531g2h2IxyY1O3a/4MrliK9fuBLiO43GWyNoDZpIErESN73zW4OW
 XwefxyrsVJJuy2TItkJ/tI/FU6WW/dIyQ1UQQ/A=
X-Google-Smtp-Source: ABdhPJwEuslKFpvX3tR6DIk5q/5aW7SnKhw0lUKSGZXrCYTZ+XAAD8GfgyZK+WeNfJJKDTLIJOXd4n4XusWP+5d1cZQ=
X-Received: by 2002:a05:6830:1d66:: with SMTP id
 l6mr3909843oti.23.1610141244904; 
 Fri, 08 Jan 2021 13:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-41-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-41-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 16:27:13 -0500
Message-ID: <CADnq5_MYg_OBqm0a0oybZ1___MjjsfS6hhrjn9jKUuC+8Jgk9w@mail.gmail.com>
Subject: Re: [PATCH 40/40] drm/amd/display/dc/gpio/hw_factory: Delete unused
 function 'dal_hw_factory_destroy'
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

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE2IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9n
cGlvL2h3X2ZhY3RvcnkuYzoxMjM6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciDigJhkYWxfaHdfZmFjdG9yeV9kZXN0cm954oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPgo+
IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExp
IDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1i
eTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpB
bGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9od19mYWN0
b3J5LmMgfCAxNCAtLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8v
aHdfZmFjdG9yeS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vaHdfZmFj
dG9yeS5jCj4gaW5kZXggZGE3M2JmYjNjYWNkMC4uOTJjNjVkMmZhN2Q3MSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9od19mYWN0b3J5LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9od19mYWN0b3J5LmMKPiBAQCAt
MTE5LDE3ICsxMTksMyBAQCBib29sIGRhbF9od19mYWN0b3J5X2luaXQoCj4gICAgICAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKPiAgICAgICAgIH0KPiAgfQo+IC0KPiAtdm9pZCBkYWxfaHdfZmFj
dG9yeV9kZXN0cm95KAo+IC0gICAgICAgc3RydWN0IGRjX2NvbnRleHQgKmN0eCwKPiAtICAgICAg
IHN0cnVjdCBod19mYWN0b3J5ICoqZmFjdG9yeSkKPiAtewo+IC0gICAgICAgaWYgKCFmYWN0b3J5
IHx8ICEqZmFjdG9yeSkgewo+IC0gICAgICAgICAgICAgICBCUkVBS19UT19ERUJVR0dFUigpOwo+
IC0gICAgICAgICAgICAgICByZXR1cm47Cj4gLSAgICAgICB9Cj4gLQo+IC0gICAgICAga2ZyZWUo
KmZhY3RvcnkpOwo+IC0KPiAtICAgICAgICpmYWN0b3J5ID0gTlVMTDsKPiAtfQo+IC0tCj4gMi4y
NS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
