Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805DB733BB7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 23:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7FF10E063;
	Fri, 16 Jun 2023 21:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880F510E063
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 21:58:29 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D23EA40EF8;
 Fri, 16 Jun 2023 23:58:27 +0200 (CEST)
Date: Fri, 16 Jun 2023 23:58:26 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN
 feature flag for DPU >= 5.0
Message-ID: <ldm6kswnucanjcxxwnrv7cgcma4datmg4eh7t5giyih2fm2ve7@s5wjam7unlhl>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
 <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
 <f4fb042c-1458-6077-3c49-8cc02638b27c@linaro.org>
 <ycgei43x4kfmjk7g7gbeglehtiiinfbqmrjbdzcy56frxbtd2z@yk2f5kgrkbrt>
 <e23de804-060d-3278-5045-1ed03f0de80d@quicinc.com>
 <c5cfc132-effb-8269-ac5d-ed8c988d1a16@quicinc.com>
 <08b6aaf4-6edd-4f41-5d98-11ffc27e766e@quicinc.com>
 <udz5ij7g74zgnnwqw2q65idzzmiszhnvfieerw7izikgvotnkp@5tboohkd4t6t>
 <72963004-cda9-c5e1-68f9-622cb70fff9b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72963004-cda9-c5e1-68f9-622cb70fff9b@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-16 14:13:22, Abhinav Kumar wrote:
<snip>
> > As I've asked many times before, we should inline these masks (not just
> > the macros) (disclaimer: haven't reviewed if Dmitry's series actually
> > does so!).
> > 
> 
> Yes it does inline it. I am halfway through that rework got stuck in one 
> of the patches.

Neat, I'm still going through it but there are some conflicts with other
reworks that make it harder to review and test in parallel.

> >>>>> Tested this on SM8350 which actually has DSI 2.5, and it is also
> >>>>> corrupted with this series so something else on this series might be
> >>>>> broken.
> >>>>>
> >>>
> >>> Missed this response. That seems strange.
> > 
> > No worries.  But don't forget to look at the comments on patch 2/3
> > either.  Some of it is a continuation of pclk scaling factor for DSC
> > which discussion seems to have ceased on.
> > 
> >>> This series was tested on SM8350 HDK with a command mode panel.
> >>>
> >>> We will fix the DPU-DSI handshake and post a v2 but your issue needs
> >>> investigation in parallel.
> >>>
> >>> So another bug to track that would be great.
> > 
> > Will see if I can set that up for you!
> > 
> 
> Now, it seems this is resolved so bug is not needed?

Indeed, as mentioned in another message.  Looking forward to v2.

- Marijn
