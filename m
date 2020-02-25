Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED9C16E9CB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 16:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9A76EB23;
	Tue, 25 Feb 2020 15:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4296E6EB23
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 15:16:28 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id i10so1326054wmd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 07:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jLQ17G7Si32m4YdigJRnge6XEHKSEqxuQUBivuv8hHs=;
 b=akTpZsn1Q0g0lZmIn9huLVwQnr+qYPtDkxyEsDYOfsOGfMuwQh5M9KJo18NPeCsVRJ
 ga3MoPxqSyQLXDuMVOLaAIMpPTyd/0cuQ9dCSmNariaPwzXbo0zgEkf7oXEYK+kR8qN+
 Hi6X2A3GPWMWRGuLkzwm8O/Y01EgOxbrddZB+f3ginUalbSLpy7ZYa0LFtuaoiD5hGtL
 +kwDAh+s92x1zvYz+mUI211BAWhBDlfcV+iLpXh9vLUdnI18bn8uLoQHR+5g4jWrtMAN
 l22CkAjZRnrODMzbRbuAAt8Rfc0BekWmaCUuxldaWBLQHcZs1ASWvaaFcPfz0mbkzy0u
 smbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jLQ17G7Si32m4YdigJRnge6XEHKSEqxuQUBivuv8hHs=;
 b=DeAzwCNNNf7kpNGrnp6h7q/DsBiJKlOwBGkRxkvGAJJyJWkMT/a13XMneJYYFQ3rWL
 kz566IABJ8fdczUfc54igcDZF3lf2zRkvUq41NAS+vh2l4cQTM282+s/IGMeS3zBGodZ
 Fm8LSzNJJlVzRByaF6nhDUXaYH/RDmhjNonn6I7JuVpigyprfFqAjhxAZZkafH7fihmm
 SQO28K3RXNer8XPMiWRh3sl/39Ts939REAOGj9kiiPESm4fgquIBrA3c/Bcl5dnEwo4v
 mo9WRCCF6tt0IHZmCYhn9+1aG1EScVE1l0toDhT3S18ziAxaDkkEHqmPrErsodvOaxeP
 aNVw==
X-Gm-Message-State: APjAAAWBnFHH06E461Ys3ttZ4HtoO69jaVjcpbypEAFNw7tRIWZxjRxL
 RTpYi0hiwMZx0UcD0p97zkKSzCuBFIv4PacQ79I=
X-Google-Smtp-Source: APXvYqx/CKQVbb3axzQk47PM1aRe8U35mXM2VXA83IkKwO8+10hRBLDwptGf2LubOs75q2TlAj9U59eS2YmffAOMX7g=
X-Received: by 2002:a7b:c152:: with SMTP id z18mr5691615wmi.70.1582643786863; 
 Tue, 25 Feb 2020 07:16:26 -0800 (PST)
MIME-Version: 1.0
References: <20200222175433.2259158-1-daniel.vetter@ffwll.ch>
 <CADnq5_PLJgZGb+9mhw_06oxRXiYsfRuO3PiRHCBLmNYtV4Q64Q@mail.gmail.com>
 <CAKMK7uH+Zh5MJc+b0omaGvqjhYjDVxq91fx9uRbYsrRBw+jeww@mail.gmail.com>
