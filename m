Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5878B2B524F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D086EA6C;
	Mon, 16 Nov 2020 20:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06DE6EA6C;
 Mon, 16 Nov 2020 20:18:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m6so3036032wrg.7;
 Mon, 16 Nov 2020 12:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IM7NWRlhjN4K8P7uYjUrC25oig+0uft9W8EZBn+WlIQ=;
 b=B3i1aLF2lvlTWTWrdBJMUqCbZZdYnHF5UUcOAMwwSCcz9Ka08DjBxsRRTrf3yVRLa9
 wry6M8fS+Nz2djFxfl5ahP3IAm8icWSztlkXNBNEnQaVxbYRktxYo37gSomTwQf93m3L
 2fJKehez9p10/1sE8sKooXyLzwJ3XKPq9eI3T6xp9M+Dcxt8xuszNd5Id0thPbUP198E
 zp+Yf9bgR+hkX2wGDFh9VIlxWUCe76EdWeQ0eiN5jzJ3EfGSc+4Sv8rtokhNvZPHFHbr
 0NWm2NGYZ7YHM1csrUApTHbVlseUxYNus687h/XclzmhED+mTobAnrBVasuPBVvRSKur
 4XyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IM7NWRlhjN4K8P7uYjUrC25oig+0uft9W8EZBn+WlIQ=;
 b=DaZcYjspJ2nsKKSz0JiVDrZxYiSrhdZhY+Im557btAlZX2IZIcd4H6Wf8zZLKae9Tf
 MzHa83mh+WiS2tBuPDEMFNrs3X4px7uw/sXfKSt5nc0UbaKvjH0tadct4F0k8BQSnYZh
 AdWEEPtLI560BWdu2YI0qKJH3eSK6Jp03n0GmfZSImOp8xxCCeNKcMdD1v/G0p+3Iaeu
 QccBLmJHcocCZmGR6SDho0TCKf8QBThGT40QoQWC3zRiqv4a44Rrymdtixf6/gdC9Zy4
 hRDPrOknC9G/lSruvg61GqsJMmuo+mO8Lc1kFujjsbL5Zku0nVaAY9VqtqrDgGe7jEVv
 I/fg==
X-Gm-Message-State: AOAM532/kM6u/HxL/dfyOf6LSo9PWDHw0rKtNhsI0lbADxzD8GrhAMEh
 rYBkG0J2jZzV73RAAsLqZNNUDSX1nNPQ5iXeee0=
X-Google-Smtp-Source: ABdhPJyUgjWzdvSkRQM+bwGZL8vBxQBi4Lmh6MP4R70VxPjwwcC6lb8Xy7gUJsTqSM6O19H8SC9JxSJW65m3IhN+VT0=
X-Received: by 2002:adf:8028:: with SMTP id 37mr20979051wrk.111.1605557934489; 
 Mon, 16 Nov 2020 12:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org>
 <20201116173700.1830487-26-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-26-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 15:18:43 -0500
Message-ID: <CADnq5_NBngYNZyk0q=X59DuXcGm_kkwTqvEy7cuQfvpEMNwqBg@mail.gmail.com>
Subject: Re: [PATCH 25/43] drm/radeon/ni_dma: Move
 'cayman_gpu_check_soft_reset()'s prototype to shared header
To: Lee Jones <lee.jones@linaro.org>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzcgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmM6MTczMzo1OiB3YXJu
aW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGNheW1hbl9ncHVfY2hlY2tfc29mdF9y
ZXNldOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDE3MzMgfCB1MzIgY2F5bWFuX2dwdV9j
aGVja19zb2Z0X3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQo+ICB8IF5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fgo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1i
eTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpB
bGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmggICAgIHwgMSArCj4gIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vbmlfZG1hLmMgfCAzICstLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL25pLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmgKPiBpbmRl
eCBkNjNiZTFjODhjMGYxLi45YTVmMzFhMDVlNjhmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vbmkuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vbmkuaAo+IEBA
IC0zNCw1ICszNCw2IEBAIHZvaWQgY2F5bWFuX2NwX2ludF9jbnRsX3NldHVwKHN0cnVjdCByYWRl
b25fZGV2aWNlICpyZGV2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCByaW5n
LCB1MzIgY3BfaW50X2NudGwpOwo+ICB2b2lkIGNheW1hbl92bV9kZWNvZGVfZmF1bHQoc3RydWN0
IHJhZGVvbl9kZXZpY2UgKnJkZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBz
dGF0dXMsIHUzMiBhZGRyKTsKPiArdTMyIGNheW1hbl9ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4KPiAgI2VuZGlmICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIF9fTklfSF9fICovCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
bmlfZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pX2RtYS5jCj4gaW5kZXggYzU2MTM2
ODQ4MzYwZS4uYmQ1MTVhZDRmZTRjYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL25pX2RtYS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9uaV9kbWEuYwo+IEBA
IC0yNSwxMCArMjUsOSBAQAo+ICAjaW5jbHVkZSAicmFkZW9uLmgiCj4gICNpbmNsdWRlICJyYWRl
b25fYXNpYy5oIgo+ICAjaW5jbHVkZSAicmFkZW9uX3RyYWNlLmgiCj4gKyNpbmNsdWRlICJuaS5o
Igo+ICAjaW5jbHVkZSAibmlkLmgiCj4KPiAtdTMyIGNheW1hbl9ncHVfY2hlY2tfc29mdF9yZXNl
dChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4gLQo+ICAvKgo+ICAgKiBETUEKPiAgICog
U3RhcnRpbmcgd2l0aCBSNjAwLCB0aGUgR1BVIGhhcyBhbiBhc3luY2hyb25vdXMKPiAtLQo+IDIu
MjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
