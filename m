Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0D6E07F9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 17:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21996E85F;
	Tue, 22 Oct 2019 15:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F426E85E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 15:53:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v24so17772198ljj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BhtC62v3n6zmy08FKulqslkQbjt/OC56JJA6sqKbbEI=;
 b=TtxG81wmVOeMh/DcWZvDAOWmQYCoVtcs1cPO+d5DxgWZyCXh3cQ+DYtX+NB5HuzYCQ
 99VtpltIGC74/+uxY8suo0azNlnFIndq5bS2qLXAiIVJh+9FCYlW9+FkHLdbGQas4Hyw
 NO6Q6N0nCsus4PEGXOL7kYnetgCGP1pqXE8sgwM+zwMJNvmfEjLeWDu7G8ZxohDgopD9
 QbF2AUuvF5YWJPMAFHu7EEbqa1qmzgpVMBSrgJFctua6BezZGzPxIiTPn4IXAD+a3tFy
 3StyH2SC1k3uhKKjdGcJkioIIROATo45pDRqpQXE7sr48DsuVXD7bnZU8HYjqUhPrCA1
 /Ykg==
X-Gm-Message-State: APjAAAXO9wNk8BjwM9EvHu2iteA71DlS9bXtA5J4HwgO0e/pPjizA0kB
 JnkqeRXPUXxTdTkadokOEa06IrUnYskuM2HTSkI=
X-Google-Smtp-Source: APXvYqwMAh2Xf8XGTmUZ0oAFhZ+aXz7e3Xm4is5aYh8CbOVrKF19FvuDYEfcrvLjMVfNISfByHZYxzhm66qKmBvqX7E=
X-Received: by 2002:a2e:8417:: with SMTP id z23mr19232916ljg.46.1571759635304; 
 Tue, 22 Oct 2019 08:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191016123342.19119-1-patrik.r.jakobsson@gmail.com>
 <87lftdfb4c.fsf@intel.com> <20191022084423.GB1531961@ulmo>
 <87imohf6rf.fsf@intel.com>
In-Reply-To: <87imohf6rf.fsf@intel.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 22 Oct 2019 17:53:44 +0200
Message-ID: <CAMeQTsYbY+2=w1m_zMo95vrR008otQESYQJ5K1PfyYOi_Ff2BQ@mail.gmail.com>
Subject: Re: [PATCH] drm/scdc: Fix typo in bit definition of SCDC_STATUS_FLAGS
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BhtC62v3n6zmy08FKulqslkQbjt/OC56JJA6sqKbbEI=;
 b=UcYTz4a7WI8YJuFZ85FxcekxfaPXLr7TxsJ2U6KWML5x+HxuEl2IvCvKhALdV3vz/S
 iSXd9yW+BB/SRFFZO2moBPElSPog8UZfyOYp/+a30LMJEWBpMaxU5Xq9PcLjK/ol0fY1
 VmRkXk6iYklRWmO5pNt9bgmgzaL8I9njwDTEZgaQmEUV8xiMCGTQNoaTVO/Udd2lCga4
 NJH6KxJyXm42dj8KjH+XBPxv5NxF0a2WlJywFVd4q7ztJrC5xV9xfXfGFKKrr66FgMSM
 x8w4TyqkvdtyLq3TlHmWDkI6UEjblKeTOCGZ9az8QUsLKez0b9G5miqI6gjHN4gIPmzq
 iJ2w==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTE6NTEgQU0gSmFuaSBOaWt1bGEKPGphbmkubmlrdWxh
QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDIyIE9jdCAyMDE5LCBUaGllcnJ5
IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPiB3cm90ZToKPiA+IE9uIFR1ZSwgT2N0
IDIyLCAyMDE5IGF0IDExOjE2OjUxQU0gKzAzMDAsIEphbmkgTmlrdWxhIHdyb3RlOgo+ID4+IE9u
IFdlZCwgMTYgT2N0IDIwMTksIFBhdHJpayBKYWtvYnNzb24gPHBhdHJpay5yLmpha29ic3NvbkBn
bWFpbC5jb20+IHdyb3RlOgo+ID4+ID4gRml4IHR5cG8gd2hlcmUgYml0cyBnb3QgY29tcGFyZWQg
KHggPCB5KSBpbnN0ZWFkIG9mIHNoaWZ0ZWQgKHggPDwgeSkuCj4gPj4KPiA+PiBGaXhlczogM2Fk
MzNhZTJiYzgwICgiZHJtOiBBZGQgU0NEQyBoZWxwZXJzIikKPiA+PiBDYzogVGhpZXJyeSBSZWRp
bmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiA+Cj4gPiBJJ20gbm90IHN1cmUgd2UgcmVhbGx5IG5l
ZWQgdGhlIEZpeGVzOiB0YWcgaGVyZS4gVGhlc2UgZGVmaW5lcyBhcmVuJ3QKPiA+IHVzZWQgYW55
d2hlcmUsIHNvIHRlY2huaWNhbGx5IHRoZXJlJ3Mgbm8gYnVnLgo+Cj4gWWVhaCB3ZWxsLCBJIGp1
c3QgbG9nZ2VkIGl0IGhlcmUgYXMgSSBoYXBwZW5lZCB0byBkbyB0aGUgZHJpdmUtYnkgZ2l0Cj4g
YmxhbWUuCgpJIHRoaW5rIHdlIGNhbiBza2lwIHRoZSBmaXhlcyB0YWcgaGVyZS4gVGhhbmtzIGZv
ciByZXZpZXchCgpEaWQgYW55b25lIGFwcGx5IHRoaXMgb3IgY2FuIEkgdGFrZSBpdCB0aHJvdWdo
IGRybS1taXNjLW5leHQ/CgotUGF0cmlrCgo+Cj4gQlIsCj4gSmFuaS4KPgo+Cj4KPiA+Cj4gPiBU
aGllcnJ5Cj4gPgo+ID4+Cj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWsgSmFrb2Jzc29uIDxw
YXRyaWsuci5qYWtvYnNzb25AZ21haWwuY29tPgo+ID4+ID4gLS0tCj4gPj4gPiAgaW5jbHVkZS9k
cm0vZHJtX3NjZGNfaGVscGVyLmggfCA2ICsrKy0tLQo+ID4+ID4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPj4gPgo+ID4+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2RybV9zY2RjX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX3NjZGNfaGVs
cGVyLmgKPiA+PiA+IGluZGV4IGY5MmViMjA5NGQ2Yi4uNmE0ODM1MzNhYWU0IDEwMDY0NAo+ID4+
ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3NjZGNfaGVscGVyLmgKPiA+PiA+ICsrKyBiL2luY2x1
ZGUvZHJtL2RybV9zY2RjX2hlbHBlci5oCj4gPj4gPiBAQCAtNTAsOSArNTAsOSBAQAo+ID4+ID4g
ICNkZWZpbmUgIFNDRENfUkVBRF9SRVFVRVNUX0VOQUJMRSAoMSA8PCAwKQo+ID4+ID4KPiA+PiA+
ICAjZGVmaW5lIFNDRENfU1RBVFVTX0ZMQUdTXzAgMHg0MAo+ID4+ID4gLSNkZWZpbmUgIFNDRENf
Q0gyX0xPQ0sgKDEgPCAzKQo+ID4+ID4gLSNkZWZpbmUgIFNDRENfQ0gxX0xPQ0sgKDEgPCAyKQo+
ID4+ID4gLSNkZWZpbmUgIFNDRENfQ0gwX0xPQ0sgKDEgPCAxKQo+ID4+ID4gKyNkZWZpbmUgIFND
RENfQ0gyX0xPQ0sgKDEgPDwgMykKPiA+PiA+ICsjZGVmaW5lICBTQ0RDX0NIMV9MT0NLICgxIDw8
IDIpCj4gPj4gPiArI2RlZmluZSAgU0NEQ19DSDBfTE9DSyAoMSA8PCAxKQo+ID4+ID4gICNkZWZp
bmUgIFNDRENfQ0hfTE9DS19NQVNLIChTQ0RDX0NIMl9MT0NLIHwgU0NEQ19DSDFfTE9DSyB8IFND
RENfQ0gwX0xPQ0spCj4gPj4gPiAgI2RlZmluZSAgU0NEQ19DTE9DS19ERVRFQ1QgKDEgPDwgMCkK
PiA+Pgo+ID4+IC0tCj4gPj4gSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNz
IENlbnRlcgo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiA+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo+Cj4gLS0KPiBKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2Ug
R3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
