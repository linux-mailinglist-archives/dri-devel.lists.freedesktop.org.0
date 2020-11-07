Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 879732AA63D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Nov 2020 16:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633E06E3F4;
	Sat,  7 Nov 2020 15:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A8E6E3E5;
 Sat,  7 Nov 2020 15:29:43 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF0B0206DB;
 Sat,  7 Nov 2020 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604762983;
 bh=xnpkhtnQRUWkzeNgw/A6vZf09sbHLka5oSKxGkLpUO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cn8+tl/9Jkdg2oejKpe77JI3CuVzZ8iTQO9wyJr/nTaSh+DTbutjCf/EldQYGP7Ut
 cLTjSllROvEdNWrpUureJjuS30XRUTs2kYgXEVSu9tdI+7ZW0YMKuTLeS8z1JZXyMb
 Yqa1LKatSeOATaExgL/RgviU8BE9KgmJVcnA+s0o=
Date: Sat, 7 Nov 2020 16:30:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 0/2] drm/nouveau: Stable backport of DP clock fixes for
 v5.9
Message-ID: <20201107153027.GB90705@kroah.com>
References: <160459060724988@kroah.com>
 <20201106233016.2481179-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106233016.2481179-1-lyude@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 06:30:13PM -0500, Lyude Paul wrote:
> Just a backport of the two patches for v5.9 that you'll want to apply.
> The first one was Cc'd to stable, but I forgot to Cc the second one as
> well.
> 
> Lyude Paul (2):
>   drm/nouveau/kms/nv50-: Get rid of bogus nouveau_conn_mode_valid()
>   drm/nouveau/kms/nv50-: Fix clock checking algorithm in
>     nv50_dp_mode_valid()
> 
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 36 ++++++---------------
>  drivers/gpu/drm/nouveau/nouveau_dp.c        | 21 ++++++++----
>  2 files changed, 24 insertions(+), 33 deletions(-)

Thanks for these, now queued up.

Next time if you could include what the upstream git commmit ids they
are in Linus's tree, that would help, as I have to list them.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
