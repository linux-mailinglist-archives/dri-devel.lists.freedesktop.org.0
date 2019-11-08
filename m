Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E065F5120
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 17:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4956E043;
	Fri,  8 Nov 2019 16:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AE66E043;
 Fri,  8 Nov 2019 16:30:34 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l17so6006072wmh.0;
 Fri, 08 Nov 2019 08:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EED96u0MROcQsaLKPUjUV7sfzZCF299jzLkw6fCEdJA=;
 b=iItlij7cSJDI3xOH9MB0Fd3qv6hQVtDa77qF1yxH1KJxJTCcK1V366F8Bp0oQkmVhs
 p2z/OmGkfE7j9wtzs1FXjSgy6eFtR0TmBCnHO85qNhrLElSula3Cqb7dsXoDuV0nw2JJ
 myGzvPsNy0LwOsDjagdTuLu/Gm0esv3DQiFdiO0wtFiYHQfO0WW6KmQSx6eX36fURM4a
 gX1BgMsJTZlx1veUsRXnVkqD4grP0o/02NUEMywluAvjjw/mBo5Ar05ESnqYt/J8u0Ih
 fcUH5qrRkoz7nxyFm20vxRk7yOo87LY61lQhi4mjhcNrDeKm4C/aeUG2TSid4fkL2AML
 RH9A==
X-Gm-Message-State: APjAAAVLDiKvU9/b3oESpJZdJEDqnYRbHKGPQMdSksY9qILX/dwB8KKO
 DXwGfduSJMMkabpuGaMpFonJvS7PjZP3Tl0WafQ=
X-Google-Smtp-Source: APXvYqwnwgFN7PmKJaC/TvBNAIFdaFPEhM03t/7vQSSSYo65qRHUuRkwfS/XgnjDQ7qqT10NV7TNYBo0JuiHqCt/WKk=
X-Received: by 2002:a1c:790b:: with SMTP id l11mr9449471wme.127.1573230632691; 
 Fri, 08 Nov 2019 08:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20191108144527.120927-1-colin.king@canonical.com>
In-Reply-To: <20191108144527.120927-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Nov 2019 11:30:19 -0500
Message-ID: <CADnq5_PdP3=gMbbcvTqf07=3mP-ZXdrvxWzmcpoFEd2_B9cTqg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: remove duplicated assignment to
 grph_obj_type
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EED96u0MROcQsaLKPUjUV7sfzZCF299jzLkw6fCEdJA=;
 b=XVNk52qIAH0ewjDgU12L5VGNadrbMzDitR2kaaNnkXh/wVBajNXt3WqVa+oB2CTpYt
 dKDBk+v7+YPaKibDa60jJk4p8laJYzu9st8tWdQT8FQ0fMy0KlArSNSIhI1q33HYBJmz
 L6OUsOIUDJKq60n/lFk6COu76EbufO9fZH98rUeph6ivJIZUSldNl7nns0+ygQ02Q7w2
 gTdS/RuixOWvJhGJLvdvjsoHXGIY7T38kzlyzrUH7qMA1P5+aVbnnXJC6kCAgPNUHu9q
 kng4IFQ+Eo0xOdTcn2YB6tGPpiBfndTguUjZPsjf9i4YRQg3g20YzPYmHsVL4fJ6LGhp
 hu+g==
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgOCwgMjAxOSBhdCA5OjQ1IEFNIENvbGluIEtpbmcgPGNvbGluLmtpbmdAY2Fu
b25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPgo+Cj4gVmFyaWFibGUgZ3JwaF9vYmpfdHlwZSBpcyBiZWluZyBhc3NpZ25l
ZCB0d2ljZSwgb25lIG9mIHRoZXNlIGlzCj4gcmVkdW5kYW50IHNvIHJlbW92ZSBpdC4KPgo+IEFk
ZHJlc3Nlcy1Db3Zlcml0eTogKCJFdmFsdWF0aW9uIG9yZGVyIHZpb2xhdGlvbiIpCj4gU2lnbmVk
LW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KQXBwbGll
ZC4gIFRoYW5rcyEKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
dG9tYmlvcy5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hdG9tYmlvcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0b21i
aW9zLmMKPiBpbmRleCBiZTZkMGNmZTQxYWUuLjliYTgwZDgyODg3NiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWJpb3MuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdG9tYmlvcy5jCj4gQEAgLTM2NSw4ICszNjUs
NyBAQCBib29sIGFtZGdwdV9hdG9tYmlvc19nZXRfY29ubmVjdG9yX2luZm9fZnJvbV9vYmplY3Rf
dGFibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKgo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJv
dXRlci5kZGNfdmFsaWQgPSBmYWxzZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICByb3V0ZXIu
Y2RfdmFsaWQgPSBmYWxzZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGogPSAwOyBq
IDwgKChsZTE2X3RvX2NwdShwYXRoLT51c1NpemUpIC0gOCkgLyAyKTsgaisrKSB7Cj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90IGdycGhfb2JqX3R5cGU9Cj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBncnBoX29ial90eXBlID0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgZ3JwaF9vYmpfdHlwZSA9Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKGxlMTZfdG9fY3B1KHBhdGgtPnVzR3JhcGhpY09iaklk
c1tqXSkgJgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPQkpFQ1RfVFlQ
RV9NQVNLKSA+PiBPQkpFQ1RfVFlQRV9TSElGVDsKPgo+IC0tCj4gMi4yMC4xCj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
