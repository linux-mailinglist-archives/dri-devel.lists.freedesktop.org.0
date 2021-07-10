Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456C53C333F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 08:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D93B6EADD;
	Sat, 10 Jul 2021 06:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ECB6EADD
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 06:37:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CAC961375;
 Sat, 10 Jul 2021 06:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1625899025;
 bh=gV2Pfj2NN055Q0X+lsNhoIQOi7ituo+LVpl15VX3Qrg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iEVZdslJuwgHl1Srn3duqBR3Jq8/GB/5xleLtRueB22Bu6QKo8kD1wKLtcP1DUuYb
 beLL3TiJyKW6LS+CMwlzKhA0XEKb/4ZbFUePsoutrpMHHu3qlGbHrpdcKRlphAGHAW
 UCFSE2sxxI4o6shXYxjYeAo7d4BFhuxnJ1nVUubM=
Date: Sat, 10 Jul 2021 08:37:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hridya Valsaraju <hridya@google.com>
Subject: Re: [PATCH] dma-buf: Delete the DMA-BUF attachment sysfs statistics
Message-ID: <YOlADy6gdrUDNltl@kroah.com>
References: <20210710051027.42828-1-hridya@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210710051027.42828-1-hridya@google.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, surenb@google.com, kernel-team@android.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 09, 2021 at 10:10:24PM -0700, Hridya Valsaraju wrote:
> The DMA-BUF attachment statistics form a subset of the DMA-BUF
> sysfs statistics that recently merged to the drm-misc tree.
> Since there has been a reported a performance regression due to the
> overhead of sysfs directory creation/teardown during
> dma_buf_attach()/dma_buf_detach(), this patch deletes the DMA-BUF
> attachment statistics from sysfs.
> 
> Fixes: bdb8d06dfefd (dmabuf: Add the capability to expose DMA-BUF stats
> in sysfs)
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
