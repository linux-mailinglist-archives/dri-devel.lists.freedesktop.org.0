Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5F7325EA8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 09:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E62D6EDB4;
	Fri, 26 Feb 2021 08:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFE06EDB4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 08:10:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BADC64DA1;
 Fri, 26 Feb 2021 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614327020;
 bh=TvA7vyiVM0bLyF5Qq7ZBe/zg0912yztcwGaKAYOb5DQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E3/pTLdyC+GnmDDu9XKthk5PkL6vXstIFJRH6B06uXfLdeKk/ynJe4Np/unppkAnx
 MOHcXewAScAzn8XT8gLa/OqgF7xBaCw7Rd14DbsySeOj2AB/3+89zmrj1J5ZbbjUPf
 R4P+EkU0oSMhpGOwG64F0PaRQgzw1F3rThcXIi90=
Date: Fri, 26 Feb 2021 09:10:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4] drm: Use USB controller's DMA mask when importing
 dmabufs
Message-ID: <YDis6iHVzBJs9d+p@kroah.com>
References: <20210224092304.29932-1-tzimmermann@suse.de>
 <ab79a3a7-2659-2dd2-889d-e2356a1b8176@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab79a3a7-2659-2dd2-889d-e2356a1b8176@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, hdegoede@redhat.com, stern@rowland.harvard.edu,
 stable@vger.kernel.org, sean@poorly.run, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 26, 2021 at 08:59:50AM +0100, Thomas Zimmermann wrote:
> Greg, do you have comments on this patch?

I'll defer to Alan's comments so far, I would like to see that
addressed.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
