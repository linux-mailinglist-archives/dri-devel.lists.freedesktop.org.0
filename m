Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87F487ABAA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 17:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75C710EBC1;
	Wed, 13 Mar 2024 16:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DkRIXAEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A65110EBC1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 16:45:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39FC71C0008;
 Wed, 13 Mar 2024 16:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710348334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuQ0UqQl11m0NvvFOq43PqxRfN+fKrgvj7VWFDw8fu8=;
 b=DkRIXAEyUDiUQjQZfqTt26mQA8FYL6PzLpC4AgCnEmDFvlAqW+OPoXDI9PhHHoV0PP5oFl
 cuho564tPB50t6qdDQm97ywWKsVAJVvw/ytOG2N+sNf3MP91DMwN/JxYfr+CTmglUzvByl
 bRU5Y9hNmN5ZsaFgWRG/8wXjVQ53HzvzawOPfKWiH4vX9q5tSGAfm1LSH+pLErftptCpBw
 TXfT0mj5/I9SL09ifeBRTSB5vywWBXDG9isFgnbZQ0UAuvRt9wpmzztTVjgajt98o6gW8I
 ieNOllXoFMT4e8IhbIPcQMMLqnYvgS8MR0tjZT3rVTzP8OoIRcys2hRN1ECokA==
Date: Wed, 13 Mar 2024 17:45:31 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>, Alexey
 Gladkov <legion@kernel.org>, Jiry Slaby <jirislaby@kernel.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbcon: Increase maximum font width x height to 64 x 64
Message-ID: <20240313174531.2579df0f@booty>
In-Reply-To: <20240312213902.3zvqaghlopjusv6m@begin>
References: <20240312213902.3zvqaghlopjusv6m@begin>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Samuel,

On Tue, 12 Mar 2024 22:39:02 +0100
Samuel Thibault <samuel.thibault@ens-lyon.org> wrote:

> This remains relatively simple by just enlarging integers.
> 
> It wouldn't be that simple to get to the console's 64x128 maximum, as it would
> require 128b integers.
> 
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> 
> Index: linux-6.4/drivers/video/fbdev/core/fbcon.c
> ===================================================================

This patch is clearly not formatted according to the standard format
and it does not apply with 'git am'.

Using 'git format-patch' and 'git send-email' is *very* recommended as
it will take care of all the formatting for you. Maintainers and
anybody interested in your patch will be able to apply it easily.

All the info you need are at
https://docs.kernel.org/process/submitting-patches.html

> --- linux-6.4.orig/drivers/video/fbdev/core/fbcon.c
> +++ linux-6.4/drivers/video/fbdev/core/fbcon.c

Apparently you are not using git to track your changes, so I recommend
using it to have all the git utilities available.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
