Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D10B9FACFF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 11:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CE610E30F;
	Mon, 23 Dec 2024 10:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gcVDgmau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8AF10E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 10:10:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C54505C4A1D;
 Mon, 23 Dec 2024 10:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA18EC4CED3;
 Mon, 23 Dec 2024 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1734948606;
 bh=P+bpxQJu2PrdwHTC860KzlnArPutkjpYA2HOnkfVLa0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gcVDgmaukLtfGSCVNDAcxZiwT01oqTDv1Ez6LVJhbTT/Ka9wMVPMQKoH70M+IDBYk
 9bOqI4ofjBeMnVFTXIdLInHacD4D5Wer5bHsb7j+yz9FTUdHA1XRQwJQDnophc0tHZ
 /opESnGfBvCfYpHIuepjJngq/mbHyxx7UD/urSAE=
Date: Mon, 23 Dec 2024 11:10:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Anandu Krishnan E <quic_anane@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, stable <stable@kernel.org>
Subject: Re: [PATCH v2 1/2] misc: fastrpc: Deregister device nodes properly
 in error scenarios
Message-ID: <2024122343-java-exposure-bf50@gregkh>
References: <20241223100101.29844-1-quic_anane@quicinc.com>
 <20241223100101.29844-2-quic_anane@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223100101.29844-2-quic_anane@quicinc.com>
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

On Mon, Dec 23, 2024 at 03:31:00PM +0530, Anandu Krishnan E wrote:
> During fastrpc_rpmsg_probe, if secure device node registration
> succeeds but non-secure device node registration fails, the secure
> device node deregister is not called during error cleanup. Add proper
> exit paths to ensure proper cleanup in case of error.
> 
> Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Shouldn't this be a stand-alone patch, not part of a series, if you wish
to have it included in 6.14-final?

thanks,

greg k-h
