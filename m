Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB2D388DD8
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 14:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F976ED91;
	Wed, 19 May 2021 12:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078706ED91
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 12:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DZ+/uBpSMB9Hquk+mtUG9wzPieYFcOsJhcqFJZdyx3M=; b=wC1Hw7IltZ2bJsVU22RHxTz5M8
 xkbXKtu0lwXY7OTusOONIL+UHgZLuSwS3T3WihKwwG54+95K5ZgO4CebMTmwhoEnMZdx5TBfaywBS
 ueIMBJjfnfJsKrSabHI9+Zwu3x6mqqnXsRSoCIu96jlK9CA8Yv3prjeycjBM3QV0vD0YrThon7ohC
 3W+0noURDVuH/pnQ2sFH71tgRirGgDaFxaU8b5491qkpUgucjndd86FVtyuSyndyYcIZjVx7MVtjO
 UHhAkhPw8ZFRNAFbZ1WG4yoTGD5/Jw+i6jOeV5ionTWqdTsqFsCVr2FEEAkvCLPoCr89KVEeSZFtN
 jMqOlzeQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1ljL8A-00EvWt-Ia; Wed, 19 May 2021 12:17:19 +0000
Date: Wed, 19 May 2021 13:16:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: songqiang <songqiang@uniontech.com>
Subject: Re: [PATCH] drivers/video/fbdev/core/fbmem.c: add pointer judgment
Message-ID: <YKUBtiOTE7zJHAjI@casper.infradead.org>
References: <20210519120028.7350-1-songqiang@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519120028.7350-1-songqiang@uniontech.com>
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
Cc: jgg@ziepe.ca, linux-fbdev@vger.kernel.org, arnd@arndb.de,
 b.zolnierkie@samsung.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 george.kennedy@oracle.com, tzimmermann@suse.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 08:00:28PM +0800, songqiang wrote:
> Signed-off-by: songqiang <songqiang@uniontech.com>
> ---

You need to explain:

 - Why you think this patch is needed
   - Did you observe a problem at runtime?
   - Is this the output from some checking tool?
 - Why this is the right way to address the problem

