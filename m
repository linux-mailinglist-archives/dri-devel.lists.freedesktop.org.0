Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB096FEB88
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 08:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D82510E5A1;
	Thu, 11 May 2023 06:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk
 [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B3610E5A2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NwSO9TDmqyQQo7gy+ZlsPYYNJY8eYNENQuHNztbBKig=; b=JPK9vySYgVaWwc5xUZZvipUD8x
 9CWFVkKKnzGEqNtoM72RsvC4mmPTPIACGFS2IxhfZKBB/jjjSNaoZZOFoA0W+S195RPJ1R6xdIfRo
 n5Xhd8y/vge3BqazFtU9WThKYbD68jMeekV9w+Zm0mACq2VW73fqxvR66Kzl0gl4Aig4fnfa3dTHz
 3Vmol8YpBxvks4AjsJktKRMbcw2K3KZw0kaMKTcTDIbJtO1JLO2lAhwxiZKILotCRO3Q+7FENwJ7A
 nEA8rA/SxEQu2zGJAHmc6jZNT23NjCcaJXYPaRgnXaBDwh0N4RVx0ImFdda/GUrpJ8b1XWGTWzB8E
 Ej4zzBaw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pwz51-001ciu-2Q; Thu, 11 May 2023 05:43:07 +0000
Date: Thu, 11 May 2023 06:43:07 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: ye.xingchen@zte.com.cn
Subject: Re: [PATCH] dma-buf: Use fdget()
Message-ID: <20230511054307.GK3390869@ZenIV>
References: <202305051018472856954@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305051018472856954@zte.com.cn>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 10:18:47AM +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> convert the fget() use to fdget().

NAK.
