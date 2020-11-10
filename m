Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D42AE312
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 23:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDEB89CDB;
	Tue, 10 Nov 2020 22:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA1089CC9;
 Tue, 10 Nov 2020 22:16:08 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c17so14400546wrc.11;
 Tue, 10 Nov 2020 14:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s7IU/PTOdi89iBvGbejecIifI0IrKP2ZeG1FWaivUjE=;
 b=GQ7Nx0TJM3+CwUm96Tq9Mf7jdPXglVP71dIaXGBqOYowxNU094z6er72cR4Yylxyyz
 gR+lg84u5J9T9utPWKI9BNe0Y9tAExmoa5DO4PpiXVYZFJyOyL+wqewAIGDWquj+EmKU
 RcgNEQ8V+o7A3dwd9ATwj661d+kXHoryyX379p9lvhLdbqP7+Cj3LWHFT6eKsSxFgV1I
 xAwOMVsauNWW4CpcPfIrjANq/h5AMzS4JN8A4OmeRtj1bQMaqZxrY6H5qDdy6efeKI88
 u7e6fK1J0QSMK3oQYSPYBEp4s7sglx50E+e48x26nG8zqwa+j4QwoHOCQrn2VlGm0t9w
 5tvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s7IU/PTOdi89iBvGbejecIifI0IrKP2ZeG1FWaivUjE=;
 b=oqpQVDlvs479Vz8s/BxGX66RjOgWI/WV1A0etGPSmf+YaJzSqO9n+EmvMqzwoOMIzT
 BTUHMQ0saqXjLJ/w3KaIEN7Ldy2aVLVIoWYdWTOXDn8c5P98NXmf4mx79TJsFQpzdiex
 erK+mS9HOBB7Rq53b00QMCOKABTV5YAtRqRs+yy2ukqnX1Oi6LS+Vd6v3XK/50rksfVu
 S5o7xK0d7nEO4AAe1VZKYDFqkP7/fMKG4V2cUXNvjJCzuEj9xqSkvdf7MbxRpLhW3wN3
 SMnd/M1vZS4r9WuwcuBrrzbQAk4DYCw287t2Uo1WmLx1L3nawl8njM1M3zTGr3EiYjRW
 14Fw==
X-Gm-Message-State: AOAM530YEh+ET3GL4Ouv62oIQ3Cnad2hKcsrunHgx8URIwwmKyYt2y+H
 dt/D8ENliXDKWb3tPttoAZUxsg99pCK5D9LWHJw=
X-Google-Smtp-Source: ABdhPJyl54Wn0vogOWFtSLhB/Y7116uoi8lK0+5pQQ2q1rWelOzlqE/JqiJcgGTRG7deHLDB4tFGPn5cZJ4d30zkmaM=
X-Received: by 2002:adf:e350:: with SMTP id n16mr27062549wrj.419.1605046567611; 
 Tue, 10 Nov 2020 14:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-11-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-11-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 17:15:56 -0500
Message-ID: <CADnq5_MNfZZTOky5HV6MLC4d6g69AxNo85snpTRjPY_g=MPzyg@mail.gmail.com>
Subject: Re: [PATCH 10/20] drm/radeon/radeon_ring: Add missing function
 parameters 'rdev' and 'data'
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

T24gTW9uLCBOb3YgOSwgMjAyMCBhdCA0OjE5IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcmluZy5jOjIyNjog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncmRldicgbm90IGRlc2NyaWJl
ZCBpbiAncmFkZW9uX3JpbmdfdW5sb2NrX3VuZG8nCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX3JpbmcuYzoyNDA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIg
J3JkZXYnIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9yaW5nX2xvY2t1cF91cGRhdGUnCj4gIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3JpbmcuYzoyODM6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ2RhdGEnIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9yaW5n
X2JhY2t1cCcKPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcmluZy5jIHwgMyArKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX3JpbmcuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3Jp
bmcuYwo+IGluZGV4IDM3MDkzY2VhMjRjNTkuLmMzMzA0Yzk3N2EwYTUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcmluZy5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fcmluZy5jCj4gQEAgLTIxOCw2ICsyMTgsNyBAQCB2b2lkIHJhZGVv
bl9yaW5nX3VuZG8oc3RydWN0IHJhZGVvbl9yaW5nICpyaW5nKQo+ICAvKioKPiAgICogcmFkZW9u
X3JpbmdfdW5sb2NrX3VuZG8gLSByZXNldCB0aGUgd3B0ciBhbmQgdW5sb2NrIHRoZSByaW5nCj4g
ICAqCj4gKyAqIEByZGV2OiAgICAgICByYWRlb24gZGV2aWNlIHN0cnVjdHVyZQo+ICAgKiBAcmlu
ZzogcmFkZW9uX3Jpbmcgc3RydWN0dXJlIGhvbGRpbmcgcmluZyBpbmZvcm1hdGlvbgo+ICAgKgo+
ICAgKiBDYWxsIHJhZGVvbl9yaW5nX3VuZG8oKSB0aGVuIHVubG9jayB0aGUgcmluZyAoYWxsIGFz
aWNzKS4KPiBAQCAtMjMxLDYgKzIzMiw3IEBAIHZvaWQgcmFkZW9uX3JpbmdfdW5sb2NrX3VuZG8o
c3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHN0cnVjdCByYWRlb25fcmluZyAqcmluCj4gIC8q
Kgo+ICAgKiByYWRlb25fcmluZ19sb2NrdXBfdXBkYXRlIC0gdXBkYXRlIGxvY2t1cCB2YXJpYWJs
ZXMKPiAgICoKPiArICogQHJkZXY6ICAgICAgIHJhZGVvbiBkZXZpY2Ugc3RydWN0dXJlCj4gICAq
IEByaW5nOiByYWRlb25fcmluZyBzdHJ1Y3R1cmUgaG9sZGluZyByaW5nIGluZm9ybWF0aW9uCj4g
ICAqCj4gICAqIFVwZGF0ZSB0aGUgbGFzdCBycHRyIHZhbHVlIGFuZCB0aW1lc3RhbXAgKGFsbCBh
c2ljcykuCj4gQEAgLTI3NSw2ICsyNzcsNyBAQCBib29sIHJhZGVvbl9yaW5nX3Rlc3RfbG9ja3Vw
KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBzdHJ1Y3QgcmFkZW9uX3JpbmcgKnJpbgo+ICAg
Kgo+ICAgKiBAcmRldjogcmFkZW9uX2RldmljZSBwb2ludGVyCj4gICAqIEByaW5nOiB0aGUgcmlu
ZyB3ZSB3YW50IHRvIGJhY2sgdXAKPiArICogQGRhdGE6IHBsYWNlaG9sZGVyIGZvciByZXR1cm5l
ZCBjb21taXQgZGF0YQo+ICAgKgo+ICAgKiBTYXZlcyBhbGwgdW5wcm9jZXNzZWQgY29tbWl0cyBm
cm9tIGEgcmluZywgcmV0dXJucyB0aGUgbnVtYmVyIG9mIGR3b3JkcyBzYXZlZC4KPiAgICovCj4g
LS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
