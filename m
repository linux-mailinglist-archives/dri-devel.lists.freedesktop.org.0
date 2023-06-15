Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21D17322CC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 00:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A0510E563;
	Thu, 15 Jun 2023 22:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFC210E562
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 22:32:17 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C7723200CC;
 Fri, 16 Jun 2023 00:32:14 +0200 (CEST)
Date: Fri, 16 Jun 2023 00:32:13 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 00/22]drm/msm/dpu: another catalog rework
Message-ID: <a3lfr4tgdhhcvdf5h6q25gstajtth772isjgaibmxtalhzxnsk@u4dbwpjva4yd>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <168682860384.384026.9850510984858511761.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168682860384.384026.9850510984858511761.b4-ty@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-15 14:31:22, Dmitry Baryshkov wrote:
> 
> On Tue, 13 Jun 2023 03:09:39 +0300, Dmitry Baryshkov wrote:
> > Having a macro with 10 arguments doesn't seem like a good idea. It makes
> > it inherently harder to compare the actual structure values. Also this
> > leads to adding macros covering varieties of the block.
> > 
> > As it was previously discussed, inline all foo_BLK macros in order to
> > ease performing changes to the catalog data.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [01/22] drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
>         https://gitlab.freedesktop.org/lumag/msm/-/commit/5efc0fec31d8
> [02/22] drm/msm/dpu: correct MERGE_3D length
>         https://gitlab.freedesktop.org/lumag/msm/-/commit/f01fb5e211fd
> [03/22] drm/msm/dpu: remove unused INTF_NONE interfaces
>         https://gitlab.freedesktop.org/lumag/msm/-/commit/17bf6f8efc50

The first two patches are fixes, the third one is not?

- Marijn

> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
