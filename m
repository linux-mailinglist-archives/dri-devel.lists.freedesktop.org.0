Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDC724B1A3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 11:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1226E092;
	Thu, 20 Aug 2020 09:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1218D6E092
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 09:04:45 +0000 (UTC)
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A3D652078B;
 Thu, 20 Aug 2020 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597914284;
 bh=44LPzlmFBOIyCh0BkVIkys/ibH3hQxYtoLkTqsFyeGc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=yJNS0t5KpBVawcDs1ud1B3UQlNu9K/mTz+NCHtNFf/OpfMymD5BUwApgRSl7BdGyW
 E1tcMS0UrPc5RyT2UtYhdP+pwQnCg3+nE/tbwZhGDBFyU56DVvJdFC3TPWaIsdcsDY
 lBbQJcG5PRKkU7iEc3wbYtOS5pnab6p4LKuBhZ4Q=
Date: Thu, 20 Aug 2020 11:04:40 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 1/3] drm: hikey9xx: Fix inconsistent compat string
Message-ID: <20200820110440.6b09bf8e@coco.lan>
In-Reply-To: <20200820033939.127932-1-john.stultz@linaro.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
 <20200820033939.127932-1-john.stultz@linaro.org>
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
Cc: Liwei Cai <cailiwei@hisilicon.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Thu, 20 Aug 2020 03:39:39 +0000
John Stultz <john.stultz@linaro.org> escreveu:

> This is against Mauro's tree here:
> https://gitlab.freedesktop.org/mchehab_kernel/hikey-970/-/commits/master/
> 
> A previous patch changed this string to be
> "hisilicon,kirin960-dpe", but there are other place where the
> code still expects "hisilicon,hi3660-dpe", so change it back.

All 4 patches applied fine, and didn't cause any bad side effects
for Hikey 970.

So, I'll add them to my series. Thanks!

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
