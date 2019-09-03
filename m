Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAF7A6605
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 11:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB3789291;
	Tue,  3 Sep 2019 09:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFFA89291
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 09:49:03 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f19so3936950eds.12
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 02:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=mEls2kUVvBcaBZpvYEuQESBA2MX/ZhbqTw7OA+f9Nbs=;
 b=OnHWfxoWDXnqra6iurXU1TYbIWfJ1VFtgOix1DJmfa5mH9JJ8TpqfqX7RMfb0nOQwH
 La7+vIBRQEUz8PFn+x92gIutPpXmfi1v5oo8FfGdRHT9EtmYDOxzPRKDgy/x1p5GKBrp
 g5MWp5piYfNjhxhxsauVib84jIErq9zB64A3w9a5rQL0rQZgjP9gs9P0xIDEEnkQaNSP
 gilz1vM83lmiQ0MUv36+mohM0yVGx3klQqgnLNKeA3UnAGvdzfZOxSiNF91UZKmM2N3S
 KJ9kXP0z1dcRWUY1zDJHKNRQQNpHePGVJn3yAXGd/lsKer01b/4s8ZVdoyXl/GatFU9m
 IZhA==
X-Gm-Message-State: APjAAAXY7mADMVQtQbVbbKXrVdoj2me5E3rR3smiXGs7PhNJYWzbYFVR
 +XWHT2XSj7E6/rlppXAZzWIQRw==
X-Google-Smtp-Source: APXvYqxY0hmUni95XwccqU3GO7ZXnZTxf/p+ya82BW6ix0VT35ImlZc/up0XizPcjgRP0ff5z5gp6Q==
X-Received: by 2002:a17:906:74d4:: with SMTP id
 z20mr16917924ejl.191.1567504142161; 
 Tue, 03 Sep 2019 02:49:02 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id k16sm1860071ejv.87.2019.09.03.02.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 02:49:01 -0700 (PDT)
Date: Tue, 3 Sep 2019 11:48:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 05/17] drm: add mmap() to drm_gem_object_funcs
Message-ID: <20190903094859.GQ2112@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20190808134417.10610-1-kraxel@redhat.com>
 <20190808134417.10610-6-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808134417.10610-6-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=mEls2kUVvBcaBZpvYEuQESBA2MX/ZhbqTw7OA+f9Nbs=;
 b=WahOyVBEl0OVaAAIgzp1mXqBhNiSKi1rS1iYLd8wycHTbKi9/P+SA0o2wH8J4y5QPR
 e6OiZXQUwJKelCzLkw5rPDo2/QvL+Dd4Ih+zYTNICr6DnqQDCFNDX/UxfyFVlF2AMTJ4
 u7rovqA4TvuCbkOQOZXKzTLg9rORSmdP27cXo=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, tzimmermann@suse.de,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDM6NDQ6MDVQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBkcm1fZ2VtX29iamVjdF9mdW5jcy0+dm1fb3BzIGFsb25lIGNhbid0IGhhbmRsZQo+
