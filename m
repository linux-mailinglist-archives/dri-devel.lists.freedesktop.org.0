Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ACC276442
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 00:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A106EA13;
	Wed, 23 Sep 2020 22:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB0E6EA13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 22:58:56 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id j185so976192vsc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KUcyOUNhR5UsokkyQ94a4ii3LLYD28adC2QTP+OIDig=;
 b=TjGmnjBNEhXonjSPC8gVEQi6bbGloQW3B4q/lqshpuQevSVOAFbLBZrTeaXdD/bfCe
 otUrtxwF90mDWhAB4x62rSFPVXGwXl2gjddnrYgqPQ8hM1no4LhsPXmR9eGkgs12l5g0
 olYvK9sKvol7Scw0f5VJOfa9gD1xOoUgBOWhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KUcyOUNhR5UsokkyQ94a4ii3LLYD28adC2QTP+OIDig=;
 b=UrUuUsIFKDTxw1mg7fCp2oR8XrZkpm6yGoN8+ghRFRL6jB1ZYGpIHoi006BZguQtdI
 dUDQP7duEU3m6wbGfZxhIV4IgT9IwC8A05RLa1978lgIf5etC87QuNM351ZIs7YA4tIl
 lCrcNQSbLzlFOO3vSZf5hVpIJHwUgf7kRlbWo72Dy33vSopAn38+lSQTFRiRZ985nwme
 b+Xt8l+bIbKOyri0gZ8ywvLRVmiCA1w1N6tJ1Y8Lx3R92oFcVmmA2RBDwjsK5QY71cKT
 Xdn+5df/fI50rcN4kSzR8q08nZnXFKdrAQSKXQR3PxIhSqvOdIuqG3G/AvFOHcITRpKl
 hPXg==
X-Gm-Message-State: AOAM530zquclNSuUw2i2iMqTVb9BPWZf6l/dtT0FXeUE9J4N6X+XTK0w
 IJzoxq6jr3oFKycfjU9JVcUtO+ZonKo9Rw==
X-Google-Smtp-Source: ABdhPJwkbbIWhIWeF4erXgAiPTEE0CO07fAtz8b5haoaSgFce4xbSAtzmPOxQLXYZxIEzoSDhMamRQ==
X-Received: by 2002:a67:17c6:: with SMTP id 189mr2064244vsx.36.1600901935248; 
 Wed, 23 Sep 2020 15:58:55 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52])
 by smtp.gmail.com with ESMTPSA id y13sm152173vsm.15.2020.09.23.15.58.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 15:58:54 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id 7so969363vsp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:58:54 -0700 (PDT)
X-Received: by 2002:a67:8bc2:: with SMTP id n185mr2086730vsd.49.1600901933912; 
 Wed, 23 Sep 2020 15:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200922203107.2932-1-vicencb@gmail.com>
 <20200922203107.2932-2-vicencb@gmail.com>
 <50002e7b-d1f2-8209-fe65-7f60f036f7d3@rock-chips.com>
