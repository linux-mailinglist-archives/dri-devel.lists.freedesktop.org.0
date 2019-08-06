Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901BD83380
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 16:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380316E39B;
	Tue,  6 Aug 2019 14:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B33F6E397;
 Tue,  6 Aug 2019 14:03:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n1so1747961wrw.12;
 Tue, 06 Aug 2019 07:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wzq+p0eJtG7jZmjcp0d0DzrnblGaqYlr4Ws+kyqhj58=;
 b=NlnK0viK8seQfxLtCpuWIqAqPT4zOIonBaW98ix3Mqa+vQa1ukee3y/C9Am8O7YXqW
 Cwfw35pv4kHH9mi3cxe/ZqX2CxfZOL00U17YAQgnnEPVjHyS4hYfSZnHcYATHhs9sdIj
 iyRpMs08JDFYq8IoGBp0hOuGt1yo5rCIaaqcoZEzIxAXOniYwwId6wu5IscEe4NeeuR9
 wJiBLVFaktIlZ0M4wQwCiw6jsMHr+NR15NVXryXnaH8tcwghYGP38V9wdpmI5FD8GhUJ
 OQJvvAHXxgPXKXXuLftegz2u7uQbbdWQUJqhXc1PQyKNxyE5NMNyZIExNWx0OoLj7gBm
 PDhg==
X-Gm-Message-State: APjAAAUk/e2Q4x/RUL4oNbSCZlsW2SO7qw/DrQsh6XPh/3oOU6JRnemV
 vySf92CLY/syZFGEX5LbmWUwmyzWF4D/l+A734g=
X-Google-Smtp-Source: APXvYqwOGQ7HlbmyoDQLAdlLJKJRQ1bfFrRaYx7B8v3wp930Mwl5WIS0fLGyOH5g9JNHWn+kueNPW+SC9OMB9w4zoV4=
X-Received: by 2002:adf:f94a:: with SMTP id q10mr4761229wrr.341.1565100228559; 
 Tue, 06 Aug 2019 07:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190805172138.GA4534@hari-Inspiron-1545>
In-Reply-To: <20190805172138.GA4534@hari-Inspiron-1545>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Aug 2019 10:03:36 -0400
Message-ID: <CADnq5_MniQgphMuAsYkvYT9QerSTRYLQQwM_yo9Qxg09Tx-ceA@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: amd: powerplay: Remove logically dead code
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Wzq+p0eJtG7jZmjcp0d0DzrnblGaqYlr4Ws+kyqhj58=;
 b=BAuvXa0eF4zMO6GKu4f1j22IN5GzcxSbI1guPiwAvB1N3Z/E5WzMH6q9eISheTlTc3
 2yXPskE2Qzff9l48mRqV6eXCDk0uVCZICiL5bZWedjumXmF3xsh8e/PojyBsX++U0gCh
 4GTZvlN92rJkl36tM8IbgY4fvjGZZRIqzgjXsdpg8tgw0calahgP86oyg8VFT85fjbvK
 22MH5LMTWKiSOq06XOI4LVRMRqSkY+jCBwOY1wITXTL1fizGO2rEgaxG/8vueVuIB93M
 +56lKW/6kIpSPtGAx66H2O/vL9FJa++h5qebQS+xDNrYOC3S8L15bEnVW4rMh+lzJoTM
 XtsQ==
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgNSwgMjAxOSBhdCAzOjAxIFBNIEhhcmlwcmFzYWQgS2VsYW0KPGhhcmlwcmFz
YWQua2VsYW1AZ21haWwuY29tPiB3cm90ZToKPgo+IFJlc3VsdCBvZiBwb2ludGVyIGFpcnRobWVu
dGljIGlzIG5ldmVyIG51bGwKPgo+IGZpeCBjb3Zlcml0eSBkZWZlY3Q6MTQ1MTg3Ngo+Cj4gU2ln
bmVkLW9mZi1ieTogSGFyaXByYXNhZCBLZWxhbSA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+
CgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvc211X3YxMV8wLmMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92
MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKPiBpbmRl
eCBlZTczOWMwLi5hM2FjZDc3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3NtdV92MTFfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
c211X3YxMV8wLmMKPiBAQCAtNzM2LDggKzczNiw2IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3dy
aXRlX3dhdGVybWFya3NfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCj4gICAgICAgICBz
dHJ1Y3Qgc211X3RhYmxlICp0YWJsZSA9IE5VTEw7Cj4KPiAgICAgICAgIHRhYmxlID0gJnNtdV90
YWJsZS0+dGFibGVzW1NNVV9UQUJMRV9XQVRFUk1BUktTXTsKPiAtICAgICAgIGlmICghdGFibGUp
Cj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gICAgICAgICBpZiAoIXRhYmxl
LT5jcHVfYWRkcikKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gLS0KPiAyLjcu
NAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