IGV2ZXJ5dGhpbmcgbW1hcCgpIG5lZWRzLiAgQWRkIGEgbmV3IGNhbGxiYWNrIGZvciBpdC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAtLS0K
PiAgaW5jbHVkZS9kcm0vZHJtX2dlbS5oICAgICB8IDkgKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtLmMgfCA2ICsrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oIGIvaW5jbHVkZS9k
cm0vZHJtX2dlbS5oCj4gaW5kZXggYWU2OTNjMDY2NmNkLi5lZTNjNGFkNzQyYzYgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5o
Cj4gQEAgLTE1MCw2ICsxNTAsMTUgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIHsKPiAg
CSAqLwo+ICAJdm9pZCAoKnZ1bm1hcCkoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHZvaWQg
KnZhZGRyKTsKPiAgCj4gKwkvKioKPiArCSAqIEBtbWFwOgo+ICsJICoKPiArCSAqIENhbGxlZCBi
eSBkcm1fZ2VtX21tYXAoKSBmb3IgYWRkaXRpb25hbCBjaGVja3Mvc2V0dXAuCj4gKwkgKgo+ICsJ
ICogVGhpcyBjYWxsYmFjayBpcyBvcHRpb25hbC4KPiArCSAqLwo+ICsJaW50ICgqbW1hcCkoc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKCkkg
dGhpbmsgaWYgd2UgZG8gYW4gbW1hcCBjYWxsYmFjaywgaXQgc2hvdWxkIHJlcGxhY2UgYWxsIHRo
ZSBtbWFwIGhhbmRsaW5nCihleGNlcHQgdGhlIGRybV9nZW1fb2JqZWN0X2dldCkgdGhhdCBkcm1f
Z2VtX21tYXBfb2JqIGRvZXMuIFNvIG1heWJlCnNvbWV0aGluZyBsaWtlIHRoZSBiZWxvdzoKCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtLmMKaW5kZXggNjg1NGY1ODY3ZDUxLi5lOGI3Nzc5NjMzZGQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwpA
QCAtMTEwNCwxNyArMTEwNCwyMiBAQCBpbnQgZHJtX2dlbV9tbWFwX29iaihzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKm9iaiwgdW5zaWduZWQgbG9uZyBvYmpfc2l6ZSwKIAlpZiAob2JqX3NpemUgPCB2
bWEtPnZtX2VuZCAtIHZtYS0+dm1fc3RhcnQpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JaWYgKG9i
ai0+ZnVuY3MgJiYgb2JqLT5mdW5jcy0+dm1fb3BzKQotCQl2bWEtPnZtX29wcyA9IG9iai0+ZnVu
Y3MtPnZtX29wczsKLQllbHNlIGlmIChkZXYtPmRyaXZlci0+Z2VtX3ZtX29wcykKLQkJdm1hLT52
bV9vcHMgPSBkZXYtPmRyaXZlci0+Z2VtX3ZtX29wczsKLQllbHNlCi0JCXJldHVybiAtRUlOVkFM
OwotCi0Jdm1hLT52bV9mbGFncyB8PSBWTV9JTyB8IFZNX1BGTk1BUCB8IFZNX0RPTlRFWFBBTkQg
fCBWTV9ET05URFVNUDsKIAl2bWEtPnZtX3ByaXZhdGVfZGF0YSA9IG9iajsKLQl2bWEtPnZtX3Bh
Z2VfcHJvdCA9IHBncHJvdF93cml0ZWNvbWJpbmUodm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2Zs
YWdzKSk7Ci0Jdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3RfZGVjcnlwdGVkKHZtYS0+dm1fcGFn
ZV9wcm90KTsKKworCWlmIChvYmotPmZ1bmNzICYmIG9iai0+ZnVuY3MtPm1tYXApCisJCW9iai0+
ZnVuY3MtPm1tYXAob2JqLCB2bWEpOworCWVsc2UgeworCQlpZiAob2JqLT5mdW5jcyAmJiBvYmot
PmZ1bmNzLT52bV9vcHMpCisJCQl2bWEtPnZtX29wcyA9IG9iai0+ZnVuY3MtPnZtX29wczsKKwkJ
ZWxzZSBpZiAoZGV2LT5kcml2ZXItPmdlbV92bV9vcHMpCisJCQl2bWEtPnZtX29wcyA9IGRldi0+
ZHJpdmVyLT5nZW1fdm1fb3BzOworCQllbHNlCisJCQlyZXR1cm4gLUVJTlZBTDsKKworCQl2bWEt
PnZtX2ZsYWdzIHw9IFZNX0lPIHwgVk1fUEZOTUFQIHwgVk1fRE9OVEVYUEFORCB8IFZNX0RPTlRE
VU1QOworCQl2bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF93cml0ZWNvbWJpbmUodm1fZ2V0X3Bh
Z2VfcHJvdCh2bWEtPnZtX2ZsYWdzKSk7CisJCXZtYS0+dm1fcGFnZV9wcm90ID0gcGdwcm90X2Rl
Y3J5cHRlZCh2bWEtPnZtX3BhZ2VfcHJvdCk7CisJfQogCiAJLyogVGFrZSBhIHJlZiBmb3IgdGhp
cyBtYXBwaW5nIG9mIHRoZSBvYmplY3QsIHNvIHRoYXQgdGhlIGZhdWx0CiAJICogaGFuZGxlciBj
YW4gZGVyZWZlcmVuY2UgdGhlIG1tYXAgb2Zmc2V0J3MgcG9pbnRlciB0byB0aGUgb2JqZWN0LgoK
U2luY2UgSSByZW1lbWJlciBxdWl0ZSBhIGZldyBkaXNjdXNzaW9ucyB3aGVyZSB0aGUgZGVmYXVs
dCB2bWEgZmxhZwp3cmFuZ2xpbmcgd2UncmUgZG9pbmcgaXMgc2VyaW91c2x5IGdldHRpbmcgaW4g
dGhlIHdheSBvZiB0aGluZ3MgdG9vLgoKSSB0aGluayBldmVuIGJldHRlciB3b3VsZCBiZSBpZiB0
aGlzIG5ldyAtPm1tYXAgaG9vayBjb3VsZCBhbHNvIGJlIHVzZWQKZGlyZWN0bHkgYnkgdGhlIGRt
YS1idWYgbW1hcCBjb2RlLCB3aXRob3V0IGhhdmluZyB0byBqdW1wIHRocm91Z2ggaG9vcHMKY3Jl
YXRpbmcgYSBmYWtlIGZpbGUgYW5kIGZha2Ugdm1hIG9mZnNldCBhbmQgZXZlcnl0aGluZy4gSSB0
aGluayB3aXRoIHRoYXQKd2UnZCBoYXZlIGEgcmVhbGx5IHNvbGlkIGNhc2UgdG8gYWRkIHRoaXMg
LT5tbWFwIGhvb2suCi1EYW5pZWwKCgo+ICsKPiAgCS8qKgo+ICAJICogQHZtX29wczoKPiAgCSAq
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbS5jCj4gaW5kZXggYWZjMzhjZWNlM2Y1Li44NGRiOGRlMjE3ZTEgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtLmMKPiBAQCAtMTEwNSw2ICsxMTA1LDggQEAgaW50IGRybV9nZW1fbW1hcF9vYmooc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHVuc2lnbmVkIGxvbmcgb2JqX3NpemUsCj4gIAkJdm1h
LT52bV9vcHMgPSBvYmotPmZ1bmNzLT52bV9vcHM7Cj4gIAllbHNlIGlmIChkZXYtPmRyaXZlci0+
Z2VtX3ZtX29wcykKPiAgCQl2bWEtPnZtX29wcyA9IGRldi0+ZHJpdmVyLT5nZW1fdm1fb3BzOwo+
ICsJZWxzZSBpZiAob2JqLT5mdW5jcyAmJiBvYmotPmZ1bmNzLT5tbWFwKQo+ICsJCS8qIG9iai0+
ZnVuY3MtPm1tYXAgbXVzdCBzZXQgdm1hLT52bV9vcHMgKi87Cj4gIAllbHNlCj4gIAkJcmV0dXJu
IC1FSU5WQUw7Cj4gIAo+IEBAIC0xMTkyLDYgKzExOTQsMTAgQEAgaW50IGRybV9nZW1fbW1hcChz
dHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gIAlyZXQgPSBk
cm1fZ2VtX21tYXBfb2JqKG9iaiwgZHJtX3ZtYV9ub2RlX3NpemUobm9kZSkgPDwgUEFHRV9TSElG
VCwKPiAgCQkJICAgICAgIHZtYSk7Cj4gIAo+ICsJaWYgKHJldCA9PSAwKQo+ICsJCWlmIChvYmot
PmZ1bmNzLT5tbWFwKQo+ICsJCQlyZXQgPSBvYmotPmZ1bmNzLT5tbWFwKG9iaiwgdm1hKTsKPiAr
Cj4gIAlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQob2JqKTsKPiAgCj4gIAlyZXR1cm4gcmV0
Owo+IC0tIAo+IDIuMTguMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
