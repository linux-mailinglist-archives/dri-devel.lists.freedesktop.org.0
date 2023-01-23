Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9856777CD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 10:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A640B10E1E8;
	Mon, 23 Jan 2023 09:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E50A10E1E8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 09:51:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D193C60E00;
 Mon, 23 Jan 2023 09:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19F0C433EF;
 Mon, 23 Jan 2023 09:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1674467488;
 bh=I1TFqfaAYrE67AWuhwWFFkrdbPVOTogsIu0uGhqZTMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KUjTYbl3HSo04F7350eYhPO++nuP3ClQEi4/mYv1LTVeS1HcAahmC6f3QiKxhUSK0
 cLhlfWr9Tgcf8Fn8o9sDFM23S4fteDSwKEB7WdAOV2uJCMLLeH4TuKVCzlUPB6zwq+
 mmhUIZWAHUv1EUx8mlzjIDzcy0s4w25PHrPB6w+0=
Date: Mon, 23 Jan 2023 10:51:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Li Chen <lchen@ambarella.com>
Subject: Re: [PATCH 10/15] serial: ambarella: add support for Ambarella
 uart_port
Message-ID: <Y85YncUCtRyVnpvt@kroah.com>
References: <20230123073305.149940-1-lchen@ambarella.com>
 <20230123073305.149940-11-lchen@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123073305.149940-11-lchen@ambarella.com>
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
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 Li Chen <me@linux.beauty>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "moderated list:ARM/Ambarella SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 03:32:25PM +0800, Li Chen wrote:
> This driver add support for Ambarella's uart, which
> can be used for console and etc.
> 
> Signed-off-by: Li Chen <lchen@ambarella.com>
> Change-Id: Ie68af7ad2187e21853e58d52cd97fd7145303730
> ---
>  MAINTAINERS                         |    1 +
>  drivers/tty/serial/Kconfig          |   16 +
>  drivers/tty/serial/Makefile         |    1 +
>  drivers/tty/serial/ambarella_uart.c | 1581 +++++++++++++++++++++++++++
>  drivers/tty/serial/ambarella_uart.h |  120 ++

Why do you need a .h file for a single .c file?  They should all be in
one file please.

Also, no change-id, you know this...

thanks,

greg k-h
