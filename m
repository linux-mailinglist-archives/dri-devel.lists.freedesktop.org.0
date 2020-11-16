Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36A12B5154
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 20:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C5E6E0F5;
	Mon, 16 Nov 2020 19:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9646E0F4;
 Mon, 16 Nov 2020 19:39:10 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p22so414193wmg.3;
 Mon, 16 Nov 2020 11:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SFDYZjZQAaTG2dP2nDjD2sZBHSX8y4VAO8O1y9JdIt4=;
 b=dn22h72gTUdQINjrVh+u6VcLpUp3feTYDhKbcx/zLTmMMOseqPwzvrqkHK0pN+vkE1
 cJLKPM/pA3TFI+5FVC9Nrn4jfQSjBblzKhG7Aj+kFbRw/q0TokL6votST754daXnhgEc
 bFNC5KBCCG77kbvEeDj107kVr0ArMd0o27K3ejzyFxaqHlN2mCGq8U2QDiQvTMKLzH5z
 PCdpsr6+vLVdIO0Zlh0Cbm5EnGr/ipPOajXOv+faa6r082NZN7UlD7K9iZ6EKpBuFzNQ
 r4v477fBBm9fQlfaXHaIkHj/mR3pebgreXAlYko/J/2lLYCxa6ZyABb/R3BC5Ax2ct8Y
 RrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SFDYZjZQAaTG2dP2nDjD2sZBHSX8y4VAO8O1y9JdIt4=;
 b=BUCGYqeOV9VvSsykNzm+nbHasDEJ0OA3snfgLwsYmR5CXQOqQ5vh0FSD9z44+qKjED
 7kR5HSdih6J6UZpiPBzYayZdoDZZ8RhH7IlJVMwz6CQjndzPSTfJQ4oPVpZ0i8rEdmqo
 U5dAeef/YPgNDM26SXBRZ7yq/w3Wp7jWZ+LMjOqboZpYcYB4MfD94fHhxvSlA+yKXpy3
 d8ybftDS9o+rbXjBraj9anKZbUTXaR4hIzBxT3ku5mLtHa9wB9F1qyyZrLpkFroII7Vg
 /ayHOulXgIw7C1Ak2e21ziBUi2xkAcewj8a23QHKo246Roi++0bgyeZgoax4BltkIQWF
 mOGw==
X-Gm-Message-State: AOAM532d+bjqjAk0VH6DYwy48CEtJ+30pjht6kQrvOSdSLXSThppTKLt
 urOfo7nP0cBS4Ezv6jFJpDjiw0WjL7QN/+hoaIU=
X-Google-Smtp-Source: ABdhPJwFpL7kKK3lQzEQOmbpRP4YnvubKEFnUN3DkG5JLPPNtWhPymi8ADkkgzTuFxEMka1t5sTCmS6zK/RSR4B/fyQ=
X-Received: by 2002:a1c:f017:: with SMTP id a23mr521478wmb.56.1605555548926;
 Mon, 16 Nov 2020 11:39:08 -0800 (PST)
MIME-Version: 1.0
References: <20201116173005.1825880-1-lee.jones@linaro.org>
 <20201116173005.1825880-9-lee.jones@linaro.org>
