Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C7E768772
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 21:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA6610E124;
	Sun, 30 Jul 2023 19:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDB610E11A
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 19:29:36 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id AD5D1202E0;
 Sun, 30 Jul 2023 21:29:34 +0200 (CEST)
Date: Sun, 30 Jul 2023 21:29:33 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 4/7] drm/msm/dpu: enable INTF TE operations only when
 supported by HW
Message-ID: <ritdcd55hcp25pfh3esupm5cf4ucr6kclc7sogpmp4bxkhj36c@udukl2owvvyc>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-5-dmitry.baryshkov@linaro.org>
 <lck7thivac7ztu6e7b4hakjtpoobydcanjdffn6vvppmc4yzcc@46gcp2pwxedq>
 <726501f5-7c69-6321-38eb-1b57676cf389@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <726501f5-7c69-6321-38eb-1b57676cf389@linaro.org>
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

On 2023-07-30 03:22:46, Dmitry Baryshkov wrote:
> On 27/07/2023 23:12, Marijn Suijten wrote:
> > On 2023-07-27 19:21:01, Dmitry Baryshkov wrote:
> >> The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
> >> only INTF_1 and INTF_2 actually support tearing control. Rather than
> >> trying to fix the DPU_INTF_TE, check for the presense of the
> > 
> > I would more exactly expand "fix" to "Rather than specifying that
> > feature bit on DSI INTF_1 and INTF_2 exclusively..."
> > 
> >> corresponding interrupt line.
> > 
> > ... which the catalog will only provide on DPU >= 5.0.
> 
> I'm going to rephrase this in a slightly different way to follow the irq 
> presence -> major & type change.

Sure, looks good, including the validation (that doesn't really need to
be mentioned in the commit message anymore).

- Marijn
