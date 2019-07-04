Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2615F9CF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 16:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BF06E353;
	Thu,  4 Jul 2019 14:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5606E353
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 14:12:57 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id v129so2031703vsb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 07:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wKRslmpkzPANm9ebv0Qh2Sd9vYr8Y1eAMK6X6T5kz3I=;
 b=rEqomMr/IpB6KZINWvui/ZX4yYbQr++5vHvJX1PGdHuT0InS1CHC+Mq6AiHQp+y8b/
 EQBF1CAiCyZ8cjkVKgMgDhvK+JvLLTeupgdEAjxf2FPU7TduM0g9WPE12S52qP9H8ReL
 lBAQfa+KnBFLRmv7HMTk4qqi07+ddUXFa3jGMjfVJleH8YckX5PjZ0C8yJAzVnIb6qRc
 oK0MqcvMP06mqccJ7lWnLWADSUZ4zWdUQWtwsBTQOcsEVFlnNx0DkjHVEZOiJac+wCSK
 myQ4JTzZXuY5T9xaQbNRyIs7V3LCZLQAIS3vzctFC2LjcThdE5GP9XNSiJJFKQ5ul20b
 rZ6g==
X-Gm-Message-State: APjAAAVoSV2IbKTO51efOhVAk3GE857kgPxMveeaWm3kgwWYX+SpK453
 J3+drSJOtb3SLt8wrhWbi14vp1Yi6ACUaKjx0Jg=
X-Google-Smtp-Source: APXvYqxPAZOanpu6RTkUfxIISe/IMrQS0/sfW0PfVmqysqbzR34aJ+zYJKf4fKmUXkYK6nbG2gk4RdhB5aVhrtKDJQU=
X-Received: by 2002:a67:ee12:: with SMTP id f18mr22886705vsp.186.1562249576346; 
 Thu, 04 Jul 2019 07:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190704023605.4597-1-huangfq.daxian@gmail.com>
In-Reply-To: <20190704023605.4597-1-huangfq.daxian@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 4 Jul 2019 15:13:04 +0100
Message-ID: <CACvgo517dGz+NRr3ejmfiOvsN9L_xzaHYOUze5xxSjsqQ_KXxQ@mail.gmail.com>
Subject: Re: [Patch v2 04/10] drm/panfrost: using dev_get_drvdata directly
To: Fuqian Huang <huangfq.daxian@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=wKRslmpkzPANm9ebv0Qh2Sd9vYr8Y1eAMK6X6T5kz3I=;
 b=T4daimFoCbnkcPP4ZIOQVgY77iXo0ZIcIlZPTifnpZyulS3w0LuHMaiK1JSguD96+V
 1euy9joLBSxe68U31zgjlp4BPHkMnyA7YrcAh3+yHFwqmlmSyEQrToWH5FYt6r+iurja
 QN9Y3TWaZhkMSBRNAuZW/FsWPsf8hpDzOpz5yXr7vYJlROsLMlMfNMupCHru2m0k9J1k
 zzdiGDgvlllO/pT50PHSM0Fg1nas01TNPtJAtQh8cY1K9jXdbdrcSi5X86BlYQRQWdI4
 73I11QM9IJjR0A8WBUy5M7YDf9ec0NNmo6RVAsmtSrnkS+hA2WFE+WYm64YIOQDoghaj
 A6iA==
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
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA0IEp1bCAyMDE5IGF0IDA4OjI2LCBGdXFpYW4gSHVhbmcgPGh1YW5nZnEuZGF4aWFu
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTZXZlcmFsIGRyaXZlcnMgY2FzdCBhIHN0cnVjdCBkZXZp
Y2UgcG9pbnRlciB0byBhIHN0cnVjdAo+IHBsYXRmb3JtX2RldmljZSBwb2ludGVyIG9ubHkgdG8g
dGhlbiBjYWxsIHBsYXRmb3JtX2dldF9kcnZkYXRhKCkuCj4gVG8gaW1wcm92ZSByZWFkYWJpbGl0
eSwgdGhlc2UgY29uc3RydWN0cyBjYW4gYmUgc2ltcGxpZmllZAo+IGJ5IHVzaW5nIGRldl9nZXRf
ZHJ2ZGF0YSgpIGRpcmVjdGx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRnVxaWFuIEh1YW5nIDxodWFu
Z2ZxLmRheGlhbkBnbWFpbC5jb20+Cj4gLS0tClRoaXMgcGF0Y2ggaXM6ClJldmlld2VkLWJ5OiBF
bWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKLUVtaWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
