Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A90371416
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 13:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B446E8A4;
	Mon,  3 May 2021 11:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAC46E8A4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 11:14:48 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id n2so7259875ejy.7
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 04:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8Fm7F0c8yCeLjtEP/qRFKGmTj7s0u0dRDMsnteJ2jYI=;
 b=Xx4GmMlzbep4CAGhIQREOwxn1cn6wfZbiyQl8/UFNqKS9imHgpfyHeMH3BzDkJffoK
 Jfc5TQmuDUFqbx9HdfuyWOuYshaJE38CBOfIaROfDNKMtmKCHSyWWFAyDreg5gWlQNmR
 b6rY6DYBE0OWZ2WhZ+rB3jXjCKuxtXeNaj9wtBlC5A3biWRQVdEaoPyllIADJyz6PAXB
 VptCsc9/f+QuBJMBVtKEDq/dRNQT7baeTE9/tx/xUdeHUnhkC8df+3GKdT+0i5Ew3mPR
 EJr8769sFyXoZRiFzUlsS4ls3y2ujx4xLJj4ggdAPIgJh3zpjK7SV/n037exMk1FVEXx
 W6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8Fm7F0c8yCeLjtEP/qRFKGmTj7s0u0dRDMsnteJ2jYI=;
 b=qdbkkIi6jlQSVmogaxkzaVUfmpYPPdM4UNTQ4ElRwgUHbEbKpQv43SJ8fW95qtDH01
 UDatyh84J9rlEc+tvZbIAxCY/TUxQn2cEW7phGJV2M0qsL0MGjJqcE7p5+y3l4Vk5XpC
 UiF/noc+GEKCqmnavKm2J9F334p6qZ8qHn9OU3Xwv5H60giaWplM8vqfestqmU/TDnSB
 fzTAmTHcr/5PjOxhMsuUAVNGDbKhhlbbLOL6jm4VzhdeVqPAGZJeNCwGZIAFz7kkh5lS
 2o21WAD8+sBWHddgW4zG7jmG9LcgnLzvSL0wi0Us3m0WoAEQHFm610vUP0iIdl0FcAzQ
 abfA==
X-Gm-Message-State: AOAM531si5VpYYvg/+T/KAH8e96skykrHWJIvgRhRI5FplxYuqW9qcL5
 ZFCx2d2Fn9yw15lHI0jPvRI=
X-Google-Smtp-Source: ABdhPJwWTmT1xnZxn05Tb4lQaDAJXR2rC9EqFwlqtvRGgD+B/LkQU7E2QfogjQBuDNvpvsOxL4wQ8A==
X-Received: by 2002:a17:907:20f7:: with SMTP id
 rh23mr3514443ejb.276.1620040487495; 
 Mon, 03 May 2021 04:14:47 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3a91:af9f:fcbf:5d42?
 ([2a02:908:1252:fb60:3a91:af9f:fcbf:5d42])
 by smtp.gmail.com with ESMTPSA id r21sm11133534ejy.27.2021.05.03.04.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 04:14:47 -0700 (PDT)
Subject: Re: [PATCH 11/13] drm/nouveau: switch the TTM backends to self alloc
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210430092508.60710-1-christian.koenig@amd.com>
 <20210430092508.60710-11-christian.koenig@amd.com>
 <CAM0jSHN0+w-VxmB9edWhbeq6faWfsC-r2R9N7q4p6PtjZUEdhA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b16ba144-4553-5cf0-67ad-602a411e514a@gmail.com>
