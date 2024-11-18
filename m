Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7C69D128C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9944510E4D7;
	Mon, 18 Nov 2024 13:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ALHrdlvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C0910E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 13:59:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EA66EA41C1B;
 Mon, 18 Nov 2024 13:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616B8C4CECC;
 Mon, 18 Nov 2024 13:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1731938360;
 bh=1hOX32bzljIUN/nbRPe/kkvdOtpNeSIZs7HWshfNYfc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ALHrdlvp+GKKKIx3lZ2w6q7k0bgfA0vAZd9LKVd46KYtJN/GfeYU3hVlmodz5tFiW
 2C/39WmPYS19Qw6HZNVN3OIVByPIWWOsuGVkWrI78aUeRepLhUU3Phm5UiBR4aSBxR
 C5c6X7BebqGt9b+b1PavWw2Sl7Enw4JhDp0vguCI=
Date: Mon, 18 Nov 2024 14:58:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 3/4] misc: fastrpc: Introduce fastrpc_shared.h header
Message-ID: <2024111832-sprinkled-boastful-8fba@gregkh>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-4-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118084046.3201290-4-quic_ekangupt@quicinc.com>
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

On Mon, Nov 18, 2024 at 02:10:45PM +0530, Ekansh Gupta wrote:
> Move fastrpc structures and MACRO definitions to a new header file.
> These definitions are consumed by other upcoming features like
> debugfs, PDR support etc.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc/fastrpc_main.c   | 136 +---------------------
>  drivers/misc/fastrpc/fastrpc_shared.h | 155 ++++++++++++++++++++++++++

Again, why not just "fastrpc.h"?  No need for the huge prefix here,
right?

thanks,

greg k-h
