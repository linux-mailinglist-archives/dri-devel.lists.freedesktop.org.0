Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D996C91A4E9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 13:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEA010E5E6;
	Thu, 27 Jun 2024 11:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gj9HVeOl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A624010E5E6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 11:18:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 60956CE2E04;
 Thu, 27 Jun 2024 11:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A840C32786;
 Thu, 27 Jun 2024 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1719487095;
 bh=E0YEhlQqyrz9Rv1pwfdZuFu0LrVCBtcH1CdILfJjFqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gj9HVeOlcxMX32l8FkenVufef6x+zWBoAkzbWeZZjOmgBF7O2I+8EfuAygGJaPAfS
 SfLWvyMLVlBchCFIseZAEBqQ1KYe6V1vErIQKO4uKLYX96w7R6fjextaR2ZK6YTMy4
 suNUOD95jG5d9hJo/o/WSpFiDE0EIm3H/772bpRQ=
Date: Thu, 27 Jun 2024 13:18:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <2024062715-ultra-muppet-c899@gregkh>
References: <20240627104245.1651214-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627104245.1651214-1-quic_ekangupt@quicinc.com>
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

On Thu, Jun 27, 2024 at 04:12:44PM +0530, Ekansh Gupta wrote:
> Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> to be added for PD notifications and other missing features. Adding
> and maintaining new files from within fastrpc directory would be easy.
> 
> Example of feature that is being planned to be introduced in a new C
> file:
> https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
>   - Updated Kconfig.
> Changes in v3:
>   - Added newline in kconfig.
> 
>  MAINTAINERS                          |  2 +-
>  drivers/misc/Kconfig                 | 13 +------------
>  drivers/misc/Makefile                |  2 +-
>  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
>  drivers/misc/fastrpc/Makefile        |  2 ++
>  drivers/misc/{ => fastrpc}/fastrpc.c |  0
>  6 files changed, 21 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/misc/fastrpc/Kconfig
>  create mode 100644 drivers/misc/fastrpc/Makefile
>  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)

For now, no, sorry, not a new directory for just one .c file.

If you want to add more stuff, wonderful, then do this as the first
commit of the series when that actually happens.

sorry, but I'm not going to take this now.

greg k-h
