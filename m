Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF9E2877C6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 17:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5A26EA83;
	Thu,  8 Oct 2020 15:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581856EA7B;
 Thu,  8 Oct 2020 15:46:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m6so7163505wrn.0;
 Thu, 08 Oct 2020 08:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZQaMEajHyUF05ChIcIT2Hr92neMZMi5cbrWN6sbkg5k=;
 b=XZldCsicbz+aKtGedOYbJPbFRVcikpIYetMkNutU64Xq5LzOm751pgZMj541VHyHMV
 dni2ARbVTgsf9+GhThAYmEQNtjk752QWWN3WrpVdXC8djlbx2SAxcnZ7Bnvik/f9zoiT
 7nuT7zdSWNm4lbd52lBX6vf4jya0EpP4a+O3Os0n4KiEIxFXm6NBGd6Pyu50MIF/dmcm
 loJUl3sCVyS/JglA7KRDbjy6WlkM9cUtnBdzLXmn1nowlbDAgB/1yow7O59ykO8Ruqbn
 ImGTgS05xUxIuVXaoVPyy9e5hr9NtPO/KplM91IbOWi5rfJVuwTm1k+JjqKpgYBQ20wD
 tt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZQaMEajHyUF05ChIcIT2Hr92neMZMi5cbrWN6sbkg5k=;
 b=sAG3AYCY2ob0cWlTT/m5uNsEALb8E/h/C2+1eScExYH6n99nhcS1NtpWY9BPWgwJav
 PdyKopCaNEuipxnoJTLgT8xEmCblzvrQUjCfudYBdLGWwMogKgG1F7XB1ww/lI6MaEVT
 8khEAbvb4uRq6dxYJy0Ae+CsQX+APOFSIzcFnjIEBhZsoTIXL2dPWNxOU7iqpUeZohzu
 uumQ56FwqebCOimlyi9Ji/knCjlVozoy1JUbvbSinnvgmj0HmhrH4nSuneB0G3m5582W
 Gck3A7gnx6DIdciQvPPygZ/OPH9BBeCLyfvVqIMJ15D0XFA22YPX8expRMDyxQE8bnKH
 pi2w==
X-Gm-Message-State: AOAM531xKZ2c9Sf3wgpOl2msC3H2tNcBEmzNEIlklKkawMU4BowAfyF8
 DMFWK8UHIJFilEov1leQ+xivfPFyis4gg5BsCfk=
X-Google-Smtp-Source: ABdhPJwJVR465d2vJNtPiG0LfE9lDMbFj9J45MtW1i6G8uw6lJF3FYOoDFS9nwvtHCVOBdJjEFcVL8DU1vinUmS4kuc=
X-Received: by 2002:adf:aa0a:: with SMTP id p10mr9863785wrd.362.1602171992051; 
 Thu, 08 Oct 2020 08:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602020074.git.gustavoars@kernel.org>
 <00a464a7e2141dc3117720784d76048e7e3dbed6.1602020074.git.gustavoars@kernel.org>
