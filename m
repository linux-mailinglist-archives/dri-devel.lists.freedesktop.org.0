Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409E72B424
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jun 2023 23:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02C910E135;
	Sun, 11 Jun 2023 21:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817BD10E135
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jun 2023 21:20:00 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 41E6C1F55F;
 Sun, 11 Jun 2023 23:19:56 +0200 (CEST)
Date: Sun, 11 Jun 2023 23:19:54 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH v5 2/5] drm/msm/dsi: Adjust pclk rate for
 compression
Message-ID: <44xp3xrw2fo2pszoxtleurk6rk26nrp2envvxizmosidubnqis@turyqhwmvjxi>
References: <20230405-add-dsc-support-v5-0-028c10850491@quicinc.com>
 <20230405-add-dsc-support-v5-2-028c10850491@quicinc.com>
 <js3mcglahq53mcyxa6deltjlu4xpc2pnafwz2rbk3dl4ovws2o@5xw2wzvfaj2v>
 <f63435ca-933a-52be-d879-1d9cc9441107@quicinc.com>
 <f11fc3c1-4b19-3186-9c56-b1bac221cf83@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f11fc3c1-4b19-3186-9c56-b1bac221cf83@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-08 18:09:57, Abhinav Kumar wrote:
<snip>
> >> As discussed before we realized that this change is more-or-less a hack,
> >> since downstream calculates pclk quite differently - at least for
> >> command-mode panels.  Do you still intend to land this patch this way,
> >> or go the proper route by introducing the right math from the get-go?
> >> Or is the math at least correct for video-mode panels?
> > 
> > Sorry but can you please clarify what exactly is incorrect or different 
> > about this math when compared to downstream? And, if you think that this 
> > math is incorrect, what exactly has to be changed to make it the "right 
> > math"?
> > 
> 
> Agree with Jessica, just calling the math a hack without explaining why 
> you think it is so is not justified especially when a great detail of 
> explanation was given on the bug. Sorry but its a bit harsh on the 
> developers.

We discussed this in detail so I'm not quite sure why that suddenly
needs to be reiterated again?

- Marijn
