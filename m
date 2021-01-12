Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2102F3C3B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27951898C6;
	Tue, 12 Jan 2021 22:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29415898C6;
 Tue, 12 Jan 2021 22:20:22 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id w124so5998oia.6;
 Tue, 12 Jan 2021 14:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AoUDA2QHniDR7mf7zEUOWTW+Wr2iXHVQBuhQ6j/vnxc=;
 b=JnPp+nXZRLtRwBPO4ZZNOXC4+E9XHHYEOKxyfA8NR2VPX7enweEQqBiTJEVwVa+CY6
 r8czRjtZQczsXac/S9UNwdmDb8QNrr6vDtcRLlC5e3AlLHvThDw/m0BgImcLVkfct8Y2
 aoDmquGKB/7MCKT3DzPwSH4iyQTz/AOKAVPEWWWXZ71gIRzQOvQVpunN0AzcqLfh1otp
 unpKIAnipJfwogG6lx+D8BwHI4G1cf6qqCqAsf9/mFK8AtCL2vqUGQnoQOuy/U2bPKSH
 uuJFMrGfyb/B15XLVawQRAMkH6Ptb5yomdsW6geYH1ikq2Ek4NgKdhgOjI8Q5iE4TUHt
 8fRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AoUDA2QHniDR7mf7zEUOWTW+Wr2iXHVQBuhQ6j/vnxc=;
 b=FN8XdnbtUlrnzqcKncz9RMPttkQ/tI0dBWoWMBuIsW4qaZj/49dYFp2VHEAXk0MRkz
 l9u5mR7mQykEYpjbymP22CFWCPPvJMkkfIC2cwAKl/MS2y7LE/CggpgHQX92dfvOwiOV
 Q8tQs34fu5S+J5OJsi/i6Nx6PLT1o+PqjdYqiEg2g9c6skbOKIJYpBFAcSnnkBvSzLIr
 6tLa2K9tA+HhRH/1n/gM/4idKo2LatbVnFZiokUU5ofTp5z+NsISLdxaD146kbsoP5Cy
 xcv16hCCoedPr2/v6rw7GTzeN6sc3tBM+OSlEWEn/d9+jyosnhk4dBFInIk2i1eONKWe
 3How==
X-Gm-Message-State: AOAM530uWZrk8hmz0jTWlpjhw9Xh3i6sbESrglp6Gvr434Cvn9Ywp+LZ
 AmdfJCGvQTOm2X20uamrsYGz9Gu5OpoA58f6Xb4=
X-Google-Smtp-Source: ABdhPJzw07+fNO+HAfmHstHOFCfLbKPANHdWUOpksi4akEuYxVxavydaxPc8XnhNSonBgK7UgCQFqxq4c6PsvjtR8HY=
X-Received: by 2002:aca:6202:: with SMTP id w2mr773214oib.5.1610490021530;
 Tue, 12 Jan 2021 14:20:21 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-22-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-22-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:20:02 -0500
