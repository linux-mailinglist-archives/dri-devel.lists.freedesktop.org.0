Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AC9AB193D
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 17:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AEF10EA8B;
	Fri,  9 May 2025 15:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="srAOc6HL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024C410EA7D;
 Fri,  9 May 2025 15:50:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 848E7629E1;
 Fri,  9 May 2025 15:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060D7C4CEE4;
 Fri,  9 May 2025 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746805797;
 bh=f3uau16VPtaZdA3scq0IH4AZktliB26KN3ZGkhgmX7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=srAOc6HLhwtsApzFbOF2GhhwMQs2hcjYGetDCxlMeaRcxENt+3VTrhMat/8ljxH8j
 gNo05C4zfp6ezLHZf7oBcM4su2l9YwdvOVl/npmJObAF16vIR54eI0Mavsyl+H6hYD
 cwPmcigCulY5z/U6Rb+c+2/bllH0Aw+A86wgwAdzRqTGZjZT+n8sgUN957DpMZHl39
 l0vFIA1yq6dh7vT+BOwyQsr0mGksRcWWwpsKQFbJcd7UZ30pDuQ7qWRknIMZJlJcXs
 IZOcyoNgwlgtrJDWFLeteCxki+/BgLm5VoxWC2D6rIGHcUwBgvn9tszqERG0khS3Pm
 2Md4hKwe6ajhQ==
Date: Fri, 9 May 2025 10:49:55 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: hdmi: Fix constraints on
 additional 'port' properties
Message-ID: <20250509154955.GA3546604-robh@kernel.org>
References: <20250507215912.2748964-1-robh@kernel.org>
 <fvrvrcqilnhma774kkojytlgwglsvgaxgukm2fc3gennaii4jz@dufjv3obqc7b>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fvrvrcqilnhma774kkojytlgwglsvgaxgukm2fc3gennaii4jz@dufjv3obqc7b>
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

On Thu, May 08, 2025 at 07:03:17AM +0300, Dmitry Baryshkov wrote:
> On Wed, May 07, 2025 at 04:59:12PM -0500, Rob Herring (Arm) wrote:
> > The MSM HDMI port nodes are missing any restrictions on additional
> > properties. The $ref should be to "/properties/port" rather than
> > "/$defs/port-base" as there are not additional properties in the nodes
> > to define.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I've verified, it applies on top of msm-next and produces no errors. I
> don't see a meaningful error in the bot's message (Rob, is there a
> chance to fix the bot?).

The problem was I broke dtschema on python 3.11 and earlier. It's now 
fixed.

Rob
