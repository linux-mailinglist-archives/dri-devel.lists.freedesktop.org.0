Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F1C2C90AB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1658972C;
	Mon, 30 Nov 2020 22:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8718972C;
 Mon, 30 Nov 2020 22:10:34 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id x16so157749oic.3;
 Mon, 30 Nov 2020 14:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vJY62m11fNx0biVgO+0Uojl+dKN/jvXwDwURTEPj28A=;
 b=kdTYLAxgun3E681j9RVwnUtqSpFRq5P0vDsNFXcd1IkzZOektSTtGxGVrUcju2Yt8m
 YaXGOfbRyuoEB7D8ok/WslEHhEzyNyBl0mhn4TLdvSinrsvPgbrCJU0DUHbXJ2frADTm
 JDPpGdTSavfQdZI/dHXItbBCEylDKIF8BBLoeuV+I65VdOflPezHj90AWMRuSNQhoBdB
 UhJ+9ovq+6zn89EuqqJwEr8lloTwSdezhWWlsmnAk5p7AxoaAmcdXoV3cTuaSGD6jR0Q
 SjAxWLuIVCuSaJGCtzJX/SgxTyUPZQqaZ9zZPhpdv5G7cM3uzq7KWUUFqoxJFL0AylWl
 EUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vJY62m11fNx0biVgO+0Uojl+dKN/jvXwDwURTEPj28A=;
 b=NvLYLBv/zfOwz9DcgzPViJvPDVpizaHIr9MA3DUAz1iGwZZulftNmImbOLMifynETf
 q2Tl23rPXi2UzXEjsPEuCN8tWu1R888x4dqTIgI3XN7SN9gm3n+HRmCXKyoVksGdNIBt
 wALJG94x0WA8g2PgnadxgofMQ+Rxr7AGW+B4kyoDpoxIoFG/GpfdCM9U1kPaf5QpLAtC
 6m/iN5aPugW3UvfVuyDZOOpS8F0fkKRSWPjDu2cHhcqvH2eFGFZny8Eb0fUTvWZXq1ew
 YS5N4I3SnomURQIBZeWWVixdMgtd5UW8kMB9aQ6iKSA2VFZ3e0Hmebm3Ya630Icdp0kQ
 ChUQ==
X-Gm-Message-State: AOAM532NBus8XxXDMXDLZX+h6xaEbST6vsqIQAqIGCxmMvjuu8Sb9evj
 VehYjuvtkFxW/jKofOwm3ojjCkiz+koXfceLMj8=
X-Google-Smtp-Source: ABdhPJyd4RBfIDAqV7a0TfYBN0SJql76kTKY0jwuQk0MbMXfW5h136xLI1qqnmW8QihH1T6JtxN1AuYr/CpIjQKZE10=
X-Received: by 2002:a54:4608:: with SMTP id p8mr876026oip.5.1606774234019;
 Mon, 30 Nov 2020 14:10:34 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-11-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-11-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:10:22 -0500
