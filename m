Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB2C674C4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 19:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C5F6E30F;
	Fri, 12 Jul 2019 17:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE03F6E30F;
 Fri, 12 Jul 2019 17:56:51 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l2so9717473wmg.0;
 Fri, 12 Jul 2019 10:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DJSixh5eUA7ZuYLo3zM8xEkgRu/s1ZTrnfSXH7ypmHc=;
 b=CPgMRPZEIf6Hzsuz6ANbYj7YzFhvCpbEVrJJVm5wItuXpU+eJEJ9PRNFWw48v/uWM0
 cvrpX5UKIUy+SdnPWWvVbImD0rVfrvF44OYKT72vEUXSPr6JWv+e9Vem8VegvL4hwZBK
 nVwwrOlJBQCTqe4RIAq0CYkVvbeXO9dPrO5t8CuNfEECtNOyW2HiG5hWtom9BaeNNkvf
 xFmhFLjFIpMl8Wh9GkOabIvz37DfUFZSKuBAj7N1TQ6nMM4YoLClBCdYsu9JMP4f6yKr
 0mOTW0eOTJhrweQkZeE8g8q/dQvkDm8PEMRlUpSms2hECwKrvzpnQbPgYWcBNCiQplNV
 JJ2w==
X-Gm-Message-State: APjAAAV2oeG19tFICujVwYP0NYFlV5npBxpA8rfHx58XMAPdsD1FMFkK
 h3PVmvDQNby6io79JItRH2vJ+jVXMOTL8YPLQEw=
X-Google-Smtp-Source: APXvYqyML4Lk6QCxD99I7qZEOiSKP9iDUkViZ1UmbngxvdSyqiF0OLh89O057bWk3ccYp26LS7x3xlkj6sjYmoeIG2I=
X-Received: by 2002:a1c:a1c5:: with SMTP id
 k188mr10769220wme.102.1562954210408; 
 Fri, 12 Jul 2019 10:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190712094009.1535662-1-arnd@arndb.de>
In-Reply-To: <20190712094009.1535662-1-arnd@arndb.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Jul 2019 13:56:39 -0400
Message-ID: <CADnq5_O-LJHnHg_yw0jVxy9yT8ZqNq4s-U_surFXTcL=fPA21Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: return 'NULL' instead of 'false' from
 dcn20_acquire_idle_pipe_for_layer
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DJSixh5eUA7ZuYLo3zM8xEkgRu/s1ZTrnfSXH7ypmHc=;
 b=Dx2+eI7nrYFsu9WMMxg8yMFuBZCeS3Z8SDdEnAG2fI9uXr1hpZquU0LMGuhLHKFWp+
 lupWa4P3CCXbmTiTze1gzXb4OTXE4sXWsvELGlbwIVS7yayPfzQkb/QiXARO6hgk1ylI
 PmZL8W9iApy+tMgfkzA8Rg9r/YWk7li7y5NxNNFnS3Hgk+FluZn0hK71KL/I0rJk986F
 axWFd0GW2ONPhvlpTWYCWYRXORANKaKKOX39LPIB1bUXhkhHngomOBZxH86KtjvrkQkJ
 GZBx6DEiY0OPofKJKw72IjuYJyaoOc9jJUOsZqbZfeWykQo+3tT8UdhJioWeXkVMAvSm
 vCKQ==
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
Cc: Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 clang-built-linux@googlegroups.com, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgNTo0MCBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IGNsYW5nIGNvbXBsYWlucyB0aGF0ICdmYWxzZScgaXMgYSBub3QgYSBw
b2ludGVyOgo+Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jOjI0Mjg6MTA6IGVycm9yOiBleHByZXNzaW9uIHdoaWNoIGV2YWx1
YXRlcyB0byB6ZXJvIHRyZWF0ZWQgYXMgYSBudWxsIHBvaW50ZXIgY29uc3RhbnQgb2YgdHlwZSAn
c3RydWN0IHBpcGVfY3R4IConIFstV2Vycm9yLC1Xbm9uLWxpdGVyYWwtbnVsbC1jb252ZXJzaW9u
XQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4KPiBDaGFuZ2luZyBpdCB0byAnTlVM
TCcgbG9va3MgbGlrZSB0aGUgcmlnaHQgdGhpbmcgdGhhdCB3aWxsIHNodXQgdXAKPiB0aGUgd2Fy
bmluZyBhbmQgbWFrZSBpdCBlYXNpZXIgdG8gcmVhZCwgd2hpbGUgbm90IGNoYW5naW5nIGJlaGF2
aW9yLgo+Cj4gRml4ZXM6IDdlZDRlNjM1MmMxNiAoImRybS9hbWQvZGlzcGxheTogQWRkIERDTjIg
SFcgU2VxdWVuY2VyIGFuZCBSZXNvdXJjZSIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291
cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3Vy
Y2UuYwo+IGluZGV4IDcwYWM4YTk1ZDJkYi4uNjZhYTQxNGFkMzhmIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMK
PiBAQCAtMjQyNSw3ICsyNDI1LDcgQEAgc3RydWN0IHBpcGVfY3R4ICpkY24yMF9hY3F1aXJlX2lk
bGVfcGlwZV9mb3JfbGF5ZXIoCj4gICAgICAgICAgICAgICAgIEFTU0VSVCgwKTsKPgo+ICAgICAg
ICAgaWYgKCFpZGxlX3BpcGUpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4KPiAgICAgICAgIGlkbGVfcGlwZS0+c3RyZWFtID0g
aGVhZF9waXBlLT5zdHJlYW07Cj4gICAgICAgICBpZGxlX3BpcGUtPnN0cmVhbV9yZXMudGcgPSBo
ZWFkX3BpcGUtPnN0cmVhbV9yZXMudGc7Cj4gLS0KPiAyLjIwLjAKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
