Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EFF4B74AC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 20:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E79A10E52B;
	Tue, 15 Feb 2022 19:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5EA010E526;
 Tue, 15 Feb 2022 19:24:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4835061758;
 Tue, 15 Feb 2022 19:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8127AC340EB;
 Tue, 15 Feb 2022 19:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644953086;
 bh=kUCZYr9eynBGfoyFNpGztKhdR0TjeWfPR20goAdEojo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pgheRwOAKjRlXMfJul10RwEjs5CBKHR/i0QEhyIM79774uc0ovg3u5myvyhB8s/qu
 xkZdoun6Ve/NuXn1+qZDB9F/trYlid+yq9euKiwm3PP7bJ4zoGvDfPTjgfeWCzsH6f
 Z5GtGABFqXnkSAxbAOokUuetZQuukvg8GogLN1PAUilOeXNWgORbaiYjI/aeCr++5W
 YWvZj7f6KVH+xfahOEVmZaopl52rdr1jj6eaQg39ut/UgM8cVQWsEKIq8K1eRZzAAa
 TaPAe7uN1AmbZCmz+9XMV8T/S9ihvGxGOcJfBqdWD8uwk44Sq4S7ITZBKug7wSeC6N
 S7tHpNRHJfaSA==
Date: Tue, 15 Feb 2022 13:32:21 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays with
 flexible-array members
Message-ID: <20220215193221.GA884407@embeddedor>
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor> <Ygv8wY75hNqS7zO6@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ygv8wY75hNqS7zO6@unreal>
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
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 devicetree@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-acpi@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-ext4@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, mpi3mr-linuxdrv.pdl@broadcom.com,
 coresight@lists.linaro.org, sparmaintainer@unisys.com,
 linux-um@lists.infradead.org, greybus-dev@lists.linaro.org,
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org,
 linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
 linux-crypto@vger.kernel.org, linux-alpha@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 09:19:29PM +0200, Leon Romanovsky wrote:
> On Tue, Feb 15, 2022 at 01:21:10PM -0600, Gustavo A. R. Silva wrote:
> > On Tue, Feb 15, 2022 at 10:17:40AM -0800, Kees Cook wrote:
> > > On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> > > 
> > > These all look trivially correct to me. Only two didn't have the end of
> > > the struct visible in the patch, and checking those showed them to be
> > > trailing members as well, so:
> > > 
> > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > 
> > I'll add this to my -next tree.
> 
> I would like to ask you to send mlx5 patch separately to netdev. We are working
> to delete that file completely and prefer to avoid from unnecessary merge conflicts.

Oh OK. Sure thing; I will do so.

Thanks
--
Gustavo
