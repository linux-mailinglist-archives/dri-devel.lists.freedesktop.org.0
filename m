Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E336D686564
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 12:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA88510E3F1;
	Wed,  1 Feb 2023 11:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90C410E2C1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 11:26:34 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 13790200EA;
 Wed,  1 Feb 2023 12:26:33 +0100 (CET)
Date: Wed, 1 Feb 2023 12:26:31 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kalyan Thota <quic_kalyant@quicinc.com>
Subject: Re: [v1 2/3] drm/msm/disp/dpu1: add dspps into reservation if there
 is a ctm request
Message-ID: <20230201112631.mgwuboehrwdefqnd@SoMainline.org>
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
 <1675092092-26412-3-git-send-email-quic_kalyant@quicinc.com>
 <20230201111604.htgczy6yvdkywhvl@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201111604.htgczy6yvdkywhvl@SoMainline.org>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-01 12:16:05, Marijn Suijten wrote:
<snip>
> > +	if (dpu_kms->catalog->dspp &&
> > +	    crtc_state->ctm && (dpu_kms->catalog->dspp_count >= topology.num_lm))
> 
> Multiline-if-clause is typically indented with two tabs, not a half tab
> (4 spaces).

Hmm, Dmitry requested indent-to-opening-parenthesis in v1 instead; and
the majority of dpu1 uses the worst version of all: indent with a single
tab so that the contents line up with the code block below.  Dmitry,
I'll leave final say to you (and fix it up in my own DPU series
accordingly too).

- Marijn
