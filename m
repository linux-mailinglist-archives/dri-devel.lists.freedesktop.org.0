Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F00312C2CC4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4E86E45E;
	Tue, 24 Nov 2020 16:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E596E408;
 Tue, 24 Nov 2020 16:24:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s8so22883059wrw.10;
 Tue, 24 Nov 2020 08:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X095HGxsg/FK0cpRrtl/LIevnbVNe2Cktr5g6/t5Gpc=;
 b=L91ucRMOIoDHfs4JVe0ty8ZwzN6C3Fl7EZZiJTY6aEMH/nB6R7depultMmivEfJ9en
 e5eYyFeaut5YF0AMSI9VvcppDRBg0FnLTXvhBF4koHX6MLMVRje6GLq177ToL/cQyYYj
 U77/OaBKwfWfbkpuZZjbn+VufWBpcXvETUvWSLrwb4VOFOqcFX/SdeXIHnPxbUl1Ok69
 vbNRyFA6m7lWgfyIJIiquehhbvk7WyvsObblC4ERdQXjSNADorjfqOvYKn1kWIOMctOm
 z64mspfRm+2s/Osrybf8jBgoOtvQZwU4BhfniMjoyTG9FZGTnynSrGyZg3IU9GiWbFgD
 ozbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X095HGxsg/FK0cpRrtl/LIevnbVNe2Cktr5g6/t5Gpc=;
 b=avv8hWze5wwss3UEY/qzNtPnD8yN65Fhd1cnzSlJZlqgkCRLUiEo7bqamQK4mhF+F1
 sp0VQOYDhzUnRsUohFch3GquLuUNwTTqLcSIwDSirOz1B0/Aip6pN+sStPm18dp88eNq
 JoejUbLqNesND/bAsHGpK4xRKzZ+HL0HlaWld21piZkXVmIjPNc8RVuhXPXYfWikxEh1
 VuluXs5ulbI0z2ipmJCFuAg9n7UUr8+zvQTqoEIgszVz21C8tkxEBuOs2dwVfVgx50os
 AZQ/rmibCMwQ4EppEBt/GK7OHpJ+7sWaHvEj9FN6phknhrLxQ+6Y9Hi68pGJgKBZhHil
 trUA==
X-Gm-Message-State: AOAM531+laZotaUY3OL46+PY0HUkvSxdecDOqBUVADxsJPM5Q6fQpIIU
 HzeD26DpERnc7L3yV6lnZXMF5k0f/jFrQETn7WBQI8Rp
X-Google-Smtp-Source: ABdhPJxlqbz+4amkKgjU9MfO2vrBQQ5BjIgXtB/jK1q7skulld0vqN9Z/VhUciUBsSKxW2qQzc+JnlQ/JZVFcxUrw0M=
X-Received: by 2002:adf:9144:: with SMTP id j62mr6232738wrj.419.1606235068792; 
 Tue, 24 Nov 2020 08:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-37-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-37-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 11:24:17 -0500
Message-ID: <CADnq5_PEvjBvNtd7Xgcu6jv9GG04MqmC5KT9-zy5hg-MM3Q8Nw@mail.gmail.com>
Subject: Re: [PATCH 36/40] drm/amd/amdgpu/gmc_v7_0: Add some missing
 kernel-doc descriptions
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

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoyMCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmM6NDMz
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmbHVzaF90eXBlJyBub3Qg
ZGVzY3JpYmVkIGluICdnbWNfdjdfMF9mbHVzaF9ncHVfdGxiX3Bhc2lkJwo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jOjQzMzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1l
dGVyIG9yIG1lbWJlciAnYWxsX2h1Yicgbm90IGRlc2NyaWJlZCBpbiAnZ21jX3Y3XzBfZmx1c2hf
Z3B1X3RsYl9wYXNpZCcKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYzo0
NzE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3ZtaHViJyBub3QgZGVz
Y3JpYmVkIGluICdnbWNfdjdfMF9mbHVzaF9ncHVfdGxiJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjdfMC5jOjQ3MTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1l
bWJlciAnZmx1c2hfdHlwZScgbm90IGRlc2NyaWJlZCBpbiAnZ21jX3Y3XzBfZmx1c2hfZ3B1X3Rs
YicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYzo3NzE6IHdhcm5pbmc6
IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3Bhc2lkJyBub3QgZGVzY3JpYmVkIGluICdn
bWNfdjdfMF92bV9kZWNvZGVfZmF1bHQnCj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZCB3aXRoIG1p
bm9yIGNoYW5nZXMuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjdfMC5jIHwgNyArKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjdfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3
XzAuYwo+IGluZGV4IDgwYzE0NmRmMzM4YWEuLmZlNzFjODllY2QyNmYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMKPiBAQCAtNDI0LDYgKzQyNCw4IEBAIHN0YXRpYyBp
bnQgZ21jX3Y3XzBfbWNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICoKPiAg
ICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICAgKiBAcGFzaWQ6IHBhc2lkIHRvIGJl
IGZsdXNoCj4gKyAqIEBmbHVzaF90eXBlOiB1bnVzZWQKPiArICogQGFsbF9odWI6IHVudXNlZAo+
ICAgKgo+ICAgKiBGbHVzaCB0aGUgVExCIGZvciB0aGUgcmVxdWVzdGVkIHBhc2lkLgo+ICAgKi8K
PiBAQCAtNDYzLDcgKzQ2NSw5IEBAIHN0YXRpYyBpbnQgZ21jX3Y3XzBfZmx1c2hfZ3B1X3RsYl9w
YXNpZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICoKPiAgICogQGFkZXY6IGFtZGdw
dV9kZXZpY2UgcG9pbnRlcgo+ICAgKiBAdm1pZDogdm0gaW5zdGFuY2UgdG8gZmx1c2gKPiAtICoK
PiArICogQHZtaHViOiB1bnVzZWQKPiArICogQGZsdXNoX3R5cGU6IHVudXNlZAo+ICsgKiAqCj4g
ICAqIEZsdXNoIHRoZSBUTEIgZm9yIHRoZSByZXF1ZXN0ZWQgcGFnZSB0YWJsZSAoQ0lLKS4KPiAg
ICovCj4gIHN0YXRpYyB2b2lkIGdtY192N18wX2ZsdXNoX2dwdV90bGIoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsCj4gQEAgLTc2Myw2ICs3NjcsNyBAQCBzdGF0aWMg
dm9pZCBnbWNfdjdfMF9nYXJ0X2Rpc2FibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4g
ICAqIEBzdGF0dXM6IFZNX0NPTlRFWFQxX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTIHJlZ2lzdGVy
IHZhbHVlCj4gICAqIEBhZGRyOiBWTV9DT05URVhUMV9QUk9URUNUSU9OX0ZBVUxUX0FERFIgcmVn
aXN0ZXIgdmFsdWUKPiAgICogQG1jX2NsaWVudDogVk1fQ09OVEVYVDFfUFJPVEVDVElPTl9GQVVM
VF9NQ0NMSUVOVCByZWdpc3RlciB2YWx1ZQo+ICsgKiBAcGFzaWQ6IGRlYnVnIGxvZ2dpbmcgb25s
eSAtIG5vIGZ1bmN0aW9uYWwgdXNlCj4gICAqCj4gICAqIFByaW50IGh1bWFuIHJlYWRhYmxlIGZh
dWx0IGluZm9ybWF0aW9uIChDSUspLgo+ICAgKi8KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