Date: Mon, 3 May 2021 13:14:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHN0+w-VxmB9edWhbeq6faWfsC-r2R9N7q4p6PtjZUEdhA@mail.gmail.com>
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMjEgdW0gMTc6MDIgc2NocmllYiBNYXR0aGV3IEF1bGQ6Cj4gT24gRnJpLCAzMCBB
cHIgMjAyMSBhdCAxMDoyNSwgQ2hyaXN0aWFuIEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1bWVy
a2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IFNpbWlsYXIgdG8gdGhlIFRUTSByYW5nZSBtYW5hZ2Vy
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfbWVt
LmggfCAxICsKPj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jIHwgNCAr
KysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfbWVtLmggYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X21lbS5oCj4+IGluZGV4IDdkZjM4NDhlODVhYS4uM2E2YTFiZTJl
ZDUyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X21lbS5o
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfbWVtLmgKPj4gQEAgLTEz
LDYgKzEzLDcgQEAgbm91dmVhdV9tZW0oc3RydWN0IHR0bV9yZXNvdXJjZSAqcmVnKQo+PiAgIH0K
Pj4KPj4gICBzdHJ1Y3Qgbm91dmVhdV9tZW0gewo+PiArICAgICAgIHN0cnVjdCB0dG1fcmVzb3Vy
Y2UgYmFzZTsKPj4gICAgICAgICAgc3RydWN0IG5vdXZlYXVfY2xpICpjbGk7Cj4+ICAgICAgICAg
IHU4IGtpbmQ7Cj4+ICAgICAgICAgIHU4IGNvbXA7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV90dG0uYwo+PiBpbmRleCAxNWM3NjI3ZjhmNTguLjVlNWNlMmVjODlmMCAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jCj4+IEBAIC01OSw2ICs1OSw4IEBAIG5v
dXZlYXVfdnJhbV9tYW5hZ2VyX25ldyhzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwK
Pj4gICAgICAgICAgaWYgKHJldCkKPj4gICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Pgo+
PiArICAgICAgIHR0bV9yZXNvdXJjZV9pbml0KGJvLCBwbGFjZSwgcmVnLT5tbV9ub2RlKTsKPj4g
Kwo+IFdoYXQgaGFwcGVuZWQgaGVyZT8gSSBhc3N1bWUgdGhpcyBuZWVkcyB0byBiZSBub3V2ZWF1
X21lbS5iYXNlIG5vdCB0aGUgbW1fbm9kZT8KClNhbWUgbGlrZSB0aGUgb3RoZXIgYmFja2VuZHMg
SSdtIGZpcnN0IGNoYW5naW5nIHRoZSBhbGxvY2F0aW9uIHNvIHRoYXQgCndlIGFsbG9jYXRlIHR0
bV9yZXNvdXJjZSBhbmQgdGhlIHByaXZhdGUgaG91c2VrZWVwaW5nIHRvZ2V0aGVyIGFuZCB0aGVu
IApmbGlwIHRoZSBzd2l0Y2ggaW4gdGhlIGxhc3QgcGF0Y2guCgpTbyByZWctPm1tX25vZGUgaXMg
dGVtcG9yYXJ5IHBvaW50aW5nIHRvIHRoZSB0dG1fcmVzb3VyY2Ugb2JqZWN0IHVudGlsIAppdCBp
cyByZW1vdmVkIGluIHRoZSBsYXN0IHBhdGNoLgoKQ2hyaXN0aWFuLgoKPgo+PiAgICAgICAgICBy
ZXQgPSBub3V2ZWF1X21lbV92cmFtKHJlZywgbnZiby0+Y29udGlnLCBudmJvLT5wYWdlKTsKPj4g
ICAgICAgICAgaWYgKHJldCkgewo+PiAgICAgICAgICAgICAgICAgIG5vdXZlYXVfbWVtX2RlbChy
ZWcpOwo+PiBAQCAtODcsNiArODksNyBAQCBub3V2ZWF1X2dhcnRfbWFuYWdlcl9uZXcoc3RydWN0
IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4sCj4+ICAgICAgICAgIGlmIChyZXQpCj4+ICAgICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4KPj4gKyAgICAgICB0dG1fcmVzb3VyY2VfaW5pdChi
bywgcGxhY2UsIHJlZy0+bW1fbm9kZSk7Cj4+ICAgICAgICAgIHJlZy0+c3RhcnQgPSAwOwo+PiAg
ICAgICAgICByZXR1cm4gMDsKPj4gICB9Cj4+IEBAIC0xMTIsNiArMTE1LDcgQEAgbnYwNF9nYXJ0
X21hbmFnZXJfbmV3KHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLAo+PiAgICAgICAg
ICBpZiAocmV0KQo+PiAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4+Cj4+ICsgICAgICAg
dHRtX3Jlc291cmNlX2luaXQoYm8sIHBsYWNlLCByZWctPm1tX25vZGUpOwo+PiAgICAgICAgICBy
ZXQgPSBudmlmX3ZtbV9nZXQoJm1lbS0+Y2xpLT52bW0udm1tLCBQVEVTLCBmYWxzZSwgMTIsIDAs
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAobG9uZylyZWctPm51bV9wYWdlcyA8PCBQ
QUdFX1NISUZULCAmbWVtLT52bWFbMF0pOwo+PiAgICAgICAgICBpZiAocmV0KSB7Cj4+IC0tCj4+
IDIuMjUuMQo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
