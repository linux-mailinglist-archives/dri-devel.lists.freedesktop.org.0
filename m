Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430A2A4E5A1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 17:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AC310E646;
	Tue,  4 Mar 2025 16:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="f9RGc3Rf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F105910E647
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 16:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FZJncvRlAU5SBAYX1vQ2enRjbM6jVubiJ0n/QmKhBmU=; b=f9RGc3RfzGcoGsmGMUeGU2eI3G
 c2CPso4DPlhpl7VJr8pPYIsP8e0l5qeN+Dn1QF56cI94dW8iSkjwjWIRLDpVr/BiQJhEYvBQ3iLCj
 0+DsrLMVlelE+p1jh3ymjl2VtUokUHqyibB0Tazu6iFBDzG9CkB6YysYnQG9OVQAcjXc2InLaJQ0K
 fkbG2jbYjJIDJtIPDk7Y8/4WC4JrKOO4QlJllbfRd6aHWCEvasWTuwUe9rtZ2Wlkcj2DTWDgQVh6F
 kfFj6nvXDGKVxxE6/G8K11/BK8j4lDYumcScqLN+7zskCdywym1giLoVEeJbBDG3i4FJzyPDxtqEE
 1hvVQchw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tpV1O-00000001rNs-35pX; Tue, 04 Mar 2025 16:22:21 +0000
Date: Tue, 4 Mar 2025 16:21:30 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] fbtft: Remove access to page->index
Message-ID: <Z8coiv3rn8loOltq@casper.infradead.org>
References: <20250221173131.3470667-1-willy@infradead.org>
 <27cc53b9-0db7-451c-9136-5fdcf42145f7@lucifer.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27cc53b9-0db7-451c-9136-5fdcf42145f7@lucifer.local>
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

On Fri, Feb 21, 2025 at 05:53:16PM +0000, Lorenzo Stoakes wrote:
> On Fri, Feb 21, 2025 at 05:31:29PM +0000, Matthew Wilcox (Oracle) wrote:
> > There is no need to print out page->index as part of the debug message.
> >
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> 
> LGTM from my side,
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

This patch is not yet in linux-next; can I expect it to go in soon?
