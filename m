Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20DCCBB02
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 14:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662AE6EB65;
	Fri,  4 Oct 2019 12:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457CF6E155;
 Fri,  4 Oct 2019 12:57:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r3so7093588wrj.6;
 Fri, 04 Oct 2019 05:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XS9aaZMpGytggDjroiubtOG48XIjudiIkkyqLu//BAo=;
 b=D2bow4OW2TWu1JY0yQD9b8/oXkdUYFjPCmw6DZed4aAzmeq2hFCLj/3j1nMX1idtuY
 8CkQl3IhR9SyxYp7J2NpkAqeY/BHm+s+4u5xzOz4m18UugMly35bL/GVIOBy1Xllzyke
 YL0l8igkulktZGZ17rxAaSCL3Ji0OzSFVcPeEZvLiSPIf5JonsIKvA9JCwsbpIvcOM5q
 VsMN0qdknQZSNheq2e7SOqGvGFbrjW24oQYcCZSveDLxfh60gWMe/QcqOgfVZBLxrUmS
 I07+eLaKdD2dRIcpfiq2+X6FfLjQ8GsovbWW5hABQlj0EDHAPFGLeJr66Zte2v/nNsrx
 0gUw==
X-Gm-Message-State: APjAAAX7hpT1p4V0WNwqcDuP3KkOAD/1CQI/wxsr0twaLK1qhdrHxG40
 sHwcim4qhec6JP7Rp92VrjcvIC2v/eVLUNOe6Vk=
X-Google-Smtp-Source: APXvYqw7a5NYS3b3BeLyQBXREKlOHjBFTJXthurPJdQ7nhyePsMLRV3NcpO1oI+myJ7I+eZ/HhBO3tS0mQBjuPunC0g=
X-Received: by 2002:adf:d08b:: with SMTP id y11mr12064059wrh.50.1570193857802; 
 Fri, 04 Oct 2019 05:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191003214049.23067-1-colin.king@canonical.com>
 <70c50fec-7ab7-3ac9-3f49-d5f2651554e4@amd.com>
In-Reply-To: <70c50fec-7ab7-3ac9-3f49-d5f2651554e4@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Oct 2019 08:57:25 -0400
Message-ID: <CADnq5_N6WP=gDE=Yqv6CqKs13LkUJzFx9C6YmiU1ua_MSg_uiw@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: remove redundant variable r and
 redundant return statement
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XS9aaZMpGytggDjroiubtOG48XIjudiIkkyqLu//BAo=;
 b=CfZutqK2eyhMj4QYH5dAeTwCvDuMu78hH8sOobkZWo8qm2svsb/q3QV1/JgEXFDxGI
 IfMzm9/TKepsFaqC+XIMnMc53GndMFWcvcRVpn9GIrAE2Vigoe9F3HgbfiiI0GmjToSr
 QYwHPu4pKKmB2Yy44qgzJ/vVp4fhAjRDPHcDCNqAiEpjErKrRnuWiGmOMMuYUC63Gcms
 Eo0vKKBjllg2yG3BisOSgS/iyJ4SL5O32xzSyMNOfRq+GCR60760jAHQHjLKIlqVfGkT
 xpax/gUZeX1CBKAxoKUvnTx18iR6xS6JeVhl3BzeYiqqO9KCiRKlmdztxNZ1uV2ucsFo
 pHbw==
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Colin King <colin.king@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCAzOjI5IEFNIEtvZW5pZywgQ2hyaXN0aWFuCjxDaHJpc3Rp
YW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMDMuMTAuMTkgdW0gMjM6NDAgc2Nocmll
YiBDb2xpbiBLaW5nOgo+ID4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25p
Y2FsLmNvbT4KPiA+Cj4gPiBUaGVyZSBpcyBhIHJldHVybiBzdGF0ZW1lbnQgdGhhdCBpcyBub3Qg
cmVhY2hhYmxlIGFuZCBhIHZhcmlhYmxlIHRoYXQKPiA+IGlzIG5vdCB1c2VkLiAgUmVtb3ZlIHRo
ZW0uCj4gPgo+ID4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlN0cnVjdHVyYWxseSBkZWFkIGNvZGUi
KQo+ID4gRml4ZXM6IGRlN2I0NWJhYmQ5YiAoImRybS9hbWRncHU6IGNsZWFudXAgY3JlYXRpbmcg
Qk9zIGF0IGZpeGVkIGxvY2F0aW9uICh2MikiKQo+ID4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPgo+IFJldmlld2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpBcHBsaWVkLiAgVGhhbmtzIQoK
QWxleAoKPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYyB8IDIgLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ID4gaW5kZXggNDgxZTRjMzgx
MDgzLi44MTQxNTlmMTU2MzMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHRtLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYwo+ID4gQEAgLTE2MzYsNyArMTYzNiw2IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV90
dG1fZndfcmVzZXJ2ZV92cmFtX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gPiAg
IHN0YXRpYyBpbnQgYW1kZ3B1X3R0bV9md19yZXNlcnZlX3ZyYW1faW5pdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKPiA+ICAgewo+ID4gICAgICAgdWludDY0X3QgdnJhbV9zaXplID0gYWRl
di0+Z21jLnZpc2libGVfdnJhbV9zaXplOwo+ID4gLSAgICAgaW50IHI7Cj4gPgo+ID4gICAgICAg
YWRldi0+ZndfdnJhbV91c2FnZS52YSA9IE5VTEw7Cj4gPiAgICAgICBhZGV2LT5md192cmFtX3Vz
YWdlLnJlc2VydmVkX2JvID0gTlVMTDsKPiA+IEBAIC0xNjUxLDcgKzE2NTAsNiBAQCBzdGF0aWMg
aW50IGFtZGdwdV90dG1fZndfcmVzZXJ2ZV92cmFtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQU1ER1BV
X0dFTV9ET01BSU5fVlJBTSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmYWRldi0+ZndfdnJhbV91c2FnZS5yZXNlcnZlZF9ibywKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmYWRldi0+ZndfdnJhbV91c2FnZS52YSk7Cj4gPiAt
ICAgICByZXR1cm4gcjsKPiA+ICAgfQo+ID4KPiA+ICAgLyoqCj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
