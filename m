Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AF09F1FE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 20:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF3389B9F;
	Tue, 27 Aug 2019 18:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64FA89BCD;
 Tue, 27 Aug 2019 18:02:39 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id a17so6589302ybc.0;
 Tue, 27 Aug 2019 11:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XR6/sqrx3cd2fMLsbifvUJ8ua+YMdiSTj/B5AHiQ/oo=;
 b=aeWLeqoXXccM5dVjLnPNoaSizJ4RwS+ugjzWn6HSwN00MNKp9w7qmMfALvYqGb2MNt
 zQMuLVjJZ9MsSSeAPgqVV6kastfTJz5gz3sPbFWP180/qowI1Ue1FKcFnZPtWPznNhWK
 uweMUaxzrGNxjc/9qCsKy5YohmA5tk/MF4q82SahsRT36cBZiKt6Xwb1LZxlQ02NWvYM
 8Yu44SH7YoHuH0T2mHdEOz/jHf31fgW6Qh9AX8bPz0S8zCTQpEW5H+NrDz7UJxC5oMrt
 k2PV2B4K5Zv07j5tsEcAchCLvIBlIGQ7IVYTCIFfgsfRTp1FXqjK23yN0AMbTeR9aJW/
 I5Dw==
X-Gm-Message-State: APjAAAVNs6urXMP4F1Ame6a5OfAlG8lSmV5Wsil2vCEjBa8Ls3jjHEAz
 5vxLuznLtmZCyvtpt0VmsF3t1E5gU7YVXOMIOlA=
X-Google-Smtp-Source: APXvYqxd6NcDOYtY7Ak3XIp6fVqXbHG9XSq7Jyq7V1p+lifxpjKe5DCXK3UfYi6O9dmpCKvle1L+kvbJoVRQ2HYcryQ=
X-Received: by 2002:a25:bec5:: with SMTP id k5mr33069ybm.259.1566928958725;
 Tue, 27 Aug 2019 11:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190827162924.88524-1-rrangel@chromium.org>
In-Reply-To: <20190827162924.88524-1-rrangel@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Aug 2019 14:02:18 -0400
Message-ID: <CADnq5_ME=erztEhDhW5Z2RYr7kpMT_OOHm2xyJDPGd8a2d3LuA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix struct init in update_bounding_box
To: Raul E Rangel <rrangel@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=XR6/sqrx3cd2fMLsbifvUJ8ua+YMdiSTj/B5AHiQ/oo=;
 b=I5TOl98iut1jtvrrC0COedDbhwBOFmzUo6dIk8ajzgy6yhTjI8CfubfiZQcp94YzPR
 0YeziR8YP3Qi8QhuHV6XEzVgPFK7+kM4a8Q0+5an/Q+UQjDRQOVspbzmmt4B9XE9wFck
 UKwfqXUYhDvuDFZLRCpm31LM6XIUgzLVJKbQBsL5Pfc+Vu3Xqo/flnIugVNJQI7nOsX6
 uBdXhkB4DmMIP7dwvhYAY+fUS+9FLRbD0HMyj3/Aw6ca+Sq8HynGTxHLTeoygY1pjsg2
 wSTZA2c6IG5PLwnNU2Zlgnr5w0RQlIK3W1Gc84n51/pm74QCrV8d2OPgRRJjxDwp0Tj7
 cI1g==
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
Cc: Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 hersen wu <hersenxs.wu@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTozMyBQTSBSYXVsIEUgUmFuZ2VsIDxycmFuZ2VsQGNo
cm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBkY24yMF9yZXNvdXJjZS5jOjI2MzY6OTogZXJyb3I6IG1p
c3NpbmcgYnJhY2VzIGFyb3VuZCBpbml0aWFsaXplciBbLVdlcnJvcj1taXNzaW5nLWJyYWNlc10K
PiAgIHN0cnVjdCBfdmNzX2RwaV92b2x0YWdlX3NjYWxpbmdfc3QgY2FsY3VsYXRlZF9zdGF0ZXNb
TUFYX0NMT0NLX0xJTUlUX1NUQVRFU10gPSB7MH07Cj4gICAgICAgICAgXgo+Cj4gRml4ZXM6IDdl
ZDRlNjM1MmMxNmYgKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBEQ04yIEhXIFNlcXVlbmNlciBhbmQg
UmVzb3VyY2UiKQo+Cj4gU2lnbmVkLW9mZi1ieTogUmF1bCBFIFJhbmdlbCA8cnJhbmdlbEBjaHJv
bWl1bS5vcmc+Cj4gLS0tCj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKPiBpbmRleCBiOTQ5ZTIwMmQ2Y2IuLmQ4ZGQ5
OWJmYTI3NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCj4gQEAgLTI2MzMsNyArMjYzMyw3IEBAIHN0YXRpYyB2
b2lkIGNhcF9zb2NfY2xvY2tzKAo+ICBzdGF0aWMgdm9pZCB1cGRhdGVfYm91bmRpbmdfYm94KHN0
cnVjdCBkYyAqZGMsIHN0cnVjdCBfdmNzX2RwaV9zb2NfYm91bmRpbmdfYm94X3N0ICpiYiwKPiAg
ICAgICAgICAgICAgICAgc3RydWN0IHBwX3NtdV9udl9jbG9ja190YWJsZSAqbWF4X2Nsb2Nrcywg
dW5zaWduZWQgaW50ICp1Y2xrX3N0YXRlcywgdW5zaWduZWQgaW50IG51bV9zdGF0ZXMpCj4gIHsK
PiAtICAgICAgIHN0cnVjdCBfdmNzX2RwaV92b2x0YWdlX3NjYWxpbmdfc3QgY2FsY3VsYXRlZF9z
dGF0ZXNbTUFYX0NMT0NLX0xJTUlUX1NUQVRFU10gPSB7MH07Cj4gKyAgICAgICBzdHJ1Y3QgX3Zj
c19kcGlfdm9sdGFnZV9zY2FsaW5nX3N0IGNhbGN1bGF0ZWRfc3RhdGVzW01BWF9DTE9DS19MSU1J
VF9TVEFURVNdID0ge307CgpJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBqdXN0IHVzZSBh
IG1lbXNldC4gIERpZmZlcmVudCBjb21waWxlcnMKc2VlbXMgdG8gZG8gdGhlIHdyb25nIHRoaW5n
IHdpdGggdGhlc2Ugc29ydCBvZiBpbml0aWFsaXphdGlvbnMuCgpBbGV4Cgo+ICAgICAgICAgaW50
IGk7Cj4gICAgICAgICBpbnQgbnVtX2NhbGN1bGF0ZWRfc3RhdGVzID0gMDsKPiAgICAgICAgIGlu
dCBtaW5fZGNmY2xrID0gMDsKPiAtLQo+IDIuMjMuMC4xODcuZzE3ZjViNzU1NmMtZ29vZwo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
