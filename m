Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639633662C2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 02:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5836E91E;
	Wed, 21 Apr 2021 00:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351BA6E91D;
 Wed, 21 Apr 2021 00:01:55 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso32686521otv.6; 
 Tue, 20 Apr 2021 17:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n1Y9JenQmqq/jFrbUY+vR+8982Oh/0y41VMP20Nx67g=;
 b=bhh6P6p5q0Lyp1rL2pguKRojM04jiK6qIibAFK1ZeHz4Mv7HuiZtaBqALKt8MJzQ+f
 HCwUUiNZ6rzrTxS7Y1GVieHwse9fyWl430AsMCywZNg4VLK4lBSnHDLGwPjNn6GlJ6DJ
 1cj+Y54wCPsxaVxUfJZOIsWw16oWtxQfMuPq8YpXV0foQgkt7EYkCWZeAFt+GZ8DBCMU
 r5kQ2NOgALBONmQxfACjkHer1CAfz4ny0aHyabbGJE4yYY2WHax98H9cNyxzGJsDGoJJ
 4y8eB54/hhFt8UzhZG3mJsPW76CtXowh++/nJf8/P1s57SXMh1lKdki6lfNA67mEx2sg
 7gXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n1Y9JenQmqq/jFrbUY+vR+8982Oh/0y41VMP20Nx67g=;
 b=Y3fuOCxNR8cuWcXk4LctGXGSeErHXFIZiq5DdTGaYaR2yZWj/ol2fsEHy9kaFp5k/F
 L7lete11MSwaQj2NW7xxw4aztKOOaFaJdK1llv1u+OAvasOjm25Dh+TSxEVPj2+iosrE
 Yi4h85NgGgpAehHQ1/4tZsjfunxEFQcLZjG97xxQR8RaQlUgPcx0LOLJYcH6JiWHcH28
 zLLLlZZchJi4MRtTcp5II4apx/9yQ0HceQqaJT1wKaCnV1iOBFw8f6pbIGnCXZXCu076
 CTDaL38E3H22mJ/R9fzd2uOF1Ek6blG0zoN7GZ3VulYrnPFX7L91G2Kbjsaq1MHDzywD
 CoGQ==
X-Gm-Message-State: AOAM5339NW4nqcrSsaftLR1YSd5b5o6I6TE7XRwnJ8fKbZXiNRQB3ANZ
 wBgkM86F8VEf99lk9h3XSRr8VFNGw9Pn9xZhwlo=
X-Google-Smtp-Source: ABdhPJxRmv0oaIQ8o8neeJ0EYrxNDJhIjGMeVuNsDPG6BueZp+kvjrvsztKO5sPtvnLnvKUbLNRWoTOmkOrtfFEhMcw=
X-Received: by 2002:a9d:75c4:: with SMTP id c4mr19093574otl.311.1618963314628; 
 Tue, 20 Apr 2021 17:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-34-lee.jones@linaro.org>
 <d44d2325-4cba-2927-d5e9-1d8e0ab1649c@amd.com>
In-Reply-To: <d44d2325-4cba-2927-d5e9-1d8e0ab1649c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Apr 2021 20:01:43 -0400
Message-ID: <CADnq5_MH0FxYrr7FJEN-t_jF0-noRA3M7pRD5SROrpjOOZt8CQ@mail.gmail.com>
Subject: Re: [PATCH 33/40] drm/amd/amdgpu/amdgpu_ring: Provide description for
 'sched_score'
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Lee Jones <lee.jones@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgQXByIDE2LCAyMDIxIGF0IDExOjU0IEFN
IENocmlzdGlhbiBLw7ZuaWcKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBB
bSAxNi4wNC4yMSB1bSAxNjozNyBzY2hyaWViIExlZSBKb25lczoKPiA+IEZpeGVzIHRoZSBmb2xs
b3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+ID4KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuYzoxNjk6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBtZW1iZXIgJ3NjaGVkX3Njb3JlJyBub3QgZGVzY3JpYmVkIGluICdhbWRncHVfcmlu
Z19pbml0Jwo+ID4KPiA+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Cj4gPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdh
bEBsaW5hcm8ub3JnPgo+ID4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGxpbnV4LW1lZGlhQHZn
ZXIua2VybmVsLm9yZwo+ID4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+ID4g
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPgo+IFJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4KPiA+
IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5jIHwgMSAr
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuYwo+ID4gaW5kZXggNjg4NjI0ZWJlNDIxMS4uN2I2
MzRhMTUxN2Y5YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yaW5nLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
aW5nLmMKPiA+IEBAIC0xNTgsNiArMTU4LDcgQEAgdm9pZCBhbWRncHVfcmluZ191bmRvKHN0cnVj
dCBhbWRncHVfcmluZyAqcmluZykKPiA+ICAgICogQGlycV9zcmM6IGludGVycnVwdCBzb3VyY2Ug
dG8gdXNlIGZvciB0aGlzIHJpbmcKPiA+ICAgICogQGlycV90eXBlOiBpbnRlcnJ1cHQgdHlwZSB0
byB1c2UgZm9yIHRoaXMgcmluZwo+ID4gICAgKiBAaHdfcHJpbzogcmluZyBwcmlvcml0eSAoTk9S
TUFML0hJR0gpCj4gPiArICogQHNjaGVkX3Njb3JlOiBvcHRpb25hbCBzY29yZSBhdG9taWMgc2hh
cmVkIHdpdGggb3RoZXIgc2NoZWR1bGVycwo+ID4gICAgKgo+ID4gICAgKiBJbml0aWFsaXplIHRo
ZSBkcml2ZXIgaW5mb3JtYXRpb24gZm9yIHRoZSBzZWxlY3RlZCByaW5nIChhbGwgYXNpY3MpLgo+
ID4gICAgKiBSZXR1cm5zIDAgb24gc3VjY2VzcywgZXJyb3Igb24gZmFpbHVyZS4KPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWls
aW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