In-Reply-To: <20201116173005.1825880-9-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 14:38:57 -0500
Message-ID: <CADnq5_PdMNHAx=h02br5-ee27FO4_efdakDFKJsUt0LSHX0=UA@mail.gmail.com>
Subject: Re: [PATCH 08/43] drm/radeon/radeon_irq_kms: Demote non-conformant
 kernel-doc fix another
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

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzAgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9pcnFfa21zLmM6
NTY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2lycScgbm90IGRlc2Ny
aWJlZCBpbiAncmFkZW9uX2RyaXZlcl9pcnFfaGFuZGxlcl9rbXMnCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2lycV9rbXMuYzo1Njogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAnYXJnJyBub3QgZGVzY3JpYmVkIGluICdyYWRlb25fZHJpdmVyX2lycV9oYW5k
bGVyX2ttcycKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5jOjU3MTog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnbicgbm90IGRlc2NyaWJlZCBp
biAncmFkZW9uX2lycV9rbXNfc2V0X2lycV9uX2VuYWJsZWQnCj4gIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2lycV9rbXMuYzo1NzE6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJh
bWV0ZXIgJ251bScgZGVzY3JpcHRpb24gaW4gJ3JhZGVvbl9pcnFfa21zX3NldF9pcnFfbl9lbmFi
bGVkJwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBD
YzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4CgoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5jIHwgOCArKystLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2lycV9rbXMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2lycV9rbXMuYwo+IGluZGV4IGI4NmJjODhhZDQzMDguLmEy
NDJiNjA1M2Q0N2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
aXJxX2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5j
Cj4gQEAgLTQzLDExICs0Myw5IEBACj4KPiAgI2RlZmluZSBSQURFT05fV0FJVF9JRExFX1RJTUVP
VVQgMjAwCj4KPiAtLyoqCj4gKy8qCj4gICAqIHJhZGVvbl9kcml2ZXJfaXJxX2hhbmRsZXJfa21z
IC0gaXJxIGhhbmRsZXIgZm9yIEtNUwo+ICAgKgo+IC0gKiBAaW50IGlycSwgdm9pZCAqYXJnOiBh
cmdzCj4gLSAqCj4gICAqIFRoaXMgaXMgdGhlIGlycSBoYW5kbGVyIGZvciB0aGUgcmFkZW9uIEtN
UyBkcml2ZXIgKGFsbCBhc2ljcykuCj4gICAqIHJhZGVvbl9pcnFfcHJvY2VzcyBpcyBhIG1hY3Jv
IHRoYXQgcG9pbnRzIHRvIHRoZSBwZXItYXNpYwo+ICAgKiBpcnEgaGFuZGxlciBjYWxsYmFjay4K
PiBAQCAtNTQ5LDE0ICs1NDcsMTQgQEAgdm9pZCByYWRlb25faXJxX2ttc19kaXNhYmxlX2hwZChz
dHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgdW5zaWduZWQgaHBkX21hc2spCj4gIH0KPgo+ICAv
KioKPiAtICogcmFkZW9uX2lycV9rbXNfdXBkYXRlX2ludF9uIC0gaGVscGVyIGZvciB1cGRhdGlu
ZyBpbnRlcnJ1cHQgZW5hYmxlIHJlZ2lzdGVycwo+ICsgKiByYWRlb25faXJxX2ttc19zZXRfaXJx
X25fZW5hYmxlZCAtIGhlbHBlciBmb3IgdXBkYXRpbmcgaW50ZXJydXB0IGVuYWJsZSByZWdpc3Rl
cnMKPiAgICoKPiAgICogQHJkZXY6IHJhZGVvbiBkZXZpY2UgcG9pbnRlcgo+ICAgKiBAcmVnOiB0
aGUgcmVnaXN0ZXIgdG8gd3JpdGUgdG8gZW5hYmxlL2Rpc2FibGUgaW50ZXJydXB0cwo+ICAgKiBA
bWFzazogdGhlIG1hc2sgdGhhdCBlbmFibGVzIHRoZSBpbnRlcnJ1cHRzCj4gICAqIEBlbmFibGU6
IHdoZXRoZXIgdG8gZW5hYmxlIG9yIGRpc2FibGUgdGhlIGludGVycnVwdCByZWdpc3Rlcgo+ICAg
KiBAbmFtZTogdGhlIG5hbWUgb2YgdGhlIGludGVycnVwdCByZWdpc3RlciB0byBwcmludCB0byB0
aGUga2VybmVsIGxvZwo+IC0gKiBAbnVtOiB0aGUgbnVtYmVyIG9mIHRoZSBpbnRlcnJ1cHQgcmVn
aXN0ZXIgdG8gcHJpbnQgdG8gdGhlIGtlcm5lbCBsb2cKPiArICogQG46IHRoZSBudW1iZXIgb2Yg
dGhlIGludGVycnVwdCByZWdpc3RlciB0byBwcmludCB0byB0aGUga2VybmVsIGxvZwo+ICAgKgo+
ICAgKiBIZWxwZXIgZm9yIHVwZGF0aW5nIHRoZSBlbmFibGUgc3RhdGUgb2YgaW50ZXJydXB0IHJl
Z2lzdGVycy4gQ2hlY2tzIHdoZXRoZXIKPiAgICogb3Igbm90IHRoZSBpbnRlcnJ1cHQgbWF0Y2hl
cyB0aGUgZW5hYmxlIHN0YXRlIHdlIHdhbnQuIElmIGl0IGRvZXNuJ3QsIHRoZW4KPiAtLQo+IDIu
MjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
