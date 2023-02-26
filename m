Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7866A34BD
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 23:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FDA10E157;
	Sun, 26 Feb 2023 22:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4E410E159
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 22:34:08 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DC2B71F898;
 Sun, 26 Feb 2023 23:34:04 +0100 (CET)
Date: Sun, 26 Feb 2023 23:34:03 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v1 0/2] add V1.1 dsc_helper fucntion
Message-ID: <20230226223403.itm26leqkdlcm6a3@SoMainline.org>
References: <1677265287-7765-1-git-send-email-quic_khsieh@quicinc.com>
 <51ad9ff8-dbfa-7476-b208-f47e8d54fc20@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51ad9ff8-dbfa-7476-b208-f47e8d54fc20@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-24 11:18:51, Kuogee Hsieh wrote:
> Please ignore this series
> 
> I am going to re post it as RFC.

Thank you for this, in particular including me in the CC on the RFC
after being part of the review on your original series.  I'll catch up
to the current discussion and test the new series on a DSC 1.1
device/panel (Sony XZ3 based on SDM845) as soon as possible.

- Marijn

> kuogee
> 
> On 2/24/2023 11:01 AM, Kuogee Hsieh wrote:
> > Add V1.1 dsc function and have dsi use it instead of hardcode value
> >
> > Kuogee Hsieh (2):
> >    drm/msm/dpu: add dsc helper functions
> >    drm/msm/dsi: use new dpu_dsc_populate_dsc_config()
> >
> >   drivers/gpu/drm/msm/Makefile                   |   1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c | 209 +++++++++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h |  28 ++++
> >   drivers/gpu/drm/msm/dsi/dsi_host.c             |  78 ++-------
> >   drivers/gpu/drm/msm/msm_drv.h                  |   7 +
> >   5 files changed, 257 insertions(+), 66 deletions(-)
> >   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
> >   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
> >
