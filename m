Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F3B733137
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AC710E611;
	Fri, 16 Jun 2023 12:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5B510E611
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:28:34 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 116EA40AF2;
 Fri, 16 Jun 2023 14:28:29 +0200 (CEST)
Date: Fri, 16 Jun 2023 14:28:27 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 03/22] drm/msm/dpu: remove unused INTF_NONE interfaces
Message-ID: <dcu6pyaw3cnjfup7iy3su2td6kywauvn2wlu2tw4evz6psvc6t@irbbsfcpctzb>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-4-dmitry.baryshkov@linaro.org>
 <6akejrsahbmrueanyhx5hdt5kipkm2fb4dylh4jzprfgzdbczk@x75wfsoza5ah>
 <f954a89f-a0f9-c30d-385d-6149dc360c1f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f954a89f-a0f9-c30d-385d-6149dc360c1f@linaro.org>
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

On 2023-06-16 12:49:29, Dmitry Baryshkov wrote:
> On 16/06/2023 01:26, Marijn Suijten wrote:
> > On 2023-06-13 03:09:42, Dmitry Baryshkov wrote:
> >> sm6115 and qcm2290 do not have INTF_0. Drop corresponding interface
> >> definitions.
> > 
> > As Abhinav said, add sm6375.
> > 
> > If it wasn't for sc8280xp using INTF_NONE for fake MST, we could have
> > dropped INTF_NONE and the special-cases in dpu_hw_interrupts.c and
> > dpu_hw_intf.c entirely!  Is that your plan?
> 
> I have not thought about it yet. Generally I think INTF_NONE might still 
> be useful to document interfaces that we do not want to support for some 
> reason (e.g. MST or 8974/8084 eDP interfaces).

Sounds good, then we only use it for existing but specialcase interfaces
rather than for bogus/empty entries in the catalog!

- Marijn

> > 
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> 
> -- 
> With best wishes
> Dmitry
> 
