Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C1EA5DD16
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 13:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BACA10E700;
	Wed, 12 Mar 2025 12:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jwrz0mPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C593110E700
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 12:52:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CA715A4714C;
 Wed, 12 Mar 2025 12:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77AAC4CEE3;
 Wed, 12 Mar 2025 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741783945;
 bh=QaTNbFgJ262CA817FyLcBE3QKWWHliMzcePUpnpEzbQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jwrz0mPbD5Dlkk6Vpem8hxU/UhiShqlfxPo2YYqkGFkOaxjuuYtPvBtjkJBChgDy1
 PvL8VmK9pChvuLMDQ1dbVvUEEvvDrDkubbIoT6NyRAqoBNUI6W7asWuyJRhuB8uv0k
 L5lqle8NJtjJHWC9XaCXuyvxhdDOwf23Ghc8LtTbK9EUrVV+wIeonpNyAATQ4+jBpb
 gN9bct4HjLFwt5SB/J0aPuGdTJrSHk7SEMl+0JsiTRff+QMkE4rjoMdgRbT2+xpDeg
 TN9J36NP0zMXh1ouIfyfP8OM/ejt2nW/j+BlBB9MyNnHVCV/XpnzPvfQX667UDaBrN
 q1As4JZgVZRkw==
Date: Wed, 12 Mar 2025 14:52:17 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Harikrishna Shenoy <a0512644@ti.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Harikrishna Shenoy <h-shenoy@ti.com>,
 andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, jani.nikula@intel.com,
 j-choudhary@ti.com, 
 sui.jingfeng@linux.dev, viro@zeniv.linux.org.uk, r-ravikumar@ti.com, 
 sjakhade@cadence.com, yamonkar@cadence.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: Add no-hpd property
Message-ID: <vfg6hlkzmqahbswgyctzuuzcdm2aend6wmo3uci4qs74jasjtc@3hlox276hazj>
References: <20250205115025.3133487-1-h-shenoy@ti.com>
 <20250205115025.3133487-2-h-shenoy@ti.com>
 <efd89cf8-2f83-44fd-8bdf-aa348d4d9659@kernel.org>
 <h24gpx6cxm4s6gzcunjnswubtvqask5dewi3udulmntsuieklm@w3pw4ig3t7gm>
 <de0cb22d-d251-4b0b-8fc7-e8b5a891a527@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de0cb22d-d251-4b0b-8fc7-e8b5a891a527@ti.com>
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

On Wed, Mar 12, 2025 at 11:56:41AM +0530, Harikrishna Shenoy wrote:
> 
> 
> On 05/02/25 19:03, Dmitry Baryshkov wrote:
> > On Wed, Feb 05, 2025 at 12:52:52PM +0100, Krzysztof Kozlowski wrote:
> > > On 05/02/2025 12:50, Harikrishna Shenoy wrote:
> > > > From: Rahul T R <r-ravikumar@ti.com>
> > > > 
> > > > The mhdp bridge can work without its HPD pin hooked up to the connector,
> > > > but the current bridge driver throws an error when hpd line is not
> > > > connected to the connector. For such cases, we need an indication for
> > > > no-hpd, using which we can bypass the hpd detection and instead use the
> > > > auxiliary channels connected to the DP connector to confirm the
> > > > connection.
> > > > So add no-hpd property to the bindings, to disable hpd when not
> > > > connected or unusable due to DP0-HPD not connected to correct HPD
> > > > pin on SOC like in case of J721S2.
> > > > 
> > > > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> > > 
> > > Why are you sending over and over the same? You already got feedback.
> > > Then you send v2. You got the same feedback.
> > > 
> > > Now you send v3?
> > > 
> > > So the same feedback, but this time: NAK
> > 
> > Krzysztof's email forced me to take a look at the actual boards that you
> > are trying to enable. I couldn't stop by notice that the HPD signal
> > _is_ connected to a GPIO pin. Please stop hacking the bridge driver and
> > use the tools that are already provided to you: add the HPD pin to the
> > dp-controller device node. And then fix any possible issues coming from
> > the bridge driver not being able to handle HPD signals being delivered
> > by the DRM framework via the .hpd_notify() callback.
> > 
> > TL;DR: also a NAK from my side, add HPD gpio to dp-controller.
> > 
> We tried implementing a interrupt based HPD functionality as HPD signal is
> connected to GPIO0_18 pin, we were able to get interrupt based HPD working
> however to route this signal to SoC we are loosing audio capability due to
> MUX conflict. Due to board level limitations to
> route the signal to SoC, we will not be able to support interrupt
> based HPD and polling seems a possible way without loosing on audio
> capability.

Still NAK for the no-hpd property. HPD pin is a requirement for
DisplayPort to work, as it is used e.g. for the 'attention' IRQs being
sent by the DP sink. I'm not sure what kind of idea you HW engineers had
in mind.

> Link to schematics zip:
> https://www.ti.com/tool/J721S2XSOMXEVM#design-files
> File:sprr439b/PROC118E4_RP/PROC118E4(001)_SCH.pdf, Page 17, MUX1

-- 
With best wishes
Dmitry
