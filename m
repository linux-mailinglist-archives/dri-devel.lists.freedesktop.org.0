Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81AE4D40E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 18:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506576E5D5;
	Thu, 20 Jun 2019 16:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E216E5D5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 16:43:52 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id a186so1950184vsd.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 09:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OeFgssC06Ca4X3IXaHWlew+6T79MlwgCU07uMivbM10=;
 b=gebBb+LNshNiplJJmWduNO3WFLv3wVjCmgNLIYl4rXfWG8dAKoIpb5GHGj9nLIl3ew
 Ayrl8RXExLInGxb5+shBdcwcPT3nKuUbtfrnuf1ZQC1qsv72A6LLBbpJ5OBwZv1ne+Ds
 ivo5i9vqt7Kkr/YW8ugQplywLUmCUyMOIfe/+WRKaz3arvzL9eHhRr+AL3JllhZq0Nub
 WzWHjmODw33NRqlo4gPjHqZOkUP7FFwu8YDaBIE9lfdlKPLpgB21rr0/qRD0B56xvFP0
 JqUhsbcoXx+JvLnEIILj+jSDvEhhw0FQK/pT4KiMoYNYUmZKqTPo7Mxj3mRwgnVcG3kX
 5vKQ==
X-Gm-Message-State: APjAAAUSmbcCtxQx1vthZXRdhr2eiecZtYmJ66zZaPja+QzvjZmS6fYy
 +iom1TungYUs61pkYgXmZj12A6ziUpM=
X-Google-Smtp-Source: APXvYqwiDGjAUbikhEVo4PVyJ/7lHauCFPGy0+UUhITYxE6BYpk6W0MgVkONfYoGadHBEdLyLyT3UA==
X-Received: by 2002:a67:de01:: with SMTP id q1mr21011934vsk.238.1561049031227; 
 Thu, 20 Jun 2019 09:43:51 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53])
 by smtp.gmail.com with ESMTPSA id t4sm39025vsk.3.2019.06.20.09.43.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 09:43:49 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id a186so1950075vsd.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 09:43:49 -0700 (PDT)
X-Received: by 2002:a67:fd91:: with SMTP id k17mr58238625vsq.121.1561049028723; 
 Thu, 20 Jun 2019 09:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190618213406.7667-1-ezequiel@collabora.com>
 <20190618213406.7667-2-ezequiel@collabora.com>
In-Reply-To: <20190618213406.7667-2-ezequiel@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Jun 2019 09:43:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UpZAjrWkQ7qj5Wo2tf2wkg5Q-34Sun0MOtYLBAwY731Q@mail.gmail.com>
Message-ID: <CAD=FV=UpZAjrWkQ7qj5Wo2tf2wkg5Q-34Sun0MOtYLBAwY731Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: rockchip: document VOP gamma
 LUT address
To: Ezequiel Garcia <ezequiel@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OeFgssC06Ca4X3IXaHWlew+6T79MlwgCU07uMivbM10=;
 b=TtS7/2F/OTZGse3QP1Ezkd7+vMwTgyaEqyIgOAtPig7D5aPJz70bKNReyIUkk7+On6
 UWVf+T8HfAS8IFEMpSLgAMqz+HQoyrcztrkZ54szcGOHzusNg5Fw0O9cWtDmQmMLZwJE
 SE7nqQdAv/L+QXxO/PwU7I4Nw3N5EnBJEPuVE=
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
 Jacopo Mondi <jacopo@jmondi.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIEp1biAxOCwgMjAxOSBhdCAyOjQzIFBNIEV6ZXF1aWVsIEdhcmNpYSA8ZXpl
cXVpZWxAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBBZGQgdGhlIHJlZ2lzdGVyIHNwZWNpZmll
ciBkZXNjcmlwdGlvbiBmb3IgYW4KPiBvcHRpb25hbCBnYW1tYSBMVVQgYWRkcmVzcy4KPgo+IFNp
Z25lZC1vZmYtYnk6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KPiAt
LS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wLnR4dCAgICAg
ICAgIHwgMTAgKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcC50eHQKPiBp
bmRleCA0ZjU4YzVhMmQxOTUuLjk3YWQ3OGNjN2UwMyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12b3AudHh0
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2No
aXAvcm9ja2NoaXAtdm9wLnR4dAo+IEBAIC0yMCw2ICsyMCwxMyBAQCBSZXF1aXJlZCBwcm9wZXJ0
aWVzOgo+ICAgICAgICAgICAgICAgICAicm9ja2NoaXAscmszMjI4LXZvcCI7Cj4gICAgICAgICAg
ICAgICAgICJyb2NrY2hpcCxyazMzMjgtdm9wIjsKPgo+ICstIHJlZzogTXVzdCBjb250YWluIG9u
ZSBlbnRyeSBjb3JyZXNwb25kaW5nIHRvIHRoZSBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aAo+ICsg
ICAgICAgb2YgdGhlIHJlZ2lzdGVyIHNwYWNlLiBDYW4gb3B0aW9uYWxseSBjb250YWluIGEgc2Vj
b25kIGVudHJ5Cj4gKyAgICAgICBjb3JyZXNwb25kaW5nIHRvIHRoZSBDUlRDIGdhbW1hIExVVCBh
ZGRyZXNzLgo+ICsKPiArLSByZWctbmFtZXM6ICJiYXNlIiBmb3IgdGhlIGJhc2UgcmVnaXN0ZXIg
c3BhY2UuIElmIHByZXNlbnQsIHRoZSBDUlRDCj4gKyAgICAgICBnYW1tYSBMVVQgbmFtZSBzaG91
bGQgYmUgImx1dCIuCgpBcyBwZXIgUm9iIEhlcnJpbmcsIGN1cnJlbnQgc3VnZ2VzdGlvbiBpcyB0
byBhdm9pZCByZWctbmFtZXMgd2hlbgpwb3NzaWJsZS4gIFRoZSBjb2RlIHNob3VsZCBqdXN0IGxv
b2sgZm9yIHRoZSBwcmVzZW5jZSBvZiBhIDJuZCBlbnRyeQphbmQgYXNzdW1lIHRoYXQgaWYgaXQn
cyB0aGVyZSB0aGF0IGl0J3MgdGhlIGx1dCByYW5nZS4gIEZ1bGwgY29udGV4dDoKCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FMX0pzcStNTXVubVZXcWVXOXYyUnl6c01LUCs9a016ZVRI
Tk1HNEpESE03RnkwSEJnQG1haWwuZ21haWwuY29tLwoKLURvdWcKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
