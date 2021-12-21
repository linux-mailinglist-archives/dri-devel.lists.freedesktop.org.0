Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5A447BCD9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 10:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9A510F41A;
	Tue, 21 Dec 2021 09:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B1C10F41A;
 Tue, 21 Dec 2021 09:28:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4FC9161335;
 Tue, 21 Dec 2021 09:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379BDC36AE2;
 Tue, 21 Dec 2021 09:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640078892;
 bh=RZo6lge6X6obq2oOehXsW2SVPZlbm6/HXQ0bWrHOATs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y7eaQL/+s66cWXwvBPdxqQZO1SayEAHzCJAg5oo0c4fkrE1LQpIN6MOlNbeREp/hb
 a1qEEPazkXVmaMrn705X0V+/+01SmwN0Neidr1OtuqGMdlTM8GpvKNfvPyFB++tuLC
 SzS9yHDaBPe3Go8IrzPzbCf9RJ9fQ9ZCvtAKUmwI=
Date: Tue, 21 Dec 2021 10:28:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 01/34] component: Introduce struct aggregate_device
Message-ID: <YcGeKpy/oecKlKZg@kroah.com>
References: <20211202222732.2453851-1-swboyd@chromium.org>
 <20211202222732.2453851-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202222732.2453851-2-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 02, 2021 at 02:26:59PM -0800, Stephen Boyd wrote:
> Replace 'struct master' with 'struct aggregate_device' and then rename
> 'master' to 'adev' everywhere in the code. While we're here, put a
> struct device inside the aggregate device so that we can register it
> with a bus_type in the next patch.

Do not do a "while we are here" type change please.  Do the
rename/replace first, and then make the other change.

> The diff is large but that's because this is mostly a rename, where
> sometimes 'master' is replaced with 'adev' and other times it is
> replaced with 'parent' to indicate that the struct device that was being
> used is actually the parent of the aggregate device and driver.

The diff is 15 lines, how is that "large"?

thanks,

greg k-h
