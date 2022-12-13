Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D99064B765
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 15:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC6B10E31E;
	Tue, 13 Dec 2022 14:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973BC10E31E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 14:31:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61E5A6155B;
 Tue, 13 Dec 2022 14:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FC1C433D2;
 Tue, 13 Dec 2022 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1670941908;
 bh=BP2D20qqRsIgeqfE7Stzv2DTidQHJtwB4teSCmQKVj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jlmq5QByNg1QkkSq1g5C/mXAcKM4f6kMEiusL6jQY3OvCgdwnRbntw2b+Rl6mLtl0
 iZo1H/SzhFO1b4iYIDXzsVtWcp/stnRzk8YOTP9FGJm8+0cN3iu5IVPVjnj3wVZUjp
 vs1dU1UTxlp+eGO4d/UtDwpX0kA7RV7jDZnJKBTg=
Date: Tue, 13 Dec 2022 15:31:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: Add check for dma_alloc_coherent
Message-ID: <Y5iM0LG2V5zN2D9u@kroah.com>
References: <20221213121520.18088-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221213121520.18088-1-jiasheng@iscas.ac.cn>
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, neal_liu@aspeedtech.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, joel@jms.id.au, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 13, 2022 at 08:15:20PM +0800, Jiasheng Jiang wrote:
> Thanks, I found my mistake and I will submit a v2.
> 
> > And how did you find this potential problem?  What tool did you use and
> > why did you not follow the documentation for properly describing the
> > tool?
> 
> I used a tool I wrote myself to find it, which is unpublished.
> Therefore, I think it is okay to submit patches without description of the
> tools.

Nope!  Please read:
	Documentation/process/researcher-guidelines.rst
for what you must do.

thanks,

greg k-h