In-Reply-To: <CAKMK7uH+Zh5MJc+b0omaGvqjhYjDVxq91fx9uRbYsrRBw+jeww@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Feb 2020 10:16:13 -0500
Message-ID: <CADnq5_OCwr+NgjEYvH-9SrNZRshTYAyYk3xc2iYw=v8JJRHZZw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: Drop DRIVER_USE_AGP
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Xiaojie Yuan <xiaojie.yuan@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 "Tianci.Yin" <tianci.yin@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMzo0MyBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IE9uIE1vbiwgRmViIDI0LCAyMDIwIGF0IDU6MTAgUE0g
QWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFNh
dCwgRmViIDIyLCAyMDIwIGF0IDEyOjU0IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+IHdyb3RlOgo+ID4gPgo+ID4gPiBUaGlzIGRvZXNuJ3QgZG8gYW55dGhpbmcgZXhj
ZXB0IGF1dG8taW5pdCBkcm1fYWdwIHN1cHBvcnQgd2hlbiB5b3UKPiA+ID4gY2FsbCBkcm1fZ2V0
X3BjaV9kZXYoKS4gV2hpY2ggYW1kZ3B1IHN0b3BwZWQgZG9pbmcgd2l0aAo+ID4gPgo+ID4gPiBj
b21taXQgYjU4YzExMzE0YTE3MDZiZjA5NGM0ODllZjVjYjI4Zjc2NDc4YzcwNAo+ID4gPiBBdXRo
b3I6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+ID4gRGF0ZTog
ICBGcmkgSnVuIDIgMTc6MTY6MzEgMjAxNyAtMDQwMAo+ID4gPgo+ID4gPiAgICAgZHJtL2FtZGdw
dTogZHJvcCBkZXByZWNhdGVkIGRybV9nZXRfcGNpX2RldiBhbmQgZHJtX3B1dF9kZXYKPiA+ID4K
PiA+ID4gTm8gaWRlYSB3aGV0aGVyIHRoaXMgd2FzIGludGVudGlvbmFsIG9yIGFjY2lkZW50YWwg
YnJlYWthZ2UsIGJ1dCBJCj4gPiA+IGd1ZXNzIGFueW9uZSB3aG8gbWFuYWdlcyB0byBib290IGEg
dGhpcyBtb2Rlcm4gZ3B1IGJlaGluZCBhbiBhZ3AKPiA+ID4gYnJpZGdlIGRlc2VydmVzIGEgcHJp
Y2UuIEEgcHJpY2UgSSBuZXZlciBleHBlY3QgYW55b25lIHRvIGV2ZXIgY29sbGVjdAo+ID4gPiA6
LSkKPiA+ID4KPiA+ID4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KPiA+ID4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+ID4gPiBDYzogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+ID4gPiBD
YzogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KPiA+ID4gQ2M6IEV2YW4gUXVh
biA8ZXZhbi5xdWFuQGFtZC5jb20+Cj4gPiA+IENjOiAiVGlhbmNpLllpbiIgPHRpYW5jaS55aW5A
YW1kLmNvbT4KPiA+ID4gQ2M6ICJNYXJlayBPbMWhw6FrIiA8bWFyZWsub2xzYWtAYW1kLmNvbT4K
PiA+ID4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4KPiA+
IFNlcmllcyBpczoKPiA+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Cj4gPiBJJ20gaGFwcHkgdG8gdGFrZSB0aGUgcGF0Y2hlcyB0aHJvdWdoIG15
IHRyZWUgb3IgZHJtLW1pc2MuCj4KPiBJIGRvbid0IGhhdmUgYW55dGhpbmcgYnVpbGRpbmcgb24g
dG9wIG9mIHRoaXMsIGp1c3QgcmFuZG9tIHRoaW5ncyBmcm9tCj4gbXkgdHJlZS4gUmVhc29uIEkg
c2VudCBpdCBvdXQgaXMgTGF1cmVudCdzIHNlcmllcyB0byBtYWtlIGEgY29uc3QKPiBkcm1fZHJp
dmVyIHBvc3NpYmxlLCBidXQgSSBkb24ndCB0aGluayB0aGV5J2xsIGNvbmZsaWN0LiBTbyBhbWQg
dHJlZXMKPiBmb3IgdGhlIHNlcmllcyBpcyBwZXJmZWN0bHkgZmluZSBhbmQgcHJvYmFibHkgc2lt
cGxlc3QuCgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiAtRGFuaWVsCj4KPiA+Cj4gPiBBbGV4
Cj4gPgo+ID4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMgfCAyICstCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYwo+ID4gPiBpbmRleCA0NTk4ODM2YzVmYTQuLjZjZWE5MjAxNzEwOSAxMDA2NDQKPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+ID4gPiBAQCAtMTM3OSw3
ICsxMzc5LDcgQEAgaW50IGFtZGdwdV9maWxlX3RvX2Zwcml2KHN0cnVjdCBmaWxlICpmaWxwLCBz
dHJ1Y3QgYW1kZ3B1X2Zwcml2ICoqZnByaXYpCj4gPiA+Cj4gPiA+ICBzdGF0aWMgc3RydWN0IGRy
bV9kcml2ZXIga21zX2RyaXZlciA9IHsKPiA+ID4gICAgICAgICAuZHJpdmVyX2ZlYXR1cmVzID0K
PiA+ID4gLSAgICAgICAgICAgRFJJVkVSX1VTRV9BR1AgfCBEUklWRVJfQVRPTUlDIHwKPiA+ID4g
KyAgICAgICAgICAgRFJJVkVSX0FUT01JQyB8Cj4gPiA+ICAgICAgICAgICAgIERSSVZFUl9HRU0g
fAo+ID4gPiAgICAgICAgICAgICBEUklWRVJfUkVOREVSIHwgRFJJVkVSX01PREVTRVQgfCBEUklW
RVJfU1lOQ09CSiB8Cj4gPiA+ICAgICAgICAgICAgIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FLAo+
ID4gPiAtLQo+ID4gPiAyLjI0LjEKPiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4g
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4KPgo+Cj4gLS0KPiBEYW5p
ZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gKzQxICgw
KSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
