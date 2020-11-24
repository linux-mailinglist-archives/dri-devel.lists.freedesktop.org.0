Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25A92C2CD1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C476E45E;
	Tue, 24 Nov 2020 16:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C756E45E;
 Tue, 24 Nov 2020 16:26:44 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c198so2945971wmd.0;
 Tue, 24 Nov 2020 08:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L5yh124+35fWpY6C/RYa1tV5+Q4siwUnEg7czGfCdgc=;
 b=p3Nh4Wd0lncqnmu/1NyYehIOHHW/Aht1QF850QehyuLuUDo8QGXLlyQ6/fwOeexD8G
 cuhC8L9soyjdFfQVPlc/1OjYSYQ7HYxr1zSUD05FzKREYNlFrQB4/JPzKdhQQr2m65nG
 zSY3GZj4gqozYTe0NuItOa+kiG5QxG9eDdTdqQrGIwUOBWX5fUsYzZewxABxkAGsbFti
 NingY2nL4VrqYFSoOOtxDmdEEvAcgImnLcpQDPan8MVkOBwVFPVUmf2rN2JjZUA95wqT
 TWPAnET2gt2fi43V9qt32JM1FdC+iDJW+yWr8W54NQOxMzH7dSIoTcAPT/bX2v9z7giH
 CjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L5yh124+35fWpY6C/RYa1tV5+Q4siwUnEg7czGfCdgc=;
 b=n5zC0gy7szlWa7p5Iuneo0SLX3IVYhJ8krMGuY9a/ySnnJ6MeXnt/SuqPjACpQWt9E
 FlyFrvs9Iz99qwST8UYuTiY+i7fo+HdobKwXF2XNWZTsdWXs67QaS7lwVs5PCHuDayq9
 AbAEkyTg2M84Kg3j2aCYg4582tj3enIMSTD5OpsH2bRY4pU2RpgpY8OquIbftPArpn7j
 63Zl+W4YdAc5jWDFQCy147mLvyk5Upzc7gg172iL0R9k3M2Y1unH1Jt7y4MP2CAs0qgd
 l2zFKbT/UqiVswsHnW84/xpM6PBWnAOtO4p6tq+rfnDwhfTayXoOsn6XgaAvdeutJ4Oz
 uw2Q==
X-Gm-Message-State: AOAM532rkbdiuTgKB5q0BuG4H46xSu4rrWtXwk2XMNaKVfMNfvqXIgmG
 WS8VL9rXePCE5qjb3xae25I0xrCxanHYRqup/zE=
X-Google-Smtp-Source: ABdhPJx14x2qfyZKiQ4i/fQGiHmWJzAtD6CHBdmhGOpi8h8GQsXZjLaETc3PeWibouLypsxDwfPrbDeg3KFO42FI2tE=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr5325311wmi.70.1606235203423; 
 Tue, 24 Nov 2020 08:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-38-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-38-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 11:26:32 -0500
Message-ID: <CADnq5_MEwCJJxdsTzLQu3cjx0w2_ww0mYKHbenD2Pn=9Mxq2tQ@mail.gmail.com>
Subject: Re: [PATCH 37/40] drm/amd/amdgpu/gmc_v8_0: Fix more issues attributed
 to copy/paste
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

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoyMSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmM6NjE4
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmbHVzaF90eXBlJyBub3Qg
ZGVzY3JpYmVkIGluICdnbWNfdjhfMF9mbHVzaF9ncHVfdGxiX3Bhc2lkJwo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjhfMC5jOjYxODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1l
dGVyIG9yIG1lbWJlciAnYWxsX2h1Yicgbm90IGRlc2NyaWJlZCBpbiAnZ21jX3Y4XzBfZmx1c2hf
Z3B1X3RsYl9wYXNpZCcKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYzo2
NTc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3ZtaHViJyBub3QgZGVz
Y3JpYmVkIGluICdnbWNfdjhfMF9mbHVzaF9ncHVfdGxiJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjhfMC5jOjY1Nzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1l
bWJlciAnZmx1c2hfdHlwZScgbm90IGRlc2NyaWJlZCBpbiAnZ21jX3Y4XzBfZmx1c2hfZ3B1X3Rs
YicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYzo5OTg6IHdhcm5pbmc6
IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3Bhc2lkJyBub3QgZGVzY3JpYmVkIGluICdn
bWNfdjhfMF92bV9kZWNvZGVfZmF1bHQnCj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZCB3aXRoIG1p
bm9yIGNoYW5nZXMuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjhfMC5jIHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4
XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMKPiBpbmRleCAwZjMy
YTgwMDJjM2Q3Li40MWMxZDhlODEyYjg4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OF8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjhfMC5jCj4gQEAgLTYwOSw2ICs2MDksOCBAQCBzdGF0aWMgaW50IGdtY192OF8wX21jX2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAqCj4gICAqIEBhZGV2OiBhbWRncHVf
ZGV2aWNlIHBvaW50ZXIKPiAgICogQHBhc2lkOiBwYXNpZCB0byBiZSBmbHVzaAo+ICsgKiBAZmx1
c2hfdHlwZTogdW51c2VkCj4gKyAqIEBhbGxfaHViOiB1bnVzZWQKPiAgICoKPiAgICogRmx1c2gg
dGhlIFRMQiBmb3IgdGhlIHJlcXVlc3RlZCBwYXNpZC4KPiAgICovCj4gQEAgLTY0OSw2ICs2NTEs
OCBAQCBzdGF0aWMgaW50IGdtY192OF8wX2ZsdXNoX2dwdV90bGJfcGFzaWQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsCj4gICAqCj4gICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIK
PiAgICogQHZtaWQ6IHZtIGluc3RhbmNlIHRvIGZsdXNoCj4gKyAqIEB2bWh1YjogdW51c2VkCj4g
KyAqIEBmbHVzaF90eXBlOiB1bnVzZWQKPiAgICoKPiAgICogRmx1c2ggdGhlIFRMQiBmb3IgdGhl
IHJlcXVlc3RlZCBwYWdlIHRhYmxlIChWSSkuCj4gICAqLwo+IEBAIC05OTAsNiArOTk0LDcgQEAg
c3RhdGljIHZvaWQgZ21jX3Y4XzBfZ2FydF9kaXNhYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQo+ICAgKiBAc3RhdHVzOiBWTV9DT05URVhUMV9QUk9URUNUSU9OX0ZBVUxUX1NUQVRVUyBy
ZWdpc3RlciB2YWx1ZQo+ICAgKiBAYWRkcjogVk1fQ09OVEVYVDFfUFJPVEVDVElPTl9GQVVMVF9B
RERSIHJlZ2lzdGVyIHZhbHVlCj4gICAqIEBtY19jbGllbnQ6IFZNX0NPTlRFWFQxX1BST1RFQ1RJ
T05fRkFVTFRfTUNDTElFTlQgcmVnaXN0ZXIgdmFsdWUKPiArICogQHBhc2lkOiBkZWJ1ZyBsb2dn
aW5nIG9ubHkgLSBubyBmdW5jdGlvbmFsIHVzZQo+ICAgKgo+ICAgKiBQcmludCBodW1hbiByZWFk
YWJsZSBmYXVsdCBpbmZvcm1hdGlvbiAoVkkpLgo+ICAgKi8KPiAtLQo+IDIuMjUuMQo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
