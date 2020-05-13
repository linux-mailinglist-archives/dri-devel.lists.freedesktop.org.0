Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8151D4632
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098CE89EA6;
	Fri, 15 May 2020 06:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE236E9A5;
 Wed, 13 May 2020 11:55:29 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id e2so13926449eje.13;
 Wed, 13 May 2020 04:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dwSZ/cYngXQKvlWb23OdV+haQ9k3VXAPp4SIUIXgqs4=;
 b=Yzt9tfQVrHVU8vHLbysGEiBP86H2+TFsxNCxUcnlmaAEBug2z43dp5YxMyPiZRPN5o
 jYmrE8TEvs9i8eaNJgmB2Cjbk1IwfrfuGMiUpOgaCiWtBpsI32ybD9conp9LKd4c8WPw
 kFCkCVx+IBtQyEKmsLDpmLH4z3031+ZOQGDzAN7HZtv7p6cjumqRhMHCEu3jWWB/WCZr
 ZyFkoNntF0KUfLhcis7qOYwVWP9x7hdhcsuTUQtG7kPeAe0PbKqhqWqNqqWS30TvrBm2
 C6tJNefDnNJyWhc3W9BXOvM3O3j7QJuCcUzLBG//qgxYDU8D+Tk8Y/I7++QlXxZollfX
 Degg==
X-Gm-Message-State: AOAM533JAyHRbv39lgpjt4dAzFkxPduex7EhAy/GxyRbbJkcYchDF2TU
 FjF+SWOJlvg43GIzyM0CN7FMbhuhHEy9PJcZeD8=
X-Google-Smtp-Source: ABdhPJyAC9MguPRNIE2BUEDngfEtSDBisoQg6ROhdksLfyStEEGl+xyUoRGQpBhEbNs34bQoBmVc5TiVBpoX7QOKifw=
X-Received: by 2002:a17:906:4d0d:: with SMTP id
 r13mr9935228eju.282.1589370927429; 
 Wed, 13 May 2020 04:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200513110313.12979-1-christian.koenig@amd.com>
 <20200513110313.12979-2-christian.koenig@amd.com>
In-Reply-To: <20200513110313.12979-2-christian.koenig@amd.com>
From: Mathieu Malaterre <malat@debian.org>
Date: Wed, 13 May 2020 13:55:15 +0200
Message-ID: <CA+7wUszB45OzgyTUM-04QZKAVbRU6aMnPmLzupPAU5Ej_XnwGw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/radeon: disable AGP by default
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: nouveau@lists.freedesktop.org,
 PowerPC List Debian <debian-powerpc@lists.debian.org>,
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTMsIDIwMjAgYXQgMToyMSBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbHdheXMgdXNlIHRoZSBQQ0kg
R0FSVCBpbnN0ZWFkLgoKUmV2aWV3ZWQtYnk6IE1hdGhpZXUgTWFsYXRlcnJlIDxtYWxhdEBkZWJp
YW4ub3JnPgoKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5j
IHwgNSAtLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2Rydi5jCj4gaW5kZXggYmJiMDg4M2U4Y2U2Li5hNzFmMTMxMTZkNmIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwo+IEBAIC0xNzEsMTIgKzE3MSw3
IEBAIGludCByYWRlb25fbm9fd2I7Cj4gIGludCByYWRlb25fbW9kZXNldCA9IC0xOwo+ICBpbnQg
cmFkZW9uX2R5bmNsa3MgPSAtMTsKPiAgaW50IHJhZGVvbl9yNHh4X2F0b20gPSAwOwo+IC0jaWZk
ZWYgX19wb3dlcnBjX18KPiAtLyogRGVmYXVsdCB0byBQQ0kgb24gUG93ZXJQQyAoZmRvICM5NTAx
NykgKi8KPiAgaW50IHJhZGVvbl9hZ3Btb2RlID0gLTE7Cj4gLSNlbHNlCj4gLWludCByYWRlb25f
YWdwbW9kZSA9IDA7Cj4gLSNlbmRpZgo+ICBpbnQgcmFkZW9uX3ZyYW1fbGltaXQgPSAwOwo+ICBp
bnQgcmFkZW9uX2dhcnRfc2l6ZSA9IC0xOyAvKiBhdXRvICovCj4gIGludCByYWRlb25fYmVuY2ht
YXJraW5nID0gMDsKPiAtLQo+IDIuMTcuMQo+CgoKLS0gCk1hdGhpZXUKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
