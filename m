Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 965DC7BE8DD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB6110E149;
	Mon,  9 Oct 2023 18:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D2410E149;
 Mon,  9 Oct 2023 18:09:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1CFF161248;
 Mon,  9 Oct 2023 18:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AD9C433C7;
 Mon,  9 Oct 2023 18:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1696874987;
 bh=55mBdPux7Faa+MTMfhzDfhcLUi40zyKZ0NpJ/3a3pcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o8H/ukR+KYxcZZzJWnnwdyKPt+JA+nb6tZkMCHtSBtn1jOzDg5vGkrfaX4Jf57lCD
 zlwvmPnfyJIlA6S0FhT7B+GC4D/QNTajBMCBXPOMvY9w/gCA7qNXP+saLnrbZZPMsW
 h4IT/msBBFYLiRTvKuBC77JlNLpKEquBREqOVt7E=
Date: Mon, 9 Oct 2023 20:09:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH AUTOSEL 5.10 13/22] drm/amdgpu: install stub fence into
 potential unused fence pointers
Message-ID: <2023100908-chaperone-squishier-4f10@gregkh>
References: <2023083119-phoney-ascend-d4ec@gregkh>
 <d32d6919-47cf-4ddc-955a-0759088220ae@gmail.com>
 <2023100750-unraveled-propeller-3697@gregkh>
 <0eb8750d-79c5-4508-ac36-7f91bc8cbaf9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0eb8750d-79c5-4508-ac36-7f91bc8cbaf9@gmail.com>
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
Cc: sashal@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Bryan Jennings <bryjen423@gmail.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, stable@vger.kernel.org, Lang.Yu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 09, 2023 at 02:46:40PM +0200, Christian König wrote:
> Am 07.10.23 um 11:50 schrieb Greg KH:
> > On Sun, Sep 10, 2023 at 03:43:01PM -0500, Bryan Jennings wrote:
> > > This is also causing log spam on 5.15.  It was included in 5.15.128 as
> > > commit 4921792e04f2125b5eadef9dbe9417a8354c7eff.  I encountered this and
> > > found https://gitlab.freedesktop.org/drm/amd/-/issues/2820 while researching
> > > the problem.
> > Confused, what should we do here?
> 
> If this patch was backported to even more older kernels then please revert
> that immediately!

It only went to 5.10 and 5.15 and has been reverted from both of them
now.

thanks,

greg k-h
