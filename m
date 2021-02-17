Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDAB31DF6A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 20:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669F66E872;
	Wed, 17 Feb 2021 19:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC556E872
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 19:08:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613588907; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=iUgyAmn0n/jIbpXd2qZaNyiWNOIW2DJRiGM1oQdo+qY=;
 b=DXUaFx4RZzpgnxoWOVrHs79wC5HMAce4oGboTbBAxqgwHtvQEA+xIMJseJeh9R2Be++HII09
 fa1rnrYl6EqmGmjmhl9pXNy6bAw1x2Z0eaPEQRF+mQj1+7ooTlWQIvFLkznCZjbORGF9S18w
 +I+UIqr+DBP92rg09DuORWUP/wQ=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 602d69a91e797edad879c0d0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 19:08:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 124CFC433ED; Wed, 17 Feb 2021 19:08:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 256B9C433C6;
 Wed, 17 Feb 2021 19:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 256B9C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Wed, 17 Feb 2021 12:08:20 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [PATCH] drm/msm/a6xx: fix for kernels without CONFIG_NVMEM
Message-ID: <20210217190820.GA2229@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Akhil P Oommen <akhilpo@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Eric Anholt <eric@anholt.net>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210216200909.19039-1-jonathan@marek.ca>
 <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
 <775436ba-c94a-ab22-d65b-b2391047ec65@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <775436ba-c94a-ab22-d65b-b2391047ec65@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 17, 2021 at 07:14:16PM +0530, Akhil P Oommen wrote:
> On 2/17/2021 8:36 AM, Rob Clark wrote:
> >On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca> wrote:
> >>
> >>Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a ENOENT error,
> >>to fix the case where the kernel was compiled without CONFIG_NVMEM.
> >>
> >>Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> >>Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >>---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >>diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>index ba8e9d3cf0fe..7fe5d97606aa 100644
> >>--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>@@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> >>
> >>         cell = nvmem_cell_get(dev, "speed_bin");
> >>         /*
> >>-        * -ENOENT means that the platform doesn't support speedbin which is
> >>-        * fine
> >>+        * -ENOENT means no speed bin in device tree,
> >>+        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM
> >
> >very minor nit, it would be nice to at least preserve the gist of the
> >"which is fine" (ie. some variation of "this is an optional thing and
> >things won't catch fire without it" ;-))
> >
> >(which is, I believe, is true, hopefully Akhil could confirm.. if not
> >we should have a harder dependency on CONFIG_NVMEM..)
> IIRC, if the gpu opp table in the DT uses the 'opp-supported-hw' property,
> we will see some error during boot up if we don't call
> dev_pm_opp_set_supported_hw(). So calling "nvmem_cell_get(dev, "speed_bin")"
> is a way to test this.
> 
> If there is no other harm, we can put a hard dependency on CONFIG_NVMEM.

I'm not sure if we want to go this far given the squishiness about module
dependencies. As far as I know we are the only driver that uses this seriously
on QCOM SoCs and this is only needed for certain targets. I don't know if we
want to force every target to build NVMEM and QFPROM on our behalf. But maybe
I'm just saying that because Kconfig dependencies tend to break my brain (and
then Arnd has to send a patch to fix it).

Jordan

> -Akhil.
> >
> >BR,
> >-R
> >
> >>          */
> >>-       if (PTR_ERR(cell) == -ENOENT)
> >>+       if (PTR_ERR(cell) == -ENOENT || PTR_ERR(cell) == -EOPNOTSUPP)
> >>                 return 0;
> >>         else if (IS_ERR(cell)) {
> >>                 DRM_DEV_ERROR(dev,
> >>--
> >>2.26.1
> >>
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
