Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97152C928F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 00:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEE489BFB;
	Mon, 30 Nov 2020 23:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE9F899D6;
 Mon, 30 Nov 2020 23:32:02 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id t23so3102427oov.4;
 Mon, 30 Nov 2020 15:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+4SG1W6ZYxr21uP2r2HXOaj3oH3XrFM1o5qmgSoZzy0=;
 b=W8P4tc7lqvKcl6a682oVHo8LIL7zrF3HorAGO901QT9xJcv+mt4nN6VQuV2x4Rkm6P
 5b2nR8Gq0AuFtzHQ+rAWlF5X11SU9FxyROTtoCzkoVeuvvY67NwM0PBkjJ6vk85K7KcK
 0PQtSIW0lMXYzvjVSnrwqjs25P1AePYUzeHdR2zH2NLv1qWEQIhZ3HhKmD53wUrQ8sVh
 0JmwnwIvO/Qh1BQY9NsckOckCjyV8nSmw/pATYJKdwYj0PkRG3vgCvW5LacqrCGEkkMX
 FAathHy1+jxH6hZC073PN9FW88OKd3xgfpG8URkJsfSKLabb6vlqMbE56iDB68Lj7c4m
 t1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+4SG1W6ZYxr21uP2r2HXOaj3oH3XrFM1o5qmgSoZzy0=;
 b=LRv3yxvL2fxDsDdMb51iWqQO57nkgrH8OWQ11q2n/zQCeJn/OZYnF4PUfHM9AwQ600
 stunCS9Efx5gwD6jIm2qEHslEhCf02vGzCghSBzAVwwFeDGM//dYjnoTffDZjTqSO/FC
 bz0rmNsThBIrXIBELYb9Gl7XzGl1JteQ7mQrJg6SspjKhlWY1SRY2cHlbrUnnG9CX912
 iOPTw5PqgzzFgr55ftaQW6QPqn2V6zKIblRnLHrEdnb3PrbY7XGrxpe6uFtjlzx/107n
 3PnDv+L6lLLJofi9fL8QfhnfC0jBk+HVQoma8a3+LmahYOE4aDf2jX1bKE5P+FPLd5iO
 GpRQ==
X-Gm-Message-State: AOAM533P+Xoi1tyZuRsp/cEkJtCB0jQqWE9VZHU4l/g24P5R0iZ8oDVU
 k8g6KOfudXWYEM8XHaKToArd9BbBlpBw0x7Ue7Jj8woq
X-Google-Smtp-Source: ABdhPJzQIvDtzw/bx/lT+aZ9bxgSsYcP1s6cpKoEtS3ZahAioGtuidQu7LMMgOkM0uQaLQWTQK+wLcG2UpUHTggobuA=
X-Received: by 2002:a4a:e0ce:: with SMTP id e14mr6193oot.72.1606779121408;
 Mon, 30 Nov 2020 15:32:01 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-12-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-12-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 18:31:50 -0500
Message-ID: <CADnq5_ORvcezYqvKv6xs8JKKFDxZ=Lrm9GOCxYBeJ8-fJAd0wg@mail.gmail.com>
Subject: Re: [PATCH 11/40] drm/amd/pm/powerplay/hwmgr/ppevvmath: Place
 variable declaration under same clause as its use
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
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0MyBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxh
eS9od21nci9wcGV2dm1hdGguaDogSW4gZnVuY3Rpb24g4oCYZk11bHRpcGx54oCZOgo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdtZ3IvcHBldnZtYXRoLmg6
MzM2OjIyOiB3YXJuaW5nOiB2YXJpYWJsZSDigJhZX0xlc3NUaGFuT25l4oCZIHNldCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9od21nci9wcGV2dm1hdGguaDozMzY6Nzogd2FybmluZzog
dmFyaWFibGUg4oCYWF9MZXNzVGhhbk9uZeKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQo+Cj4gQ2M6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cj4g
Q2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlz
dGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4CgoKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHBldnZtYXRoLmggfCA2ICsrKy0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3BwZXZ2bWF0aC5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHBldnZtYXRoLmgKPiBp
bmRleCA4ZjUwYTAzODM5NmNlLi5kYWMyOWZlNmNmYzZmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3BwZXZ2bWF0aC5oCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHBldnZtYXRoLmgKPiBAQCAtMzMzLDE0
ICszMzMsMTQgQEAgc3RhdGljIGZJbnQgZk11bHRpcGx5IChmSW50IFgsIGZJbnQgWSkgLyogVXNl
cyA2NC1iaXQgaW50ZWdlcnMgKGludDY0X3QpICovCj4gIHsKPiAgICAgICAgIGZJbnQgUHJvZHVj
dDsKPiAgICAgICAgIGludDY0X3QgdGVtcFByb2R1Y3Q7Cj4gKwo+ICsgICAgICAgLypUaGUgZm9s
bG93aW5nIGlzIGZvciBhIHZlcnkgc3BlY2lmaWMgY29tbW9uIGNhc2U6IE5vbi16ZXJvIG51bWJl
ciB3aXRoIE9OTFkgZnJhY3Rpb25hbCBwb3J0aW9uKi8KPiArICAgICAgIC8qIFRFTVBPUkFSSUxZ
IERJU0FCTEVEIC0gQ0FOIEJFIFVTRUQgVE8gSU1QUk9WRSBQUkVDSVNJT04KPiAgICAgICAgIGJv
b2wgWF9MZXNzVGhhbk9uZSwgWV9MZXNzVGhhbk9uZTsKPgo+ICAgICAgICAgWF9MZXNzVGhhbk9u
ZSA9IChYLnBhcnRpYWwucmVhbCA9PSAwICYmIFgucGFydGlhbC5kZWNpbWFsICE9IDAgJiYgWC5m
dWxsID49IDApOwo+ICAgICAgICAgWV9MZXNzVGhhbk9uZSA9IChZLnBhcnRpYWwucmVhbCA9PSAw
ICYmIFkucGFydGlhbC5kZWNpbWFsICE9IDAgJiYgWS5mdWxsID49IDApOwo+Cj4gLSAgICAgICAv
KlRoZSBmb2xsb3dpbmcgaXMgZm9yIGEgdmVyeSBzcGVjaWZpYyBjb21tb24gY2FzZTogTm9uLXpl
cm8gbnVtYmVyIHdpdGggT05MWSBmcmFjdGlvbmFsIHBvcnRpb24qLwo+IC0gICAgICAgLyogVEVN
UE9SQVJJTFkgRElTQUJMRUQgLSBDQU4gQkUgVVNFRCBUTyBJTVBST1ZFIFBSRUNJU0lPTgo+IC0K
PiAgICAgICAgIGlmIChYX0xlc3NUaGFuT25lICYmIFlfTGVzc1RoYW5PbmUpIHsKPiAgICAgICAg
ICAgICAgICAgUHJvZHVjdC5mdWxsID0gWC5mdWxsICogWS5mdWxsOwo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gUHJvZHVjdAo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
