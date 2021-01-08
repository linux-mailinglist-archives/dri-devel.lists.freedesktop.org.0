Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B812D2EFA66
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 22:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F039D89449;
	Fri,  8 Jan 2021 21:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9836689449;
 Fri,  8 Jan 2021 21:25:54 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id r9so11015982otk.11;
 Fri, 08 Jan 2021 13:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3U/EHOfY39AcbryurHHctLCFf/TUx0axlocAKoUFaDI=;
 b=LCIs9PMXFfP78WpjYndzNMd8DpHcKjZQQp7JySp+4RY/5Hw0lfJeyAEsYrZr64ht7B
 J1nyPIZjHf8aGQxSiiIP6tz2PH8D/dYZSYbRSR1+PHVM+/kaUEbiYVrcRoHfxPqe77co
 3IxZYupa+zE0azrsoomWE0e/jB1q5uN2yFtTmPtzbPnMn4U5HdiJqpiMomiN1dXP7PM6
 qqtE/MN3qZai3zZydN9OlkuIhadi0LeXWyJ4bb0Oyv96hl6timf8UY8s9aWVkuSq0x7d
 0vXdEt/y3C0A1f6J9xUU61s7UUoT8lardtzwtDzk90XhdVPpcLD7WOCVkQ3HFm+hDDO3
 zdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3U/EHOfY39AcbryurHHctLCFf/TUx0axlocAKoUFaDI=;
 b=hmpE264hexLWfBF06hZra8G85VETuaJG/CA6zxPKpW29LA8v2aGHB667XydpeNFAhY
 YVCFjxezZpL5ydf04pVZgSpf3buxupxQtoj7qqvn/KFwd4fZrG98PTxg8Pw10Zkm78sd
 4+klkQIRKbH4b30f9hu+EjICvvbf/qKPh3H56e7gHy/DgcrNix09chlQh/jOlXVSMajG
 9enHBb+yD0e/0OiWU5TBlqn1UHopVYPYodngsEhULBZdKMHmiwa9phEBGZUpF4IiTq7j
 YpwNCn7eZce0tnyagAnD4vaDNOPDrRDtoTO9rM3h5svuaXexvRsgr34ZfJoyY33tRedF
 8MqA==
X-Gm-Message-State: AOAM533nqgX/Z97PgX6I5tl2yEUqtsuPiBIan2t3NWM0R07s3WchOkF1
 eCZI7XmPKvxd+yeDVQ5Ep2i3XWVW4bZIPErKxQk=
X-Google-Smtp-Source: ABdhPJzY43R3m7sa4CM/3MJzsT5LjVm/tO/tr1JBRDf2CaqbzL47ScVnjFGSeZYBaWMzq0x1DgaR3b8Fqmc9RSyXMtw=
X-Received: by 2002:a05:6830:1d66:: with SMTP id
 l6mr3906537oti.23.1610141153981; 
 Fri, 08 Jan 2021 13:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-39-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-39-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 16:25:42 -0500
