Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0B6BD0D8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 19:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD446EAAA;
	Tue, 24 Sep 2019 17:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB47C6EAA7;
 Tue, 24 Sep 2019 17:44:32 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p7so1109716wmp.4;
 Tue, 24 Sep 2019 10:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YnkD8ruxiiVU+/b0MIOMYHziPPxhvJQEUU3bEQaAWfI=;
 b=QG6IhyVbk/s5ynt8PZUTRAGKXTLIIZEijgRk7zym8dCaq/PsRhGC1XR7xiPELnT0KA
 igxnCS4Sd8hiXynsK33sXTuQZoIv4Jln7vEUVk3GZGxK4LhDxyZqFdDNY725klOnZdov
 5sX7KW7wWzhK3VHRWtQEH6/AE4U7xYlTffthIAVVotfK59OQjpQkkfDh14NIJrg983AA
 zS2UlycRU9PAeKr0HJgrz/Lo4lZs+HFbKvrs+z/1Dr9vwk9P5IkSmJKGBFRkCnke9sB1
 Bt9Chct5lyqPlZ4H+hunuxMT7bzilW+dG0iNW+hcUmzUjXJlekf+uVMDt4XVnEzou1zg
 xjDQ==
X-Gm-Message-State: APjAAAXhElni/DHQ/hPih7iSN6VEQ8niNCCRHEATDlssNGDB2Glxnxz2
 Es6I+OE6JQbPeUDrHHrKs1qIJ0/nfIoOQnOHI+Y0sg==
X-Google-Smtp-Source: APXvYqw1I81PXTo1512QYhq1BkXCvdRiR5A3sZ/c2G4T8YqXORYLZPGOkwemXnK5XlyuSf9f/czKeMEAFvXXbsIOva8=
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr1438661wmo.67.1569347071150; 
 Tue, 24 Sep 2019 10:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569329774.git.jani.nikula@intel.com>
 <8263e4681a118094c5eb76fe9eb2a0d9f49474a6.1569329774.git.jani.nikula@intel.com>
In-Reply-To: <8263e4681a118094c5eb76fe9eb2a0d9f49474a6.1569329774.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Sep 2019 13:44:18 -0400
Message-ID: <CADnq5_MsT-g9Ey3o8+dJvv5ssCn4d45i_+hPjeYMYgkX5dvP0w@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] drm/amdgpu: use drm_debug_enabled() to check for
 debug categories
To: Jani Nikula <jani.nikula@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YnkD8ruxiiVU+/b0MIOMYHziPPxhvJQEUU3bEQaAWfI=;
 b=R9Ai5jrkXa24nlJLo6OaISH4548SCA9cPwiZaGukpe77eaSpDZJbWXR2qS+YudwvpS
 vdulsp44+FxVw0u2wwTpB+dKQiDdyXP9ej4R6yclx8+FVZ7Mxk/PyFG1GTmQ2Tps+6L4
 E6yPfzJ53JX/N0AvJ6t1+mo1qbaf+L3c0DIUqcnnwd+BwhyJ819axD0hbmYnrtlp46ya
 5+CyPwu9CBiBLBOkrP+uTYQPckYDPVJvrs7rR1Mcoi/cJeVmmKes0BjYm6tgIGhIEkQt
 jMIJOqAeUK2W+QW14n305gmxIWC69Joh+/Z90Wqjl0nNePRsHAaUSgoX76V4DNF6uh9N
 9mzw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgOTowMCBBTSBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
aW50ZWwuY29tPiB3cm90ZToKPgo+IEFsbG93IGJldHRlciBhYnN0cmFjdGlvbiBvZiB0aGUgZHJt
X2RlYnVnIGdsb2JhbCB2YXJpYWJsZSBpbiB0aGUKPiBmdXR1cmUuIE5vIGZ1bmN0aW9uYWwgY2hh
bmdlcy4KPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4g
Q2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2
aWQgKENodW5NaW5nKSBaaG91IDxEYXZpZDEuWmhvdUBhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5p
a3VsYUBpbnRlbC5jb20+CgpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8w
X2kyYy5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211
X3YxMV8wX2kyYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2kyYy5j
Cj4gaW5kZXggNGE1OTUxMDM2OTI3Li41ZjE3YmQ0ODk5ZTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2kyYy5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2kyYy5jCj4gQEAgLTIzNCw3ICsyMzQsNyBAQCBzdGF0
aWMgdWludDMyX3Qgc211X3YxMV8wX2kyY190cmFuc21pdChzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmNv
bnRyb2wsCj4gICAgICAgICBEUk1fREVCVUdfRFJJVkVSKCJJMkNfVHJhbnNtaXQoKSwgYWRkcmVz
cyA9ICV4LCBieXRlcyA9ICVkICwgZGF0YTogIiwKPiAgICAgICAgICAgICAgICAgICh1aW50MTZf
dClhZGRyZXNzLCBudW1ieXRlcyk7Cj4KPiAtICAgICAgIGlmIChkcm1fZGVidWcgJiBEUk1fVVRf
RFJJVkVSKSB7Cj4gKyAgICAgICBpZiAoZHJtX2RlYnVnX2VuYWJsZWQoRFJNX1VUX0RSSVZFUikp
IHsKPiAgICAgICAgICAgICAgICAgcHJpbnRfaGV4X2R1bXAoS0VSTl9JTkZPLCAiZGF0YTogIiwg
RFVNUF9QUkVGSVhfTk9ORSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMTYsIDEs
IGRhdGEsIG51bWJ5dGVzLCBmYWxzZSk7Cj4gICAgICAgICB9Cj4gQEAgLTM4OCw3ICszODgsNyBA
QCBzdGF0aWMgdWludDMyX3Qgc211X3YxMV8wX2kyY19yZWNlaXZlKHN0cnVjdCBpMmNfYWRhcHRl
ciAqY29udHJvbCwKPiAgICAgICAgIERSTV9ERUJVR19EUklWRVIoIkkyQ19SZWNlaXZlKCksIGFk
ZHJlc3MgPSAleCwgYnl0ZXMgPSAlZCwgZGF0YSA6IiwKPiAgICAgICAgICAgICAgICAgICAodWlu
dDE2X3QpYWRkcmVzcywgYnl0ZXNfcmVjZWl2ZWQpOwo+Cj4gLSAgICAgICBpZiAoZHJtX2RlYnVn
ICYgRFJNX1VUX0RSSVZFUikgewo+ICsgICAgICAgaWYgKGRybV9kZWJ1Z19lbmFibGVkKERSTV9V
VF9EUklWRVIpKSB7Cj4gICAgICAgICAgICAgICAgIHByaW50X2hleF9kdW1wKEtFUk5fSU5GTywg
ImRhdGE6ICIsIERVTVBfUFJFRklYX05PTkUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDE2LCAxLCBkYXRhLCBieXRlc19yZWNlaXZlZCwgZmFsc2UpOwo+ICAgICAgICAgfQo+IC0t
Cj4gMi4yMC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
