Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF65078AFE3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 14:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E74E10E080;
	Mon, 28 Aug 2023 12:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091A310E080
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 12:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ve4BHXYYDtHmo8gKLNw/Y51LgqpTIonHiBSys2mOFvE=; b=YPhPLM4VvUMqhydvfSNnt3IVIo
 NF6Vq7yPJcJOISvvC4reeQp3n1ILZOteFy3C8qgXMu4BN5F+3Ea5qT5OQQzKjL5vvxaF+OeuArG4/
 9gcwlmXRv0MRBTaMxcRLKff80PQlGThqLFVyU3UU8e1RtbDQ0Rh7Iy1P7qQiz28L2FawNSPOuin+n
 WmjOTHU6a13xRi2ppuVNSsD4Yv/Px1AQcCDqjtRQlyxj38R2gS711V7U+aQIqdfVf7OjwRA4MrYiY
 QQG/IITuIyF6/xLNZ0cI7vhTTlAe7bcUD/i/7EFI5RN69Qp51h1s9P2mRnYh44ewIkXIDkMgD1kBV
 bYvHDEww==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qabBw-000BZW-FS; Mon, 28 Aug 2023 12:18:00 +0000
Date: Mon, 28 Aug 2023 13:18:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Xueshi Hu <xueshi.hu@smartx.com>
Subject: Re: [PATCH v2] fs: clean up usage of noop_dirty_folio
Message-ID: <ZOyQePmvT6LaJst+@casper.infradead.org>
References: <20230828075449.262510-1-xueshi.hu@smartx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828075449.262510-1-xueshi.hu@smartx.com>
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
Cc: nvdimm@lists.linux.dev, linux-fbdev@vger.kernel.org, linux-aio@kvack.org,
 djwong@kernel.org, linux-cxl@vger.kernel.org, linux-mm@kvack.org,
 adilger.kernel@dilger.ca, dave.jiang@intel.com, miklos@szeredi.hu,
 vishal.l.verma@intel.com, deller@gmx.de, hughd@google.com, hch@infradead.org,
 linux-ext4@vger.kernel.org, jayalk@intworks.biz, viro@zeniv.linux.org.uk,
 dan.j.williams@intel.com, brauner@kernel.org, tytso@mit.edu,
 dri-devel@lists.freedesktop.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, bcrl@kvack.org,
 jack@suse.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 mike.kravetz@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 03:54:49PM +0800, Xueshi Hu wrote:
> In folio_mark_dirty(), it can automatically fallback to
> noop_dirty_folio() if a_ops->dirty_folio is not registered.
> 
> As anon_aops, dev_dax_aops and fb_deferred_io_aops becames empty, remove
> them too.
> 
> Signed-off-by: Xueshi Hu <xueshi.hu@smartx.com>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
