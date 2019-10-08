Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3DFD0306
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 23:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C977989A62;
	Tue,  8 Oct 2019 21:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9997889A62
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 21:46:19 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7F98218AC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 21:46:18 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id o12so427974qtf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 14:46:18 -0700 (PDT)
X-Gm-Message-State: APjAAAU7tz1MKEiUiQCf3iN+y2aE3ForgsxxK2IvAidTa5+oHi9xINwb
 lyv7HL5ONiad9uTrO14Y6R7l53PReyqM+eiidQ==
X-Google-Smtp-Source: APXvYqwUSIcKPV35wTucqMIYYpTes/DP7FSx6t6h5CKpgU2X+LWScK39PdcmV/mU+dBUUtXksNDX6FK8pphx/CQwVjU=
X-Received: by 2002:ac8:19f4:: with SMTP id s49mr91607qtk.136.1570571177756;
 Tue, 08 Oct 2019 14:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <02b510a8a0b43b2aa55b0438859fb9fbd0f89f25.1570547447.git.robin.murphy@arm.com>
In-Reply-To: <02b510a8a0b43b2aa55b0438859fb9fbd0f89f25.1570547447.git.robin.murphy@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 8 Oct 2019 16:46:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL__+b46WHd3_cgVBcD5jdCPenqY4mQLjLcs5tvoUUmqg@mail.gmail.com>
Message-ID: <CAL_JsqL__+b46WHd3_cgVBcD5jdCPenqY4mQLjLcs5tvoUUmqg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Quiet shrinker messages
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570571178;
 bh=9EsSGo6CSwb58ElyFLLo9fysUOz+3Wl0cNHTBY2QhVM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ig/VzwJjNy52iXe+lxjRJf5IL45Nc/utfEO5adsjmSiWrF5i9+Rli3dxIuinKj2qH
 ek3Fs1FgHjHvDIdMyD6n+PBFFo4irQiOzuMgdSF3Ta1DDiciCuPTiw0pim+a175GFy
 vdDXiYqtf4rCHEXH3Z6KwheZGG2yk46s2TtkqX1I=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgOCwgMjAxOSBhdCAxMDoxMyBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPiB3cm90ZToKPgo+IEFzIGJyb3VnaHQgdXAgb24gSVJDLCBsb2dnaW5nIGEgdmFn
dWUgYW5kIHVuYXR0cmlidXRlZCBtZXNzYWdlIGZvciBhCj4gbm9ybWFsIGFuZCBleHBlY3RlZCBv
cGVyYXRpb24gbG9va3MgYSBiaXQgc3BhbW15LiBVc2UgYSBkZXZfKiB2YXJpYW50Cj4gdG8gY2xh
cmlmeSBpdCBhcyBhIGRyaXZlciBtZXNzYWdlLCBhbmQgZG93bmdyYWRlIHRoZSBsZXZlbCB0byBk
ZWJ1ZyB0bwo+IGF2b2lkIGNsdXR0ZXJpbmcgdXAgZW5kIHVzZXJzJyBsb2dzLgoKSWYgaXQgd2Fz
IGdvb2QgZW5vdWdoIGZvciBtc20sIGl0J3Mgbm90IGdvb2QgZW5vdWdoIGZvciB1cz8KCj4gU2ln
bmVkLW9mZi1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5jIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
