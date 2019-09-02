Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79795A5772
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 15:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB3F8991E;
	Mon,  2 Sep 2019 13:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB5A8991E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 13:12:17 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a13so15575427qtj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 06:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vng3Tg83WDYX4tcTvi7PVwbn8OfQHJcD8QCDyHXste4=;
 b=bu1h5u3ca5Q20eR6fj3mO+yHWOBnd2PDD7C32asgDcSNf2KveTRaRS0YZ6uBRV35yu
 zG8gRLsmJEbD0mSh6NIxAYGHVAoxF0XgyHOuaukfhxvAAQf9askw0SwPPogakeiAiGXV
 q1bgsT3x6Pe9aF3V1WfPr8EXZCAWxmGS0/mqU86HMqEFJIby3GXwxIulqYdIw24jBBlS
 RaImeSRiAw2iUVydDKqSwKl9bEWj3tQ+a+qq9kqyf7hTjz2MjofNgR3gMZiV4U85XzOg
 Ltc5VrdWqfz1ThSnSpyuxuD85W/VxIsw5lz0dnqTewD02mEkXREksnh04dFDGe+eJoIc
 pbGA==
X-Gm-Message-State: APjAAAUbFFxL5g5Ud4tNclD3i40PFGaLisDGDGBv0ba3AYK6unPb/EAf
 fqHlwEmyAyJ6mDbdyLoBQoH00HumytI7qBZaDVoK7Of3
X-Google-Smtp-Source: APXvYqxNhdLCivs8eaOs0QrrWUNeEKFbFZne9cWsy6FgQcZ0/Edh/ZIQ1hY9usGlSSLN6c81KQJBgSpCd7KB28Vx1L0=
X-Received: by 2002:ac8:2e94:: with SMTP id h20mr2499804qta.234.1567429937121; 
 Mon, 02 Sep 2019 06:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190823071428.6155-1-linus.walleij@linaro.org>
In-Reply-To: <20190823071428.6155-1-linus.walleij@linaro.org>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 2 Sep 2019 15:12:06 +0200
Message-ID: <CA+M3ks7TbSmr4LQkEbOD0WnzO2aSg-8cyg5UAfo5YdfOBMwFfg@mail.gmail.com>
Subject: Re: [PATCH] drm/sti: Include the right header
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vng3Tg83WDYX4tcTvi7PVwbn8OfQHJcD8QCDyHXste4=;
 b=pw/W4F21dGSGUnOjLaMhDyZYrWqn+Ze1RTdbO/hIp7xP1cpGHcP8daJSpqDrDrH9RN
 SMFMWetzv2NFdqWzY8A+TF8foI0cBGcBGCtvlLVij9Hcxw4DACjR5NCE++XzVbsz2HCN
 1MALTl+SnxeXTszcU0cJ8vkn58znXowRxT2tIPAjKo/HVOTIh2LtaI5fHyLjmR5zdljM
 qEShCMn3LO1eCQVnX9/uKIM2Xwiv/jSRXZaxCmOVNrnytmqba9hqGKEKW8TJdwY9VAT3
 Q6XZVZLLdSqvrWJau2cQZs5HBhYb7AgppVPwbeQWSGCs6JyIFftOyBoc3PFEH31kg5dG
 mJ0w==
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
 Vincent Abriou <vincent.abriou@st.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgdmVuLiAyMyBhb8O7dCAyMDE5IMOgIDA5OjE0LCBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+IGEgw6ljcml0IDoKPgo+IFRoZSBzdGlfaGRtaS5jIGZpbGUgaW5jbHVk
ZSA8bGludXgvb2ZfZ3Bpby5oPiBkZXNwaXRlIG5vdCBldmVuCj4gdXNpbmcgYW55IEdQSU9zLgo+
Cj4gV2hhdCBpdCBkb2VzIHVzZSBpcyBkZXZtX2lvcmVtYXBfbm9jYWNoZSgpIHdoaWNoIGNvbWVz
IGZyb20KPiA8bGludXgvaW8uaD4gaW1wbGljaXRseSBieSBpbmNsdWRpbmcgdGhhdCBoZWFkZXIu
Cj4KPiBGaXggdGhpcyB1cCBieSBpbmNsdWRpbmcgdGhlIHJpZ2h0IGhlYWRlciBpbnN0ZWFkLgoK
QXBwbGllZCBvbiBkcm0tbWlzYy1uZXh0LApUaGFua3MKCkJlbmphbWluCgo+Cj4gQ2M6IEJlbmph
bWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+IENjOiBWaW5jZW50
IEFicmlvdSA8dmluY2VudC5hYnJpb3VAc3QuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3N0aS9zdGlfaGRtaS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9o
ZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMKPiBpbmRleCBmMDNkNjE3ZWRj
NGMuLjRmMWFhZjIyMmNiMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9o
ZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMKPiBAQCAtOSw3ICs5
LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2hk
bWkuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2Zf
Z3Bpby5oPgo+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KPgo+IC0tCj4gMi4yMS4w
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
