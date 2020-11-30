Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6462C9159
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D6989AAE;
	Mon, 30 Nov 2020 22:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A31D89A94;
 Mon, 30 Nov 2020 22:43:27 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id t143so16026201oif.10;
 Mon, 30 Nov 2020 14:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WWSmCbuMYCfSEh/XtQKC06ZLvB/BO8GNX46533df02s=;
 b=bZwuRONmsmYRDY/qpQnkjxh/+CLUjT/GqCSdrg62y6M2BR9eWy/VZqg4Xn4mo1eb0D
 4AHmdE/uK1xrxkNwKFMXxJdAIfgY7nBVieqSXg7Svj4JlO0va8Z2WLEbxnjoaG/7YLFK
 kB6heZk++frlYd9KL6FWb/iG3V9NPaKbB4baRg6YdSyKNwqGim6W1ZWmsonfkOSLcvup
 rV051tKmimTGyzzV9l/saJkrlynALSu7x8JUdSpZeQH/QONYqUTONKxC7nJd7u6XPIrT
 vnVCFo/eipt6Favt6NSRQdsfdr27yW6uzywPaLkf2Qc3KLAPEadoLJygxeli2O5mRILs
 7BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WWSmCbuMYCfSEh/XtQKC06ZLvB/BO8GNX46533df02s=;
 b=CAbgPMMltWdQtiYRrjUUBwl/nz6h5U+QKvpEsjn5BdWiQaU77unIjDrDi7hkIlW6Vp
 nMeQsHimopKbkous+syEo/1x2TPKg5GfH24mMY9mvaWrfMIs2+2wuU8g7WHTQBFBsuqd
 bx0WW+klQDKghr57SH+h/DPA1yVHCP6rLaagZptNJ0KIXVmO5vHmDnUQsnVO8/Me2y8B
 irKwJgo65T14G374H/HY+1SeVIF7Qb72oFg8IdUVVu41bZ1ai42Era/eb5jb0wUsQlpA
 RjMBF/zCfSFnIMtNS90pilD7RyMR7MJpC3CSr6EQgFNYNte0C8/D8xtWxIqkYxjcQGPX
 nGPg==
X-Gm-Message-State: AOAM532tM9+ifqzRoAQyPammrcC5VorqHaD39r6cFt9oornwU8P6FnCy
 jt9XroPJBUAUiHocdP9M5D3cjkIwcQAdQm4KbGw=
X-Google-Smtp-Source: ABdhPJxTc5vWNKZcOnmhkPpo9Icy58gCWMvjZUp7rBRqZYxEovDI41prcZbXuCkIS0jEWf4HPrKeITpsAE6kju/9C6k=
X-Received: by 2002:a54:4608:: with SMTP id p8mr11503oip.5.1606776206944; Mon,
 30 Nov 2020 14:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-31-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-31-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:43:15 -0500
