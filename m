Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1235A24C52C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 20:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5B26E9AA;
	Thu, 20 Aug 2020 18:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF8A6E9AA;
 Thu, 20 Aug 2020 18:20:31 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a5so3018460wrm.6;
 Thu, 20 Aug 2020 11:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zx2aiS5u/hckouAkg5PnRRNt9/H2zFBAnmQ4nJmER3I=;
 b=gMZz2dINC8zpXVORxgXuG419lwuL2jppPFpi9E8y9ViJ5rFQVNH5ukaLokAx1UNnAk
 LnFjj1ja6vrOsfCmyvCtvycL5UbeTjrswVf/fz474oCsgo7KR4DwDs8+9yME2QzSyP1t
 btNlhjDwesjZHpPkIwvSAFxi/3ehi3qZZhRwoz1aMyqAsF+kD90DdJmoGoBYMl1yK/MX
 1wieGOerjuYByQQswCybYzTMyJ+NRHx4ec4IWNJs8+7licRAvCwVBOLRJwCWxHFjcfS/
 aJ+seiC59nGep1PKg4bc8wt71F4XQ/swv4ch3ygt87iK0ZLccKXrRsjnwDF9FQbmOMRP
 lSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zx2aiS5u/hckouAkg5PnRRNt9/H2zFBAnmQ4nJmER3I=;
 b=uluvB1w9LU+HxsiH39Ibu66OcHlTf6wRJxrxj68xW/IQluVGcyA7cjbYKdKrWRqT26
 x4OOBa1O+m2fQIUJtpzA+SQKkYbwWJe/+GCOHwGdwetIIZmr65tIrIh859eecfQOvlEL
 NtWXh7K7QiuVco3H8MZRK8P2NSzyBB2Bvx/VFeWHA8tQIp38LOkhZBxrvv4qMOGCdcl1
 zGG5fRJQ4vwmjfNR37LlQuzTmz5sdQPoeial8R7aDA/h9eUhcgRo5Kc90UE1lHjBsHQX
 BDcgJI0CtCGOUz9Vdn+PYGiGWT8YYQge8NP8l+iD6PQ0HX0k8wx8f6txNbCT05B06IOf
 hX0A==
X-Gm-Message-State: AOAM532gPYJeTjcsXoU/LINQDgNO43I7Np0zb9WRBicEQ8UY+Mo12X33
 XUAMISEOUJzFmA7LsDHYKUAJOLm59/xwQaneB+E=
X-Google-Smtp-Source: ABdhPJyCgPFZTTFbee2LsSre9fQTTAa/kvTeNAYYXu+7XbLwA7kVTe9RGC+WZR3sqKRc/e35BaY8uJLdg3H4gsxzS/w=
X-Received: by 2002:adf:a351:: with SMTP id d17mr4280713wrb.111.1597947629882; 
 Thu, 20 Aug 2020 11:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200820052600.3069895-1-furquan@google.com>
 <20200820075241.3160534-1-furquan@google.com>
 <5c7dbcd6-b4c5-f7e5-40d5-b65d8ff58030@amd.com>
In-Reply-To: <5c7dbcd6-b4c5-f7e5-40d5-b65d8ff58030@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Aug 2020 14:20:18 -0400
Message-ID: <CADnq5_NEoM1RGoLS=a0HDtN20rOvKndiYCFRnzrc3JQn5ePzpQ@mail.gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: amd: Initialize amdgpu_dm_backlight_caps
 object to 0 in amdgpu_dm_update_backlight_caps
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
Cc: Stylon Wang <stylon.wang@amd.com>, deepak.sharma@amd.com,
 Furquan Shaikh <furquan@google.com>, Leo Li <sunpeng.li@amd.com>,
 adurbin@google.com, Roman Li <roman.li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFRodSwgQXVnIDIwLCAyMDIwIGF0IDU6MDEgQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFt
IDIwLjA4LjIwIHVtIDA5OjUyIHNjaHJpZWIgRnVycXVhbiBTaGFpa2g6Cj4gPiBJbiBgYW1kZ3B1
X2RtX3VwZGF0ZV9iYWNrbGlnaHRfY2FwcygpYCwgdGhlcmUgaXMgYSBsb2NhbAo+ID4gYGFtZGdw
dV9kbV9iYWNrbGlnaHRfY2Fwc2Agb2JqZWN0IHRoYXQgaXMgZmlsbGVkIGluIGJ5Cj4gPiBgYW1k
Z3B1X2FjcGlfZ2V0X2JhY2tsaWdodF9jYXBzKClgLiBIb3dldmVyLCB0aGlzIG9iamVjdCBpcwo+
ID4gdW5pbml0aWFsaXplZCBiZWZvcmUgdGhlIGNhbGwgYW5kIGhlbmNlIHRoZSBzdWJzZXF1ZW50
IGNoZWNrIGZvcgo+ID4gYXV4X3N1cHBvcnQgY2FuIGZhaWwgc2luY2UgaXQgaXMgbm90IGluaXRp
YWxpemVkIGJ5Cj4gPiBgYW1kZ3B1X2FjcGlfZ2V0X2JhY2tsaWdodF9jYXBzKClgIGFzIHdlbGwu
IFRoaXMgY2hhbmdlIGluaXRpYWxpemVzCj4gPiB0aGlzIGxvY2FsIGBhbWRncHVfZG1fYmFja2xp
Z2h0X2NhcHNgIG9iamVjdCB0byAwLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZ1cnF1YW4gU2hh
aWtoIDxmdXJxdWFuQGdvb2dsZS5jb20+Cj4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4gPiAtLS0KPiA+IHYyOiBTd2l0Y2hlZCB0
byB1c2luZyBtZW1zZXQgZm9yIGluaXRpYWxpemF0aW9uIG9mIG9iamVjdC4KPiA+Cj4gPiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMiArKwo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gPiBpbmRleCBlNGIz
M2M2N2I2MzQuLmRhMDcyOTk4Y2U0OCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiA+IEBAIC0yODU1LDYgKzI4NTUs
OCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1fdXBkYXRlX2JhY2tsaWdodF9jYXBzKHN0cnVjdCBh
bWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSkKPiA+ICAgI2lmIGRlZmluZWQoQ09ORklHX0FDUEkp
Cj4gPiAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RtX2JhY2tsaWdodF9jYXBzIGNhcHM7Cj4gPgo+ID4g
KyAgICAgbWVtc2V0KCZjYXBzLCAwLCBzaXplb2YoY2FwcykpOwo+ID4gKwo+ID4gICAgICAgaWYg
KGRtLT5iYWNrbGlnaHRfY2Fwcy5jYXBzX3ZhbGlkKQo+ID4gICAgICAgICAgICAgICByZXR1cm47
Cj4gPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
