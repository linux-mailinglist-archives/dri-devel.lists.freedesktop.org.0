Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426DE2C90D6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F6D6E8FB;
	Mon, 30 Nov 2020 22:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60EE6E8FB;
 Mon, 30 Nov 2020 22:20:20 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id l206so15953051oif.12;
 Mon, 30 Nov 2020 14:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+xii/CM8RmygCIt+QaUy7AnG00s6vO35LXvnr7JAkeY=;
 b=qvpTFABbvh0b34A8Ymd1yjwaxyPcDf33m1dzMGftsIq2eYr1pvdCjlDzFxw0JopDKz
 SG1kWafR6RC99C/5FKhMlcKT1GKVh48P5jO//AEo2XZy4EQrGZ39fWXVa6lUwEJhOcL8
 Dt53Rcaf+l1m4d2BMxscfrC+Kgfb0JcVnBqQGk7Hum/4WVP8WZ/C2plQu2nXj5znALzs
 rh8JlB8B7yE1BarKZ28j57R0rn8XrjA/VwiepPAE4FPTMMHzrBgRUS3D7lhu5vv0lYdJ
 vmDfASSgml0zca3mlvJ2hnPCUkG+zWDe0N6Kn6Ny72RM9TtYzpd5sdpA026h1yZR/aeo
 TYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+xii/CM8RmygCIt+QaUy7AnG00s6vO35LXvnr7JAkeY=;
 b=gfsOBsMM5rCs/t75lZm/t92EjU+RKvcev9tpANWPPnJQRPTeq7GXfPjJA91+Bq12x8
 A/juOdLfaVXDDmHP7ShxIy48Ea6u7xFQzbtWyzDudi4IOjlPx/96KVutEMEyOnhwa0EW
 FImXdiehAKxEkCumeFUTABDa0kj+DBHLaPWIBjpJciaELN2WyXJ/vcoSpvKe5AJa++hB
 UikrlgWH+iT662QvCLj11xjzB0RjR97586CpSl0b/FPk/BvdeTG0ei9BhhgGWnk9tXV5
 wfIMEgecVbtw6o4XvsN0oudATb1gdMF/vrCv8lyx/ZInxzcsFnugQjLKgJ0RUxNUrP6a
 h/3A==
X-Gm-Message-State: AOAM5310hW9Dqv0/Yh8c3Kf+wHwHdbM/iD0KhFcz2ZZHFIxQ7tfCuKJ2
 yFCtwQRoh/QK5Q2rJysaOB7QkglWzokeBBDbSMQ=
X-Google-Smtp-Source: ABdhPJzk0kwsPGBe+AGMcf76Sr+IFHJX7wXHRT4IV1q+OfBehvzRPc30BvZc/0mGAdJM3ot/vldyWtcPgFVUilMtcWc=
X-Received: by 2002:aca:4f53:: with SMTP id d80mr903002oib.120.1606774820130; 
 Mon, 30 Nov 2020 14:20:20 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-17-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-17-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:20:09 -0500