Message-ID: <CADnq5_Oc0ftYKMCaWz5Sa8dAsJoGPWWAj-pBXxFqrBNZDNxLFQ@mail.gmail.com>
Subject: Re: [PATCH 21/40] drm/amd/display/dc/dce110/dce110_compressor: Remove
 unused function 'dce110_get_required_compressed_surfacesize
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

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlMTEwL2RjZTExMF9jb21wcmVzc29yLmM6NDE1OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHBy
b3RvdHlwZSBmb3Ig4oCYZGNlMTEwX2dldF9yZXF1aXJlZF9jb21wcmVzc2VkX3N1cmZhY2VzaXpl
4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnku
d2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4gQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+
IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICAuLi4vYW1kL2Rpc3Bs
YXkvZGMvZGNlMTEwL2RjZTExMF9jb21wcmVzc29yLmMgfCAzMCAtLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9jb21wcmVzc29yLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9jb21wcmVzc29yLmMK
PiBpbmRleCA3MmI1ODBhNGViODU2Li4xOGIwYTY5YjBiMWU4IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2NvbXByZXNzb3IuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2NvbXByZXNz
b3IuYwo+IEBAIC00MTIsMzYgKzQxMiw2IEBAIHZvaWQgZGNlMTEwX2NvbXByZXNzb3JfZGVzdHJv
eShzdHJ1Y3QgY29tcHJlc3NvciAqKmNvbXByZXNzb3IpCj4gICAgICAgICAqY29tcHJlc3NvciA9
IE5VTEw7Cj4gIH0KPgo+IC1ib29sIGRjZTExMF9nZXRfcmVxdWlyZWRfY29tcHJlc3NlZF9zdXJm
YWNlc2l6ZShzdHJ1Y3QgZmJjX2lucHV0X2luZm8gZmJjX2lucHV0X2luZm8sCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGZiY19yZXF1ZXN0
ZWRfY29tcHJlc3NlZF9zaXplIHNpemUpCj4gLXsKPiAtICAgICAgIGJvb2wgcmVzdWx0ID0gZmFs
c2U7Cj4gLQo+IC0gICAgICAgdW5zaWduZWQgaW50IG1heF94ID0gRkJDX01BWF9YLCBtYXhfeSA9
IEZCQ19NQVhfWTsKPiAtCj4gLSAgICAgICBnZXRfbWF4X3N1cHBvcnRfZmJjX2J1ZmZlcnNpemUo
Jm1heF94LCAmbWF4X3kpOwo+IC0KPiAtICAgICAgIGlmIChmYmNfaW5wdXRfaW5mby5keW5hbWlj
X2ZiY19idWZmZXJfYWxsb2MgPT0gMCkgewo+IC0gICAgICAgICAgICAgICAvKgo+IC0gICAgICAg
ICAgICAgICAgKiBGb3IgRENFMTEgaGVyZSB1c2UgTWF4IEhXIHN1cHBvcnRlZCBzaXplOiAgSFcg
U3VwcG9ydCB1cCB0byAzODQweDI0MDAgcmVzb2x1dGlvbgo+IC0gICAgICAgICAgICAgICAgKiBv
ciAxODAwMCBjaHVua3MuCj4gLSAgICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICBz
aXplLnByZWZlcnJlZF9zaXplID0gc2l6ZS5taW5fc2l6ZSA9IGFsaWduX3RvX2NodW5rc19udW1i
ZXJfcGVyX2xpbmUobWF4X3gpICogbWF4X3kgKiA0OyAgLyogKEZvciBGQkMgd2hlbiBMUFQgbm90
IHN1cHBvcnRlZCkuICovCj4gLSAgICAgICAgICAgICAgIHNpemUucHJlZmVycmVkX3NpemVfYWxp
Z25tZW50ID0gc2l6ZS5taW5fc2l6ZV9hbGlnbm1lbnQgPSAweDEwMDsgICAgICAgLyogRm9yIEZC
QyB3aGVuIExQVCBub3Qgc3VwcG9ydGVkICovCj4gLSAgICAgICAgICAgICAgIHNpemUuYml0cy5w
cmVmZXJyZWRfbXVzdF9iZV9mcmFtZWJ1ZmZlcl9wb29sID0gMTsKPiAtICAgICAgICAgICAgICAg
c2l6ZS5iaXRzLm1pbl9tdXN0X2JlX2ZyYW1lYnVmZmVyX3Bvb2wgPSAxOwo+IC0KPiAtICAgICAg
ICAgICAgICAgcmVzdWx0ID0gdHJ1ZTsKPiAtICAgICAgIH0KPiAtICAgICAgIC8qCj4gLSAgICAg
ICAgKiBNYXliZSB0byBhZGQgcmVnaXN0cnkga2V5IHN1cHBvcnQgd2l0aCBvcHRpb25hbCBzaXpl
IGhlcmUgdG8gb3ZlcnJpZGUgYWJvdmUKPiAtICAgICAgICAqIGZvciBkZWJ1Z2dpbmcgcHVycG9z
ZXMKPiAtICAgICAgICAqLwo+IC0KPiAtICAgICAgIHJldHVybiByZXN1bHQ7Cj4gLX0KPiAtCj4g
LQo+ICB2b2lkIGdldF9tYXhfc3VwcG9ydF9mYmNfYnVmZmVyc2l6ZSh1bnNpZ25lZCBpbnQgKm1h
eF94LCB1bnNpZ25lZCBpbnQgKm1heF95KQo+ICB7Cj4gICAgICAgICAqbWF4X3ggPSBGQkNfTUFY
X1g7Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
