Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7058B6864EC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 12:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A1D10E3ED;
	Wed,  1 Feb 2023 11:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C647C10E3ED
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 11:01:40 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6362C200EB;
 Wed,  1 Feb 2023 12:01:37 +0100 (CET)
Date: Wed, 1 Feb 2023 12:01:36 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/3] Reserve dspps based on user request
Message-ID: <20230201110136.xy5xifym624ehthb@SoMainline.org>
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
 <31661b18-8519-cadb-0c56-6a1fa34633b2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31661b18-8519-cadb-0c56-6a1fa34633b2@linaro.org>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, robdclark@chromium.org, freedreno@lists.freedesktop.org,
 quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-30 21:18:30, Dmitry Baryshkov wrote:
> On 30/01/2023 17:21, Kalyan Thota wrote:
> > This series will enable color features on sc7280 target which has primary panel as eDP
> > 
> > The series removes dspp allocation based on encoder type and allows the dspp reservation
> > based on user request via ctm.
> > 
> > The series will release/reserve the dpu resources when ever there is a topology change
> > to suit the new requirements.
> 
> Nit: the subject of the cover letter should include the version, if you 
> are including one into the individual patches Subject.

Indeed this makes it hard to tell the versions apart, and lore also
confusingly bundles both series in "loose matches on Subject: below".

Nit ^2: and individual patches should still have the PATCH moniker, i.e.
[PATCH v2 1/3].  git format-patch -v2 --cover-letter ... takes care of
/all this/ this for you.

And one more: as DSPP is an abbreviation, can we capitalize it?  So
DSPP / DSPPs in these titles?

> > 
> > Kalyan Thota (3):
> >    drm/msm/disp/dpu1: clear dspp reservations in rm release
> >    drm/msm/disp/dpu1: add dspps into reservation if there is a ctm
> >      request
> >    drm/msm/disp/dpu1: reserve the resources on topology change

We just discussed in the DSC series that the subsystem prefix is
drm/msm/dpu.

- Marijn

> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 54 +++++++++++++++++++++++------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  6 ++--
> >   5 files changed, 50 insertions(+), 17 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry
> 
