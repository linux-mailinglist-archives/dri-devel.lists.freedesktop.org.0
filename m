Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9979A170
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 22:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9D86EAE5;
	Thu, 22 Aug 2019 20:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900756EAE5;
 Thu, 22 Aug 2019 20:51:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s18so6679488wrn.1;
 Thu, 22 Aug 2019 13:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ypNP1kJ2eEs/EAi1HZN+8+beflxZCGBjmUyy7v7X9eU=;
 b=lRKZ5bJU+tbJY7T/bbUp3iz9HR9ZcgAIj9sqw5tZISv5xJZgfFgvhoDkmaEQzZ9yQZ
 SInYsbojpNJ+otxltkMz2gzrFTPWHgl/m+mDbPb5QaC00H2Q3bK0BzK/uHVBhbnCwtE+
 hQAFf9YrQ+AE8b4aglpZhEKu++tmSvT40engu3HtqwfdDFEu3NkRYtmsSiLo4vaiCJRv
 UuqzcrOoKn4f1A/smfnRZcFYaJQCWAHVmQAMXsLFndSmeryVfE/cZivZ/+0J/1dYN0Ho
 Sr1PsOhIZwXCOIq98S09OlhMqxz7YGQrTg5tdrTTSJGfZbneWsjaViFPFrLDInT8jl9e
 ys0g==
X-Gm-Message-State: APjAAAX5eA5Uu9swBBXwvQJVx1NIcchuo5pE7W2oMTdqyw+ZzHfZ688m
 M4n3dNv6DlK0VUrOg4tz4iCiMC5MFyXMnE1mtiQ=
X-Google-Smtp-Source: APXvYqwLkyCSFex31CA1uzOruakJcFqOEcFr8tq/u+g1hcxkFaEl4VVU+6teCA/XPl3+hxCo8Rhhmx/xfcNfVAFXFR4=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr1006134wrc.4.1566507098156;
 Thu, 22 Aug 2019 13:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190822130948.32195-1-colin.king@canonical.com>
In-Reply-To: <20190822130948.32195-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Aug 2019 16:51:25 -0400
Message-ID: <CADnq5_O=V0_MNenTdxFsprmrGQiwMQNDFFkzYH-ZWw11VaMYmA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/powerplay: remove redundant assignment to
 variable baco_state
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ypNP1kJ2eEs/EAi1HZN+8+beflxZCGBjmUyy7v7X9eU=;
 b=ca5Ppa+MCF+DQvu+mF0mpSgCn71cKIzPoQZ5XK9eLTa9ftfSOoVXJ4IRJ1y2KXDmSi
 W37s+l8yo6mHXHNeyfFeDe6oEiTziOsHIn3Fmp/JUPf0nmIrAww7zGz2dHfFl/0EX3np
 AuAg6RRJF8jYaa/u5FxmEEm+PjLZZ1uZKZSpufY+8sBx4Kq8PPyi41cLrghGbvHX/BHY
 aSlzKPde/+kFRKNpM+qU4jiVTNoOEqvltua+C5XQ2CqRC/qpW85AvtRz9jH7bNDgeLZP
 OxncTcVaUh5dvOeBGgQI+CS3hvHcekZtYze60cOI1TqgTsaoZRVgpuVJ6scw316FSqn+
 GEdQ==
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
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgOTowOSBBTSBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdA
Y2Fub25pY2FsLmNvbT4KPgo+IFZhcmlhYmxlIGJhY29fc3RhdGUgaXMgaW5pdGlhbGl6ZWQgdG8g
YSB2YWx1ZSB0aGF0IGlzIG5ldmVyIHJlYWQgYW5kIGl0IGlzCj4gcmUtYXNzaWduZWQgbGF0ZXIu
IFRoZSBpbml0aWFsaXphdGlvbiBpcyByZWR1bmRhbnQgYW5kIGNhbiBiZSByZW1vdmVkLgo+Cj4g
QWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCBWYWx1ZSIpCj4gU2lnbmVkLW9mZi1ieTogQ29s
aW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkFwcGxpZWQuICBUaGFua3Mh
CgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAu
YyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwo+IGluZGV4IDg5
NzQ5YjFkMjAxOS4uYTRhYmE4NTc2OTAwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvc211X3YxMV8wLmMKPiBAQCAtMTY1Niw3ICsxNjU2LDcgQEAgc3RhdGljIGJvb2wgc211
X3YxMV8wX2JhY29faXNfc3VwcG9ydChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKPiAgc3RhdGlj
IGVudW0gc211X2JhY29fc3RhdGUgc211X3YxMV8wX2JhY29fZ2V0X3N0YXRlKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qgc211X2JhY29fY29udGV4dCAqc211
X2JhY28gPSAmc211LT5zbXVfYmFjbzsKPiAtICAgICAgIGVudW0gc211X2JhY29fc3RhdGUgYmFj
b19zdGF0ZSA9IFNNVV9CQUNPX1NUQVRFX0VYSVQ7Cj4gKyAgICAgICBlbnVtIHNtdV9iYWNvX3N0
YXRlIGJhY29fc3RhdGU7Cj4KPiAgICAgICAgIG11dGV4X2xvY2soJnNtdV9iYWNvLT5tdXRleCk7
Cj4gICAgICAgICBiYWNvX3N0YXRlID0gc211X2JhY28tPnN0YXRlOwo+IC0tCj4gMi4yMC4xCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
