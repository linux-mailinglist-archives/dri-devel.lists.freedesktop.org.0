Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB138571
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CF489A5E;
	Fri,  7 Jun 2019 07:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C02989471
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 11:18:46 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 18A5360592; Thu,  6 Jun 2019 11:18:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 859816044E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 11:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 859816044E
Received: by mail-ed1-f50.google.com with SMTP id r18so2782399edo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 04:18:44 -0700 (PDT)
X-Gm-Message-State: APjAAAVmrOiYoT5nvLs+IJSzOE7Qn3ud3gbOHqMobYQWdFCQ6KfKXKNT
 XUbhoQliyTYu/U0vUkrymRIBNk/Ye1/zZBpkhus=
X-Google-Smtp-Source: APXvYqywciaOK50k3dYNiGNenR853IMjbXcIeW6KCMTsTQOrLx/1JWr+4cSt95XYaChU3AAORpJLqjht8ZoXsl40UKs=
X-Received: by 2002:a17:906:8d8:: with SMTP id
 o24mr40716009eje.235.1559819923348; 
 Thu, 06 Jun 2019 04:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190527102616.28315-1-vivek.gautam@codeaurora.org>
 <20190605082221.GB15169@ravnborg.org>
In-Reply-To: <20190605082221.GB15169@ravnborg.org>
From: Vivek Gautam <vivek.gautam@codeaurora.org>
Date: Thu, 6 Jun 2019 16:48:31 +0530
X-Gmail-Original-Message-ID: <CAFp+6iEXZyXaGvTeCqLmDgo3OvBZr172nrba2iX6sTYJCORESg@mail.gmail.com>
Message-ID: <CAFp+6iEXZyXaGvTeCqLmDgo3OvBZr172nrba2iX6sTYJCORESg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/panel: truly: Add additional delay after pulling
 down reset gpio
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559819926;
 bh=2bQeIUl0Sqcf4C18lybozSEspZJp3/TZIWNvfiD9Wsk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fFsx4LOVEiHkaYzS4WsBO6H47QY99htobSNLwTsYwkrYdPzcExCTQ6LapJK7t2Z6l
 SbCwmcZ1sE1y/6AtpYjbIfkPRswfpWCIQYCkrB9x/sw/szmzgC1HTmdp/3Ed7sYPrR
 hGj5Zy1XDMFYj9UfBzrtNksW5OCu7BCQrgc5rTlk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559819924;
 bh=2bQeIUl0Sqcf4C18lybozSEspZJp3/TZIWNvfiD9Wsk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LhdZc33S/F4QvJdXEcT1pBCyAQ1AOzFE6v16OMWlXo1zb/orQQ2gvs97QSB8y7C0M
 0Cxb9H9l20rwFCY9/h1+23mCo0OkcgLLsjyXZjtkAbQIv3wkuTChjVBuBQlcXhDnbs
 8UTQFmqdmwogpXAx7YyI37AHOBlfdoTazISnwopw=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=vivek.gautam@codeaurora.org
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
Cc: David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "thierry.reding" <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gNSwgMjAxOSBhdCAxOjU0IFBNIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gd3JvdGU6Cj4KPiBIaSBWaXZlaywKPgo+IE9uIE1vbiwgTWF5IDI3LCAyMDE5IGF0IDAz
OjU2OjE2UE0gKzA1MzAsIFZpdmVrIEdhdXRhbSB3cm90ZToKPiA+IE1UUCBTRE04NDUgcGFuZWwg
c2VlbXMgdG8gbmVlZCBhZGRpdGlvbmFsIGRlbGF5IHRvIGJyaW5nIHBhbmVsCj4gPiB0byBhIHdv
cmthYmxlIHN0YXRlLiBSdW5uaW5nIG1vZGV0ZXN0IHdpdGhvdXQgdGhpcyBjaGFuZ2UgZGlzcGxh
eXMKPiA+IGJsdXJyeSBhcnRpZmFjdHMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVml2ZWsgR2F1
dGFtIDx2aXZlay5nYXV0YW1AY29kZWF1cm9yYS5vcmc+Cj4KPiBhZGRlZCB0byBkcm0tbWlzYy1u
ZXh0CgpUaGFua3MgYSBsb3QuCgpCZXN0IHJlZ2FyZHMKVml2ZWsKCj4KPiAgICAgICAgIFNhbQo+
Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHJ1bHktbnQzNTU5Ny5j
IHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cnVseS1udDM1NTk3LmMgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHJ1bHktbnQzNTU5Ny5jCj4gPiBpbmRleCBmYzJhNjZj
NTNkYjQuLmFhNzE1M2ZkM2JlNCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC10cnVseS1udDM1NTk3LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC10cnVseS1udDM1NTk3LmMKPiA+IEBAIC0yODAsNiArMjgwLDcgQEAgc3RhdGljIGludCB0
cnVseV8zNTU5N19wb3dlcl9vbihzdHJ1Y3QgdHJ1bHlfbnQzNTU5NyAqY3R4KQo+ID4gICAgICAg
Z3Bpb2Rfc2V0X3ZhbHVlKGN0eC0+cmVzZXRfZ3BpbywgMSk7Cj4gPiAgICAgICB1c2xlZXBfcmFu
Z2UoMTAwMDAsIDIwMDAwKTsKPiA+ICAgICAgIGdwaW9kX3NldF92YWx1ZShjdHgtPnJlc2V0X2dw
aW8sIDApOwo+ID4gKyAgICAgdXNsZWVwX3JhbmdlKDEwMDAwLCAyMDAwMCk7Cj4gPgo+ID4gICAg
ICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4gLS0KPiA+IFFVQUxDT01NIElORElBLCBvbiBiZWhhbGYg
b2YgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIKPiA+IG9mIENv
ZGUgQXVyb3JhIEZvcnVtLCBob3N0ZWQgYnkgVGhlIExpbnV4IEZvdW5kYXRpb24KPiA+Cj4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
CgoKLS0gClFVQUxDT01NIElORElBLCBvbiBiZWhhbGYgb2YgUXVhbGNvbW0gSW5ub3ZhdGlvbiBD
ZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIKb2YgQ29kZSBBdXJvcmEgRm9ydW0sIGhvc3RlZCBieSBU
aGUgTGludXggRm91bmRhdGlvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
