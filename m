Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2535A506C4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 18:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF7610E81D;
	Wed,  5 Mar 2025 17:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="kUFw1NTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F6A10E81D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 17:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0/5pFhUYG/qRloabUrp96KV5uy7jgbm8O+Ry5t7s1T4=; b=kUFw1NTYDgyfSoerNNJcA28H77
 grP2L7d7Wrw1ojFFqBXLiSTQztpgEGCN73eXG9Mv7FeE1/KuX91SNZ6HP+0o5PYIWmYobJoaWQHQI
 Q0x9flzcKbcM9cRbQCeDkZjGfqPZhUaHjeW5ZrW9eSV9/LxSBxHxODhYwHuiLphLY8EwyZPpWjpp8
 VVcAo/l4OnLUDaBNnNoq/VuGVeXZjFiD/otvKzg6BhnwOCSE9JH9eo8j0goYZ33fyWPiX1fPsDF08
 bDLjh7CvS1qfOTfctPjD8WYYvKC9NI/9JwlIz4ZROPAu7/Da0iX5aivcMoqkmnDLJ6P9gh7nY5Sgk
 InbAHd1w==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tpssM-00000005yAg-1QZ7; Wed, 05 Mar 2025 17:49:46 +0000
Date: Wed, 5 Mar 2025 17:49:46 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] fbtft: Remove access to page->index
Message-ID: <Z8iOuvGKrWa4kEz_@casper.infradead.org>
References: <20250221173131.3470667-1-willy@infradead.org>
 <27cc53b9-0db7-451c-9136-5fdcf42145f7@lucifer.local>
 <Z8coiv3rn8loOltq@casper.infradead.org>
 <Z8f_pcnaC5iJMz-Z@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8f_pcnaC5iJMz-Z@phenom.ffwll.local>
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

On Wed, Mar 05, 2025 at 08:39:17AM +0100, Simona Vetter wrote:
> On Tue, Mar 04, 2025 at 04:21:30PM +0000, Matthew Wilcox wrote:
> > On Fri, Feb 21, 2025 at 05:53:16PM +0000, Lorenzo Stoakes wrote:
> > > On Fri, Feb 21, 2025 at 05:31:29PM +0000, Matthew Wilcox (Oracle) wrote:
> > > > There is no need to print out page->index as part of the debug message.
> > > >
> > > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > > 
> > > LGTM from my side,
> > > 
> > > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > 
> > This patch is not yet in linux-next; can I expect it to go in soon?
> 
> Being both staging and fbdev it's double orphaned, I stuffed it into
> drm-misc-next now, thanks for the ping&patch.

Thanks!
