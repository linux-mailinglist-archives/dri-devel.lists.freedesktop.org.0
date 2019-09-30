Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352FC25D2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 19:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00A96E4B6;
	Mon, 30 Sep 2019 17:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB5A6E4B6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 17:46:45 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F8F5224D7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 17:46:45 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id f7so18108540qtq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 10:46:45 -0700 (PDT)
X-Gm-Message-State: APjAAAWZr0ND8QY3lxNTTqKGkzvD/15tP9v+CBY3xnhc7y4MGFf5IbY/
 VKThLwz8YLAhH4Sce3RkIL7ObfHH8RccVF9KIw==
X-Google-Smtp-Source: APXvYqx0ggq9eeAU9wWza/JPeFO8jdb8kehul8w7xQz3yw7kXfvNNCLrdp04iqHcwujnu+1ANt/coLFpFImGnTT+0QU=
X-Received: by 2002:ac8:6982:: with SMTP id o2mr26027474qtq.143.1569865604167; 
 Mon, 30 Sep 2019 10:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <88dc6386929b3dcd7a65ba8063628c62b66b330c.1569856049.git.robin.murphy@arm.com>
In-Reply-To: <88dc6386929b3dcd7a65ba8063628c62b66b330c.1569856049.git.robin.murphy@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Sep 2019 12:46:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKUP6qG6PVL47RQ5A5OcBhpdOA_0VL1YeYDuyVSVcRqCQ@mail.gmail.com>
Message-ID: <CAL_JsqKUP6qG6PVL47RQ5A5OcBhpdOA_0VL1YeYDuyVSVcRqCQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: juno: add GPU subsystem
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569865605;
 bh=OctSNomG2OJ1c5HBaNhDE3kyW877OO9pLy12klDrXiA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=q/0ji3EJU3lYpiVowGHsk4yUieDMJFIUKb5X++v9x7jMo38/M6Pa+6XYZueaEDrnX
 qJ+xZf2rC7B8J8hIaYIRlMwR4mCDYZPIaM5ltKiBWCVddq9UD/PWq5XSdnR75VR0C+
 /u5QBQNxvDZVIYsMJm94PIvjHs1BRzy4q/mNspMo=
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTA6MjUgQU0gUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJw
aHlAYXJtLmNvbT4gd3JvdGU6Cj4KPiBTaW5jZSB3ZSBub3cgaGF2ZSBiaW5kaW5ncyBmb3IgTWFs
aSBNaWRnYXJkIEdQVXMsIGxldCdzIHVzZSB0aGVtIHRvCj4gZGVzY3JpYmUgSnVubydzIEdQVSBz
dWJzeXN0ZW0sIGlmIG9ubHkgYmVjYXVzZSB3ZSBjYW4uIEp1bm8gc3BvcnRzIGEKPiBNYWxpLVQ2
MjQgaW50ZWdyYXRlZCBiZWhpbmQgYW4gTU1VLTQwMCAoYXMgYSBnZXN0dXJlIHRvd2FyZHMKPiB2
aXJ0dWFsaXNhdGlvbiksIGluIHRoZWlyIG93biBkZWRpY2F0ZWQgcG93ZXIgZG9tYWluIHdpdGgg
RFZGUwo+IGNvbnRyb2xsZWQgYnkgdGhlIFNDUC4KPgo+IENDOiBMaXZpdSBEdWRhdSA8bGl2aXUu
ZHVkYXVAYXJtLmNvbT4KPiBDQzogU3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4K
PiBDQzogTG9yZW56byBQaWVyYWxpc2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPiAtLS0KPiAg
Li4uL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnlhbWwgICAgICAgIHwgIDUgKysrLQo+
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FybS9qdW5vLWJhc2UuZHRzaSAgICAgICAgfCAyNyArKysr
KysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