Message-ID: <CADnq5_Nhc-deK-BY_ede4Rbzru0U1xNy2X0nQ+9ZJU5BOz-uEw@mail.gmail.com>
Subject: Re: [PATCH 16/40] drm/amd/amdgpu/gfx_v10_0: Remove a bunch of set but
 unused variables
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

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jOiBJ
biBmdW5jdGlvbiDigJhnZnhfdjEwX3JsY2dfd3JlZ+KAmToKPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmM6MTQxNjoxODogd2FybmluZzogdmFyaWFibGUg4oCYZ3JibV9p
ZHjigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmM6MTQxNToxODogd2FybmluZzogdmFy
aWFibGUg4oCYZ3JibV9jbnRs4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jOjE0MTM6
MTU6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHNjcmF0Y2hfcmVnM+KAmSBzZXQgYnV0IG5vdCB1c2Vk
IFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjEwXzAuYzoxNDEyOjE1OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhzY3JhdGNoX3JlZzLi
gJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+IENjOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4g
S8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBD
YzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0Bs
aXN0cy5saW5hcm8ub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyB8IDkgLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMK
PiBpbmRleCBhNmQwMzkzMWY3ZmE0Li5kNDc2MGY0ZTI2OWExIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKPiBAQCAtMTQwOSwyMyArMTQwOSwxNCBAQCBzdGF0aWMg
dm9pZCBnZnhfdjEwX3JsY2dfd3JlZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdTMyIG9m
ZnNldCwgdTMyIHYpCj4gIHsKPiAgICAgICAgIHN0YXRpYyB2b2lkICpzY3JhdGNoX3JlZzA7Cj4g
ICAgICAgICBzdGF0aWMgdm9pZCAqc2NyYXRjaF9yZWcxOwo+IC0gICAgICAgc3RhdGljIHZvaWQg
KnNjcmF0Y2hfcmVnMjsKPiAtICAgICAgIHN0YXRpYyB2b2lkICpzY3JhdGNoX3JlZzM7Cj4gICAg
ICAgICBzdGF0aWMgdm9pZCAqc3BhcmVfaW50Owo+IC0gICAgICAgc3RhdGljIHVpbnQzMl90IGdy
Ym1fY250bDsKPiAtICAgICAgIHN0YXRpYyB1aW50MzJfdCBncmJtX2lkeDsKPiAgICAgICAgIHVp
bnQzMl90IGkgPSAwOwo+ICAgICAgICAgdWludDMyX3QgcmV0cmllcyA9IDUwMDAwOwo+Cj4gICAg
ICAgICBzY3JhdGNoX3JlZzAgPSBhZGV2LT5ybW1pbyArIChhZGV2LT5yZWdfb2Zmc2V0W0dDX0hX
SVBdWzBdW21tU0NSQVRDSF9SRUcwX0JBU0VfSURYXSArIG1tU0NSQVRDSF9SRUcwKSo0Owo+ICAg
ICAgICAgc2NyYXRjaF9yZWcxID0gYWRldi0+cm1taW8gKyAoYWRldi0+cmVnX29mZnNldFtHQ19I
V0lQXVswXVttbVNDUkFUQ0hfUkVHMV9CQVNFX0lEWF0gKyBtbVNDUkFUQ0hfUkVHMSkqNDsKPiAt
ICAgICAgIHNjcmF0Y2hfcmVnMiA9IGFkZXYtPnJtbWlvICsgKGFkZXYtPnJlZ19vZmZzZXRbR0Nf
SFdJUF1bMF1bbW1TQ1JBVENIX1JFRzFfQkFTRV9JRFhdICsgbW1TQ1JBVENIX1JFRzIpKjQ7Cj4g
LSAgICAgICBzY3JhdGNoX3JlZzMgPSBhZGV2LT5ybW1pbyArIChhZGV2LT5yZWdfb2Zmc2V0W0dD
X0hXSVBdWzBdW21tU0NSQVRDSF9SRUcxX0JBU0VfSURYXSArIG1tU0NSQVRDSF9SRUczKSo0Owo+
ICAgICAgICAgc3BhcmVfaW50ID0gYWRldi0+cm1taW8gKyAoYWRldi0+cmVnX29mZnNldFtHQ19I
V0lQXVswXVttbVJMQ19TUEFSRV9JTlRfQkFTRV9JRFhdICsgbW1STENfU1BBUkVfSU5UKSo0Owo+
Cj4gLSAgICAgICBncmJtX2NudGwgPSBhZGV2LT5yZWdfb2Zmc2V0W0dDX0hXSVBdWzBdW21tR1JC
TV9HRlhfQ05UTF9CQVNFX0lEWF0gKyBtbUdSQk1fR0ZYX0NOVEw7Cj4gLSAgICAgICBncmJtX2lk
eCA9IGFkZXYtPnJlZ19vZmZzZXRbR0NfSFdJUF1bMF1bbW1HUkJNX0dGWF9JTkRFWF9CQVNFX0lE
WF0gKyBtbUdSQk1fR0ZYX0lOREVYOwo+IC0KPiAgICAgICAgIGlmIChhbWRncHVfc3Jpb3ZfcnVu
dGltZShhZGV2KSkgewo+ICAgICAgICAgICAgICAgICBwcl9lcnIoInNob3VsZG4ndCBjYWxsIHJs
Y2cgd3JpdGUgcmVnaXN0ZXIgZHVyaW5nIHJ1bnRpbWVcbiIpOwo+ICAgICAgICAgICAgICAgICBy
ZXR1cm47Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
