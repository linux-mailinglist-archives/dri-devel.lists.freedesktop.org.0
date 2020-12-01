Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 854092C93AC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F0F89D89;
	Tue,  1 Dec 2020 00:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D2989D5C;
 Tue,  1 Dec 2020 00:07:59 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id t18so12208otk.2;
 Mon, 30 Nov 2020 16:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ojzw4xN3z1NHS/JOfvKKkvXoTTW/H9rPegUeJQAjVt4=;
 b=pWDEP0JZ4NsbcnuXYudpYTF8qNyQj9Eb7+ZzmVDYucX2LKe4UE6e3sHosTDI1JTKXW
 Q5uXunDPRGE/pyyaDTvlb/hvNqjx+YTRH2aKDaTdwDZFun9MoVa0OVZaM1N1XJkcwVSq
 TfvqLafMDH2Wj3Hv0T+CC4IWTiUlLmDIDhY9MLa604Vc76tTFlISpLAIHPR7jstELi/n
 HJeFHiuNyC9Cz7R09ukeiRLoQLUrHQvOpfAMnfpZowD/NGDmRa/VmgtlusN2DBYgyOUQ
 kG9nbDHsf1Xco0C2NcXKrZfgyKGswyeUMtYzpp4H0a9p252fflQ21pZ9wklJbvWh0b9v
 VbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ojzw4xN3z1NHS/JOfvKKkvXoTTW/H9rPegUeJQAjVt4=;
 b=e96Ksor4D0X8+sjVuGaLvxptASq7x8kQwBXPEHSkPsrWCZDRiqr/0keXHGiCUQTzoM
 4LDaAxHT/RwybTMmkt5REb4FRj5nN626mH/z6E9z5iuFSRip0tdXU8d/uEbvO/7mgxCm
 QsLj7Dtm3kVqUh13Eth1EbxKtL88fwx8GcESRc7Ro2JlYvTp33gVW3deAtlF0AEbmtP/
 kcYvUkwQkXHHmgaZ+QI1ypBaIJlBzVte3CNjwR8gkZQ9pr7AU6jC0h2O4E+O6/CP+5a4
 GLwqL08HreONEhU1U3dZPoC3uf+cPVDTo7v1oy1s9AqS3PFO1dvJfsAsquf0S/IFpp4j
 OdaA==
X-Gm-Message-State: AOAM5317a06zIYdlSETcrHmidqIqZwb89fFUuIpyKL67VWrDulTRE8Np
 +zWcph5+CkHtiHTeZbq3fWGFep5kIYeT31bSX7u1CHzS
X-Google-Smtp-Source: ABdhPJzb/gQaeen1+FWj7OPjgqLdHzxWmmarrQNQCKZLj6PwepiGrb0+6NyKKpzZQPBY6jSebkv0UOHBf+YWAym5ONg=
X-Received: by 2002:a9d:4713:: with SMTP id a19mr19501543otf.132.1606781277532; 
 Mon, 30 Nov 2020 16:07:57 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-41-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-41-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 19:07:46 -0500
Message-ID: <CADnq5_MeaHtEKC_c8Va8jN3Le15oWqdPket6WWTTG+1DB5G8hQ@mail.gmail.com>
Subject: Re: [PATCH 40/40] drm/amd/display/dc/basics/vector: Make local
 function 'dal_vector_presized_costruct' static
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
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
YmFzaWNzL3ZlY3Rvci5jOjU1OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig
4oCYZGFsX3ZlY3Rvcl9wcmVzaXplZF9jb3N0cnVjdOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
Cj4KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1v
ZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtz
IQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jhc2ljcy92
ZWN0b3IuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jh
c2ljcy92ZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iYXNpY3MvdmVj
dG9yLmMKPiBpbmRleCA4ZjkzZDI1ZjkxZWUyLi43MDZjODAzYzRkM2IwIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iYXNpY3MvdmVjdG9yLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmFzaWNzL3ZlY3Rvci5jCj4gQEAgLTUyLDcg
KzUyLDcgQEAgYm9vbCBkYWxfdmVjdG9yX2NvbnN0cnVjdCgKPiAgICAgICAgIHJldHVybiB0cnVl
Owo+ICB9Cj4KPiAtYm9vbCBkYWxfdmVjdG9yX3ByZXNpemVkX2Nvc3RydWN0KAo+ICtzdGF0aWMg
Ym9vbCBkYWxfdmVjdG9yX3ByZXNpemVkX2Nvc3RydWN0KAo+ICAgICAgICAgc3RydWN0IHZlY3Rv
ciAqdmVjdG9yLAo+ICAgICAgICAgc3RydWN0IGRjX2NvbnRleHQgKmN0eCwKPiAgICAgICAgIHVp
bnQzMl90IGNvdW50LAo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
