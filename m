Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BFD26BD2D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 08:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06566E2E5;
	Wed, 16 Sep 2020 06:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7A56E2E5;
 Wed, 16 Sep 2020 06:32:26 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F7B0206A5;
 Wed, 16 Sep 2020 06:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600237945;
 bh=wRtARHe2LKkE2nHSoQVtqIGXlzPYT4T/Rf9r1//fVC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KNuL53mmpCgivYk8/Ekcnpr4cCgcJhha4/zMX2JhQwHAI9bPQ+9b2Xc2HXSW31eVE
 2nlIErWqRfPzvRVEzA8RRoXQFMvD5dLPGYTE5vPOs6QzCWIgWVljFaQLmm1SmdYDBg
 R/FXWzWVtRrUgZ1C0Gj93HDZHsysIbmqJoAEW5fo=
Date: Wed, 16 Sep 2020 08:33:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] Revert "drm/radeon: handle PCIe root ports with
 addressing limitations"
Message-ID: <20200916063300.GJ142621@kroah.com>
References: <20200915184607.84435-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915184607.84435-1-alexander.deucher@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 02:46:07PM -0400, Alex Deucher wrote:
> This change breaks tons of systems.

Very vague :(

This commit has also been merged for over a year, why the sudden
problem now?

> This reverts commit 33b3ad3788aba846fc8b9a065fe2685a0b64f713.

You mean "33b3ad3788ab ("drm/radeon: handle PCIe root ports with
addressing limitations")"?

That's the proper way to reference commits in changelogs please.  It's
even documented that way...

> 
> Bug: https://bugzilla.kernel.org/show_bug.cgi?id=206973
> Bug: https://bugzilla.kernel.org/show_bug.cgi?id=206697
> Bug: https://bugzilla.kernel.org/show_bug.cgi?id=207763
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1140
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1287
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: stable@vger.kernel.org
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: christian.koenig@amd.com

Fixes: 33b3ad3788ab ("drm/radeon: handle PCIe root ports with addressing limitations")

as well?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
