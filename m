Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83060332A1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 16:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34BE89144;
	Mon,  3 Jun 2019 14:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D8289144;
 Mon,  3 Jun 2019 14:48:55 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 30D496087A; Mon,  3 Jun 2019 14:48:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C98C6074F;
 Mon,  3 Jun 2019 14:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0C98C6074F
Date: Mon, 3 Jun 2019 08:48:51 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] of/device: add blacklist for iommu dma_ops
Message-ID: <20190603144851.GD23227@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Clark <robdclark@gmail.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Frank Rowand <frowand.list@gmail.com>,
 Will Deacon <will.deacon@arm.com>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com>
 <401f9948-14bd-27a2-34c1-fb429cae966d@arm.com>
 <CAF6AEGuGGAThqs9ztTNyGnMyhFc9wbtn=N8A4qqQxcN_PAxsEw@mail.gmail.com>
 <20190603135408.GE30132@ulmo>
 <CAF6AEGtrfqYBNyjpHsUy1Tj-FJZ0MybvAJdHQsqb5kqih2BY3A@mail.gmail.com>
 <20190603144016.GG30132@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603144016.GG30132@ulmo>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559573335;
 bh=wmoyPPaA8jIHMpOlZBcNsMxuLi2MxGFaoo8cyvL/4vc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q6D29WeeBtajNgR3/diaSCi5G1OQpJ1ET9nzjd9biggspT1oqLnYYXtxlc+1w1dN4
 E6RCMkzMF7PJsGZYaKgx2m3XTXUH0KFRN7NBaH5D/cJZkqSjrKYGYNe0fK3ZRu+wS1
 HkbS56XHSHp43YaHJTqLnEkFUgrg9NsaxAT0RVX0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559573334;
 bh=wmoyPPaA8jIHMpOlZBcNsMxuLi2MxGFaoo8cyvL/4vc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YYG9f7cy6p6luyC1AgZvLfOFGLyxCO29eirTTmZjQY4Nx4kCr3Ure3l14036D3gg7
 JIphsgGXr/l6WnM/RsZEXmr93gIzSj0IA1H4IejYQYEryr3N5T4uD3PFPav4fFRAAV
 g8lrWkVOl5dtfEIbXdC8hf95q1ikEIc9qAZuDbO4=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Sean Paul <seanpaul@chromium.org>, freedreno <freedreno@lists.freedesktop.org>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBJdCBzaG91bGRuJ3QgYmUgYSBwcm9ibGVtIHRvIGhvb2sgc29tZXRoaW5nIGVsc2UgdXAgdG8g
dGhlIElPTU1VCj4gc3Vic3lzdGVtLiBIb3BlZnVsbHkgaXQncyBzb21ldGhpbmcgdGhhdCBwZW9w
bGUgYXJlIGdvaW5nIHRvIHN0YW5kYXJkaXplCj4gb24uCj4gCj4gPiAzKSBUaGUgYXV0b21hdGlj
IGF0dGFjaCBvZiBETUEgZG9tYWluIGlzIGFsc28gY2F1c2luZyBhIGRpZmZlcmVudAo+ID4gICAg
cHJvYmxlbSBmb3IgdXMgb24gdGhlIEdQVSBzaWRlLCBwcmV2ZW50aW5nIHVzIGZyb20gc3VwcG9y
dGluZyBwZXItCj4gPiAgICBjb250ZXh0IHBhZ2V0YWJsZXMgKHNpbmNlIHdlIGVuZCB1cCB3aXRo
IGEgZGlzYWdyZWVtZW50IGFib3V0Cj4gPiAgICB3aGljaCBjb250ZXh0IGJhbmsgaXMgdXNlZCBi
ZXR3ZWVuIGFybS1zbW11IGFuZCB0aGUgZmlybXdhcmUpLgo+IAo+IEknbSBub3Qgc3VyZSBJIHVu
ZGVyc3RhbmQgdGhpcyBpc3N1ZS4gSXMgdGhlIGNvbnRleHQgYmFuayBoYXJkLWNvZGVkIGluCj4g
dGhlIGZpcm13YXJlIHNvbWVob3c/IE9yIGlzIGl0IHBvc3NpYmxlIHRvIHJld3JpdGUgd2hpY2gg
b25lIGlzIGdvaW5nIHRvCj4gYmUgdXNlZCBhdCBydW50aW1lPyBEbyB5b3Ugc3dpdGNoIG91dCB0
aGUgYWN0dWFsIHBhZ2UgdGFibGVzIHJhdGhlciB0aGFuCj4gdGhlIElPTU1VIGRvbWFpbnMgZm9y
IGNvbnRleHQgc3dpdGNoaW5nPwogCldlIGhhdmUgYSByYXRoZXIgbG9uZyBoaXN0b3J5IG9uIHRo
aXMgYnV0IHRoZSB0bDtkciBpcyB0aGF0IHRoZSBHUFUgbWljcm9jb2RlCnN3aXRjaGVzIHRoZSBw
YWdldGFibGVzIGJ5IHJld3JpdGluZyBUVEJSMCBvbiB0aGUgZmx5IChzaW5jZSB0aGlzIGlzCmFy
bS1zbW11LXYyIHdlIGhhdmUgbm8gYmV0dGVyIG9wdGlvbikgYW5kIHllcywgdW5mb3J0dW5hdGVs
eSBpdCBpcyBoYXJkIGNvZGVkCnRvIHVzZSBjb250ZXh0IGJhbmsgMC4gWzFdIGlzIHRoZSBjdXJy
ZW50IHBhdGNoc2V0IHRvIHN1cHBvcnQgYWxsIHRoaXMsCmluY2x1ZGluZyBteSBvd24gdGFrZSBv
biBhdm9pZGluZyB0aGUgZG1hLWRvbWFpbiAoYWxsIHRoZSBjb29sIGtpZHMgaGF2ZSBvbmUpLgoK
Sm9yZGFuCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81NzQ0
MS8KCi0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIg
b2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFBy
b2plY3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
