Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BFD3808CD
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 13:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455C76E1BC;
	Fri, 14 May 2021 11:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81866E1BC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 11:44:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDE1961457;
 Fri, 14 May 2021 11:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620992675;
 bh=2wK2s4uzHrcpMX4AVT39GF12wNkvgwnZVjSBdmwo7IU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NPJ8GSJ02jG+yTazbperYBkPoie6vURrfZzw6FI7xXUwq1lQjJltzQWUR2Eje/EkB
 F8pXOtwR5ILQGN8TZvdgyIDOlQ4QOUtT5b4SCac2uW5BuE32tMpKN00CxBxSN+rWa8
 bsNAILfkxOejvTAere1+7cFTZ7/W1PWyEYA5JBI0=
Date: Fri, 14 May 2021 13:44:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] video: ssd1307fb: Drop OF dependency
Message-ID: <YJ5ioEaP3UctfdVH@kroah.com>
References: <20210409164140.17337-1-andriy.shevchenko@linux.intel.com>
 <YHmiPMcgMqHCzaur@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHmiPMcgMqHCzaur@smile.fi.intel.com>
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
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 05:42:04PM +0300, Andy Shevchenko wrote:
> +Cc: Greg.
> 
> Greg, can you pick up this one?
> 
> The subsystem seems orphaned and I see your name in the git history for the
> recent submissions against that driver.

Now applied, thanks.

greg k-h
