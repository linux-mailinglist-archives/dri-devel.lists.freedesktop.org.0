Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8A78A30B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 18:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246C66E562;
	Mon, 12 Aug 2019 16:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECF96E562;
 Mon, 12 Aug 2019 16:10:57 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v19so57192wmj.5;
 Mon, 12 Aug 2019 09:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VH0bD6Zqxl2UMVE/ud11TtREj58uFJR0VOEIpjfuEjY=;
 b=q0DW7eKQ89/8ZKaTl9vAgfvDdKSKiNZ7ksfGPIpl5g+2Yxj0/SZjgbx9g8hdXkcqub
 MiwyaMP3uRIqoIkKBWmc7TNFamGauVkMRgDOBz2N32tmTdbRUmlrKgD7458i//E6H/55
 k099TDa5o899K/OI/n0Nk5YJfqajX8iM+ysu9Mc3QcqudKjZbv3GIpyLGc2yKDVLs9Tj
 5MUaNvQMdMTsrgc1pQUIG2Zwp+6DI1WtLH6TL3Kf68HN2nbM4AhhD6ZwnPrrnQkMYFwp
 ZhqTkJpJaXJGweH/JOCcklbIrunSOXdE2K4VIldf2zReu4XJUOxCp3HkSLmj1YKSqAqM
 cseA==
X-Gm-Message-State: APjAAAXSqnC2PvFMDRlOBS4+Z+vA6nleDkF3BaDtvK7c3PDnIcFjVm4I
 oKL0tF1LzPs9DyB/bVP5n7OnASw5GFOeuVrxx68=
X-Google-Smtp-Source: APXvYqzMmmiiBtu9iT+6ihajz+xiA3zVSQ+uVani2o/4ymn7ct6L10oLnal8jSYD96FkxAmLgS6mB2QQBpqen6xqqSs=
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr38319wmh.67.1565626255907;
 Mon, 12 Aug 2019 09:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190805102940.26024-1-colin.king@canonical.com>
In-Reply-To: <20190805102940.26024-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 12 Aug 2019 12:10:42 -0400
Message-ID: <CADnq5_MKp-x-aEEFtL3B8T7PJ+JusqJAykZwZ4Eu25ieOEPuhg@mail.gmail.com>
Subject: Re: [PATCH][drm-next] drm/amd/powerplay: remove redundant duplicated
 return check
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VH0bD6Zqxl2UMVE/ud11TtREj58uFJR0VOEIpjfuEjY=;
 b=D5HAHlqpU6pTku0pfGYqwy2A4bgUNc5r9L52lEoWEY1rE6eUVq8WOgo8PvqU/6mxY0
 xlk1ba82jd12C7Scbd+rcpcNisq1GaSBTjikRcUeO86BqXyErWYe3vzh+hL9vYifJnl/
 ggwEG1cRXgR9dDZ60R4T4eU5BNl9Qy1+m3jwk7NK8l2vLXXG4FsgFTmGdaSGiN4u7Vx0
 WYICKKFIdYher1FFDlf4u0zGrWwKMdL79VRTu0OpHcBL+kr8j/Pok0N3AukmEwJw5Dpu
 utWDwP+ZhrjmA9d8vYxxlvxBLvAFKrZznNlEuZSTApvZCAgXE9lCLvqE8hPsNawQ6NLp
 sE2w==
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

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgQXVnIDUsIDIwMTkgYXQgNjoyOSBBTSBD
b2xpbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ29s
aW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPgo+IFRoZSBjaGVjayBvbiBy
ZXQgaXMgZHVwbGljYXRlZCBpbiB0d28gcGxhY2VzLCBpdCBpcyByZWR1bmRhbnQgY29kZS4KPiBS
ZW1vdmUgaXQuCj4KPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiTG9naWNhbGx5IGRlYWQgY29kZSIp
Cj4gRml4ZXM6IGI5NGFmYjYxY2RhZSAoImRybS9hbWQvcG93ZXJwbGF5OiBob25vciBodyBsaW1p
dCBvbiBmZXRjaGluZyBtZXRyaWNzIGRhdGEgZm9yIG5hdmkxMCIpCj4gU2lnbmVkLW9mZi1ieTog
Q29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgNCAtLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYwo+IGluZGV4IGQ2MmMyNzg0YjEwMi4uYjI3MmM4ZGM4Zjc5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwo+IEBAIC05NDEsOCAr
OTQxLDYgQEAgc3RhdGljIGludCBuYXZpMTBfZ2V0X2dwdV9wb3dlcihzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgdWludDMyX3QgKnZhbHVlKQo+ICAgICAgICAgcmV0ID0gbmF2aTEwX2dldF9tZXRy
aWNzX3RhYmxlKHNtdSwgJm1ldHJpY3MpOwo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsKPiAtICAgICAgIGlmIChyZXQpCj4gLSAgICAgICAgICAgICAgIHJl
dHVybiByZXQ7Cj4KPiAgICAgICAgICp2YWx1ZSA9IG1ldHJpY3MuQXZlcmFnZVNvY2tldFBvd2Vy
IDw8IDg7Cj4KPiBAQCAtMTAwMSw4ICs5OTksNiBAQCBzdGF0aWMgaW50IG5hdmkxMF9nZXRfZmFu
X3NwZWVkX3JwbShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKPiAgICAgICAgIHJldCA9IG5hdmkx
MF9nZXRfbWV0cmljc190YWJsZShzbXUsICZtZXRyaWNzKTsKPiAgICAgICAgIGlmIChyZXQpCj4g
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gLSAgICAgICBpZiAocmV0KQo+IC0gICAgICAg
ICAgICAgICByZXR1cm4gcmV0Owo+Cj4gICAgICAgICAqc3BlZWQgPSBtZXRyaWNzLkN1cnJGYW5T
cGVlZDsKPgo+IC0tCj4gMi4yMC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
