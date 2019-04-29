Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9F2EAE6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 21:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF42891D6;
	Mon, 29 Apr 2019 19:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC9588F58;
 Mon, 29 Apr 2019 19:29:28 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p21so750132wmc.0;
 Mon, 29 Apr 2019 12:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fu7eQcZhZjRVoS/wShHhIhqTGtzVNJ/jmSgibktML2U=;
 b=gobugLgdm9VLhxIWui3QMC/T8Cb1JJ9WbeEVOs8a5ceadfrzXIQl8f/hL2BlpyavAJ
 2wwg+Kauug/XarXkIFjv3/9cddSO8MSrvzUTOFPdfx1zwNgmGTIUcPBRRGDS3izEkISY
 Xo9ehsfMt8xmIzHyhNCCK/copXV2wKhio4nCIPybYdBuYwp2DkcupoYpDqIjhiDweA18
 VlD0OjMQrL7Ia8QT+GzM8oxEwN3jRwlIGGwHSVi7kwEjsJ6wQ4gbXLOQ6+p4OrjtkHLl
 dxwHldVNP5/9SewZ2jLsFu18dgga+qQO7t5RtY+2zV4kkRiJ3GByXpqU3tu6CtEnSiEx
 Cyrg==
X-Gm-Message-State: APjAAAWLHq8w/yMpql2SUmU53+a/Eh4j9QF4k02YrjhL454rFwOTRulx
 GrmIxsvlyjVOcokday2MKfOxIvkaMAUc7ORqgmc=
X-Google-Smtp-Source: APXvYqy6SvYqmyecCCwULfVSMylZ+b9+WddC1smsVpRCtxfgUCHspjfmenMrxifEgdCKsO2TZEA1HZZSzL2uy/nr8Q4=
X-Received: by 2002:a1c:2e89:: with SMTP id u131mr477818wmu.82.1556566167084; 
 Mon, 29 Apr 2019 12:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190426214811.12310-1-colin.king@canonical.com>
In-Reply-To: <20190426214811.12310-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Apr 2019 15:29:14 -0400
Message-ID: <CADnq5_PwaZkbQ24vO=zi4HvMXTjayUKV3mnTiBt6X9AV=fXEBg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: fix incorrect null check on pointer
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fu7eQcZhZjRVoS/wShHhIhqTGtzVNJ/jmSgibktML2U=;
 b=I4zAdL5oLAq22/O4l+6TyiatsNqlUcugaPuIZ8lUjmkSdeO4pv0veAUfHNWKpU5Gu8
 yqv+bgqqESmsfkKJzMuWdOZJac/gNZPvCO/Gj9yniMMtbJF0HTVEjKOQzdWE5Zi6T0Hh
 HYj+qHzm6wx03A5YrF4w0Gd9vdA6YBhMtgGndHOlIeRUUpJrhsd0o0Hu6Cghx1jjxjYd
 SHCnv7/WgoksixJzUhtR1U2tcOMukCOD4fQ/UiY+rp/UXhhQllrEGmSIR6VyXi4F6zEw
 7IUUzuZo80SN0teniLcVD1HkyBf3SsenocxNHx9EZbaL7jt2UG7zFMWTiuJ8tgzZ1FwL
 oN8A==
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgNTo0OCBQTSBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdA
Y2Fub25pY2FsLmNvbT4KPgo+IEN1cnJlbnRseSBhbiBhbGxvY2F0aW9uIGlzIGJlaW5nIG1hZGUg
YnV0IHRoZSBhbGxvY2F0aW9uIGZhaWx1cmUKPiBjaGVjayBpcyBiZWluZyBwZXJmb3JtZWQgb24g
YW5vdGhlciBwb2ludGVyLiBGaXggdGhpcyBieSBjaGVja2luZwo+IHRoZSBjb3JyZWN0IHBvaW50
ZXIuIEFsc28gdXNlIHRoZSBub3JtYWwga2VybmVsIGlkaW9tIGZvciBudWxsCj4gcG9pbnRlciBj
aGVja3MuCj4KPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiUmVzb3VyY2UgbGVhayIpCj4gRml4ZXM6
IDQzZTNhYzgzODllZiAoImRybS9hbWQvZGlzcGxheTogQWRkIGZ1bmN0aW9uIHRvIGNvcHkgREMg
c3RyZWFtcyIpCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fu
b25pY2FsLmNvbT4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJlYW0uYyB8IDIgKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJlYW0uYwo+IGluZGV4IDYyMDBkZjNlZGNk
MC4uOTZlOTdkMjVkNjM5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjX3N0cmVhbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfc3RyZWFtLmMKPiBAQCAtMTY4LDcgKzE2OCw3IEBAIHN0cnVjdCBkY19zdHJl
YW1fc3RhdGUgKmRjX2NvcHlfc3RyZWFtKGNvbnN0IHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0
cmVhbSkKPiAgICAgICAgIHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKm5ld19zdHJlYW07Cj4KPiAg
ICAgICAgIG5ld19zdHJlYW0gPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRl
KSwgR0ZQX0tFUk5FTCk7Cj4gLSAgICAgICBpZiAoc3RyZWFtID09IE5VTEwpCj4gKyAgICAgICBp
ZiAoIW5ld19zdHJlYW0pCj4gICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+Cj4gICAgICAg
ICBtZW1jcHkobmV3X3N0cmVhbSwgc3RyZWFtLCBzaXplb2Yoc3RydWN0IGRjX3N0cmVhbV9zdGF0
ZSkpOwo+IC0tCj4gMi4yMC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
