Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D298924B0FC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 10:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4C66E030;
	Thu, 20 Aug 2020 08:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA1B6E030
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 08:23:38 +0000 (UTC)
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8686E22BED;
 Thu, 20 Aug 2020 08:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597911818;
 bh=fwGVCmgPxQ4tMxOoVebfaKdoWjHkC+p6W4oBmOn2pCQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k0Qrqpn40gEcXyvKnJpr0UKl58JLXD6w6wg75Lq2H21jh3VFgBAOCOS+kekx5tu9V
 jsUl78z48aIZGiHBdWd1mOYDpQBTELDITS0xBdrtmERRoFb9QzRIeW0N/YpsPE8jit
 7HQ7sD1Dxlw1XtG5XGuAiZ1QVR+DwoViOpFp6a28=
Date: Thu, 20 Aug 2020 10:23:32 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 25/49] staging: hikey9xx/gpu: do some code cleanups
Message-ID: <20200820102332.7223d38d@coco.lan>
In-Reply-To: <CALAqxLV-LaMPKD-ddRM1EehFh+JZfh1eUsKobXgVG9R+q0EF2w@mail.gmail.com>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
 <9fa944021373ec5b82c2c1e118c15d9effe7f964.1597833138.git.mchehab+huawei@kernel.org>
 <CALAqxLV-LaMPKD-ddRM1EehFh+JZfh1eUsKobXgVG9R+q0EF2w@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Liwei Cai <cailiwei@hisilicon.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Chen Feng <puck.chen@hisilicon.com>,
 mauro.chehab@huawei.com, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(added c/c Rob Herring)

Em Wed, 19 Aug 2020 18:53:06 -0700
John Stultz <john.stultz@linaro.org> escreveu:

> On Wed, Aug 19, 2020 at 4:46 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> > @@ -376,7 +355,7 @@ static int kirin_drm_platform_resume(struct platform_device *pdev)
> >  }
> >
> >  static const struct of_device_id kirin_drm_dt_ids[] = {
> > -       { .compatible = "hisilicon,hi3660-dpe",
> > +       { .compatible = "hisilicon,kirin960-dpe",  
> 
> 
> One issue, elsewhere in your patch stack you still refer to the
> hisilicon,hi3660-dpe compatible string. This should probably be
> consistent one way or the other.

Agreed with regards to consistency.

It sounds to me that calling those as Kirin 9xx (and the previous one
as Kirin 620) is better than using the part number.

Here, googling for "Kirin 970" gave about 6.9 million hits, while "Hi3670"
gave only 75,5K hits.

Kirin 620 has similar results: 6.85 million hits, against 61,9 hits
for "Hi3620".

With "Kirin 960", the numbers are a lot higher: had 21,4 million hits,
against 423K hits for "Hi3660".

So, my preference is to use "Kirin 620, 960 and 970" for future changes.

-

Currently, there are already some inconsistency, as some places
use the part number where others use "Kirin xxx" designation,
when referring to Kirin 620, 960 and 970.

I would love to make this consistent among the Kernel. However,
I'm not sure if changing "compatible" would be acceptable
by DT maintainers.

If something like that would be OK, I can prepare a separate
patchset to be applied at the Kernel.

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
