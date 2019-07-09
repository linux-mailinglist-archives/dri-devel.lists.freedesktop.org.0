Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42FC63675
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 15:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E3389A1E;
	Tue,  9 Jul 2019 13:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5272F899DC;
 Tue,  9 Jul 2019 13:08:51 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g67so3187800wme.1;
 Tue, 09 Jul 2019 06:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5zNw7yOYRGRe3lmbESQC+BIywwsER5mP5dHtawRmtUg=;
 b=Bl1qlwpKj6b5YX0SQmej5lIvmuatsOldTl3x1hs8ZJMKk0j1goAEgOpwhkC226XIVY
 4UcNrYtAC/5IAl3Wll4u8TS0I+oi6LQglAJzkSoWHwXr733x6TK9f50KcDehLxbreua8
 KKjONgQzS063J8nA70XDhXXuTpbbPudRNbpJ7n2sgST5Nb32zQCiZc9oXRW29ipkSF2h
 qHsRY0g+vQ3efp4aACxtt3e+yA4yqjZ5RlKfHMP40YA73QxOeQZOwneZR9FO978m+tdO
 1tEnnXQiJG6ferZDJREz2uUKQ4iQvsAlWavLuIrvNAafjt5R0S/FmNHoV1T8iBvMjesF
 L5bQ==
X-Gm-Message-State: APjAAAVEOKqC0IhMX80G1Vo85PaKquKEp61mpmv5B78tBl7QOZh6jOfQ
 opS3QM43bbiBiXzN6mPUJpp7CYhpM/rkx8CWEP0=
X-Google-Smtp-Source: APXvYqyqC0d9hRgfT+ZieDiI7TjJUankW7mnEizvkt8y5jvweTTMyCC91zHfJhxUqmmygj4YFXdcPTHW4axFKWce+jU=
X-Received: by 2002:a1c:9e90:: with SMTP id h138mr23670087wme.67.1562677729889; 
 Tue, 09 Jul 2019 06:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190709091048.35260-1-yuehaibing@huawei.com>
In-Reply-To: <20190709091048.35260-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Jul 2019 09:08:38 -0400
Message-ID: <CADnq5_OTri_FzBHUSzKDPrMMAx2fDj8Mx67qHSofo+Hx7Q+60Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix build without CONFIG_HMM_MIRROR
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5zNw7yOYRGRe3lmbESQC+BIywwsER5mP5dHtawRmtUg=;
 b=UoJ33hjw2DBUdQFoWS7L44YXRtnxWNnY7mi1ulDEHyxW3pYDsBu0z1m2o30P0n3fee
 kcoCCUI+RMcB1s2PORs1EB0sZRFPwv2hOCw+PSg/Qw29A/9+kELX6c5HVVMLkWS24w8d
 ImGM5PQX3xf52ZwWewIuxDpxOP0qya5ynIMcFDu5C7bDbabKNN5L9zX0JSw6HG+9NmP+
 Uqmkq1tQdlNz+DmfJEia90+qVAXC3h3ycmM0eu/Lvf4enGxKHRZH2/FH7z4EleDVulOf
 J83tBVT481Sc0wf+cguIss4ZeDPmHV4wWUgebavf/DPyEI23lDPaNyaoJ+AXodcgUMRH
 NQgw==
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>, Dave Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCA4OjU1IEFNIFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVh
d2VpLmNvbT4gd3JvdGU6Cj4KPiBJZiBDT05GSUdfSE1NX01JUlJPUiBpcyBub3Qgc2V0LCBidWls
ZGluZyBtYXkgZmFpbHM6Cj4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1Lmg6NzI6MCwKPiAgICAgICAgICAgICAgICAgIGZyb20gZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jOjQwOgo+IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5oOjY5OjIwOiBlcnJvcjogZmllbGQgbWlycm9yIGhhcyBp
bmNvbXBsZXRlIHR5cGUKPiAgIHN0cnVjdCBobW1fbWlycm9yIG1pcnJvcjsKPgo+IEZpeGVzOiA3
NTkwZjZkMjExZWMgKCJkcm0vYW1kZ3B1OiBQcmVwYXJlIGZvciBobW1fcmFuZ2VfcmVnaXN0ZXIg
QVBJIGNoYW5nZSIpCj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3
ZWkuY29tPgoKSSBhbHJlYWR5IGFwcGxpZWQgYSBzaW1pbGFyIHBhdGNoIGZyb20gQXJuZC4KClRo
YW5rcywKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9t
bi5oIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaAo+IGluZGV4IDI4MWZkOWYuLmIxNGYxNzUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmgKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaAo+IEBAIC02NSw4ICs2NSwx
MCBAQCBzdHJ1Y3QgYW1kZ3B1X21uIHsKPiAgICAgICAgIHN0cnVjdCByd19zZW1hcGhvcmUgICAg
IGxvY2s7Cj4gICAgICAgICBzdHJ1Y3QgcmJfcm9vdF9jYWNoZWQgICBvYmplY3RzOwo+Cj4gKyNp
ZiBkZWZpbmVkKENPTkZJR19ITU1fTUlSUk9SKQo+ICAgICAgICAgLyogSE1NIG1pcnJvciAqLwo+
ICAgICAgICAgc3RydWN0IGhtbV9taXJyb3IgICAgICAgbWlycm9yOwo+ICsjZW5kaWYKPiAgfTsK
Pgo+ICAjaWYgZGVmaW5lZChDT05GSUdfSE1NX01JUlJPUikKPiAtLQo+IDIuNy40Cj4KPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBt
YWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
