Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE2709709
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 14:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55FF10E0B8;
	Fri, 19 May 2023 12:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452A110E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 12:05:58 +0000 (UTC)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl
 [82.72.63.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 985F6200C9;
 Fri, 19 May 2023 14:05:55 +0200 (CEST)
Date: Fri, 19 May 2023 14:05:54 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: drop SSPP's SRC subblock
Message-ID: <lgd2yhcbgkvdpzuiq4s657m3aq2m3bs2edoesdkh27btcgyf7o@d74kukqlma6n>
References: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
 <20230429012353.2569481-2-dmitry.baryshkov@linaro.org>
 <375aoihzzqquma4e53zfl7t6xdamlwyb2t36effy44wooylywp@5oz5jl5t54qo>
 <cace6559-dbd4-0fa0-5b59-88c75cf35091@linaro.org>
 <seamj37nkkwn5n2b6jdhpul5kgouwrph22nsyunhibw2tjutxv@euo7k55aatx4>
 <ae1cd755-ead4-79e0-8d12-074f08e592f1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae1cd755-ead4-79e0-8d12-074f08e592f1@linaro.org>
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

On 2023-05-19 00:40:03, Dmitry Baryshkov wrote:
> 
> On 19/05/2023 00:39, Marijn Suijten wrote:
> > On 2023-05-19 00:06:15, Dmitry Baryshkov wrote:
> >> On 18/05/2023 22:14, Marijn Suijten wrote:
> >>> On 2023-04-29 04:23:51, Dmitry Baryshkov wrote:
> >>>> The src_blk declares a lame copy of main SSPP register space. It's
> >>>> offset is always 0. It's length has been fixed to 0x150, while SSPP's
> >>>
> >>> It's -> its, twice.
> >>
> >> Ack
> >>
> >>>
> >>>
> >>>
> >>>> length is now correct. Drop the src_blk and access SSPP registers
> >>>> without additional subblock lookup.
> >>>
> >>> Note that the block code still calls `dpu_debugfs_create_regset32()` on
> >>> "src_blk", do we want to rename that?
> >>>
> >>
> >> I could not come up with a better debugfs file name, so I decided to
> >> leave it as is.
> > 
> > Just "blk" or "reg(s)"?  This already sits in a dspp/%d subfolder so no
> > need to repeat "dspp" at least.  But also fine to leave it untouched for
> > now.
> 
> s/dspp/sspp/ ?

Yes, sorry I've been looking at both blocks and keep mixing the names
up.

- Marijn
