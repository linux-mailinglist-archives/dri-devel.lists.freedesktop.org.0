Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132FEB07567
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 14:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A12310E25A;
	Wed, 16 Jul 2025 12:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LbqXpgvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F6F10E25A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 12:16:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1418F5C4327;
 Wed, 16 Jul 2025 12:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49799C4CEF0;
 Wed, 16 Jul 2025 12:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1752668213;
 bh=ZdKYnmi/StfE8TCjXd6hVVx/sxTYZ9HyoHzT57RRx6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LbqXpgvfDP50uDmSRo6uQ6HOiZ9ALPgkX4KsIfFV9g4zM8zKEZZbejN9huOhZJSQC
 5vN8B5XP1CTAmyhWYu6JVohO1zLXPwMvldH/6w5TWnfz2YmtYPQN413RBnEyU7gZ3W
 OMTxu6E319zVKGZVTrp6L9WoCsTmSO/GMFJnwIIk=
Date: Wed, 16 Jul 2025 14:16:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: Use of_reserved_mem_region_to_resource()
 for "memory-region"
Message-ID: <2025071645-unwieldy-chrome-8904@gregkh>
References: <20250703183455.2074215-1-robh@kernel.org>
 <acd5b3e3-5370-49a4-aad9-b1001aa0eb5a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acd5b3e3-5370-49a4-aad9-b1001aa0eb5a@kernel.org>
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

On Sat, Jul 12, 2025 at 07:27:42PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 7/3/25 7:34 PM, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() function to
> > handle "memory-region" properties.
> > 
> > The error handling is a bit different. "memory-region" is optional, so
> > failed lookup is not an error. But then an error in
> > of_reserved_mem_lookup() is treated as an error. However, that
> > distinction is not really important. Either the region is available
> > and usable or it is not. So now, it is just
> > of_reserved_mem_region_to_resource() which is checked for an error.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> 
> Reviewed-by: Srinivas Kandagatla <srini@kernel.org>
> 
> 
> Greg, there are no more patches for fastrpc for this cycle, can you
> please pick this up via char-misc tree?

Will do, thanks.

greg k-h
