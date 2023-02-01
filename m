Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A0068654F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 12:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F3F10E17F;
	Wed,  1 Feb 2023 11:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CB010E2C1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 11:21:54 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 09F92201BE;
 Wed,  1 Feb 2023 12:21:52 +0100 (CET)
Date: Wed, 1 Feb 2023 12:21:50 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kalyan Thota <quic_kalyant@quicinc.com>
Subject: Re: [v1 1/3] drm/msm/disp/dpu1: clear dspp reservations in rm release
Message-ID: <20230201112150.ukoz55duvag7dzkm@SoMainline.org>
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
 <1675092092-26412-2-git-send-email-quic_kalyant@quicinc.com>
 <20230201111031.dqdketybw3pqpywx@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201111031.dqdketybw3pqpywx@SoMainline.org>
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

On 2023-02-01 12:10:33, Marijn Suijten wrote:
> On 2023-01-30 07:21:30, Kalyan Thota wrote:
> > Clear dspp reservations from the global state during
> > rm release
> 
> DSPP, and a period at the end of a sentence.  Also noticing inconsistent
> linebreaks across these patches, stick to 72 chars.
> 
> > Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> Should this be considered a fix to be backported, or is it harmless?  If
> so:
> 
> Fixes: e47616df008b ("drm/msm/dpu: add support for color processing blocks in dpu driver")

Right, it should, Dmitry also requested this in v1.

- Marijn
