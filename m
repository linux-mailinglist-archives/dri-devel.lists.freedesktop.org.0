Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AA773BF46
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 22:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C85210E315;
	Fri, 23 Jun 2023 20:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF7B10E69E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 20:14:48 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 01A583EBA4;
 Fri, 23 Jun 2023 22:14:45 +0200 (CEST)
Date: Fri, 23 Jun 2023 22:14:44 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dsi: Enable DATABUS_WIDEN for
 DSI command mode
Message-ID: <daqhyz4rtgdxthsezmgk6t2egbdsvzsdy3cihrqrhyveoqbizi@etq2tafkucg2>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-3-c7069f2efca1@quicinc.com>
 <ky7sgsaohak2pcdf6pbhedfyrwk4ea7y3ekfqlw7rn6cpk4rhe@rjuhb23n37oz>
 <cf968ab4-e4c4-dcad-f7d1-4edff6f08147@quicinc.com>
 <xrqiat4otnfwtss6zwubh77qx3frdyi77flna2xljzycvr6r2v@riimvmhoondt>
 <654ccc4c-40c2-bef6-9f47-847216e16cb0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <654ccc4c-40c2-bef6-9f47-847216e16cb0@quicinc.com>
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
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-23 10:29:51, Abhinav Kumar wrote:
<snip>
> The concept is quite simple
> 
> one pixel per clock for uncompresssed without widebubus
> 
> 2 pixels per clock for uncompressed with widebus (only enabled for DP 
> not DSI)
> 
> 3 bytes worth of data for compressed without widebus
> 
> 6 bytes worth of data for compressed with widebus
> 
> When compression happens, we cannot quantify with pixels as the boundary 
> is not defined with respect to bytes.
> 
> You brought up uncompressed in your below comment so I assumed your 
> question of /2 was about uncompressed too.

No clue where things are going wrong, but you either avoid or
misunderstand the question.

(Talking exclusively about compressed data here!)

pclk is determined based on the number of bytes.

When widebus is enabled, we transfer twice as many bytes per pclk cycle.

Can pclk be reduced by a factor two, as that should still be enough to
transfer the same amount of bytes when widebus is enabled?

> >> We tried our best to respond and explain to all your queries both on the
> >> bug and the patch but i guess it just kept coming :)
> > 
> > Then send less patches!  As long as there is activity on the mailing
> > list there'll always be questions going back and forth, and I don't
> > think that's unreasonable.
> > 
> > Unless you want to push patches into mainline without questioning.
> > 
> 
> the comments were bordering the line of becoming irrelevant to the 
> patches like discussing video mode on a command mode patch when we had 
> explained many many times that we did not validate them.

You(r team) came up with irrelevant video-mode checks in these patches,
and you keep bringing up topics that I did not mention (such as
suddently talking about uncompressed formats above).  Stop pretending
there's any nefarious intent here unless you intend to push external
contributors away.

> I dont want to add more comments to this. Lets stop discussing this and 
> focus more on this patch.

Perhaps if you answer the question?

- Marijn
