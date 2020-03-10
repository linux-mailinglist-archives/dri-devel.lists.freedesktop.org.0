Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96501180043
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 15:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEF56E30D;
	Tue, 10 Mar 2020 14:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387FA6E30D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 14:33:10 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8322D20637;
 Tue, 10 Mar 2020 14:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583850790;
 bh=MXHfn2QUOH61lBXKxaYHDJYxCIjyhOdb6HyxFRWTGHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sv976ddJj+D4EKiccE4MIvMeH/8PciewJAueIWmub+kXBTAbApd/SKczRznBv9xW4
 Qe9KSDY0ZFPQkdMcuDE2gT4E267HZAKsxkI4oeaJxBM/L9atCVvUXPtfhv2trBtBTI
 c0ILy/4GEwc9DUgjPbi69ZfxTBHxRwGtEbKh3Tyk=
Date: Tue, 10 Mar 2020 15:33:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH v2 00/17] drm: subsytem-wide debugfs functions refactor
Message-ID: <20200310143307.GA3376131@kroah.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 04:31:04PM +0300, Wambui Karuga wrote:
> This series includes work on various debugfs functions both in drm/core
> and across various drivers in the subsystem.
> Since commit 987d65d01356 (drm: debugfs: make drm_debugfs_create_files()
> never fail), drm_debugfs_create_files() does not fail and only returns
> zero. This series therefore removes the left over error handling and
> checks for its return value across drm drivers.
> 
> As a result of these changes, most drm_debugfs functions are converted
> to return void in this series. This also enables the
> drm_driver, debugfs_init() hook to be changed to return void. 
> 
> v2: individual driver patches have been converted to have debugfs
> functions return 0 instead of void to prevent breaking individual driver
> builds.
> The last patch then converts the .debugfs_hook() and its users across
> all drivers to return void.

This looks much better to me, nice job:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
