Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B227386E75E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 18:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CBE10E104;
	Fri,  1 Mar 2024 17:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oNfkltCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293BD10E104;
 Fri,  1 Mar 2024 17:34:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BCEF8CE2675;
 Fri,  1 Mar 2024 17:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B36C433F1;
 Fri,  1 Mar 2024 17:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709314495;
 bh=hiJmLSjYgLPzRYhdIqgBms40kwe1TTYlDeb6XDjkXH8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oNfkltCrGIcZDICm8gP9A0SD3vVdubgrx1kxgoGBbM6uQZRMPwj0/1KEt1+GXLCJM
 95ZSvcgYxqmib8pv6/UQK+9H1J2L1Qc4wYVd3kbeJIBBC0h+kO3D2GF1TfYOO7OIOj
 vrmR0kJonej3RrYRH4pxLNPx1L2Nv3TYTv3d9pRGCzD+rqlM72kmoyKSjYnWvlNxRD
 A8WEtC9zgtdmApp/BljY7Atrawk8favrPMdfJnuaoXC91s1eOBq1PtZAPmEngZR+T5
 sqM+lYI5CmT0RAPNrBYIPl/8V/OYoRVDhmR3jbyGMW5qC/kOKcaDpTsLoNU1fzSuWd
 35YxBF8dxnKkw==
Date: Fri, 1 Mar 2024 11:34:52 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: dp-controller:
 document X1E80100 compatible
Message-ID: <20240301173452.GA2438612-robh@kernel.org>
References: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
 <20240222-x1e80100-display-refactor-connector-v2-1-bd4197dfceab@linaro.org>
 <CAA8EJppOBHhaZpS_Z34fmFmGr4aRe0-k8w=5ScquNhCrnzRDgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppOBHhaZpS_Z34fmFmGr4aRe0-k8w=5ScquNhCrnzRDgw@mail.gmail.com>
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

On Sun, Feb 25, 2024 at 12:34:34AM +0200, Dmitry Baryshkov wrote:
> On Thu, 22 Feb 2024 at 17:55, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > Add the X1E80100 to the list of compatibles and document the is-edp
> > flag. The controllers are expected to operate in DP mode by default,
> > and this flag can be used to select eDP mode.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> Rob, Krzysztof, Connor, gracious ping for the review. It would be
> really nice to merge this patchset during the next cycle. It also
> unbreaks several other patches.

The only thing that speeds up my review is reviewing whatever is ahead 
of this patch in the queue[1].

Rob

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/
