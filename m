Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BE1423DAA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 14:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A616ECD4;
	Wed,  6 Oct 2021 12:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285FB6E4B7;
 Wed,  6 Oct 2021 12:22:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F2F861076;
 Wed,  6 Oct 2021 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633522923;
 bh=GjdXB4CBUTuCHgg5ae5o/noPoLm1nYBZkINiNMaM/Lw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oe3odlBcQJ0FczNrgKkyoY6iP7j0ia588/hsTfirbe2FPWn7EcLFZjrt7emFkzQAS
 OOs1CPIrO1W+HiEyhDihKT1fxEbzrC2L7fiDEgUOEnXAcA0UL7bWhVzRA0AAWd1Ltn
 NYXRVKSnqwhc+ieE2kvbMs61jDc3Q4Cmyl7btdKDDX4Ks/o3VxHAbR4PrOG/VXEXU+
 wjyEHPOO4xbuQ0TgwLf/WA6KgEZJ9StY6PlZSj0A/C0CPVaCMQCwvtEKhoKUC2pnUA
 e7WZ0AJpbBa0yymINx64YOt18RitlcoTgGO7t7PRxyx4fcZApccMc/qTIxmdhS6ngQ
 XIlZf6h8k18xw==
Date: Wed, 6 Oct 2021 17:51:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: abhinavk@codeaurora.org
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 06/11] drm/msm/disp/dpu1: Add DSC support in
 hw_ctl
Message-ID: <YV2U511LhQ2Ea+bA@matsya>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-7-vkoul@kernel.org>
 <7317c6b71043267ce19b7826502c9735@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7317c6b71043267ce19b7826502c9735@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02-08-21, 17:00, abhinavk@codeaurora.org wrote:
> On 2021-07-14 23:51, Vinod Koul wrote:
> > Later gens of hardware have DSC bits moved to hw_ctl, so configure these
> > bits so that DSC would work there as well
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Please correct me if wrong but here you seem to be flushing all the DSC bits
> even the unused ones. This will end-up enabling DSC even when DSC is unused
> on
> the newer targets.
> If so, thats wrong.
> We need to implement bit-mask based approach to avoid this change and only
> enable
> those DSCs which are used.

Yes as Dimitry suggested I have done that by passing indices

-- 
~Vinod
