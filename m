Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEF7B0CB98
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 22:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D14F10E3BB;
	Mon, 21 Jul 2025 20:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="T//s4uq+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BEE10E3BB;
 Mon, 21 Jul 2025 20:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=Uzo8U06w7Rz73mhF+wlvGbEWuZuIpHFTo5zQ50j8Qgs=; b=T//s4uq+u4oHSu3GkQ6I4FL35P
 ytpxIyfwtJ6ZJuB9p6aQAT372ogxIWS+nqT7yWMeWq2SHjn6x7zhGywSSEdX521oEa83IJna+jtkz
 Dn4AxYhmskNqvhZQdx4uECBqV0q/VYltTQlAv5gwgfzW/LPH+pkKTVxfUnuz7o+IGO520v+dLzXS9
 bBhaZzbDA9gmMVKFx3kqKjuACbLQf9HJUb2LvkZV2AKgA9+JYpF3+Dowtb2VMgNl9xsqfKj1Wbj7r
 mp39xbWPZKsFpVQ7XAu2mFMCmz2LOQpbajGSe7sJurTJlPWumein2b3YKe/O5R4qlYzKWG3vYtWDW
 g8c3yUsQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1udwx3-00000000bQO-1xwT; Mon, 21 Jul 2025 20:17:33 +0000
Message-ID: <70458c86-597a-4346-b18c-1fbd9a833a55@infradead.org>
Date: Mon, 21 Jul 2025 13:17:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 21 [drivers/gpu/drm/xe/xe.ko]
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 intel-xe@lists.freedesktop.org,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
References: <20250721174126.75106f39@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250721174126.75106f39@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 7/21/25 12:41 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250718:
> 

on ARCH=um SUBARCH=i386, when
# CONFIG_DEBUG_FS is not set

ERROR: modpost: "gt_reset_failure" [drivers/gpu/drm/xe/xe.ko] undefined!

-- 
~Randy

