Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 642BB3C97C6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 06:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053056E526;
	Thu, 15 Jul 2021 04:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB9D6E526
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 04:52:14 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 686ca631-e528-11eb-9082-0050568c148b;
 Thu, 15 Jul 2021 04:52:07 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id C362D194B05;
 Thu, 15 Jul 2021 06:52:24 +0200 (CEST)
Date: Thu, 15 Jul 2021 06:52:09 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-5.14
Message-ID: <YO+++Tj94RRjVqwV@ravnborg.org>
References: <20210714220858.5553-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714220858.5553-1-alexander.deucher@amd.com>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On Wed, Jul 14, 2021 at 06:08:58PM -0400, Alex Deucher wrote:
> Hi Dave, Daniel,
> 
> Fixes for 5.14.  The big change here is unifying the SMU13 code.  This was
> new code added in 5.14 to support Yellow Carp, but we've since cleaned it
> up and removed a lot of duplication, so better to merge it now to facilitate
> any bug fixes in the future that need to go back to this kernel via stable.
> Only affects Yellow Carp which is new for 5.14 anyway so not much chance for
> regressions.  The rest is just standard bug fixes.

This pull seems not to include any fixes for the W=1 warnings that
has crept in again. It would be nice if the amdgpu could be warning free
again, this would maybe motivate the others to fix theirs too so we
could keep most/all of drivers/gpu/ free of W=1 warnings.

	Sam
