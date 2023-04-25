Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EC26EEAEB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 01:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63E010E1F0;
	Tue, 25 Apr 2023 23:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11D910E1F0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 23:13:30 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A9D781F9AA;
 Wed, 26 Apr 2023 01:13:28 +0200 (CEST)
Date: Wed, 26 Apr 2023 01:13:27 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH v2 04/17] drm/msm/dpu: Fix PP_BLK_DIPHER ->
 DITHER typo
Message-ID: <dztjb5n24rdodxwp5sqovzykn5iq47qohyx6dxtra3gjpfg7sw@zbsl2zhg7i4f>
References: <5td7ikd76obc5bn5sndnt7fbzjuwmyxtu35ma3lykzmmbyfffk@b24jh6imaocy>
 <7541b780-482e-ea92-f788-18c8fbf45d77@quicinc.com>
 <o536qdkbrqob5wux7jvmo7expwn4bdlj7vy7egjfsyydxp5myb@xjhmolci5jzl>
 <cc537736-a555-dc3e-2e53-f1d4479eab21@quicinc.com>
 <6crk3acgxcdfdokpgcfjkojs2wdjoxalkmctqfgtc725wsgoep@kdj4zbavbe62>
 <a8f33707-b9ea-5595-e458-4f56c24c1167@quicinc.com>
 <klrcz6zw4syxllhtbuclo65lo73kdunl5syuuoiv6zzkf3fadl@rgjc7rlgaoxq>
 <5661d20d-81e9-61ba-b556-d90b5b8fdb4d@quicinc.com>
 <ztgyg2uplm7fbju7hfxvc6547zvttnslotwook2wmejiytlq7u@clq6zzwgvc5c>
 <a1501b6c-6859-549a-5739-67afdec8865b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1501b6c-6859-549a-5739-67afdec8865b@quicinc.com>
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

On 2023-04-25 15:37:44, Abhinav Kumar wrote:
> 
> 
> On 4/25/2023 3:15 PM, Marijn Suijten wrote:
> > On 2023-04-25 14:55:56, Abhinav Kumar wrote:
> > <snip>
> >>> I'll see whether I can include these fixes before sending v3 (got all
> >>> the other changes in and am all-ready to send it): is there any other
> >>> SoC you're seeing this issue on?
> >>>
> >>
> >> Thats alright, you can have it in a separate series not v3 of this one.
> >>
> >> I am picking up the fixes from this one now.
> >>
> >> I will update the other SOCs on IRC or even better i will take up this
> >> cleanup.
> > 
> > I already have the fix patch in my tree that is compatible with the
> > other patches, and will send those in a minute.  All DPU >= 7.0.0 seems
> > to be affected, both SM8350 and SM8450 need to use the SC7280 sblk with
> > DITHER V2 at 0xe0 (SM8250 is still V1).  I believe SC8280XP should also
> > be updated but do not have access to DTS: where can I find that (what is
> > its codename again?) or can you otherwise confirm this for me?
> > 
> 
> Sure, I can wait another day too. Dont want to rush you too much for this.

Thank you.  There are even more Fixes: patches now as well as some small
wording cleanups.

> 8280xp still has dither at 0xe0 and yes its version is V2.

Thanks!  Added that info now.  Is the PP blk still length 0xd4?

> 8280xp's DTS is not located in the techpack. Its a different tree.

A tree that's... not public?

- Marijn