Message-ID: <CADnq5_O0rrqyKV-Q+hZUbnocnFg+3+=miWc+dh0xiLh3ONNQJA@mail.gmail.com>
Subject: Re: [PATCH 10/40] drm/amd/amdgpu/navi10_ih: Add descriptions for 'ih'
 and 'entry'
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
Cc: Alex Sierra <alex.sierra@amd.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
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
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxMF9paC5jOjQ1
Mzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaWgnIG5vdCBkZXNjcmli
ZWQgaW4gJ25hdmkxMF9paF9nZXRfd3B0cicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bmF2aTEwX2loLmM6NTEyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdp
aCcgbm90IGRlc2NyaWJlZCBpbiAnbmF2aTEwX2loX2RlY29kZV9pdicKPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbmF2aTEwX2loLmM6NTEyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0
ZXIgb3IgbWVtYmVyICdlbnRyeScgbm90IGRlc2NyaWJlZCBpbiAnbmF2aTEwX2loX2RlY29kZV9p
dicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX2loLmM6NTUyOiB3YXJuaW5n
OiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAnbmF2
aTEwX2loX2lycV9yZWFybScKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX2lo
LmM6NTg1OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRl
c2NyaWJlZCBpbiAnbmF2aTEwX2loX3NldF9ycHRyJwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBBbGV4IFNpZXJyYSA8
YWxleC5zaWVycmFAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX2loLmMgfCA1ICsrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZpMTBfaWguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L25hdmkxMF9paC5jCj4gaW5kZXggODM3NzY5ZmNiMzViNy4uMzMzODA1MmIwODBiNiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZpMTBfaWguYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxMF9paC5jCj4gQEAgLTQ0Miw2ICs0
NDIsNyBAQCBzdGF0aWMgdm9pZCBuYXZpMTBfaWhfaXJxX2Rpc2FibGUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCj4gICAqIG5hdmkxMF9paF9nZXRfd3B0ciAtIGdldCB0aGUgSUggcmluZyBi
dWZmZXIgd3B0cgo+ICAgKgo+ICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gKyAq
IEBpaDogSUggcmluZyBidWZmZXIgdG8gZmV0Y2ggd3B0cgo+ICAgKgo+ICAgKiBHZXQgdGhlIElI
IHJpbmcgYnVmZmVyIHdwdHIgZnJvbSBlaXRoZXIgdGhlIHJlZ2lzdGVyCj4gICAqIG9yIHRoZSB3
cml0ZWJhY2sgbWVtb3J5IGJ1ZmZlciAoTkFWSTEwKS4gIEFsc28gY2hlY2sgZm9yCj4gQEAgLTUw
Miw2ICs1MDMsOCBAQCBzdGF0aWMgdTMyIG5hdmkxMF9paF9nZXRfd3B0cihzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwKPiAgICogbmF2aTEwX2loX2RlY29kZV9pdiAtIGRlY29kZSBhbiBpbnRl
cnJ1cHQgdmVjdG9yCj4gICAqCj4gICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiAr
ICogQGloOiBJSCByaW5nIGJ1ZmZlciB0byBkZWNvZGUKPiArICogQGVudHJ5OiBJViBlbnRyeSB0
byBwbGFjZSBkZWNvZGVkIGluZm9ybWF0aW9uIGludG8KPiAgICoKPiAgICogRGVjb2RlcyB0aGUg
aW50ZXJydXB0IHZlY3RvciBhdCB0aGUgY3VycmVudCBycHRyCj4gICAqIHBvc2l0aW9uIGFuZCBh
bHNvIGFkdmFuY2UgdGhlIHBvc2l0aW9uLgo+IEBAIC01NDUsNiArNTQ4LDcgQEAgc3RhdGljIHZv
aWQgbmF2aTEwX2loX2RlY29kZV9pdihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICog
bmF2aTEwX2loX2lycV9yZWFybSAtIHJlYXJtIElSUSBpZiBsb3N0Cj4gICAqCj4gICAqIEBhZGV2
OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiArICogQGloOiBJSCByaW5nIHRvIG1hdGNoCj4gICAq
Cj4gICAqLwo+ICBzdGF0aWMgdm9pZCBuYXZpMTBfaWhfaXJxX3JlYXJtKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LAo+IEBAIC01NzgsNiArNTgyLDcgQEAgc3RhdGljIHZvaWQgbmF2aTEwX2lo
X2lycV9yZWFybShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICoKPiAgICogQGFkZXY6
IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICAgKgo+ICsgKiBAaWg6IElIIHJpbmcgYnVmZmVyIHRv
IHNldCBycHRyCj4gICAqIFNldCB0aGUgSUggcmluZyBidWZmZXIgcnB0ci4KPiAgICovCj4gIHN0
YXRpYyB2b2lkIG5hdmkxMF9paF9zZXRfcnB0cihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
PiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
