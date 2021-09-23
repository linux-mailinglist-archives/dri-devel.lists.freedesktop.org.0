Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A66D6415C45
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 12:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C556E0C2;
	Thu, 23 Sep 2021 10:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183CD6E0C2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 10:49:50 +0000 (UTC)
Date: Thu, 23 Sep 2021 12:49:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
 s=mail; t=1632394189;
 bh=qjdeXlozuivPeR0eioe8PmC1RMurpCpfF51tRU3+QM8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q8pmoguZ5rt6w13+fKgEO/8PREU8+OdNS6URzNpfyT+Kup/dnjTmmsm7JbT+FiTFQ
 AO/poVTmHKqo7+aRLtgCJ+A4M20fnLVuN7Ze+iMvj6rRMVIwnJdjfkyyv6x03UJBHG
 c8A+TqBeqqzfFEoWKAnIU4gXkGv83K7gjvJ49HSc=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] backlight: propagate errors from get_brightness()
Message-ID: <4bb3051e-2550-43c3-afed-d4b00850126e@t-8ch.de>
References: <20210907124751.6404-1-linux@weissschuh.net>
 <YUxNczBccLQeQGA5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUxNczBccLQeQGA5@google.com>
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

On 2021-09-23T10:48+0100, Lee Jones wrote:
> On Tue, 07 Sep 2021, Thomas Weißschuh wrote:
> 
> > backlight.h documents "struct backlight_ops->get_brightness()" to return
> > a negative errno on failure.
> > So far these errors have not been handled in the backlight core.
> > This leads to negative values being exposed through sysfs although only
> > positive values are documented to be reported.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > 
> > v1: https://lore.kernel.org/dri-devel/20210906215525.15418-1-linux@weissschuh.net/
> > 
> > v1 -> v2:
> > * use dev_err() instead of dev_warn() (Daniel Thompson)
> > * Finish logging format string with newline (Daniel Thompson)
> > * Log errno via dedicated error pointer format (Daniel Thompson)
> > 
> >  drivers/video/backlight/backlight.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> Applied, thanks.

Hi Lee,

thanks!

Also I'm sorry about my nagging before.
I was not aware you were on vacation and saw you respond to other mails.

Thomas
