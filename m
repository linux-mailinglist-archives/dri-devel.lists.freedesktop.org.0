Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A16662011
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 09:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4768810E291;
	Mon,  9 Jan 2023 08:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0DB10E290;
 Mon,  9 Jan 2023 08:34:22 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.225.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C25503EBD0;
 Mon,  9 Jan 2023 09:34:20 +0100 (CET)
Date: Mon, 9 Jan 2023 09:34:17 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: sort entries in the HW catalog
Message-ID: <20230109083417.5drdfllpm4ythy42@SoMainline.org>
References: <20230108211113.200846-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230108211113.200846-1-dmitry.baryshkov@linaro.org>
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

On 2023-01-08 23:11:13, Dmitry Baryshkov wrote:
> Different entries into the catalog were added quite randomly. Enforce
> the sorting order of some kind. It is not alphabetic to prevent the
> patch from growing uncontrollably.

Why not sort these chronologically based on DPU hardware revision in the
match table at the end of this file?  Regardless, this patch is going to
make it hard to properly rebase DPU additions; see for example patch 4/8
and 5/8 in my second round of DSC fixes.

At the same time we should find a solution to the wishy-washy reuse of
structs and defines, which may appear the same initially but become
mismatched as more features are added (see how I had to split out
multiple of these in the INTF TE enablement series).

> Thus SDM comes before SC and SM
> platforms and QCM is kept as the last one. There are no functional
> changes in this patch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Yes, I hate such mass-moves too. However the entries in this file are
> slowly becoming uncontrollable. Let's enforce some order now (while it's
> late already, but not _that_ late).

I agree that something should happen, contributing to this file is
unnecessarily tough.

- Marijn