In-Reply-To: <50002e7b-d1f2-8209-fe65-7f60f036f7d3@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Sep 2020 15:58:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WKVHgqJAGfkcV-YM+=2if9aT5SS030Guh9gN-xT+Mi8A@mail.gmail.com>
Message-ID: <CAD=FV=WKVHgqJAGfkcV-YM+=2if9aT5SS030Guh9gN-xT+Mi8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm: rockchip: hdmi: fix clock rounding code
To: crj <algea.cao@rock-chips.com>
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 Vicente Bergas <vicencb@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIFNlcCAyMiwgMjAyMCBhdCA2OjM4IFBNIGNyaiA8YWxnZWEuY2FvQHJvY2st
Y2hpcHMuY29tPiB3cm90ZToKPgo+Cj4g5ZyoIDIwMjAvOS8yMyA0OjMxLCBWaWNlbnRlIEJlcmdh
cyDlhpnpgZM6Cj4gPiBVbmRlciBjZXJ0YWluIGNvbmRpdGlvbnMgdm9wX2NydGNfbW9kZV9maXh1
cCByb3VuZHMgdGhlIGNsb2NrCj4gPiAxNDg1MDAwMDAgdG8gMTQ4NTAxMDAwIHdoaWNoIGxlYWRz
IHRvIHRoZSBmb2xsb3dpbmcgZXJyb3I6Cj4gPiBkd2hkbWktcm9ja2NoaXAgZmY5NDAwMDAuaGRt
aTogUEhZIGNvbmZpZ3VyYXRpb24gZmFpbGVkIChjbG9jayAxNDg1MDEwMDApCj4gPgo+ID4gVGhl
IGlzc3VlIHdhcyBmb3VuZCBvbiBSSzMzOTkgYm9vdGluZyB3aXRoIHUtYm9vdC4gVS1ib290IGNv
bmZpZ3VyZXMgdGhlCj4gPiBkaXNwbGF5IGF0IDI1NjB4MTQ0MCBhbmQgdGhlbiBsaW51eCBjb21l
cyB1cCB3aXRoIGEgYmxhY2sgc2NyZWVuLgo+ID4gQSB3b3JrYXJvdW5kIHdhcyB0byB1bi1wbHVn
IGFuZCByZS1wbHVnIHRoZSBIRE1JIGRpc3BsYXkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVmlj
ZW50ZSBCZXJnYXMgPHZpY2VuY2JAZ21haWwuY29tPgo+ID4gVGVzdGVkLWJ5OiBWaWNlbnRlIEJl
cmdhcyA8dmljZW5jYkBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyB8IDcgKystLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwo+ID4gaW5kZXggYzgwZjdkOWZkMTNmLi45
MmVmYmQ4OTlkZWUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9j
a2NoaXBfZHJtX3ZvcC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2No
aXBfZHJtX3ZvcC5jCj4gPiBAQCAtMTE3NiwxMiArMTE3Niw5IEBAIHN0YXRpYyBib29sIHZvcF9j
cnRjX21vZGVfZml4dXAoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4gICAgICAgICoKPiA+ICAg
ICAgICAqIDIuIEdldCB0aGUgY2xvY2sgZnJhbWV3b3JrIHRvIHJvdW5kIHRoZSByYXRlIGZvciB1
cyB0byB0ZWxsIHVzCj4gPiAgICAgICAgKiAgICB3aGF0IGl0IHdpbGwgYWN0dWFsbHkgbWFrZS4K
PiA+IC0gICAgICAqCj4gPiAtICAgICAgKiAzLiBTdG9yZSB0aGUgcm91bmRlZCB1cCByYXRlIHNv
IHRoYXQgd2UgZG9uJ3QgbmVlZCB0byB3b3JyeSBhYm91dAo+ID4gLSAgICAgICogICAgdGhpcyBp
biB0aGUgYWN0dWFsIGNsa19zZXRfcmF0ZSgpLgo+ID4gICAgICAgICovCj4gPiAgICAgICByYXRl
ID0gY2xrX3JvdW5kX3JhdGUodm9wLT5kY2xrLCBhZGp1c3RlZF9tb2RlLT5jbG9jayAqIDEwMDAg
KyA5OTkpOwo+ID4gLSAgICAgYWRqdXN0ZWRfbW9kZS0+Y2xvY2sgPSBESVZfUk9VTkRfVVAocmF0
ZSwgMTAwMCk7Cj4gPiArICAgICBhZGp1c3RlZF9tb2RlLT5jbG9jayA9IHJhdGUgLyAxMDAwOwo+
ID4KPiA+ICAgICAgIHJldHVybiB0cnVlOwo+ID4gICB9Cj4gPiBAQCAtMTM4MCw3ICsxMzc3LDcg
QEAgc3RhdGljIHZvaWQgdm9wX2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMsCj4gPgo+ID4gICAgICAgVk9QX1JFR19TRVQodm9wLCBpbnRyLCBsaW5lX2ZsYWdfbnVtWzBd
LCB2YWN0X2VuZCk7Cj4gPgo+ID4gLSAgICAgY2xrX3NldF9yYXRlKHZvcC0+ZGNsaywgYWRqdXN0
ZWRfbW9kZS0+Y2xvY2sgKiAxMDAwKTsKPiA+ICsgICAgIGNsa19zZXRfcmF0ZSh2b3AtPmRjbGss
IGFkanVzdGVkX21vZGUtPmNsb2NrICogMTAwMCArIDk5OSk7Cj4KPgo+IEluIHNvbWUgUksgcGxh
dGZvcm0sIHN1Y2ggYXMgUkszMzI4LCBkY2xrIGlzIGdlbmVyYXRlZCBieSB0aGUgSU5OTyBIRE1J
Cj4gUEhZIFBMTCwgd2hpY2ggc3VwcG9ydAo+Cj4gZnJhYyBkaXZpZGVyIGNhbiBzdXBwb3J0IGFu
eSBkY2xrIGZyZXF1ZW5jeS4gQW5kIFRoZSBQTEwgbXVzdCB1c2UgdGhlCj4gZXhhY3QgY2xvY2sg
dG8gZGV0ZXJtaW5lCj4KPiB0aGUgUExMIGNvbmZpZ3VyYXRpb24uIFNvIGFkanVzdGVkX21vZGUt
PmNsb2NrICogMTAwMCArIDk5OSBtYXkgY2F1c2UKPiBJTk5PIEhETUkgUEhZIFBMTAo+Cj4gY291
bGRuJ3QgZmluZCB0aGUgcmlnaHQgY29uZmlndXJhdGlvbi4gSU5OTyBIRE1JIFBIWSdzIGRyaXZl
ciBwYXRoIGlzOgo+Cj4gZHJpdmVycy9waHkvcm9ja2NoaXAvcGh5LXJvY2tjaGlwLWlubm8taGRt
aS5jCgpJIGRvbid0IHRoaW5rIHlvdSdsbCBoYXZlIGEgcHJvYmxlbS4gIEFzc3VtaW5nIEknbSBs
b29raW5nIGF0IHRoZQpjb3JyZWN0IGNvZGUsIGluIHRoZSBmdW5jdGlvbiBpbm5vX2hkbWlfcGh5
X3JrMzIyOF9jbGtfcm91bmRfcmF0ZSgpCnlvdSd2ZSBnb3QgInJhdGUgPSAocmF0ZSAvIDEwMDAp
ICogMTAwMCIuICBJIGJlbGlldmUgdGhlIGNsb2NrCmZyYW1ld29yayBhdXRvbWF0aWNhbGx5IGNh
bGxzIHJvdW5kIHJhdGUgd2hlbiBzb21lb25lIHRyaWVzIHRvIHNldCB0aGUKcmF0ZSwgc28gdGhp
cyBzaG91bGQgY2xlYW4gdGhlIGNsb2NrIGJhY2sgdXAuCgpJZiBJJ20gbWlzdW5kZXJzdGFuZGlu
ZywgcGxlYXNlIHllbGwuCgotRG91ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
