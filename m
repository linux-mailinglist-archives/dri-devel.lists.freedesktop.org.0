Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89E2C2BC4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 16:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628906E43C;
	Tue, 24 Nov 2020 15:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B73E6E43C;
 Tue, 24 Nov 2020 15:50:08 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z7so6988974wrn.3;
 Tue, 24 Nov 2020 07:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vEHV5NzbwJ9itZIOZg0YcV4vFlrMnth6sSMm0U/4U18=;
 b=HmasDWuex7mGSrEPKku7nbQd9pKEB0VIF/ooeC/H8gEFqGk0eOPrQOD7ULPnDUW1nF
 SEBqUzIDs3Q/b4NtGdRpz/Rhjt2mKTIMKQ/ifjbi9gBPMU8wshfy2o52ODxvXErCmkHS
 LSs2gJj3neMlfzcdel0xGs2Utc1QXnq9guR+oZcGhRV1t+vq/PhmAWj5+0XzOBXYJLk0
 uv5YY4FHNZrt29KHEjCtTqNnmmYAPLqKDfCqwCUejkQfGt9YcZO948F5E0Yw6DVf30zb
 TxP180NnVt7lApqwkS/V7cOWZq8z9wyZrytoGbrXfWOzu1Nw6Pg+rA2xEfAv8tiyu7Nb
 73tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vEHV5NzbwJ9itZIOZg0YcV4vFlrMnth6sSMm0U/4U18=;
 b=UontRkIyretuUzmrS4mNym+MTPjhozWi9aCHYNqtd6LmpJ2aSyByBhZTTMujhKikAq
 T948HvUkpx+vnEplYGECX+dTiIuuPbmCE082WoOl8Za6jznFjkv3Ci4NFzaV2LXu82tD
 OX+bOEECiKFb/3pP6z+wV37GXuftlU/vngmAmFOZ5EUfOSsfwmNiYFHchgIwESE4fDp1
 vIoLwLKWjBpJ8QAQWgedE3MlNBU+SRSz1DWXoMhtsEbSsT2eybxxqHydtuiYYKn3lQNc
 v12FTv+VR8QyLlDeeTrilGPIdR3lTM0va9x+LGyRgyjj5oEjOvAlyBB4FXD3qutKzwDY
 Q+WQ==
X-Gm-Message-State: AOAM533pGqLYPjG6OZ/qe+dqMW59WxlULT8ZVkl/5L2i8eXuM7/nJEa+
 o9mp7REcZz97Zl3pqyUd9LH3NErCb414qNXOhq8=
X-Google-Smtp-Source: ABdhPJzerQP49Kf7yuyCXUUv4/+uMPHMJ+Frw4C4JWUo8vpK1xvcKt1uN5gVCEtR/4wUmA2B3xr5/nsHrOl93j4H360=
X-Received: by 2002:a5d:400a:: with SMTP id n10mr5940385wrp.362.1606233007147; 
 Tue, 24 Nov 2020 07:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-4-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-4-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 10:49:56 -0500
Message-ID: <CADnq5_P=4f5gq+mS358d0zGEB6yr0PGruAKKLoiiEb9hq30thg@mail.gmail.com>
Subject: Re: [PATCH 03/40] drm/amd/amdgpu/amdgpu_ib: Provide docs for
 'amdgpu_ib_schedule()'s 'job' param
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoxOSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jOjEy
Nzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnam9iJyBub3QgZGVzY3Jp
YmVkIGluICdhbWRncHVfaWJfc2NoZWR1bGUnCj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3Vt
aXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtbWVkaWFA
dmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAg
VGhhbmtzIQoKQWxleAoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9pYi5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKPiBpbmRleCBjNjlhZjliODZjYzYwLi4wMjRk
MGE1NjNhNjUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9pYi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKPiBA
QCAtMTA2LDYgKzEwNiw3IEBAIHZvaWQgYW1kZ3B1X2liX2ZyZWUoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfaWIgKmliLAo+ICAgKiBAcmluZzogcmluZyBpbmRleCB0
aGUgSUIgaXMgYXNzb2NpYXRlZCB3aXRoCj4gICAqIEBudW1faWJzOiBudW1iZXIgb2YgSUJzIHRv
IHNjaGVkdWxlCj4gICAqIEBpYnM6IElCIG9iamVjdHMgdG8gc2NoZWR1bGUKPiArICogQGpvYjog
am9iIHRvIHNjaGVkdWxlCj4gICAqIEBmOiBmZW5jZSBjcmVhdGVkIGR1cmluZyB0aGlzIHN1Ym1p
c3Npb24KPiAgICoKPiAgICogU2NoZWR1bGUgYW4gSUIgb24gdGhlIGFzc29jaWF0ZWQgcmluZyAo
YWxsIGFzaWNzKS4KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
