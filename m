Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5366355A442
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 00:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED01610F281;
	Fri, 24 Jun 2022 22:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1478 seconds by postgrey-1.36 at gabe;
 Fri, 24 Jun 2022 22:16:12 UTC
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk
 [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6DD10F281
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 22:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RugUo34b7kCX3LS4yaSCG7V8DF6G5u7h9IVqRfflc0E=; b=Cegwfc+PtG7lEnEWfGVoHIRS8R
 0xyb2p3uwzzNEDJ0rv4JSmuKjKEzf2zj5jPmXKN6bSw47XLAwo1tZBzJWPo88d/QE92XagyU8HtVg
 ghw9ljzMy+wB+hkMifiocy/piN1OTPSowf+gRQXSmt1mMohRIlOBvGNGBS92At4yrYSYGhLNb0RMC
 zx3ous8TlqEPpnFSVm1/uQPXEGXg99uCwh+85islUFSHoS4gPY/HWTdc3wbsfU8EcgoqDvFp1h4e8
 qx7V/lpqds9t6bD8G65SkpaHoT2IAt8tw9SSo+N63aC0EeFvU0bAZoMj/ECy1O46h4MZLSCfZS6V9
 GTliDX1Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat
 Linux)) id 1o4rD5-0044yO-E5; Fri, 24 Jun 2022 21:51:27 +0000
Date: Fri, 24 Jun 2022 22:51:27 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 5/6] dma-buf: remove useless FMODE_LSEEK flag
Message-ID: <YrYx31qr52aXfZU9@ZenIV>
References: <20220624165631.2124632-1-Jason@zx2c4.com>
 <20220624165631.2124632-6-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624165631.2124632-6-Jason@zx2c4.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-fsdevel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 06:56:30PM +0200, Jason A. Donenfeld wrote:
> This is already on by default.

ITYM "anon_inode_getfile() has already set it, since dma_buf_fops has
non-NULL ->llseek".
