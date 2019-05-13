Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100101B935
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 16:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA1388EE9;
	Mon, 13 May 2019 14:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B684288EE9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:55:45 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CABC2133F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:55:45 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id h1so7253606qtp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 07:55:45 -0700 (PDT)
X-Gm-Message-State: APjAAAU7qYSx/+6x9S3IapkOK/w6gHg0ibivflPfK3k/aRSzLNZuxdjU
 3XXu3xI+IlPVu2ViJttvDm/yHNHT86gAvRGVPg==
X-Google-Smtp-Source: APXvYqx+BU+KdzrTIAuVlSfTfwj6if3qcwzMCOF4daKaOVJkmodwENsdrI8dcc2ZWqisTCWO3f14DmMdhBs+jcOtNoI=
X-Received: by 2002:aed:2471:: with SMTP id s46mr24680178qtc.144.1557759344732; 
 Mon, 13 May 2019 07:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190513081734.911-1-boris.brezillon@collabora.com>
In-Reply-To: <20190513081734.911-1-boris.brezillon@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 13 May 2019 09:55:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLsZ6DLs-Wb9UX8DaPHMKkouXJPc0LaeSuBUPNSKpW48w@mail.gmail.com>
Message-ID: <CAL_JsqLsZ6DLs-Wb9UX8DaPHMKkouXJPc0LaeSuBUPNSKpW48w@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Add missing _fini() calls in
 panfrost_device_fini()
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557759345;
 bh=spSbufkWJue591hk1UapqhdrXa5sIimRsfyDoeUf4d8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eWInoW7vBVKQu9WiWKWeBMNPacRurQ5VfNGeZv8KOCAlheOEWhrYy4SucdDwv4l9D
 T1SUTHIpkVDFVKMIhXMExmt9Wzx+jaf0klV1tFdom4qHCbjC32WiyBI4HbGrUpbE7q
 Tlv5Wz1o2Oc5KIAwfBdg3HY3n37LPrpTentDfbWY=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMzoxNyBBTSBCb3JpcyBCcmV6aWxsb24KPGJvcmlzLmJy
ZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IHBhbmZyb3N0X3tqb2IsbW11LGdwdSxy
ZXNldH1fZmluaSgpIHdlcmUgbWlzc2luZy4KPgo+IEZpeGVzOiBmM2JhOTEyMjhlOGUgKCJkcm0v
cGFuZnJvc3Q6IEFkZCBpbml0aWFsIHBhbmZyb3N0IGRyaXZlciIpCj4gU2lnbmVkLW9mZi1ieTog
Qm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jIHwgNCArKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCkFwcGxpZWQuCgpSb2IKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
