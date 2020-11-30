Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2713B2C90FB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB086E902;
	Mon, 30 Nov 2020 22:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3293D6E902;
 Mon, 30 Nov 2020 22:26:29 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 11so12911202oty.9;
 Mon, 30 Nov 2020 14:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ELyTcX08LymPeenJIXXi/ZPMDQRwxk9oNbn6BfJ/r5o=;
 b=dSrhy5UQczAxydBaxnIin48cdsjDak8wLPUXxDuBp+tcQ9Ta/HCWMAkuMygGhCqhMz
 Uwu7K92Ep3Hf+sXE+e8XLMMEwLynUO6Ge3suxhvWnyWM2PmoiAQwOPwd1tNEp1tT/ssH
 4KycpbzWX/ywYQuc4tmkp+JrjizgTXDdv0Zg7l8NG7+hBVje1wj/ngV4UuutQpzSxhgY
 SZTwuBXRzPT01VI+otVFMKBymSPQsh9F356ghr1ICD6ZikvE3N9hSW9eLQo1XGBEr+CP
 KXDYo30Qf+vtU+Jvmftd9jXf8M32LP02OUUdjBKGG6ZIvso0fRBqAar9OYEXhIqrDg0i
 8Vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ELyTcX08LymPeenJIXXi/ZPMDQRwxk9oNbn6BfJ/r5o=;
 b=pCVDu9Yp+uSojF3giX347P1ShEre51YjoncFlAfSYA+u5lk3tzbRQPOXSls5U4uZPI
 omKnnbQKDM8kx/T0fKTr0HasqODTbfHpxqblJCuUnysSlrZd9v1i1mMmTim2ksAIpCrp
 HjLT6/nordTVa2cikh4J6LEF0nOz3uTYOF9/gM6U5DhEtWWPuVkP9B/FZ5/ijop41Iie
 wu0ahcYishGl0d3qOmfz1tXR/LwtkPcRYZFgSwttADi99neIjm8onfqUM1BIarRIFgav
 8XTeb9HdR+gRHRbX5unWswb/wDM5ydDKxUq5eiHIWpjs0+ZWM/rNihHu5YvxIq+Yc12+
 20iQ==
X-Gm-Message-State: AOAM5303BUh1GBgXzs9SwlBuAIzkWF98IySZXqgTOvVTurzOpadtFqGn
 0I3D9V96Gnm1Hb4ZrxpIZPpjkjpXO3TRJW4vYlM=
X-Google-Smtp-Source: ABdhPJyhogOwk85GqUih/K8lKuyluajJarfEg+XxKqk24TSWNaiPT1bDAc6sGbBpjoUmaGnLLEPc6a+mDBG/pq5B2Vw=
X-Received: by 2002:a9d:4713:: with SMTP id a19mr19192784otf.132.1606775188591; 
 Mon, 30 Nov 2020 14:26:28 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-20-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-20-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:26:17 -0500
Message-ID: <CADnq5_MY9MF2V9VG15F=cMtrn_aH1hcLGL5QidPz6b04gD-uEw@mail.gmail.com>
Subject: Re: [PATCH 19/40] drm/amd/amdgpu/sdma_v3_0: Fix incorrect param
 doc-rot issue
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

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjNfMC5jOjE2
NTE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2liJyBub3QgZGVzY3Jp
YmVkIGluICdzZG1hX3YzXzBfZW1pdF9jb3B5X2J1ZmZlcicKPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc2RtYV92M18wLmM6MTY1MTogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFt
ZXRlciAncmluZycgZGVzY3JpcHRpb24gaW4gJ3NkbWFfdjNfMF9lbWl0X2NvcHlfYnVmZmVyJwo+
Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNo
cmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENjOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8t
bW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjNfMC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3YzXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NkbWFfdjNfMC5jCj4gaW5kZXggNDM0MTBhN2JjY2MyNS4uOGNhN2ZiYTljMDM1ZiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3YzXzAuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjNfMC5jCj4gQEAgLTE2MzMsNyArMTYz
Myw3IEBAIHN0YXRpYyB2b2lkIHNkbWFfdjNfMF9zZXRfaXJxX2Z1bmNzKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQo+ICAvKioKPiAgICogc2RtYV92M18wX2VtaXRfY29weV9idWZmZXIgLSBj
b3B5IGJ1ZmZlciB1c2luZyB0aGUgc0RNQSBlbmdpbmUKPiAgICoKPiAtICogQHJpbmc6IGFtZGdw
dV9yaW5nIHN0cnVjdHVyZSBob2xkaW5nIHJpbmcgaW5mb3JtYXRpb24KPiArICogQGliOiBpbmRp
cmVjdCBidWZmZXIgdG8gY29weSB0bwo+ICAgKiBAc3JjX29mZnNldDogc3JjIEdQVSBhZGRyZXNz
Cj4gICAqIEBkc3Rfb2Zmc2V0OiBkc3QgR1BVIGFkZHJlc3MKPiAgICogQGJ5dGVfY291bnQ6IG51
bWJlciBvZiBieXRlcyB0byB4ZmVyCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
