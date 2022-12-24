Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016ED6558AC
	for <lists+dri-devel@lfdr.de>; Sat, 24 Dec 2022 07:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A2F10E0D5;
	Sat, 24 Dec 2022 06:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264A810E0D5
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Dec 2022 06:38:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15F166006F;
 Sat, 24 Dec 2022 06:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A653BC433D2;
 Sat, 24 Dec 2022 06:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1671863856;
 bh=/38IVuA7PEniyulc/5p3MH83Z0S0l/GkZGr7fxcOHlU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e/xs47NrvMxbZrOcspCL/f131I/YtyPzR+JHr+exRnFQOLDCy3RH30sVbJvJUQ/X5
 AUoKWGqQubnv5O4Nbjwoid1bx+c2taE7D7KNKgLFAKE9j7JtXN3cS4aKzXX4XvNxEb
 bOfWEIWXSLwgIA9fZLyZBh6mHnagkn1EMNXa36Us=
Date: Sat, 24 Dec 2022 07:37:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v3] usb: gadget: aspeed_udc: Add check for
 dma_alloc_coherent
Message-ID: <Y6aeLMAu+XCYTxt6@kroah.com>
References: <20221224025001.24503-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221224025001.24503-1-jiasheng@iscas.ac.cn>
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

On Sat, Dec 24, 2022 at 10:50:01AM +0800, Jiasheng Jiang wrote:
> Yes, it is the same as mine.
> As the previous patch had not been merged into the Linux kernel,
> my tool found the same error and report it.
> And both of us chose the most concise way to fix the error.
> That is why the patches are the same.

I have no context at all here, what does this refer to?

confused,

greg k-h
