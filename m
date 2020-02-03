Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5AD1503CC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 11:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056E86EB9A;
	Mon,  3 Feb 2020 10:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A33B6EB9A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 10:03:59 +0000 (UTC)
Received: from localhost (unknown [104.132.45.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E9DF20661;
 Mon,  3 Feb 2020 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580724239;
 bh=HE3dTblfyQ8uQoBKjunFI7+IqlZYwXB7u32CZMMqjnY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ogCTfLavVHI0mI7mX1RfggFNTW2gvgHlxjXeapTqU1ybHzAlIeQ2kxmMGYq4cAC1n
 VukpmQY+ncKfzY6H1Ezz1KOFdqlplhnTb+RHzcQ5ETBT3t7h+KRbwalrlFBaAbCRJ+
 WVnHMfgtWO4AO0RQ3PiBUqC5/TZgS8yPHbHDHXeA=
Date: Mon, 3 Feb 2020 10:03:56 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: fbtft: 5 years in staging
Message-ID: <20200203100356.GB3056136@kroah.com>
References: <a6cef26c-0f4b-47f0-d249-71f53891526b@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6cef26c-0f4b-47f0-d249-71f53891526b@tronnes.org>
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
Cc: OSUOSL Drivers <devel@driverdev.osuosl.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 02, 2020 at 04:41:54PM +0100, Noralf Tr=F8nnes wrote:
> Hi,
> =

> Since I'm the original author of fbtft I thought I'd highlight a couple
> of issues that's probably not well known.
> =

> Right after fbtft was added, fbdev was closed for new drivers[1] and
> the fbdev maintainer wanted to remove fbtft as a consequence of that
> decision, but Greg KH said he'd keep fbtft drivers in staging
> "until a matching DRM driver is present in the tree"[2].

<snip>

Thanks for the great summary, much appreciated.

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
