Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 811072C9181
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA6F89C17;
	Mon, 30 Nov 2020 22:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B86789BF1;
 Mon, 30 Nov 2020 22:50:14 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z24so12999641oto.6;
 Mon, 30 Nov 2020 14:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rKuUVtY+nsEmxatsHCyM6yC2Us5rTCT/D5PB3lOTf/Y=;
 b=nbk+q9n0acq44mOtB0AsrG9jstQSzfq9oA/QRV01odGxA9h0TFaHO3GVTOgKtJ5R/m
 NHngmJ/TA3646IOEbrHie3PxRzTaDmKsND0w99UYsM8NNyHR99LPQLlkMpa4bl2Ny9en
 C36PHi+dDWmmDe4qUuF+qp/gVyEosm5GdlbY7EnqqJopOLVjDAnB+8d4uoIMQyByAXGP
 Ma8totA2gMtv4qQtGzxJOxNeBr+5Ep6hoHb1SAWhiPSFBSmfSfAkK3Su3/zpJmwxdI4h
 j0BZoh3EReIUpQlhewEQuYmFJjAfJhesQ39THfJOi3UuUWfiw8CRPVGMeV7FYJenYlNp
 gVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rKuUVtY+nsEmxatsHCyM6yC2Us5rTCT/D5PB3lOTf/Y=;
 b=sMinMLz2j/c7X2Ff18Lvo6UV4gpQRwcufQt+54RztJyBRMe0o3UeshNRow89rqsdHB
 Jr9NAYOHHQ96dsbg9Chj1CUyX16Zgii9bkBueAmR7SjVi/0S7h+BZLJCcjIFTUWGpqFk
 tXEb6aVqm3VSnxLQjNUsvRXlheGd+zgZQZhmzn8EhmnGkUiE1Ku6WAG5Asu+dYz05dsg
 IxELoxvLqdjTbX4T4F65tnzXI+1smaQKmpmGF98RLyRnZ2RYAeDYwDgDImpxKt0UyxCg
 8nhg7Ia57fOni23KLuMCKWryW/rnyEGwPVtv4GgyiQoAYyFNNVW1vg5f84zgElMWlhxf
 czQA==
X-Gm-Message-State: AOAM53308+LTIx8fFxqk4P3ABdUjoONo+HpVGKOylL/ndlI9GAumov7C
 YRWRAuEm0a+6+thoFltqd7wSV9ediFDfa1hlMc4=
X-Google-Smtp-Source: ABdhPJyTTVDUFd5wXUYpYb7VcwfQyhGUKOFwV7lJzfFshdU4qOoyVX1kRz8foAvK6OGSFTs4z4xGOiCbwkx2PYhIyqI=
X-Received: by 2002:a05:6830:22e4:: with SMTP id
 t4mr19083678otc.23.1606776613855; 
 Mon, 30 Nov 2020 14:50:13 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-35-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-35-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:50:02 -0500
Message-ID: <CADnq5_MKtkHNbZ0cn5D2Ju+QcGah1WgNCf+W9WqTrmw--zWsgQ@mail.gmail.com>
Subject: Re: [PATCH 34/40] drm/amd/amdgpu/amdgpu_acp: Fix doc-rot issues
 pertaining to a couple of 'handle' params
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYzox
ODM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2hhbmRsZScgbm90IGRl
c2NyaWJlZCBpbiAnYWNwX2h3X2luaXQnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hY3AuYzoxODM6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2FkZXYn
IGRlc2NyaXB0aW9uIGluICdhY3BfaHdfaW5pdCcKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FjcC5jOjQxMjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJl
ciAnaGFuZGxlJyBub3QgZGVzY3JpYmVkIGluICdhY3BfaHdfZmluaScKPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcC5jOjQxMjogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9u
IHBhcmFtZXRlciAnYWRldicgZGVzY3JpcHRpb24gaW4gJ2FjcF9od19maW5pJwo+Cj4gQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBL
w7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENj
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYWNwLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYWNwLmMKPiBpbmRleCAxNDAwOTU3MDM0YTEyLi5iODY1NWZmNzNhNjU4IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYwo+IEBAIC0xNzYsNyArMTc2LDcg
QEAgc3RhdGljIHN0cnVjdCBkZXZpY2UgKmdldF9tZmRfY2VsbF9kZXYoY29uc3QgY2hhciAqZGV2
aWNlX25hbWUsIGludCByKQo+ICAvKioKPiAgICogYWNwX2h3X2luaXQgLSBzdGFydCBhbmQgdGVz
dCBBQ1AgYmxvY2sKPiAgICoKPiAtICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICsg
KiBAaGFuZGxlOiBoYW5kbGUgdXNlZCB0byBwYXNzIGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICAg
Kgo+ICAgKi8KPiAgc3RhdGljIGludCBhY3BfaHdfaW5pdCh2b2lkICpoYW5kbGUpCj4gQEAgLTQw
NSw3ICs0MDUsNyBAQCBzdGF0aWMgaW50IGFjcF9od19pbml0KHZvaWQgKmhhbmRsZSkKPiAgLyoq
Cj4gICAqIGFjcF9od19maW5pIC0gc3RvcCB0aGUgaGFyZHdhcmUgYmxvY2sKPiAgICoKPiAtICog
QGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICsgKiBAaGFuZGxlOiBoYW5kbGUgdXNlZCB0
byBwYXNzIGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICAgKgo+ICAgKi8KPiAgc3RhdGljIGludCBh
Y3BfaHdfZmluaSh2b2lkICpoYW5kbGUpCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
