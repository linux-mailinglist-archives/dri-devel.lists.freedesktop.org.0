Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426C53107E4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 10:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A1E6E185;
	Fri,  5 Feb 2021 09:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699FF6E185
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 09:32:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5013864F4A;
 Fri,  5 Feb 2021 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612517527;
 bh=jgQzZhuJanUyFvcQr/pf0vZbG+herQxEJyaMFM6t8H8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YoOAO7Nhlr9nQ6q72H/0ZYP45xoHs91spyqIrqoJx6yr8RMyyZkym3Sy8guJI5k2D
 aU30TY9u/yc5Gmn9LJBIq4ygboX1AWUiL4CvTeSjYCz9HSbJj7sONQa30xbVEjqPHS
 chcauDLHwRzWhIeICuBFxV+Zjn6J0Rv39D0rwShg=
Date: Fri, 5 Feb 2021 10:32:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mayank Suman <mayanksuman@live.com>
Subject: Re: [PATCH] staging: fbtft replaced udelay with usleep_range
Message-ID: <YB0QlMk4Gae1IGjd@kroah.com>
References: <PS1PR04MB29341C7117657B1F312444FBD6B29@PS1PR04MB2934.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PS1PR04MB29341C7117657B1F312444FBD6B29@PS1PR04MB2934.apcprd04.prod.outlook.com>
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
Cc: devel@driverdev.osuosl.org, sfr@canb.auug.org.au,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 02:41:13PM +0530, Mayank Suman wrote:
> According to Documentation/timers/timers-howto.rst, usleep_range is
> preffered over udelay for >=10us delay.
> 
> Signed-off-by: Mayank Suman <mayanksuman@live.com>

ALWAYS test build your patches before sending them out to the world for
review.  You don't want to make maintainers grumpy by breaking the tree
with changes that can not compile, right?  :)

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
