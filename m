Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E502C9247
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 00:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AE689CA2;
	Mon, 30 Nov 2020 23:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5CC89C9A;
 Mon, 30 Nov 2020 23:14:26 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id k26so16161547oiw.0;
 Mon, 30 Nov 2020 15:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fiqCo1/lI2q1mRSdvAPLuR7qN8UC6kpdlJNW9jLd1So=;
 b=D/a9sT7QnDRknAcb/kqsN0U4b8shUkIGmqCsSQqBos1WqsXEgHYeUKUGdxEtN69qSi
 sFj7Hv+Ll2zQJCmcJAIGfIeL9E2kBLEfkrdnZNc52OuWC7dQJcVQAOChniIeEEhCT9Ia
 MnZEUHrQ91aemrIQKi47ZFvbtnMqwkH6g+8pAV71pqO3wtS/8MUfoybkcCiRa84IxDbI
 ONPlgY/pyJ7It74yoTQzkMx96X1beweGtCyxkgQGeQjYY+dZtD6+njFquPAJh/qcGN81
 dHFY0nd5VCyuJoNICJMc9O3ffP5ukZT4FTDEZrmWLrBI8BLAOVxyQQ/grdSpQiWq7wX4
 Cu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fiqCo1/lI2q1mRSdvAPLuR7qN8UC6kpdlJNW9jLd1So=;
 b=i3aF50mRzPCVELzxOlhiGZ9X2N5olXNuuIVTnrfdPz5MwEL9BZAjB0KuXXSftqY/nQ
 1kEY9uWiroMlGJ+bYj6x4Qtgl4zGcksbWHZfxMaOt0jwcNSZCtNvEGv7sVSDZzR/CxEv
 3KPiWhRdHJ7qaGbgMgm/Yd4RZYioyChyuQsEcVsKoGUS5Cog6E6fMWMVkDOytcuIQSor
 sZ7goY8rKc8iLPtzrp6D0SeaGlk16Uxikll3jeiFOoESz6vFGrds+op+KzjPlpPHwNP5
 Se2HcTJ6emsSfcJE7nFy4/aHl6rLMkwX7+qWbv/GOvaDL22tbfNqFTQsdsC9c308DgMy
 1YqA==
X-Gm-Message-State: AOAM5317HZvh+zSfv9gW3H7g+0blpQd7mEruzQs3ISiwpw8yEMdAqs7w
 iHmWdb+gFT2aB76jL5qJ9TQr6r5aWjTLyV8IeSc=
X-Google-Smtp-Source: ABdhPJxEaLWXFtxL3ijIBaGXZ22vZflmOE1jRdmPndYRMxiIVD5eI+WbIfWWBpqaHZENtarBXBDtoIDzoitjeT6W6xc=
X-Received: by 2002:aca:4f53:: with SMTP id d80mr109224oib.120.1606778065481; 
 Mon, 30 Nov 2020 15:14:25 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-4-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-4-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 18:14:14 -0500
Message-ID: <CADnq5_MQUuOWoKboqUEu-xazNF2MoCke5dLqRfzX_c6d=cavgA@mail.gmail.com>
Subject: Re: [PATCH 03/40] drm/amd/pm/powerplay/smumgr/ci_smumgr: Remove set
 but unused variable 'res'
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

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0MiBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxh
eS9zbXVtZ3IvY2lfc211bWdyLmM6IEluIGZ1bmN0aW9uIOKAmGNpX3RoZXJtYWxfc2V0dXBfZmFu
X3RhYmxl4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkv
c211bWdyL2NpX3NtdW1nci5jOjIxMzI6Njogd2FybmluZzogdmFyaWFibGUg4oCYcmVz4oCZIHNl
dCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBDYzogRXZhbiBR
dWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2Zm
LWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvY2lfc211bWdyLmMgfCAzICstLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL2NpX3NtdW1nci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL2NpX3NtdW1nci5jCj4gaW5k
ZXggMzI5YmY0ZDQ0YmJjZS4uYzFkODY5YjRjN2E0MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvY2lfc211bWdyLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvY2lfc211bWdyLmMKPiBAQCAtMjEyOSw3
ICsyMTI5LDYgQEAgc3RhdGljIGludCBjaV90aGVybWFsX3NldHVwX2Zhbl90YWJsZShzdHJ1Y3Qg
cHBfaHdtZ3IgKmh3bWdyKQo+ICAgICAgICAgdWludDMyX3QgdF9kaWZmMSwgdF9kaWZmMiwgcHdt
X2RpZmYxLCBwd21fZGlmZjI7Cj4gICAgICAgICB1aW50MTZfdCBmZG9fbWluLCBzbG9wZTEsIHNs
b3BlMjsKPiAgICAgICAgIHVpbnQzMl90IHJlZmVyZW5jZV9jbG9jazsKPiAtICAgICAgIGludCBy
ZXM7Cj4gICAgICAgICB1aW50NjRfdCB0bXA2NDsKPgo+ICAgICAgICAgaWYgKCFwaG1fY2FwX2Vu
YWJsZWQoaHdtZ3ItPnBsYXRmb3JtX2Rlc2NyaXB0b3IucGxhdGZvcm1DYXBzLCBQSE1fUGxhdGZv
cm1DYXBzX01pY3JvY29kZUZhbkNvbnRyb2wpKQo+IEBAIC0yMTkxLDcgKzIxOTAsNyBAQCBzdGF0
aWMgaW50IGNpX3RoZXJtYWxfc2V0dXBfZmFuX3RhYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3Ip
Cj4KPiAgICAgICAgIGZhbl90YWJsZS5UZW1wU3JjID0gKHVpbnQ4X3QpUEhNX1JFQURfVkZQRl9J
TkRJUkVDVF9GSUVMRChod21nci0+ZGV2aWNlLCBDR1NfSU5EX1JFR19fU01DLCBDR19NVUxUX1RI
RVJNQUxfQ1RSTCwgVEVNUF9TRUwpOwo+Cj4gLSAgICAgICByZXMgPSBjaV9jb3B5X2J5dGVzX3Rv
X3NtYyhod21nciwgY2lfZGF0YS0+ZmFuX3RhYmxlX3N0YXJ0LCAodWludDhfdCAqKSZmYW5fdGFi
bGUsICh1aW50MzJfdClzaXplb2YoZmFuX3RhYmxlKSwgU01DX1JBTV9FTkQpOwo+ICsgICAgICAg
Y2lfY29weV9ieXRlc190b19zbWMoaHdtZ3IsIGNpX2RhdGEtPmZhbl90YWJsZV9zdGFydCwgKHVp
bnQ4X3QgKikmZmFuX3RhYmxlLCAodWludDMyX3Qpc2l6ZW9mKGZhbl90YWJsZSksIFNNQ19SQU1f
RU5EKTsKPgoKU2hvdWxkIHByb2JhYmx5IGp1c3QgcmV0dXJuIHRoZSBlcnJvciBoZXJlLiAgSSds
bCBmaXggaXQgdXAuICBUaGFua3MhCgpBbGV4Cgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAt
LQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
