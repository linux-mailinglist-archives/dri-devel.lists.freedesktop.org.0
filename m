Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BA8B43C2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 00:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621406EA8E;
	Mon, 16 Sep 2019 22:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2301D6EA8E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 22:07:27 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A0CEE2186A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 22:07:26 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id f16so1650348qkl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 15:07:26 -0700 (PDT)
X-Gm-Message-State: APjAAAVLokT9Obibnyte4dX6oQS6SbtRK8xRrfunGApgCzvMO1aaVWcq
 awzRv+SbLVtPe+WQmnHQuWwf4y/ZsLaJH3auHg==
X-Google-Smtp-Source: APXvYqw0JdhpCWLexwIOT8ESTlHEFkeSnb9jRER69EJErTdTZGBlE/PDwDE/PA78bdeKSSrQ0wdFLVGRQB2aD4rqikg=
X-Received: by 2002:a05:620a:549:: with SMTP id
 o9mr575224qko.223.1568671645784; 
 Mon, 16 Sep 2019 15:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-4-kraxel@redhat.com>
In-Reply-To: <20190913122908.784-4-kraxel@redhat.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Sep 2019 17:07:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJajCtM=vRgSDX2DQ6iJzDgMHicXgXgGqF7Bc-KdTUUQA@mail.gmail.com>
Message-ID: <CAL_JsqJajCtM=vRgSDX2DQ6iJzDgMHicXgXgGqF7Bc-KdTUUQA@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/shmem: drop DEFINE_DRM_GEM_SHMEM_FOPS
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568671646;
 bh=dOmx+5b6FQTG2S2CZB6xwqvYvyES1DQ1DZe+OAaMClg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vqktAQYAqdZQgDA2CtTybSuSETpsBWt7QdjYS1Ul6ZH2Zqd4TNkLn2pHNuNvPk/Vt
 4tJIsivFm0ZeY014fO1zUv9DeJY9X03hJAY8KY4lKExIcQtByGyCi6qUSYdoEUP7I+
 kMzmbws2N/zLBMqRsNuZ8b864lBbNVokNah0F+Vk=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Hans de Goede <hdegoede@redhat.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgNzoyOSBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KClZlcnNpb24/IFByZXR0eSBzdXJlIHRoaXMgaXMgbm90IHYxLgoK
PiBERUZJTkVfRFJNX0dFTV9TSE1FTV9GT1BTIGlzIGlkZW50aWNhbAo+IHRvIERFRklORV9EUk1f
R0VNX0ZPUFMgbm93LCBkcm9wIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVs
cGVyLmggICAgICB8IDI2IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2NpcnJ1cy9jaXJydXMuYyAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20x
MnUzMjAuYyAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2LmMg
ICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5j
ICAgIHwgIDIgKy0KPiAgNiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMxIGRlbGV0
aW9ucygtKQoKQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
