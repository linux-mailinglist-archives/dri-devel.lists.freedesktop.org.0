Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B0BBDE8B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFFA895C1;
	Wed, 25 Sep 2019 13:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89816895C1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 13:07:49 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44D5E21D7A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 13:07:49 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id c3so6418265qtv.10
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 06:07:49 -0700 (PDT)
X-Gm-Message-State: APjAAAVV/+f8odaCbEp8ZeFWyelVTEYWnJwtgK8ArbKWtrbVtSqjyrPM
 k0ob0MnjATBwRvUHNaUk+GvmJtf10u8egggMvA==
X-Google-Smtp-Source: APXvYqy8xSNSZuLq/5OS0tlsIcIHbHGo7t00kiTteAmoF+SyyYorxN89hVi0vNFSwJToBOy5sLycJNN4ZLxt3RK6Ds8=
X-Received: by 2002:ad4:528b:: with SMTP id v11mr7322949qvr.200.1569416862333; 
 Wed, 25 Sep 2019 06:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190925084932.147971-1-paul.kocialkowski@bootlin.com>
 <20190925084932.147971-2-paul.kocialkowski@bootlin.com>
In-Reply-To: <20190925084932.147971-2-paul.kocialkowski@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 25 Sep 2019 08:07:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJY+d9frxuxspvo2SQ=vpWMCAWZfMODA-jm_rKu1GOEaw@mail.gmail.com>
Message-ID: <CAL_JsqJY+d9frxuxspvo2SQ=vpWMCAWZfMODA-jm_rKu1GOEaw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Document the Xylon LogiCVC
 display controller
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569416869;
 bh=z9U2u1eJm77iSS217DHe30P6Z27QGW02D0GUrC8Tqq8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ReGnkPpVh6OjQAOBCXxIsSyroDLXZKq4VGXm8qiXRWqf2gRJM+5iYY1M6sLuChI3+
 3hnDcDM5+HuhGn/D7+C5S0GgR4U3ne2+M5gXRJVV84Jg5E1+BlH3HSMxuTJdtPnh3a
 WhghRjpohCCKjsLUbcWRVXFqvZHNxI5kqAptmriw=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMzo0OSBBTSBQYXVsIEtvY2lhbGtvd3NraQo8cGF1bC5r
b2NpYWxrb3dza2lAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gVGhlIFh5bG9uIExvZ2lDVkMgaXMg
YSBkaXNwbGF5IGNvbnRyb2xsZXIgaW1wbGVtZW50ZWQgYXMgcHJvZ3JhbW1hYmxlCj4gbG9naWMg
aW4gWGlsaW54IEZQR0FzLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBLb2NpYWxrb3dza2kgPHBh
dWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgo+IC0tLQo+ICAuLi4vZGlzcGxheS94eWxvbixs
b2dpY3ZjLWRpc3BsYXkueWFtbCAgICAgICAgfCAzMTQgKysrKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzMTQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkveHlsb24sbG9naWN2Yy1kaXNw
bGF5LnlhbWwKCkVycm9yOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS94eWxvbixsb2dpY3ZjLWRpc3BsYXkuZXhhbXBsZS5kdHM6MTcuMS02CnN5bnRheCBlcnJvcgpG
QVRBTCBFUlJPUjogVW5hYmxlIHRvIHBhcnNlIGlucHV0IHRyZWUKc2NyaXB0cy9NYWtlZmlsZS5s
aWI6MzIxOiByZWNpcGUgZm9yIHRhcmdldAonRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkveHlsb24sbG9naWN2Yy1kaXNwbGF5LmV4YW1wbGUuZHQueWFtbCcKZmFpbGVk
Cm1ha2VbMV06ICoqKiBbRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
eHlsb24sbG9naWN2Yy1kaXNwbGF5LmV4YW1wbGUuZHQueWFtbF0KRXJyb3IgMQpNYWtlZmlsZTox
MjgyOiByZWNpcGUgZm9yIHRhcmdldCAnZHRfYmluZGluZ19jaGVjaycgZmFpbGVkCm1ha2U6ICoq
KiBbZHRfYmluZGluZ19jaGVja10gRXJyb3IgMgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
