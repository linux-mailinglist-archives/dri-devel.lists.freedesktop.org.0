Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1451114504
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D497889236;
	Mon,  6 May 2019 07:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B618923C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 07:09:34 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h21so10066657ljk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 00:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iRT2BpDptSkxB+ApVYaSpu4TH0+tPZF2HuarptiGZHE=;
 b=Z+PT//yHwo0ID2z8PPiyHiRuUTEtuF59Zqtz8GKlxhwvA9fX2dq+iPaGJbWjLkUJIP
 aakT7mSlTvI2p3zMrBlV60SblnpNM+NKKet6HyaPqMYXTgXtvRWXuRIs1MdjlriFKO14
 Yvv+xYRNbrKq2a7beXR5NvhuNshze06vL628J+g5tsdCBI5VrkgHJh/yJIx12f1/ELVd
 QB2Fq66HCODnsAkDkkabM0f8uFtnEqboRDVXoL2+tUCg9tKyK+599rmLESMRscgyW8rH
 oWWLjaE9WrxsS1oPbTmoTo9/DMbS+poIMSho5J0vIknQP5i/tXi8y7wOVQhh5noCvkCH
 K3Aw==
X-Gm-Message-State: APjAAAVDdStRYXwEgKSoTZYDHX5LIKD7VjuRoj8px3aibb0b6eEewmUr
 gdmHlwJ4gPYF+0rIIzyouEp5+73IkLtgfcWfAP8eIA==
X-Google-Smtp-Source: APXvYqzoDokcVuvzHXFld3YjPVy3p1eBu2FljGmJcbGtSdNiGf7iikESKDnQSx54yh3i2/GC34Hlw9JUZsHZhhRerZE=
X-Received: by 2002:a2e:8e93:: with SMTP id z19mr9439736ljk.159.1557126573442; 
 Mon, 06 May 2019 00:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-7-masneyb@onstation.org>
In-Reply-To: <20190505130413.32253-7-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2019 09:09:21 +0200
Message-ID: <CACRpkdZeMcn-kJqtaZUmfXeibh3SmyKDMUMZt-gLSzEDhGcdCA@mail.gmail.com>
Subject: Re: [PATCH RFC 6/6] ARM: dts: qcom: msm8974-hammerhead: add support
 for display
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iRT2BpDptSkxB+ApVYaSpu4TH0+tPZF2HuarptiGZHE=;
 b=oKQMEJ8hH/CtsoFlFjBJEHKYnOh4w/g2pDH66nAnJWQ20Bk5RpeuVDK4fYGsd80t9p
 byiDPusCcIFnWgH5BXvaRXanBTBFCJXeidbHDr5G45NiIafotdeIuOz2VZykaC5H5Mp7
 Nt9PVf7G+4Swhgyxg4QvbTm2YBJcbUPRdTbUp1SwOlewc1CYb/GLrGuOb6cmQc0yb4a/
 BrP3pyrvcYHSqZNzskcaDH54+p+5J+0CzC6yNY0DcmV45l1J+6m8LmA4v53vZvbhzZ7B
 lbTe0TnINsOdajsQO3lUCoKbIXFXHwOa3cxXBTBTMW4Y8TZWgRbWv/7E2GDTiCcMxUBR
 ar8w==
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
Cc: Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgNSwgMjAxOSBhdCAzOjA0IFBNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0
YXRpb24ub3JnPiB3cm90ZToKCj4gQWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIGRpc3BsYXkg
Zm91bmQgb24gdGhlIExHIE5leHVzIDUgKGhhbW1lcmhlYWQpCj4gcGhvbmUuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KClJldmlld2VkLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMg
V2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
