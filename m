Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAEB94B09
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 18:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130C16E22F;
	Mon, 19 Aug 2019 16:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48DA6E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:57:40 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C25F22CED
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:57:40 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id b11so2642038qtp.10
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 09:57:40 -0700 (PDT)
X-Gm-Message-State: APjAAAVqI0/0MAOHsHpfDbOp2GS5HJSpCNNOZg4K7FFkfDlE+BadciFL
 5F15WeldGtDkooDHjHUCp6FGI0E+8tbjJpyEiA==
X-Google-Smtp-Source: APXvYqwhMCdqCBoZ+XmoP5Pq16HzVdXGPk1IUhU4swPt9wGX4UfkdCEv2p/5mPE5rto+CIOhnelr6+OIE0FWo+844Yo=
X-Received: by 2002:ac8:368a:: with SMTP id a10mr21758524qtc.143.1566233859680; 
 Mon, 19 Aug 2019 09:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190816093107.30518-3-steven.price@arm.com>
In-Reply-To: <20190816093107.30518-3-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Aug 2019 11:57:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL4xc6AnjC2j62X3DPrPOVMvQ2q__9h_BqQoSs45ADMRg@mail.gmail.com>
Message-ID: <CAL_JsqL4xc6AnjC2j62X3DPrPOVMvQ2q__9h_BqQoSs45ADMRg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Remove opp table when unloading
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566233860;
 bh=l4QVQkxBDVy3v7/roCr2nUc/HtWfXFXDYL4lHli64Mc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B82UDk9Nq20WIdfzLZ7RcJ9c7uCGngxVmppGprB8ZUWdD6dzDJRmQCpRPdJa3Kpsq
 ZqhW5u4bzzbu7TbM9iQEdTizEYb3/vxr7ohRLv3cy2K5fhPI6DUTqk+GfHUXJYBXts
 zy/N8YNj2GCtAyeSYV5JWLDTePyUfqsBMsmf3Y7k=
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgNDozMSBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgo+IFRoZSBkZXZmcmVxIG9wcCB0YWJsZSBuZWVkcyB0byBiZSBy
ZW1vdmVkIHdoZW4gdW5sb2FkaW5nIHRoZSBkcml2ZXIgdG8KPiBmcmVlIHRoZSBtZW1vcnkgYXNz
b2NpYXRlZCB3aXRoIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4u
cHJpY2VAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2RldmZyZXEuYyB8IDYgKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kZXZmcmVxLmggfCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Ry
di5jICAgICB8IDUgKysrKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpBcHBsaWVkLCB0aGFua3MuCgpSb2IKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
