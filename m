Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A34342C2BC9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 16:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28206E453;
	Tue, 24 Nov 2020 15:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152156E43C;
 Tue, 24 Nov 2020 15:51:30 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x13so2310776wmj.1;
 Tue, 24 Nov 2020 07:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6GM7HZKJOMbvnNyqxtbbQQmzhMuTNq7eU6NBsZKc41s=;
 b=oAAKjcXVvTnLxDN0CqGoY7CnqvAOMvs06bh0shxjr/VcQQIh21vrLpOc6xehdcudmo
 sYxEqBpPOaBZqlW7xP1ieh5OjWM1vZsxzWZbq9yy9kEmMyxK4a/OaY2I77gO99Xr3Uaa
 IzhxRw0NEPK6MjTbwvcrpDXmkjvO+PgVrGrjeokLWuaWpFTZ3Ml8dMam9VZ61Xx0XD5Q
 h44slbwH0ZxnvnLcu9pP8hLyOtsVhmBXvacaPwEeDCNajjXJm3P3iiRu4kqxM8WZePcC
 /eUxl3fGQ6aIrMOvfd9GOHmKl/Zr2hnMNBLFlA9BhkpLnEP44mj0QEYIKVppmKLg+VZ3
 ycHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6GM7HZKJOMbvnNyqxtbbQQmzhMuTNq7eU6NBsZKc41s=;
 b=m0tQyfkWtnKL55mamCGMQ7Z+rvO/4+bijQ7lg47h7rEoJjyD8oUiCDadxh78HY3X2a
 xAl+WRLaCSiUVbBu9SGeE7JxyFayEWqZtnG4ow+YNGdiQ92nEHVkwJlE/xi8+F6B9WDG
 mc3rkzH/b/wSyJVWU6jBZCJrgtVrFHIp4zNg2IIs2WO+8h04P3priyqeOrwpySly+uE1
 fsjPBnde5uu9Yyra0BRzMDr240GwY0UAhCr1Gv+WwzPSmrBoU9M5PJAEwJelTClbe9Ae
 +PNNcJmIKsb5XFkqMg2xyiD0PWNfUpqEKIDgskw2xYQ5hYCCLfanf2oKt5KuCpn3vgcd
 tMZA==
X-Gm-Message-State: AOAM533rmxv7/UUTOKc7ZubCZgIj3qLmvNq0OFe2UnfxZp+o/KiqeDwO
 QPBvqYUjwdY+USuvO1b0+XOwqA3KogU5Q4Bl7Ps=
X-Google-Smtp-Source: ABdhPJwmRU0+C0x/7U2CChem3SlI4KM5YXcqfAcScbL2Aftb6WMTxqTsRomNDeRcZ+kpO+Zfa0vkSWlewKle4bEg6nw=
X-Received: by 2002:a1c:f017:: with SMTP id a23mr5132469wmb.56.1606233088772; 
 Tue, 24 Nov 2020 07:51:28 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-6-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-6-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 10:51:17 -0500
Message-ID: <CADnq5_P6pF+XeOn_ZjVe0gQMUXqbLAzS9qc1fR-D=CXaMTZVkg@mail.gmail.com>
Subject: Re: [PATCH 05/40] drm/amd/amdgpu/cik_ih: Supply description for 'ih'
 in 'cik_ih_{get, set}_wptr()'
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
Cc: David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Qinglang Miao <miaoqinglang@huawei.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoxOSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npa19paC5jOjE4OTog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaWgnIG5vdCBkZXNjcmliZWQg
aW4gJ2Npa19paF9nZXRfd3B0cicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrX2lo
LmM6Mjc0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRl
c2NyaWJlZCBpbiAnY2lrX2loX3NldF9ycHRyJwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBRaW5nbGFuZyBNaWFvIDxt
aWFvcWluZ2xhbmdAaHVhd2VpLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxl
eAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrX2loLmMgfCAyICsrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9jaWtfaWguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2Npa19paC5jCj4gaW5kZXggZGI5NTNlOTVmM2QyNy4uZDM3NDU3MTFkNTVmOSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jaWtfaWguYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2Npa19paC5jCj4gQEAgLTE3Nyw2ICsxNzcsNyBAQCBzdGF0aWMg
dm9pZCBjaWtfaWhfaXJxX2Rpc2FibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAq
IGNpa19paF9nZXRfd3B0ciAtIGdldCB0aGUgSUggcmluZyBidWZmZXIgd3B0cgo+ICAgKgo+ICAg
KiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gKyAqIEBpaDogSUggcmluZyBidWZmZXIg
dG8gZmV0Y2ggd3B0cgo+ICAgKgo+ICAgKiBHZXQgdGhlIElIIHJpbmcgYnVmZmVyIHdwdHIgZnJv
bSBlaXRoZXIgdGhlIHJlZ2lzdGVyCj4gICAqIG9yIHRoZSB3cml0ZWJhY2sgbWVtb3J5IGJ1ZmZl
ciAoQ0lLKS4gIEFsc28gY2hlY2sgZm9yCj4gQEAgLTI2Niw2ICsyNjcsNyBAQCBzdGF0aWMgdm9p
ZCBjaWtfaWhfZGVjb2RlX2l2KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgKiBjaWtf
aWhfc2V0X3JwdHIgLSBzZXQgdGhlIElIIHJpbmcgYnVmZmVyIHJwdHIKPiAgICoKPiAgICogQGFk
ZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICsgKiBAaWg6IElIIHJpbmcgYnVmZmVyIHRvIHNl
dCB3cHRyCj4gICAqCj4gICAqIFNldCB0aGUgSUggcmluZyBidWZmZXIgcnB0ci4KPiAgICovCj4g
LS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
