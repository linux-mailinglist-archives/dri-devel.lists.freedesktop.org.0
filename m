Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3A51A12C
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 15:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D3A10ED12;
	Wed,  4 May 2022 13:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DB610ED07;
 Wed,  4 May 2022 13:41:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 47BE7CE260D;
 Wed,  4 May 2022 13:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B0EC385A5;
 Wed,  4 May 2022 13:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651671689;
 bh=8izgCIj9I2NmuN+VVbgtEFpR/n2CW+64r3eJYl8w76E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mnlDB4YdFdEbEmBQ1KPloG1YeaejdTprTQukTlTESxwdn0Kz2RmClFa4yUd5nzfFL
 Z0lg8FDOI9Fesg06rFk1ngwCPN+Uhv4ZLfOTL3puKtPFLVM+drz960NnQjPv67XhcE
 MDlrMJ4K97CTIeLg9ZmBf28L4YzD90QLb8rXvaYOc80yQzfVAQXc/lB+F7VP0/KB1D
 fBO1Kokm8d5r+tUfcwMhZ2JB2pdwy+sjjPB/htLiW+hKgZsECQY0RF9Piip7VxI4Iw
 f9pBEQ8F6x+zBI7dSc+eG9knthSLHsI16U78NFDEMc2P7GBfmh0NMQPQgNxlAOSr4R
 O6SwAGFYbTI4w==
Date: Wed, 4 May 2022 19:11:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: use RMW cycles in
 dsi_update_dsc_timing
Message-ID: <YnKChRtWhgxbOx4V@matsya>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
 <20220501204102.3xijmadbcrxwyu3x@SoMainline.org>
 <4e308633-cb0d-7050-9ee0-421190683eac@linaro.org>
 <20220502084322.nvj7rnhnemewmil6@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502084322.nvj7rnhnemewmil6@SoMainline.org>
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
Cc: Sean Paul <sean@poorly.run>, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02-05-22, 10:43, Marijn Suijten wrote:
> On 2022-05-02 01:44:20, Dmitry Baryshkov wrote:
> that require DSC for the screen to work.  I've been told the series
> didn't result in positive screen output way back in its infancy, but

I would be intrested to hear about that. I have only pixel3 at my
disposal so tested on that. I would be willing to help with more testing
efforts.

Also, to get DSC to work, the panel needs to be set as well...

> I'll re-evaluate and send fixes or improvements if/when necessary.

That would be nice

-- 
~Vinod
