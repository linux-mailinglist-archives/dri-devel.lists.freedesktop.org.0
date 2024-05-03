Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F384E8BA68A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 07:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBD710E6C2;
	Fri,  3 May 2024 05:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lTewYTs2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230F510E6C2;
 Fri,  3 May 2024 05:12:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 798D3CE1818;
 Fri,  3 May 2024 05:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243D6C116B1;
 Fri,  3 May 2024 05:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1714713154;
 bh=CqoZyhOSCmBy0sZ5Gg/UYcDTxCfEHRO6AHxKHOGnjPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lTewYTs2ryNk/sSYDnCRe/Ql77/NkLpuSu+2Ur4TLDXLvqGlanDBMa+SPV1o8dO8r
 GFd/liBdixcYIlR4cQ8tnVhD8pHMBsepIf9u0tvIIJxkFV3QonP06Wdv7D7AokNqNx
 of+GOzMAO3UyZ2WFxjGeKVHVbbJm4dcSFZi2xUlM=
Date: Fri, 3 May 2024 07:12:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arch@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 9c6ecb3cb6e20c4fd7997047213ba0efcf9ada1a
Message-ID: <2024050342-slashing-froth-bcf9@gregkh>
References: <202405030439.AH8NR0Mg-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405030439.AH8NR0Mg-lkp@intel.com>
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

Ok, I'm getting tired of seeing these for the USB portion of the tree,
so I went to look for:

On Fri, May 03, 2024 at 04:44:42AM +0800, kernel test robot wrote:
> |-- arc-randconfig-002-20240503
> |   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used

This warning (same for all arches), but can't seem to find it anywhere.

Any hints as to where it would be?

thanks,

greg k-h
