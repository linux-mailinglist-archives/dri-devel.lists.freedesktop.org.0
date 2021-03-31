Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593CD34F67A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 04:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE956E9B3;
	Wed, 31 Mar 2021 02:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E8D6E9B2;
 Wed, 31 Mar 2021 02:06:01 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id x2so18555120oiv.2;
 Tue, 30 Mar 2021 19:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qeMcdT+CRbj8MN9wl9Xvhljc1oUDZd6u2VZN7SlxQEo=;
 b=rKlvRdGzaGNJW+L/dG8PZfKwqYB0SVrNLrkpqGi5JtMmVhR0ektQBTOpn4t1ZGmqia
 cHW2kYB0zVWYh4d9Wm+wQBy4Afu6m3SGfVEoygnk0BFYcKh6UJYQnnEy1xB5828e9I6I
 wR7B5GQmdS3q67/oyOeVVtb1GQj12BRjcC6PkntB1mrDskOGGQI2oTSPqPnvKcHXCYBs
 ukJp+PC8wB0QQZwp3Wbv/p1pmpj32X6S6g8PAWCv1zTdUn0H0cqXGf7Rhws7IgJoyLJx
 +F8j/88TnM/FoNgJrT2DZwJnMz6qfWKGPT80FOMflB4EBr2Qo2EQtkSMj1a++59G64m9
 GAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qeMcdT+CRbj8MN9wl9Xvhljc1oUDZd6u2VZN7SlxQEo=;
 b=o9KfN7LlQnMetwniiYwkgXt8QS/yA9/EAyVTkQJGHaqIn6lhRQsGFcFBcXXYW7RjFB
 bf+XhVvJNTBSULRhQ1MBtx/5/mdFqFa6AOSIU0ho8c3okcIj0Y9wY/Q1wKa/ADcAcIiB
 N+5P/aIu+uJuZDL7J6zRDCua6znO2wmodZ90W4mKmCJeZqf8hgwm3ewUoi7ywB0AV0km
 E5fGplw7MZCKcnCDcmcqlBWUKMYGqzEXkvayCdSfdc2kORNpX+TG3W2LCSTT571COYs+
 aNad/IiFgI64I50blsWcj7c54tdd9RDLPx558fGjUZbwua24mzfRXOgmBDE9YehTtpc+
 1XcQ==
X-Gm-Message-State: AOAM532mFqTMaDFeZvs9oJY3IlE3h6D9T1TpZ0lbgTYYqI/fybel46yL
 E9QT37UCP+P0uCPcSPxudeI4q6ns75DEcI1Aj3Q=
X-Google-Smtp-Source: ABdhPJz7DQZKRIQNF3Y+MK+QaA21Mi5zD4MaBqzLOHoMYHnmGevqb1Ge9xnPgseX1xda/SqjnVuAVJU2ggjpXK2Mhm4=
X-Received: by 2002:aca:4748:: with SMTP id u69mr594782oia.5.1617156360659;
 Tue, 30 Mar 2021 19:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210330153334.44570-1-xry111@mengyan1223.wang>
 <7c5e3a40-9889-1cc2-583d-51f8c3294908@amd.com>
In-Reply-To: <7c5e3a40-9889-1cc2-583d-51f8c3294908@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 30 Mar 2021 22:05:49 -0400
Message-ID: <CADnq5_MrsQfyS6eJdPrJEyHUQCM1=pP=jre7Ur6D8ULQj00P2w@mail.gmail.com>
Subject: Re: [PATCH 0/2] ensure alignment on CPU page for bo mapping
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Dan_Hor=C3=A1k?= <dan@danny.cz>, Huacai Chen <chenhuacai@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?B?WOKEuSBSdW95YW8=?= <xry111@mengyan1223.wang>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFR1ZSwgTWFyIDMwLCAyMDIxIGF0IDEyOjIxIFBN
IENocmlzdGlhbiBLw7ZuaWcKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBS
ZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiBm
b3IgdGhlIGVudGlyZQo+IHNlcmllcy4KPgo+IEFsZXggd2lsbCBwcm9iYWJseSBwaWNrIHRoZW0g
dXAgZm9yIHRoZSBuZXh0IGZlYXR1cmUgcHVsbCByZXF1ZXN0Lgo+Cj4gUmVnYXJkcywKPiBDaHJp
c3RpYW4uCj4KPiBBbSAzMC4wMy4yMSB1bSAxNzozMyBzY2hyaWViIFjihLkgUnVveWFvOgo+ID4g
SW4gQU1ER1BVIGRyaXZlciwgdGhlIGJvIG1hcHBpbmcgc2hvdWxkIGFsd2F5cyBhbGlnbiB0byBD
UFUgcGFnZSBvcgo+ID4gdGhlIHBhZ2UgdGFibGUgaXMgY29ycnVwdGVkLgo+ID4KPiA+IFRoZSBm
aXJzdCBwYXRjaCBpcyBjaGVycnktcGlja2VkIGZyb20gTG9vbmdzb24gY29tbXVuaXR5LCB3aGlj
aCBzZXRzIGEKPiA+IHN1aXRhYmxlIGRldl9pbmZvLmdhcnRfcGFnZV9zaXplIHNvIE1lc2Egd2ls
bCBoYW5kbGUgdGhlIGFsaWdubWVudAo+ID4gY29ycmVjdGx5Lgo+ID4KPiA+IFRoZSBzZWNvbmQg
cGF0Y2ggaXMgYWRkZWQgdG8gZW5zdXJlIGFuIGlvY3RsIHdpdGggdW5hbGlnbmVkIHBhcmFtZXRl
ciB0bwo+ID4gYmUgcmVqZWN0ZWQgLUVJTlZBTCwgaW5zdGVhZCBvZiBjYXVzaW5nIHBhZ2UgdGFi
bGUgY29ycnVwdGlvbi4KPiA+Cj4gPiBUaGUgcGF0Y2hlcyBzaG91bGQgYmUgYXBwbGllZCBmb3Ig
ZHJtLW5leHQuCj4gPgo+ID4gSHVhY2FpIENoZW4gKDEpOgo+ID4gICAgZHJtL2FtZGdwdTogU2V0
IGEgc3VpdGFibGUgZGV2X2luZm8uZ2FydF9wYWdlX3NpemUKPiA+Cj4gPiBY4oS5IFJ1b3lhbyAo
MSk6Cj4gPiAgICBkcm0vYW1kZ3B1OiBjaGVjayBhbGlnbm1lbnQgb24gQ1BVIHBhZ2UgZm9yIGJv
IG1hcAo+ID4KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jIHwg
NCArKy0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jICB8IDgg
KysrKy0tLS0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCj4gPgo+ID4KPiA+IGJhc2UtY29tbWl0OiBhMGM4YjE5M2JmZTgxY2M4ZTljN2MxNjJi
YjhkNzc3YmExMjU5NmYwCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
