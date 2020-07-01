Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1725A210B18
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 14:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A5A6E049;
	Wed,  1 Jul 2020 12:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DE56E049
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 12:33:39 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id n24so19023486otr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0/gKTgSPNiK1GV7dg8cAvLDkoEQTeqakLc9QEbntdl8=;
 b=fbdbTMw6Tb5X5nBvth0KPuKI856tB9W1ecb/TeVlGM2Sh2CqgtwD+f0+jNkWeSyzLX
 CueKuadzdH8A/E895sVW/RkBioxsTo6P8FV+JOyviJQqSzwSbOwhqm/xetV4x9suSlV3
 vC4pOo4pcTtuXA3sBZzFzPyFUD7Y0x+JWf4Vbc+FzL+4bbXUjXGTsVEUD3tMIe46a87p
 JTc/HkEikxDv68bmtcm4+7ds+RsM/qNi1u1Q1DKQE0jzkD6jJCiCBpay5zV/hyL4y1R8
 /Ng/L3vunJT7DVpBN8OYlPNPkRlXZoefjAfuUx3H8OF06JFdM8304vUFQp9baB4nm8Fx
 apaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0/gKTgSPNiK1GV7dg8cAvLDkoEQTeqakLc9QEbntdl8=;
 b=uNRqp7FwuhkEHDQP3h0fLWlffJXSfvO93oNt6R7oaWnn6wYVz5YtmVs//OcdqF8SgP
 ZXCqHbM6jL40rQ7tIarYhs3UKMEXX3vK6oW1s2HLcXKnoWNgAdZuhuHRXbeLLZqgioKZ
 Eurn8jySEtXUI2msZJlKXneECW1Ot1oLraTIG5tGR4oks/yq8HTtpu/+B9BVOQKyl4Gf
 O4MehpBRqhLLYgqshcSgEpWRjuofzZFMpVITkAjzUmoWRAmRNnsAhPboL57NVtLzsKdA
 h6/fVJq7SjxcVNgWJSwAnR4kRY0GOW1zFkJeNOsBelFdzFEft3PXT6+y7baSzJ0ue6Ba
 jCUQ==
X-Gm-Message-State: AOAM531ilTduEiG7CIFjksukvJ4hQ1Rz5pw44FOMESNY5JvRBTy9sQyh
 Lez+7Utp8EILnWPi+f+3CUNsSPqUyE3Bg/DGYfGcLg==
X-Google-Smtp-Source: ABdhPJx/rWPPNwXFCHG8PvPxNDYMqAHV8vIuxP4r0bLP3udJYhyRjrkyu0A1QaxqcR0enaXl2VCUcwVxaN76M1jvyJI=
X-Received: by 2002:a05:6830:2405:: with SMTP id
 j5mr22837641ots.371.1593606818955; 
 Wed, 01 Jul 2020 05:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200701112559.22669-1-christian.koenig@amd.com>
 <CAKMK7uHqNaQPwATQf=Jfs6oQ=YEemHSHTEtC2=VqvNf+bMh_sQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHqNaQPwATQf=Jfs6oQ=YEemHSHTEtC2=VqvNf+bMh_sQ@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 1 Jul 2020 18:03:27 +0530
Message-ID: <CAO_48GGh2zir-hszCv4Mp36REEKPwhcOmwj93kF5otFmkf8cOw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as DMA-buf maintainer
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciBhbGwgdGhlIGdvb2Qgd29yayBoZXJlLCBDaHJpc3RpYW4hCgpPbiBXZWQsIDEg
SnVsIDIwMjAgYXQgMTc6MjAsIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6
Cj4KPiBPbiBXZWQsIEp1bCAxLCAyMDIwIGF0IDE6MjYgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxj
a29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQXMgZGlzY3Vz
c2VkIG9uIHRoZSBsaXN0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+IEFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgpBY2tlZC1ieTogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13
YWxAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gIE1BSU5UQUlORVJTIHwgMSArCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJT
IGIvTUFJTlRBSU5FUlMKPiA+IGluZGV4IDQwNDc0OTgyYTIxZC4uNWQ3MTMwZjhkMzQyIDEwMDY0
NAo+ID4gLS0tIGEvTUFJTlRBSU5FUlMKPiA+ICsrKyBiL01BSU5UQUlORVJTCj4gPiBAQCAtNTA4
OSw2ICs1MDg5LDcgQEAgRjogICAgICAgIGZzL2RsbS8KPiA+Cj4gPiAgRE1BIEJVRkZFUiBTSEFS
SU5HIEZSQU1FV09SSwo+ID4gIE06ICAgICBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5h
cm8ub3JnPgo+ID4gK006ICAgICBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cj4gPiAgTDogICAgIGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+ID4gIEw6ICAg
ICBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiAgTDogICAgIGxpbmFyby1tbS1z
aWdAbGlzdHMubGluYXJvLm9yZyAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMpCj4gPiAt
LQo+ID4gMi4yMC4xCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCj4KPgo+Cj4gLS0KPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCgpC
ZXN0LApTdW1pdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
