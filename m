Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E68672C909B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3006E8F8;
	Mon, 30 Nov 2020 22:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5FD6E8F8;
 Mon, 30 Nov 2020 22:08:38 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id x16so152229oic.3;
 Mon, 30 Nov 2020 14:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ssyqQ2x40VAnf0UDyd8qZKVfCQ7SYisnmPz80Ctkr5M=;
 b=lNQNT/G89FX7MORQv72Kihj8aB6o11cRXtumYVih0fD/zmR5D5VUabJ85F0lfwBmeT
 Vck90Q0VuKPcNJr2T538Zxu3BKAhdmw8fwJ7sVS2zLocgCrtYUahL041bt0TJXTGCNDY
 ZM7mGdlVfV7a83KmyUki3nx8UBjhp7CcNK2QIAsTNHXNpUWJjSCS5Se9EMZ4cZwMumet
 gkFXDObYXUrJ0bLc9p/ncPbdLlwZ1fGV2HSEfMDJx9H8WezbKEjjHVpLq1eyu0RziQLX
 xnPn2Cdee4OyHW6GOk7JKnKcqAgW96V52xmfq81OAmrWOMLErF3bBZMZ2kfzg/4B29dx
 07ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ssyqQ2x40VAnf0UDyd8qZKVfCQ7SYisnmPz80Ctkr5M=;
 b=f6vVxJFqxjgllv4LiZqQG+iop7mDWSXB7rhxy70o44l75H6ZiytruTFPOEiCrz7C3Q
 CEZpeVAmlXP3dTpXlmidEEjoRkcJ829deQcG0cftsGPt7YZbS+LvIpH66FeTlWml+VvE
 D28/Gd1SIwjYiCmXADmYzLUGfMRhvMEZJnmTqA3THn8feCDohrpcXbNgzBv4azdbQS/x
 R0LAgP51yFu7xRytaFX9Aw7PXrJN2pnlS+JJaDUYIrZuA9wonTD6SoeC0x+d2zCnAWOT
 uLf7HwdRG7R2WO/WlBTobjhsWMBnRhqqbnWmrsqMM6yyDKjREE+1KAtO2xLjSdhEiRtR
 PmyQ==
X-Gm-Message-State: AOAM533b8L8KibEaqcIMXAYS2fPHCsU0K1nYADFQnRqc0tO1Y8eDiHb0
 jsNH78HAMbFMRIzXWkzolIE5bE5y6y2B5cpIQl24uT/B
X-Google-Smtp-Source: ABdhPJxkJQSRLE5/CDB9aem/VoismXvItysaV/3WGZBcRXw0L5l8NmMixzvvFAYQRBuERyV61DGKO227yDgI5UCbOis=
X-Received: by 2002:a54:4608:: with SMTP id p8mr869110oip.5.1606774118366;
 Mon, 30 Nov 2020 14:08:38 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-7-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-7-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:08:26 -0500
Message-ID: <CADnq5_MY8=jZ2eSJdbSi27YT5-ZT4RAfzFaMA2HQQSPaNvJYvA@mail.gmail.com>
Subject: Re: [PATCH 06/40] drm/amd/amdgpu/cz_ih: Add missing function param
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
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2N6X2loLmM6MTkxOiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBp
biAnY3pfaWhfZ2V0X3dwdHInCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2N6X2loLmM6
MjIzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2Ny
aWJlZCBpbiAnY3pfaWhfZGVjb2RlX2l2Jwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9j
el9paC5jOjIyMzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZW50cnkn
IG5vdCBkZXNjcmliZWQgaW4gJ2N6X2loX2RlY29kZV9pdicKPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvY3pfaWguYzoyNTM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1i
ZXIgJ2loJyBub3QgZGVzY3JpYmVkIGluICdjel9paF9zZXRfcnB0cicKPgo+IENjOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmln
IiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvY3pfaWguYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY3pfaWguYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2N6X2loLmMKPiBpbmRleCAxZGNhMGNhYmMzMjZhLi5k
YTM3ZjhhOTAwYWZiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2N6
X2loLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jel9paC5jCj4gQEAgLTE3
OSw2ICsxNzksNyBAQCBzdGF0aWMgdm9pZCBjel9paF9pcnFfZGlzYWJsZShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKPiAgICogY3pfaWhfZ2V0X3dwdHIgLSBnZXQgdGhlIElIIHJpbmcgYnVm
ZmVyIHdwdHIKPiAgICoKPiAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICsgKiBA
aWg6IElIIHJpbmcgYnVmZmVyIHRvIGZldGNoIHdwdHIKPiAgICoKPiAgICogR2V0IHRoZSBJSCBy
aW5nIGJ1ZmZlciB3cHRyIGZyb20gZWl0aGVyIHRoZSByZWdpc3Rlcgo+ICAgKiBvciB0aGUgd3Jp
dGViYWNrIG1lbW9yeSBidWZmZXIgKFZJKS4gIEFsc28gY2hlY2sgZm9yCj4gQEAgLTIxMyw2ICsy
MTQsOCBAQCBzdGF0aWMgdTMyIGN6X2loX2dldF93cHRyKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAo+ICAgKiBjel9paF9kZWNvZGVfaXYgLSBkZWNvZGUgYW4gaW50ZXJydXB0IHZlY3Rvcgo+
ICAgKgo+ICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gKyAqIEBpaDogSUggcmlu
ZyBidWZmZXIgdG8gZGVjb2RlCj4gKyAqIEBlbnRyeTogSVYgZW50cnkgdG8gcGxhY2UgZGVjb2Rl
ZCBpbmZvcm1hdGlvbiBpbnRvCj4gICAqCj4gICAqIERlY29kZXMgdGhlIGludGVycnVwdCB2ZWN0
b3IgYXQgdGhlIGN1cnJlbnQgcnB0cgo+ICAgKiBwb3NpdGlvbiBhbmQgYWxzbyBhZHZhbmNlIHRo
ZSBwb3NpdGlvbi4KPiBAQCAtMjQ1LDYgKzI0OCw3IEBAIHN0YXRpYyB2b2lkIGN6X2loX2RlY29k
ZV9pdihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICogY3pfaWhfc2V0X3JwdHIgLSBz
ZXQgdGhlIElIIHJpbmcgYnVmZmVyIHJwdHIKPiAgICoKPiAgICogQGFkZXY6IGFtZGdwdV9kZXZp
Y2UgcG9pbnRlcgo+ICsgKiBAaWg6IElIIHJpbmcgYnVmZmVyIHRvIHNldCBycHRyCj4gICAqCj4g
ICAqIFNldCB0aGUgSUggcmluZyBidWZmZXIgcnB0ci4KPiAgICovCj4gLS0KPiAyLjI1LjEKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
