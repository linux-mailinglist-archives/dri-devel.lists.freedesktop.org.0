Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FA72B524B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86956EA68;
	Mon, 16 Nov 2020 20:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5570E6EA68;
 Mon, 16 Nov 2020 20:18:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m125so527211wmm.3;
 Mon, 16 Nov 2020 12:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KZqmqxGqPK6VqNKe9Ti7XDUAlbTj58Qlz19pJExVnTg=;
 b=WRhGpWlqfJmtZNu+7ZH0F+HTmN8/hlYuP0qNGssvoKwOO0BGmSRkgQeqgqoNs1Rrh7
 VKldvTx5KTH8KQcAWaG6i/KddlYj/hLqbUOwntTP4tQD5I5VonYa/lPgILs0eitBSbkY
 WGkMdRFZtEafSgNBBa4ODW3XVr+J5hcIE1N08nuV0F3qqUt4ikeLPcgZMZuAGlRnCgjQ
 89sTP+moowpUOJTis6WPeb/Gza6WymJ14/EjKs9/kdm661g3jf50tBQ0c/aqONUJSzNb
 dGB0KE0Ui0WFOau6u9sL+e5OYz7nQI9PmblG3GNzcx7RplaTzDegH0urGRs2+N50ZCoC
 7T8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KZqmqxGqPK6VqNKe9Ti7XDUAlbTj58Qlz19pJExVnTg=;
 b=KoTS2SbiZt/BNV++kolqj3Noeawo+PZW8fKBDK82eRY2+Pi1uwJpw6wlQ44FFqFAbl
 cFt9uhnireGKIG6JQbJ3BqKuioAGEUjkpTGxYMBY4IBT7BN5bbBXmrksNch+1BmjPO7x
 2Ri6DCDmuYQPwUEAaQeqlU0vWb1mmy4mA6wGaC1iAVep+eLqGbGrB5DzTjslqMHuqRps
 K75VVSW99vlfOfa0aUdwNmSkiYorC3hXYgmhoUJjJW1aKMmzfvPAlTtxGP2VokbDCNok
 WZkaGj3VEL0a47yEf6BcDh8UZJZn2kcwwZNZk/2m5K5CQILFGTvBWvqR8Ay3oZvfA5KW
 50AQ==
X-Gm-Message-State: AOAM5307wrFyBfH6VCTynmmRc0NVcjAeQIsR2Gs0QEaed4V8BtsXSGkt
 zIEn9hTZlNHeMtoLw1FvM/9K390DRkqh30tSKbc=
X-Google-Smtp-Source: ABdhPJx4roMbFetpimCkZH90Ul1OHwO/R2XgPJbf1k+dtb8PTmQA6kOW6k5lSJ5rYaS7N5zpUEM+MjKICosYXe3rsVc=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr613978wmb.39.1605557888058;
 Mon, 16 Nov 2020 12:18:08 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org>
 <20201116173700.1830487-25-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-25-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 15:17:56 -0500
Message-ID: <CADnq5_M2P-nnRON_r2=JTvmxCwj+mcO2zMOtcLUOwYLXpSB-VA@mail.gmail.com>
Subject: Re: [PATCH 24/43] drm/radeon/r600: Move 'evergreen_rlc_resume()'s
 prototype to shared header
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

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzggUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5jOjQzODA6
NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhldmVyZ3JlZW5fcmxjX3Jl
c3VtZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDQzODAgfCBpbnQgZXZlcmdyZWVuX3Js
Y19yZXN1bWUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4gIHwgXn5+fn5+fn5+fn5+fn5+
fn5+fn4KPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4g
Q2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uaCB8IDEgKwo+ICBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3I2MDAuYyAgICAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vZXZlcmdyZWVuLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5oCj4g
aW5kZXggZWI0NmFjNzc3Njk1MS4uZjhkNzcyZTYxMmE0OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9ldmVyZ3JlZW4uaAo+IEBAIC00OCw1ICs0OCw2IEBAIHZvaWQgZXZlcmdyZWVuX2dwdV9wY2lf
Y29uZmlnX3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKPiAgdTMyIGV2ZXJncmVl
bl9nZXRfbnVtYmVyX29mX2RyYW1fY2hhbm5lbHMoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYp
Owo+ICB2b2lkIGV2ZXJncmVlbl9wcmludF9ncHVfc3RhdHVzX3JlZ3Moc3RydWN0IHJhZGVvbl9k
ZXZpY2UgKnJkZXYpOwo+ICB1MzIgZXZlcmdyZWVuX2dwdV9jaGVja19zb2Z0X3Jlc2V0KHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2KTsKPiAraW50IGV2ZXJncmVlbl9ybGNfcmVzdW1lKHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2KTsKPgo+ICAjZW5kaWYgICAgICAgICAgICAgICAgICAgICAg
ICAgLyogX19SQURFT05fRVZFUkdSRUVOX0hfXyAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3I2MDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jCj4gaW5k
ZXggOTRlODgxNWU1MDY3ZC4uYjQ0ZTBjNjA3YjFiMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3I2MDAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5j
Cj4gQEAgLTM5LDYgKzM5LDcgQEAKPgo+ICAjaW5jbHVkZSAiYXRvbS5oIgo+ICAjaW5jbHVkZSAi
YXZpdm9kLmgiCj4gKyNpbmNsdWRlICJldmVyZ3JlZW4uaCIKPiAgI2luY2x1ZGUgInI2MDAuaCIK
PiAgI2luY2x1ZGUgInI2MDBkLmgiCj4gICNpbmNsdWRlICJydjc3MC5oIgo+IEBAIC0xMTMsNyAr
MTE0LDYgQEAgc3RhdGljIHZvaWQgcjYwMF9ncHVfaW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAq
cmRldik7Cj4gIHZvaWQgcjYwMF9maW5pKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKPiAg
dm9pZCByNjAwX2lycV9kaXNhYmxlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKPiAgc3Rh
dGljIHZvaWQgcjYwMF9wY2llX2dlbjJfZW5hYmxlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2
KTsKPiAtZXh0ZXJuIGludCBldmVyZ3JlZW5fcmxjX3Jlc3VtZShzdHJ1Y3QgcmFkZW9uX2Rldmlj
ZSAqcmRldik7Cj4KPiAgLyoKPiAgICogSW5kaXJlY3QgcmVnaXN0ZXJzIGFjY2Vzc29yCj4gLS0K
PiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
