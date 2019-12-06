Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DBB115642
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 18:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2786E0B8;
	Fri,  6 Dec 2019 17:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9546E0B8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 17:15:24 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4757424673
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 17:15:24 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id s8so7834987qte.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 09:15:24 -0800 (PST)
X-Gm-Message-State: APjAAAX3kiZjjt0+IivyaorNY5xMP34du9a3BVp9ITQ1UO+qqENCs7HF
 3lLq+2VIi/S2OJxYNtCqhSaN+YGtb2ONfo8I2g==
X-Google-Smtp-Source: APXvYqzTWxas0S4Jz6KaegKdEwKqSvoNhpKHJ4r+/1+DDtr5QEuTUNpmHtLl4nWkUgBRGBb2TQHXUClipsrP6lIjghQ=
X-Received: by 2002:ac8:341d:: with SMTP id u29mr13917741qtb.300.1575652523457; 
 Fri, 06 Dec 2019 09:15:23 -0800 (PST)
MIME-Version: 1.0
References: <21f228099321f460d62e0ab7c77b2d2213dd4da8.1574974319.git.robin.murphy@arm.com>
In-Reply-To: <21f228099321f460d62e0ab7c77b2d2213dd4da8.1574974319.git.robin.murphy@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 6 Dec 2019 11:15:11 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+psFvkMSzGYEg4H-VLrtEQRAsvwbfyqZxOeZ1yCMX08A@mail.gmail.com>
Message-ID: <CAL_Jsq+psFvkMSzGYEg4H-VLrtEQRAsvwbfyqZxOeZ1yCMX08A@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Register devfreq cooling device
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575652524;
 bh=o/jjulZ24JsuD6OoET88Sju5eAzcokb9u50FbrWglo8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KT9JUE+0spfDeF70CEOGqNr6FACc+e7T4yQkgLpp2SiVtUR2U03cq42hcRsL86Hni
 Wj2aSi0zroCzyct0zKnnU+Wi9rbjz5pVjKWbhkPWNykPi1+JEcIPOEN58sC10E5Vva
 Nf4ffcg4v7pBbmGbzFKmOdYvZR9H04MmWekgWmAc=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMjo1NCBQTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPiB3cm90ZToKPgo+IFdoZW4gd2UgaGF2ZSBkZXZmcmVxLCBhbHNvIHRyeSB0byBy
ZWdpc3RlciBhIGJhc2ljIGNvb2xpbmcgZGV2aWNlIGluCj4gY2FzZSBHUFUgd29ya2xvYWRzIG1h
bmFnZSB0byBoaXQgdGhlcm1hbCB0aHJvdHRsaW5nIHRocmVzaG9sZHMuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgMzIgKysrKysrKysrKysrKyst
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkKCkFwcGxpZWQuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
