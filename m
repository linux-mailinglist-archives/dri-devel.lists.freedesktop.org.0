Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821E9D2C43
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 16:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF8C6EB51;
	Thu, 10 Oct 2019 14:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF406EB51
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 14:18:45 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p14so8138144wro.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 07:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eOSzfFkhHtAF1N0x83qOI2/i6JRL9a2nxMHNg6FelE8=;
 b=VNlnEu15+asgM/ZFdx8+aDdMmLL6xDh01qdXgKDEn6ddyrRa3OADvfFEiDKEpcCPlw
 r5z/qbbcrJbgMNUnIPSd5Tf6zkMmVJQS93ob0TKNpT8+14YDI+T9LxrBGcPQGDPrg5kg
 q0ENUBCCltjaI0cyqo7zcmuxVJGIj/25RaOlwOg9WB+l5gIFzHIqZW5UiMYJUbCXRK0M
 Jsjgpnn8qsdo8ApWb4evHN1vZxJ4g/Vu8++8ltMocfMWEpuH5aA11i0oOYWI27dFdnhf
 kcNCoiwNvUEtVv+iQhpvqgqE8RGMpqkfJ130o24FDOHf+2FX7CR//96rekyiAuevMnh6
 7A8Q==
X-Gm-Message-State: APjAAAVyafVBEdA6lBpHY/MszF/QsWUF3UZ0gVd1N+3RicuAjClB6DNH
 HogBpFh9iqz0SR6DGcpMDSEDz2dm4HAkbB0bMRKv3iBx
X-Google-Smtp-Source: APXvYqyDjVjNtoeYFeBEJIv2/KhrYER4Ls6R19+8u31CCijIdcmo8FTIj2fyFGVSsRkHdtIUmZcFu5rxZZu2rJXr/LA=
X-Received: by 2002:adf:ee87:: with SMTP id b7mr8618071wro.154.1570717123655; 
 Thu, 10 Oct 2019 07:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191009121447.31017-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20191009121447.31017-1-ben.dooks@codethink.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Oct 2019 10:18:31 -0400
Message-ID: <CADnq5_MrjTye5cepaWCBz95vtg7usVgVzcUvVQKxkvjr2MmA9A@mail.gmail.com>
Subject: Re: [PATCH] drm/scheduler: make unexported items static
To: Ben Dooks <ben.dooks@codethink.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eOSzfFkhHtAF1N0x83qOI2/i6JRL9a2nxMHNg6FelE8=;
 b=Cd25n1SauzvQ82nEGDNrsZtIkqyVODKK98xVdMC0WI56kh8Rss6fA6w/B/vzyO9O33
 W8OBKqBZm2pjGmMXKZzJ1/pqHkmsv5ihyvry0gZmGtpO+D/amRKyedTsKkXFBpEn/KFO
 OfX4mSW0yaMroxKzpqq9tr+UZIYL7CwW7jFHV9MCox25XAHqato+SCBbrn5+LRAOFiq2
 C+43mTTlV00Hcj2zpgC3z0G5bcn46fn4cb4tGy5wi1oHcjsBhWOTSIHNZCWFdSzw33MV
 1ofahc0H1XhcweGNvtw+tU4hVK6rilF7wlktFxJ5DtD/Pzp7ziK5gTTa5NvF94gyfWeY
 7rkQ==
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
Cc: linux-kernel@lists.codethink.co.uk, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMjo1NSBBTSBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2Rl
dGhpbmsuY28udWs+IHdyb3RlOgo+Cj4gVGhlIGRybV9zY2hlZF9mZW5jZV9vcHNfe3NjaGVkdWxl
ZCxmaW5pc2hlZH0gYXJlIG5vdCBleHBvcnRlZAo+IGZyb20gdGhlIGZpbGUgc28gbWFrZSB0aGVt
IHN0YXRpYyB0byBhdm9pZCB0aGUgZm9sbG93aW5nCj4gd2FybmluZ3MgZnJvbSBzcGFyc2U6Cj4K
PiBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2ZlbmNlLmM6MTMxOjI4OiB3YXJuaW5n
OiBzeW1ib2wgJ2RybV9zY2hlZF9mZW5jZV9vcHNfc2NoZWR1bGVkJyB3YXMgbm90IGRlY2xhcmVk
LiBTaG91bGQgaXQgYmUgc3RhdGljPwo+IGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
ZmVuY2UuYzoxMzc6Mjg6IHdhcm5pbmc6IHN5bWJvbCAnZHJtX3NjaGVkX2ZlbmNlX29wc19maW5p
c2hlZCcgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPgo+IFNpZ25lZC1v
ZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KClJldmlld2VkIGFu
ZCBwdXNoZWQgb3V0IHRvIGRybS1taXNjLW5leHQuCgpUaGFua3MhCgpBbGV4Cgo+IC0tLQo+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2ZlbmNlLmMgfCA0ICsrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2ZlbmNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2ZlbmNlLmMKPiBpbmRleCA1NDk3NzQwOGY1NzQuLjhi
NDVjM2ExYjg0ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X2ZlbmNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2ZlbmNlLmMK
PiBAQCAtMTI4LDEzICsxMjgsMTMgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2ZlbmNlX3JlbGVh
c2VfZmluaXNoZWQoc3RydWN0IGRtYV9mZW5jZSAqZikKPiAgICAgICAgIGRtYV9mZW5jZV9wdXQo
JmZlbmNlLT5zY2hlZHVsZWQpOwo+ICB9Cj4KPiAtY29uc3Qgc3RydWN0IGRtYV9mZW5jZV9vcHMg
ZHJtX3NjaGVkX2ZlbmNlX29wc19zY2hlZHVsZWQgPSB7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZG1hX2ZlbmNlX29wcyBkcm1fc2NoZWRfZmVuY2Vfb3BzX3NjaGVkdWxlZCA9IHsKPiAgICAgICAg
IC5nZXRfZHJpdmVyX25hbWUgPSBkcm1fc2NoZWRfZmVuY2VfZ2V0X2RyaXZlcl9uYW1lLAo+ICAg
ICAgICAgLmdldF90aW1lbGluZV9uYW1lID0gZHJtX3NjaGVkX2ZlbmNlX2dldF90aW1lbGluZV9u
YW1lLAo+ICAgICAgICAgLnJlbGVhc2UgPSBkcm1fc2NoZWRfZmVuY2VfcmVsZWFzZV9zY2hlZHVs
ZWQsCj4gIH07Cj4KPiAtY29uc3Qgc3RydWN0IGRtYV9mZW5jZV9vcHMgZHJtX3NjaGVkX2ZlbmNl
X29wc19maW5pc2hlZCA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkbWFfZmVuY2Vfb3BzIGRy
bV9zY2hlZF9mZW5jZV9vcHNfZmluaXNoZWQgPSB7Cj4gICAgICAgICAuZ2V0X2RyaXZlcl9uYW1l
ID0gZHJtX3NjaGVkX2ZlbmNlX2dldF9kcml2ZXJfbmFtZSwKPiAgICAgICAgIC5nZXRfdGltZWxp
bmVfbmFtZSA9IGRybV9zY2hlZF9mZW5jZV9nZXRfdGltZWxpbmVfbmFtZSwKPiAgICAgICAgIC5y
ZWxlYXNlID0gZHJtX3NjaGVkX2ZlbmNlX3JlbGVhc2VfZmluaXNoZWQsCj4gLS0KPiAyLjIzLjAK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
