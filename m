Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F05A6ED7AE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 00:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD79210E20D;
	Mon, 24 Apr 2023 22:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878DE10E20D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 22:18:14 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 378C93F5CF;
 Tue, 25 Apr 2023 00:18:06 +0200 (CEST)
Date: Tue, 25 Apr 2023 00:18:04 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 02/17] drm/msm/dpu: Remove TE2 block and feature from
 DPU >= 7.0.0 hardware
Message-ID: <l3adl3saeqovypmluubddp6kqcjducn75ifpf63ylbecuprpi3@gpoks434n4yg>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-2-ef76c877eb97@somainline.org>
 <ca4012ee-d964-c2e9-b437-b03277d71529@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca4012ee-d964-c2e9-b437-b03277d71529@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rajesh Yadav <ryadav@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jeykumar Sankaran <jsanka@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-24 13:41:07, Abhinav Kumar wrote:
> 
> 
> On 4/17/2023 1:21 PM, Marijn Suijten wrote:
> > No hardware beyond kona (sm8250) defines the TE2 PINGPONG sub-block
> > offset downstream.  Even though neither downstream nor upstream utilizes
> > these registers in any way, remove the erroneous specification for
> > SC8280XP, SM8350 and SM8450 to prevent confusion.
> > 
> > Note that downstream enables the PPSPLIT (split-FIFO) topology (single
> > LM for 2 PP and 2 INTF) based on the presence of a TE2 block.
> > 
> > Fixes: f0a1bdf64dd7 ("drm/msm/dpu: Introduce SC8280XP")
> > Fixes: 0a72f23f6ef8 ("drm/msm/dpu: Add SM8350 to hw catalog")
> > Fixes: 8cbbc3396065 ("drm/msm/dpu: add support for SM8450")
> 
> I cannot find any commits with those hashes.
> 
> Should this be
> 
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")

Yes they are, thanks for spotting that.  These patches were on drm-msm
/ msm-next when I made this patch on January 11th, hence these were the
hashes given to me by git bisect: see how those patches have an author
timestamp of January 9th, while the proper hashes that landed upstream
have a hash of January 12th: the branch has been force-pushed after.

Old:

https://gitlab.freedesktop.org/drm/msm/-/commit/f0a1bdf64dd7
https://gitlab.freedesktop.org/drm/msm/-/commit/0a72f23f6ef8
https://gitlab.freedesktop.org/drm/msm/-/commit/8cbbc3396065

New:

https://gitlab.freedesktop.org/drm/msm/-/commit/4a352c2fc15a
https://gitlab.freedesktop.org/drm/msm/-/commit/0e91bcbb0016
https://gitlab.freedesktop.org/drm/msm/-/commit/100d7ef6995d

> Will wait for a day to fix this up, otherwise I will do it while applying.

Thanks, that's appreciated.

- Marijn

> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  4 ++--
> >   3 files changed, 10 insertions(+), 10 deletions(-)

<snip>
