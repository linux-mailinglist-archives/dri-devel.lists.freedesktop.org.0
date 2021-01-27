Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B43305D90
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 14:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B0C89C56;
	Wed, 27 Jan 2021 13:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE7C89C56
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 13:51:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 633032074D;
 Wed, 27 Jan 2021 13:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611755519;
 bh=JF5TlDZRR0Gah+FV8gwiJ/9IJZq8Lw6RRJVjyCiEUfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gmiuS7AnX4qO1a/NuuueqEdDLWjZXf3gUErpMddujZlMD1rJbZaoiJ7uUV42ygZZO
 /3dd3lBBeOou/Lx06YAsYbobqmegUKIDiG8uq3b7hI/bmB0yL50AA7FFMwrMqMtCC5
 yQhc1Dv9TACleyQPpOIB9f5BgqjGaUU4pmRdmLes=
Date: Wed, 27 Jan 2021 14:51:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Carlis <zhangxuezhi3@gmail.com>
Subject: Re: [PATCH v10] staging: fbtft: add tearing signal detect
Message-ID: <YBFv+12xfsoxacDb@kroah.com>
References: <1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com>
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 mh12gx2825@gmail.com, oliver.graute@kococonnector.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sbrivio@redhat.com, colin.king@canonical.com, zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 27, 2021 at 09:42:52PM +0800, Carlis wrote:
> From: zhangxuezhi <zhangxuezhi1@yulong.com>
> 
> For st7789v ic,when we need continuous full screen refresh, it is best to
> wait for the TE signal arrive to avoid screen tearing
> 
> Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>

Please slow down and wait at least a day between patch submissions,
there is no rush here.

And also, ALWAYS run scripts/checkpatch.pl on your submissions, so that
you don't have a maintainer asking you about basic problems, like are in
this current patch :(

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
