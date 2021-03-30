Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C70534EF81
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 19:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344FE6E954;
	Tue, 30 Mar 2021 17:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4816E955
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 17:30:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F5D4619C7;
 Tue, 30 Mar 2021 17:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617125402;
 bh=C8O0alZVc/4m1eevRMOdvFYGpb/wNNuDuufNDrLUuQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YlhQsQQWUsLXlFqsj68qjAmIgwrUB402VoS+aB1erd03q1KOtJUCQb4U3Wqqgs3SB
 iTOrSWjppww4kGCLWZZI91Y2m/j+eP9OmPXhydxgZgfbLsrqJIkmQNtk8bP0v+jzSx
 TzeQjHeg5mqpcqD0e+KpcPYJMMteIb4Av6YuXlE+5P7dyrr1LCOjlf1f5O6Lgajas+
 zNgTDQXLJzHb/6M8m8Mo8XsHxB2fsNF6A4XX0rnAgxxGk8JSqW0GkayeK8I2df+7X1
 TZxQLOAh6IZUxUJ6H6x7ULZIO+4bNvxITYEnjczyVgn7ZP3pZjCMaZVOqwYTXT0P0y
 bhWPgaKY+z35Q==
Date: Tue, 30 Mar 2021 22:59:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH 14/30] Revert "s3c24xx-dma.c: Fix a typo"
Message-ID: <YGNgFuLWc91aGoQj@vkoul-mobl.Dlink>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
 <1d989f71fbebd15de633c187d88cb3be3a0f2723.1616971780.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d989f71fbebd15de633c187d88cb3be3a0f2723.1616971780.git.unixbhaskar@gmail.com>
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
Cc: dave.jiang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29-03-21, 05:23, Bhaskar Chowdhury wrote:
> s/transferred/transfered/
> 
> This reverts commit a2ddb8aea8106bd5552f8516ad7a8a26b9282a8f.

This is not upstream, why not squash in. Also would make sense to write
sensible changelog and not phrases and use the right subsystem
conventions!

Droped the series now


-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