Message-ID: <CADnq5_Mp1G0YcNy5PyQoYZ7DmKo8OmMpBvoAqz-wPL9_neb_YQ@mail.gmail.com>
Subject: Re: [PATCH 30/40] drm/amd/amdgpu/jpeg_v1_0: Add some missing function
 param descriptions
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
Cc: David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Veerabadhran G <vegopala@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFfMC5jOjIx
OTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYWRkcicgbm90IGRlc2Ny
aWJlZCBpbiAnanBlZ192MV8wX2RlY29kZV9yaW5nX2VtaXRfZmVuY2UnCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFfMC5jOjIxOTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1l
dGVyIG9yIG1lbWJlciAnc2VxJyBub3QgZGVzY3JpYmVkIGluICdqcGVnX3YxXzBfZGVjb2RlX3Jp
bmdfZW1pdF9mZW5jZScKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192MV8wLmM6
MjE5OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmbGFncycgbm90IGRl
c2NyaWJlZCBpbiAnanBlZ192MV8wX2RlY29kZV9yaW5nX2VtaXRfZmVuY2UnCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFfMC5jOjIxOTogd2FybmluZzogRXhjZXNzIGZ1bmN0
aW9uIHBhcmFtZXRlciAnZmVuY2UnIGRlc2NyaXB0aW9uIGluICdqcGVnX3YxXzBfZGVjb2RlX3Jp
bmdfZW1pdF9mZW5jZScKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192MV8wLmM6
MjkzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdqb2InIG5vdCBkZXNj
cmliZWQgaW4gJ2pwZWdfdjFfMF9kZWNvZGVfcmluZ19lbWl0X2liJwo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9qcGVnX3YxXzAuYzoyOTM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRl
ciBvciBtZW1iZXIgJ2ZsYWdzJyBub3QgZGVzY3JpYmVkIGluICdqcGVnX3YxXzBfZGVjb2RlX3Jp
bmdfZW1pdF9pYicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192MV8wLmM6NTE4
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdtb2RlJyBub3QgZGVzY3Jp
YmVkIGluICdqcGVnX3YxXzBfc3RhcnQnCj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IFZlZXJhYmFkaHJhbiBHIDx2ZWdv
cGFsYUBhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQgd2l0aCBtaW5vciBmaXhlcy4gIFRoYW5r
cyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFfMC5j
IHwgNyArKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9qcGVnX3Yx
XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFfMC5jCj4gaW5kZXggYzYw
MGI2MWI1ZjQ1ZC4uYzg3MTAyYjIzOGU0OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9qcGVnX3YxXzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2pwZWdfdjFfMC5jCj4gQEAgLTIxMCw3ICsyMTAsOSBAQCBzdGF0aWMgdm9pZCBqcGVnX3YxXzBf
ZGVjb2RlX3JpbmdfaW5zZXJ0X2VuZChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCj4gICAqIGpw
ZWdfdjFfMF9kZWNvZGVfcmluZ19lbWl0X2ZlbmNlIC0gZW1pdCBhbiBmZW5jZSAmIHRyYXAgY29t
bWFuZAo+ICAgKgo+ICAgKiBAcmluZzogYW1kZ3B1X3JpbmcgcG9pbnRlcgo+IC0gKiBAZmVuY2U6
IGZlbmNlIHRvIGVtaXQKPiArICogQGFkZHI6IGFkZHJlc3MKPiArICogQHNlcTogc2VxdWVuY2Ug
bnVtYmVyCj4gKyAqIEBmbGFnczogZmVuY2UgcmVsYXRlZCBmbGFncwo+ICAgKgo+ICAgKiBXcml0
ZSBhIGZlbmNlIGFuZCBhIHRyYXAgY29tbWFuZCB0byB0aGUgcmluZy4KPiAgICovCj4gQEAgLTI4
Miw3ICsyODQsOSBAQCBzdGF0aWMgdm9pZCBqcGVnX3YxXzBfZGVjb2RlX3JpbmdfZW1pdF9mZW5j
ZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHU2NCBhZGRyLAo+ICAgKiBqcGVnX3YxXzBfZGVj
b2RlX3JpbmdfZW1pdF9pYiAtIGV4ZWN1dGUgaW5kaXJlY3QgYnVmZmVyCj4gICAqCj4gICAqIEBy
aW5nOiBhbWRncHVfcmluZyBwb2ludGVyCj4gKyAqIEBqb2I6IGpvYiB0byByZXRyaXZlIHZtaWQg
ZnJvbQo+ICAgKiBAaWI6IGluZGlyZWN0IGJ1ZmZlciB0byBleGVjdXRlCj4gKyAqIEBmbGFnczog
dW51c2VkCj4gICAqCj4gICAqIFdyaXRlIHJpbmcgY29tbWFuZHMgdG8gZXhlY3V0ZSB0aGUgaW5k
aXJlY3QgYnVmZmVyLgo+ICAgKi8KPiBAQCAtNTExLDYgKzUxNSw3IEBAIHZvaWQganBlZ192MV8w
X3N3X2Zpbmkodm9pZCAqaGFuZGxlKQo+ICAgKiBqcGVnX3YxXzBfc3RhcnQgLSBzdGFydCBKUEVH
IGJsb2NrCj4gICAqCj4gICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiArICogQG1v
ZGU6IFNQRyBvciBEUEcgbW9kZQo+ICAgKgo+ICAgKiBTZXR1cCBhbmQgc3RhcnQgdGhlIEpQRUcg
YmxvY2sKPiAgICovCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
