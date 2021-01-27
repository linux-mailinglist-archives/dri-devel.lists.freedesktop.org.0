Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50A4305DF4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 15:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1846E5CC;
	Wed, 27 Jan 2021 14:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91366E5CC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 14:13:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DEF33207B3;
 Wed, 27 Jan 2021 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611756788;
 bh=91+FckkF0XsQXE8G5xq3ONP86dhD26FJMlpOx+Kbuoo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W8+KGfUXGrGH4qYqQIY+nAVen4ZTYfKvnxOGcqhfoG913R+Gsx2EaPYD4gSiGHbVS
 xtLwgaMKy3EYdYI5fAnnB+fO4QG2DeNVFxoPEvxxAjmOROjfzQNVZb25FubocBNStR
 321EdMt8sT45bFDyXKL2xSyXmY1vCM+SIw8av3X0=
Date: Wed, 27 Jan 2021 15:13:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: carlis <zhangxuezhi3@gmail.com>
Subject: Re: [PATCH v10] staging: fbtft: add tearing signal detect
Message-ID: <YBF08Xf7qaZx3YZ1@kroah.com>
References: <1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com>
 <YBFv+12xfsoxacDb@kroah.com> <20210127220809.000026fb@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127220809.000026fb@gmail.com>
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

On Wed, Jan 27, 2021 at 10:08:09PM +0800, carlis wrote:
> On Wed, 27 Jan 2021 14:51:55 +0100
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Wed, Jan 27, 2021 at 09:42:52PM +0800, Carlis wrote:
> > > From: zhangxuezhi <zhangxuezhi1@yulong.com>
> > > 
> > > For st7789v ic,when we need continuous full screen refresh, it is
> > > best to wait for the TE signal arrive to avoid screen tearing
> > > 
> > > Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>  
> > 
> > Please slow down and wait at least a day between patch submissions,
> > there is no rush here.
> > 
> > And also, ALWAYS run scripts/checkpatch.pl on your submissions, so
> > that you don't have a maintainer asking you about basic problems,
> > like are in this current patch :(
> > 
> > thanks,
> > 
> > greg k-h
> 
> hi,
>   This is my first patch contribution to Linux, so some of the rules
> are not very clear .In addition, I can confirm that before sending
> patch, I check it with checkPatch.py every time.Thank you very much for
> your help

Please read Documentation/SubmittingPatches which has a link to the
checklist and other documentation you should read.

And I doubt you are running checkpatch on your submission, as there is
obvious coding style issues in it.  If so, please provide the output as
it must be broken :(

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
