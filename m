Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB73EB282
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 10:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6B16E56D;
	Fri, 13 Aug 2021 08:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37026E56D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 08:20:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29B2960FC3;
 Fri, 13 Aug 2021 08:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628842815;
 bh=R2t/HkTfw4iNuHnkpQLxoKAEyy4GosUZbPrQovzCfTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nyuqa5aQXSZ6GUZWcEcZv0Id4SVtTlXsNz9UtCd4ZlNnFf4KQEEgFX5crXQm/E1ya
 +6yBMTJAZZcoN9SYQjy7q4KOq1n2Mz93W7A1yOUmlYE4gr4tSFzYNDn819Ds5EjetO
 TZFVZBa2vnDIRfxw88FJFcMUTWRBQRzoTdvppxRM=
Date: Fri, 13 Aug 2021 10:20:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Graute <oliver.graute@kococonnector.com>
Cc: oliver.graute@gmail.com, Carlis <zhangxuezhi1@yulong.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] fbtft: fb_st7789v: added reset on init_display()
Message-ID: <YRYrPfEHrcvDL4va@kroah.com>
References: <20210813062511.14537-1-oliver.graute@kococonnector.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813062511.14537-1-oliver.graute@kococonnector.com>
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

On Fri, Aug 13, 2021 at 08:25:10AM +0200, Oliver Graute wrote:
> staging: fbtft: fb_st7789v: reset display before initialization

What is this line here, and why is this not your subject line instead?

> 
> In rare cases the display is flipped or mirrored. This was observed more
> often in a low temperature environment. A clean reset on init_display()
> should help to get registers in a sane state.
> 
> Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>

What commit does this fix?

thanks,

greg k-h
