Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365591D9DBF
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 19:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441CD6E086;
	Tue, 19 May 2020 17:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417B96E34E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 17:21:07 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC5E82075F;
 Tue, 19 May 2020 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589908867;
 bh=8PL4dE7cNUfHZehZe/SB0ynNQ453VlS1KvWFttiYciY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cFE3bUrZOdv9Z+xlWsxW5LF+52Q2Nce+X6Lizyolxb8ktkvpNG+DsJG6sG9qXqhgA
 L0GWEtmYJt5eP3wfrBWqNl0hnzHG6iV9MCADiBcCe0+JDiez+HjdoPikVMcWwfV6MC
 9K5wTRbnAFg06tdvMOUJCpB2HjLS6hgpm9cosivI=
Date: Tue, 19 May 2020 19:21:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [RFC PATCH 1/4] gpu: dxgkrnl: core code
Message-ID: <20200519172105.GB1101627@kroah.com>
References: <20200519163234.226513-1-sashal@kernel.org>
 <20200519163234.226513-2-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519163234.226513-2-sashal@kernel.org>
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
Cc: linux-hyperv@vger.kernel.org, sthemmin@microsoft.com,
 tvrtko.ursulin@intel.com, haiyangz@microsoft.com, spronovo@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, wei.liu@kernel.org, linux-fbdev@vger.kernel.org,
 iourit@microsoft.com, alexander.deucher@amd.com, kys@microsoft.com,
 Hawking.Zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 19, 2020 at 12:32:31PM -0400, Sasha Levin wrote:
> +
> +#define DXGK_MAX_LOCK_DEPTH	64
> +#define W_MAX_PATH		260

We already have a max path number, why use a different one?

> +#define d3dkmt_handle		u32
> +#define d3dgpu_virtual_address	u64
> +#define winwchar		u16
> +#define winhandle		u64
> +#define ntstatus		int
> +#define winbool			u32
> +#define d3dgpu_size_t		u64

These are all ripe for a simple search/replace in your editor before you
do your next version :)

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
