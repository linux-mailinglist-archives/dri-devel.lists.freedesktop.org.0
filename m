Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CF89D1287
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303D510E335;
	Mon, 18 Nov 2024 13:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Lu2hxGnr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6056810E4EA
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 13:58:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8DA1A5C57FE;
 Mon, 18 Nov 2024 13:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEDDC4CECC;
 Mon, 18 Nov 2024 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1731938322;
 bh=Ln772x+8XbbWv8tq9JOMbr/rUEqekRWvei2su2sXB6U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lu2hxGnr1E+QPhP+nctrw6peXRjd8Tfe/PR+8nTVEpm347kARkhncxB7p6eVVyEg1
 eE6/xVj+PkoG6DEo+2pcYwkd9zecglrJzIoRUMZTqUQf9DukNkofNwUVTNKVXfon1t
 GS4urqcp/U1VK9s8tcmgrcsv/84qDqaW3ki46Am0=
Date: Mon, 18 Nov 2024 14:58:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 2/4] misc: fastrpc: Rename fastrpc.c to fastrpc_main.c
Message-ID: <2024111841-egotistic-unranked-ad4a@gregkh>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-3-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118084046.3201290-3-quic_ekangupt@quicinc.com>
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

On Mon, Nov 18, 2024 at 02:10:44PM +0530, Ekansh Gupta wrote:
> Rename the main fastrpc source file to accomodate new files to be
> compiled in the same kernel object.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc/Makefile                      | 1 +
>  drivers/misc/fastrpc/{fastrpc.c => fastrpc_main.c} | 0
>  2 files changed, 1 insertion(+)
>  rename drivers/misc/fastrpc/{fastrpc.c => fastrpc_main.c} (100%)
> 
> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> index 77fd2b763b6b..020d30789a80 100644
> --- a/drivers/misc/fastrpc/Makefile
> +++ b/drivers/misc/fastrpc/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
> +fastrpc-objs	:= fastrpc_main.o
> \ No newline at end of file
> diff --git a/drivers/misc/fastrpc/fastrpc.c b/drivers/misc/fastrpc/fastrpc_main.c
> similarity index 100%
> rename from drivers/misc/fastrpc/fastrpc.c
> rename to drivers/misc/fastrpc/fastrpc_main.c

Why not just "main.c"?  You are in your own subdir, no need for the
fastrpc_* prefix anymore, right?

thanks,

greg "naming is hard" k-h
