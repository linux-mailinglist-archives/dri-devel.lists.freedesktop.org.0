Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480BD3662A6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 01:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E8B6E916;
	Tue, 20 Apr 2021 23:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7968C6E914;
 Tue, 20 Apr 2021 23:56:38 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso14945637otl.0; 
 Tue, 20 Apr 2021 16:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sdH2eLsN/T4FPLAS3vSHNhFsKsAJGVwX3hswXoseQrs=;
 b=T8DM8LMHHxNR+xL04MypQHCUOpnUSxwcsohbH7C/xAssA3/Ocj27flU8eKIZflClpR
 PWM1gsP2J2KzBuR2NdX+i0DQVZbVpqkshYGm1sZ+K7eQxGO216DRSMP2CAKZDxASKpKg
 kMNkzemaBhRD4shnYdjNmKclUKvrdirMd+J3Zcgna/cWH14zIhCzfdbJuIezF/v0Q91/
 qIFZ8scZQLDFr8lcyq5r3WHTH1wg99Dd9oY0Na2LARByiHBVOYezuPO5Elt+n+Fn4ptB
 uvGDlJdDXFRW60fRUxGJniIBIhFdArXbKuHloNbOW2IZBR+Q71HowjOwrYduKV2BrzOl
 HSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sdH2eLsN/T4FPLAS3vSHNhFsKsAJGVwX3hswXoseQrs=;
 b=jcD6OEnFZ255cfAiUv3hemj9YhZbYJ9e/IuezLZ1Q7NuYCCm/lY0xRqSAVm6qHWEwm
 A02JdTl1hxckh3BBSI4g2TAGODGO3b96QxJb/TnSdcgUzwSl2743adbZ0aN9TxQdpvDZ
 YOBb1w7pdZ1SgLQPIkcVEqt1SWxLuqkPyNJS4VVw+C4Mgil+L7R6Z8XZ7lk5h3uqZCS1
 iL1h5mTPQ2F5uCEy0c769bNmx10hiWSrERZD5TqXMf0ftaWC2wcu1nYE7Ixqi0a3NMjH
 lHk1C3AWPdighTMXQTS3U/d6WlBF+AhFTHochYwtq+UjwMfX27GvPB5hxCcnqnqd46N0
 veyA==
X-Gm-Message-State: AOAM5327YZDWFIqNtlfAtID8VCXZgca/h5r2KUNy6kJU+J//xreKaaB3
 ybQqQ3jkMNXEhpDiMP49eF3nT3/+im1jQOymVmw=
X-Google-Smtp-Source: ABdhPJzGm4OklrZh8TLIZOWNex83qTUhrLP0gk1wujZgV3tbg0zGCwXxN0idchvfqSfFWqD+Dx0mTXqsCFioQfyVYAc=
X-Received: by 2002:a05:6830:15d3:: with SMTP id
 j19mr11441916otr.23.1618962997888; 
 Tue, 20 Apr 2021 16:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-26-lee.jones@linaro.org>
 <a368fff1-88a8-1515-6bac-5fe51eb0e059@amd.com>
In-Reply-To: <a368fff1-88a8-1515-6bac-5fe51eb0e059@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Apr 2021 19:56:26 -0400
Message-ID: <CADnq5_NO1gOWVg_n6UjZSw52J7M44P35RAVNFOeR7tLLZEA41g@mail.gmail.com>
Subject: Re: [PATCH 25/40] drm/radeon/radeon_device: Provide function name in
 kernel-doc header
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgQXByIDE2LCAyMDIxIGF0IDExOjUxIEFN
IENocmlzdGlhbiBLw7ZuaWcKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBB
bSAxNi4wNC4yMSB1bSAxNjozNyBzY2hyaWViIExlZSBKb25lczoKPiA+IEZpeGVzIHRoZSBmb2xs
b3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+ID4KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmM6MTEwMTogd2FybmluZzogVGhpcyBjb21tZW50IHN0
YXJ0cyB3aXRoICcvKionLCBidXQgaXNuJ3QgYSBrZXJuZWwtZG9jIGNvbW1lbnQuIFJlZmVyIERv
Y3VtZW50YXRpb24vZG9jLWd1aWRlL2tlcm5lbC1kb2MucnN0Cj4gPgo+ID4gQ2M6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+IENjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxp
ZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4g
Q2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KPgo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9kZXZpY2UuYyB8IDMgKystCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZp
Y2UuYwo+ID4gaW5kZXggY2M0NDVjNGNiYTJlMy4uNDZlZWEwMTk1MGNiMSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYwo+ID4gQEAgLTEwOTgsNyArMTA5OCw4
IEBAIHN0YXRpYyBib29sIHJhZGVvbl9jaGVja19wb3RfYXJndW1lbnQoaW50IGFyZykKPiA+ICAg
fQo+ID4KPiA+ICAgLyoqCj4gPiAtICogRGV0ZXJtaW5lIGEgc2Vuc2libGUgZGVmYXVsdCBHQVJU
IHNpemUgYWNjb3JkaW5nIHRvIEFTSUMgZmFtaWx5Lgo+ID4gKyAqIHJhZGVvbl9nYXJ0X3NpemVf
YXV0byAtIERldGVybWluZSBhIHNlbnNpYmxlIGRlZmF1bHQgR0FSVCBzaXplCj4gPiArICogICAg
ICAgICAgICAgICAgICAgICAgICAgYWNjb3JkaW5nIHRvIEFTSUMgZmFtaWx5Lgo+ID4gICAgKgo+
ID4gICAgKiBAZmFtaWx5OiBBU0lDIGZhbWlseSBuYW1lCj4gPiAgICAqLwo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
