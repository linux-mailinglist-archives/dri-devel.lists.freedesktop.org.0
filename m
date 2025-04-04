Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04787A7BE22
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 15:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F4910EBC6;
	Fri,  4 Apr 2025 13:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="nxc/J2CW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85F610EBC6;
 Fri,  4 Apr 2025 13:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=F04fAoiUU6AjLlzWFdt7ysNoBBuqOxgrM+jhIAy/Flo=; b=nxc/J2CWif+kzH+Mi9v2mm+JFq
 KbI/r2Su7ao+9XaSdnb0ZNJctCDdQO3WjQIh4eVQv57WFP4O4x159u6LSwFMWlcVOXY71H66xTTBa
 L5Vu2vjfjrPc8uMOk+FKDcLtSv6tZon4G7p/cHTOq3H9HSGHS9bPoTZE9oIlmTFsDnWDad/9tw5hn
 fj20+hr1HGcqU1XpwQ30oEInfjbzuZphm2rvHpHWg6YTukao+/z4JhLO89CMF+0AF5vZZfzFxr3da
 TGtvhPTkWWaNXWDkS57nKdmLlGFipRbhLjEByROQ9ppM6H59X7gMF3qjI12TqQzMRRTCRKVnllZcd
 OKy3CsVw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1u0hJS-0000000FaNj-26N9;
 Fri, 04 Apr 2025 13:42:26 +0000
Date: Fri, 4 Apr 2025 14:42:26 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/9] Remove aops->writepage
Message-ID: <Z-_hwrdVVYCbOA-0@casper.infradead.org>
References: <20250402150005.2309458-1-willy@infradead.org>
 <Z--YzzLSj7B7ltYE@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z--YzzLSj7B7ltYE@infradead.org>
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

On Fri, Apr 04, 2025 at 01:31:11AM -0700, Christoph Hellwig wrote:
> The whole series looks good to me:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks!  And thanks for removing writepage from some filesystems.