In-Reply-To: <00a464a7e2141dc3117720784d76048e7e3dbed6.1602020074.git.gustavoars@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Oct 2020 11:46:20 -0400
Message-ID: <CADnq5_PX2LokA0VgC-NLZfCa=k8vc9PWYX5WWVH5RCsEzZc+BQ@mail.gmail.com>
Subject: Re: [PATCH 14/14] drm/amd/pm: Replace one-element array with
 flexible-array in struct ATOM_Vega10_GFXCLK_Dependency_Table
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgNywgMjAyMCBhdCAxMjowNSBQTSBHdXN0YXZvIEEuIFIuIFNpbHZhCjxndXN0
YXZvYXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4g
dGhlIGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRvIGRlY2xhcmUgaGF2aW5nCj4gYSBkeW5hbWlj
YWxseSBzaXplZCBzZXQgb2YgdHJhaWxpbmcgZWxlbWVudHMgaW4gYSBzdHJ1Y3R1cmUuIEtlcm5l
bCBjb2RlCj4gc2hvdWxkIGFsd2F5cyB1c2Ug4oCcZmxleGlibGUgYXJyYXkgbWVtYmVyc+KAnVsx
XSBmb3IgdGhlc2UgY2FzZXMuIFRoZSBvbGRlcgo+IHN0eWxlIG9mIG9uZS1lbGVtZW50IG9yIHpl
cm8tbGVuZ3RoIGFycmF5cyBzaG91bGQgbm8gbG9uZ2VyIGJlIHVzZWRbMl0uCj4KPiBVc2UgYSBm
bGV4aWJsZS1hcnJheSBtZW1iZXIgaW4gc3RydWN0IEFUT01fVmVnYTEwX0dGWENMS19EZXBlbmRl
bmN5X1RhYmxlCj4gaW5zdGVhZCBvZiBhIG9uZS1lbGVtZW50IGFycmF5Lgo+Cj4gWzFdIGh0dHBz
Oi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0ZsZXhpYmxlX2FycmF5X21lbWJlcgo+IFsyXSBodHRw
czovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y1LjktcmMxL3Byb2Nlc3MvZGVwcmVjYXRlZC5o
dG1sI3plcm8tbGVuZ3RoLWFuZC1vbmUtZWxlbWVudC1hcnJheXMKPgo+IEJ1aWxkLXRlc3RlZC1i
eToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC81ZjdkNjFkZC5POGp4eEk1QzZQOUZPYiUyRmQlMjVsa3BAaW50ZWwu
Y29tLwo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9hcnNAa2Vy
bmVsLm9yZz4KClRoaXMgaGVhZGVyIGlzIHNoYXJlZCB3aXRoIGZpcm13YXJlLCBzbyBJJ20gbGVh
dmluZyBpdCBhcyBpcyBmb3IgY29uc2lzdGVuY3kuCgpBbGV4CgoKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX3BwdGFibGUuaCB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX3BwdGFi
bGUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9wcHRh
YmxlLmgKPiBpbmRleCBjOTM0ZTk2MTJjMWIuLmE2OTY4MDA5YWNjNCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMTBfcHB0YWJsZS5oCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX3BwdGFi
bGUuaAo+IEBAIC0xNjMsNyArMTYzLDcgQEAgdHlwZWRlZiBzdHJ1Y3QgX0FUT01fVmVnYTEwX01D
TEtfRGVwZW5kZW5jeV9SZWNvcmQgewo+ICB0eXBlZGVmIHN0cnVjdCBfQVRPTV9WZWdhMTBfR0ZY
Q0xLX0RlcGVuZGVuY3lfVGFibGUgewo+ICAgICAgVUNIQVIgdWNSZXZJZDsKPiAgICAgIFVDSEFS
IHVjTnVtRW50cmllczsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8q
IE51bWJlciBvZiBlbnRyaWVzLiAqLwo+IC0gICAgQVRPTV9WZWdhMTBfR0ZYQ0xLX0RlcGVuZGVu
Y3lfUmVjb3JkIGVudHJpZXNbMV07ICAgICAgICAgICAgLyogRHluYW1pY2FsbHkgYWxsb2NhdGUg
ZW50cmllcy4gKi8KPiArICAgIEFUT01fVmVnYTEwX0dGWENMS19EZXBlbmRlbmN5X1JlY29yZCBl
bnRyaWVzW107ICAgICAgICAgICAgIC8qIER5bmFtaWNhbGx5IGFsbG9jYXRlIGVudHJpZXMuICov
Cj4gIH0gQVRPTV9WZWdhMTBfR0ZYQ0xLX0RlcGVuZGVuY3lfVGFibGU7Cj4KPiAgdHlwZWRlZiBz
dHJ1Y3QgX0FUT01fVmVnYTEwX01DTEtfRGVwZW5kZW5jeV9UYWJsZSB7Cj4gLS0KPiAyLjI3LjAK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1k
LWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
