Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B9030941F
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 11:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557C46E03F;
	Sat, 30 Jan 2021 10:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3121C6E03F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 10:12:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6A3264E05
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612001567;
 bh=N5xKQ7D7bbQAxoHSV1A03B0Qf2d9erN8a0kxiDAMWXY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sILany1Q3l1Jka8eKGJzp3yNvZKM0f5gBIlD0J+NN8OVmOWwd5eZi3uPadHSGgbuG
 zsswNk+/phPYZITk+uJtLtu6lBHIq+oBpyW8v7gzWruu/R/YPPQdcC15/OCILWtKnr
 ppC1cwLnxUKC3GmIXjXUTQzZcwa/57amfKpah9NeUlFcDMDSVkjNtmZmLrCaPH6Kpg
 ggVA7OrfefeR+w1mEaDGWQlT5AKhKBMprjTfINxohGWX9k95y+pd9/0hxLWA0uavXl
 4QdOvq00nLCCxNoqBrKVyGepL7NVdbk3lzSKhqOJ3VssWOUl5MlGZUNxz+y+wBvfGR
 VtVQ5Oy3eXPzg==
Received: by mail-ej1-f44.google.com with SMTP id l9so16677680ejx.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 02:12:46 -0800 (PST)
X-Gm-Message-State: AOAM533VP7r09FQ99e9qdcmDUAMdCE5pI1yfu5Zwqy4RjhmXOWurrrJ5
 bLXDYS51xfIS1LIMVkBRwIxYlZD9TfTcWYrdLg==
X-Google-Smtp-Source: ABdhPJy//YfGdlHPfWkuPSgx+JETf8NnC/t1qkUJybbWz8gEYP7LSsFu1qKJhn/0GYHqhW+ASitPV/FrQ5rMLv8vrGQ=
X-Received: by 2002:a17:906:ada:: with SMTP id
 z26mr8516170ejf.127.1612001565308; 
 Sat, 30 Jan 2021 02:12:45 -0800 (PST)
MIME-Version: 1.0
References: <20210129092209.2584718-1-hsinyi@chromium.org>
 <20210129092209.2584718-6-hsinyi@chromium.org>
In-Reply-To: <20210129092209.2584718-6-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 30 Jan 2021 18:12:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8B_pca0GeJoASLOh1ROkErPZBJcew1N7+jZia7csHNMA@mail.gmail.com>
Message-ID: <CAAOTY_8B_pca0GeJoASLOh1ROkErPZBJcew1N7+jZia7csHNMA@mail.gmail.com>
Subject: Re: [PATCH v13 5/8] drm/mediatek: add has_dither private data for
 gamma
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx
5bm0MeaciDI55pelIOmAseS6lCDkuIvljYg1OjIz5a+r6YGT77yaCj4KPiBGcm9tOiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPgo+IE5vdCBhbGwgU29DIGhhcyBk
aXRoZXIgZnVuY3Rpb24gaW4gZ2FtbWEgbW9kdWxlLgo+IEFkZCBwcml2YXRlIGRhdGEgdG8gY29u
dHJvbCB0aGlzIGZ1bmN0aW9uIHNldHRpbmcuCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0
IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0
CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUg
PHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2Fu
ZyA8aHNpbnlpQGNocm9taXVtLm9yZz4KPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlh
dGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1h
LmMgfCAxNCArKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3BfZ2FtbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9n
YW1tYS5jCj4gaW5kZXggNmI1MjA4MDc5MjFlMy4uNTA5MmEyN2NjYzI4YiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jCj4gQEAgLTI3LDcgKzI3LDcgQEAK
PiAgI2RlZmluZSBMVVRfMTBCSVRfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAweDAzZmYK
Pgo+ICBzdHJ1Y3QgbXRrX2Rpc3BfZ2FtbWFfZGF0YSB7Cj4gLSAgICAgICB1MzIgcmVzZXJ2ZWQ7
Cj4gKyAgICAgICBib29sIGhhc19kaXRoZXI7Cj4gIH07Cj4KPiAgLyoqCj4gQEAgLTkzLDggKzkz
LDkgQEAgdm9pZCBtdGtfZ2FtbWFfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQg
aW50IHcsCj4KPiAgICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIGggPDwgMTYgfCB3LCAm
Z2FtbWEtPmNtZHFfcmVnLCBnYW1tYS0+cmVncywKPiAgICAgICAgICAgICAgICAgICAgICAgRElT
UF9HQU1NQV9TSVpFKTsKPiAtICAgICAgIG10a19kaXRoZXJfc2V0X2NvbW1vbihnYW1tYS0+cmVn
cywgJmdhbW1hLT5jbWRxX3JlZywgYnBjLCBESVNQX0dBTU1BX0NGRywKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBHQU1NQV9ESVRIRVJJTkcsIGNtZHFfcGt0KTsKPiArICAgICAgIGlm
IChnYW1tYS0+ZGF0YSAmJiBnYW1tYS0+ZGF0YS0+aGFzX2RpdGhlcikKPiArICAgICAgICAgICAg
ICAgbXRrX2RpdGhlcl9zZXRfY29tbW9uKGdhbW1hLT5yZWdzLCAmZ2FtbWEtPmNtZHFfcmVnLCBi
cGMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBESVNQX0dBTU1BX0NG
RywgR0FNTUFfRElUSEVSSU5HLCBjbWRxX3BrdCk7Cj4gIH0KPgo+ICB2b2lkIG10a19nYW1tYV9z
dGFydChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gQEAgLTE3NCw4ICsxNzUsMTMgQEAgc3RhdGljIGlu
dCBtdGtfZGlzcF9nYW1tYV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
ICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9n
YW1tYV9kYXRhIG10ODE3M19nYW1tYV9kcml2ZXJfZGF0YSA9IHsKPiArICAgICAgIC5oYXNfZGl0
aGVyID0gdHJ1ZSwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IG10a19kaXNwX2dhbW1hX2RyaXZlcl9kdF9tYXRjaFtdID0gewo+IC0gICAgICAgeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1nYW1tYSJ9LAo+ICsgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1nYW1tYSIsCj4gKyAgICAgICAgIC5kYXRhID0g
Jm10ODE3M19nYW1tYV9kcml2ZXJfZGF0YX0sCj4gICAgICAgICB7fSwKPiAgfTsKPiAgTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgbXRrX2Rpc3BfZ2FtbWFfZHJpdmVyX2R0X21hdGNoKTsKPiAtLQo+
IDIuMzAuMC4zNjUuZzAyYmM2OTM3ODktZ29vZwo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+
IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
