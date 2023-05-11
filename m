Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1446FEB87
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 08:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2421510E5A4;
	Thu, 11 May 2023 06:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1294 seconds by postgrey-1.36 at gabe;
 Thu, 11 May 2023 06:04:52 UTC
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk
 [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7190F10E5A2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UQgMCGljUJ7oMQ6mf0JD66p8AV+Pricx3j0/87/rFdI=; b=WFSwWicA7I6QjunjDTmUY/mBBw
 +OdqCiSVAaq7AwaAq4xZwY4gnB6pwGU8tQc4ONz5S15zuLHUMQbn7bCAh3yX9KB2tW33Fi5qb/eNS
 Ibs3/aYjdR4ROBC4C6Rcpqz7tTp98buzqxNITntt/3+CYEKoWUPKu1fqkOB1mC8XuReJAS68gGjkX
 SnsCLss8J9Y/ITZE3AKEDHYnQq5uWprxBpTvPQ/Uqqza8xGPleWXp7iK7hqmV9R01T8UVSQ5XW2JU
 69Cz2ghJ3IVIrfmd8Mmi5c3t55/GrzzZ2POKZ4HVXMJUOrderW05675mtR+tt6C9dnZIJSO7lzZG2
 /az9cJXQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pwz5E-001cjL-19; Thu, 11 May 2023 05:43:20 +0000
Date: Thu, 11 May 2023 06:43:20 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: ye.xingchen@zte.com.cn
Subject: Re: [PATCH] dma-buf/sync_file: Use fdget()
Message-ID: <20230511054320.GL3390869@ZenIV>
References: <202305051103396748797@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305051103396748797@zte.com.cn>
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
Cc: gustavo@padovan.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 11:03:39AM +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> convert the fget() use to fdget().

NAK.
