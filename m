Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A3D32EC3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 13:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69618925D;
	Mon,  3 Jun 2019 11:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E7589115;
 Mon,  3 Jun 2019 11:32:17 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 305436087A; Mon,  3 Jun 2019 11:32:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4ED1960DB3;
 Mon,  3 Jun 2019 11:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4ED1960DB3
Received: by mail-ed1-f43.google.com with SMTP id x25so14250529eds.8;
 Mon, 03 Jun 2019 04:32:16 -0700 (PDT)
X-Gm-Message-State: APjAAAXnqXKxs8xfgKMdutGkd9epKpt7QfBvRpvNlYvLszoexcS2+zgH
 EoPCMrDCv98bmy2KNudBi2tIuImhaob72kbFRpo=
X-Google-Smtp-Source: APXvYqyiIFFrNC2dS0VKPCYWX1j2jp1tB7QsnH94XhbngF15E/fbqVAiXipU+Z4bYlGRkMHto3FDPg70mdWqFQgEqKg=
X-Received: by 2002:a50:85c1:: with SMTP id q1mr25059239edh.253.1559561535071; 
 Mon, 03 Jun 2019 04:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20181201165348.24140-1-robdclark@gmail.com>
 <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <4864dc3e-6e04-43e5-32c8-2cf5a0705fe5@codeaurora.org>
 <CAF6AEGuFyk1DJWUcQTnW=xsEUhYTYJccjzHJFxvipK4M8UdrUA@mail.gmail.com>
 <CAFp+6iGexVjbak8RQhEQNPp5cV8PK2ubTNNCMyaFPqdTGAbJ0A@mail.gmail.com>
 <20190603111705.GA27163@lst.de>
In-Reply-To: <20190603111705.GA27163@lst.de>
From: Vivek Gautam <vivek.gautam@codeaurora.org>
Date: Mon, 3 Jun 2019 17:02:03 +0530
X-Gmail-Original-Message-ID: <CAFp+6iEULiB74ecZQ4E+Jouj0AYZu4cDBgy3S2LuT6Ud4uf+KQ@mail.gmail.com>
Message-ID: <CAFp+6iEULiB74ecZQ4E+Jouj0AYZu4cDBgy3S2LuT6Ud4uf+KQ@mail.gmail.com>
Subject: Re: [PATCH] of/device: add blacklist for iommu dma_ops
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Mon, 03 Jun 2019 11:37:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559561537;
 bh=u888gqwF5NhltRBK8QKDhfIseMU8jp8wEFqDIraWQdM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nMoCQMTLHHj4U+Y6FJPQlUokPulCRDfdG0mnglE0VnYreDcFAvUhXAB7ZhZ/xf2Xz
 pouMdu8/KphryGpg1bFGyBNHNsstHJel/gO7lr5J0Qq0aMTJlUZB6ANd9dRXN6B0Vc
 Cl59+jU74fIKLw40uoPLawLkGv6jueo9kTOf0vGI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559561536;
 bh=u888gqwF5NhltRBK8QKDhfIseMU8jp8wEFqDIraWQdM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hxQLPhaQslKp9q099I3Z4uSekA0WGa7SAv077w193RpFzKvwqHaoZFDupcsWhOy3h
 GS2T89RpACK5+kgV4Wng/QklehjK4cseEogNCONidArZowYO3qBvJZe5pMx4HynvCG
 CZfmelntQRr2W1WyuVQK9105rGLlFYPQCojwHpoM=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Archit Taneja <architt@codeaurora.org>,
 Frank Rowand <frowand.list@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMywgMjAxOSBhdCA0OjQ3IFBNIENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPiB3cm90ZToKPgo+IElmIHlvdSAoYW5kIGEgZmV3IG90aGVycyBhY3RvcnMgaW4gdGhlIHRo
cmVhZCkgd2FudCBwZW9wbGUgdG8gYWN0dWFsbHkKPiByZWFkIHdoYXQgeW91IHdyb3RlIHBsZWFz
ZSBmb2xsb3cgcHJvcGVyIG1haWxpbmcgbGlzdCBldHRpcXVldHRlLiAgSSd2ZQo+IGdpdmVuIHVw
IG9uIHJlYWRpbmcgYWxsIHRoZSByZWNlbnQgbWFpbHMgYWZ0ZXIgc2Nyb2xsaW5nIHRocm91Z2gg
dHdvCj4gcGFnZXMgb2YgZnVsbCBxdW90ZXMuCgpBcG9sb2dpZXMgZm9yIG5vdCBjdXR0aW5nIGRv
d24gdGhlIHF1b3RlZCB0ZXh0LiBJIHdpbGwgYmUgbW9yZSBjYXJlZnVsCm5leHQgdGltZSBvbndh
cmRzLgoKUmVnYXJkcwpWaXZlawoKLS0gClFVQUxDT01NIElORElBLCBvbiBiZWhhbGYgb2YgUXVh
bGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIKb2YgQ29kZSBBdXJvcmEg
Rm9ydW0sIGhvc3RlZCBieSBUaGUgTGludXggRm91bmRhdGlvbgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
