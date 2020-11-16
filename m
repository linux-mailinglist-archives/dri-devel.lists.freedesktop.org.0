Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CD02B5293
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECC86EA7A;
	Mon, 16 Nov 2020 20:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356AC6EA7A;
 Mon, 16 Nov 2020 20:30:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m6so3066253wrg.7;
 Mon, 16 Nov 2020 12:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2vtxLDeQFs22DLyz4HgL3Y6rVX8yzKCeFH63VG1kJnc=;
 b=YzHDmQhV8IZiKFs6HLlQL8HK1f8pwDImAv/xJixGC7lWR5Ui7Xkoihb90HJGbgNsjS
 eWosCBL8OIlMkFxXoJTj4wBwcgZaaPEufYhrDJh3jmlKxyapfsXIrUBXXp0LfemceYGZ
 vFhCCFyZQoXRjbLFt9qPt86H24/9Wbo5vU7i45qQkXjGBRwH9gMCVykRg4XzeAR3KATB
 0RpcxCxWoynHfETu2lbIZvKdGXvBLkSckPrKY12qJ52OvRFz67jofRDdgDPAgWrJiiwA
 hq7YTvfGlmVGHE7cizkOnEUL7j5iohoyHK/Jlx28wYwhqQ8PSrrNTqaty2gg6+sgRFLJ
 glQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2vtxLDeQFs22DLyz4HgL3Y6rVX8yzKCeFH63VG1kJnc=;
 b=NCGeAlg+EHO/3htvOBLI/4Fc5UZ7FJFfWznS16QzgMGjgU4N/73JoeKgPDQmHonub/
 CA/KdM43FUw7+YD+KOYtbXc+0mrIzvolzperT0WU9ZsPC5niK4BVxUiq+YmWn1d3F5Nf
 +axi6OJtguZKav+vOcXVrPsRV488vePceGiibvPgam/smBP5qTfLfB5s+hzB68ESDYBc
 H14wYp+Nwx8xihy8+vwUcCE45H57Dx0RpesV7DiwYH9RUiBhlFXabt08eSsUP2wMP+X9
 lY4R09dZaQmAA45hHtGcFEpgHXYxibJjZCVxSOnb9p1bjZGp+bpa+J82cwTxw2eI9rB4
 uY/g==
X-Gm-Message-State: AOAM532es4UJDSEyTbjD3mdSvuLLFfcqLF4ZKf6sHXg/KimUTdiVoM2v
 k9o5McXrhsF4ac5icZ5WQjfK3f8wwAJUArfvYis=
X-Google-Smtp-Source: ABdhPJzQyzKmwaeo9m1q1UQzRHFx4HER8YWwaP5gI+EXp+WUZYn7yh1oE0lHLgQFNd6FEJqrM9KCD9oQQE9vEthKYNE=
X-Received: by 2002:adf:9144:: with SMTP id j62mr4584626wrj.419.1605558651987; 
 Mon, 16 Nov 2020 12:30:51 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org>
 <20201116173700.1830487-35-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-35-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 15:30:41 -0500
