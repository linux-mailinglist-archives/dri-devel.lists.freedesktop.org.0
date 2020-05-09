Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 811971CC152
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 14:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580C96E061;
	Sat,  9 May 2020 12:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AB96E061
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 12:30:56 +0000 (UTC)
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7CF9218AC;
 Sat,  9 May 2020 12:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589027455;
 bh=4eDX4+vczY4BvjCe0KI5NzaClWwU2LcMQJLE9Xm9qx4=;
 h=Date:From:To:To:To:Cc:Cc:Subject:In-Reply-To:References:From;
 b=wzQXq8qQTsX588B+r245mPfmArgc1UAM7bjthP0bLiHHMMPTGsEYzJ0Xt+JXe/qpV
 MyARsOajVxaEHxPCieJR+l87lQV8Su8wnmwrjqywXdbgbN+YiUw1pXMCWgU/MWd9BN
 kg3rFSp8oaBP5dt9wU8KDzgW0kAtQ/XWCOU25HW4=
Date: Sat, 09 May 2020 12:30:55 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Charan Teja Reddy <charante@codeaurora.org>
To: sumit.semwal@linaro.org, ghackmann@google.com, fengc@google.com
Subject: Re: [PATCH v2] dma-buf: fix use-after-free in dmabuffs_dname
In-Reply-To: <1588920063-17624-1-git-send-email-charante@codeaurora.org>
References: <1588920063-17624-1-git-send-email-charante@codeaurora.org>
Message-Id: <20200509123055.B7CF9218AC@mail.kernel.org>
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls").

The bot has tested the following trees: v5.6.11, v5.4.39.

v5.6.11: Build OK!
v5.4.39: Failed to apply! Possible dependencies:
    15fd552d186c ("dma-buf: change DMA-buf locking convention v3")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
