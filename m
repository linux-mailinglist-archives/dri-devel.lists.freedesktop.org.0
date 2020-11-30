Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9810B2C908E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AEB6E8F4;
	Mon, 30 Nov 2020 22:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EBA89E57;
 Mon, 30 Nov 2020 22:06:51 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id v202so15917552oia.9;
 Mon, 30 Nov 2020 14:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7EQnpqvC3hpfizVx7WNlc1o2wLOwLDyI4iu7zgo9UUQ=;
 b=FTc0NENMaLnXl0QJAv4V0k6/vQCM6vWq8NN5M6M8Ua6+HS/J9rRkOZs22P69ICi0fZ
 IY4kYzeJ6o2eh5RfOghvkt8xOhVFYdyErsvejxIAVBcCa0ihUsNPGCRFZgesYl8gvKQf
 HguB4SkoogQRWnJ5NB/nayVUVgmEFbEuNH0HyNE4plg4QBfImH8ucLbDKOgAL3sHeMsi
 q3kV9LSgcFz2nFxvB/IaTslZ7TLT9Xvm0FbClgZYLtsWOGdNso8xcC9IssYceekkeecf
 k75H2JohzSulJCJR0F0ITgJMoey6nbp4D8rgIoP24uPJxwL2a/uL2K3ijq4Jzlccz0Gs
 vC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7EQnpqvC3hpfizVx7WNlc1o2wLOwLDyI4iu7zgo9UUQ=;
 b=Dhk9dS8GzkjFDmBwl1Sm3S6wAp0MoK23dXdbgJO9H5dRCD7oxvnC+7U3kf2IU3+yNK
 3XKlZv+0n5Sy7OcYtAJWLFGYWcy9+/p/m20+kIyPgNXr9OODEQxCFo9xKi+P8KOX+zJZ
 w2CDr0p8++wPAAi7CSAA9tCOjOK8hhZYdiusX6z3tCuXIBtRS6nWnGzvlDSkL8aFQa16
 S9uQAq49wrLRKbW2LxhD30AgmL7ErfAOujTaCoNKcngnOnCGd5aqdPjTXDlcRUUlhXHX
 5LiarydHRKEVdvo4CRKO8RO/nxGyT97qMRE3NMP/9SjCgXemebjd43miMSZnucDpvl0j
 Uopw==
X-Gm-Message-State: AOAM533e9MYSp2qO/ELly5WwjBdkCRI22RDimxJuD4pX6XOG19D0vZZO
 NnZq2IVR8Qp7RbNRqZU725zYdvbiY/cfpVTaCTw=
X-Google-Smtp-Source: ABdhPJwKoCehpgjsxEwJ4YPyYu6p17CzQDio4KhNKbgLv/OTlanCBhDMSTalMQDfqfvwcoBDYCfkncF7qqNR1RZAOko=
X-Received: by 2002:a54:4608:: with SMTP id p8mr862273oip.5.1606774011073;
 Mon, 30 Nov 2020 14:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-6-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-6-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:06:39 -0500
Message-ID: <CADnq5_Mzf=BBzvqsyBLCSsmWZK29kCKK4BgOy9exEjq=F4t+4A@mail.gmail.com>
Subject: Re: [PATCH 05/40] drm/amd/amdgpu/tonga_ih: Provide some missing
 descriptions for 'ih' and 'entry'
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

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3RvbmdhX2loLmM6MTkz
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJl
ZCBpbiAndG9uZ2FfaWhfZ2V0X3dwdHInCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Rv
bmdhX2loLmM6MjI1OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcg
bm90IGRlc2NyaWJlZCBpbiAndG9uZ2FfaWhfZGVjb2RlX2l2Jwo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS90b25nYV9paC5jOjIyNTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9y
IG1lbWJlciAnZW50cnknIG5vdCBkZXNjcmliZWQgaW4gJ3RvbmdhX2loX2RlY29kZV9pdicKPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdG9uZ2FfaWguYzoyNTU6IHdhcm5pbmc6IEZ1bmN0
aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2loJyBub3QgZGVzY3JpYmVkIGluICd0b25nYV9paF9z
ZXRfcnB0cicKPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdG9uZ2FfaWguYyB8IDQgKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdG9uZ2FfaWguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Rv
bmdhX2loLmMKPiBpbmRleCBlNDAxNDBiZjY2OTljLi5jZTMzMTk5OTNiNGJkIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3RvbmdhX2loLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS90b25nYV9paC5jCj4gQEAgLTE4MSw2ICsxODEsNyBAQCBzdGF0
aWMgdm9pZCB0b25nYV9paF9pcnFfZGlzYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
PiAgICogdG9uZ2FfaWhfZ2V0X3dwdHIgLSBnZXQgdGhlIElIIHJpbmcgYnVmZmVyIHdwdHIKPiAg
ICoKPiAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICsgKiBAaWg6IElIIHJpbmcg
YnVmZmVyIHRvIGZldGNoIHdwdHIKPiAgICoKPiAgICogR2V0IHRoZSBJSCByaW5nIGJ1ZmZlciB3
cHRyIGZyb20gZWl0aGVyIHRoZSByZWdpc3Rlcgo+ICAgKiBvciB0aGUgd3JpdGViYWNrIG1lbW9y
eSBidWZmZXIgKFZJKS4gIEFsc28gY2hlY2sgZm9yCj4gQEAgLTIxNSw2ICsyMTYsOCBAQCBzdGF0
aWMgdTMyIHRvbmdhX2loX2dldF93cHRyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAg
KiB0b25nYV9paF9kZWNvZGVfaXYgLSBkZWNvZGUgYW4gaW50ZXJydXB0IHZlY3Rvcgo+ICAgKgo+
ICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gKyAqIEBpaDogSUggcmluZyBidWZm
ZXIgdG8gZGVjb2RlCj4gKyAqIEBlbnRyeTogSVYgZW50cnkgdG8gcGxhY2UgZGVjb2RlZCBpbmZv
cm1hdGlvbiBpbnRvCj4gICAqCj4gICAqIERlY29kZXMgdGhlIGludGVycnVwdCB2ZWN0b3IgYXQg
dGhlIGN1cnJlbnQgcnB0cgo+ICAgKiBwb3NpdGlvbiBhbmQgYWxzbyBhZHZhbmNlIHRoZSBwb3Np
dGlvbi4KPiBAQCAtMjQ3LDYgKzI1MCw3IEBAIHN0YXRpYyB2b2lkIHRvbmdhX2loX2RlY29kZV9p
dihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICogdG9uZ2FfaWhfc2V0X3JwdHIgLSBz
ZXQgdGhlIElIIHJpbmcgYnVmZmVyIHJwdHIKPiAgICoKPiAgICogQGFkZXY6IGFtZGdwdV9kZXZp
Y2UgcG9pbnRlcgo+ICsgKiBAaWg6IElIIHJpbmcgYnVmZmVyIHRvIHNldCBycHRyCj4gICAqCj4g
ICAqIFNldCB0aGUgSUggcmluZyBidWZmZXIgcnB0ci4KPiAgICovCj4gLS0KPiAyLjI1LjEKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
