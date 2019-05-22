Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5626CCB
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 21:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB3F89BE8;
	Wed, 22 May 2019 19:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF26489BE8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 19:37:41 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9FE821473
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 19:37:41 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id m32so3900313qtf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 12:37:41 -0700 (PDT)
X-Gm-Message-State: APjAAAVk27Qq5x7eNKkb58KHmZDD0Qm0mJ25JIKPGiyHatqeyowxR6N+
 Yl4k2GbwONpldnHQMiJHXWLtKT1F4EM137jpyw==
X-Google-Smtp-Source: APXvYqyvQA0DlBQCl0dcjjCe/pm9yiLcemUSw6voBD6ZAURo33XiNKtxHRpnO4B91SAIh1FVmA/dMAlbYtOmZ3lZOl0=
X-Received: by 2002:a0c:929a:: with SMTP id b26mr72722492qvb.148.1558553860979; 
 Wed, 22 May 2019 12:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190517150042.776-1-ezequiel@collabora.com>
 <d3feaa58-ff8f-614e-0aad-969a8b1c950c@baylibre.com>
In-Reply-To: <d3feaa58-ff8f-614e-0aad-969a8b1c950c@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 May 2019 14:37:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ7JUiSYS9OaKHPwKrsRRw7s6TQTWz_qSJ+F2eRqqdo2A@mail.gmail.com>
Message-ID: <CAL_JsqJ7JUiSYS9OaKHPwKrsRRw7s6TQTWz_qSJ+F2eRqqdo2A@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Select devfreq
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558553861;
 bh=xuOCdr9OBhB6lk8Ng0SesBbIf5fuWxrkVYV7EGZsZMI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=n4tM+09NWzVmMdaKps61P4II4gRCu8THvoDypt2VIk+rxVZnyAl2aloCSW8TrbfXP
 b0DT5D0JnYj3AETZYcwqt6UMjIUb8S1uGbpPi+cUJrEJ3Opd/1SvpJFigXxlCQa7FC
 cfsHkvXwMFHg+j6RtfZnj2TKnKiTGPhtzOYoSqY4=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTA6MzMgQU0gTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJv
bmdAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IE9uIDE3LzA1LzIwMTkgMTc6MDAsIEV6ZXF1aWVs
IEdhcmNpYSB3cm90ZToKPiA+IEN1cnJlbnRseSwgdGhlcmUgaXMgc29tZSBsb2dpYyBmb3IgdGhl
IGRyaXZlciB0byB3b3JrIHdpdGhvdXQgZGV2ZnJlcS4KPiA+IEhvd2V2ZXIsIHRoZSBkcml2ZXIg
YWN0dWFsbHkgZmFpbHMgdG8gcHJvYmUgaWYgIUNPTkZJR19QTV9ERVZGUkVRLgo+ID4KPiA+IEZp
eCB0aGlzIGJ5IHNlbGVjdGluZyBkZXZmcmVxLCBhbmQgZHJvcCB0aGUgYWRkaXRpb25hbCBjaGVj
a3MKPiA+IGZvciBkZXZmcmVxLgo+ID4KPgo+IFBsZWFzZSBhZGQgYSBGaXhlcyB0YWcuCgpJIGFw
cGxpZWQgdGhpcywgYnV0IGZvcmdvdCB0aGUgRml4ZXMgdGFnLgoKUm9iCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
