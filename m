Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8303355A1D5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F5910EE36;
	Fri, 24 Jun 2022 19:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FE710EE36
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=A4n9ba7gyYN0ABBJdpczHxClWSBwCm9MMirtNxhj2WU=;
 b=R9Y2jlAk1Wp5xI2i2TqgQzLCxj3Yq0LiZzMzlL4KeO9v50KVdVc4hnUDjWH/aRtfMvF2pd58pbKc/
 4ldz4GqrXH4S0ecAc2EpSk5xqu34DJOxrplzomu1ORNpve5IV8LVc3J6YeH07xDPn/monxf7uor0m+
 qHyDY3tDVa/LjevkbB00756jp4DBgAWJLLEs/8uhCO96x60F7P5eSex+aQ1wt6WpYDlItkOimzI+GW
 /3E8IyREMKeMP06ki4imgorXjLWvzzzkn/U83im+qDGXk2QxULjoYzBViDkDbmEtv43d8S51YyaC+4
 626cbumYYQW6F0zJE2jmXH1L/RwWAwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=A4n9ba7gyYN0ABBJdpczHxClWSBwCm9MMirtNxhj2WU=;
 b=AfDBD7rTyxaVWlgoQzctGeKhhWt3nG2W7zFA2T+Dbh8TTlp0WMTnBybf4IeJ5eQBmlxpfNSi1QuGJ
 thAUofcAw==
X-HalOne-Cookie: 9abaa5ec99b59a2d1b4f7e25fad83e18db6c9fa8
X-HalOne-ID: 7f429d1d-f3f4-11ec-a916-d0431ea8a290
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 7f429d1d-f3f4-11ec-a916-d0431ea8a290;
 Fri, 24 Jun 2022 19:33:17 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:33:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jiang Jian <jiangjian@cdjrlc.com>
Subject: Re: [PATCH] drm/pl111: drop unexpected word "the" in the comments
Message-ID: <YrYRfAxsZtlBk0I6@ravnborg.org>
References: <20220621133107.3752-1-jiangjian@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621133107.3752-1-jiangjian@cdjrlc.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, emma@anholt.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 21, 2022 at 09:31:07PM +0800, Jiang Jian wrote:
> there is an unexpected word "the" in the comments that need to be dropped
> 
> file: drivers/gpu/drm/pl111/pl111_display.c
> line: 251
> * Note that the the ARM hardware's format reader takes 'r' from
> changed to
> * Note that the the ARM hardware's format reader takes 'r' from
> 
> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>

Thanks, applied to drm-misc (drm-misc-next)

	Sam