Message-ID: <CADnq5_NEKQas7TZBiUrVHzJJ+0GrJD2AK+YbaDqArE50=ng7uA@mail.gmail.com>
Subject: Re: [PATCH 34/43] drm/radeon/evergreen: Move 'si_get_csb_*()'s
 prototypes to shared header
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
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmM6NTY3ODo1OiB3YXJu
aW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHNpX2dldF9jc2Jfc2l6ZeKAmSBbLVdt
aXNzaW5nLXByb3RvdHlwZXNdCj4gIDU2NzggfCB1MzIgc2lfZ2V0X2NzYl9zaXplKHN0cnVjdCBy
YWRlb25fZGV2aWNlICpyZGV2KQo+ICB8IF5+fn5+fn5+fn5+fn5+fgo+ICBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3NpLmM6NTcxMDo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9y
IOKAmHNpX2dldF9jc2JfYnVmZmVy4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgNTcxMCB8
IHZvaWQgc2lfZ2V0X2NzYl9idWZmZXIoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHZvbGF0
aWxlIHUzMiAqYnVmZmVyKQo+ICB8IF5+fn5+fn5+fn5+fn5+fn5+Cj4KPiBDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoK
QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
ZXZlcmdyZWVuLmMgfCAzICstLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmggICAgICAg
IHwgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYwo+IGluZGV4IDhmYjBiOGMzZGI1YjUu
LjQ1NzVlNDQ4ZTU5ZGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVy
Z3JlZW4uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmMKPiBAQCAt
NDEsNiArNDEsNyBAQAo+ICAjaW5jbHVkZSAicmFkZW9uX2FzaWMuaCIKPiAgI2luY2x1ZGUgInJh
ZGVvbl9hdWRpby5oIgo+ICAjaW5jbHVkZSAicmFkZW9uX3Vjb2RlLmgiCj4gKyNpbmNsdWRlICJz
aS5oIgo+Cj4gICNkZWZpbmUgRENfSFBEeF9DT05UUk9MKHgpICAgICAgICAoRENfSFBEMV9DT05U
Uk9MICAgICArICh4ICogMHhjKSkKPiAgI2RlZmluZSBEQ19IUER4X0lOVF9DT05UUk9MKHgpICAg
IChEQ19IUEQxX0lOVF9DT05UUk9MICsgKHggKiAweGMpKQo+IEBAIC0yMTgsOCArMjE5LDYgQEAg
dm9pZCBldmVyZ3JlZW5fcGNpZV9nZW4yX2VuYWJsZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
dik7Cj4gIHZvaWQgZXZlcmdyZWVuX3Byb2dyYW1fYXNwbShzdHJ1Y3QgcmFkZW9uX2RldmljZSAq
cmRldik7Cj4gIHZvaWQgY2lrX2luaXRfY3BfcGdfdGFibGUoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYpOwo+Cj4gLWV4dGVybiB1MzIgc2lfZ2V0X2NzYl9zaXplKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKPiAtZXh0ZXJuIHZvaWQgc2lfZ2V0X2NzYl9idWZmZXIoc3RydWN0IHJhZGVv
bl9kZXZpY2UgKnJkZXYsIHZvbGF0aWxlIHUzMiAqYnVmZmVyKTsKPiAgZXh0ZXJuIHUzMiBjaWtf
Z2V0X2NzYl9zaXplKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKPiAgZXh0ZXJuIHZvaWQg
Y2lrX2dldF9jc2JfYnVmZmVyKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCB2b2xhdGlsZSB1
MzIgKmJ1ZmZlcik7Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5o
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5oCj4gaW5kZXggZjQ4M2E2NGQxNzA1MC4uMzEw
YzU4Mzc2ZjkyNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmgKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmgKPiBAQCAtMzIsNSArMzIsNyBAQCB1MzIg
c2lfZ3B1X2NoZWNrX3NvZnRfcmVzZXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+ICB2
b2lkIHNpX3ZyYW1fZ3R0X2xvY2F0aW9uKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBzdHJ1
Y3QgcmFkZW9uX21jICptYyk7Cj4gIHZvaWQgc2lfcmxjX3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKPiAgdm9pZCBzaV9pbml0X3V2ZF9pbnRlcm5hbF9jZyhzdHJ1Y3QgcmFkZW9u
X2RldmljZSAqcmRldik7Cj4gK3UzMiBzaV9nZXRfY3NiX3NpemUoc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpOwo+ICt2b2lkIHNpX2dldF9jc2JfYnVmZmVyKHN0cnVjdCByYWRlb25fZGV2aWNl
ICpyZGV2LCB2b2xhdGlsZSB1MzIgKmJ1ZmZlcik7Cj4KPiAgI2VuZGlmICAgICAgICAgICAgICAg
ICAgICAgICAgIC8qIF9fU0lfSF9fICovCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
