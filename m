Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7835D2C92DB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 00:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226ED89C9A;
	Mon, 30 Nov 2020 23:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8566489C97;
 Mon, 30 Nov 2020 23:39:45 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id c80so16221339oib.2;
 Mon, 30 Nov 2020 15:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OQ93NfmO2oAKiaWQTf4zD3Kd42GoiSc+oExd2EhoTMc=;
 b=RuFsyM6m9bXqlp0wxWurus4P9oqRnh/5iKzqPATv4Sh/KZdp6u071LCoDrTcBodJVx
 wWhPMM21Nih97GSyCLwXdvJY8Qq+hOOo4evNipKRL+IgOJRQ1iuvzOLPgmfLVFLHe6IO
 iWngg7M/P7nM7zWVEg9TmYoce/53BU/JUvifby+mKCXH/m57b8CPStuQDPGwkLS2sToT
 huderKH9oKoM4PEykeUl1HS9hOb2b6IArwtkKdFUdLy68ItK8X0qVlL9WluVvhZ1jPIJ
 fDxP+bKPwqdCS4qWVN/V7eRY6ty3o15r3df9YVaL+IMb+uoH89dHy1EoTJwKjY4fSvqR
 AY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OQ93NfmO2oAKiaWQTf4zD3Kd42GoiSc+oExd2EhoTMc=;
 b=W+nc5i+71uyFE87B4vzATIirlwkvQOi8xeJ3yzYHcdKg9YSSUQQCVFDbDrc4SQK36g
 1opftwtJe579DzNUvUQ0K5G05lqAeWyOA/+UQXiHP7XQdrZBNWeS1Wej2lbdPlmMPe7A
 D3he+8kmIs75qxU1dHHVMrPcQ/6BNqTrpvCOUFAZAKMVPFT2acs9dXgOpw3LdLQZ6SeR
 oqD46vLkxx1vsWIqgN4JrSgXVsQgDRu6tayWkSQQK0uenXpRalilKIZELwEJ1HF4ISMf
 1vokCfrnSGNLa5X33S6hLCw3lwT/LBcOiR/NJ8ROjYnVLMKnSugUQGp7zuTi8/cjFxXH
 APww==
X-Gm-Message-State: AOAM532tB7zv137Io4qO7/rmBUkLx649dd7+AGKyIq1om3z17RPbTee0
 BHeERT6krs1DohKXbpNLzldDlJFOc/qMT6YApFM=
X-Google-Smtp-Source: ABdhPJy8DGagBL+DFtJoRENKzyBSaSYCuAjM6TZowhpV0yo5q73MQS1h/tLVmbG5bcpJ4bQbRPSOTpVdnRaM8+PtiOg=
X-Received: by 2002:a54:4608:: with SMTP id p8mr178307oip.5.1606779584930;
 Mon, 30 Nov 2020 15:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-17-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-17-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 18:39:33 -0500
Message-ID: <CADnq5_PUi_bQ_Rc0ToBQ7d1JqtLwHb7OU9Eq7+=r9oYARm7k+w@mail.gmail.com>
Subject: Re: [PATCH 16/40] drm/amd/pm/powerplay/smumgr/iceland_smumgr: Remove
 unused variable 'res'
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
 Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0MyBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxh
eS9zbXVtZ3IvaWNlbGFuZF9zbXVtZ3IuYzogSW4gZnVuY3Rpb24g4oCYaWNlbGFuZF90aGVybWFs
X3NldHVwX2Zhbl90YWJsZeKAmToKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0v
cG93ZXJwbGF5L3NtdW1nci9pY2VsYW5kX3NtdW1nci5jOjIwOTM6Njogd2FybmluZzogdmFyaWFi
bGUg4oCYcmVz4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
Cj4KPiBDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IEh1YW5nIFJ1
aSA8cmF5Lmh1YW5nQGFtZC5jb20+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvaWNlbGFuZF9zbXVtZ3IuYyB8IDMgKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvaWNlbGFuZF9zbXVtZ3Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9pY2VsYW5kX3NtdW1n
ci5jCj4gaW5kZXggNmEwZjU4MWRlOTk5Yi4uMmRhNTIyNWVhZmJiOCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvaWNlbGFuZF9zbXVtZ3IuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9pY2VsYW5kX3Nt
dW1nci5jCj4gQEAgLTIwOTAsNyArMjA5MCw2IEBAIHN0YXRpYyBpbnQgaWNlbGFuZF90aGVybWFs
X3NldHVwX2Zhbl90YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQo+ICAgICAgICAgdWludDMy
X3QgdF9kaWZmMSwgdF9kaWZmMiwgcHdtX2RpZmYxLCBwd21fZGlmZjI7Cj4gICAgICAgICB1aW50
MTZfdCBmZG9fbWluLCBzbG9wZTEsIHNsb3BlMjsKPiAgICAgICAgIHVpbnQzMl90IHJlZmVyZW5j
ZV9jbG9jazsKPiAtICAgICAgIGludCByZXM7Cj4gICAgICAgICB1aW50NjRfdCB0bXA2NDsKPgo+
ICAgICAgICAgaWYgKCFwaG1fY2FwX2VuYWJsZWQoaHdtZ3ItPnBsYXRmb3JtX2Rlc2NyaXB0b3Iu
cGxhdGZvcm1DYXBzLCBQSE1fUGxhdGZvcm1DYXBzX01pY3JvY29kZUZhbkNvbnRyb2wpKQo+IEBA
IC0yMTU0LDcgKzIxNTMsNyBAQCBzdGF0aWMgaW50IGljZWxhbmRfdGhlcm1hbF9zZXR1cF9mYW5f
dGFibGUoc3RydWN0IHBwX2h3bWdyICpod21ncikKPgo+ICAgICAgICAgLyogZmFuX3RhYmxlLkZh
bkNvbnRyb2xfR0xfRmxhZyA9IDE7ICovCj4KPiAtICAgICAgIHJlcyA9IHNtdTdfY29weV9ieXRl
c190b19zbWMoaHdtZ3IsIHNtdTdfZGF0YS0+ZmFuX3RhYmxlX3N0YXJ0LCAodWludDhfdCAqKSZm
YW5fdGFibGUsICh1aW50MzJfdClzaXplb2YoZmFuX3RhYmxlKSwgU01DX1JBTV9FTkQpOwo+ICsg
ICAgICAgc211N19jb3B5X2J5dGVzX3RvX3NtYyhod21nciwgc211N19kYXRhLT5mYW5fdGFibGVf
c3RhcnQsICh1aW50OF90ICopJmZhbl90YWJsZSwgKHVpbnQzMl90KXNpemVvZihmYW5fdGFibGUp
LCBTTUNfUkFNX0VORCk7Cj4KClNob3VsZCBwcm9iYWJseSBqdXN0IHJldHVybiB0aGUgZXJyb3Iu
ICBJJ2xsIGZpeCBpdCB1cC4gIFRoYW5rcyEKCkFsZXgKCj4gICAgICAgICByZXR1cm4gMDsKPiAg
fQo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
