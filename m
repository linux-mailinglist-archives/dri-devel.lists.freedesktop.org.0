Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6962AE395
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 23:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3480089D00;
	Tue, 10 Nov 2020 22:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439B389CFA;
 Tue, 10 Nov 2020 22:45:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 10so4871213wml.2;
 Tue, 10 Nov 2020 14:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gIHRk4WzqhkavwE/53+xiX6vw4oD1nHmuhdAmxZjOMI=;
 b=FUh6dQ1m/msnRtj5Hmd4z78dOenOvzNyZCMgZ87kFDWUSaqVwnSMneS0y79HDL51kz
 0Y5ci7JUQo5VSLO51iKKiSbZAkg8OzhczCHm2G4HLv3l6zoX4o9osvtBS2dxPdtqiUim
 zzPsVCSkQlY4fmJlY37/Fhuvo4TRPgzZwqbmlNtbwvG23NbhiVxdDGjs0jV8B4aROXne
 cPLygauqmTh4RugAOdZQ8Q4Nx6AjrNoLc4Cpm48Wy+P+Cr6QGI3duY/6Ym6PvdmtGeyx
 J1b/Z81yno7IWe5J6+Kd5erT39/XfyNktvkENc+T7LPvkxBvPmDaIbeSknvTS0qgOefg
 4wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gIHRk4WzqhkavwE/53+xiX6vw4oD1nHmuhdAmxZjOMI=;
 b=otU1hnzeb6v3RRj5oLpQ9HREeSChUTjV5BxXVy6sETJGRWIOrHT4VFCDTICTtEA8Uq
 LKS1VIIiPlaQpdRWQDHQBCZRfmWazfS/3nCj8J9quMiBMT29flVX+K9XPKEszuyJcorC
 fNTziTXlXQEX2B/gMK5mOC+ZCf5d4uGSqUfX5TPBv2tslpvASJUlkghHTvkbUj22gjQ9
 9lqZ7gkb3YZYmkgTLuR5GEFl1pTnY+AMP/2Eg9CgrCx6giEliA6wqyGCXbpqcgQ9Ru0T
 2g2j4R8DkODIxBsa1wwCrEVtk0pAfClOtZVs9ycNja7KXefkJe1mt9nH4oUvzJm0CtzS
 R5DQ==
X-Gm-Message-State: AOAM532YuNWLEFMcgd4o8zrL/gvLoNheFKovq4jJTF6kdDmDjyMlAC5M
 yHexq/AH0U4gZe9zZvo0+9cpB9ol+XALhB2/O9A=
X-Google-Smtp-Source: ABdhPJxUXQ0LQsJ3DS6nEHKwM8BdhNoRjD1JrShK9j9JF1Ufc4A68mOk7Y0eDhjSIaz329/nrmZXg4qr7Em4AoxHBIM=
X-Received: by 2002:a1c:6302:: with SMTP id x2mr405139wmb.56.1605048327960;
 Tue, 10 Nov 2020 14:45:27 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-20-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-20-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 17:45:16 -0500
Message-ID: <CADnq5_OU0RmQit_WOEQEAUX1=m1EHz9CLufSD8zyTMbzJoDtug@mail.gmail.com>
Subject: Re: [PATCH 19/20] drm/radeon/r600: Fix a misnamed parameter
 description and a formatting issue
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgOSwgMjAyMCBhdCA0OjE5IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmM6Mjk2NTogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncmVzdicgbm90IGRlc2NyaWJlZCBpbiAn
cjYwMF9jb3B5X2NwZG1hJwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuYzoyOTY1OiB3
YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdmZW5jZScgZGVzY3JpcHRpb24gaW4g
J3I2MDBfY29weV9jcGRtYScKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmM6NDM4Mjog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncmRldicgbm90IGRlc2NyaWJl
ZCBpbiAncjYwMF9tbWlvX2hkcF9mbHVzaCcKPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1p
dC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBU
aGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuYyB8IDQg
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yNjAwLmMKPiBpbmRleCA5NTg3NzkyNTAzNTI1Li4wYTA4NWI4NWY1NTlk
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMKPiBAQCAtMjk1Miw3ICsyOTUyLDcgQEAgYm9vbCBy
NjAwX3NlbWFwaG9yZV9yaW5nX2VtaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCj4gICAq
IEBzcmNfb2Zmc2V0OiBzcmMgR1BVIGFkZHJlc3MKPiAgICogQGRzdF9vZmZzZXQ6IGRzdCBHUFUg
YWRkcmVzcwo+ICAgKiBAbnVtX2dwdV9wYWdlczogbnVtYmVyIG9mIEdQVSBwYWdlcyB0byB4ZmVy
Cj4gLSAqIEBmZW5jZTogcmFkZW9uIGZlbmNlIG9iamVjdAo+ICsgKiBAcmVzdjogRE1BIHJlc2Vy
dmF0aW9uIG9iamVjdCB0byBtYW5hZ2UgZmVuY2VzCj4gICAqCj4gICAqIENvcHkgR1BVIHBhZ2lu
ZyB1c2luZyB0aGUgQ1AgRE1BIGVuZ2luZSAocjZ4eCspLgo+ICAgKiBVc2VkIGJ5IHRoZSByYWRl
b24gdHRtIGltcGxlbWVudGF0aW9uIHRvIG1vdmUgcGFnZXMgaWYKPiBAQCAtNDM3MSw3ICs0Mzcx
LDcgQEAgaW50IHI2MDBfZGVidWdmc19tY19pbmZvX2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYpCj4KPiAgLyoqCj4gICAqIHI2MDBfbW1pb19oZHBfZmx1c2ggLSBmbHVzaCBIb3N0IERh
dGEgUGF0aCBjYWNoZSB2aWEgTU1JTwo+IC0gKiByZGV2OiByYWRlb24gZGV2aWNlIHN0cnVjdHVy
ZQo+ICsgKiBAcmRldjogcmFkZW9uIGRldmljZSBzdHJ1Y3R1cmUKPiAgICoKPiAgICogU29tZSBS
NlhYL1I3WFggZG9uJ3Qgc2VlbSB0byB0YWtlIGludG8gYWNjb3VudCBIRFAgZmx1c2hlcyBwZXJm
b3JtZWQKPiAgICogdGhyb3VnaCB0aGUgcmluZyBidWZmZXIuIFRoaXMgbGVhZHMgdG8gY29ycnVw
dGlvbiBpbiByZW5kZXJpbmcsIHNlZQo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
