Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C51C14CC19
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 15:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B5E6F571;
	Wed, 29 Jan 2020 14:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EF76F570
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 14:06:59 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 66so15601342otd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 06:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=okX83GYMa/iZmvViwGHUNfKS0A27fq8qtFQ/CgC9uOc=;
 b=IKCWB9iH8JrZmN6ppT0CHuYZVuQS3OcNZ6FnGbzDJRw+Ho+Dv4G4aCiBJxF167reQE
 EYCRbpbw3WCpLatt0EMrXcTmFTW6vAuuZV6vul26LPVap56g63D4z93OgxXf6vjlLUfJ
 RirpVsz55XsCZnGIcQEbpfURdSL5WuRPtlbdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=okX83GYMa/iZmvViwGHUNfKS0A27fq8qtFQ/CgC9uOc=;
 b=NWQVcFq1Rl/YDo6wekVulp7yh+Li7mTuCZ7hkhLkWA4GYxc5j47gTBsiXD9USWBNU3
 1kcp45cHg7aFBPdZNhWm3/akCrxLzqAo3CQhwSp7yZDQCbEwetc1J6geqxFnr/tu/z+1
 ahCi4Q+nfBeQjOxvz1+so0wtzohSWkwV+VwTsM61oYj/2JpCUBJuMv2ovSRT8sqYhird
 wsfQgfsdhvO4dGy32Id6JMqUmOr3o5q11sqnhqC9sb2EF9OzmcNOpsmqsNlEjnX+S9uO
 k6Oh8dXot7cl7JER1L+QUFctPvF19yd396Jud9B5pMC8sMoPMkECi0Mu3cYYc/nVvahe
 a5/g==
X-Gm-Message-State: APjAAAVR1dYXr/woe2SQKyXzgn0j9jSdduPm/EGaRv/B5InKGcWjH9NB
 WU1txtFRALhmerjyJ1DFpksSOHpDz2F+hVWZe1L2NA==
X-Google-Smtp-Source: APXvYqyudpjVfzJ9h0EQ7t5ykVecXlJLiGSbGrkJ8c4FNBAHkN/dnzEFRnJralgsDIA8kt6cIHSJJPdzvM3MphPV7rA=
X-Received: by 2002:a9d:6196:: with SMTP id g22mr20963911otk.204.1580306818697; 
 Wed, 29 Jan 2020 06:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20200129082410.1691996-1-daniel.vetter@ffwll.ch>
 <20200129082410.1691996-4-daniel.vetter@ffwll.ch>
 <b9214acc-24ea-4007-643b-a07f6b6db065@tronnes.org>
In-Reply-To: <b9214acc-24ea-4007-643b-a07f6b6db065@tronnes.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 29 Jan 2020 15:06:47 +0100
Message-ID: <CAKMK7uFXnrdEr7CB_-bjXYvyYAi_ML5EO=KA8RGMomyHSwNWHw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/client: Rename _force to _locked
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMjoxNiBQTSBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4gd3JvdGU6Cj4gRGVuIDI5LjAxLjIwMjAgMDkuMjQsIHNrcmV2IERhbmllbCBW
ZXR0ZXI6Cj4gPiBQbHVzIGV4dGVuZCB0aGUga2VybmVsZG9jIGEgYml0IHRvIGV4cGxhaW4gaG93
IHRoaXMgc2hvdWxkIGJlIHVzZWQuCj4gPiBXaXRoIHRoZSBwcmV2aW91cyBwYXRjaCB0byBkcm9w
IHRoZSBmb3JjZSByZXN0b3JlIHRoZSBtYWluIHVzZXIgb2YKPiA+IHRoaXMgZnVuY3Rpb24gaXMg
bm90IGVtcGhhc2lzIG9uIHRoZSAiSSBob2xkIHRoZSBpbnRlcm5hbCBtYXN0ZXIgbG9jawo+Cj4g
VGhlIF9ub3RfIGNvbmZ1c2VzIG1lLCB0aGUgZW1waGFzaXMgaXMgbm93IHRoYXQgIkkgaG9sZCB0
aGUgbG9jayIgcmlnaHQ/CgpPb3BzLCBJIGNvbmZ1c2VkIG15c2VsZiBhbmQgbWl4ZWQgdGhpbmdz
IHVwIGJldHdlZW4gb2xkIGFuZCBuZXcKbWVhbmluZyBhbmQgd2hhdCdzIG5vdyBpbXBvcnRhbnQg
YW5kIHdoYXQgbm90LiBzL25vdC9ub3cvLCBJJ2xsIGZpeAp3aGVuIGFwcGx5aW5nLgotRGFuaWVs
Cgo+Cj4gPiBhbHJlYWR5IiBhc3BlY3QsIHNvIHJlbmFtZSB0aGUgZnVuY3Rpb24gdG8gbWF0Y2gu
Cj4gPgo+ID4gU3VnZ2VzdGVkIGJ5IE5vcmFsZi4KPiA+Cj4gPiBDYzogTm9yYWxmIFRyw7hubmVz
IDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+IC0tLQo+Cj4gUmV2aWV3ZWQtYnk6IE5vcmFsZiBU
csO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
