Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553BD849C6E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 14:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FADE112524;
	Mon,  5 Feb 2024 13:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KfrJ7eII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995FB112522;
 Mon,  5 Feb 2024 13:58:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 96C29CE0EA6;
 Mon,  5 Feb 2024 13:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E970C433C7;
 Mon,  5 Feb 2024 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707141522;
 bh=Ewb/CNOvhV+n1Q9YjZwKRUlgQ0b1oSXCOkWG3nOyU1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KfrJ7eIIIx/PnseSPnumHzQzAVUYc58ZqgJsvoS475OxAxw+Hdbo676AtILvuVFmb
 RP+HkBnQv5SV917ESgmVdU6CbF1cwFMuTDirhK603MzCBgtq185tdZbe+/xnE9v061
 ORb/mSMRJSiADP6UzBmXYM6J3spOxvj17qTzP+201tVURMuouzNEPtRWAdOJ90OPHA
 YfQ0qTDcvZy5J7BJ/+G9ASZ52GnpuYNwf7dfo7Sk3oTxWtGRdsuMig9eaLCl+oKJF/
 0elz1lxD7jGDYu79+7qq+OEdkUQHEXp8qbST+654jxWyNt+sXla76DbHEubCFsvQiP
 JphKbifwN+8XQ==
Date: Mon, 5 Feb 2024 13:58:39 +0000
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: msm: sm8650-mdss: Add missing
 explicit "additionalProperties"
Message-ID: <20240205135839.GA3267346-robh@kernel.org>
References: <20240202222338.1652333-1-robh@kernel.org>
 <CAA8EJpooe=RsZSD_mRKH2S8NUxAEqVw_AcMyn68_AWwhovPFsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpooe=RsZSD_mRKH2S8NUxAEqVw_AcMyn68_AWwhovPFsg@mail.gmail.com>
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

On Sat, Feb 03, 2024 at 03:55:54AM +0100, Dmitry Baryshkov wrote:
> On Fri, 2 Feb 2024 at 23:23, Rob Herring <robh@kernel.org> wrote:
> >
> > In order to check schemas for missing additionalProperties or
> > unevaluatedProperties, cases allowing extra properties must be explicit.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Rob, if you need it for some rework, please feel free to pick it into
> your tree, otherwise I'll pick it for msm-next in the next few days.

msm-next is fine.

Rob
