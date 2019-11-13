Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3038FFB8AD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 20:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E1C897FB;
	Wed, 13 Nov 2019 19:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53276EE20;
 Wed, 13 Nov 2019 19:22:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s5so3728386wrw.2;
 Wed, 13 Nov 2019 11:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qkdacaVdhS5V1JI0trEPqYF0NgGr5+r4W2AqnZo0b/g=;
 b=NYIcn3CKbT5pT3ZgTvdUHVpgOhk7GIvRi4KZKRLlUp3L6syYT6rHLvOWBFLr7iZVZo
 HVCm8MW2JRJKw/qNMD6QdleNPHgu9AYZhwZk4jclu1ywj01KkQbbJn+r/9wd8N4OrNYc
 sNieNYVYUzfDVLXGZYsMRp4QVebbMsIBnZsBiPW0o3HRRZlVhOBtqfEJ5S3se+P5Mj3x
 0hw1ZGjDNF4LXv8CcEAD+PO92zgsxAPlOgqcZm+nHbDOaWhHbsxbpJkbKKejgfRC3LGU
 YB7nuP+6+xvGhztEyGkwcOO7BLlS2c/+R2OMTFo1QvoDycQV/ZGFq0Vn7PA22XRucw16
 b5LA==
X-Gm-Message-State: APjAAAUMG5PHDd5NDR41WBQ60NDiSaSRA60ZbdyV+h+p3kGCeYgRlqPe
 +GThzPUFH6hm8ftkcdk/w1oSxaYAdsEQpya5GRE=
X-Google-Smtp-Source: APXvYqyp9pkH+51iCa/hlQVEjIKtehxcBLsZVD0syYP6jy5OdSJfhR9kxXpI8hyUHS3wAiZs5PfUT1Wur+FcA2lhWwg=
X-Received: by 2002:adf:f010:: with SMTP id j16mr4582598wro.206.1573672942308; 
 Wed, 13 Nov 2019 11:22:22 -0800 (PST)
MIME-Version: 1.0
References: <1573649074-72589-1-git-send-email-yukuai3@huawei.com>
 <1573649074-72589-2-git-send-email-yukuai3@huawei.com>
 <ac4566662a04e0c25039df7ed30789d0792885cd.camel@perches.com>
In-Reply-To: <ac4566662a04e0c25039df7ed30789d0792885cd.camel@perches.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Nov 2019 14:22:10 -0500
Message-ID: <CADnq5_Pwc9U03+1=tKs2hxKVdqfwXOc14XRD=yeJCsc4=5NJtw@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/amdgpu: remove set but not used variable
 'mc_shared_chmap' from 'gfx_v6_0.c' and 'gfx_v7_0.c'
To: Joe Perches <joe@perches.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qkdacaVdhS5V1JI0trEPqYF0NgGr5+r4W2AqnZo0b/g=;
 b=OsCPK9MBTPx/N1epP5ySwSXv8jXL9MBO2c6cgnFpGnQDrK4O9vJ4hYcWPMpOqMi5kS
 dNfvRjXyF0fJZMMczbekLSUUcDb9/XQL/y7urvRITxFB2vBreT4wHncx5ZNYi+Wne56q
 EvmYeZQ/WsChHCIqDsczY9KJ9vXp4p6/LHGs/CYJwPQLnZe7tux5ptPGNJY5pCna1Fwj
 3tyiFklfcNtEdJPhbd68gpiQtv/JQxa94pfL6cE7KfHVyd9dgJzB/jqaIP/2qsUqbwxx
 48FnxoP7P3GKjLRcKQpnhEclVI8NKS0k3hbCrBrlRX6ohiLmzgvFaV04iKxyDmje9gyp
 aSwQ==
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
Cc: yi.zhang@huawei.com, Dave Airlie <airlied@linux.ie>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, zhengbin <zhengbin13@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, yu kuai <yukuai3@huawei.com>, "Quan,
 Evan" <evan.quan@amd.com>, Rex Zhu <Rex.Zhu@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMTE6NTYgQU0gSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVz
LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDIwMTktMTEtMTMgYXQgMjA6NDQgKzA4MDAsIHl1IGt1
YWkgd3JvdGU6Cj4gPiBGaXhlcyBnY2MgJy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5p
bmc6Cj4gPgo+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYzogSW4gZnVu
Y3Rpb24KPiA+IOKAmGdmeF92Nl8wX2NvbnN0YW50c19pbml04oCZOgo+ID4gZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYzoxNTc5OjY6IHdhcm5pbmc6IHZhcmlhYmxlCj4gPiDi
gJhtY19zaGFyZWRfY2htYXDigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12
YXJpYWJsZV0KPiBbXQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92Nl8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjZfMC5jCj4gW10K
PiA+IEBAIC0xNjc4LDcgKzE2NzgsNiBAQCBzdGF0aWMgdm9pZCBnZnhfdjZfMF9jb25zdGFudHNf
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiA+Cj4gPiAgICAgICBXUkVHMzIobW1C
SUZfRkJfRU4sIEJJRl9GQl9FTl9fRkJfUkVBRF9FTl9NQVNLIHwgQklGX0ZCX0VOX19GQl9XUklU
RV9FTl9NQVNLKTsKPiA+Cj4gPiAtICAgICBtY19zaGFyZWRfY2htYXAgPSBSUkVHMzIobW1NQ19T
SEFSRURfQ0hNQVApOwo+Cj4gSSBkbyBub3Qga25vdyB0aGUgaGFyZHdhcmUgYnV0IGZyZXF1ZW50
bHkgaGFyZHdhcmUgbGlrZQo+IHRoaXMgaGFzIHJlYWQgb3JkZXJpbmcgcmVxdWlyZW1lbnRzIGFu
ZCB2YXJpb3VzIHJlZ2lzdGVycwo+IGNhbiBub3QgYmUgcmVhZCBpbiBhIHJhbmRvbSBvcmRlci4K
Pgo+IERvZXMgcmVtb3ZpbmcgdGhpcyByZWFkIGhhdmUgbm8gZWZmZWN0IG9uIHRoZSBoYXJkd2Fy
ZT8KClRoZXJlIGlzIG5vIGRlcGVuZGVuY3kuICBJdCdzIHNhZmUuICBTYW1lIHRoaW5nIGJlbG93
LgoKQWxleAoKPgo+ID4gICAgICAgYWRldi0+Z2Z4LmNvbmZpZy5tY19hcmJfcmFtY2ZnID0gUlJF
RzMyKG1tTUNfQVJCX1JBTUNGRyk7Cj4gPiAgICAgICBtY19hcmJfcmFtY2ZnID0gYWRldi0+Z2Z4
LmNvbmZpZy5tY19hcmJfcmFtY2ZnOwo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3Y3XzAuYwo+IFtdCj4gPiBAQCAtNDMzNiw3ICs0MzM2LDYgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y3
XzBfZ3B1X2Vhcmx5X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gPiAgICAgICAg
ICAgICAgIGJyZWFrOwo+ID4gICAgICAgfQo+ID4KPiA+IC0gICAgIG1jX3NoYXJlZF9jaG1hcCA9
IFJSRUczMihtbU1DX1NIQVJFRF9DSE1BUCk7Cj4gPiAgICAgICBhZGV2LT5nZnguY29uZmlnLm1j
X2FyYl9yYW1jZmcgPSBSUkVHMzIobW1NQ19BUkJfUkFNQ0ZHKTsKPiA+ICAgICAgIG1jX2FyYl9y
YW1jZmcgPSBhZGV2LT5nZnguY29uZmlnLm1jX2FyYl9yYW1jZmc7Cj4KPiBTYW1lIHF1ZXN0aW9u
Lgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