Message-ID: <CADnq5_OMbx2RnpYXhprGUXNQAxwKjB3eEiWgFjwDW3+hurQVsQ@mail.gmail.com>
Subject: Re: [PATCH 38/40] drm/amd/display/dc/dce/dce_panel_cntl: Remove
 unused variables 'bl_pwm_cntl' and 'pwm_period_cntl'
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE2IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9k
Y2UvZGNlX3BhbmVsX2NudGwuYzogSW4gZnVuY3Rpb24g4oCYZGNlX2dldF8xNl9iaXRfYmFja2xp
Z2h0X2Zyb21fcHdt4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5
L2RjL2RjZS9kY2VfcGFuZWxfY250bC5jOjU0OjExOiB3YXJuaW5nOiB2YXJpYWJsZSDigJhibF9w
d21fY250bOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2VfcGFuZWxf
Y250bC5jOjUzOjExOiB3YXJuaW5nOiB2YXJpYWJsZSDigJhwd21fcGVyaW9kX2NudGzigJkgc2V0
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+IENjOiBIYXJyeSBX
ZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExpIDxzdW5wZW5nLmxp
QGFtZC5jb20+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
PiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+IENjOiBBbnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNvbT4KPiBD
YzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfcGFuZWxfY250bC5jIHwgOCArKysrLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX3BhbmVsX2NudGwuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX3BhbmVsX2NudGwuYwo+IGlu
ZGV4IDc2MWZkZmMxZjViZDAuLmU5MjMzOTIzNTg2MzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfcGFuZWxfY250bC5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfcGFuZWxfY250bC5jCj4gQEAgLTUwLDE2
ICs1MCwxNiBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGRjZV9nZXRfMTZfYml0X2JhY2tsaWdodF9m
cm9tX3B3bShzdHJ1Y3QgcGFuZWxfY250bCAqcGFuZWxfYwo+ICB7Cj4gICAgICAgICB1aW50NjRf
dCBjdXJyZW50X2JhY2tsaWdodDsKPiAgICAgICAgIHVpbnQzMl90IHJvdW5kX3Jlc3VsdDsKPiAt
ICAgICAgIHVpbnQzMl90IHB3bV9wZXJpb2RfY250bCwgYmxfcGVyaW9kLCBibF9pbnRfY291bnQ7
Cj4gLSAgICAgICB1aW50MzJfdCBibF9wd21fY250bCwgYmxfcHdtLCBmcmFjdGlvbmFsX2R1dHlf
Y3ljbGVfZW47Cj4gKyAgICAgICB1aW50MzJfdCBibF9wZXJpb2QsIGJsX2ludF9jb3VudDsKPiAr
ICAgICAgIHVpbnQzMl90IGJsX3B3bSwgZnJhY3Rpb25hbF9kdXR5X2N5Y2xlX2VuOwo+ICAgICAg
ICAgdWludDMyX3QgYmxfcGVyaW9kX21hc2ssIGJsX3B3bV9tYXNrOwo+ICAgICAgICAgc3RydWN0
IGRjZV9wYW5lbF9jbnRsICpkY2VfcGFuZWxfY250bCA9IFRPX0RDRV9QQU5FTF9DTlRMKHBhbmVs
X2NudGwpOwo+Cj4gLSAgICAgICBwd21fcGVyaW9kX2NudGwgPSBSRUdfUkVBRChCTF9QV01fUEVS
SU9EX0NOVEwpOwo+ICsgICAgICAgUkVHX1JFQUQoQkxfUFdNX1BFUklPRF9DTlRMKTsKPiAgICAg
ICAgIFJFR19HRVQoQkxfUFdNX1BFUklPRF9DTlRMLCBCTF9QV01fUEVSSU9ELCAmYmxfcGVyaW9k
KTsKPiAgICAgICAgIFJFR19HRVQoQkxfUFdNX1BFUklPRF9DTlRMLCBCTF9QV01fUEVSSU9EX0JJ
VENOVCwgJmJsX2ludF9jb3VudCk7Cj4KPiAtICAgICAgIGJsX3B3bV9jbnRsID0gUkVHX1JFQUQo
QkxfUFdNX0NOVEwpOwo+ICsgICAgICAgUkVHX1JFQUQoQkxfUFdNX0NOVEwpOwo+ICAgICAgICAg
UkVHX0dFVChCTF9QV01fQ05UTCwgQkxfQUNUSVZFX0lOVF9GUkFDX0NOVCwgKHVpbnQzMl90ICop
KCZibF9wd20pKTsKPiAgICAgICAgIFJFR19HRVQoQkxfUFdNX0NOVEwsIEJMX1BXTV9GUkFDVElP
TkFMX0VOLCAmZnJhY3Rpb25hbF9kdXR5X2N5Y2xlX2VuKTsKPgo+IC0tCj4gMi4yNS4xCj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
