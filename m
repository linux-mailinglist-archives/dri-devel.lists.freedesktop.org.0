Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE31958A721
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 09:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE6AB409E;
	Fri,  5 Aug 2022 07:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 498 seconds by postgrey-1.36 at gabe;
 Thu, 04 Aug 2022 14:52:07 UTC
Received: from mail.crfreenet.org (varda.crfreenet.org [185.133.240.16])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0DC0B9A862
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 14:52:07 +0000 (UTC)
Received: from finarfin (slizka.chapadla.cz [93.99.228.74])
 by mail.crfreenet.org (Postfix) with ESMTP id 9C74B2C230E;
 Thu,  4 Aug 2022 16:43:47 +0200 (CEST)
Date: Thu, 4 Aug 2022 16:43:47 +0200
From: Ondrej Zajicek <santiago@crfreenet.org>
To: Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [PATCH 0/3] Fix bugs in *_set_par() caused by user input
Message-ID: <YuvbI8NEpzciTgfc@finarfin>
References: <20220804124125.3506755-1-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804124125.3506755-1-zheyuma97@gmail.com>
X-Operating-System: Debian GNU/Linux
X-Mailman-Approved-At: Fri, 05 Aug 2022 07:23:20 +0000
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
Cc: linux-fbdev@vger.kernel.org, adaplas@gmail.com, deller@gmx.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 04, 2022 at 08:41:22PM +0800, Zheyu Ma wrote:
> In the function *_set_par(), the value of 'screen_size' is
> calculated by the user input. If the user provides the improper value,
> the value of 'screen_size' may larger than 'info->screen_size', which
> may cause a bug in the memset_io().

Hi

I did not saw fbdev code in years, but should not this be already checked
by *_check_var() ?

arkfb_check_var():

	...
	/* Check whether have enough memory */
	mem = ((var->bits_per_pixel * var->xres_virtual) >> 3) * var->yres_virtual;
	if (mem > info->screen_size)
	...

-- 
Elen sila lumenn' omentielvo

Ondrej 'Santiago' Zajicek (email: santiago@crfreenet.org)
OpenPGP encrypted e-mails preferred (KeyID 0x11DEADC3, wwwkeys.pgp.net)
"To err is human -- to blame it on a computer is even more so."
