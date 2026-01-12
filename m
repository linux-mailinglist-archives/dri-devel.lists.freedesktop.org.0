Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A449D10D4B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 08:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A6C10E028;
	Mon, 12 Jan 2026 07:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DcJRX6HN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E73510E028
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:18:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2AD1360179;
 Mon, 12 Jan 2026 07:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5357EC19422;
 Mon, 12 Jan 2026 07:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1768202279;
 bh=crNwlZZI8994OGzvuLG1ICgkwtzVJ/uGO7UIX+u8Vxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DcJRX6HN5u5zK+fH4YQjOVtaPwoXTN0dcq+pA0fGEVv5n6e2tE7DTWZTAAj82gtH5
 s5dBWb/gH0siypl7eooNTgeD8T0Hxvbuy+JoJLvsSe87EVbDl5d5/HaSwje0CJ10yj
 8nDROgJw+JrQBmz6/Dpjg+Wj10fiBluIqqBaWVJY=
Date: Mon, 12 Jan 2026 08:17:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of
 info->dev
Message-ID: <2026011205-ideally-swoop-b04e@gregkh>
References: <20260112010740.186248-1-chintanlike@gmail.com>
 <CAHp75VeF+Sj=dxA4RZAvVddGSG3brUsy8kz7mvtst2YpqNm99w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeF+Sj=dxA4RZAvVddGSG3brUsy8kz7mvtst2YpqNm99w@mail.gmail.com>
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

On Mon, Jan 12, 2026 at 09:07:42AM +0200, Andy Shevchenko wrote:
> On Mon, Jan 12, 2026 at 3:07 AM Chintan Patel <chintanlike@gmail.com> wrote:
> > -       dev_dbg(info->dev, "%s(blank=%d)\n",
> > +       dev_dbg(dev, "%s(blank=%d)\n",
> >                 __func__, blank);
> 
> Since you are changing it anyway, make it one line.

Wait, why would dev_dbg() ever had __func__ added to it?  That's
automatically included in the output if the user wants it, please do not
duplicate it again.

thanks,

greg k-h
